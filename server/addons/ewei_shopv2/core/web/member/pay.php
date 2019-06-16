<?php
if (!(defined('IN_IA'))) 
{
	exit('Access Denied');
}
class Pay_EweiShopV2Page extends WebPage 
{
	public function main() 
	{
		global $_W;
		global $_GPC;
		$set = m('common')->getSysset();
		$shopset = $set['shop'];
		$printset = $set['printer'];
		if (!(cv('member.pay'))) 
		{
			$this->message('你没有相应的权限操作');
		}
		$payments = m('shop')->payments();
		if ($_W['ispost']) 
		{
			$id = intval($_GPC['id']);
			$payment = trim($_GPC['payment']);
			$profile = m('member')->getMember($id);
			$num = floatval($_GPC['num']);
			if (!$profile)
			{
				show_json(0, array('message' => '没有找到会员数据'));
			}
			if ($profile['credit2'] < $num)
			{
				show_json(0, array('message' => '所剩余额小于扣款数额'));
			}
			if ($num <= 0) 
			{
				show_json(0, array('message' => '请填写大于0的数字!'));
			}
			$num = (-1)*$num;
			$remark = trim($_GPC['remark']);
			m('member')->setCredit($profile['openid'], 'credit2', $num, array($_W['uid'], '储值消费扣款' . ' ' . $remark));
			
			// 扣除会员旧余额
			if ($profile['old_credit2'] > 0)
			{
				$old_credit2 = $profile['old_credit2'] > abs($num) ? $profile['old_credit2'] - abs($num) : 0; 
				pdo_update('ewei_shop_member', array('old_credit2' => $old_credit2), array('id' => $id));
			}
			
			$set = m('common')->getSysset('shop');
			$logno = m('common')->createNO('member_log', 'logno', 'RC');
			$data = array(
				'openid' => $profile['openid'], 
				'logno' => $logno, 
				'uniacid' => $_W['uniacid'], 
				'type' => '0', 
				'createtime' => TIMESTAMP, 
				'status' => '1', 
				'title' => '储值消费扣款', 
				'money' => $num, 
				'remark' => $remark, 
				'rechargetype' => 'system', 
				'payment'=>$payment);
			pdo_insert('ewei_shop_member_log', $data);
			$logid = pdo_insertid();
			$log = pdo_fetch('select * from '. tablename('ewei_shop_member_log') .' where id = ' . $logid);
			
			$other = array('other_id' => $logid, 'remark' => '储值消费扣款' . $typestr);
			m('member')->accountRecord($profile['id'], $num, 7, $other);
			m('notice')->sendMemberLogMessage($logid, 0, true);
			if (intval($profile['old_credit2']) == 0)
			{
				$this->commission($log);
			}

			plog('finance.pay.' . $type, '储值消费扣款' . $typestr . ': ' . $_GPC['num'] . ' <br/>会员信息: ID: ' . $profile['id'] . ' /  ' . $profile['openid'] . '/' . $profile['nickname'] . '/' . $profile['realname'] . '/' . $profile['mobile']);
			if ($printset['printer_pay'])
			{
				$url = webUrl('member/pay/printer', array('logid' => $logid));
			}
			else
			{
				$url = webUrl('member/pay');
			}
			
			show_json(1, array('url' => $url));
		}
		include $this->template();
	}
	
	public function printer()
	{
		global $_GPC;
		$set = m('common')->getSysset();
		$shopset = $set['shop'];
		$printset = $set['printer'];
		$logid = intval($_GPC['logid']);
		if (!$logid)
		{
			$this->message('没有找到打印数据1');
		}
		$log = pdo_fetch('select * from '. tablename('ewei_shop_member_log') .' where id = ' . $logid);
		if (!$log)
		{
			$this->message('没有找到打印数据2');
		}
		$log['createtime'] = date('Y-m-d H:i', $log['createtime']);
		$log['money'] = abs($log['money']);
		$member = m('member')->getMember($log['openid'], 'mobile, realname, id, credit2');
		include $this->template();
	}
	
	public function commission($log = array())
	{
		global $_W, $_GPC;		
		$log = pdo_fetch('select * from '. tablename('ewei_shop_member_log') .' where id = ' . $log['id']);
		if (!p('commission') || empty($log) || $log['is_commission'])
		{
			return;
		}
		$openid = $log['openid'];
		$com_set = m('common')->getPluginSet('commission');
		$member = m('member')->getMember($openid, 'status, isagent, id, agentid, nickname, realname');
		if ($com_set['mempay_com'])
		{
			// 开始返佣
			if ($com_set['selfbuy'])
			{
				$agentid = $member['id'];
			}
			else
			{
				$agentid = $member['agentid'];
			}
			$parents = p('commission')->get_parents($agentid);
			if (is_array($parents))
			{
				foreach($parents as $k => $p)
				{
					if ($p['level'] > 0)
					{
						$per = p('commission')->getLevelColumn($p['level'], 'commission' . ($k+1));
					}
					else
					{
						$per = $com_set['commission' . ($k+1)];
					}
					$commission = round(abs($log['money']) * $per / 100, 2);
					if ($commission > 0 && $p['isagent'] && $p['status'])
					{
						if ($member['id'] == $p['id'])
						{
							$title = '本人消费返佣';
						}
						else
						{
							$title = '下级(ID:'. $member['id'] .')' . m('member')->getMemName($member['id']) . '消费返佣';
						}
						
						m('member')->setCredit($p['openid'], 'credit2', $commission, array($_W['uid'], $title));
						$other = array('remark' => $title);
						m('member')->accountRecord($p['id'], $commission, 3, $other);
						
						// 生成自动提现程序
						$applyno = m('common')->createNO('commission_apply', 'applyno', 'CA');
						$apply['uniacid'] = $_W['uniacid'];
						$apply['applyno'] = $applyno;
						$apply['mid'] = $p['id'];
						$apply['commission'] = $commission;
						$apply['type'] = 0;
						$apply['status'] = 3;
						$apply['applytime'] = time();
						$apply['realmoney'] = $commission;
						$apply['paytime'] = time();
						pdo_insert('ewei_shop_commission_apply', $apply);
					}
						
				}
			}
			pdo_update('ewei_shop_member_log', array('is_commission' => 1), array('id' => $log['id']));
			// 分销结束
			
			// 成为分销商	
			if (!$member['isagent'] || !$member['status'])
			{
				p('commission')->checkAgent($openid);
			}
			
		}
	}

}
?>
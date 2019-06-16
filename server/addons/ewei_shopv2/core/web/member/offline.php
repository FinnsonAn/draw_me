<?php
if (!(defined('IN_IA'))) 
{
	exit('Access Denied');
}
class Offline_EweiShopV2Page extends WebPage 
{
	public function main() 
	{
		global $_W;
		global $_GPC;
		$set = m('common')->getSysset();
		$shopset = $set['shop'];
		$printset = $set['printer'];
		if (!(cv('member.offline'))) 
		{
			$this->message('你没有相应的权限操作');
		}
		$payments = m('shop')->payments();
		if ($_GPC['num']) 
		{
			$id = intval($_GPC['id']);
			$profile = m('member')->getMember($id);
			$num = floatval($_GPC['num']);
			$payment = trim($_GPC['payment']);
			if (!$profile)
			{
				show_json(0, array('message' => '没有找到会员数据'));
			}
			if ($num <= 0) 
			{
				show_json(0, array('message' => '请填写大于0的数字!'));
			}
			$remark = trim($_GPC['remark']);
			
			$set = m('common')->getSysset('shop');
			$logno = m('common')->createNO('member_log', 'logno', 'RC');
			$data = array(
				'openid' => $profile['openid'], 
				'logno' => $logno, 
				'uniacid' => $_W['uniacid'], 
				'createtime' => TIMESTAMP, 
				'status' => 1, 
				'title' => '线下消费', 
				'money' => $num, 
				'remark' => $remark, 
				'payment'=>$payment);
			pdo_insert('ewei_shop_member_offline', $data);
			$logid = pdo_insertid();
			$data['id'] = $logid;
			$this->commission($data);

			plog('member.offline.' . $type, '线下消费' . $typestr . ': ' . $_GPC['num'] . ' <br/>会员信息: ID: ' . $profile['id'] . ' /  ' . $profile['openid'] . '/' . $profile['nickname'] . '/' . $profile['realname'] . '/' . $profile['mobile']);
			if ($printset['printer_offline'])
			{
				$url = webUrl('member/offline/printer', array('logid' => $logid));
			}
			else
			{
				$url = webUrl('member/offline');
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
		$log = pdo_fetch('select * from '. tablename('ewei_shop_member_offline') .' where id = ' . $logid);
		$comm_data = json_decode($log['commission'], true);
		
		if (!$log)
		{
			$this->message('没有找到打印数据2');
		}
		$log['createtime'] = date('Y-m-d H:i', $log['createtime']);
		$log['money'] = abs($log['money']);
		$member = m('member')->getMember($log['openid'], 'mobile, realname, id, credit2');
		$member['credit2'] = priceFormat1($member['credit2'], 2);
		include $this->template();
	}
	
	public function commission($log = array())
	{
		global $_W, $_GPC;		
		$log = pdo_fetch('select * from '. tablename('ewei_shop_member_offline') .' where id = ' . $log['id']);
		if (!p('commission') || !$log['status'] || $log['is_commission'])
		{
			return;
		}
		$openid = $log['openid'];
		$com_set = m('common')->getPluginSet('commission');
		$member = m('member')->getMember($openid, 'status, isagent, id, agentid, nickname, realname');
		if ($com_set['offlinePay_com'])
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
			$comm_arr = array();
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

						$comm_arr[$k] = $commission; 
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
			$comm_data = json_encode($comm_arr);
			pdo_update('ewei_shop_member_offline', array('is_commission' => 1, 'commission' => $comm_data), array('id' => $log['id']));
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
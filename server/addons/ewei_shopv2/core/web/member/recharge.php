<?php
if (!(defined('IN_IA'))) 
{
	exit('Access Denied');
}
class Recharge_EweiShopV2Page extends WebPage 
{
	public function main() 
	{
		global $_W;
		global $_GPC;
		$set = m('common')->getSysset();
		$printset = $set['printer'];
		$shopset = $set['shop'];
		if (!(cv('member.recharge'))) 
		{
			$this->message('你没有相应的权限操作');
		}
		$payments = m('shop')->payments();
		if ($_W['ispost']) 
		{
			$id = intval($_GPC['id']);
			$payment = trim($_GPC['payment']);
			$profile = m('member')->getMember($id);
			if (!$profile)
			{
				show_json(0, array('message' => '没有找到会员数据'));
			}
			$num = floatval($_GPC['num']);
			$remark = trim($_GPC['remark']);
			if ($num <= 0) 
			{
				show_json(0, array('message' => '请填写大于0的数字!'));
			}
			m('member')->setCredit($profile['openid'], 'credit2', $num, array($_W['uid'], '会员充值余额' . ' ' . $remark));
		
			$set = m('common')->getSysset('shop');
			$logno = m('common')->createNO('member_log', 'logno', 'RC');
			$data = array('openid' => $profile['openid'], 'logno' => $logno, 'uniacid' => $_W['uniacid'], 'type' => '0', 'createtime' => TIMESTAMP, 'status' => '1', 'title' => '会员充值', 'money' => $num, 'remark' => $remark, 'rechargetype' => 'system', 'payment'=>$payment);
			pdo_insert('ewei_shop_member_log', $data);
			$logid = pdo_insertid();
			$log = pdo_fetch('select * from '. tablename('ewei_shop_member_log') .' where id = ' . $logid);
			$other = array('other_id' => $logid, 'remark' => '会员充值余额');
			m('member')->accountRecord($profile['id'], $num, 1, $other);
			com_run('sale::setRechargeActivity', $log);
			com_run('coupon::useRechargeCoupon', $log);
			m('notice')->sendMemberLogMessage($logid, 0, true);

			plog('finance.recharge.' . $type, '充值' . $typestr . ': ' . $_GPC['num'] . ' <br/>会员信息: ID: ' . $profile['id'] . ' /  ' . $profile['openid'] . '/' . $profile['nickname'] . '/' . $profile['realname'] . '/' . $profile['mobile']);
			
			if ($printset['printer_recharge'])
			{
				$url = webUrl('member/recharge/printer', array('logid' => $logid));
			}
			else
			{
				$url = webUrl('member/recharge');
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

}
?>
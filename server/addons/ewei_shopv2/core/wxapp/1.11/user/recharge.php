<?php
if (!defined('IN_IA')) {
	exit('Access Denied');
}
global $_GPC, $_W;
$op = $_GPC['op'];
$res = array();
/* 检测登录状态 */
if (m('account')->checkWxappLogin())
{
	$this->result(1, '获取用户信息失败');
}
$openid = m('member')->getOpenid();
$member = m('member')->getMember($openid, 'avatar, nickname, realname, id, credit2, openid_xcx');
$set = m('common')->getSysset('shop');
$uniacid = $_W['uniacid'];

/* 充值界面 */
if ($op == 'main')
{	
	$set['pay']['weixin'] = ((!(empty($set['pay']['weixin_sub'])) ? 1 : $set['pay']['weixin']));
	$set['pay']['weixin_jie'] = ((!(empty($set['pay']['weixin_jie_sub'])) ? 1 : $set['pay']['weixin_jie']));
	$sec = m('common')->getSec();
	$sec = iunserializer($sec['sec']);
	$status = 1;

	if (!(empty($set['trade']['closerecharge']))) {
		$this->result(1, '系统未开启充值!');
	}


	if (empty($set['trade']['minimumcharge'])) {
		$minimumcharge = 0;
	}
	 else {
		$minimumcharge = $set['trade']['minimumcharge'];
	}
	$member['credit2'] = priceFormat1($member['credit2'], 2);
	if (!empty($set['recharge_bg']))
	{
		$res['recharge_bg'] = tomedia($set['recharge_bg']);
	}
	$res['member'] = $member;
}

/* 充值 */
elseif ($op == 'pay')
{
	
	if (empty($set['trade']['minimumcharge'])) {
		$minimumcharge = 0;
	}
	 else {
		$minimumcharge = $set['trade']['minimumcharge'];
	}

	$money = floatval($_GPC['money']);

	if ($money <= 0) {
		$this->result(1, '充值金额必须大于0!');
	}


	if (($money < $minimumcharge) && (0 < $minimumcharge)) {
		$this->result(1, '最低充值金额为' . $minimumcharge . '元!');
	}


	if (empty($money)) {
		$this->result(1, '请填写充值金额!');
	}


	pdo_delete('ewei_shop_member_log', array('openid' => $_W['openid'], 'status' => 0, 'type' => 0, 'uniacid' => $_W['uniacid']));
	$logno = m('common')->createNO('member_log', 'logno', 'RC');
	$log = array('uniacid' => $_W['uniacid'], 'logno' => $logno, 'title' => $set['shop']['name'] . '会员充值', 'openid' => $_W['openid'], 'money' => $money, 'type' => 0, 'createtime' => time(), 'status' => 0, 'couponid' => intval($_GPC['couponid']));
	pdo_insert('ewei_shop_member_log', $log);
	$logid = pdo_insertid();
	$type = $_GPC['payment'];
	$set = m('common')->getSysset(array('shop', 'pay', 'trade'));
	
	if ($type == 'wechat') {
		if (!(is_weixin())) {
			$this->result(1, '非微信环境!');
		}

		if (empty($set['pay']['weixin'])) {
			$this->result(1, '未开启微信支付!');
		}
		$wechat = array('success' => false);
		
		/*支付参数 */
		$params = array();
		$params['tid'] = $logid;
		$params['openid'] = $member['openid_xcx'];
		$params['fee'] = $money;
		$params['title'] = $log['title'];
		load()->model('payment');

		$wxapp_set = m('common')->getSysset('wxapp');
			
		// 微信支付参数
		$options = pdo_fetch('select * from '. tablename('ewei_shop_payment') . 
						' where uniacid = '. $uniacid .' and type = 0');		
		if ($wxapp_set['AppId'] && $wxapp_set['AppSecret'] && is_array($options)) {
			$options['secret'] = $wxapp_set['AppSecret'];	
			$wechat = m('common')->wechat_build($params, $options, 1);
			if (!is_error($wechat)) {
				$wechat['success'] = true;
			}
			 else {
				$this->result(1, $wechat['message']);
			}
		}
		else{
			$this->result(1, '微信支付参数错误!');
		}

			
		if (!($wechat['success'])) {
			$this->result(1, '微信支付参数错误!');
		}

		$res = array('payinfo' => $wechat, 'logid' => $logid);
	}

}

elseif ($op == 'complete')
{
	$logid = intval($_GPC['logid']);
	$log = pdo_fetch('SELECT * FROM ' . tablename('ewei_shop_member_log') . ' WHERE `id`=:id and `uniacid`=:uniacid limit 1', 
			array(':uniacid' => $_W['uniacid'], ':id' => $logid));

	if (empty($log)) {
		$logno = intval($_GPC['logno']);
		$log = pdo_fetch('SELECT * FROM ' . tablename('ewei_shop_member_log') . ' WHERE `logno`=:logno and `uniacid`=:uniacid limit 1', 
			array(':uniacid' => $_W['uniacid'], ':logno' => $logno));
	}


	$res['log'] = $log;
}

/* 充值记录 */
elseif ($op == 'log')
{
	$type = intval($_GPC['type']);
	$pindex = max(1, intval($_GPC['page']));
	$psize = 10;
	$apply_type = array(0 => '微信钱包', 2 => '支付宝', 3 => '银行卡');
	$condition = ' and openid=:openid and uniacid=:uniacid and type=:type and status = 1 ';
	$params = array(':uniacid' => $_W['uniacid'], ':openid' => $_W['openid'], ':type' => intval($_GPC['type']));
	$list = pdo_fetchall('select * from ' . tablename('ewei_shop_member_log') . ' where 1 ' . $condition . ' order by createtime desc LIMIT ' . (($pindex - 1) * $psize) . ',' . $psize, $params);
	$total = pdo_fetchcolumn('select count(*) from ' . tablename('ewei_shop_member_log') . ' where 1 ' . $condition, $params);
	foreach ($list as &$row ) 
	{
		$row['createtime'] = date('Y-m-d H:i', $row['createtime']);
		$row['typestr'] = $apply_type[$row['applytype']];
	}
	unset($row);
	$res = array('page' => $pindex, 'list' => $list);
}

$this->result(0, '', $res);
?>
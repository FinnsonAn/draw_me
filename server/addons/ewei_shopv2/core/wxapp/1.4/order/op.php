<?php
if (!defined('IN_IA')) {
	exit('Access Denied');
}
global $_GPC, $_W;
$op = $_GPC['op'];
$res = array();
$openid = m('member')->getOpenid();


/* 检测登录状态 */
if (m('account')->checkWxappLogin())
{
	$this->result(1, '请先登录');
}
// 初始化变量
$uniacid = $_W['uniacid'];

$orderid = intval($_GPC['id']);
if (!$orderid)
{
	$this->result(1, '订单id为空');
}

/* 取消 */
if ($op == 'cancel')
{
	$column = 'id,ordersn,openid,status,deductcredit,deductprice,deductcredit2,couponid';	
	$order = pdo_fetch('select '. $column .' from ' . tablename('ewei_shop_order') . 
			' where id=:id and uniacid=:uniacid and openid=:openid limit 1', 
			array(':id' => $orderid, ':uniacid' => $uniacid, ':openid' => $openid));

	if (empty($order)) {
		$this->result(1, '订单未找到!');
	}

	if ($order['status'] != 0) {
		$this->result(1, '订单已支付，不能取消!');
	}
	m('order')->operate($order, 'cancel');
}

/* 收货 */
elseif ($op == 'receive')
{
	$order = pdo_fetch('select * from ' . tablename('ewei_shop_order') . 
				' where id=:id and uniacid=:uniacid and openid=:openid limit 1', 
				array(':id' => $orderid, ':uniacid' => $uniacid, ':openid' => $openid));

	if (empty($order)) {
		$this->result(1, '订单未找到!');
	}

	if ($order['status'] != 2) {
		$this->result(1, '订单未发货，不能确认收货!');
	}
	if ((0 < $order['refundstate']) && !empty($order['refundid'])) {
		$change_refund = array();
		$change_refund['status'] = -2;
		$change_refund['refundtime'] = time();
		pdo_update('ewei_shop_order_refund', $change_refund, array('id' => $order['refundid'], 'uniacid' => $uniacid));
	}
	m('order')->operate($order, 'finish');
}

/* 删除 */
else if ($op == 'remove') {
	$order = pdo_fetch('select id,status,refundstate,refundid from ' . tablename('ewei_shop_order') . 
				' where id=:id and uniacid=:uniacid and openid=:openid limit 1', 
				array(':id' => $orderid, ':uniacid' => $uniacid, ':openid' => $openid));

	if (empty($order)) {
		$this->result(1, '订单未找到!');
	}

	if (($order['status'] != 3) && ($order['status'] != -1)) {
		$this->result(1, '订单无交易，不能删除!');
	}

	if ((0 < $order['refundstate']) && !empty($order['refundid'])) {
		$change_refund = array();
		$change_refund['status'] = -2;
		$change_refund['refundtime'] = time();
		pdo_update('ewei_shop_order_refund', $change_refund, array('id' => $order['refundid'], 'uniacid' => $uniacid));
	}

	pdo_update('ewei_shop_order', array('userdeleted' => 1, 'refundstate' => 0), array('id' => $order['id'], 'uniacid' => $uniacid));
}



$this->result(0, '', $res);

?>
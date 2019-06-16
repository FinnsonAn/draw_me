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
$member = m('member')->getMember($openid, 'id');

/* 画师检测 */
$authorid = p('case')->checkAuthor($member['id']);
if (!$authorid)
{
	$this->result(1, '您不是画师，没有权限访问');
}

// 初始化变量
$uniacid = $_W['uniacid'];
$orderid = intval($_GPC['id']);
if (!$orderid)
{
	$this->result(1, '订单id为空');
}
$column = 'id,ordersn,openid,status, author';	
$order = pdo_fetch('select '. $column .' from ' . tablename('ewei_shop_order') . 
		' where id=:id and uniacid=:uniacid and author=:author limit 1', 
		array(':id' => $orderid, ':uniacid' => $uniacid, ':author' => $authorid));

if ($authorid != $order['author'])
{
	$this->result(1, '该订单您不能操作');
}
		
/* 上传作品 */
if ($op == 'send')
{
	
	if (empty($order)) {
		$this->result(1, '订单未找到!');
	}

	if ($order['status'] != 1 &&  $order['status'] != 2) {
		$this->result(1, '订单不处于发货状态!');
	}
	
	$data = array(
		'status'      => 2,
		'sendtime'    => time(),
		'upload_case_time' => time());
	pdo_update('ewei_shop_order', $data, array('id' => $orderid));
}

elseif ($op == 'cancel')
{
	if (empty($order)) {
		$this->result(1, '订单未找到!');
	}

	if ($order['status'] != 1 &&  $order['status'] != 2) {
		$this->result(1, '订单不处于发货状态!');
	}
	
	$data = array(
		'upload_case' => '',
		'status'    => 1,
		'sendtime'  => 0,
		'upload_case_time' => 0);
	pdo_update('ewei_shop_order', $data, array('id' => $orderid));

}

$this->result(0, '', $res);

?>
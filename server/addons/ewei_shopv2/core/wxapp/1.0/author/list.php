<?php
if (!defined('IN_IA')) {
	exit('Access Denied');
}
global $_GPC, $_W;
$op = $_GPC['op'];
$res = array();
$openid = m('member')->getOpenid();
/* 检测登录状态 */
if (empty($openid))
{
	$this->result(1, '您的用户信息有误');
}
$member = m('member')->getMember($openid, 'id');

/* 画师检测 */
$authorid = p('case')->checkAuthor($member['id']);
if (!$authorid)
{
	$this->result(1, '您不是画师，没有权限登陆');
}

$uniacid = $_W['uniacid'];
if ($op == 'main')
{
	$orderlist = array();
	$pindex = max(1, intval($_GPC['page']));
	$psize = 5;
	$status = $_GPC['status'];
	if (empty($status))
	{
		$status = 1;
	}
	$condition = ' and deleted=0 and uniacid = :uniacid and author =  ' . $authorid;
	$params = array(':uniacid' => $uniacid);

	if ($status == 1)
	{
		$condition .= ' and status = 1';
	}
	else
	{
		$condition .= ' and status >= 2';
	}
	$list = pdo_fetchall('select * from ' . tablename('ewei_shop_order') . ' where 1 ' . $condition . 
			' order by createtime desc LIMIT ' . (($pindex - 1) * $psize) . ',' . $psize, $params);
	$total = pdo_fetchcolumn('select count(*) from ' . tablename('ewei_shop_order') . 
			' where 1 ' . $condition, $params);
	$tradeset = m('common')->getSysset('trade');
	
	foreach ($list as $row ) 
	{
		$order = array();
		$order['id'] = $row['id'];
		$order['ordersn'] = $row['ordersn'];
		$order['status'] = $row['status'];
		$order['price'] = $row['price'];
		$order['goods'] = m('order')->getOrderGoods($row['id']);
		$order['goodscount'] = count($row['goods']);
		$order['createtime'] = date('Y-m-d H:i', $row['createtime']);
		$order['statusstr'] = m('order')->orderStatus($row);
		$pay = m('shop')->getPaymentByIndex($row['paytype']);
		$order['paytype'] = $pay['name'];

		$orderlist[] = $order;
	}
	unset($row);
	$res['list'] = $orderlist;
	$res['page'] = $pindex;
}

$this->result(0, '', $res);

?>
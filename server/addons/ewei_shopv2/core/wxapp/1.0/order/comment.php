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

$uniacid = $_W['uniacid'];
$merch_plugin = p('merch');
$shopset = m('common')->getSysset('shop');
$tradeset = m('common')->getSysset('trade');

if ($op == 'main'){
	$orderid = intval($_GPC['id']);
	if (!$orderid)
	{
		$this->result(1, '参数错误');
	}
	$order = pdo_fetch('select status, iscomment, upload_case from ' . tablename('ewei_shop_order') . 
			' where id = :id and uniacid = :uniacid and openid = :openid AND userdeleted = 0 limit 1',
			array(':id' => $orderid, ':uniacid' => $uniacid, ':openid' => $openid));
	if (!$order)	
	{
		$this->result(1, '没有找到相关订单');
	}	
	
	if ($tradeset['closecomment'] == 1)
	{
		$this->result(1, '评论功能被关闭');
	}
	
	if ($order['status'] < 2)
	{
		$this->result(1, '还没有作品创作出来哦');
	}
	if (!empty($order['upload_case']))
	{
		$order['uploads'] = iunserializer($order['upload_case']);
		$order['uploads'] = set_medias($order['uploads']);
	}
	else
	{
		$order['uploads'] = array();
	}
	
	$goods = pdo_fetch('select * from '. tablename('ewei_shop_order_goods') .' where orderid = ' . $orderid);
	$goodsid = $goods['goodsid'];

	$res['goodsid'] = $goodsid;
	$res['order'] = $order;
	
}
elseif ($op == 'submit')
{
	$orderid = intval($_GPC['id']);
	$order = pdo_fetch('select id,status,iscomment,upload_case from ' . tablename('ewei_shop_order') . ' where id=:id and uniacid=:uniacid and openid=:openid limit 1', array(':id' => $orderid, ':uniacid' => $uniacid, ':openid' => $openid));
	if (empty($order)) 
	{
		$this->result(1, '订单未找到');
	}
	if ($tradeset['closecomment'] == 1)
	{
		$this->result(1, '评论功能被关闭');
	}
	
	if ($order['status'] < 2)
	{
		$this->result(1, '此订单还不能评论');
	}
	$member = m('member')->getMember($openid, 'nickname, avatar');
	$goods = pdo_fetch('select * from '. tablename('ewei_shop_order_goods') .' where orderid = ' . $orderid);
	
	if (!(empty($tradeset['commentchecked']))) 
	{
		$checked = 0;
	}
	else 
	{
		$checked = 1;
	}
	
	$comment = array(
		'uniacid' => $uniacid, 
		'orderid' => $orderid, 
		'goodsid' => $goods['goodsid'], 
		'level'   => intval($_GPC['level']), 
		'content' =>$_GPC['comment'], 
		'openid'  => $openid, 
		'images'     => $order['upload_case'],
		'nickname'   => $member['nickname'], 
		'headimgurl' => $member['avatar'], 
		'createtime' => time(), 
		'checked'    => $checked);
	pdo_insert('ewei_shop_order_comment', $comment);	
	pdo_update('ewei_shop_order', array('iscomment' => 1, 'status' => 3), array('id' => $orderid, 'uniacid' => $uniacid));	
}

$this->result(0, '', $res);
?>
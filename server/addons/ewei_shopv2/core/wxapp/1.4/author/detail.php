<?php
if (!defined('IN_IA')) {
	exit('Access Denied');
}
global $_GPC, $_W;
$op = $_GPC['op'];
$res = array();
$openid = m('member')->getOpenid();
$uniacid = $_W['uniacid'];

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

if ($op == 'main')
{
	$author = array();
	$orderid = intval($_GPC['id']);
	if (!$orderid)
	{
		$this->result(1, '参数错误');
	}
	$order = pdo_fetch('select * from ' . tablename('ewei_shop_order') . 
			' where id = :id and uniacid = :uniacid and author = :author AND userdeleted = 0 limit 1',
			array(':id' => $orderid, ':uniacid' => $uniacid, ':author' => $authorid));
	if (!$order)	
	{
		$this->result(1, '没有找到相关订单');
	}	
	$order['goods'] = m('order')->getOrderGoods($order['id']);
	$order['total'] = m('order')->countOrderGoods($order['id']);
	$order['virtual_str'] = str_replace("\n", '<br/>', $order['virtual_str']);
	$order['goodstotal'] = count($goods);
	$order['finishtimevalue'] = $order['finishtime'];
	if ($order['finishtime'] > 0)
	{
		$order['finishtime_format'] = date('Y-m-d H:i:s', $order['finishtime']);
	}
	if ($order['sendtime'] > 0)
	{
		$order['sendtime_format'] = date('Y-m-d H:i:s', $order['sendtime']);
	}
	if ($order['paytime'] > 0)
	{
		$order['paytime_format'] = date('Y-m-d H:i:s', $order['paytime']);
	}
	
	$order['createtime_format'] = date('Y-m-d H:i:s', $order['createtime']);
	$order['reservetime_format'] = date('Y-m-d H:i', $order['reservetime']);
	
	// 照片与画师
	$order['pictype_str'] = $order['pictype'] == 2 ? '拼一起' : '合照';
	if ($order['author'] > 0 && p('case'))
	{
		$author = p('case')->getAuthor($order['author'], 'id, name, mobile, mid');
		if ($author['mid'] > 0)
		{
			$author['wechat'] = m('member')->getMember($author['mid'], 'avatar, nickname');
		}
	}
	if (!empty($order['user_pic']))
	{
		$order['upics'] = iunserializer($order['user_pic']);
		$order['upics'] = set_medias($order['upics']);
	}
	if (!empty($order['upload_case']))
	{
		$order['uploads'] = iunserializer($order['upload_case']);
		$order['uploads'] = set_medias($order['uploads']);
	}
	if ($order['upload_case_time'] > 0)
	{
		$order['upload_time_fm'] = date('Y-m-d H:i:s', $order['upload_case_time']);
	}
	if (!empty($order['diyformdata']))
	{
		$diyformdata = unserialize($order['diyformdata']);
		if (is_array($diyformdata))
		{
			foreach($diyformdata as $k=>$v)
			{
				$order[$k] = $v;
			}
		}
	}
	$order['statusstr'] = m('order')->orderStatus($order);
	$order['op'] = m('order')->orderOperator($order);
	$pay = m('shop')->getPaymentByIndex($order['paytype']);
	$order['paytype'] = $pay['name'];
	$orderQr = m('qrcode')->createOrdersnQrcode($order['ordersn']);
	$order['qr'] = $orderQr;
	$res['order'] = $order;
	$res['author'] = $author;
}

$this->result(0, '', $res);

?>

<?php
if (!defined('IN_IA')) {
	exit('Access Denied');
}
global $_GPC, $_W;
$op = $_GPC['op'];
$uniacid = $_W['uniacid'];
$res = array();

/* 评论上传 */
if ($op == 'comment')
{
	$openid = $_W['openid'];
	if (!$openid)
	{
		$this->result(1, '请先登录');
	}
	$orderid = intval($_GPC['orderid']);
	$goodsid = intval($_GPC['goodsid']);
	$order = pdo_fetch('select id,status,iscomment from ' . tablename('ewei_shop_order') . ' where id=:id and uniacid=:uniacid and openid=:openid limit 1', array(':id' => $orderid, ':uniacid' => $uniacid, ':openid' => $openid));
	if (!$order)
	{
		$this->result(1, '没有找到订单数据');
	}
	if (!$order['iscomment'])
	{
		$this->result(1, '参数错误');
	}
	if (!$orderid || !$goodsid)
	{
		$this->result(1, '参数错误');
	}
	$pic  = (isset($_FILES['pic']['error']) && $_FILES['pic']['error'] == 0) || (!isset($_FILES['pic']['error']) && isset($_FILES['pic']['tmp_name']) && $_FILES['pic']['tmp_name'] != 'none') ? $_FILES['pic'] : '';
	logging_run('上传');
	if ($_FILES['pic']['tmp_name'] != '')
	{
		$pic_res = file_wechat_upload($_FILES['pic'], 'image');
		if ($pic_res['success'] != true)
		{
			$this->result(1, '上传失败');  
		}
		else
		{
			$data['pic'] = $pic_res['path'];
		}
	}
	
	if (!empty($data['pic']))
	{
		$comment = pdo_fetch('select id, images, append_images from ' . tablename('ewei_shop_order_comment') . 
				' where uniacid=:uniacid and orderid=:orderid and goodsid=:goodsid limit 1', 
				array(':uniacid' => $_W['uniacid'], ':goodsid' => $goodsid, ':orderid' => $orderid));
		if ($order['iscomment'] == 1)
		{
			$pics = unserialize($comment['images']);
			$pics = is_array($pics) ? $pics : array();
			$up_pic = array( 0 => $data['pic']);
			$pics = array_merge($pics, $up_pic);
			pdo_update('ewei_shop_order_comment', array('images' => iserializer($pics)), array('id' => $comment['id']));
		}
		elseif($order['iscomment'] == 2)
		{
			$pics = unserialize($comment['append_images']);
			$pics = is_array($pics) ? $pics : array();
			$up_pic = array( 0 => $data['pic']);
			$pics = array_merge($pics, $up_pic);
			pdo_update('ewei_shop_order_comment', array('append_images' => iserializer($pics)), array('id' => $comment['id']));
		}
	}
	
}

/* 用户照片上传 */
elseif ($op == 'order')
{
	$openid = $_W['openid'];
	$orderid = intval($_GPC['orderid']);
	if (!$orderid)
	{
		$this->result(1, '参数错误');
	}
	$order = pdo_fetch('select id, user_pic from ' . tablename('ewei_shop_order') . 
				' where uniacid=:uniacid and id=:id limit 1', 
				array(':uniacid' => $_W['uniacid'], ':id' => $orderid));
	if (!$order)
	{
		$this->result(1, '没有找到相关订单');
	}
	$pic  = (isset($_FILES['pic']['error']) && $_FILES['pic']['error'] == 0) || (!isset($_FILES['pic']['error']) && isset($_FILES['pic']['tmp_name']) && $_FILES['pic']['tmp_name'] != 'none') ? $_FILES['pic'] : '';
	if ($_FILES['pic']['tmp_name'] != '')
	{
		logging_run('上传');
		$pic_res = file_wechat_upload($_FILES['pic'], 'image');
		if ($pic_res['success'] != true)
		{
			$this->result(1, '上传失败');  
		}
		else
		{
			$data['pic'] = $pic_res['path'];
		}
	}
	if (!empty($data['pic']))
	{
		$pics = unserialize($order['user_pic']);
		$pics = is_array($pics) ? $pics : array();
		$up_pic = array( 0 => $data['pic']);
		$pics = array_merge($pics, $up_pic);
		pdo_update('ewei_shop_order', array('user_pic' => iserializer($pics)), array('id' => $orderid));
	}
}

/* 画师上传作品 */
elseif ($op == 'author')
{
	$openid = $_W['openid'];
	$orderid = intval($_GPC['orderid']);
	if (!$orderid)
	{
		$this->result(1, '参数错误');
	}
	$order = pdo_fetch('select id, upload_case from ' . tablename('ewei_shop_order') . 
				' where uniacid=:uniacid and id=:id limit 1', 
				array(':uniacid' => $_W['uniacid'], ':id' => $orderid));
	if (!$order)
	{
		$this->result(1, '没有找到相关订单');
	}
	$pic  = (isset($_FILES['pic']['error']) && $_FILES['pic']['error'] == 0) || (!isset($_FILES['pic']['error']) && isset($_FILES['pic']['tmp_name']) && $_FILES['pic']['tmp_name'] != 'none') ? $_FILES['pic'] : '';
	if ($_FILES['pic']['tmp_name'] != '')
	{
		logging_run('上传');
		$pic_res = file_wechat_upload($_FILES['pic'], 'image');
		if ($pic_res['success'] != true)
		{
			$this->result(1, '上传失败');  
		}
		else
		{
			$data['pic'] = $pic_res['path'];
		}
	}
	if (!empty($data['pic']))
	{
		$pics = unserialize($order['upload_case']);
		$pics = is_array($pics) ? $pics : array();
		$up_pic = array( 0 => $data['pic']);
		$pics = array_merge($pics, $up_pic);
		pdo_update('ewei_shop_order', array('upload_case' => iserializer($pics)), array('id' => $orderid));
	}
}
$this->result(0, '', $res);
?>
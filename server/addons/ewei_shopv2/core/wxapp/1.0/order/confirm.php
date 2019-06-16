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
$shopset = m('common')->getSysset('shop');


/* 订单确认 */
if ($op == 'display')
{
	$id = intval($_GPC['id']);
	$goodsid = 0;
	$goods = array();
	$member = m('member')->getMember($openid, 'id, mobile');
	
	if (!$id)
	{
		$this->result(1, '参数错误！');
	}
	$columns = 'title, info, id, marketprice, thumb, min_person, max_person, person_price, '.
			   'hasoption, ispresell, preselltimeend, preselltimeend ';
	$goods = pdo_fetch('select '. $columns .' from ' . tablename('ewei_shop_goods') . 
			 ' where id=:id and uniacid=:uniacid limit 1', 
			 array(':id' => $id, ':uniacid' => $_W['uniacid']));
	$goods['thumb'] = tomedia($goods['thumb']);	
		 
	/* 规格 */
	$goods['options'] = m('goods')->getOptionsByid($id);
	$res['goods']  = $goods;
	$res['member'] = $member;
	$res['price']  = priceFormat1($goods['marketprice'], 2); 
	
}

/* 吸怪价格 */
else if ($op == 'changeprice') 
{
	$price = changeprice($this);
	$res['price'] = $price;
}


/* 创建订单并发起支付 */
else if ($op == 'create' && $_W['ispost'])
{
	$id 	  = $_GPC['id'];
	$mobile   = $_GPC['mobile'];
	$remark   = $_GPC['remark'];
	$optionid = intval($_GPC['optionid']);
	$person   = intval($_GPC['person']);
	$pictype  = intval($_GPC['pictype']);
	$goods    = m('goods')->getRow($id);
	$price    = changeprice($this);
	$member   = m('member')->getMember($openid, 'openid, id, mobile, openid_xcx');
	if (empty($member['mobile']))
	{
		pdo_update('ewei_shop_member', array('mobile' => $mobile), array('id' => $member['id']));
	}
	if (!$price)
	{
		$obj->result(1, '价格非法');
	}
	// 商品下架
	if (empty($goods['status']) || !empty($goods['deleted'])) {
		$this->result (1, $goods['title'] . '<br/> 已下架!' );
	}
	
	// 开始创建订单
	$payment = m('shop')->getPaymentByKeys('wechat');
	$order = array(
		'uniacid' 	    => $_W['uniacid'],
		'userid' 	 	=> $member['id'],
		'openid' 	 	=> $openid,
		'ordersn'    	=> m('common')->createNO('order', 'ordersn', 'SH'),
		'price'		    => $price,  		    			 // 订单金额
		'status' 		=> 0,								 // 状态
		'person'		=> $person,							 // 人数
		'pictype'		=> $pictype,						 // 照片类型
		'paytype' 		=> $payment['type'],                 // 支付类型
		'payment'		=> 'wechat',					     // 支付方式
		'remark' 		=> $remark,                  		 // 订单备注
		'mobile' 		=> $mobile,						     // 地址信息
		'goodsprice'    => $price,			 				 // 商品价格
		'createtime'    => time(),
		'oldprice' 		=> $price,             			     // 没抵扣前的费用
		'isvirtual'     => 1,
		'formid'		=> $_GPC['formid'],
	);
	
	/* 创建订单和订单商品 */
	if (!is_array($order) || empty($order['ordersn']))
	{
		$this->result(1, '生成订单失败');
	}
	pdo_insert('ewei_shop_order', $order);
	$orderid = pdo_insertid();
	$order['id'] = $orderid;
	$res['order'] = $order;
	
	if ($optionid > 0)
	{
		$option = m('goods')->getProductRow($optionid);
		$goods['optiontitle'] = $option['title'];
		$goods['realprice'] = $option['realprice'];
		$goods['oldprice'] = $option['oldprice'];
	}
	
	// 创建商品
	$order_goods = array (
		'uniacid'    => $_W['uniacid'],
		'userid' 	 => $member['id'],
		'orderid'    => $orderid,
		'goodsid'    => $goods['id'],
		'realprice'  => $price,
		'price'      => $price,
		'total'      => 1,
		'optionid'   => $optionid,
		'createtime' => time(),
		'optionname' => $goods['optiontitle'],
		'goodssn'    => $goods['goodssn'],
		'productsn'  => $goods['productsn'],
		'oldprice'   => $goods['oldprice'],
	);
	pdo_insert('ewei_shop_order_goods', $order_goods );
	
	// 创建支付日志
	$log = array(
		'uniacid' => $_W['uniacid'], 
		'module' => 'ewei_shopv2', 
		'tid' => $order['ordersn'], 
		'fee' => $price, 
		'status' => 0, 
		'openid'  => $order['openid'],
		'type'    => 'wechat');
	pdo_insert('core_paylog', $log);
	$plid = pdo_insertid();
	
	// 生成支付申请
	$set = m('common')->getSysset(array('shop', 'pay', 'trade'));
	if (empty($set['pay']['weixin'])) {
		$this->result(1, '未开启微信支付!');
	}
	
	$param_title = $set['shop']['name'] . '订单: ' . $order['ordersn'];
	$wechat = array('success' => false);
	$params = array();
	$params['tid'] = $log['tid'];
	$params['openid'] = $member['openid_xcx'];
	$params['fee'] = $price;
	$params['title'] = $param_title;
	load()->model('payment');
	$setting = uni_setting($_W['uniacid'], array('payment'));
	if (is_weixin()) {
		$wxapp_set = m('common')->getSysset('wxapp');
		
		// 微信支付参数
		$options = pdo_fetch('select * from '. tablename('ewei_shop_payment') . 
							' where uniacid = '. $uniacid .' and type = 0');		
		if ($wxapp_set['AppId'] && $wxapp_set['AppSecret'] && is_array($options)) {
			$options['secret'] = $wxapp_set['AppSecret'];	
			$wechat = m('common')->wechat_build($params, $options, 0);
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

		if (!$wechat['success']) {
			$this->result(1, '微信支付参数错误!');
		}
		$res['payinfo'] = $wechat;
	}
	 else if (is_array($setting['payment'])) {
		$params['trade_type'] = 'NATIVE';
		$options = $setting['payment']['wechat'];
		$options['appid'] = $_W['account']['key'];
		$options['secret'] = $_W['account']['secret'];
		$wechat = m('common')->wechat_build($params, $options, 0);
		
		pdo_update('ewei_shop_order', array('paytype' => 21), array('id' => $order['id']));
		$res['payinfo'] = $wechat;
	}	
	
}

function changeprice($obj)
{
	global $_GPC;
	$id       = intval($_GPC['id']);
	$optionid = intval($_GPC['optionid']);
	$person   = intval($_GPC['person']);
	$price = 0;
	if (empty($id))
	{
		$obj->result(1, '参数错误');
	}
	$args = 'id, title, marketprice, person_price, min_person, max_person';
	$goods = m('goods')->getRow($id, $args);
	if (empty($id))
	{
		$obj->result(1, '商品未找到');
	}
	$price = $goods['marketprice'];
	
	// 规格价格
	if ($optionid > 0)
	{
		$option = m('goods')->getProductRow($optionid);
		if (empty($option)) {
				$obj->result(1, '规格未找到');
		}
	}
	
	if ($option['marketprice'] > 0)
	{
		$price = $option['marketprice'];
	}
	
	if ($person > $goods['min_person'])
	{
		$price += $goods['person_price'] * ($person - $goods['min_person']);
	}
	return priceFormat1($price,2);
}

function clear_session()
{
	/* 销毁session */
	unset($_SESSION['goods']);
	unset($_SESSION['order']);
}
	
$this->result(0, '', $res);
?>
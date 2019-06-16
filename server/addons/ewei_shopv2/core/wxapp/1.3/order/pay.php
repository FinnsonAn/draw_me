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
$set = m('common')->getSysset(array('shop', 'pay', 'trade'));

/* 支付展示 */
if ($op == 'display')
{
	if (empty($orderid)) {
		$this->result(1, '参数错误!');
	}

	$order = pdo_fetch('select * from ' . tablename('ewei_shop_order') . 
				' where id=:id and uniacid=:uniacid and openid=:openid limit 1', 
				array(':id' => $orderid, ':uniacid' => $uniacid, ':openid' => $openid));

	if (empty($order)) {
		$this->result(1, '订单未找到!');
	}
	
	if ($order['payment'] == 'wechat' && empty($set['pay']['weixin'])) {
		$this->result(1, '未开启微信支付!');
	}
	
	/* 如果是线下支付 */
	if ($order['payment'] == 'offline')
	{
		$order['offline_desc'] = $set['trade']['offline_pay_desc'];
	}
	
	if ($order['status'] == -1) {
		$this->result(1, '订单已关闭, 无法付款!!');
	}
	else if (1 <= $order['status']) {
		$this->result(1, '订单已付款, 无需重复支付!');
	}

	$log = pdo_fetch('SELECT * FROM ' . tablename('core_paylog') . 
			' WHERE `uniacid`=:uniacid AND `tid`=:tid limit 1',
			 array(':uniacid' => $uniacid, ':tid' => $order['ordersn']));
	
	/* 已支付 */
	if ($order['realprice'] == 0)
	{
		//m('order')->operate($order, 'pay');
		$this->result(1, '订单暂不需要支付!');
	}
	
	if (!empty($log) && ($log['status'] != '0')) {
		$this->result(1, '订单已付款, 无需重复支付!');
	}
	$order['realprice'] = priceFormat1($order['realprice']);
	$plid = $log['plid'];

	if (empty($log)) {
		$log = array(
			'uniacid' => $uniacid, 
			'module' => 'ewei_shop', 
			'tid' => $order['ordersn'], 
			'fee' => $order['realprice'], 
			'status' => 0, 
			'orderid' => $order['id'], 
			'openid'=>$order['openid']);
		pdo_insert('core_paylog', $log);
		$plid = pdo_insertid();
	}
	
	
	$res['order'] = $order;
	
}

else if (($op == 'pay')) {
	$type = $_GPC['payment'];
	$order = pdo_fetch('select * from ' . tablename('ewei_shop_order') .
	 		' where id=:id and uniacid=:uniacid and openid=:openid limit 1', 
			 array(':id' => $orderid, ':uniacid' => $uniacid, ':openid' => $openid));

	if (empty($order)) {
		$this->result(1, '订单未找到!');
	}

	$log = pdo_fetch('SELECT * FROM ' . tablename('core_paylog') . 
		' WHERE `uniacid`=:uniacid AND `tid`=:tid limit 1',
		 array(':uniacid' => $uniacid, ':tid' => $order['ordersn']));

	if (empty($log)) {
		$this->result(1, '支付出错,请重试!');
	}

	$order_goods = pdo_fetchall('select og.id,g.title, og.goodsid,og.optionid,g.total as stock,og.total as buycount,g.status,g.deleted,g.maxbuy,g.usermaxbuy,g.istime,g.timestart,g.timeend,g.buylevels,g.buygroups, g.isdiscount,g.discount_fromtime, g.discount_totime,g.discount_type, g.discount_price, g.discount_per, og.isdiscountprice as discountgoods from  ' . tablename('ewei_shop_order_goods') . ' og ' . ' left join ' . tablename('ewei_shop_goods') . ' g on og.goodsid = g.id ' . ' where og.orderid=:orderid and og.uniacid=:uniacid ', array(':uniacid' => $_W['uniacid'], ':orderid' => $orderid));

	foreach ($order_goods as $data ) {
		if (empty($data['status']) || !empty($data['deleted'])) {
			$this->result(1, $data['title'] . '<br/> 已下架!');
		}
		
		if ($data['istime'] == 1) {
			if (time() < $data['timestart']) {
				$this->result(1, $data['title'] . '<br/> 限购时间未到!');
			}

			if ($data['timeend'] < time()) {
				$this->result(1, $data['title'] . '<br/> 限购时间已过!');
			}
		}
		
		if ($data['discountgoods'])
		{
			$discount_info = m('goods')->getDiscountInfo($data);
			if ($discount_info['isdiscount'] && (!$discount_info['status'] || $discount_info['isempty']))
			{
				$this->result(1, '促销活动未开始或已售空');
			}
		}

		if ($data['buylevels'] != '') {
			$buylevels = explode(',', $data['buylevels']);

			if (!in_array($member['level'], $buylevels)) {
				$this->result(1, '您的会员等级无法购买<br/>' . $data['title'] . '!');
			}
		}

		if ($data['buygroups'] != '') {
			$buygroups = explode(',', $data['buygroups']);

			if (!in_array($member['groupid'], $buygroups)) {
				$this->result(1, '您所在会员组无法购买<br/>' . $data['title'] . '!');
			}
		}

		if (!empty($data['optionid'])) {
			$option = pdo_fetch('select id,title,marketprice,goodssn,productsn,stock,virtual from ' . tablename('ewei_shop_goods_option') . ' where id=:id and goodsid=:goodsid and uniacid=:uniacid  limit 1', array(':uniacid' => $uniacid, ':goodsid' => $data['goodsid'], ':id' => $data['optionid']));
			if (!empty($option)) {
				$data ['stock'] = $option ['stock'];
				
			}
		}
		
		// 商品限购和库存检查
		$canbuy = m('goods')->validateGoodsNum($data, $data['buycount'] ,$mid);
		if (!$canbuy['status'])
		{
			$this->result(1, $canbuy['msg']);
		}
	}
	$plid = $log['plid'];
	$param_title = $set['shop']['name'] . '订单: ' . $order['ordersn'];

	if ($type == 'wechat') {
		if (empty($set['pay']['weixin'])) {
			$this->result(1, '未开启微信支付!');
		}

		$wechat = array('success' => false);
		$params = array();
		$params['tid'] = $log['tid'];

		if (!empty($order['ordersn2'])) {
			$var = sprintf('%02d', $order['ordersn2']);
			$params['tid'] .= 'GJ' . $var;
		}
		$member = m('member')->getMember($openid, 'openid_xcx');
		$params['openid'] = $member['openid_xcx'];
		$params['fee'] = $order['realprice'];
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

			pdo_update('ewei_shop_order', array('payment' => 'wechat'), array('id' => $order['id']));
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
	 else if ($type == 'alipay') {
		pdo_update('ewei_shop_order', array('paytype' => 22), array('id' => $order['id']));
	}
	 else if ($type == 'yunpay') {
		pdo_update('ewei_shop_order', array('paytype' => 24), array('id' => $order['id']));
	}

}
 else if (($operation == 'complete')) {
	$order = pdo_fetch('select * from ' . tablename('ewei_shop_order') . 
			' where id=:id and uniacid=:uniacid and userid = '.$mid.' limit 1', 
			array(':id' => $orderid, ':uniacid' => $uniacid));
	$log = m('order')->getPaylog($order['ordersn']);
	//$agents = m('commission')->orderCommission($order['id']);

}

$this->result(0, '', $res);

?>
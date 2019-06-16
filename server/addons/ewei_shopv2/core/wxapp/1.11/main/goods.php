<?php
if (!defined('IN_IA')) {
	exit('Access Denied');
}
global $_GPC, $_W;
$op = $_GPC['op'];
$uniacid = $_W['uniacid'];
$res = array();

// 详情
if ($op == 'detail')
{
	// 有推广人
	if (intval($_GPC['pid']) > 0)
	{
		$openid = m('member')->getOpenid();
		if ($openid)
		{
			$mid = m('member')->getMid();
			if ($mid > 0 && p('commission'))
			{
				p('commission')->setInviter($_GPC['pid'], $mid);
				
				$member = m('member')->getRow($mid, 'id, agentid, inviter');
				p('commission')->becomeChild($member);
			}
			
		}
		
	}
	
	if (!$_GPC['id'])
	{
		$this->result(1, '商品id错误');
	}
	$id = intval($_GPC['id']);
	$goods = pdo_fetch('select * from ' . tablename('ewei_shop_goods') . ' where id=:id and uniacid=:uniacid limit 1', 
				array(':id' => $_GPC['id'], ':uniacid' => $uniacid));
	if (!$goods)
	{
		$this->result(1, '没有找到相关数据');
	}
	
	if ($goods['deleted'] || !$goods['status'])
	{
		$this->result(1, '该商品已停售或下架');
	}
	
	$goods['sales'] = abs($goods['sales']) + abs($goods['salesreal']); // 销量
	$goods['unit'] = ((empty($goods['unit']) ? '件' : $goods['unit'])); // 单位
	$goods['canbuy'] = !empty($goods['status']) && empty($goods['deleted']);  // 是否能购买
	$goods['isFavourite'] = m('goods')->isFavourite($id); //  是否收藏
		
	/* 运费 
	$dispatch_areas = m('dispatch')->getNoDispatchAreas($goods);
	$citys = ((empty($dispatch_areas) ? '' : $dispatch_areas['citys']));

	if (!(empty($citys))) {
		$onlysent = $dispatch_areas['onlysent'];
		$has_city = 1;
	}
	 else {
		$has_city = 0;
	}

	$package_goods = pdo_fetch('select pg.id,pg.pid,pg.goodsid,p.displayorder from ' . tablename('ewei_shop_package_goods') . ' as pg' . "\r\n" . '                        left join ' . tablename('ewei_shop_package') . ' as p on pg.pid = p.id' . "\r\n" . '                        where pg.uniacid = ' . $uniacid . ' and pg.goodsid = ' . $id . ' ORDER BY p.displayorder desc,pg.id desc limit 1 ');

	if ($package_goods['pid']) {
		$packages = pdo_fetchall('SELECT id,title,thumb,packageprice FROM ' . tablename('ewei_shop_package_goods') . "\r\n" . '                    WHERE uniacid = ' . $uniacid . ' and pid = ' . $package_goods['pid'] . '  ORDER BY id DESC');
		$packages = set_medias($packages, array('thumb'));
	}
	
	$goods['dispatchprice'] = $this->getGoodsDispatchPrice($goods);
	  */
	
	/* 缩略图 */
	$thumbs = iunserializer($goods['thumb_url']);
	if (empty($thumbs)) {
		$thumbs = array($goods['thumb']);
	}
	if (!(empty($goods['thumb_first'])) && !(empty($goods['thumb']))) {
		$thumbs = array_merge(array($goods['thumb']), $thumbs);
	}
	$thumbs = set_medias($thumbs);
	
	// 促销价 最终价
	if ($goods['meetingprice'])
	{
		$goods['price'] = '面议';
	}
	else
	{
		$discount = m('goods')->getDiscountInfo($goods);
		$goods['discount'] = $discount;
		
		$final = m('goods')->getFinalPrice($goods['id'], 1);
		if (is_array($final))
		{
			$goods['price'] = $final['price'];
		}
		else
		{
			$goods['price'] = $final['marketprice'];
		}
		$goods['price'] = priceFormat1($goods['price'], 2);
		$goods['marketprice']  = priceFormat1($goods['marketprice'], 2);
		$goods['productprice'] = priceFormat1($goods['productprice'], 2);
	}
	
	
	/* 限购信息 */
	if ($discount_info['isdiscount'])
	{
		if ($discount_info['status'])
		{
			$goods['maxbuy'] = $goods['discount_maxbuy'];
		}
		if ($goods['discount_total'] > 0)
		{
			//$goods['discount_maxbuy_str'] = '限购'. $goods['discount_total'] .'件; ';
		}
		if ($goods['discount_maxbuy'] > 0)
		{
			$goods['discount_maxbuy_str'] .= '每人限' . $goods['discount_maxbuy'] . $goods['unit'];
		}
		if ($discount_info['isempty'])
		{
			$goods['canbuy'] = 0;
		}
		
	}
	else
	{
		if (0 < $goods['usermaxbuy']) {
			$goods['maxbuy_str'] = '限购'. $goods['usermaxbuy'] .'件; ';
		}
		if ( $goods['maxbuy'] > 0)
		{
			$goods['maxbuy_str'] .= '单次限购' . $goods['maxbuy'] .'件';
		}
	}
	if ($goods['maxbuy'] > 0)
	{
		$goods['change_maxbuy'] = m('goods')->checkBuyNum($goods['id'], $goods['maxbuy'], 0, $member['id'], $discount_info);
	}
	
	/* 无库存 */
	if ($goods['total'] <= 0 )
	{
		$goods['canbuy'] = 0;
	}

	$goods['canaddcart'] = true;
	if (($goods['isverify'] == 2) || ($goods['type'] == 2) || ($goods['type'] == 3)) {
		$goods['canaddcart'] = false;
	}
	
	/* 规格 */
	$goods['options'] = m('goods')->getOptions($id);

	$goods = set_medias($goods, 'thumb');
	$goods['canbuy'] = ($goods['status'] == 1) && empty($goods['deleted']);
	
	
	/* 参数 */
	$params = m('goods')->getGoodsParam($id);
	foreach($params as &$item)
	{
		if ($item['title'] == '相似指数')
		{
			$item['value'] = intval($item['value']);
		}
	}
	unset($item);
	$goods['stars'] = array(1,2,3,4,5);
	$goods['params'] = $params;
	
	/* 内容处理 */
	$goods['content'] = html_entity_decode($goods['content']);
	
	/* 标签 */
	$labels = m('shop')->getSectionItems(24, 3);
	if (count($labels) > 0)
	{
		foreach($labels as &$item)
		{
			if (empty($item['thumb']))
			{
				$item['thumb'] = tomedia($goods['thumb']);
			}
		}
		unset($item);
	}
	
	$comment_total = m('goods')->getCommentNum($id) * 19;
	
	// 是否显示支付按钮
	$tradeset = m('common')->getSysset('trade');
	$wxappset = m('common')->getSysset('wxapp');
	$version = $_W['v'];
	if ($version == $wxappset['version'])
	{
		$paybtn_show =  $tradeset['paybtn'];
	}
	else
	{
		$paybtn_show =  $tradeset['beta_paybtn'];
	}
	

	$res = array('goods' => $goods, 'thumbs' => $thumbs, 'share' => $share, 'comment_total' => $comment_total, 'labels' => $labels, 'paybtn_show' => $paybtn_show);
	
	
}

elseif ($op == 'seloption')
{
	$gid = intval($_GPC['gid']);
	$total = intval($_GPC['total']);
	empty($total) && ($total = 1);
	$opid = intval($_GPC['opid']);
	
	$option = m('goods')->getProductRow($opid);
	if (empty($option)) {
			$this->result(1, '规格未找到');
	}
	
	if ($option['marketprice'] > 0)
	{
		$price_arr = m('goods')->getFinalPrice($gid, 1, $option['id']);
		$option['price']  = round($price_arr['price'], 2);
		$option['productprice'] = round($option['productprice'], 2);
	}
	$res['option'] = $option;
}

$this->result(0, '', $res);
?>
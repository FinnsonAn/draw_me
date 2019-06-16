<?php
if (!defined('IN_IA')) {
	exit('Access Denied');
}
global $_GPC, $_W;
$op = $_GPC['op'];
$uniacid = $_W['uniacid'];
$res = array();

/* 主数据 */
if ($op == 'main')
{
	// 幻灯片
	if ($_GPC['slide'])
	{
		$slideId = intval($_GPC['slide']);
		if ($slideId > 0)
		{
			$slides = m('shop')->getSliders($slideId);
			$res['slides'] = $slides;
		}
		else
		{
			$res['slides'] = array();
		}
	}
	
	// 分类
	$cates = m('shop')->getCategoryList(0);
	$cur_cid = $cates[0]['id'];
	$res['cates'] = $cates;
	
	/* 分享 */
	if ($openid)
	{
		$member = m('member')->getMember($openid, 'id, isagent, nickname, status');
		$shopset = m('common')->getSysset('shop');
		if ($member['isagent'] && $member['status'])
		{		
			$share['url'] = '/pages/goods/detail?pid=' . $_GPC['id'];
		}
	}
}

/* 商品列表 */
elseif ($op == 'goods')
{
	$rmd_goods = array();
	$cid = intval($_GPC['cid']);
	$pindex = max(1, intval($_GPC['page']));
	if ($cid == 0)
	{
		$floor1_cates = m('shop')->getCategoryList(0);
		$cid = $floor1_cates[0]['id'] ? intval($floor1_cates[0]['id']) : 0;
	}
	
	$condition = ' 1 and g.uniacid = '. $uniacid .' AND g.deleted = 0 and g.status=1 and g.checked = 0 ';
	$psize = 10;
	$columns = ' g.thumb, g.marketprice, g.productprice, g.title, g.subtitle, g.thumb, g.id, g.sales, g.salesreal, g.meetingprice, ' . 
			   ' g.isdiscount, g.isdiscount_title, g.discount_fromtime, g.discount_totime, g.discount_type, g.discount_price,' .
			   ' g.discount_per, g.tiny_thumb, g.ishot, g.isnew, g.info, g.label ';
			   
	if ($cid > 0)
	{
		$condition .= ' and (g.pcate = ' . $cid . ' or  FIND_IN_SET(' . $cid . ', g.pcates)<>0 ) ';
		if ($pindex == 1)
		{
			$rmd_goods = pdo_fetch('select '. $columns .' from '. tablename('ewei_shop_goods') .' g where '. $condition . 
				' and g.isrecommand = 1 order by g.displayorder desc, g.id desc ');
			$rmd_goods['thumb'] = tomedia($rmd_goods['thumb']);
			$rmd_goods['price'] = round($rmd_goods['marketprice'], 2);
		}
	}

	$total = pdo_fetchcolumn('SELECT count(*) FROM ' . tablename('ewei_shop_goods') . 
			' as g where ' . $condition . ' and g.isrecommand = 0 ');
	$pager = pagination($total, $pindex, $args['pagesize']);
	$sql = ' select '. $columns .' from '. tablename('ewei_shop_goods') .' g where '. $condition . ' and g.isrecommand = 0 ' .  
		   ' order by g.displayorder desc, g.id desc limit '. (($pindex - 1) * $psize) . ',' . $psize;

	$goods = pdo_fetchall($sql);
	foreach($goods as &$row)
	{
		if ($row['thumb'])
		{
			$row['thumb'] = tomedia($row['thumb']);
		}
		if ($row['marketprice'])
		{
			$row['marketprice'] = round($row['marketprice'], 2);
		}
		if ($row['productprice'])
		{
			$row['productprice'] = round($row['productprice'], 2);
			if ($row['productprice'] > 0)
			{
				$row['discount'] = round($row['marketprice'] / $row['productprice'], 2) * 10;
			}
			else
			{
				$row['discount'] = 10;
			}

		}
		
	
		// 最终价
		$final = m('goods')->getFinalPrice($row['id'], 1);
		if (is_array($final))
		{
			$row['price'] = $final['price'];
		}
		else
		{
			$row['price'] = $final['marketprice'];
		}
		
		$row['sales'] = abs($row['sales']);
		$row['sales'] += $row['salesreal'];
	
	}
	unset($row);
	
	$res['rmd_goods'] = $rmd_goods;
	$res['list'] = $goods;
	$res['page'] = $pindex;
	
}

$this->result(0, '', $res);
?>
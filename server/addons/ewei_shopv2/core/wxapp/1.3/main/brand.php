<?php
if (!defined('IN_IA')) {
	exit('Access Denied');
}
global $_GPC, $_W;
$op = $_GPC['op'];
$uniacid = $_W['uniacid'];
$res = array();

/* 品牌列表 */
if ($op == 'list')
{	
	$psize = 20;
	$total = pdo_fetchcolumn('SELECT count(*) FROM ' . tablename('ewei_shop_brand') . 
			' as g where 1 and enabled = 1 and uniacid = :uniacid ',
			array(':uniacid' => $uniacid));
	$pindex = max(1, intval($_GPC['page']));
	$pager = pagination($total, $pindex, $args['pagesize']);
	$brands = pdo_fetchall(' select * from '. tablename('ewei_shop_brand') .
						 ' where  enabled = 1 and uniacid = :uniacid ' . 
						 ' order by displayorder desc limit '. (($pindex - 1) * $psize) . ',' . $psize,
						 array(':uniacid' => $uniacid));
	$brands = set_medias($brands, 'brand_logo');
	$res['brands'] = $brands;
	$res['length'] = $total;
}

$this->result(0, '', $res);
?>
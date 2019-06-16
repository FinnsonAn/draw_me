<?php
if (!defined('IN_IA')) {
	exit('Access Denied');
}
global $_GPC, $_W;
$op = $_GPC['op'];
$res = array();

$uniacid = $_W['uniacid'];

if ($op == 'main')
{
	$orderlist = array();
	$setinfo = m('common')->getPluginset('case');
	$pindex = max(1, intval($_GPC['page']));
	$cid = intval($_GPC['cid']);
	$psize = 10;
	$cates = p('case')->getProductCates();
	if (empty($cid))
	{
		$cid = $cates[0]['id'];
	}
	$condition = ' and enabled = 1 and cate = ' . $cid;
	$list = pdo_fetchall('select * from ' . tablename('ewei_shop_case_product') . ' where 1 ' . $condition . 
			' order by displayorder desc, id desc LIMIT ' . (($pindex - 1) * $psize) . ',' . $psize, $params);
	$total = pdo_fetchcolumn('select count(*) from ' . tablename('ewei_shop_case_product') . 
			' where 1 ' . $condition, $params);
	
	foreach ($list as &$row ) 
	{
		$row['thumb'] = tomedia($row['thumb']);
		$row['author'] = p('case')->getAuthorName($row['author']);
	}
	unset($row);
	$res['cid'] = $cid;
	$res['list']  = $list;
	$res['page']  = $pindex;
	$res['total'] = $total;
	$res['cates'] = $cates;
	$res['setinfo'] = $setinfo;
}

$this->result(0, '', $res);

?>
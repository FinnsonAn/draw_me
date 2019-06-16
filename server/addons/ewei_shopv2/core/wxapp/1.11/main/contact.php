<?php
if (!defined('IN_IA')) {
	exit('Access Denied');
}
global $_GPC, $_W;
$op = $_GPC['op'];
$uniacid = $_W['uniacid'];
$res = array();

if ($op == 'main')
{
	/*头部图片和客服电话 */
	$shopset = m('common')->getSysset('shop');
	if (!empty($shopset['contact_bg']))
	{
		$set['banner'] = tomedia($shopset['contact_bg']);
	}
	$shopset = m('common')->getSysset('contact');
	$set['server_tel'] = $shopset['phone'];
	
	/* 门店列表 */
	if (!empty($_GPC['keys']))
	{
		$condition = ' and storename like \'%'. $_GPC['keys'] .'%\'';
	}
	$psize = 10;
	$pindex = max(1, intval($_GPC['page']));
	$columns = ' id, storename, address, lat, lng, realname, tel, wechat, qq, logo,'.
			   ' logo_url, web, email, saletime ';
	$sql = ' select '. $columns .' from '. tablename('ewei_shop_store') .' where 1 '. $condition .  
		   ' and status = 1 and uniacid = '. $uniacid .' order by displayorder desc '.
		   ' limit '. (($pindex - 1) * $psize) . ',' . $psize;
	$list = pdo_fetchall($sql);
	foreach ($list as &$item)
	{
		if (!(empty($item['logo']))) 
		{
			$item['pics'] = array_merge(array($item['logo']), iunserializer($item['logo_url']));
			$item['pics'] = set_medias($item['pics']);
		}
		$item['tels'] = explode(',', $item['tel']);
	}
	unset($item);
	$res['list'] = $list;
	$res['page'] = $pindex;
	$res['set']  = $set;
}

elseif ($op == 'location')
{
	$id = $_GPC['id'];
	if($id)
	{
		$store = m('shop')->getStore($id, 'lat, lng, address, storename, tel');
		$store['lat'] = floatval($store['lat']);
		$store['lng'] = floatval($store['lng']);
		$store['address'] .= $store['tel'];
		$res['store'] = $store;
	}
}


$this->result(0, '', $res);
?>
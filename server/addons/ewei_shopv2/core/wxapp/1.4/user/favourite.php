<?php
if (!defined('IN_IA')) {
	exit('Access Denied');
}
global $_GPC, $_W;
$op = $_GPC['op'];
$uniacid = $_W['uniacid'];
$res = array();
$openid = m('member')->getOpenid();

/* 检测登录状态 */
if (m('account')->checkWxappLogin())
{
	$this->result(1, '请先登录');
}

if ($op == 'list')
{
	$pindex = max(1, intval($_GPC['page']));
	$psize = 10;
	$condition = ' and f.uniacid = :uniacid and f.openid=\''. $openid .'\' and f.deleted=0';
	$params = array(':uniacid' => $_W['uniacid']);
	$sql = 'SELECT COUNT(*) FROM ' . tablename('ewei_shop_member_favorite') . ' f where 1 ' . $condition;
	$total = pdo_fetchcolumn($sql, $params);
	$list = array();

	if (!empty($total)) {
		$limit = 'LIMIT ' . (($pindex - 1) * $psize) . ',' . $psize;
		$sql = 'SELECT f.id,f.goodsid,g.title,g.subtitle,g.thumb,g.marketprice,g.productprice FROM ' . tablename('ewei_shop_member_favorite') . ' f left join ' . tablename('ewei_shop_goods') . ' g on f.goodsid = g.id ' . ' where 1 ' . $condition . ' ORDER BY f.id DESC ' . $limit;
		$list = pdo_fetchall($sql, $params);
		foreach($list as &$row)
		{
			$row['marketprice'] = priceFormat1($row['marketprice']);
			$row['productprice'] = priceFormat1($row['productprice']);
		}
		$list = set_medias($list, 'thumb');
	}
	$res['list'] = $list;
	$res['page'] = $pindex;
}
elseif ($op == 'set')
{
	$id = intval($_GPC['id']);
	$goods = pdo_fetch('select id from ' . tablename('ewei_shop_goods') . ' where uniacid=:uniacid and id=:id limit 1', array(':uniacid' => $_W['uniacid'], ':id' => $id));

	if (empty($goods)) {
		$this->result(1, '商品未找到');
	}

	$data = pdo_fetch('select id,deleted from ' . tablename('ewei_shop_member_favorite') . ' where uniacid=:uniacid and goodsid=:id and openid=\''. $openid .'\' limit 1', array(':uniacid' => $_W['uniacid'], ':id' => $id));

	if (empty($data)) {
		$data = array('uniacid' => $_W['uniacid'], 'openid' => $openid, 'goodsid' => $id, 'createtime' => time());
		pdo_insert('ewei_shop_member_favorite', $data);
		$res['isFavourite'] = 1;
	}
	 else if (empty($data['deleted'])) {
		pdo_update('ewei_shop_member_favorite', array('deleted' => 1), array('id' => $data['id'], 'uniacid' => $_W['uniacid']));
		$res['isFavourite'] = 0;
	}
	 else {
		pdo_update('ewei_shop_member_favorite', array('deleted' => 0), array('id' => $data['id'], 'uniacid' => $_W['uniacid']));
		$res['isFavourite'] = 1;
	}
}
elseif ($op == 'remove')
{
	$id = $_GPC['id'];
	if (empty($id)) {
		$this->result(1, '参数错误');
	}
	pdo_update('ewei_shop_member_favorite', array('deleted' => 1), array('id' => $id, 'uniacid' => $uniacid, 'openid'=>$openid));	

}

$this->result(0, '', $res);
?>
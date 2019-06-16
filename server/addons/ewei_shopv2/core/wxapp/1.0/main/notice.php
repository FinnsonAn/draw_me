<?php
if (!defined('IN_IA')) {
	exit('Access Denied');
}
global $_GPC, $_W;
$op = $_GPC['op'];
$uniacid = $_W['uniacid'];
$res = array();

if ($op == 'list')
{
	$cid = intval($_GPC['cid']);
	if (!$cid)
	{
		$this->result(1, '参数错误');
	}
	$psize = 20;
	$pindex = max(1, intval($_GPC['page']));
	$fromindex = ($pindex - 1) * $psize;
	$limit = array($fromindex, $psize);
	$catename = m('shop')->getNoticeCatename($cid);
	$notices = m('shop')->getNoticeList($cid, $limit);
	$res['list'] = $notices;
	$res['page'] = $pindex;
	$res['catename'] = $catename;
	
}
elseif ($op == 'detail')
{
	$id = intval($_GPC['id']);
	if (!$id)
	{
		$this->result(1, '参数错误');
	}
	$data =  pdo_fetch('SELECT * FROM ' . tablename('ewei_shop_notice') . ' WHERE id =:id and uniacid=:uniacid and status=1 limit 1', 
				array(':id' => $id, ':uniacid' => $_W['uniacid']));
	$data['date'] = date('Y-m-d', $data['createtime']);
	$data['detail'] = html_entity_decode($data['detail']);
	$res['article'] = $data;			
}

$this->result(0, '', $res);

?>
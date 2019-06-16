<?php
if (!defined('IN_IA')) {
	exit('Access Denied');
}
global $_GPC, $_W;
$op = $_GPC['op'];
$uniacid = $_W['uniacid'];
$cid = intval($_GPC['cid']);
$res = array();

/* 分类列表 */
if ($op == 'catelist')
{
	$pid = $_GPC['pid'] ? intval($_GPC['pid']) : 0;
	$res['cates'] = m('shop')->getCategoryList($pid);
	$cid = $cid > 0 ? $cid : $res['cates'][0]['id'];
	$res['curCate'] = m('shop')->getCateInfo($cid);
	
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
}

$this->result(0, '', $res);
?>
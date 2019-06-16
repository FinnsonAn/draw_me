<?php
if (!defined('IN_IA')) {
	exit('Access Denied');
}
global $_GPC, $_W;
$op = $_GPC['op'];
$uniacid = $_W['uniacid'];
$res = array();

/* 商品详情 */
if ($op == 'list')
{
	$goodsid = $_GPC['id'];
	$page = ((!(empty($_GPC['page'])) ? intval($_GPC['page']) : 1));
	$pagesize = 10;
	$condition = ' and `uniacid` = :uniacid and deleted=0';
	$params = array(':uniacid' => $_W['uniacid']);
	$sql = 'SELECT * FROM ' . tablename('ewei_shop_order_comment') . ' where 1 ' . $condition . ' ORDER BY createtime desc LIMIT ' . (($page - 1) * $pagesize) . ',' . $pagesize;
	$list = pdo_fetchall($sql, $params);
	if (is_array($list))
	{
		foreach ($list as &$row) {
			$level_arr = array();
			for ($i=1; $i<=$row['level']; $i++)
			{
				$level_arr[] = $i;
			}
			$row['level_arr'] = $level_arr;
			$row['images'] = set_medias(unserialize($row['images']));
			$row['date']   = date('Y-m-d', $row['createtime']);
			$row['headimgurl'] = tomedia($row['headimgurl']);
			$row['goods']  = m('goods')->getColumn($row['goodsid'], 'title');
		}
	}
	unset($row);
	$res['list']  = $list;
	$res['page']  = $page;
	
}	

$this->result(0, '', $res);
?>
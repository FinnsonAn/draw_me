<?php
if (!(defined('IN_IA'))) 
{
	exit('Access Denied');
}
class Brand_EweiShopV2Page extends WebPage 
{
	public function main() 
	{
		global $_W;
		global $_GPC;
		$pindex = max(1, intval($_GPC['page']));
		$psize = 20;
		$condition = ' and uniacid=:uniacid';
		$params = array(':uniacid' => $_W['uniacid']);
		if ($_GPC['enabled'] != '') 
		{
			$condition .= ' and enabled=' . intval($_GPC['enabled']);
		}
		if (!(empty($_GPC['keyword']))) 
		{
			$_GPC['keyword'] = trim($_GPC['keyword']);
			$condition .= ' and brand_name  like :keyword';
			$params[':keyword'] = '%' . $_GPC['keyword'] . '%';
		}
		$list = pdo_fetchall('SELECT * FROM ' . tablename('ewei_shop_brand') . ' WHERE 1 ' . $condition . '  ORDER BY displayorder DESC limit ' . (($pindex - 1) * $psize) . ',' . $psize, $params);
		$total = pdo_fetchcolumn('SELECT count(*) FROM ' . tablename('ewei_shop_brand') . ' WHERE 1 ' . $condition, $params);
		$pager = pagination($total, $pindex, $psize);
		include $this->template();
	}
	public function add() 
	{
		$this->post();
	}
	public function edit() 
	{
		$this->post();
	}
	protected function post() 
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);
		if ($_W['ispost']) 
		{
			$data = array(
				'uniacid' => $_W['uniacid'], 
				'brand_name' => trim($_GPC['brand_name']), 
				'enabled' => intval($_GPC['enabled']), 
				'displayorder' => intval($_GPC['displayorder']), 
				'brand_logo'  => save_media($_GPC['brand_logo']),
				'banner'  => save_media($_GPC['banner']),
				'short_desc' => $_GPC['short_desc']);
			if (!(empty($id))) 
			{
				pdo_update('ewei_shop_brand', $data, array('id' => $id));
				plog('goods.brand.edit', '修改品牌 ID: ' . $id);
			}
			else 
			{
				pdo_insert('ewei_shop_brand', $data);
				$id = pdo_insertid();
				plog('goods.brand.add', '添加品牌 ID: ' . $id);
			}
			show_json(1, array('url' => webUrl('goods/brand')));
		}
		$item = pdo_fetch('select * from ' . tablename('ewei_shop_brand') . ' where id=:id and uniacid=:uniacid limit 1', array(':id' => $id, ':uniacid' => $_W['uniacid']));
		include $this->template();
	}
	public function delete() 
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);
		if (empty($id)) 
		{
			$id = ((is_array($_GPC['ids']) ? implode(',', $_GPC['ids']) : 0));
		}
		$items = pdo_fetchall('SELECT id,brand_name FROM ' . tablename('ewei_shop_brand') . ' WHERE id in( ' . $id . ' ) AND uniacid=' . $_W['uniacid']);
		foreach ($items as $item ) 
		{
			pdo_delete('ewei_shop_brand', array('id' => $item['id']));
			plog('goods.brand.delete', '删除品牌 ID: ' . $item['id'] . ' 标题: ' . $item['brand_name'] . ' ');
		}
		show_json(1, array('url' => referer()));
	}
	public function displayorder() 
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);
		$displayorder = intval($_GPC['value']);
		$item = pdo_fetchall('SELECT id,brand_name FROM ' . tablename('ewei_shop_brand') . ' WHERE id in( ' . $id . ' ) AND uniacid=' . $_W['uniacid']);
		if (!(empty($item))) 
		{
			pdo_update('ewei_shop_brand', array('displayorder' => $displayorder), array('id' => $id));
			plog('goods.brand.edit', '修改品牌排序 ID: ' . $item['id'] . ' 标题: ' . $item['brand_name'] . ' 排序: ' . $displayorder . ' ');
		}
		show_json(1);
	}
	public function enabled() 
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);
		if (empty($id)) 
		{
			$id = ((is_array($_GPC['ids']) ? implode(',', $_GPC['ids']) : 0));
		}
		$items = pdo_fetchall('SELECT id,brand_name FROM ' . tablename('ewei_shop_brand') . ' WHERE id in( ' . $id . ' ) AND uniacid=' . $_W['uniacid']);
		foreach ($items as $item ) 
		{
			pdo_update('ewei_shop_brand', array('enabled' => intval($_GPC['enabled'])), array('id' => $item['id']));
			plog('goods.brand.edit', (('修改品牌状态<br/>ID: ' . $item['id'] . '<br/>标题: ' . $item['brand_name'] . '<br/>状态: ' . $_GPC['enabled']) == 1 ? '显示' : '隐藏'));
		}
		show_json(1, array('url' => referer()));
	}
}
?>
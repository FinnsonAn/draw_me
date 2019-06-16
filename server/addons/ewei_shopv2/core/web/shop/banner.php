<?php
if (!(defined('IN_IA'))) 
{
	exit('Access Denied');
}
class Banner_EweiShopV2Page extends WebPage 
{
	public function main() 
	{
		global $_W;
		global $_GPC;
		$position_id = empty($_GPC['position_id']) ? 0 : intval($_GPC['position_id']);
		$positions = m('shop')->getAdvPosition();
		$pindex = max(1, intval($_GPC['page']));
		$psize = 20;
		$condition = ' and uniacid=:uniacid and iswxapp=0 ';
		$params = array(':uniacid' => $_W['uniacid']);
		if ($_GPC['enabled'] != '') 
		{
			$condition .= ' and enabled=' . intval($_GPC['enabled']);
		}
		if (!(empty($_GPC['keyword']))) 
		{
			$_GPC['keyword'] = trim($_GPC['keyword']);
			$condition .= ' and bannername  like :keyword';
			$params[':keyword'] = '%' . $_GPC['keyword'] . '%';
		}
		if ($position_id) {
			$_GPC['position_id'] = intval($_GPC['position_id']);
			$condition .= ' and position_id  = '. $_GPC['position_id'] .' ';
		}
		$list = pdo_fetchall('SELECT * FROM ' . tablename('ewei_shop_banner') . ' WHERE 1 ' . $condition . '  ORDER BY displayorder DESC limit ' . (($pindex - 1) * $psize) . ',' . $psize, $params);
		$total = pdo_fetchcolumn('SELECT count(*) FROM ' . tablename('ewei_shop_banner') . ' WHERE 1 ' . $condition, $params);
		$pager = pagination($total, $pindex, $psize);
		$bannerswipe = $_W['shopset']['shop']['bannerswipe'];
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
		$position_id = empty($_GPC['position_id']) ? 0 : intval($_GPC['position_id']);
		$positions = m('shop')->getAdvPosition();
		if ($_W['ispost']) 
		{
			$data = array('uniacid' => $_W['uniacid'], 
				'bannername' => trim($_GPC['bannername']), 
				'link' => trim($_GPC['link']), 
				'enabled' => intval($_GPC['enabled']), 
				'displayorder' => intval($_GPC['displayorder']), 
				'thumb' 	   => save_media($_GPC['thumb']),
				'position_id'  => intval($_GPC['position_id']));
			if (!(empty($id))) 
			{
				pdo_update('ewei_shop_banner', $data, array('id' => $id));
				plog('shop.banner.edit', '修改广告 ID: ' . $id);
			}
			else 
			{
				pdo_insert('ewei_shop_banner', $data);
				$id = pdo_insertid();
				plog('shop.banner.add', '添加广告 ID: ' . $id);
			}
			show_json(1, array('url' => webUrl('shop/banner', array('position_id' => $position_id))));
		}
		$item = pdo_fetch('select * from ' . tablename('ewei_shop_banner') . ' where id=:id and uniacid=:uniacid limit 1', array(':id' => $id, ':uniacid' => $_W['uniacid']));
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
		$items = pdo_fetchall('SELECT id,bannername FROM ' . tablename('ewei_shop_banner') . ' WHERE id in( ' . $id . ' ) AND uniacid=' . $_W['uniacid']);
		foreach ($items as $item ) 
		{
			pdo_delete('ewei_shop_banner', array('id' => $item['id']));
			plog('shop.banner.delete', '删除广告 ID: ' . $item['id'] . ' 标题: ' . $item['bannername'] . ' ');
		}
		show_json(1, array('url' => referer()));
	}
	public function displayorder() 
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);
		$displayorder = intval($_GPC['value']);
		$item = pdo_fetchall('SELECT id,bannername FROM ' . tablename('ewei_shop_banner') . ' WHERE id in( ' . $id . ' ) AND uniacid=' . $_W['uniacid']);
		if (!(empty($item))) 
		{
			pdo_update('ewei_shop_banner', array('displayorder' => $displayorder), array('id' => $id));
			plog('shop.banner.edit', '修改广告排序 ID: ' . $item['id'] . ' 标题: ' . $item['bannername'] . ' 排序: ' . $displayorder . ' ');
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
		$items = pdo_fetchall('SELECT id,bannername FROM ' . tablename('ewei_shop_banner') . ' WHERE id in( ' . $id . ' ) AND uniacid=' . $_W['uniacid']);
		foreach ($items as $item ) 
		{
			pdo_update('ewei_shop_banner', array('enabled' => intval($_GPC['enabled'])), array('id' => $item['id']));
			plog('shop.banner.edit', (('修改广告状态<br/>ID: ' . $item['id'] . '<br/>标题: ' . $item['bannername'] . '<br/>状态: ' . $_GPC['enabled']) == 1 ? '显示' : '隐藏'));
		}
		show_json(1, array('url' => referer()));
	}
	public function setswipe() 
	{
		global $_W;
		global $_GPC;
		$shop = $_W['shopset']['shop'];
		$shop['bannerswipe'] = intval($_GPC['bannerswipe']);
		m('common')->updateSysset(array('shop' => $shop));
		plog('shop.banner.edit', '修改手机端广告轮播');
		show_json(1);
	}
	
	public function plist()
	{
		global $_W;
		global $_GPC;
		if (!empty($_GPC['displayorder'])) {
	
			foreach ($_GPC['displayorder'] as $id => $displayorder ) {
				pdo_update('ewei_shop_banner_position', array('sort_num' => $displayorder), array('pid' => $id));
			}
			show_json(1, array('url' => referer()));
		}
	
		$list = m('shop')->getAdvPosition();
		foreach($list as &$row)
		{
			$row['counts'] = pdo_fetchcolumn('select count(*) from '. tablename('ewei_shop_banner') .
							' where position_id='.$row['pid'].'');
			unset($row);
		}
		include $this->template('shop/banner/position');
	}
	
	public function pedit()
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);
		if ($_W['ispost']) {
			$data = array(
				'uniacid' => $_W['uniacid'], 
				'position_name' => trim($_GPC['position_name']), 
				'enabled' => intval($_GPC['enabled']), 
				'sort_num' => intval($_GPC['sort_num']), 
				'size' => $_GPC['size'], 
				'desc' => $_GPC['desc']);
	
			if (!empty($id)) {
				pdo_update('ewei_shop_banner_position', $data, array('pid' => $id));
			}
			 else {
				pdo_insert('ewei_shop_banner_position', $data);
				$id = pdo_insertid();
			}
			show_json(1, array('url' => webUrl('shop/banner/plist')));
		}
	
		$item = pdo_fetch('select * from ' . tablename('ewei_shop_banner_position') . 
				' where pid=:id and uniacid=:uniacid limit 1', 
				array(':id' => $id, ':uniacid' => $_W['uniacid']));
		include $this->template('shop/banner/position');
	}
	
	public function pdelete()
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);
		$item = pdo_fetch('SELECT pid FROM ' . tablename('ewei_shop_banner_position') . 
			   ' WHERE pid = \'' . $id . '\' AND uniacid=' . $_W['uniacid'] . '');
	
		if (empty($item)) {
			show_json(0, array('message' => '抱歉，广告位置不存在或是已经被删除！'));
		}
		pdo_delete('ewei_shop_banner', array('position_id' => $id));
		pdo_delete('ewei_shop_banner_position', array('pid' => $id));
		show_json(1, array('url' => referer()));
	}
}
?>
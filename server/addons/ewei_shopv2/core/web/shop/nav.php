<?php
if (!(defined('IN_IA'))) 
{
	exit('Access Denied');
}
class Nav_EweiShopV2Page extends WebPage 
{
	public function main() 
	{
		global $_W;
		global $_GPC;
		$group_id = empty($_GPC['group_id']) ? 0 : intval($_GPC['group_id']);
		$groups = m('shop')->getNavGroup();
		$pindex = max(1, intval($_GPC['page']));
		$psize = 20;
		$condition = ' and uniacid=:uniacid and iswxapp=0 ';
		$params = array(':uniacid' => $_W['uniacid']);
		if ($_GPC['status'] != '') 
		{
			$condition .= ' and status=' . intval($_GPC['status']);
		}
		if (!(empty($_GPC['keyword']))) 
		{
			$_GPC['keyword'] = trim($_GPC['keyword']);
			$condition .= ' and navname  like :keyword';
			$params[':keyword'] = '%' . $_GPC['keyword'] . '%';
		}
		if ($group_id) {
			$_GPC['group_id'] = intval($_GPC['group_id']);
			$condition .= ' and group_id  = '. $_GPC['group_id'] .' ';
		}
		$list = pdo_fetchall('SELECT * FROM ' . tablename('ewei_shop_nav') . ' WHERE 1 ' . $condition . '  ORDER BY displayorder DESC limit ' . (($pindex - 1) * $psize) . ',' . $psize, $params);
		$total = pdo_fetchcolumn('SELECT count(*) FROM ' . tablename('ewei_shop_nav') . ' WHERE 1 ' . $condition, $params);
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
		$group_id = empty($_GPC['group_id']) ? 0 : intval($_GPC['group_id']);
		$groups = m('shop')->getNavGroup();
		$dataTypes = m('shop')->countsType();
		if ($_W['ispost']) 
		{
			$data = array('uniacid' => $_W['uniacid'], 
					'navname' => trim($_GPC['navname']), 
					'url' => trim($_GPC['url']), 
					'status' => intval($_GPC['status']), 
					'displayorder' => intval($_GPC['displayorder']), 
					'group_id'=>intval($_GPC['group_id']), 
					'icon' => save_media($_GPC['icon']), 
					'active_icon' => save_media($_GPC['active_icon']), 
					'data_type' => $_GPC['data_type'],
					'classname' => trim($_GPC['classname']),
					'istab' => intval($_GPC['istab']));
			if (!(empty($id))) 
			{
				pdo_update('ewei_shop_nav', $data, array('id' => $id));
				plog('shop.nav.edit', '修改导航 ID: ' . $id);
			}
			else 
			{
				pdo_insert('ewei_shop_nav', $data);
				$id = pdo_insertid();
				plog('shop.nav.add', '添加导航 ID: ' . $id);
			}
			m('common')->createStaticFile(mobileUrl('getpage', NULL, true), true);
			show_json(1, array('url' => webUrl('shop/nav', array('group_id' => $group_id))));
		}
		$item = pdo_fetch('select * from ' . tablename('ewei_shop_nav') . ' where id=:id and uniacid=:uniacid limit 1', array(':id' => $id, ':uniacid' => $_W['uniacid']));
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
		$items = pdo_fetchall('SELECT id,navname FROM ' . tablename('ewei_shop_nav') . ' WHERE id in( ' . $id . ' ) AND uniacid=' . $_W['uniacid']);
		foreach ($items as $item ) 
		{
			pdo_delete('ewei_shop_nav', array('id' => $item['id']));
			plog('shop.nav.delete', '删除导航 ID: ' . $item['id'] . ' 标题: ' . $item['navname'] . ' ');
		}
		show_json(1, array('url' => referer()));
	}
	public function displayorder() 
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);
		$displayorder = intval($_GPC['value']);
		$item = pdo_fetchall('SELECT id,navname FROM ' . tablename('ewei_shop_nav') . ' WHERE id in( ' . $id . ' ) AND uniacid=' . $_W['uniacid']);
		if (!(empty($item))) 
		{
			pdo_update('ewei_shop_nav', array('displayorder' => $displayorder), array('id' => $id));
			plog('shop.nav.edit', '修改导航排序 ID: ' . $item['id'] . ' 标题: ' . $item['navname'] . ' 排序: ' . $displayorder . ' ');
		}
		show_json(1);
	}
	public function status() 
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);
		if (empty($id)) 
		{
			$id = ((is_array($_GPC['ids']) ? implode(',', $_GPC['ids']) : 0));
		}
		$items = pdo_fetchall('SELECT id,navname FROM ' . tablename('ewei_shop_nav') . ' WHERE id in( ' . $id . ' ) AND uniacid=' . $_W['uniacid']);
		foreach ($items as $item ) 
		{
			pdo_update('ewei_shop_nav', array('status' => intval($_GPC['status'])), array('id' => $item['id']));
			plog('shop.nav.edit', (('修改导航状态<br/>ID: ' . $item['id'] . '<br/>标题: ' . $item['navname'] . '<br/>状态: ' . $_GPC['status']) == 1 ? '显示' : '隐藏'));
		}
		show_json(1, array('url' => referer()));
	}
	public function glist()
	{
		global $_W;
		global $_GPC;
		if (!empty($_GPC['displayorder'])) {
	
			foreach ($_GPC['displayorder'] as $id => $displayorder ) {
				pdo_update('ewei_shop_nav_group', array('sort_num' => $displayorder), array('gid' => $id));
			}
			show_json(1, array('url' => referer()));
		}
	
		$list = m('shop')->getNavGroup();
		foreach($list as &$row)
		{
			$row['counts'] = pdo_fetchcolumn('select count(*) from '. tablename('ewei_shop_nav') .
							' where group_id='.$row['gid'].'');
			unset($row);
		}
		include $this->template('shop/nav/group');
	}
	
	public function gedit()
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);
		if ($_W['ispost']) {
			$data = array(
				'uniacid' => $_W['uniacid'], 
				'title' => trim($_GPC['title']), 
				'enabled' => intval($_GPC['enabled']));
	
			if (!empty($id)) {
				pdo_update('ewei_shop_nav_group', $data, array('gid' => $id));
			}
			 else {
				pdo_insert('ewei_shop_nav_group', $data);
				$id = pdo_insertid();
			}
			show_json(1, array('url' => webUrl('shop/nav/glist')));
		}
	
		$item = pdo_fetch('select * from ' . tablename('ewei_shop_nav_group') . 
				' where gid=:id and uniacid=:uniacid limit 1', 
				array(':id' => $id, ':uniacid' => $_W['uniacid']));
		include $this->template('shop/nav/group');
	}
	
	public function gdelete()
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);
		$item = pdo_fetch('SELECT gid FROM ' . tablename('ewei_shop_nav_group') . 
			   ' WHERE gid = \'' . $id . '\' AND uniacid=' . $_W['uniacid'] . '');
	
		if (empty($item)) {
			show_json(0, array('message' => '抱歉，导航组不存在或是已经被删除！'));
		}
		pdo_delete('ewei_shop_nav', array('group_id' => $id, 'uniacid' => $_W['uniacid']));
		pdo_delete('ewei_shop_nav_group', array('gid' => $id));
		show_json(1, array('url' => referer()));
	}
}
?>
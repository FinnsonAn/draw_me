<?php
if (!(defined('IN_IA'))) 
{
	exit('Access Denied');
}
class Section_EweiShopV2Page extends WebPage 
{
	function main()
	{
		global $_W;
		global $_GPC;
		$list = m('shop')->getSectionList();
		include $this->template('shop/section/index');
	}
	
	function edit()
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);
		$section_types = m('shop')->getSectionType();
		$styles = m('shop')->sectionStyleArr();

		if ($id)
		{
			$item = pdo_fetch('select * from ' . tablename('ewei_shop_section') . ' where sid=:id and uniacid=:uniacid limit 1', 
					array(':id' => $id, ':uniacid' => $_W['uniacid']));
			if ($item['is_system'])
			{
				$this->message('此版块为系统版块不能修改！', '', 'error');
			}
		}
		
		if ($_W['ispost']) {
			$data = array('uniacid' => $_W['uniacid'], 
						  'section_name' => trim($_GPC['section_name']),  
						  'section_title' => trim($_GPC['section_title']),  
						  'section_type' => trim($_GPC['section_type']),  
						  'bgcolor' => trim($_GPC['bgcolor']),  
						  'link' => trim($_GPC['link']),  
						  'style' => trim($_GPC['style']), 
						  'classname' => trim($_GPC['classname']),  
						  'slider_id' => intval($_GPC['slider_id']),  
						  'enabled' => intval($_GPC['enabled']), 
						  'displayorder' => intval($_GPC['displayorder']));
	
			if (!empty($id)) {
				pdo_update('ewei_shop_section', $data, array('sid' => $id));
			}
			 else {
				pdo_insert('ewei_shop_section', $data);
				$id = pdo_insertid();
			}
			show_json(1, array('url' => webUrl('shop/section')));
		}
		include $this->template('shop/section/index');
	}
	
	function displayorder()
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);
		$displayorder = intval($_GPC['value']);
		$item = pdo_fetchall('SELECT sid FROM ' . tablename('ewei_shop_section') . ' WHERE sid in( ' . $id . ' ) AND uniacid=' . $_W['uniacid']);
		if (!(empty($item))) 
		{
			pdo_update('ewei_shop_section', array('displayorder' => $displayorder), array('sid' => $id));
		}
		show_json(1);
	}
	
	function delete()
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);
		$item = pdo_fetch('SELECT sid, is_system FROM ' . tablename('ewei_shop_section') . ' WHERE sid = \'' . $id . '\' AND uniacid=' . $_W['uniacid'] . '');
	
		if ($item['is_system'])
		{
			show_json(0, array('message' => '抱歉，此版块是系统版块不能被删除！'));
		}
		if (empty($item)) {
			show_json(0, array('message' => '抱歉，版块不存在或是已经被删除！'));
		}
		pdo_delete('ewei_shop_section_item', array('section_id' => $id));
		pdo_delete('ewei_shop_section', array('sid' => $id, 'uniacid' => $_W['uniacid']));
		show_json(1, array('url' => referer()));
	}
	
	function album()
	{
		global $_W;
		global $_GPC;
		$sid = intval($_GPC['sid']);
		$section = m('shop')->getSection($sid);
		$sections = m('shop')->getSectionList();
		$list = m('shop')->getSectionItems($sid, 0, 1);
		include $this->template('shop/section/album');
	}
	
	function albumEdit()
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);
		$sid = intval($_GPC['sid']);
		$sections = m('shop')->getSectionList();
		$section = m('shop')->getSection($sid);
		if ($_W['ispost']) {
			$data = array('uniacid' => $_W['uniacid'], 
						  'name' => trim($_GPC['name']), 
						  'title' => trim($_GPC['title']), 
						  'assistant_title' => trim($_GPC['assistant_title']), 
						  'section_id' => trim($_GPC['section_id']), 
						  'bgcolor' => trim($_GPC['bgcolor']), 
						  'width' => intval($_GPC['width']), 
						  'height' => intval($_GPC['height']), 
						  'data_id' => intval($_GPC['data_id']), 
						  'thumb' => save_media($_GPC['thumb']), 
						  'link' => trim($_GPC['link']), 
						  'desc' => trim($_GPC['desc']),  
						  'enabled' => intval($_GPC['enabled']), 
						  'displayorder' => intval($_GPC['displayorder']));
	
			if (!empty($id)) {
				pdo_update('ewei_shop_section_item', $data, array('item_id' => $id));
			}
			 else {
				pdo_insert('ewei_shop_section_item', $data);
				$id = pdo_insertid();
			}
			show_json(1, array('url' => webUrl('shop/section/album', array('sid' => $sid))));
		}
	
		$item = m('shop')->getSectionItem($id);
		include $this->template('shop/section/album');
	}
	
	function albumDel()
	{
		global $_W;
		global $_GPC;
		$sid = intval($_GPC['sid']);
		$id = intval($_GPC['id']);
		$item = pdo_fetch('SELECT item_id FROM ' . tablename('ewei_shop_section_item') . ' WHERE item_id = \'' . $id . '\' AND uniacid=' . $_W['uniacid'] . '');
	
		if (empty($item)) {
			show_json(0, array('message' => '抱歉，图位不存在或是已经被删除！'));
		}
		pdo_delete('ewei_shop_section_item', array('item_id' => $id));
		show_json(1, array('url' => referer()));
	}
	
	function albumOrder()
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);
		$displayorder = intval($_GPC['value']);
		$item = pdo_fetchall('SELECT item_id FROM ' . tablename('ewei_shop_section_item') . 
				' WHERE item_id in( ' . $id . ' ) AND uniacid=' . $_W['uniacid']);
		if (!(empty($item))) 
		{
			pdo_update('ewei_shop_section', array('displayorder' => $displayorder), array('item_id' => $id));
		}
		show_json(1);
	}
	
	public function albumEnabled() 
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);
		if (empty($id)) 
		{
			$id = ((is_array($_GPC['ids']) ? implode(',', $_GPC['ids']) : 0));
		}
		$items = pdo_fetchall('SELECT item_id FROM ' . tablename('ewei_shop_section_item') . ' WHERE item_id in( ' . $id . ' ) AND uniacid=' . $_W['uniacid']);
		foreach ($items as $item ) 
		{
			pdo_update('ewei_shop_section_item', array('enabled' => intval($_GPC['enabled'])), array('item_id' => $item['item_id']));
			
		}
		show_json(1, array('url' => referer()));
	}
}
?>
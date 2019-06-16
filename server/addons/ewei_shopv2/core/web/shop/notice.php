<?php

if (!defined('IN_IA')) {
	exit('Access Denied');
}

class Notice_EweiShopV2Page extends WebPage
{
	public function main()
	{
		global $_W;
		global $_GPC;
		$pindex = max(1, intval($_GPC['page']));
		$psize = 20;
		$cid = empty($_GPC['cid']) ? 0 : intval($_GPC['cid']);
		$cates = m('shop')->getNoticeCates();
		$condition = ' and uniacid=:uniacid';
		$params = array(':uniacid' => $_W['uniacid']);

		if ($_GPC['status'] != '') {
			$condition .= ' and status=' . intval($_GPC['status']);
		}


		if (!empty($_GPC['keyword'])) {
			$_GPC['keyword'] = trim($_GPC['keyword']);
			$condition .= ' and title  like :keyword';
			$params[':keyword'] = '%' . $_GPC['keyword'] . '%';
		}
		if ($cid > 0)
		{
			$condition .= ' and cate_id =' . $cid;
		}

		$list = pdo_fetchall('SELECT * FROM ' . tablename('ewei_shop_notice') . ' WHERE 1 ' . $condition . '  ORDER BY displayorder DESC limit ' . (($pindex - 1) * $psize) . ',' . $psize, $params);
		$total = pdo_fetchcolumn('SELECT count(*) FROM ' . tablename('ewei_shop_notice') . ' WHERE 1 ' . $condition, $params);
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
		$cid = empty($_GPC['cid']) ? 0 : intval($_GPC['cid']);
		$cates = m('shop')->getNoticeCates();
		if ($_W['ispost']) {
			$data = array('uniacid' => $_W['uniacid'], 'displayorder' => intval($_GPC['displayorder']), 'title' => trim($_GPC['title']), 'thumb' => save_media($_GPC['thumb']), 'link' => trim($_GPC['link']), 'cate_id' => intval($_GPC['cate_id']), 'detail' => m('common')->html_images($_GPC['detail']), 'status' => intval($_GPC['status']), 'createtime' => time());

			if (!empty($id)) {
				pdo_update('ewei_shop_notice', $data, array('id' => $id));
				plog('shop.notice.edit', '修改文章 ID: ' . $id);
			}
			 else {
				pdo_insert('ewei_shop_notice', $data);
				$id = pdo_insertid();
				plog('shop.notice.add', '修改文章 ID: ' . $id);
			}

			show_json(1, array('url' => webUrl('shop/notice', array('cid' => $cid))));
		}


		$notice = pdo_fetch('SELECT * FROM ' . tablename('ewei_shop_notice') . ' WHERE id =:id and uniacid=:uniacid limit 1', array(':id' => $id, ':uniacid' => $_W['uniacid']));
		include $this->template();
	}

	public function displayorder()
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);
		$displayorder = intval($_GPC['value']);
		$item = pdo_fetchall('SELECT id,title FROM ' . tablename('ewei_shop_notice') . ' WHERE id in( ' . $id . ' ) AND uniacid=' . $_W['uniacid']);

		if (!empty($item)) {
			pdo_update('ewei_shop_notice', array('displayorder' => $displayorder), array('id' => $id));
			plog('shop.notice.edit', '修改文章排序 ID: ' . $item['id'] . ' 标题: ' . $item['advname'] . ' 排序: ' . $displayorder . ' ');
		}


		show_json(1);
	}

	public function delete()
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);

		if (empty($id)) {
			$id = ((is_array($_GPC['ids']) ? implode(',', $_GPC['ids']) : 0));
		}


		$items = pdo_fetchall('SELECT id,title FROM ' . tablename('ewei_shop_notice') . ' WHERE id in( ' . $id . ' ) AND uniacid=' . $_W['uniacid']);

		foreach ($items as $item ) {
			pdo_delete('ewei_shop_notice', array('id' => $item['id']));
			plog('shop.notice.delete', '删除文章 ID: ' . $item['id'] . ' 标题: ' . $item['title'] . ' ');
		}

		show_json(1, array('url' => referer()));
	}

	public function status()
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);

		if (empty($id)) {
			$id = ((is_array($_GPC['ids']) ? implode(',', $_GPC['ids']) : 0));
		}


		$items = pdo_fetchall('SELECT id,title FROM ' . tablename('ewei_shop_notice') . ' WHERE id in( ' . $id . ' ) AND uniacid=' . $_W['uniacid']);

		foreach ($items as $item ) {
			pdo_update('ewei_shop_notice', array('status' => intval($_GPC['status'])), array('id' => $item['id']));
		}

		show_json(1, array('url' => referer()));
	}
	
	public function catelist()
	{
		global $_W;
		global $_GPC;
		if (!empty($_GPC['displayorder'])) 
		{
			foreach ($_GPC['displayorder'] as $id => $displayorder ) {
				pdo_update('ewei_shop_notice_cate', array('displayorder' => $displayorder), array('id' => $id));
			}
			show_json(1, array('message' => '分类排序更新成功！',
					'url' => referer()));
		}
	
		$list = m('shop')->getNoticeCates();
		foreach($list as &$row)
		{
			$row['counts'] = pdo_fetchcolumn('select count(*) from '. tablename('ewei_shop_notice') .
							' where cate_id='.$row['id'].'');
			unset($row);
		}
		include $this->template('shop/notice/cate');
	}
	
	public function cateedit()
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);
		if ($_W['ispost']) {
			$data = array(
				'uniacid' => $_W['uniacid'], 
				'title' => trim($_GPC['title']), 
				'enabled' => intval($_GPC['enabled']), 
				'displayorder' => intval($_GPC['displayorder']));
	
			if (!empty($id)) {
				pdo_update('ewei_shop_notice_cate', $data, array('id' => $id, 'uniacid' => $_W['uniacid']));
			}
			 else {
				pdo_insert('ewei_shop_notice_cate', $data);
				$id = pdo_insertid();
			}
			show_json(1, array('url' => webUrl('shop/notice/catelist')));
		}
	
		$item = pdo_fetch('select * from ' . tablename('ewei_shop_notice_cate') . 
				' where id=:id and uniacid=:uniacid limit 1', 
				array(':id' => $id, ':uniacid' => $_W['uniacid']));
		include $this->template('shop/notice/cate');
	}
	
	public function catedel()
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);
		$item = pdo_fetch('SELECT id FROM ' . tablename('ewei_shop_notice_cate') . 
				' WHERE id = \'' . $id . '\' AND uniacid=' . $_W['uniacid'] . '');
	
		if (empty($item)) {
			show_json(0, array('message' => '抱歉，文章分类不存在或是已经被删除！')); 
		}
		pdo_delete('ewei_shop_notice', array('cate_id' => $id));
		pdo_delete('ewei_shop_notice_cate', array('id' => $id));
		show_json(1, array('url' => referer()));
	}
	
	public function qr()
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);
		if (empty($id))
		{
			show_json(0, array('message' => '参数错误'));
		}
		$page = 'pages/article/detail?id=' . $id;
		$qr = m('wxqrcode')->getPathQrcode($page);
		if (empty($qr))
		{
			show_json(0, array('message' => '生成二维码失败'));
		}
		include $this->template('util/qrcode');
	}
}


?>
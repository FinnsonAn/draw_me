<?php
if (!(defined('IN_IA'))) 
{
	exit('Access Denied');
}
class Author_EweiShopV2Page extends PluginWebPage 
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
			$condition .= ' and name  like :keyword';
			$params[':keyword'] = '%' . $_GPC['keyword'] . '%';
		}
		$list = pdo_fetchall('SELECT * FROM ' . tablename('ewei_shop_case_author') . ' WHERE 1 ' . $condition . '  ORDER BY displayorder DESC limit ' . (($pindex - 1) * $psize) . ',' . $psize, $params);
		foreach($list as &$row)
		{
			if ($row['mid'] > 0)
			{
				$row['member'] = m('member')->getMember($row['mid'], 'id, nickname, avatar, realname, mobile');
			}
			
			$row['catename'] = p('case')->getAuthorCate($row['cate']);
		}
		unset($row);
		$total = pdo_fetchcolumn('SELECT count(1) FROM ' . tablename('ewei_shop_case_author') . ' WHERE 1 ' . $condition, $params);
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
		$cates = p('case')->getAuthorCates();
		if ($_W['ispost']) 
		{
			$data = array('uniacid' => $_W['uniacid'],
				 'name'     => trim($_GPC['name']), 
				 'mid'      => intval($_GPC['mid']), 
				 'cate'     => intval($_GPC['cate']), 
				 'desc'     => $_GPC['desc'], 
				 'mobile'   => $_GPC['mobile'], 
				 'content'  => $_GPC['content'], 
				 'enabled'  => intval($_GPC['enabled']), 
				 'displayorder' => intval($_GPC['displayorder']), 
				 'thumb'    => save_media($_GPC['thumb']));
			if (!(empty($id))) 
			{
				pdo_update('ewei_shop_case_author', $data, array('id' => $id));
				plog('case.author.edit', '修改作者 ID: ' . $id);
			}
			else 
			{
				pdo_insert('ewei_shop_case_author', $data);
				$id = pdo_insertid();
				plog('case.author.add', '添加作者 ID: ' . $id);
			}
			show_json(1, array('url' => webUrl('case/author')));
		}
		$item = pdo_fetch('select * from ' . tablename('ewei_shop_case_author') . ' where id=:id and uniacid=:uniacid limit 1', array(':id' => $id, ':uniacid' => $_W['uniacid']));
		if ($item['mid'] > 0)
		{
			$member = m('member')->getMember($item['mid'], 'id, nickname, avatar, realname, mobile');
		}
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
		$items = pdo_fetchall('SELECT id,name FROM ' . tablename('ewei_shop_case_author') . ' WHERE id in( ' . $id . ' ) AND uniacid=' . $_W['uniacid']);
		foreach ($items as $item ) 
		{
			pdo_delete('ewei_shop_case_author', array('id' => $item['id']));
			plog('case.author.delete', '删除作者 ID: ' . $item['id'] . ' 标题: ' . $item['name'] . ' ');
		}
		show_json(1, array('url' => referer()));
	}
	public function displayorder() 
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);
		$displayorder = intval($_GPC['value']);
		$item = pdo_fetchall('SELECT id,name FROM ' . tablename('ewei_shop_case_author') . ' WHERE id in( ' . $id . ' ) AND uniacid=' . $_W['uniacid']);
		if (!(empty($item))) 
		{
			pdo_update('ewei_shop_case_author', array('displayorder' => $displayorder), array('id' => $id));
			plog('case.author.edit', '修改作者排序 ID: ' . $item['id'] . ' 标题: ' . $item['name'] . ' 排序: ' . $displayorder . ' ');
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
		$items = pdo_fetchall('SELECT id,name FROM ' . tablename('ewei_shop_case_author') . ' WHERE id in( ' . $id . ' ) AND uniacid=' . $_W['uniacid']);
		foreach ($items as $item ) 
		{
			pdo_update('ewei_shop_case_author', array('enabled' => intval($_GPC['enabled'])), array('id' => $item['id']));
			plog('case.author.edit', (('修改作者状态<br/>ID: ' . $item['id'] . '<br/>标题: ' . $item['name'] . '<br/>状态: ' . $_GPC['enabled']) == 1 ? '显示' : '隐藏'));
		}
		show_json(1, array('url' => referer()));
	}
	public function query() 
	{
		global $_W;
		global $_GPC;
		$kwd = trim($_GPC['keyword']);
		$params = array();
		$params[':uniacid'] = $_W['uniacid'];
		$condition = ' and uniacid=:uniacid';
		if (!(empty($kwd))) 
		{
			$condition .= ' AND ( `name` LIKE :keyword or `mobile` LIKE :keyword)';
			$params[':keyword'] = '%' . $kwd . '%';
		}
		$ds = pdo_fetchall('SELECT id,name,mobile FROM ' . tablename('ewei_shop_case_author') . ' WHERE 1 ' . $condition . ' order by id desc', $params);
		include $this->template();
	}
}
?>
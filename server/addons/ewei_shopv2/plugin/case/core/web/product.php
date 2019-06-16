<?php
if (!(defined('IN_IA'))) {
	exit('Access Denied');
}

class Product_EweiShopV2Page extends PluginWebPage
{
	public function main()
	{
		global $_W;
		global $_GPC;

		$pindex = max(1, intval($_GPC['page']));
		$psize = 15;
		$condition = ' uniacid = :uniacid ';
		$tab = ((!(empty($_GPC['tab'])) ? trim($_GPC['tab']) : 'sell'));
		
		$params = array(':uniacid' => $_W['uniacid']);

		if (!(empty($_GPC['keyword']))) {
			$_GPC['keyword'] = trim($_GPC['keyword']);
			$condition .= ' AND title LIKE :title';
			$params[':title'] = '%' . trim($_GPC['keyword']) . '%';
		}


		if ($_GPC['cate'] != '') {
			$condition .= ' AND cate = :cate';
			$params[':cate'] = intval($_GPC['cate']);
		}


		$sql = 'SELECT * FROM ' . tablename('ewei_shop_case_product') . ' where  1 and ' . $condition . ' ORDER BY displayorder DESC LIMIT ' . (($pindex - 1) * $psize) . ',' . $psize;
		$list = pdo_fetchall($sql, $params);
		foreach($list as &$row)
		{
			$row['category'] = p('case')->getProductCate($row['cate']);
			$row['author']   = p('case')->getAuthorName($row['author']);
		}
		unset($row);
		$total = pdo_fetchcolumn('SELECT COUNT(*) FROM ' . tablename('ewei_shop_case_product') . ' where 1 and ' . $condition, $params);

		$pager = pagination($total, $pindex, $psize);
		$cates = p('case')->getProductCates();
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
		$cates = p('case')->getProductCates();
		if ($_W['ispost']) 
		{
			$data = array('uniacid' => $_W['uniacid'],
				 'title'     	=> trim($_GPC['title']), 
				 'subtitle'  	=> trim($_GPC['subtitle']), 
				 'cate'     	=> intval($_GPC['cate']), 
				 'isrecommand'  => intval($_GPC['isrecommand']), 
				 'isnew'  		=> intval($_GPC['isnew']), 
				 'ishot'  		=> intval($_GPC['ishot']), 
				 'author'		=> intval($_GPC['author']),
				 'date'			=> strtotime($_GPC['date']),
				 'desc'         => $_GPC['desc'], 
				 'content'      => $_GPC['content'], 
				 'enabled'      => intval($_GPC['enabled']), 
				 'displayorder' => intval($_GPC['displayorder']), 
				 'thumb'        => save_media($_GPC['thumb']));
			
			if (is_array($_GPC['thumbs'])) 
			{
				$thumbs = $_GPC['thumbs'];
				$thumb_url = array();
				foreach ($thumbs as $th ) 
				{
					$thumb_url[] = trim($th);
				}
				$data['thumbs'] = serialize(m('common')->array_images($thumb_url));
			}
			if (!(empty($id))) 
			{
				pdo_update('ewei_shop_case_product', $data, array('id' => $id));
				plog('case.product.edit', '修改作品 ID: ' . $id);
			}
			else 
			{
				$data['createtime'] = time();
				pdo_insert('ewei_shop_case_product', $data);
				$id = pdo_insertid();
				plog('case.product.add', '添加作品 ID: ' . $id);
			}
			// 参数
			$param_ids    = $_POST['param_id'];
			$param_titles = $_POST['param_title'];
			$param_values = $_POST['param_value'];
			$param_displayorders = $_POST['param_displayorder'];
			$len = count($param_ids);
			$paramids = array();
			$k = 0;
			while ($k < $len) 
			{
				$param_id = '';
				$get_param_id = $param_ids[$k];
				$a = array('uniacid' => $_W['uniacid'], 'title' => $param_titles[$k], 'value' => $param_values[$k], 'displayorder' => $k, 'proid' => $id);
				if (!(is_numeric($get_param_id))) 
				{
					pdo_insert('ewei_shop_case_param', $a);
					$param_id = pdo_insertid();
				}
				else 
				{
					pdo_update('ewei_shop_case_param', $a, array('id' => $get_param_id));
					$param_id = $get_param_id;
				}
				$paramids[] = $param_id;
				++$k;
			}
			if (0 < count($paramids)) 
			{
				pdo_query('delete from ' . tablename('ewei_shop_case_param') . ' where proid=' . $id . ' and id not in ( ' . implode(',', $paramids) . ')');
			}
			else 
			{
				pdo_query('delete from ' . tablename('ewei_shop_case_param') . ' where proid=' . $id);
			}
	
			show_json(1, array('url' => webUrl('case/product')));
		}
		$item = pdo_fetch('select * from ' . tablename('ewei_shop_case_product') . ' where id=:id and uniacid=:uniacid limit 1', array(':id' => $id, ':uniacid' => $_W['uniacid']));
		if ($item)
		{
			$params = pdo_fetchall('select * from ' . tablename('ewei_shop_case_param') . ' where proid=:id order by displayorder asc', array(':id' => $id));
			if (!(empty($item['thumbs']))) 
			{
				$piclist = iunserializer($item['thumbs']);
			}
			$item['content'] = m('common')->html_to_images($item['content']);
		}
		
		include $this->template();
	}

	public function delete()
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);

		if (empty($id)) {
			$id = ((is_array($_GPC['ids']) ? implode(',', $_GPC['ids']) : 0));
		}


		$items = pdo_fetchall('SELECT id,title FROM ' . tablename('ewei_shop_case_product') . ' WHERE id in( ' . $id . ' ) AND uniacid=' . $_W['uniacid']);

		foreach ($items as $item ) {
			pdo_update('ewei_shop_case_product', array('deleted' => 1), array('id' => $item['id'], 'uniacid' => $_W['uniacid']));
			plog('case.product.delete', '删除作品 ID: ' . $item['id'] . '  <br/>删除作品: ' . $item['title'] . ' ');
		}

		show_json(1, array('url' => referer()));
	}

	public function enbaled()
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);

		if (empty($id)) {
			$id = ((is_array($_GPC['ids']) ? implode(',', $_GPC['ids']) : 0));
		}


		$enbaled = intval($_GPC['enbaled']);
		$items = pdo_fetchall('SELECT id,enbaled FROM ' . tablename('ewei_shop_case_product') . ' WHERE id in( ' . $id . ' ) AND uniacid=' . $_W['uniacid']);

		foreach ($items as $item ) {
			$enbaled_update = pdo_update('ewei_shop_case_product', array('enbaled' => $enbaled), array('id' => $item['id']));

			if (!($enbaled_update)) {
				throw new Exception('作品状态修改失败！');
			}


			plog('creditshop.goods.edit', '修改作品 ' . $item['id'] . ' <br /> 状态: ' . (($enbaled == 0 ? '隐藏' : '显示')));
		}

		show_json(1, array('url' => referer()));
	}

	public function deleted()
	{
		global $_W;
		global $_GPC;
		$id = intval($_GPC['id']);

		if (empty($id)) {
			$id = ((is_array($_GPC['ids']) ? implode(',', $_GPC['ids']) : 0));
		}


		$items = pdo_fetchall('SELECT id,title FROM ' . tablename('ewei_shop_case_product') . ' WHERE id in( ' . $id . ' ) AND uniacid=' . $_W['uniacid']);

		foreach ($items as $item ) {
			pdo_delete('ewei_shop_case_product', array('id' => $item['id']));
			plog('creditshop.goods.deleted', '从回收站彻底删除商品<br/>ID: ' . $item['id'] . '<br/>商品名称: ' . $item['title']);
		}

		show_json(1, array('url' => referer()));
	}

	
	public function query()
	{
		global $_GPC;
		global $_W;
		$tpl = trim($_GPC['tpl']);
		include $this->template('case/product/tpl/param');
	}
}


?>
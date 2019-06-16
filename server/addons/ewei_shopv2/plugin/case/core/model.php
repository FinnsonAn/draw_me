<?php
if (!(defined('IN_IA'))) {
	exit('Access Denied');
}


if (!(class_exists('CreditshopModel'))) {
	class CaseModel extends PluginModel
	{
		function getAuthorCates()
		{
			global $_W;
			$list = pdo_fetchall('select * from '. tablename('ewei_shop_case_aucate') .
				' where enabled = 1 and uniacid = '. $_W['uniacid'] .
				' order by displayorder desc, id desc ');
			return $list;
		}
		
		function getAuthorCate($id)
		{
			global $_W;
			if (!$id) return;
			$name = pdo_fetchcolumn('select name from '. tablename('ewei_shop_case_aucate') .
				' where id = ' . $id . ' and uniacid = '. $_W['uniacid']);
			return $name;
		}
		
		function getAuthorName($id)
		{
			if (!$id) return;
			$name = pdo_fetchcolumn('select name from '. tablename('ewei_shop_case_author') .
				' where id = ' . $id);
			return $name;
		}
		
		function getAuthor($id, $args = '*')
		{
			if (!$id) return;
			$row = pdo_fetch('select '. $args .' from '. tablename('ewei_shop_case_author') .
				' where id = ' . $id);
			return $row;
		}
		
		/* 检测是否为作者 */
		function checkAuthor($mid)
		{
			$author = 0;
			if ($_SESSION['author'] > 0)
			{
				$author = $_SESSION['author'];
			}
			else
			{
				$data = pdo_fetch('select id from '. tablename('ewei_shop_case_author') .
						' where mid = ' . $mid);
				if ($data)
				{
					$author = $data['id'];
					$_SESSION['author'] = $author;
				}		
			}
			return $author;
		}
		
		function getProductCates()
		{
			global $_W;
			$list = pdo_fetchall('select * from '. tablename('ewei_shop_case_cate') .
				' where enabled = 1 and uniacid = '. $_W['uniacid'] . 
				' order by displayorder desc, id desc ');
			return $list;
		}
		
		function getProductCate($id)
		{
			if (!$id) return;
			$name = pdo_fetchcolumn('select name from '. tablename('ewei_shop_case_cate') .
				' where id = ' . $id);
			return $name;
		}
	}
}


?>
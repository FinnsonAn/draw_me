<?php
if (!(defined('IN_IA'))) 
{
	exit('Access Denied');
}
class Shop_EweiShopV2Model 
{
	public function getCategory($refresh = false) 
	{
		global $_W;
		$allcategory = m('cache')->getArray('allcategory');
		if (empty($allcategory) || $refresh) 
		{
			$parents = array();
			$children = array();
			$category = pdo_fetchall('SELECT * FROM ' . tablename('ewei_shop_category') . ' WHERE uniacid =:uniacid AND enabled=1 ORDER BY parentid ASC, displayorder DESC', array(':uniacid' => $_W['uniacid']));
			foreach ($category as $index => $row ) 
			{
				if (!(empty($row['parentid']))) 
				{
					if ($row[$row['parentid']]['parentid'] == 0) 
					{
						$row[$row['parentid']]['level'] = 2;
					}
					else 
					{
						$row[$row['parentid']]['level'] = 3;
					}
					$children[$row['parentid']][] = $row;
					unset($category[$index]);
				}
				else 
				{
					$row['level'] = 1;
					$parents[] = $row;
				}
			}
			$allcategory = array('parent' => $parents, 'children' => $children);
			m('cache')->set('allcategory', $allcategory);
		}
		return $allcategory;
	}
	public function getFullCategory($fullname = false, $enabled = false) 
	{
		global $_W;
		$allcategorynames = m('cache')->getArray('allcategorynames');
		$shopset = m('common')->getSysset('shop');
		$allcategory = array();
		$sql = 'SELECT * FROM ' . tablename('ewei_shop_category') . ' WHERE uniacid=:uniacid ';
		if ($enabled) 
		{
			$sql .= ' AND enabled=1';
		}
		$sql .= ' ORDER BY parentid ASC, displayorder DESC';
		$category = pdo_fetchall($sql, array(':uniacid' => $_W['uniacid']));
		$category = set_medias($category, array('thumb', 'advimg'));
		if (empty($category)) 
		{
			return array();
		}
		foreach ($category as &$c ) 
		{
			if (empty($c['parentid'])) 
			{
				$allcategory[] = $c;
				foreach ($category as &$c1 ) 
				{
					if ($c1['parentid'] != $c['id']) 
					{
						continue;
					}
					if ($fullname) 
					{
						$c1['name'] = $c['name'] . '-' . $c1['name'];
					}
					$allcategory[] = $c1;
					foreach ($category as &$c2 ) 
					{
						if ($c2['parentid'] != $c1['id']) 
						{
							continue;
						}
						if ($fullname) 
						{
							$c2['name'] = $c1['name'] . '-' . $c2['name'];
						}
						$allcategory[] = $c2;
						foreach ($category as &$c3 ) 
						{
							if ($c3['parentid'] != $c2['id']) 
							{
								continue;
							}
							if ($fullname) 
							{
								$c3['name'] = $c2['name'] . '-' . $c3['name'];
							}
							$allcategory[] = $c3;
						}
						unset($c3);
					}
					unset($c2);
				}
				unset($c1);
			}
			unset($c);
		}
		return $allcategory;
	}
	public function checkClose() 
	{
		if (strexists($_SERVER['REQUEST_URI'], '/web/')) 
		{
			return;
		}
		global $_S;
		global $_W;
		if ($_W['plugin'] == 'mmanage') 
		{
			return;
		}
		$close = $_S['close'];
		if (!(empty($close['flag']))) 
		{
			if (!(empty($close['url']))) 
			{
				header('location: ' . $close['url']);
				exit();
			}
			exit('<!DOCTYPE html>' . "\r\n\t\t\t\t\t" . '<html>' . "\r\n\t\t\t\t\t\t" . '<head>' . "\r\n\t\t\t\t\t\t\t" . '<meta name=\'viewport\' content=\'width=device-width, initial-scale=1, user-scalable=0\'>' . "\r\n\t\t\t\t\t\t\t" . '<title>抱歉，商城暂时关闭</title><meta charset=\'utf-8\'><meta name=\'viewport\' content=\'width=device-width, initial-scale=1, user-scalable=0\'><link rel=\'stylesheet\' type=\'text/css\' href=\'https://res.wx.qq.com/connect/zh_CN/htmledition/style/wap_err1a9853.css\'>' . "\r\n\t\t\t\t\t\t" . '</head>' . "\r\n\t\t\t\t\t\t" . '<body>' . "\r\n\t\t\t\t\t\t" . '<style type=\'text/css\'>' . "\r\n\t\t\t\t\t\t" . 'body { background:#fbfbf2; color:#333;}' . "\r\n\t\t\t\t\t\t" . 'img { display:block; width:100%;}' . "\r\n\t\t\t\t\t\t" . '.header {' . "\r\n\t\t\t\t\t\t" . 'width:100%; padding:10px 0;text-align:center;font-weight:bold;}' . "\r\n\t\t\t\t\t\t" . '</style>' . "\r\n\t\t\t\t\t\t" . '<div class=\'page_msg\'>' . "\r\n\t\t\t\t\t\t\r\n\t\t\t\t\t\t" . '<div class=\'inner\'><span class=\'msg_icon_wrp\'><i class=\'icon80_smile\'></i></span>' . $close['detail'] . '</div></div>' . "\r\n\t\t\t\t\t\t" . '</body>' . "\r\n\t\t\t\t\t" . '</html>');
		}
	}
	public function getAllCategory($refresh = false) 
	{
		global $_W;
		$allcategory = m('cache')->getArray('allcategoryarr');
		if (empty($allcategory) || $refresh) 
		{
			$allcategory = pdo_fetchall('SELECT id,parentid,uniacid,name,thumb FROM ' . tablename('ewei_shop_category') . ' WHERE uniacid = \'' . $_W['uniacid'] . '\'', array(), 'id');
			m('cache')->set('allcategoryarr', $allcategory);
		}
		return $allcategory;
	}
	
	/* 取得幻灯片位置列表 */
	public function getSliderPosition()
	{
		global $_W;
		$list = pdo_fetchall(' select * from '. tablename('ewei_shop_adv_position') .
		                     ' where uniacid = '. $_W['uniacid'] .' order by sort_num desc');
		return $list;					 
	}
	
	/* 取得某个位置下的幻灯片 */
	public function getSliders($position, $limit = 5, $isall = 0)
	{
		global $_W;
		if (!$position) return;
		if ($limit > 0 )
		{
			$sql = ' limit ' . $limit;
		}
		if (!$isall)
		{
			$condition = ' and enabled = 1 ';
		}
		$list = pdo_fetchall(' select * from '. tablename('ewei_shop_adv') .
		                     ' where uniacid = '. $_W['uniacid'] . 
							 ' and position_id =  '. $position .  $condition . 
							 ' and enabled = 1' .
							 ' order by displayorder desc' . $sql);
		$list = set_medias($list, 'thumb,thumb_pc');		 
		return $list;					 
	}
	
	/* 取得幻灯片位置名称 */
	public function getSliderPositionName($id)
	{
		if (!$id)
		{
			return '';
		}
		$name = pdo_fetchcolumn(' select position_name from '. tablename('ewei_shop_adv_position') .
		                        ' where pid = '. $id .'');
	    return $name;
	}
	
	/* 取得广告位置列表 */
	public function getAdvPosition()
	{
		global $_W;
		$list = pdo_fetchall(' select * from '. tablename('ewei_shop_banner_position') .
		                     ' where uniacid = '. $_W['uniacid'] .' order by sort_num desc');
		return $list;					 
	}
	
	/* 取得广告位置名称 */
	public function getAdvPositionName($id)
	{
		if (!$id)
		{
			return false;
		}
		$name = pdo_fetchcolumn(' select position_name from '. tablename('ewei_shop_banner_position') .
		                        ' where pid = '. $id .'');
	    return $name;
	}

	/* 取得某个位置下的广告 */
	public function getAdvs($position, $limit = 0, $isall = 0)
	{
		global $_W;
		if (!$position) return;
		if ($limit > 0 )
		{
			$sql = ' limit ' . $limit;
		}
		if (!$isall)
		{
			$condition = ' and enabled = 1 ';
		}
		$list = pdo_fetchall(' select * from '. tablename('ewei_shop_banner') .
		                     ' where uniacid = '. $_W['uniacid'] . 
							 ' and position_id =  '. $position .  $condition . 
							 ' order by displayorder desc' . $sql);
		$list = set_medias($list, 'thumb,thumb_pc');		 
		return $list;					 
	}
	
	/* 取得导航组列表 */
	public function getNavGroup()
	{
		global $_W;
		$list = pdo_fetchall(' select * from '. tablename('ewei_shop_nav_group') .
		                     ' where uniacid = '. $_W['uniacid'] .' order by sort_num desc');
		foreach($list as &$row)
		{
			$row['counts'] = pdo_fetchcolumn('select count(*) from '. tablename('ewei_shop_nav') .
			           ' where group_id = '. $row['gid'] .'');
		}
		unset($row);
		return $list;					 
	}
	
	/* 取得导航组信息 */
	public function getNavGroupInfo($id)
	{
		global $_W;
		$row = pdo_fetch(' select * from '. tablename('ewei_shop_nav_group') .
		                  ' where uniacid = '. $_W['uniacid'] .' AND gid = ' . $id);
		return $row;					 
	}
	
	/* 取得某个位置下的导航 */
	public function getNavs($group, $limit = 0, $isall = 0)
	{
		global $_W;
		if (!$group) return;
		if ($limit > 0 )
		{
			$sql = ' limit ' . $limit;
		}
		if (!$isall)
		{
			$condition = ' and status = 1 ';
		}
		$list = pdo_fetchall(' select * from '. tablename('ewei_shop_nav') .
		                     ' where uniacid = '. $_W['uniacid'] . 
							 ' and group_id =  '. $group . $condition . 
							 ' order by displayorder desc' . $sql);
		foreach($list as &$row)
		{
			if (!empty($row['data_type']))
			{
				$row['counts'] = m('shop')->getCounts($row['data_type']);
			}
		}
		unset($row);					 
		$list = set_medias($list, 'icon');		 
		return $list;					 
	}
	
	/* 店铺信息 */
	public function getStore($id, $columns = '*')
	{
		global $_W;
		if (!$id)
		{
			return false;
		}
		$data = pdo_fetch("select ". $columns ." from ". tablename('ewei_shop_store') .
					" where uniacid = ". $_W['uniacid'] ." and id = " . $id);
		return $data;
	}
	
	/* 店铺列表 */
	public function getStoreList($columns = '*', $limit = 0)
	{
		if ($limit > 0 )
		{
			$sql = ' limit ' . $limit;
		}
		$list = pdo_fetchall("select ". $columns ." from ". tablename('ewei_shop_store') .
					" where uniacid = ". $_W['uniacid'] . $sql);
		return $list;
	}
	
	/* 统计数据类型 */
	public function countsType()
	{
		return array('credit' => '余额', 'integral' => '积分', 'commission' => '可提现佣金',
					 'consume' => '消费额');
	}
	
	/* 统计数据 */
	public function getCounts($keys)
	{
		$val = 0;
		$openid = m('member')->getOpenid();
		$member = m('member')->getMember($openid, 'credit1, credit2');
		
		if (!$keys){
			return $val;
		}
		switch($keys)
		{
			case 'credit': 
				$val = $member['credit2']; 
				break;
			case 'integral':
				$val = $member['credit1']; 
				break;
			case 'commission':
				$data = round(p('commission')->getInfo($openid, array('commission_ok')), 2);
				$val = round(p('commission')->getInfo($openid, $data['commission_ok']), 2);
				break;
		}
		return $val;
	}
	
	/* 取得版块列表 */
	public function getSectionList()
	{
		global $_W;
		$list = pdo_fetchall(' select * from '. tablename('ewei_shop_section') .
		                     ' where uniacid = '. $_W['uniacid'] .' order by displayorder desc');
	    foreach($list as &$row)
		{
			$row['counts'] = pdo_fetchcolumn('select count(*) from '. tablename('ewei_shop_section_item') .
			           ' where section_id = '. $row['sid'] .'');
		    $type = $this->getSectionType();
		    $row['type'] = $type[$row['section_type']];
			
			unset($row);
		}
		return $list;
	}
	
	
	
	/* 版块类型 */
	public function getSectionType()
	{
		return array(
		    'goods'  => '商品',
			'notice' => '文章',
		);
		
	}
	
	/* 获取版块信息 */
	public function getSection($id)
	{
		global $_W;
		if(!$id)
		{
			return false;
		}
		$data = pdo_fetch(' select * from '. tablename('ewei_shop_section') .
		        		  ' where sid = ' . $id . ' AND uniacid = '. $_W['uniacid']);
		$type = $this->getSectionType();
		$data['type'] = $type[$data['section_type']];
		$sql = ' select count(*) from '. tablename('ewei_shop_section_item') . 
		       ' where section_id = '. $id .' and uniacid = ' . $_W['uniacid'];
		$data['counts'] = pdo_fetchcolumn($sql);
		return $data;
	}
	
	/* wap端首页版块类型列表 */
	public function sectionStyleArr()
	{
		$arr = array('first'   => '左一右二', 
					 'second'  => '左二右一',
					 'seventh' => '上二下三',
					 'third'   => '上一下二',
					 'sixth'   => '上一下三');
					 
		return $arr;
	}
	
	/* wap端首页版块类型 */
	public function getSectionStyle($index)
	{
		$arr = $this->sectionStyleArr();
		return $arr[$index];
	}
	
	/* 取得版块下的图位列表 */
	public function getSectionItems($id, $limit = 0, $all = 0)
	{
		if (!$id)
		{
			return;
		}
		global $_W;
		if ($limit > 0 )
		{
			$limit_sql = ' limit ' . $limit;
		}
		if (!$all)
		{
			$sql = ' and si.enabled = 1';
		}
		$list = pdo_fetchall(' select si.*, s.section_type from '. tablename('ewei_shop_section_item') . ' si ' .
							 ' left join '. tablename('ewei_shop_section') .' s on s.sid = si.section_id' .
		                     ' where si.uniacid = '. $_W['uniacid'] . 
							 ' and si.section_id =  '. $id . $sql .
							 ' order by si.displayorder desc' . $limit_sql);
		foreach ($list as &$row)
		{
			if ($row['data_id'] > 0 && $row['section_type'] == 'goods')
			{
				$column = ' id, marketprice, productprice, thumb, title, sales, '.
				          ' total, issendfree, isdiscount, isrecommand, ishot ';
				$goods = m('goods')->getRow($row['data_id'], $column);
				if (empty($row['title']))
				{
					$row['title'] = $goods['title'];
				}
				if (empty($row['thumb']))
				{
					$row['thumb'] = $goods['thumb'];
				}
				if ($goods['marketprice'])
				{
					$row['marketprice'] = priceFormat1($goods['marketprice']);
				}
				if ($goods['productprice'] > 0)
				{
					$row['productprice'] = priceFormat1($goods['productprice']);
				}
				$final = m('goods')->getFinalPrice($goods['id'], 1);
				if (is_array($final))
				{
					$row['price'] = $final['price'];
				}
				else
				{
					$row['price'] = $final['marketprice'];
				}
				
				if (empty($row['link']))
				{
					$row['auto_link'] = mobileUrl('goods/detail', array('id' => $row['data_id']));;
				}
			}
			unset($row);
		} 
		$list = set_medias($list, 'thumb');		
		return $list;			
	}
	
	/* 取得版块下的单条图位信息 */
	public function getSectionItem($id)
	{
		global $_W;
		if (empty($id)) return;
		$row = pdo_fetch(' select * from '. tablename('ewei_shop_section_item') .
		                 ' where item_id = '. $id .' and uniacid = '. $_W['uniacid'] .'');
	    return $row;
	}
	
	/* 通知分类 */
	public function getNoticeCates()
	{
		global $_W;
		$cates = pdo_fetchall('select * from '. tablename('ewei_shop_notice_cate') .
				 ' where uniacid = '. $_W['uniacid'] . ' order by displayorder desc,id desc');
		return $cates;
	}
	
	/* 通知分类名称 */
	public function getNoticeCatename($id)
	{
		if (!$id) return;
		$title = pdo_fetchcolumn('select title from '. tablename('ewei_shop_notice_cate') .' where id = ' . $id);
		return $title;
	}
	
	/* 帮助文章 */
	public function getHelpCate($all = 0)
	{
		$cateIds = array(2,3,4,5,6);
		$cate_arr = array();
		foreach($cateIds as $k => $id)
		{
			$cate_arr[$k]['title'] = m('shop')->getNoticeCatename($id);
			$cate_arr[$k]['id']   = $id;
		}
		foreach($cate_arr as &$cate)
		{
			if ($all)
			{
				$limit = array();
			}
			else
			{
				$limit = array(4);
			}
			$cate['list'] = $this->getNoticeList($cate['id'], $limit);
		}
		unset($cate);
		return $cate_arr;
	}
	
	/* 取得通知列表 */
	public function getNoticeList($cid, $limit = array(0, 4))
	{
		global $_W;
		if (!$cid) return;
		if (count($limit) > 1)
		{
			$sql = ' limit '. $limit[0] . ',' . $limit[1];
		}
		elseif (count($limit) == 1)
		{
			$sql = ' limit ' . $limit[0];
		}
		$list = pdo_fetchall('select link,id,title from '. tablename('ewei_shop_notice') .
			' where cate_id = '. $cid .' and status = 1 and uniacid = ' . $_W['uniacid'] .
			' order by displayorder desc, id desc ' . $sql);
		foreach ($list as &$row)
		{
			if ($row['link'])
			{
				$row['url'] = $row['link'];
			}
			else
			{
				$row['url'] = mobileUrl('entry/shop/notice', array('id' => $row['id']));
			}

		}
		unset($row);
		
		return $list;
		
	}
	
	/* 取得分类的列 */
	public function getCategoryColumn($id, $column)
	{
		global $_W;
		if (!$id) return;
		$column = pdo_fetchcolumn('select '. $column .' from '. tablename('ewei_shop_category') .
				  'where id = ' . $id . 'and uniacid = '. $_W['uniacid']);
		return $column;
	}
	
	/* 取得一条分类信息 */
	public function getCateInfo($id)
	{
		global $_W;
		if (!$id) return;
		$row = pdo_fetch('select * from '. tablename('ewei_shop_category') .
				  'where id = ' . $id .' and uniacid = '. $_W['uniacid']);
	    $row['thumb'] 	  = tomedia($item['thumb']);
		$row['advimg_pc'] = tomedia($item['advimg_pc']);
		$row['advimg']    = tomedia($item['advimg']);
		$row['icon']      = tomedia($item['icon']);
		return $row;
	}
	
	/* 取得某个分类下子分类列表 */
	public function getCategoryList($pid, $limit = 0, $isall = 0, $condition = '')
	{
		global $_W;
		
		if ($limit > 0)
		{
			$limit_sql = 'limit ' . $limit;
		}
		if (!$isall)
		{
			$where_sql = ' and enabled = 1 ';
		}
		$list = pdo_fetchall(' select * from '. tablename('ewei_shop_category') .
		                     ' where uniacid = '. $_W['uniacid'] .' and parentid =  '.
							 $pid . $where_sql . $condition . 'and uniacid = '. $_W['uniacid'] 
							 . ' order by displayorder desc ' . $limit_sql);
		foreach($list as &$item)
		{
			$item['icon'] = tomedia($item['icon']);
			$item['thumb'] = tomedia($item['thumb']);
			$item['url'] = mobileUrl('shop/list', array('cid' => $item['id']));
			unset($item);
		}
		return $list;
	}
	
	/* 取得分类树 */
	public function getCategoryTree()
	{
		$category = $this->getCategoryList(0);
		foreach ($category as &$c)
		{
			$children = $this->getCategoryList($c['id']);
			if (count($children) > 0)
			{
				$condition = ' and ishome = 1';
				foreach($children as &$child)
				{
					$child['children'] = $this->getCategoryList($child['id'], 0, 0, $condition);
					unset($child);
				}
			}
			//$c['brands'] = m('goods')->getBrands(8, ' and cate_id='.$c['id']);
			$c['children'] = $children;
			unset($c);
		}
		return $category;
	}
	
	/* 支付方式列表 */
	public function paytypeArr()
	{
		$arr = array(
			0  => array('css' => 'default', 'name' => '未支付',    'payment' => 'unpay'),
			1  => array('css' => 'danger', 'name' => '余额支付',   'payment' => 'credit'),
			2  => array('css' => 'danger', 'name' => '在线支付',   'payment' => 'online'),
			3  => array('css' => 'primary', 'name' => '货到付款',  'payment' => 'cash'),
			4  => array('css' => 'primary', 'name' => '线下支付',  'payment' => 'offline'),
			11 => array('css' => 'default', 'name' => '后台付款',  'payment' => 'admin'),
			21 => array('css' => 'success', 'name' => '微信支付',  'payment' => 'wechat'),
			22 => array('css' => 'warning', 'name' => '支付宝支付', 'payment' => 'alipay'),
			23 => array('css' => 'warning', 'name' => '银联支付', ' payment' => 'bankcard'),
		);
		return $arr;
	}
	
	/* 得到支付方式 */
	public function getPaymentByIndex($index)
	{
		$arr = array(
			0  => array( 'name' => '未支付',    'payment' => 'unpay'),
			1  => array( 'name' => '余额支付',   'payment' => 'credit'),
			2  => array( 'name' => '在线支付',   'payment' => 'online'),
			3  => array( 'name' => '货到付款',  'payment' => 'cash'),
			4  => array( 'name' => '线下支付',  'payment' => 'offline'),
			11 => array( 'name' => '后台付款',  'payment' => 'admin'),
			21 => array( 'name' => '微信支付',  'payment' => 'wechat'),
			22 => array( 'name' => '支付宝支付', 'payment' => 'alipay'),
			23 => array( 'name' => '银联支付', ' payment' => 'bankcard'),
		);
		return $arr[$index];
	}
	
	/* 得到支付方式 */
	public function getPaymentByKeys($keys)
	{
		$arr = array(
			'unpay'  => array( 'name' => '未支付',    'type' => 0),
			'credit' => array( 'name' => '余额支付',  'type' => 1),
			'online' => array( 'name' => '在线支付',  'type' => 2),
			'cash'   => array( 'name' => '货到付款',  'type' => 3),
			'offline' => array( 'name' => '线下支付', 'type' => 4),
			'admin'  => array( 'name' => '后台付款',   'type' => 11),
			'wechat' => array( 'name' => '微信支付',  'type' => 21),
			'alipay' => array( 'name' => '支付宝支付', 'type' => 22),
			'bankcard' => array( 'name' => '银联支付', ' type' => 23),
		);
		return $arr[$keys];
	}
	
	/* 支付方式 */
	public function payments()
	{
		return array(
			'wechat'   => '微信',
			'alipay'   => '支付宝',
			'bankcard' => '银行卡',
			'cash'     => '现金',
		);
	}
	
	/* 得到支付方式 */
	public function getPayment($key)
	{
		$arr = $this->payments();
		return $arr[$key];
	}
	
	/* 提现方式 */
	public function withdrawType($type)
	{
		$pay_arr = array(0=> '余额', 1 => '微信', 2 => '支付宝', 3 => '银行卡');
		return $pay_arr[$type];
	}
	
	/* 网站类型 */
	public function getWebtype()
	{
		$arr = array(0=> '商城类', 1 => '订餐类', 2 => '服务预约类', 3 => '家装类');
		return $arr;
	}
}
?>
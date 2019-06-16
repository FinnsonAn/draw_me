<?php
if (!defined('IN_IA')) {
	exit('Access Denied');
}
global $_GPC, $_W;
$op = $_GPC['op'];
$uniacid = $_W['uniacid'];
$res = array();

/* 商品列表 */
if ($op == 'list')
{
	$shopset = m('common')->getSysset('shop');
	if ($_GPC['cid'])
	{
		$cid = intval($_GPC['cid']);
		if ($cid == -1)
		{
			$floor1_cates = m('shop')->getCategoryList(0);
			$cid = $floor1_cates[0]['id'] ? intval($floor1_cates[0]['id']) : 0;
		}
		if ($cid > 0)
		{
			/* 分类详情 */
			$cateInfo = m('shop')->getCateInfo($cid);
			$res['cateInfo'] = $cateInfo;
			$search['cid'] = $cid;
			if ($cateInfo['level'] == 1)
			{
				$condition .= ' and (g.pcate = ' . $cid . ' or  FIND_IN_SET(' . $cid . ', g.pcates)<>0 ) ';
			}
			if ($cateInfo['level'] == 2)
			{
				$condition .= ' and (g.ccate = ' . $cid . ' or  FIND_IN_SET(' . $cid . ', g.ccates)<>0 ) ';
			}
			elseif ($cateInfo['level'] == 3)
			{
				$condition .= ' and (g.tcate = ' . $cid . ' or  FIND_IN_SET(' . $cid . ', g.tcates)<>0 ) ';
			}
		}
	}
	
	$condition .= ' and g.uniacid = '. $uniacid .' AND g.deleted = 0 and g.status=1 and g.checked = 0';
	/* 其他参数 */
	$args = $_GPC;
	
	/* 关键词 */
	if (!empty(trim($args['keys'])))
	{
		$keywords_sql = '';
		$args['keys'] = htmlspecialchars(trim($args['keys']));
		$search['keys'] = $args['keys'];
		if (!empty($args['keys']))
		{
			$arr = array();
			if (stristr($args['keys'], ' AND ') !== false)
			{
				/* 检查关键字中是否有AND，如果存在就是并 */
				$arr        = explode('AND', $args['keys']);
				$operator   = " AND ";
			}
			elseif (stristr($args['keys'], ' OR ') !== false)
			{
				/* 检查关键字中是否有OR，如果存在就是或 */
				$arr        = explode('OR', $args['keys']);
				$operator   = " OR ";
			}
			elseif (stristr($args['keys'], ' + ') !== false)
			{
				/* 检查关键字中是否有加号，如果存在就是或 */
				$arr        = explode('+', $args['keys']);
				$operator   = " OR ";
			}
			else
			{
				/* 检查关键字中是否有空格，如果存在就是并 */
				$arr        = explode(' ', $args['keys']);
				$operator   = " AND ";
			}
	
			$keywords_sql = 'AND (';
			$goods_ids = array();
			foreach ($arr as $key => $val)
			{
				if (!$val)
				{
					continue;
				}
				if ($key > 0 && $key < count($arr) && count($arr) > 1)
				{
					$keywords_sql .= $operator;
				}
				$keywords_sql  .= " (g.title LIKE '%". $val ."%' OR g.goodssn LIKE '%". $val ."%' OR g.description LIKE '%". 
						$val . "%' OR g.labelname LIKE '%". $val ."%')";
			}
			$keywords_sql .= ')';
		}
		if ($keywords_sql != '')
		{
			$condition  .= $keywords_sql;
		}
	}

	/*  品牌搜索 */
	if (!empty($args['brand']))
	{
		$search['brand'] = $args['brand'];
		$condition .= ' and g.brand_id in (' . $search['brand'] . ')';
		
	}
	
	/* 指定id */
	if (!empty($args['ids'])) 
	{
		$search['ids'] = $args['ids'];
		$condition .= ' and g.id in ( ' . $args['ids'] . ')';
	}
	// 是否新品
	$isnew = ((!empty($args['isnew']) ? 1 : 0));
	if (!empty($isnew)) {
		$search['isnew'] = $isnew;
		$condition .= ' and g.isnew=1';
	}
	// 是否热销
	$ishot = ((!empty($args['ishot']) ? 1 : 0));
	if (!empty($ishot)) {
		$search['ishot'] = $ishot;
		$condition .= ' and g.ishot=1';
	}
	// 是否推荐
	$isrecommand = ((!empty($args['isrecommand']) ? 1 : 0));
	if (!empty($isrecommand)) {
		$search['isrecommand'] = $isrecommand;
		$condition .= ' and g.isrecommand=1';
	}
	// 是否促销
	$isdiscount = ((!empty($args['isdiscount']) ? 1 : 0));
	if (!empty($isdiscount)) {
		$search['isdiscount'] = $isdiscount;
		$condition .= ' and g.isdiscount=1';
	}
	// 是否置顶
	$istop = ((!empty($args['istop']) ? 1 : 0));
	if (!empty($istop)) {
		$search['istop'] = $istop;
		$condition .= ' and g.istop=1';
	}
	// 限时购
	$istime = ((!empty($args['istime']) ? 1 : 0));
	if (!empty($istime)) {
		$search['istime'] = $istime;
		$condition .= ' and g.istime=1 and ' . time() . '>=g.timestart and ' . time() . '<=g.timeend';
	}
	// 所属类型
	$attr_type = ((!empty($args['attr_type']) ? 1 : 0));
	if (!empty($attr_type)) {
		$search['attr_type'] = $attr_type;
		$condition .= ' and g.attr_type='. $attr_type .'';
	}
	
	/* 价格区间 */
	$minprice = intval($_GPC['minprice']);
	$maxprice = intval($_GPC['maxprice']);

	if (!empty($maxprice)) 
	{
		$search['maxprice'] = $maxprice;
		$condition .= ' AND g.marketprice <= ' . $maxprice;
	}
	
	if (!empty($minprice)) 
	{
		$search['minprice'] = $minprice;
		$condition .= ' AND g.marketprice >= ' . $minprice;
	}

	/* 排序 */
	$sort = trim(strtolower($args['ssort']));
	$sort_sql = '';
	if ($sort != '')
	{
		$order = !empty($args['order']) ? $args['order'] : 'desc';
		$search['ssort']  = $sort;
		$search['order'] = $order;
		switch($args['ssort'])
		{
			case 'sale':
				$sort_sql = ' order by (g.sales+g.salesreal)' . $order; break;
			case 'time':
				$sort_sql = ' order by g.updatetime ' . $order; break;
			case 'price':
				$sort_sql = ' order by g.marketprice ' . $order; break;
			default:
				$sort_sql = ' order by g.istop desc, g.displayorder desc, g.id desc'; break;
		}
		$sort_sql .= ', g.id desc ';

	}
	else
	{
		$sort_sql = ' order by g.istop desc, g.displayorder desc, g.id desc';
	}

	/* 每页显示数量 */
	$psize = 10;
	$columns = ' g.thumb, g.marketprice, g.productprice, g.title, g.subtitle, g.thumb, g.id, g.sales, g.salesreal, g.meetingprice, ' . 
			   ' g.isdiscount, g.isdiscount_title, g.discount_fromtime, g.discount_totime, g.discount_type, g.discount_price,' .
			   ' g.discount_per, g.tiny_thumb ';
	$total = pdo_fetchcolumn('SELECT count(*) FROM ' . tablename('ewei_shop_goods') . 
			' as g where 1 ' . $condition);
	$pindex = max(1, intval($_GPC['page']));
	$pager = pagination($total, $pindex, $args['pagesize']);
	$sql = ' select '. $columns .' from '. tablename('ewei_shop_goods') .' g where 1 '. $condition .  
		   $sort_sql . ' limit '. (($pindex - 1) * $psize) . ',' . $psize;

	$goods = pdo_fetchall($sql);
	foreach($goods as &$row)
	{
		if ($row['thumb'])
		{
			$row['thumb'] = tomedia($row['thumb']);
		}
		if ($row['tiny_thumb'])
		{
			$row['tiny_thumb'] = tomedia($row['tiny_thumb']);
		}
		else
		{
			$row['tiny_thumb'] = tomedia($shopset['nothumb']);
		}
		if ($row['marketprice'])
		{
			$row['marketprice'] = round($row['marketprice'], 2);
		}
		if ($row['productprice'])
		{
			$row['productprice'] = round($row['productprice'], 2);
			if ($row['productprice'] > 0)
			{
				$row['discount'] = round($row['marketprice'] / $row['productprice'], 2) * 10;
			}
			else
			{
				$row['discount'] = 10;
			}

		}
		
		/* 价格 */
		if ($row['meetingprice'])
		{
			$row['price'] = '面议';
		}
		else
		{
			// 最终价
			$final = m('goods')->getFinalPrice($row['id'], 1);
			if (is_array($final))
			{
				$row['price'] = $final['price'];
			}
			else
			{
				$row['price'] = $final['marketprice'];
			}
		}
		$row['sales'] = abs($row['sales']);
		$row['sales'] += $row['salesreal'];
		$row['carttotal'] = pdo_fetchcolumn('select total from '. tablename('ewei_shop_member_cart') .
							' where goodsid=:id and openid=:openid and deleted=0 and  uniacid=:uniacid   limit 1', 
							array(':uniacid' => $_W['uniacid'], ':openid' => $_W['openid'], ':id' => $row['id']));
	}
	unset($row);
	
	
	$res['list'] = $goods;
	$res['page'] = $pindex;
	
	$this->result(0, '', $res);
}
?>
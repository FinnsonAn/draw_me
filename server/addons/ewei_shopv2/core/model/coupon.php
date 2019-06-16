<?php
if (!(defined('IN_IA'))) {
	exit('Access Denied');
}

class Coupon_EweiShopV2Model
{
	
	protected function merchData() 
	{
		$merch_plugin = p('merch');
		$merch_data = m('common')->getPluginset('merch');
		if ($merch_plugin && $merch_data['is_openmerch']) 
		{
			$is_openmerch = 1;
		}
		else 
		{
			$is_openmerch = 0;
		}
		return array('is_openmerch' => $is_openmerch, 'merch_plugin' => $merch_plugin, 'merch_data' => $merch_data);
	}
	
	public function getcoupon($cateid = 0, $merchid = 0, $limit = array()) 
	{
		global $_W;
		$merchdata = $this->merchData();
		extract($merchdata);
		$time = time();
		$param = array();
		$param[':uniacid'] = $_W['uniacid'];
		$sql = 'select id,timelimit,coupontype,timedays,timestart,timeend,couponname,enough,backtype,deduct,discount,backmoney,backcredit,backredpack,bgcolor,thumb,credit,money,getmax,merchid,total as t,tagtitle,settitlecolor,titlecolor  from ' . tablename('ewei_shop_coupon');
		$sql .= ' where uniacid=:uniacid';
	
		if ($is_openmerch == 0) 
		{
			$sql .= ' and merchid=0';
		}
		else if (!(empty($_GPC['merchid']))) 
		{
			$sql .= ' and merchid=:merchid';
			$param[':merchid'] = intval($_GPC['merchid']);
		}
		
		$plugin_com = p('commission');
		if ($plugin_com) 
		{
			$plugin_com_set = $plugin_com->getSet();
			if (empty($plugin_com_set['level'])) 
			{
				$sql .= ' and ( limitagentlevels = "" or  limitagentlevels is null )';
			}
		}
		else 
		{
			$sql .= ' and ( limitagentlevels = "" or  limitagentlevels is null )';
		}
		$plugin_globonus = p('globonus');
		if ($plugin_globonus) 
		{
			$plugin_globonus_set = $plugin_globonus->getSet();
			if (empty($plugin_globonus_set['open'])) 
			{
				$sql .= ' and ( limitpartnerlevels = ""  or  limitpartnerlevels is null )';
			}
		}
		else 
		{
			$sql .= ' and ( limitpartnerlevels = ""  or  limitpartnerlevels is null )';
		}
		$plugin_abonus = p('abonus');
		if ($plugin_abonus) 
		{
			$plugin_abonus_set = $plugin_abonus->getSet();
			if (empty($plugin_abonus_set['open'])) 
			{
				$sql .= ' and ( limitaagentlevels = "" or  limitaagentlevels is null )';
			}
		}
		else 
		{
			$sql .= ' and ( limitaagentlevels = "" or  limitaagentlevels is null )';
		}
		$sql .= ' and gettype=1 and (total=-1 or total>0) and ( timelimit = 0 or  (timelimit=1 and timeend>unix_timestamp()))';
		if (!(empty($cateid))) 
		{
			$sql .= ' and catid=' . $cateid;
		}
		$sql .= ' order by displayorder desc, id desc ';
		if ($limit[0] > 0)
		{
			$sql .= ' limit ' . $limit[0];
		}
		if ($limit[1] > 0)
		{
			$sql .= ',' . $limit[1];
		}
		$coupons = set_medias(pdo_fetchall($sql, $param), 'thumb');
		if (empty($coupons)) 
		{
			$coupons = array();
		}
		$coupons = $this->formated($coupons);
		return $coupons;
	}
	
	/* 某优惠券是否有已领取未使用的 */
	public function hasUnused($couponid, $openid)
	{
		global $_W;
		$total = 0;
		if (!$couponid || empty($openid))
		{
			return $total;
		}
		$total = pdo_fetchcolumn('select count(*) from '. tablename('ewei_shop_coupon_data') .
			'where openid = \' '. $openid .'\' and uniacid = '. $_W['uniacid'] .' and couponid = '. $couponid .'
			 and used =0');
		return $total;	
	}
	
	/* 优惠券标题说明处理 */
	public function formated($coupons)
	{
		foreach ($coupons as $i => &$row ) 
		{
			$row = com('coupon')->setCoupon($row, $time);
			$last = com('coupon')->get_last_count($row['id']);
			$row['contype'] = 2;
			if ($row['t'] != -1) 
			{
				if ($last <= 0) 
				{
					$row['last'] = 0;
					$row['isdisa'] = '1';
				}
				else 
				{
					$totle = $row['t'];
					$row['last'] = $last;
					$row['lastratio'] = intval(($last / $totle) * 100);
				}
			}
			else 
			{
				$row['last'] = 1;
				$row['lastratio'] = 100;
			}
			
			/* 是否被领取 */
			$mytotal = $this->hasUnused($coupon['id'], $_W['openid']);
			if ($mytotal > 0)
			{
				$row['isget'] = 1;
			}
			$title2 = '';
			$title3 = '';
			$title4 = '';
			$tagtitle = '';
			if ($row['coupontype'] == '0') 
			{
				if (0 < $row['enough']) 
				{
					$title2 = '满' . (double) $row['enough'] . '元可用';
				}
				else 
				{
					$title2 = '无限制金额';
				}
			}
			else if ($row['coupontype'] == '1') 
			{
				if (0 < $row['enough']) 
				{
					$title2 = '充值满' . (double) $row['enough'] . '元可用';
				}
				else 
				{
					$title2 = '无限制金额';
				}
			}
			if ($row['coupontype'] == '2') 
			{
				if (0 < $row['enough']) 
				{
					$title2 = '满' . (double) $row['enough'] . '元可用';
				}
				else 
				{
					$title2 = '无限制金额';
				}
			}
			if ($row['backtype'] == 0) 
			{
				$title3 = '<span class="subtitle">￥</span>' . (double) $row['deduct'];
				if ($row['enough'] == '0') 
				{
					$title5 = '消费任意金额立减' . (double) $row['deduct'];
					$row['color'] = 'orange ';
					$tagtitle = '代金券';
				}
				else 
				{
					$title5 = '消费满' . (double) $row['enough'] . '立减' . (double) $row['deduct'];
					$row['color'] = 'blue';
					$tagtitle = '满减券';
				}
				$unit = '元';
				$val = $row['deduct'];
			}
			else if ($row['backtype'] == 1) 
			{
				$row['color'] = 'red ';
				$title3 = (double) $row['discount'] . '<span class="subtitle"> 折</span> ';
				$tagtitle = '折扣券';
				if ($row['enough'] == '0') 
				{
					$title5 = '消费任意金额' . '打' . (double) $row['discount'] . '折';
				}
				else 
				{
					$title5 = '消费满' . (double) $row['enough'] . '打' . (double) $row['discount'] . '折';
				}
				$unit = '折';
				$val = $row['discount'];
			}
			else if ($row['backtype'] == 2) 
			{
				if ($row['coupontype'] == '0') 
				{
					$row['color'] = 'red ';
					$tagtitle = '购物返现券';
				}
				else if ($row['coupontype'] == '1') 
				{
					$row['color'] = 'pink ';
					$tagtitle = '充值返现券';
				}
				else if ($row['coupontype'] == '2') 
				{
					$row['color'] = 'red ';
					$tagtitle = '购物返现券';
				}
				if ($row['enough'] == '0') 
				{
					$title5 = '消费任意金额';
				}
				else 
				{
					$title5 = '消费满' . (double) $row['enough'];
				}
				if (!(empty($row['backmoney'])) && (0 < $row['backmoney'])) 
				{
					$title3 = '返' . $row['backmoney'] . '元';
					$title5 = $title5 . '立返 '. $row['backmoney'] .'元';
					$unit = '元';
					$val = $row['backmoney'];
				}
				else if (!(empty($row['backcredit'])) && (0 < $row['backcredit'])) 
				{
					$title3 = '返' . $row['backcredit'] . '积分';
					$title5 = $title5 . '立返'. $row['backcredit'] .'积分';
					$unit = '积分';
					$val = $row['backcredit'];
				}
				else if (!(empty($row['backredpack'])) && (0 < $row['backredpack'])) 
				{
					$title3 = '返' . $row['backcredit'] . '元红包';
					$title5 = $title5 . '立返'. $row['backredpack'] .'红包';
					$unit = '元红包';
					$val = $row['backredpack'];
				}
			}
			if ($row['tagtitle'] == '') 
			{
				$row['tagtitle'] = $tagtitle;
			}
			if ($row['timestr'] == '0') 
			{
				$title4 = '永久有效';
			}
			else if ($row['timestr'] == '1') 
			{
				$title4 = '即' . $row['gettypestr'] . '日内' . $row['timedays'] . '天有效';
			}
			else 
			{
				$title4 = $row['timestr'];
			}
			$row['moneylimit'] = $title2;
			$row['shorttitle'] = $title3;
			$row['timestr']    = $title4;
			$row['longtitle']  = $title5;
			$row['val'] = $val;
			$row['unit'] = $unit;
		}
		unset($row);
		return $coupons;
	}
	
	/* 验证优惠券是否合法 */
	function validateCoupon($cid, $openid)
	{
		global $_W;
		$coupon = pdo_fetch('select d.used, c.timelimit, c.timeend from '. tablename('ewei_shop_coupon_data') .
					' as d left join '. tablename('ewei_shop_coupon') .' as c on d.couponid = c.id '.
					' where d.id = '. $cid .' and d.openid = \''. $openid .'\' and d.uniacid=' . $_W['uniacid'] . '');
		if (!$coupon)
		{
			return array(0, '没有找到该优惠券');
		}
		if ($coupon['used'])
		{
			return array(0, '该优惠券已被使用');
		}
		if ($coupon['timelimit'] == 1 && $row['timeend'] < time())
		{
			return array(0, '该优惠券已过期，无法使用');
		}
		return array(1);
	}
	
}

?>
<?php
if (!defined('IN_IA')) {
	exit('Access Denied');
}
global $_GPC, $_W;
$op = $_GPC['op'];
$res = array();

/* 检测登录状态 */
if (m('account')->checkWxappLogin())
{
	$this->result(1, '请先登录');
}

$openid = m('member')->getOpenid();

if ($op == 'list')
{
	$status = $_GPC['status'] ? intval($_GPC['status']) : 0;
	$check = 0;
	$past = 0;
	if ($status > 0) 
	{
		if ($status == 1) 
		{
			$used = 1;
			$check = 1;
		}
		else 
		{
			$past = 1;
			$check = 2;
		}
	}
	$pindex = max(1, intval($_GPC['page']));
	$psize = 10;
	$time = time();
	$sql = 'select d.id,d.couponid,d.gettime,c.timelimit,c.coupontype,c.timedays,c.timestart,c.timeend,c.thumb,c.couponname,c.enough,c.backtype,c.deduct,c.discount,c.backmoney,c.backcredit,c.backredpack,c.bgcolor,c.thumb,c.merchid,c.tagtitle,c.settitlecolor,c.titlecolor from ' . tablename('ewei_shop_coupon_data') . ' d';
	$sql .= ' left join ' . tablename('ewei_shop_coupon') . ' c on d.couponid = c.id';
	$sql .= ' where d.openid=:openid and d.uniacid=:uniacid ';
	// 已过期
	if (!(empty($past))) 
	{
		$sql .= ' and  ( (c.timelimit =0 and c.timedays<>0 and  c.timedays*86400 + d.gettime <unix_timestamp()) or (c.timelimit=1 and c.timeend<unix_timestamp() ))';
	}
	// 已使用
	else if (!(empty($used))) 
	{
		$sql .= ' and d.used =1 ';
	}
	// 未使用
	else if (empty($used)) 
	{
		$sql .= ' and (   (c.timelimit = 0 and ( c.timedays=0 or c.timedays*86400 + d.gettime >=unix_timestamp() ) )  or  (c.timelimit =1 and c.timeend>=' . $time . ')) and  d.used =0 ';
	}
	$total = pdo_fetchcolumn($sql, array(':openid' => $openid, ':uniacid' => $_W['uniacid']));
	$sql .= ' order by d.gettime desc  LIMIT ' . (($pindex - 1) * $psize) . ',' . $psize;
	$coupons = set_medias(pdo_fetchall($sql, array(':openid' => $openid, ':uniacid' => $_W['uniacid'])), 'thumb');
	pdo_update('ewei_shop_coupon_data', array('isnew' => 0), array('uniacid' => $_W['uniacid'], 'openid' => $_W['openid']));
	if (empty($coupons)) 
	{
		$coupons = array();
	}
	foreach ($coupons as $i => &$row ) 
	{
		$row = com('coupon')->setMyCoupon($row, $time);
		$title2 = '';
		$row['typestr'] = com('coupon')->couponType($row['coupontype'], $row['backtype']);
		if ($row['coupontype'] == '0') 
		{
			if (0 < $row['enough']) 
			{
				$title2 = '满' . (double) $row['enough'] . '元可用';
				$title5 = '消费满' . (double) $row['enough'];
			}
			else 
			{
				$title2 = '无金额门槛';
				$title5 = '消费任意金额';
			}
		}
		else if ($row['coupontype'] == '1') 
		{
			if (0 < $row['enough']) 
			{
				$title2 = '充值满' . (double) $row['enough'] . '元可用';
				$title5 = '充值满' . (double) $row['enough'];
			}
			else 
			{
				$title2 = '无金额门槛';
				$title5 = '充值任意金额';
			}
		}
		else if ($row['coupontype'] == '2') 
		{
			if (0 < $row['enough']) 
			{
				$title2 = '满' . (double) $row['enough'] . '元可用';
				$title5 = '消费满' . (double) $row['enough'];
			}
			else 
			{
				$title2 = '无金额门槛';
				$title5 = '消费任意金额';
			}
		}
		if ($row['backtype'] == 0) 
		{
			$title3 = '<span class="subtitle">￥</span>' . (double) $row['deduct'];
			$title5 = $title5 . '立减' . (double) $row['deduct'];
			$row['val'] = round($row['deduct'], 0) . '元';
			if ($row['enough'] == '0') 
			{
				$row['color'] = 'orange';
			}
			else 
			{
				$row['color'] = 'blue';
			}
		}
		if ($row['backtype'] == 1) 
		{
			$row['color'] = 'red ';
			$row['val'] = $row['discount'] . '折 ';
			$title3 = (double) $row['discount'] . '折 ';
			$title5 = $title5 . '打' . (double) $row['discount'] . '折 ';
		}
		if ($row['backtype'] == 2) 
		{
			if ($row['coupontype'] == '0') 
			{
				$row['color'] = 'red ';
			}
			else if ($row['coupontype'] == '1') 
			{
				$row['color'] = 'pink ';
			}
			else if ($row['coupontype'] == '2') 
			{
				$row['color'] = 'red ';
			}
			if (!(empty($row['backmoney'])) && (0 < $row['backmoney'])) 
			{
				
				$title3 = '立返';
				$title5 = '立返余额';
			}
			if (!(empty($row['backcredit'])) && (0 < $row['backcredit'])) 
			{
				$title3 = '立返';
				$title5 = '立返积分';
			}
			if (!(empty($row['backredpack'])) && (0 < $row['backredpack'])) 
			{
				$title3 = '立返';
				$title5 = '立返红包';
			}
			$row['val'] = $row['backstr'] . round($row['_backmoney']);
		}
		if ($row['tagtitle'] == '') 
		{
			$row['tagtitle'] = $tagtitle;
		}
		if ($past == 1) 
		{
			$row['color'] = 'disa';
		}
		if ($row['timestr'] == '')
		{
			$row['timestr1'] = '永久有效';
		}
		elseif ($row['past'])
		{
			$row['timestr1'] = '已过期';
		}
		else
		{
			$row['timestr1'] = $row['timestr'];
		}
		$row['check'] = $check;
		$row['title2'] = $title2;
		$row['title3'] = $title3;
		$row['title5'] = $title5;
	}
	unset($row);
	$res['list'] = $coupons;
	$res['page'] = $pindex;
}

elseif ($op == 'detail')
{
	$id = intval($_GPC['id']);
	$data = pdo_fetch('select * from ' . tablename('ewei_shop_coupon_data') . ' where id=:id and uniacid=:uniacid limit 1', array(':id' => $id, ':uniacid' => $_W['uniacid']));
	if (empty($data)) 
	{
		if (empty($coupon)) 
		{
			$this->result(1, '没有相关数据');
		}
	}
	$coupon = pdo_fetch('select * from ' . tablename('ewei_shop_coupon') . ' where id=:id and uniacid=:uniacid limit 1', array(':id' => $data['couponid'], ':uniacid' => $_W['uniacid']));
	if (empty($coupon)) 
	{
		$this->result(1, '没有相关数据');
	}
	$coupon['gettime'] = $data['gettime'];
	$coupon['back'] = $data['back'];
	$coupon['backtime'] = $data['backtime'];
	$coupon['used'] = $data['used'];
	$coupon['usetime'] = $data['usetime'];
	$time = time();
	$coupon = com('coupon')->setMyCoupon($coupon, $time);
	$commonset = m('common')->getPluginset('coupon');
	if ($coupon['descnoset'] == '0') 
	{
		if ($coupon['coupontype'] == '0') 
		{
			$coupon['desc'] = $commonset['consumedesc'];
		}
		else if ($coupon['coupontype'] == '1') 
		{
			$coupon['desc'] = $commonset['rechargedesc'];
		}
		else 
		{
			$coupon['desc'] = $commonset['consumedesc'];
		}
	}
	$title2 = '';
	$title3 = '';
	if ($coupon['coupontype'] == '0') 
	{
		if (0 < $coupon['enough']) 
		{
			$title2 = '满' . (double) $coupon['enough'] . '元';
		}
		else 
		{
			$title2 = '购物任意金额';
		}
	}
	else if ($coupon['coupontype'] == '1') 
	{
		if (0 < $coupon['enough']) 
		{
			$title2 = '充值满' . (double) $coupon['enough'] . '元';
		}
		else 
		{
			$title2 = '充值任意金额';
		}
	}
	else if ($coupon['coupontype'] == '2') 
	{
		if (0 < $coupon['enough']) 
		{
			$title2 = '满' . (double) $coupon['enough'] . '元';
		}
		else 
		{
			$title2 = '购物任意金额';
		}
	}
	if ($coupon['backtype'] == 0) 
	{
		if ($coupon['enough'] == '0') 
		{
			$coupon['color'] = 'orange ';
		}
		else 
		{
			$coupon['color'] = 'blue';
		}
		$title3 = '减' . (double) $coupon['deduct'] . '元';
	}
	if ($coupon['backtype'] == 1) 
	{
		$coupon['color'] = 'red ';
		$title3 = '打' . (double) $coupon['discount'] . '折 ';
	}
	if ($coupon['backtype'] == 2) 
	{
		if (($coupon['coupontype'] == '0') || ($coupon['coupontype'] == '2')) 
		{
			$coupon['color'] = 'red ';
		}
		else 
		{
			$coupon['color'] = 'pink ';
		}
		if (!(empty($coupon['backmoney'])) && (0 < $coupon['backmoney'])) 
		{
			$title3 = $title3 . '送' . $coupon['backmoney'] . '元余额 ';
		}
		if (!(empty($coupon['backcredit'])) && (0 < $coupon['backcredit'])) 
		{
			$title3 = $title3 . '送' . $coupon['backcredit'] . '积分 ';
		}
		if (!(empty($coupon['backredpack'])) && (0 < $coupon['backredpack'])) 
		{
			$title3 = $title3 . '送' . $coupon['backredpack'] . '元红包 ';
		}
	}
	if ($coupon['past'] || !(empty($data['used']))) 
	{
		$coupon['color'] = 'disa';
	}
	$coupon['title2'] = $title2;
	$coupon['title3'] = $title3;
	$goods = array();
	$category = array();
	if ($coupon['limitgoodtype'] != 0) 
	{
		if (!(empty($coupon['limitgoodids']))) 
		{
			$where = 'and id in(' . $coupon['limitgoodids'] . ')';
		}
		$goods = pdo_fetchall('select `title` from ' . tablename('ewei_shop_goods') . ' where uniacid=:uniacid ' . $where, array(':uniacid' => $_W['uniacid']), 'id');
	}
	if ($coupon['limitgoodcatetype'] != 0) 
	{
		if (!(empty($coupon['limitgoodcateids']))) 
		{
			$where = 'and id in(' . $coupon['limitgoodcateids'] . ')';
		}
		$category = pdo_fetchall('select `name`  from ' . tablename('ewei_shop_category') . ' where uniacid=:uniacid   ' . $where, array(':uniacid' => $_W['uniacid']), 'id');
	}
	$num = pdo_fetchcolumn('select ifnull(count(*),0) from ' . tablename('ewei_shop_coupon_data') . ' where couponid=:couponid and openid=:openid and uniacid=:uniacid and used=0 ', array(':couponid' => $coupon['id'], ':openid' => $_W['openid'], ':uniacid' => $_W['uniacid']));
	$canuse = !($coupon['past']) && empty($data['used']);
	if ($coupon['coupontype'] == 0) 
	{
		$useurl = mobileUrl('sale/coupon/my/showcoupongoods', array('id' => $id));
	}
	else if ($coupon['coupontype'] == 1) 
	{
		$useurl = mobileUrl('member/recharge');
	}
	else if ($coupon['coupontype'] == 2) 
	{
		$useurl = mobileUrl('sale/coupon/my');
	}
	$set = $_W['shopset']['coupon'];
	com('coupon')->setShare();
}

$this->result(0, '', $res);
?>
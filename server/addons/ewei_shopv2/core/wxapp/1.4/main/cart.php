<?php
if (!defined('IN_IA')) {
	exit('Access Denied');
}
global $_GPC, $_W;
$op = $_GPC['op'];
$res = array();
$openid = m('member')->getOpenid();
$uniacid = $_W['uniacid'];

/* 检测登录状态 */
if (m('account')->checkWxappLogin())
{
	$this->result(1, '请先登录');
}

/* 列表 */
if ($op == 'list')
{
	$res = m('goods')->getCartGoods();
}
elseif ($op == 'update')
{
	$id = intval($_GPC['id']);
	$goodstotal = intval($_GPC['total']);
	$optionid = intval($_GPC['optionid']);
	empty($goodstotal) && ($goodstotal = 1);
	$mid = m('member')->getMidByOpenid($openid);
	$data = pdo_fetch('select id,goodsid,optionid, total from ' . tablename('ewei_shop_member_cart') . ' ' . ' where id=:id and uniacid=:uniacid and openid=:openid limit 1 ', array(':id' => $id, ':uniacid' => $_W['uniacid'], ':openid' => $_W['openid']));
	if (empty($data)) 
	{
		$this->result(1, '无购物车记录');
	}
	$goods = pdo_fetch('select id,maxbuy,minbuy,total,unit from ' . tablename('ewei_shop_goods') . ' where id=:id and uniacid=:uniacid and status=1 and deleted=0', array(':id' => $data['goodsid'], ':uniacid' => $_W['uniacid']));
	if (empty($goods)) 
	{
		$this->result(1, '商品未找到');
	}
	$goodstotal = m('goods')->checkBuyNum($data['goodsid'], $goodstotal, $optionid, $mid);
	pdo_update('ewei_shop_member_cart', array('total' => $goodstotal, 'optionid' => $optionid), array('id' => $id, 'uniacid' => $_W['uniacid'], 'openid' => $_W['openid']));
	$res = m('goods')->getCartGoods();
	
}

elseif ($op == 'add')
{
	$id = intval($_GPC['id']);
	$total = intval($_GPC['total']);
	$optionid = intval($_GPC['optionid']);
	$mid = m('member')->getMidByOpenid($openid);
	$goods = pdo_fetch('select id,marketprice,diyformid,diyformtype,diyfields, isverify, `type`,merchid, cannotrefund from ' . tablename('ewei_shop_goods') . ' where id=:id and uniacid=:uniacid limit 1', array(':id' => $id, ':uniacid' => $_W['uniacid']));
	if (empty($goods)) 
	{
		$this->result(1, '商品未找到');
	}
	$member = m('member')->getMember($_W['openid'], 'mobileverify');
	/*
	if (!(empty($_W['shopset']['wap']['open'])) && !(empty($_W['shopset']['wap']['mustbind'])) && empty($member['mobileverify'])) 
	{
		$this->result(1, array('message' => '请先绑定手机', 'url' => mobileUrl('member/bind', NULL, true)));
	}
	*/
	if ($goods['type'] == 3) 
	{
		$this->result(1, '此商品不可加入购物车，请直接点击立刻购买');
	}
	$giftid = intval($_GPC['giftid']);
	$gift = pdo_fetch('select * from ' . tablename('ewei_shop_gift') . ' where uniacid = ' . $_W['uniacid'] . ' and id = ' . $giftid . ' and starttime >= ' . time() . ' and endtime <= ' . time() . ' and status = 1 ');
	$diyform_plugin = p('diyform');
	$diyformid = 0;
	$diyformfields = iserializer(array());
	$diyformdata = iserializer(array());
	if ($diyform_plugin) 
	{
		$diyformdata = $_GPC['diyformdata'];
		if (!(empty($diyformdata)) && is_array($diyformdata)) 
		{
			$diyformfields = false;
			if ($goods['diyformtype'] == 1) 
			{
				$diyformid = intval($goods['diyformid']);
				$formInfo = $diyform_plugin->getDiyformInfo($diyformid);
				if (!(empty($formInfo))) 
				{
					$diyformfields = $formInfo['fields'];
				}
			}
			else if ($goods['diyformtype'] == 2) 
			{
				$diyformfields = iunserializer($goods['diyfields']);
			}
			if (!(empty($diyformfields))) 
			{
				$insert_data = $diyform_plugin->getInsertData($diyformfields, $diyformdata);
				$diyformdata = $insert_data['data'];
				$diyformfields = iserializer($diyformfields);
			}
		}
	}
	$data = pdo_fetch('select id,total,diyformid from ' . tablename('ewei_shop_member_cart') . ' where goodsid=:id and openid=:openid and   optionid=:optionid  and deleted=0 and  uniacid=:uniacid   limit 1', array(':uniacid' => $_W['uniacid'], ':openid' => $_W['openid'], ':optionid' => $optionid, ':id' => $id));
	if (empty($data)) 
	{
		if ($total > 0)
		{
			$data = array('uniacid' => $_W['uniacid'], 'merchid' => $goods['merchid'], 'openid' => $_W['openid'], 'goodsid' => $id, 'optionid' => $optionid, 'marketprice' => $goods['marketprice'], 'total' => $total, 'selected' => 1, 'diyformid' => $diyformid, 'diyformdata' => $diyformdata, 'diyformfields' => $diyformfields, 'createtime' => time());
			pdo_insert('ewei_shop_member_cart', $data);
		}
	}
	else 
	{
		$data['diyformid'] = $diyformid;
		$data['diyformdata'] = $diyformdata;
		$data['diyformfields'] = $diyformfields;
		$data['total'] += $total;
		if ($data['total'] <= 0)
		{
			$data['total'] = 0;
			pdo_delete('ewei_shop_member_cart', array('id' => $data['id']));
		}
		else
		{
			pdo_update('ewei_shop_member_cart', $data, array('id' => $data['id']));
		}
		
	}
	$carttotal = m('goods')->checkBuyNum($id, $data['total'], $optionid, $mid);
	$res = m('goods')->getCartGoods();
	$res['carttotal'] = $carttotal;
}

elseif ($op == 'remove')
{
	$ids = is_array($_GPC['ids']) ? implode(',', $_GPC['ids']) : trim($_GPC['ids']);
	if (empty($ids)) 
	{
		$this->result(1, '参数错误');
	}
	$sql = 'delete from ' . tablename('ewei_shop_member_cart') . ' where uniacid= '. $_W['uniacid'] .' and openid=\''. $_W['openid'] .'\' and id in (' .$ids . ')';
	pdo_query($sql);
	$res = m('goods')->getCartGoods();
}


$this->result(0, '', $res);
?>
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

/* 地址列表 */
if ($op == 'display')
{
	$list = m('member')->getAddressList(0, $openid);
	$res['list'] = $list;
}

/* 修改地址 */
elseif ($op == 'modify')
{
	$id = intval($_GPC['id']);
	if (!$id)
	{
		$this->result(1, '参数错误');
	}
	$address = pdo_fetch('select * from ' . tablename('ewei_shop_member_address') . 
			' where id=:id and openid=:openid and uniacid=:uniacid limit 1 ', 
			array(':id' => $id, ':uniacid' => $_W['uniacid'], ':openid' => $_W['openid']));
	$address['region'] = array($address['province'], $address['city'], $address['area']);
	$address['regionStr'] = $address['province'] . ',' . $address['city'] . ',' . $address['area'];
	$res['address'] = $address;
}

/* 保存数据 */
elseif ($op == 'save')
{
	if ($_W['ispost']) 
	{
		$id = intval($_GPC['id']);
		$region = trim($_GPC['region']);
		$region_arr = explode(",", $region);
		$data = array();
		$data['realname']     = trim($_GPC['realname']);
		$data['mobile']   = trim($_GPC['mobile']);
		$data['province'] = $region_arr[0];
		$data['city'] 	  = $region_arr[1];
		$data['area']     = $region_arr[2];
		$data['address']  = trim($_GPC['address']);
		$data['openid']   = $openid;
		$data['uniacid']  = $_W['uniacid'];
		$data['isdefault'] = intval($_GPC['isdefault']);
		if ($data['isdefault'])
		{
			pdo_update('ewei_shop_member_address', array('isdefault'=>0), array('uniacid' => $_W['uniacid'], 'openid' => $openid));
		}
		if (empty($id)) 
		{
			$addresscount = pdo_fetchcolumn('SELECT count(*) FROM ' . tablename('ewei_shop_member_address') . ' where openid=:openid and deleted=0 and `uniacid` = :uniacid ', array(':uniacid' => $_W['uniacid'], ':openid' => $openid));
			if ($addresscount <= 0) 
			{
				$data['isdefault'] = 1;
			}
			pdo_insert('ewei_shop_member_address', $data);
			$id = pdo_insertid();
		}
		else 
		{
			pdo_update('ewei_shop_member_address', $data, array('id' => $id, 'uniacid' => $_W['uniacid'], 'openid' => $openid));
		}
		$res['id'] = $id;
	}
	else
	{
		$this->result(1, '参数错误');
	}
	
}
/* 删除 */
elseif ($op == 'remove')
{
	$id = intval($_GPC['id']);
	$data = pdo_fetch('select id,isdefault from ' . tablename('ewei_shop_member_address') . ' where  id=:id and openid=:openid and deleted=0 and uniacid=:uniacid  limit 1', array(':uniacid' => $_W['uniacid'], ':openid' => $openid, ':id' => $id));
	if (empty($data)) 
	{
		$this->result(1, '地址未找到');
	}
	pdo_delete('ewei_shop_member_address', array('uniacid' => $_W['uniacid'], 'id' => $id));
}

/* 设为默认 */
elseif ($op == 'setdefault')
{
	$id = intval($_GPC['id']);
	$data = pdo_fetch('select id from ' . tablename('ewei_shop_member_address') . 
			' where id=:id and uniacid=:uniacid limit 1', 
			array(':uniacid' => $_W['uniacid'], ':id' => $id));
	if (empty($data)) 
	{
		$this->result(1, '地址未找到');
	}
	pdo_update('ewei_shop_member_address', array('isdefault' => 0), array('uniacid' => $_W['uniacid'], 'openid' => $openid));
	pdo_update('ewei_shop_member_address', array('isdefault' => 1), array('id' => $id, 'uniacid' => $_W['uniacid'], 'openid' => $openid));
}


$this->result(0, '', $res);
?>
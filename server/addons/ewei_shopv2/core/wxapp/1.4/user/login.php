<?php
if (!defined('IN_IA')) {
	exit('Access Denied');
}
global $_GPC, $_W;
$op = $_GPC['op'];
$res = array();
$_W['account']['type'] = ACCOUNT_TYPE_APP_NORMAL;

/* 得到相关小程序的appid和secret */
$wxapp_set = m('common')->getSysset('wxapp');
$_W['account']['key']    = $wxapp_set['AppId'];
$_W['account']['secret'] = $wxapp_set['AppSecret'];
$account_api = WeAccount::create($_W['account']);

/* 登录 */
if ($op == 'openid')
{	
	$code = $_GPC['code'];
	if (empty($_W['account']['oauth']) || empty($code)) {
		exit('通信错误，请在微信中重新发起请求');
	}
	$oauth = $account_api->getOauthInfo($code);
	$openid = 'xcx_' . $oauth['openid'];
	if (!empty($oauth) && !is_error($oauth)) {
		$_SESSION['openid'] = $openid;
		$_SESSION['session_key'] = $oauth['session_key'];
		
		// 查询账号是否注册
		$member = m('member')->getMember($openid, 'id');
		if (!$member)
		{
			$data = array(
				'openid'     => $openid,
				'openid_xcx' => $oauth['openid'],
				'uniacid'    => $_W['uniacid'],
				'unionid'    => $oauth['unionid'] ? $oauth['unionid'] : '',
				'salt'       => random(8),
				'createtime' => TIMESTAMP
			);
			pdo_insert('ewei_shop_member', $data);
			$mid = pdo_insertid();
		}
		else
		{
			$mid = $member['id'];
		}
		$_SESSION['userid'] = $mid;
		$this->result(0, '', array('sessionid' => $_W['session_id']));
	}
	else {
		$this->result(0, $oauth['message']);
	}
}
elseif ($op == 'userInfo')
{
	$encrypt_data = $_GPC['encryptedData'];
	$iv = $_GPC['iv'];
	if (empty($_SESSION['session_key']) || empty($encrypt_data) || empty($iv)) {
		$this->result(1, '请先登录');
	}
	
	$sign = sha1(htmlspecialchars_decode($_GPC['rawData']).$_SESSION['session_key']);
	if ($sign !== $_GPC['signature']) {
		$this->result(1, '签名错误');
	}
	
	$userinfo = $account_api->pkcs7Encode($encrypt_data, $iv);
	$data = array();
	$openid = 'xcx_' . $userinfo['openId'];
	$args = 'id, nickname, avatar, gender,  province, city, unionid, credit1, credit2, isagent, status';
	$row = m('member')->getMember($openid, $args);

	if ($row['nickname'] != $userinfo['nickName'] && !empty($userinfo['nickName']))
	{
		$data['nickname'] = $userinfo['nickName'];
	}
	if ($row['avatar'] != $userinfo['avatarUrl'] && !empty($userinfo['avatarUrl']))
	{
		$data['avatar'] = $userinfo['avatarUrl'];
	}
	if ($row['gender'] != $userinfo['gender'] && !empty($userinfo['gender']))
	{
		$data['gender'] = $userinfo['gender'];
	}
	if ($row['city'] != $userinfo['city'] && !empty($userinfo['city']))
	{
		$data['city'] = $userinfo['city'];
	}
	if ($row['province'] != $userinfo['province'] && !empty($userinfo['province']))
	{
		$data['province'] = $userinfo['province'];
	}
	if ($row['unionid'] != $userinfo['unionId'] && !empty($userinfo['unionId']))
	{
		$data['unionid'] = $userinfo['unionId'];
	}
	$member = m('member')->getMember($openid, $args);
	$member['credit2'] = priceFormat1($member['credit2']);
		
	/* 是否无条件成为分销商 */
	if (!$member['isagent'])
	{
		$pset = m('common')->getPluginset('commission');
		if ($pset['become'] == 0)
		{
			$data['isagent'] = 1;
			$data['agenttime'] = time();
		}
		if ($pset['become_check'] == 1)
		{
			$data['status'] = 1;
		}
	}
	
	// 数据更改
	if (count($data) > 0)
	{
		pdo_update('ewei_shop_member', $data, array('id' => $row['id']));
	}

	$res['member'] = $member;
	$this->result(0, '', $res);
}

elseif ($op == 'update')
{
	$openid = m('member')->getOpenid();
	$member = m('member')->getInfo($openid, 'avatar, nickname, id, gender, city, province');
	if ($member['nickname'] != $_GPC['nickName'] && !empty($_GPC['nickName']))
	{
		$data['nickname'] = $_GPC['nickName'];
	}
	if ($member['avatar'] != $_GPC['avatarUrl'] && !empty($_GPC['avatarUrl']))
	{
		$data['avatar'] = $_GPC['avatarUrl'];
	}
	if ($member['gender'] != $_GPC['gender'] && !empty($_GPC['gender']))
	{
		$data['gender'] = $_GPC['gender'];
	}
	if ($member['city'] != $_GPC['city'] && !empty($_GPC['city']))
	{
		$data['city'] = $_GPC['city'];
	}
	if ($member['province'] != $_GPC['province'] && !empty($_GPC['province']))
	{
		$data['province'] = $_GPC['province'];
	}

	// 数据更改
	if (count($data) > 0)
	{
		pdo_update('ewei_shop_member', $data, array('id' => $member['id']));
	}
	$member = m('member')->getInfo($openid, 'avatar, nickname, realname, id');
	$res['user'] = $member;	
	$this->result(0, '', $res);
}
?>
<?php
if (!defined('IN_IA')) {
	exit('Access Denied');
}
global $_GPC, $_W;
$op = $_GPC['op'];
$res = array();
$_W['account']['type'] = ACCOUNT_TYPE_APP_NORMAL;
//$_W['openid'] = 'xcx_omn4O0Z2Jla6sXjPb5BEPk3J3RcE';
/* 检测登录状态 */
if (m('account')->checkWxappLogin())
{
	$this->result(1, '请先登录');
}

/* 取得会员相关信息 */
$openid = m('member')->getOpenid();
$member = m('member')->getMember($openid, 'id, credit1, credit2');

/* 判断是否是分销商 */
$pset = p('commission')->getSet();

if (!p('commission')->isAgent($openid))
{
	if ($member['isagent'])
	{
		$this->result(1, $pset['texts']['agent'] . '申请正在审核中');
	}
	$desc = p('commission')->becomeDesc($openid);
	$this->result(2, '您还不是' . $pset['texts']['agent'] . ', ' . $desc, array('become' => $com_set['become']));
}

/* 得到相关小程序的appid和secret */
$wxapp_set = m('common')->getSysset('wxapp');
$_W['account']['key']    = $wxapp_set['AppId'];
$_W['account']['secret'] = $wxapp_set['AppSecret'];
$account_api = WeAccount::create($_W['account']);

/* 得到推广二维码 */
if ($op == 'get')
{
	$data = m('wxqrcode')->createCommissionQrcode($openid, 0, 4, 'wxacodeunlimit', $account_api, 'index');
	if (!$data[0])
	{
		$this->result(1, $data[1]);
	}
	else
	{
		$qrinfo = $data[1];
		
		$qrinfo['url'] = tomedia($qrinfo['url']);
		$res['qrcode'] = $qrinfo;
	}
	
}

$this->result(0, '', $res);

?>
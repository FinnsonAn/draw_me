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
	$this->result(1, '获取用户信息失败');
}
$openid = m('member')->getOpenid();

$set = m('common')->getSysset('shop');
$uniacid = $_W['uniacid'];

/* 付款台 */
if ($op == 'get')
{
	$member = m('member')->getMember($openid, 'avatar, nickname, realname, id, credit2');	

	$member['idqr'] =  m('qrcode')->createMemIdQrcode($openid);
	$res['member'] = $member;
}

$this->result(0, '', $res);
?>
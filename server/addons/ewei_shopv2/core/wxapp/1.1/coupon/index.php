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

if ($op == 'display')
{
	
}

$this->result(0, '', $res);
?>
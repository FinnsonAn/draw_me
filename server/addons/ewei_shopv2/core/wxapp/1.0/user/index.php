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
$member = m('member')->getMember($openid, 'avatar, nickname, realname, id');
if ($op == 'main')
{
	// 会员中心背景图
	$shopset = m('common')->getSysset('shop');
	$res['ucBg'] = tomedia($shopset['uc_bg']);
	if (p('case'))
	{
		$member['authorid'] = p('case')->checkAuthor($member['id']);
	}
	$res['member'] = $member;
	
	// 导航组
	$ids = $_GPC['navGid'];
	if ($ids)
	{
		$id_arr = explode(',', $ids);
		foreach($id_arr as $v)
		{
			$res['g' . $v]['info'] = m('shop')->getNavGroupInfo($v);
			$res['g' . $v]['navs'] = m('shop')->getNavs($v);
			
		}
	}

}
elseif ($op == 'getInfo')
{
	
	
}
$this->result(0, '', $res);
?>
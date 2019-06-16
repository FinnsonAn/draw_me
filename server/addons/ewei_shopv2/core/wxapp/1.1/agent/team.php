<?php
if (!defined('IN_IA')) {
	exit('Access Denied');
}
global $_GPC, $_W;
$op = $_GPC['op'];
$res = array();
$_W['account']['type'] = ACCOUNT_TYPE_APP_NORMAL;
//$_W['openid'] = 'xcx_oDPT00Hp2wJqEotBrEcwnGSeAdQE';

/* 检测登录状态 */
if (m('account')->checkWxappLogin())
{
	$this->result(1, '请先登录');
}

/* 取得会员相关信息 */
$openid = m('member')->getOpenid();

/* 判断是否是分销商 */
$pset = p('commission')->getSet();
$commission = m('common')->getPluginset('commission');
if (!p('commission')->isAgent($openid))
{
	$this->result(1, '您还不是' . $pset['texts']['agent']);
}

if ($op == 'list')
{
	$level = $_GPC['level'] ? intval($_GPC['level']) : 1;
	$level_tabs = array();
	$keyword = !empty($_GPC['keyword']) ? trim($_GPC['keyword']) : '';
	$time  = $_GPC['time']; 
	$condition = '';
	$member = p('commission')->getInfo($openid);
	
	/* 开启的层级 */
	$floors = intval($commission['level']);
	if (!$floors)
	{
		$this->result(1, '没有开启分销功能'); 
	}
	for ($i = 1; $i < 4; $i++)
	{
		if ($floors >= $i)
		{
			$level_tabs[$i] = $pset['texts']['c' . $i];
		}
	}
	/*
	if ($level == 1) {
		if (0 < $floors) {
			$condition = ' and agentid=' . $member['id'];
			$hasangent = true;
		}
	}
	 else if ($level == 2) {
		if (1 < $floors) {
			$condition = ' and second_agentid=' . $member['id'];
			$hasangent = true;
		}
	}
	 else if ($level == 3) {
		if (2 < $floors) {
			$condition = ' and third_agentid=' . $member['id'];
			$hasangent = true;
		}
	}
	
	
	if ($keyword)
	{
		$condition .= ' and (id = '. intval($keyword) .' or nickname like \'%'. $keyword .'%\' 
					or realname like \'%'. $keyword .'%\')';
	}
	if ($time)
	{
		$timearea = time_area($time);
		$condition .= ' and agenttime between '. $timearea['from'] .' and ' . $timearea['to']; 
	}
	*/
	$pindex = max(1, intval($_GPC['page']));
	$psize = 20;
	$list = array();
	$new_list = array();
	if ($level == 1) {
		$condition = ' and agentid=' . $member['id'];
		$hasangent = true;
		$total_level = pdo_fetchcolumn('select count(*) from ' . tablename('ewei_shop_member') . ' where agentid=:agentid and uniacid=:uniacid limit 1', array(':agentid' => $member['id'], ':uniacid' => $_W['uniacid']));
	}
	 else if ($level == 2) {
		

		$condition = ' and agentid in( ' . implode(',', array_keys($member['level1_agentids'])) . ')';
		$hasangent = true;
		$total_level = pdo_fetchcolumn('select count(*) from ' . tablename('ewei_shop_member') . ' where agentid in( ' . implode(',', array_keys($member['level1_agentids'])) . ') and uniacid=:uniacid limit 1', array(':uniacid' => $_W['uniacid']));
	}
	 else if ($level == 3) {


		$condition = ' and agentid in( ' . implode(',', array_keys($member['level2_agentids'])) . ')';
		$hasangent = true;
		$total_level = pdo_fetchcolumn('select count(*) from ' . tablename('ewei_shop_member') . ' where agentid in( ' . implode(',', array_keys($member['level2_agentids'])) . ') and uniacid=:uniacid limit 1', array(':uniacid' => $_W['uniacid']));
	}


	$list = pdo_fetchall('select * from ' . tablename('ewei_shop_member') . ' where uniacid = ' . $_W['uniacid'] . ' ' . $condition . '  ORDER BY isagent desc,id desc limit ' . (($pindex - 1) * $psize) . ',' . $psize);

	foreach ($list as $k=>$row ) {
		if ($member['isagent'] && $member['status']) {
			$info = m('member')->getInfo($row['openid'], array('total'));
			$new_list[$k]['commission_total'] = $info['commission_total'];
			$new_list[$k]['agentcount'] = $info['agentcount'];
			$new_list[$k]['agenttime'] = date('Y-m-d H:i', $row['agenttime']);
		}


		$ordercount = pdo_fetchcolumn('select count(id) from ' . tablename('ewei_shop_order') . ' where openid=:openid and uniacid=:uniacid limit 1', array(':uniacid' => $_W['uniacid'], ':openid' => $row['openid']));
		$new_list[$k]['ordercount'] = number_format(intval($ordercount), 0);
		$moneycount = pdo_fetchcolumn('select sum(og.realprice) from ' . tablename('ewei_shop_order_goods') . ' og ' . ' left join ' . tablename('ewei_shop_order') . ' o on og.orderid=o.id where o.openid=:openid  and o.status>=1 and o.uniacid=:uniacid limit 1', array(':uniacid' => $_W['uniacid'], ':openid' => $row['openid']));
		$new_list[$k]['moneycount'] = number_format(floatval($moneycount), 2);
		$new_list[$k]['createtime'] = date('Y-m-d H:i', $row['createtime']);
		$new_list[$k]['name'] = $row['nickname'] ? $row['nickname'] : $row['realname'];
		$new_list[$k]['avatar'] = $row['avatar'];
		$new_list[$k]['id'] = $row['id'];
		$new_list[$k]['childtime'] = $row['childtime'] > 0 ? date('Y-m-d H:i', $row['childtime']) : date('Y-m-d H:i', $row['createtime']);
		if ($row['isagent'] && $row['status'])
		{
			$new_list[$k]['isagent'] = $pset['texts']['agent'];
		}
		else
		{
			$new_list[$k]['isagent'] = '普通会员';
		}
	}

	unset($row);
		
	$res['list']  = $new_list;
	$res['total'] = $total;
	$res['page'] = $pindex;
	$res['tabs']  = $level_tabs;	
}

$this->result(0, '', $res);
?>
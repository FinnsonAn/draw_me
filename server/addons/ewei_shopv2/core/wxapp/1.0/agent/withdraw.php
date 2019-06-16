<?php
if (!defined('IN_IA')) {
	exit('Access Denied');
}
global $_GPC, $_W;
$op = $_GPC['op'];
$res = array();
$_W['account']['type'] = ACCOUNT_TYPE_APP_NORMAL;
//$_W['openid'] = 'xcx_oqh0A0YKYDgFJrFIPx9ZGUyQrDk0';

/* 检测登录状态 */
if (m('account')->checkWxappLogin())
{
	$this->result(1, '请先登录');
}

/* 取得会员相关信息 */
$openid = m('member')->getOpenid();
$uniacid = $_W['uniacid'];
$mid = m('member')->getMidByOpenid($openid);

/* 判断是否是分销商 */
$pset = p('commission')->getSet();
$commission = m('common')->getPluginset('commission');

if (!p('commission')->isAgent($openid))
{
	if ($member['isagent'])
	{
		$this->result(1, $pset['texts']['agent'] . '申请正在审核中');
	}
	$desc = p('commission')->becomeDesc($openid);
	$this->result(2, '您还不是' . $pset['texts']['agent'] . ', ' . $desc, array('become' => $com_set['become']));
}
if ($op == 'display')
{
	$columns = 'realname, mobile, withdraw_pwd';
	$member = m('member')->getInfo($openid, $columns);
	if (empty($member['realname']) || empty($member['mobile']))
	{
		$this->result(10, '请先完成实名认证');
	}
	if (empty($member['withdraw_pwd']))
	{
		$this->result(20, '请先设置提现密码');
	}
	$commission = p('commission')->getInfo($openid, array('ok'));
	$agentset = m('common')->getPluginset('commission');
	$agentset_arr['withdraw'] = $agentset['withdraw'];
	$agentset_arr = array(
		'withdraw'   => $agentset['withdraw'],
		'cashalipay' => $agentset['cashalipay'],
		'cashcard'   => $agentset['cashcard'],
		'cashcredit' => $agentset['cashcredit'],
		'cashweixin' => $agentset['cashweixin'],
		'txt_commission_ok' => $agentset['texts']['commission_ok'],
		'txt_withdraw' => $agentset['texts']['withdraw'],
	);
	$res['agentset']   = $agentset_arr;
	$res['commission'] = $commission;
}

elseif ($op == 'apply')
{
	$columns = 'realname, mobile, alipay, bankname, bankcard, withdraw_pwd';
	$member = m('member')->getMember($openid, $columns);
	$commission =  p('commission')->getInfo($openid, array('ok'));
	$agentset = m('common')->getPluginset('commission');
	$min_price = $agentset['withdraw'];
	$pwd = md5(trim($_GPC['pwd']));
	$type = $_GPC['withdrawType'] ? intval($_GPC['withdrawType']) : 0;
	
	/* 检测 */
	if (!$commission['commission_ok']){
		$this->result(1, '没有可提现的收益');
	}
	
	if (empty($member['realname']) || empty($member['mobile']))
	{
		$this->result(10, '请先完成实名认证');
	}
	if (empty($member['withdraw_pwd']))
	{
		$this->result(20, '请先设置提现密码');
	}
	
	if ($pwd != $member['withdraw_pwd']){
		$this->result(1, '提现密码不正确');
	}
	
	if ($type == 2 && empty($member['alipay']))
	{
		$this->result(1, '支付宝账号不能为空');
	}
	
	if ($type == 3 && (empty($member['bankname']) || empty($member['bankcard'])))
	{
		$this->result(1, '银行账号不能为空');
	}
	
	$com_set = m('common')->getPluginset('commission');
	$level = $agentset['level'];
	$member = p('commission')->getInfo($openid, array());
	$time = time();
	$day_times = intval($agentset['settledays']) * 3600 * 24;
	$agentLevel = p('commission')->getLevel($openid);
	$commission_ok = 0;
	$orderids = array();
	if (1 <= $level) 
	{
		$level1_orders = pdo_fetchall('select distinct o.id from ' . tablename('ewei_shop_order') . ' o ' . ' left join  ' . tablename('ewei_shop_order_goods') . ' og on og.orderid=o.id ' . ' where o.agentid=:agentid and o.status>=3  and og.status1=0 and og.nocommission=0 and (' . $time . ' - o.finishtime > ' . $day_times . ') and o.uniacid=:uniacid  group by o.id', array(':uniacid' => $_W['uniacid'], ':agentid' => $member['id']));
		foreach ($level1_orders as $o ) 
		{
			if (empty($o['id'])) 
			{
				continue;
			}
			$hasorder = false;
			foreach ($orderids as $or ) 
			{
				if ($or['orderid'] == $o['id']) 
				{
					$hasorder = true;
					break;
				}
			}
			if ($hasorder) 
			{
				continue;
			}
			$orderids[] = array('orderid' => $o['id'], 'level' => 1);
		}
	}
	if (2 <= $level) 
	{
		if (0 < $member['level1']) 
		{
			$level2_orders = pdo_fetchall('select distinct o.id from ' . tablename('ewei_shop_order') . ' o ' . ' left join  ' . tablename('ewei_shop_order_goods') . ' og on og.orderid=o.id ' . ' where o.agentid in( ' . implode(',', array_keys($member['level1_agentids'])) . ')  and o.status>=3  and og.status2=0 and og.nocommission=0 and (' . $time . ' - o.finishtime > ' . $day_times . ') and o.uniacid=:uniacid  group by o.id', array(':uniacid' => $_W['uniacid']));
			foreach ($level2_orders as $o ) 
			{
				if (empty($o['id'])) 
				{
					continue;
				}
				$hasorder = false;
				foreach ($orderids as $or ) 
				{
					if ($or['orderid'] == $o['id']) 
					{
						$hasorder = true;
						break;
					}
				}
				if ($hasorder) 
				{
					continue;
				}
				$orderids[] = array('orderid' => $o['id'], 'level' => 2);
			}
		}
	}
	if (3 <= $level) 
	{
		if (0 < $member['level2']) 
		{
			$level3_orders = pdo_fetchall('select distinct o.id from ' . tablename('ewei_shop_order') . ' o ' . ' left join  ' . tablename('ewei_shop_order_goods') . ' og on og.orderid=o.id ' . ' where o.agentid in( ' . implode(',', array_keys($member['level2_agentids'])) . ')  and o.status>=3  and  og.status3=0 and og.nocommission=0 and (' . $time . ' - o.finishtime > ' . $day_times . ')   and o.uniacid=:uniacid  group by o.id', array(':uniacid' => $_W['uniacid']));
			foreach ($level3_orders as $o ) 
			{
				if (empty($o['id'])) 
				{
					continue;
				}
				$hasorder = false;
				foreach ($orderids as $or ) 
				{
					if ($or['orderid'] == $o['id']) 
					{
						$hasorder = true;
						break;
					}
				}
				if ($hasorder) 
				{
					continue;
				}
				$orderids[] = array('orderid' => $o['id'], 'level' => 3);
			}
		}
	}
	foreach ($orderids as $o ) 
	{
		$goods = pdo_fetchall('SELECT ' . 'og.commission1,og.commission2,og.commission3,og.commissions,' . 'og.status1,og.status2,og.status3,' . 'og.content1,og.content2,og.content3 from ' . tablename('ewei_shop_order_goods') . ' og' . ' left join ' . tablename('ewei_shop_goods') . ' g on g.id=og.goodsid  ' . ' where og.orderid=:orderid and og.nocommission=0 and og.uniacid = :uniacid order by og.createtime  desc ', array(':uniacid' => $_W['uniacid'], ':orderid' => $o['orderid']));
		foreach ($goods as $g ) 
		{
			$commissions = iunserializer($g['commissions']);
			if (($o['level'] == 1) && ($g['status1'] == 0)) 
			{
				$commission1 = iunserializer($g['commission1']);
				if (empty($commissions)) 
				{
					$commission_ok += ((isset($commission1['level' . $agentLevel['id']]) ? $commission1['level' . $agentLevel['id']] : $commission1['default']));
				}
				else 
				{
					$commission_ok += ((isset($commissions['level1']) ? floatval($commissions['level1']) : 0));
				}
			}
			if (($o['level'] == 2) && ($g['status2'] == 0)) 
			{
				$commission2 = iunserializer($g['commission2']);
				if (empty($commissions)) 
				{
					$commission_ok += ((isset($commission2['level' . $agentLevel['id']]) ? $commission2['level' . $agentLevel['id']] : $commission2['default']));
				}
				else 
				{
					$commission_ok += ((isset($commissions['level2']) ? floatval($commissions['level2']) : 0));
				}
			}
			if (($o['level'] == 3) && ($g['status3'] == 0)) 
			{
				$commission3 = iunserializer($g['commission3']);
				if (empty($commissions)) 
				{
					$commission_ok += ((isset($commission3['level' . $agentLevel['id']]) ? $commission3['level' . $agentLevel['id']] : $commission3['default']));
				}
				else 
				{
					$commission_ok += ((isset($commissions['level3']) ? floatval($commissions['level3']) : 0));
				}
			}
		}
	}
	$withdraw = floatval($agentset['withdraw']);
	if ($withdraw <= 0) 
	{
		$withdraw = 1;
	}
	$cansettle = $withdraw <= $commission_ok;
	$member['commission_ok'] = number_format($commission_ok, 2);
	$set_array = array();
	$set_array['charge'] = $agentset['withdrawcharge'];
	$set_array['begin'] = floatval($agentset['withdrawbegin']);
	$set_array['end'] = floatval($agentset['withdrawend']);
	$realmoney = $commission_ok;
	$deductionmoney = 0;
	if (!(empty($set_array['charge']))) 
	{
		$money_array = m('member')->getCalculateMoney($commission_ok, $set_array);
		if ($money_array['flag']) 
		{
			$realmoney = $money_array['realmoney'];
			$deductionmoney = $money_array['deductionmoney'];
		}
	}
	$last_data = p('commission')->getLastApply($member['id']);
	$type_array = array();
	if ($agentset['cashcredit'] == 1) 
	{
		$type_array[0]['title'] = $agentset['texts']['withdraw'] . '到' . $_W['shopset']['trade']['moneytext'];
	}
	if (($agentset['cashweixin'] == 1) && !(is_h5app())) 
	{
		$type_array[1]['title'] = $agentset['texts']['withdraw'] . '到微信钱包';
	}
	if ($agentset['cashother'] == 1) 
	{
		if ($agentset['cashalipay'] == 1) 
		{
			$type_array[2]['title'] = $agentset['texts']['withdraw'] . '到支付宝';
			if (!(empty($last_data))) 
			{
				if ($last_data['type'] != 2) 
				{
					$type_last = p('commission')->getLastApply($member['id'], 2);
					if (!(empty($type_last))) 
					{
						$last_data['realname'] = $type_last['realname'];
						$last_data['alipay'] = $type_last['alipay'];
					}
				}
			}
		}
		if ($agentset['cashcard'] == 1) 
		{
			$type_array[3]['title'] = $agentset['texts']['withdraw'] . '到银行卡';
			if (!(empty($last_data))) 
			{
				if ($last_data['type'] != 3) 
				{
					$type_last = p('commission')->getLastApply($member['id'], 3);
					if (!(empty($type_last))) 
					{
						$last_data['realname'] = $type_last['realname'];
						$last_data['bankname'] = $type_last['bankname'];
						$last_data['bankcard'] = $type_last['bankcard'];
					}
				}
			}
			$condition = ' and uniacid=:uniacid';
			$params = array(':uniacid' => $_W['uniacid']);
			$banklist = pdo_fetchall('SELECT * FROM ' . tablename('ewei_shop_commission_bank') . ' WHERE 1 ' . $condition . '  ORDER BY displayorder DESC', $params);
		}
	}
	if (!(empty($last_data))) 
	{
		if (array_key_exists($last_data['type'], $type_array)) 
		{
			$type_array[$last_data['type']]['checked'] = 1;
		}
	}
	
	foreach ($orderids as $o ) 
	{
		pdo_update('ewei_shop_order_goods', array('status' . $o['level'] => 1, 'applytime' . $o['level'] => $time), array('orderid' => $o['orderid'], 'uniacid' => $_W['uniacid']));
	}
	if ($type == 2)
	{
		$apply['alipay'] = $member['alipay'];
	}
	if ($type == 3)
	{
		$apply['bankname'] = $member['bankname'];
		$apply['bankcard'] = $member['bankcard'];
	}
	$applyno = m('common')->createNO('commission_apply', 'applyno', 'CA');
	$apply['realname'] = $member['realname'];
	$apply['mobile'] = $member['mobile'];
	$apply['uniacid'] = $_W['uniacid'];
	$apply['applyno'] = $applyno;
	$apply['orderids'] = iserializer($orderids);
	$apply['mid'] = $member['id'];
	$apply['commission'] = $commission_ok;
	$apply['type'] = $type;
	if ($type == 0 && !$agentset['check_cashcredit'])
	{
		$apply['status'] = 3;
		$apply['paytime'] = $time;
	}
	else
	{
		$apply['status'] = 1;
	}
	$apply['applytime'] = $time;
	$apply['realmoney'] = $realmoney;
	$apply['deductionmoney'] = $deductionmoney;
	$apply['charge'] = $set_array['charge'];
	$apply['beginmoney'] = $set_array['begin'];
	$apply['endmoney'] = $set_array['end'];
	pdo_insert('ewei_shop_commission_apply', $apply);

	if ($apply['status'] == 3)
	{
		$title = '佣金提现';
		m('member')->setCredit($openid, 'credit2', $realmoney, array(0, $title));
		$other = array('remark' => $title);
		m('member')->accountRecord($mid, $commission, 3, $other);
	}		
}

/* 提现设置 */
elseif ($op == 'set')
{
	$settype = $_GPC['settype'];
	$columns = 'realname, mobile, alipay, bankname, bankcard, withdraw_pwd';
	$member = m('member')->getInfo($openid, $columns);
	$res['member'] = $member;
	if ($settype != 'realname' && $member['realname'] == '')
	{
		$this->result(1, '请先完成实名认证');
	}
}

/* 保存设置 */
elseif ($op == 'saveSet')
{
	$settype = $_GPC['settype'];
	$update = array();
	$columns = 'realname, mobile, alipay, bankname, bankcard, withdraw_pwd';
	$member = m('member')->getInfo($openid, $columns);
	if ($settype == 'realname')
	{
		if (empty($_GPC['realname']) || empty($_GPC['mobile']))
		{
			$this->result(1, '请输入姓名和手机号');
		}
		$update['realname'] = $_GPC['realname'];
		$update['mobile']  = $_GPC['mobile'];
	}
	elseif ($settype == 'alipay')
	{
		if ($member['realname'] == '')
		{
			$this->result(1, '请先完成实名认证');
		}
		if (empty($_GPC['alipay']))
		{
			$this->result(1, '请输入支付宝账号');
		}
		$update['alipay'] = $_GPC['alipay'];
		$update['mobile']  = $_GPC['mobile'];
	}
	elseif ($settype == 'pwd')
	{
		// 如果有原密码
		if ($member['withdraw_pwd'] != '')
		{
			if (empty($_GPC['y_wpwd']))
			{
				$this->result(1, '请输入原密码');
			}
			if ($member['withdraw_pwd'] != md5($_GPC['y_wpwd']))
			{
				$this->result(1, '原密码不正确');
			}
		}
		if (empty($_GPC['wpwd']) || empty($_GPC['c_wpwd']))
		{
			$this->result(1, '新密码和确认密码不能为空');
		}
		if ($_GPC['wpwd'] != $_GPC['c_wpwd'])
		{
			$this->result(1, '新密码和确认密码不能为空');
		}
		$update['withdraw_pwd'] = md5($_GPC['wpwd']);
	}
	elseif ($settype == 'bankcard')
	{
		if ($member['realname'] == '')
		{
			$this->result(1, '请先完成实名认证');
		}
		if (empty($_GPC['bankcard']) || empty($_GPC['bankname']))
		{
			$this->result(1, '请输入银行卡和开户银行名称');
		}
		$update['bankcard'] = $_GPC['bankcard'];
		$update['bankname']  = $_GPC['bankname'];
	}
	pdo_update('ewei_shop_member', $update, array('openid' => $openid, 'uniacid' => $uniacid));
}

/* 提现记录 */
elseif ($op == 'log')
{
	$pindex = max(1, intval($_GPC['page']));
	$psize = 20;
	$condition = ' and mid = :mid and uniacid=:uniacid ';
	$params = array(':uniacid' => $uniacid, ':mid' => $mid);
	$from = !empty($_GPC['from']) ? strtotime($_GPC['from']) : 0;
	$to   = !empty($_GPC['to'])   ? strtotime($_GPC['to'])   : 0;
	$status = $_GPC['status'] ? intval($_GPC['status']) : 1;

	if ($status == 1)
	{
		$condition .= ' and (status = 1 or status = 2)';
	}
	else
	{
		$condition .= ' and status = ' . intval($status);
	}
	if ($from > 0)
	{
		$condition .= ' and applytime >=  ' . $from;
	}
	
	if ($to > 0)
	{
		$condition .= ' and applytime <  ' . $to;
	}
	$columns = 'realname, applytime, commission, type, applyno, alipay, bankname, bankcard ';
	$list  = pdo_fetchall('select '. $columns .'  from ' . tablename('ewei_shop_commission_apply') . ' where 1 ' . $condition . 
			' order by id desc LIMIT ' . (($pindex - 1) * $psize) . ',' . $psize, $params);
	$total = pdo_fetchcolumn('select count(*) from ' . tablename('ewei_shop_commission_apply') . ' where 1 ' . $condition, $params);
	$sum   = pdo_fetchcolumn('select ifnull(sum(commission), 0) from ' . tablename('ewei_shop_commission_apply') . ' where 1 ' . $condition, $params);

	foreach ($list as &$row ) {
		$row['applytime']  = date('Y-m-d H:i', $row['applytime']);
		$row['commission'] = round($row['commission'], 2);
		$row['withdrawType'] = m('shop')->withdrawType($row['type']) . '提现';
		if ($row['type'] == 2)
		{
			$row['desc'] = $row['realname'] . ' ' . $row['alipay']; 
		}
		elseif ($row['type'] == 3)
		{
			$row['desc'] = $row['realname'] . ' ' . $row['bankname'] . ' ' . $row['bankcard']; 
		}
		else
		{
			$row['desc'] = '到本账号';
		}
		$row['desc'] .= '; 流水号' . $row['applyno'];
		
	}
	unset($row);
	$res['list'] = $list;
	$res['page'] = $pindex;
	$res['total'] = $total;
	$res['sum'] = $sum;
}

$this->result(0, '', $res);
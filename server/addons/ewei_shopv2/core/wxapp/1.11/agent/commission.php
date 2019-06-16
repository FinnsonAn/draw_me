<?php
if (!defined('IN_IA')) {
	exit('Access Denied');
}
global $_GPC, $_W;
$op = $_GPC['op'];
$res = array();
$_W['account']['type'] = ACCOUNT_TYPE_APP_NORMAL;

/* 检测登录状态 */
if (m('account')->checkWxappLogin())
{
	$this->result(1, '请先登录');
}

/* 取得会员相关信息 */
$openid = m('member')->getOpenid();
$uniacid = $_W['uniacid'];
$member = m('member')->getMember($openid, 'id, credit1, credit2');

/* 判断是否是分销商 */
$pset = p('commission')->getSet();
$com_set = m('common')->getPluginset('commission');
if (!p('commission')->isAgent($openid))
{
	if ($member['isagent'])
	{
		$this->result(1, $pset['texts']['agent'] . '申请正在审核中');
	}
	$desc = p('commission')->becomeDesc($openid);
	$this->result(2, '您还不是' . $pset['texts']['agent'] . ', ' . $desc, array('become' => $com_set['become']));
}

if ($op == 'list')
{
	$commission_total = 0;
	$openid = $_W['openid'];
	$member = p('commission')->getInfo($openid, array('ordercount0'));
	$agentLevel = p('commission')->getLevel($openid);
	$level = $com_set['level'];
	$status = trim($_GPC['status']);
	$condition = ' and o.status>=0';
	if ($status != '') {
		$condition = ' and o.status=' . intval($status);
	}
	$orders = array();
	$level1 = $member['level1'];
	$level2 = $member['level2'];
	$level3 = $member['level3'];
	$ordercount = $member['ordercount0']; //分销订单数

	if ($level >= 1) {
		//一级下线
		$level1_memberids = pdo_fetchall('select id from ' . tablename('ewei_shop_member') . ' where uniacid=:uniacid and agentid=:agentid', array(':uniacid' => $_W['uniacid'], ':agentid' => $member['id']), 'id');
		$level1_orders = pdo_fetchall('select commission1,o.id,o.createtime,o.price,og.commissions from ' . tablename('ewei_shop_order_goods') . ' og '
				. ' left join  ' . tablename('ewei_shop_order') . ' o on og.orderid=o.id '
				. " where o.uniacid=:uniacid and o.agentid=:agentid {$condition} and og.status1>=0 and og.nocommission=0", array(':uniacid' => $_W['uniacid'], ':agentid' => $member['id']));

		foreach ($level1_orders as $o) {
			if (empty($o['id'])) {
				continue;
			}
			$commissions = iunserializer($o['commissions']);
			$commission = iunserializer($o['commission1']);
			if (empty($commissions)) {
				$commission_ok = isset($commission['level' . $agentLevel['id']]) ? $commission['level' . $agentLevel['id']] : $commission['default'];
			} else {
				$commission_ok = isset($commissions['level1']) ? floatval($commissions['level1']) : 0;
			}
			$hasorder = false;
			foreach ($orders as &$or) {
				if ($or['id'] == $o['id'] && $or['level'] == 1) {
					$or['commission']+=$commission_ok;
					$hasorder = true;
					break;
				}
			}
			unset($or);
			if (!$hasorder && $commission_ok > 0) {
				$orders[] = array('id' => $o['id'], 'commission' => $commission_ok, 'createtime' => $o['createtime'], 'level' => 1);
			}
		}
	}
	if ($level >= 2) {
		//二级下线
		if ($level1 > 0) {
			$level2_orders = pdo_fetchall('select commission2 ,o.id,o.createtime,o.price,og.commissions   from ' . tablename('ewei_shop_order_goods') . ' og '
					. ' left join  ' . tablename('ewei_shop_order') . ' o on og.orderid=o.id '
					. " where o.uniacid=:uniacid and o.agentid in( " . implode(',', array_keys($member['level1_agentids'])) . ")  {$condition}  and og.status2>=0 and og.nocommission=0 ", array(':uniacid' => $_W['uniacid']));
			foreach ($level2_orders as $o) {
				if (empty($o['id'])) {
					continue;
				}
				$commissions = iunserializer($o['commissions']);
				$commission = iunserializer($o['commission2']);
				if (empty($commissions)) {
					$commission_ok = isset($commission['level' . $agentLevel['id']]) ? $commission['level' . $agentLevel['id']] : $commission['default'];
				} else {
					$commission_ok = isset($commissions['level2']) ? floatval($commissions['level2']) : 0;
				}
				$hasorder = false;
				foreach ($orders as &$or) {
					if ($or['id'] == $o['id'] && $or['level'] == 2) {
						$or['commission']+=$commission_ok;
						$hasorder = true;
						break;
					}
				}
				unset($or);
				if (!$hasorder && $commission_ok > 0) {
					$orders[] = array('id' => $o['id'], 'commission' => $commission_ok, 'createtime' => $o['createtime'], 'level' => 2);
				}
			}
		}
	}
	if ($level >= 3) {
		if ($level2 > 0) {
			$level3_orders = pdo_fetchall('select commission3 ,o.id,o.createtime,o.price,og.commissions  from ' . tablename('ewei_shop_order_goods') . ' og '
					. ' left join  ' . tablename('ewei_shop_order') . ' o on og.orderid=o.id '
					. ' where o.uniacid=:uniacid and o.agentid in( ' . implode(',', array_keys($member['level2_agentids'])) . ")  {$condition} and og.status3>=0 and og.nocommission=0", array(':uniacid' => $_W['uniacid']));
			foreach ($level3_orders as $o) {
				if (empty($o['id'])) {
					continue;
				}
				$commissions = iunserializer($o['commissions']);
				$commission = iunserializer($o['commission3']);
				if (empty($commissions)) {
					$commission_ok = isset($commission['level' . $agentLevel['id']]) ? $commission['level' . $agentLevel['id']] : $commission['default'];
				} else {
					$commission_ok = isset($commissions['level3']) ? floatval($commissions['level3']) : 0;
				}

				$hasorder = false;
				foreach ($orders as &$or) {
					if ($or['id'] == $o['id'] && $or['level'] == 3) {
						$or['commission']+=$commission_ok;
						$hasorder = true;
						break;
					}
				}
				unset($or);
				if (!$hasorder && $commission_ok > 0) {
					$orders[] = array('id' => $o['id'], 'commission' => $commission_ok, 'createtime' => $o['createtime'], 'level' => 3);
				}
			}
		}
	}
	if ($orders)
		usort($orders, function($a, $b) {
			if ($a['createtime'] == $b['createtime']) {
				return 0;
			} else {
				return ($a['createtime'] < $b['createtime']) ? 1 : -1;
			}
		});

	$pindex = max(1, intval($_GPC['page']));
	$psize = 10;
	$orders1 = array_slice($orders, ($pindex - 1) * $psize, $psize);
	$orderids = array();
	foreach ($orders1 as $o) {
		$orderids[$o['id']] = $o;
	}
	$list = array();
	if (!empty($orderids)) {

		$list = pdo_fetchall("select id,ordersn,openid,createtime,status, userid from " . tablename('ewei_shop_order') . "  where uniacid ={$_W['uniacid']} and id in ( " . implode(',', array_keys($orderids)) . ") order by id desc");
		foreach ($list as &$row) {

			$row['commission'] = number_format((float)$orderids[$row['id']]['commission'], 2);
			$row['createtime'] = date('Y-m-d H:i', $row['createtime']);
			if ($row['status'] == 0) {
				$row['status'] = '待付款';
			} else if ($row['status'] == 1) {
				$row['status'] = '已付款';
			} else if ($row['status'] == 2) {
				$row['status'] = '待收货';
			} else if ($row['status'] == 3) {
				$row['status'] = '已完成';
			}
			if ($orderids[$row['id']]['level'] == 1) {
				$row['level'] = $com_set['selfbuy'] ? '本人' : $com_set['texts']['c1'];
			} else if ($orderids[$row['id']]['level'] == 2) {
				$row['level'] = $com_set['selfbuy'] ?  $com_set['texts']['c1'] : $com_set['texts']['c2'];
			} else if ($orderids[$row['id']]['level'] == 3) {
				$row['level'] = $com_set['selfbuy'] ?  $com_set['texts']['c2'] : $com_set['texts']['c3'];
			}
			if (!empty($this->set['openorderdetail'])) {
				$goods = pdo_fetchall("SELECT og.id,og.goodsid,g.thumb,og.price,og.total,g.title,og.optionname,"
						. "og.commission1,og.commission2,og.commission3,og.commissions,"
						. "og.status1,og.status2,og.status3,"
						. "og.content1,og.content2,og.content3 from " . tablename('ewei_shop_order_goods') . " og"
						. " left join " . tablename('ewei_shop_goods') . " g on g.id=og.goodsid  "
						. " where og.orderid=:orderid and og.nocommission=0 and og.uniacid = :uniacid order by og.createtime  desc ", array(':uniacid' => $_W['uniacid'], ':orderid' => $row['id']));
				$goods = set_medias($goods, 'thumb');
				foreach ($goods as &$g) {
					$commissions = iunserializer($g['commissions']);
					if ($orderids[$row['id']]['level'] == 1) {
						$commission = iunserializer($g['commission1']);
						if (empty($commissions)) {
							$g['commission'] = isset($commission['level' . $agentLevel['id']]) ? $commission['level' . $agentLevel['id']] : $commission['default'];
						} else {
							$g['commission'] = isset($commissions['level1']) ? floatval($commissions['level1']) : 0;
						}
					} else if ($orderids[$row['id']]['level'] == 2) {
						$commission = iunserializer($g['commission2']);
						if (empty($commissions)) {
							$g['commission'] = isset($commission['level' . $agentLevel['id']]) ? $commission['level' . $agentLevel['id']] : $commission['default'];
						} else {

							$g['commission'] = isset($commissions['level2']) ? floatval($commissions['level2']) : 0;
						}
					} else if ($orderids[$row['id']]['level'] == 3) {
						$commission = iunserializer($g['commission3']);
						if (empty($commissions)) {
							$g['commission'] = isset($commission['level' . $agentLevel['id']]) ? $commission['level' . $agentLevel['id']] : $commission['default'];
						} else {
							$g['commission'] = isset($commissions['level3']) ? floatval($commissions['level3']) : 0;
						}
					}
					$g['commission'] = priceFormat1($g['commission']);
					
					$commission_total += $g['commission'] ;
				}
				unset($g);
				$row['order_goods'] = set_medias($goods, 'thumb');
				$row['username'] = m('member')->getMemname($row['userid']);
			} 
			$row['buyer'] = m('member')->getMember($row['openid'], 'id, nickname, realname, mobile, weixin');
		}

		unset($row);
	}
	$res = array(
		'list' => $list,
		'page' => $pindex,
		'commission_total' => $commission_total
	);

}

elseif ($op == 'commission')
{
	$commission = p('commission')->getInfo($openid, array('total', 'ok', 'apply', 'check', 'lock', 'pay', 'wait', 'fail'));
	$agentset = p('commission')->getSet($uniacid);
	$agentset_arr = array();
	$agentset_arr['texts']['commission_ok']    = $agentset['texts']['commission_ok'];
	$agentset_arr['texts']['commission_total'] = $agentset['texts']['commission_total'];
	$agentset_arr['texts']['commission_apply'] = $agentset['texts']['commission_apply'];
	$agentset_arr['texts']['commission_lock']  = $agentset['texts']['commission_lock'];
	$agentset_arr['texts']['commission_pay']   = $agentset['texts']['commission_pay'];
	$res['commission'] = $commission;
	$res['agentset'] = $agentset_arr;
}

$this->result(0, '', $res);
?>


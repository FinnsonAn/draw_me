<?php
if (!defined('IN_IA')) {
	exit('Access Denied');
}
global $_GPC, $_W;
$op = $_GPC['op'];
$res = array();
$openid = m('member')->getOpenid();

/* 检测登录状态 */
if (m('account')->checkWxappLogin())
{
	$this->result(1, '请先登录');
}

$uniacid = $_W['uniacid'];

if ($op == 'main')
{
	$orderlist = array();
	$pindex = max(1, intval($_GPC['page']));
	$psize = 5;
	$status = intval($_GPC['status']);
	if (empty($status))
	{
		$status = -2;
	}
	$condition = ' and openid= \''. $openid .'\'  and userdeleted=0 and '. 
			     ' deleted=0 and uniacid = :uniacid and parentid = 0 ';
	$params = array(':uniacid' => $uniacid);

	if ($status != -2) {
		$status = intval($status);
		if ($status != 4) {
			if ($status == 2) {
				$condition .= ' and (status=2 or status=0 and paytype=3)';
			}
			 else if ($status == 0) {
				$condition .= ' and status=0 and paytype!=3';
			}
			 else if ($status == 3) {
				$condition .= ' and status=3 and iscomment = 0';
			}
			 else {
				$condition .= ' and status=' . intval($status);
			}
		}
		 else {
			$condition .= ' and status = 3 and iscomment=1';
		}
	}
	 else {
		$condition .= ' and status>0';
	}
	$list = pdo_fetchall('select * from ' . tablename('ewei_shop_order') . ' where 1 ' . $condition . 
			' order by createtime desc LIMIT ' . (($pindex - 1) * $psize) . ',' . $psize, $params);
	$total = pdo_fetchcolumn('select count(*) from ' . tablename('ewei_shop_order') . 
			' where 1 ' . $condition, $params);
	$tradeset = m('common')->getSysset('trade');
	$refunddays = intval($tradeset['refunddays']);
	
	foreach ($list as $row ) 
	{
		$order = array();
		$order['id'] = $row['id'];
		$order['ordersn'] = $row['ordersn'];
		$order['status'] = $row['status'];
		$order['price'] = $row['price'];
		$order['goods'] = m('order')->getOrderGoods($row['id']);
		$order['goodscount'] = count($row['goods']);
		$order['createtime'] = date('Y-m-d H:i', $row['createtime']);
		$order['statusstr'] = m('order')->orderStatus($row);
		$order['op'] = m('order')->orderOperator($row);
		$pay = m('shop')->getPaymentByIndex($row['paytype']);
		$order['paytype'] = $pay['name'];
		if ((0 < $row['refundstate']) && !empty($row['refundid'])) {
			$refund = pdo_fetch('select * from ' . tablename('ewei_shop_order_refund') . 
					  ' where id=:id and uniacid=:uniacid and orderid=:orderid limit 1', 
					  array(':id' => $row['refundid'], ':uniacid' => $uniacid, ':orderid' => $row['id']));

			if (!empty($refund)) {
				$order['statusstr'] = '待' . $r_type[$refund['rtype']];
			}
		}

		$canrefund = false;
		if (($row['status'] == 1) || ($row['status'] == 2)) {
			if ((0 < $refunddays) || ($row['status'] == 1)) {
				$canrefund = true;
			}
		}
		 else if ($row['status'] == 3) {
			if (($row['isverify'] != 1) && empty($row['virtual'])) {
				if (0 < $refunddays) {
					$days = intval((time() - $row['finishtime']) / 3600 / 24);

					if ($days <= $refunddays) {
						$canrefund = true;
					}
				}
			}
		}
		$order['canrefund'] = $canrefund;

		if ($canrefund == true) {
			if ($row['status'] == 1) {
				$order['refund_button'] = '申请退款';
			}
			 else {
				$order['refund_button'] = '申请售后';
			}
			if (!empty($row['refundstate'])) {
				$order['refund_button'] .= '中';
			}
		}
		
		$orderlist[] = $order;
	}
	unset($row);
	$res['list'] = $orderlist;
	$res['page'] = $pindex;
}

$this->result(0, '', $res);

?>
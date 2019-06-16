<?php
if (!(defined('IN_IA'))) {
	exit('Access Denied');
}

class Order_EweiShopV2Model
{
	/* 订单号找到订单数据 */
	function getOrderBysn($order_sn, $columns = '*')
	{
		global $_W;
		if (empty($order_sn)) return false;
		$order = pdo_fetch('select '. $columns . ' from '. tablename('ewei_shop_order') .
					' where ordersn = \''. $order_sn .'\' and uniacid = '. $_W["uniacid"] .'');		
		return $order;
	}
	/* id号找到订单数据 */
	function getOrderByid($oid, $columns = '*')
	{
		global $_W;
		if (empty($oid)) return false;
		$order = pdo_fetch('select '. $columns . ' from '. tablename('ewei_shop_order') .
					' where id = :oid and uniacid = :uniacid', 
					array(':oid' => $oid, ':uniacid' => $_W["uniacid"]));
		return $order;
	}
	
	public function fullback($orderid)
	{
		global $_W;
		$uniacid = $_W['uniacid'];
		$order_goods = pdo_fetchall('select o.openid,og.optionid,og.goodsid,og.price,og.total from ' . tablename('ewei_shop_order_goods') . ' as og' . "\r\n" . '                    left join ' . tablename('ewei_shop_order') . ' as o on og.orderid = o.id' . "\r\n" . '                    where og.uniacid = ' . $uniacid . ' and og.orderid = ' . $orderid . ' ');
		foreach($order_goods as $value){
		$goods = pdo_fetch('select * from ' . tablename('ewei_shop_goods') . ' where id=:id and uniacid=:uniacid and isfullback = 1 limit 1', array(':id' => $value['goodsid'], ':uniacid' => $uniacid));
		$fullbackgoods = pdo_fetch('SELECT id,minallfullbackallprice,maxallfullbackallprice,minallfullbackallratio,maxallfullbackallratio,`day`,' . "\r\n" . '                          fullbackprice,fullbackratio,status,hasoption,marketprice,`type`,startday' . "\r\n" . '                          FROM ' . tablename('ewei_shop_fullback_goods') . ' WHERE uniacid = ' . $uniacid . ' and goodsid = ' . $value['goodsid'] . ' limit 1');

		if (!(empty($fullbackgoods)) && $goods['hasoption'] && (0 < $value['optionid'])) {
			$option = pdo_fetch('select id,title,allfullbackprice,allfullbackratio,fullbackprice,fullbackratio,`day` from ' . tablename('ewei_shop_goods_option') . ' ' . "\r\n" . '                        where id=:id and goodsid=:goodsid and uniacid=:uniacid and isfullback = 1 limit 1', array(':uniacid' => $uniacid, ':goodsid' => $value['goodsid'], ':id' => $value['optionid']));

			if (!(empty($option))) {
				$fullbackgoods['minallfullbackallprice'] = $option['allfullbackprice'];
				$fullbackgoods['minallfullbackallratio'] = $option['allfullbackratio'];
				$fullbackgoods['fullbackprice'] = $option['fullbackprice'];
				$fullbackgoods['fullbackratio'] = $option['fullbackratio'];
				$fullbackgoods['day'] = $option['day'];
			}

		}


		$fullbackgoods['startday'] = $fullbackgoods['startday'] - 1;
		$data = array('uniacid' => $uniacid, 'orderid' => $orderid, 'openid' => $value['openid'], 'day' => $fullbackgoods['day'], 'fullbacktime' => strtotime('+' . $fullbackgoods['startday'] . ' days'), 'goodsid' => $value['goodsid'], 'createtime' => time());

		if (0 < $fullbackgoods['type']) {
			$data['price'] = ($value['price'] * $fullbackgoods['minallfullbackallratio']) / 100;
			$data['priceevery'] = ($value['price'] * $fullbackgoods['fullbackratio']) / 100;
		}
		 else {
			$data['price'] = $fullbackgoods['minallfullbackallprice'];
			$data['priceevery'] = $fullbackgoods['fullbackprice'];
		}

		$i = 0;

		pdo_insert('ewei_shop_fullback_log', $data);
		++$i;
		}
	}

	public function fullbackstop($orderid)
	{
		global $_W;
		global $_S;
		$uniacid = $_W['uniacid'];
		$shopset = $_S['shop'];
		$fullback_log = pdo_fetch('select * from ' . tablename('ewei_shop_fullback_log') . ' where uniacid = ' . $uniacid . ' and orderid = ' . $orderid . ' ');
		pdo_update('ewei_shop_fullback_log', array('isfullback' => 1), array('id' => $fullback_log['id'], 'uniacid' => $uniacid));
	}
	
	/* 插入支付日志 */
	function insertPaylog($ordersn, $data)
	{
		global $_W;
		if (empty($ordersn) || !is_array($data))
		{
			return 0;
		}
		$log = pdo_fetch('SELECT * FROM ' . tablename('core_paylog') . 
			   ' WHERE `uniacid`=:uniacid AND `module`=:module '. 
			   ' AND `tid`=:tid limit 1', array(':uniacid' => $_W['uniacid'], 
			   ':module' => 'ewei_shop', ':tid' => $ordersn));
		if ($log)
		{
			$plid = $log['plid'];
		}	   
		else
		{
			pdo_insert('core_paylog', $data);
			$plid = pdo_insertid();
		}
		
		return $plid;
		
	}
	
	/* 查询支付日志 */
	function getPaylog($ordersn)
	{
		global $_W;
		if (empty($ordersn))
		{
			return;
		}
		$log = pdo_fetch('SELECT * FROM ' . tablename('core_paylog') . 
			   ' WHERE `uniacid`=:uniacid AND `module`=:module '. 
			   ' AND `tid`=:tid limit 1', array(':uniacid' => $_W['uniacid'], 
			   ':tid' => $ordersn));
		return $log;
		
	}
	
	/* 支付成功 */
	public function payResult1($log)
    {
        global $_W;
        $fee = round($log["fee"], 2);
        $status = array("status" => $log["result"] == "success" ? 1 : 0);
        $order = $this->getOrderBysn($log["tid"]);
        $paylog = pdo_fetch("select * from " . tablename("core_paylog") . 
				 " where `uniacid` = ". $_W["uniacid"] ." and fee = ". $fee ." and ".
				 "`uniacid`=". $_W['uniacid'] ." and `tid`='". $log["tid"] ."' limit 1");
		/*
        if (empty($paylog)) {
            show_json(-1, "订单金额错误, 请重试!");
            exit;
        }*/
        $orderid = $order["id"];
        if ($log["from"] == "return") {
            $address = false;
            if (empty($order["dispatchtype"])) {
                $address = m('member')->getAddress($addressid, $order['openid']);
            }
            $carrier = false;
            if ($order["dispatchtype"] == 1 || $order["isvirtual"] == 1) {
                $carrier = unserialize($order["carrier"]);
            }
          
			if ($order["status"] == 0) {
				// 更新订单为支付状态
				$update_arr = array("status" => 1, "paytime" => time());
				pdo_update("ewei_shop_order", $update_arr, array("id" => $orderid));

				// 更新库存、销量和积分
				$this->setStocksAndCredits($orderid, 1);
				
				/* 返优惠券
				if (p("coupon") && !empty($order["couponid"])) {
					p("coupon")->backConsumeCoupon($order["id"]);
				}
				m("notice")->sendOrderMessage($orderid);
				*/
				com_run('printer::sendOrderMessage', $orderid);
				
				// 返佣
				$member = m('member')->getMember($order['openid'], 'id, old_credit2');
				if (p("commission") && intval($member['old_credit2']) == 0) {
					p("commission")->checkOrderPay($order["id"]);
				}
				
			}
			return 1;
        }
    }
	
	/**
     * 支付成功
     * @global type $_W
     * @param type $params
     */
	public function payResult($params)
	{
		global $_W;
		$fee = intval($params['fee']);
		$data = array('status' => ($params['result'] == 'success' ? 1 : 0));
		$ordersn = $params['tid'];
		$order = pdo_fetch('select id,ordersn, price,openid,dispatchtype,addressid,carrier,status,isverify,deductcredit2,`virtual`,isvirtual,couponid,isvirtualsend,isparent,paytype,merchid,agentid,createtime,buyagainprice from ' . tablename('ewei_shop_order') . ' where  ordersn=:ordersn and uniacid=:uniacid limit 1', array(':uniacid' => $_W['uniacid'], ':ordersn' => $ordersn));
		$orderid = $order['id'];
		$ispeerpay = $this->checkpeerpay($orderid);

		if (!(empty($ispeerpay))) {
			$peerpay_info = (double) pdo_fetchcolumn('select SUM(price) price from ' . tablename('ewei_shop_order_peerpay_payinfo') . ' where pid=:pid limit 1', array(':pid' => $ispeerpay['id']));

			if ($peerpay_info < $ispeerpay['peerpay_realprice']) {
				return;
			}


			pdo_update('ewei_shop_order', array('status' => 0), array('id' => $order['id']));
			$order['status'] = 0;
			pdo_update('ewei_shop_order_peerpay', array('status' => 1), array('id' => $ispeerpay['id']));
			$params['type'] = 'peerpay';
		}


		if ($params['from'] == 'return') {
			$seckill_result = plugin_run('seckill::setOrderPay', $order['id']);

			if ($seckill_result == 'refund') {
				return 'seckill_refund';
			}


			$address = false;

			if (empty($order['dispatchtype'])) {
				$address = pdo_fetch('select realname,mobile,address from ' . tablename('ewei_shop_member_address') . ' where id=:id limit 1', array(':id' => $order['addressid']));
			}


			$carrier = false;
			if (($order['dispatchtype'] == 1) || ($order['isvirtual'] == 1)) {
				$carrier = unserialize($order['carrier']);
			}


			if ($params['type'] == 'cash') {
				if ($order['isparent'] == 1) {
					$change_data = array();
					$change_data['merchshow'] = 1;
					pdo_update('ewei_shop_order', $change_data, array('id' => $orderid));
					$this->setChildOrderPayResult($order, 0, 0);
				}


				return true;
			}


			if ($order['status'] == 0) {
				if (!(empty($order['virtual'])) && com('virtual')) {
					return com('virtual')->pay($order);
				}


				if ($order['isvirtualsend']) {
					return $this->payVirtualSend($order['id']);
				}


				$time = time();
				$change_data = array();
				$change_data['status'] = 1;
				$change_data['paytime'] = $time;

				if ($order['isparent'] == 1) {
					$change_data['merchshow'] = 1;
				}


				pdo_update('ewei_shop_order', $change_data, array('id' => $orderid));

				if ($order['isparent'] == 1) {
					$this->setChildOrderPayResult($order, $time, 1);
				}


				$this->setStocksAndCredits($orderid, 1);

				if (com('coupon')) {
					com('coupon')->sendcouponsbytask($order['id']);
				}


				if (com('coupon') && !(empty($order['couponid']))) {
					com('coupon')->backConsumeCoupon($order['id']);
				}


				m('notice')->sendOrderMessage($orderid);

				if ($order['isparent'] == 1) {
					$child_list = $this->getChildOrder($order['id']);

					foreach ($child_list as $k => $v ) {
						if (!(empty($v['merchid']))) {
							m('notice')->sendOrderMessage($v['id']);
						}

					}
				}
				
				com_run('printer::sendOrderMessage', $orderid);

				if (p('commission')) {
					p('commission')->checkOrderPay($order['id']);
				}


				if (p('task')) {
					if ($order['iscomment']) {
						p('task')->checkTaskReward('commission_order', 1);
					}


					p('task')->checkTaskReward('cost_total', $order['price']);
					p('task')->checkTaskReward('cost_enough', $order['price']);
					p('task')->checkTaskReward('cost_count', 1);
					$goodslist = pdo_fetchall('SELECT goodsid FROM ' . tablename('ewei_shop_order_goods') . ' WHERE orderid = :orderid AND uniacid = :uniacid', array(':orderid' => $orderid, ':uniacid' => $_W['uniacid']));

					foreach ($goodslist as $item ) {
						p('task')->checkTaskReward('cost_goods' . $item['goodsid'], 1, $_W['openid']);
					}
				}


				if (p('lottery') && empty($ispeerpay)) {
					$res = p('lottery')->getLottery($order['openid'], 1, array('money' => $order['price'], 'paytype' => 1));

					if ($res) {
						p('lottery')->getLotteryList($order['openid'], array('lottery_id' => $res));
					}

				}

			}


			return true;
		}


		return false;
	}

	/**
     * 子订单支付成功
     * @global type $_W
     * @param type $order
     * @param type $time
     */
	public function setChildOrderPayResult($order, $time, $type)
	{
		global $_W;
		$orderid = $order['id'];
		$list = $this->getChildOrder($orderid);

		if (!(empty($list))) {
			$change_data = array();

			if ($type == 1) {
				$change_data['status'] = 1;
				$change_data['paytime'] = $time;
			}


			$change_data['merchshow'] = 0;

			foreach ($list as $k => $v ) {
				if ($v['status'] == 0) {
					pdo_update('ewei_shop_order', $change_data, array('id' => $v['id']));
				}

			}
		}

	}

	/**
     * 设置订单支付方式
     * @global type $_W
     * @param type $orderid
     * @param type $paytype
     */
	public function setOrderPayType($orderid, $paytype)
	{
		global $_W;
		pdo_update('ewei_shop_order', array('paytype' => $paytype), array('id' => $orderid));

		if (!(empty($orderid))) {
			pdo_update('ewei_shop_order', array('paytype' => $paytype), array('parentid' => $orderid));
		}

	}

	/**
     * 获取子订单
     * @global type $_W
     * @param type $orderid
     */
	public function getChildOrder($orderid)
	{
		global $_W;
		$list = pdo_fetchall('select id,ordersn,status,finishtime,couponid,merchid  from ' . tablename('ewei_shop_order') . ' where  parentid=:parentid and uniacid=:uniacid', array(':parentid' => $orderid, ':uniacid' => $_W['uniacid']));
		return $list;
	}

	/**
     * 虚拟商品自动发货
     * @param int $orderid
     * @return bool?
     */
	public function payVirtualSend($orderid = 0)
	{
		global $_W;
		global $_GPC;
		$order = pdo_fetch('select id,ordersn, price,openid,dispatchtype,addressid,carrier,status,isverify,deductcredit2,`virtual`,isvirtual,couponid from ' . tablename('ewei_shop_order') . ' where  id=:id and uniacid=:uniacid limit 1', array(':uniacid' => $_W['uniacid'], ':id' => $orderid));
		$order_goods = pdo_fetch('select g.virtualsend,g.virtualsendcontent from ' . tablename('ewei_shop_order_goods') . ' og ' . ' left join ' . tablename('ewei_shop_goods') . ' g on g.id=og.goodsid ' . ' where og.orderid=:orderid and og.uniacid=:uniacid limit 1', array(':uniacid' => $_W['uniacid'], ':orderid' => $orderid));
		$time = time();
		pdo_update('ewei_shop_order', array('virtualsend_info' => $order_goods['virtualsendcontent'], 'status' => '3', 'paytime' => $time, 'sendtime' => $time, 'finishtime' => $time), array('id' => $orderid));
		m('order')->fullback($order['id']);
		$this->setStocksAndCredits($orderid, 1);
		m('member')->upgradeLevel($order['openid']);
		$this->setGiveBalance($orderid, 1);

		if (com('coupon')) {
			com('coupon')->sendcouponsbytask($order['id']);
		}


		if (com('coupon') && !(empty($order['couponid']))) {
			com('coupon')->backConsumeCoupon($order['id']);
		}


		m('notice')->sendOrderMessage($orderid);

		if (p('commission')) {
			p('commission')->checkOrderPay($order['id']);
			p('commission')->checkOrderFinish($order['id']);
		}


		return true;
	}

	/**
     * 计算订单中商品累计赠送的积分
     * @param type $order
     */
	public function getGoodsCredit($goods)
	{
		global $_W;
		$credits = 0;

		foreach ($goods as $g ) {
			$gcredit = trim($g['credit']);

			if (!(empty($gcredit))) {
				if (strexists($gcredit, '%')) {
					$credits += intval((floatval(str_replace('%', '', $gcredit)) / 100) * $g['realprice']);
				}
				 else {
					$credits += intval($g['credit']) * $g['total'];
				}
			}

		}

		return $credits;
	}

	/**
     * 返还抵扣的余额
     * @param type $order
     */
	public function setDeductCredit2($order)
	{
		global $_W;

		if (0 < $order['deductcredit2']) {
			m('member')->setCredit($order['openid'], 'credit2', $order['deductcredit2'], array('0', $_W['shopset']['shop']['name'] . '购物返还抵扣余额 余额: ' . $order['deductcredit2'] . ' 订单号: ' . $order['ordersn']));
		}

	}

	/**
     * 处理赠送余额情况
     * @param type $orderid
     * @param type $type 1 订单完成 2 售后
     */
	public function setGiveBalance($orderid = '', $type = 0)
	{
		global $_W;
		$order = pdo_fetch('select id,ordersn,price,openid,dispatchtype,addressid,carrier,status from ' . tablename('ewei_shop_order') . ' where id=:id limit 1', array(':id' => $orderid));
		$goods = pdo_fetchall('select og.goodsid,og.total,g.totalcnf,og.realprice,g.money,og.optionid,g.total as goodstotal,og.optionid,g.sales,g.salesreal from ' . tablename('ewei_shop_order_goods') . ' og ' . ' left join ' . tablename('ewei_shop_goods') . ' g on g.id=og.goodsid ' . ' where og.orderid=:orderid and og.uniacid=:uniacid ', array(':uniacid' => $_W['uniacid'], ':orderid' => $orderid));
		$balance = 0;

		foreach ($goods as $g ) {
			$gbalance = trim($g['money']);

			if (!(empty($gbalance))) {
				if (strexists($gbalance, '%')) {
					$balance += round((floatval(str_replace('%', '', $gbalance)) / 100) * $g['realprice'], 2);
				}
				 else {
					$balance += round($g['money'], 2) * $g['total'];
				}
			}

		}

		if (0 < $balance) {
			$shopset = m('common')->getSysset('shop');

			if ($type == 1) {
				if ($order['status'] == 3) {
					m('member')->setCredit($order['openid'], 'credit2', $balance, array(0, $shopset['name'] . '购物赠送余额 订单号: ' . $order['ordersn']));
				}

			}
			 else if ($type == 2) {
				if (1 <= $order['status']) {
					m('member')->setCredit($order['openid'], 'credit2', -$balance, array(0, $shopset['name'] . '购物取消订单扣除赠送余额 订单号: ' . $order['ordersn']));
				}

			}

		}

	}

	/**
     * //处理订单库存及用户积分情况(赠送积分)
     * @param type $orderid
     * @param type $type 0 下单 1 支付 2 取消
     */
	public function setStocksAndCredits($orderid = '', $type = 0)
	{
		global $_W;
		$order = pdo_fetch('select id,ordersn,price,openid,dispatchtype,addressid,carrier,status,isparent,paytype from ' . tablename('ewei_shop_order') . ' where id=:id limit 1', array(':id' => $orderid));
		$param = array();
		$param[':uniacid'] = $_W['uniacid'];

		if ($order['isparent'] == 1) {
			$condition = ' og.parentorderid=:parentorderid';
			$param[':parentorderid'] = $orderid;
		}
		 else {
			$condition = ' og.orderid=:orderid';
			$param[':orderid'] = $orderid;
		}

		$goods = pdo_fetchall('select og.goodsid,og.total,g.totalcnf,og.realprice,g.credit,og.optionid,g.total as goodstotal,og.optionid,g.sales,g.salesreal from ' . tablename('ewei_shop_order_goods') . ' og ' . ' left join ' . tablename('ewei_shop_goods') . ' g on g.id=og.goodsid ' . ' where ' . $condition . ' and og.uniacid=:uniacid ', $param);
		$credits = 0;

		foreach ($goods as $g ) {
			$goods_item = pdo_fetch('select total as goodstotal from' . tablename('ewei_shop_goods') . ' where id=:id and uniacid=:uniacid limit 1', array(':id' => $g['goodsid'], ':uniacid' => $_W['uniacid']));
			$g['goodstotal'] = $goods_item['goodstotal'];
			$stocktype = 0;

			if ($type == 0) {
				if ($g['totalcnf'] == 0) {
					$stocktype = -1;
				}

			}
			 else if ($type == 1) {
				if ($g['totalcnf'] == 1) {
					$stocktype = -1;
				}

			}
			 else if ($type == 2) {
				if (1 <= $order['status']) {
					if ($g['totalcnf'] == 1) {
						$stocktype = 1;
					}

				}
				 else if ($g['totalcnf'] == 0) {
					$stocktype = 1;
				}

			}


			if (!(empty($stocktype))) {
				$data = m('common')->getSysset('trade');

				if (!(empty($data['stockwarn']))) {
					$stockwarn = intval($data['stockwarn']);
				}
				 else {
					$stockwarn = 5;
				}

				if (!(empty($g['optionid']))) {
					$option = m('goods')->getOption($g['goodsid'], $g['optionid']);

					if (!(empty($option)) && ($option['stock'] != -1)) {
						$stock = -1;

						if ($stocktype == 1) {
							$stock = $option['stock'] + $g['total'];
						}
						 else if ($stocktype == -1) {
							$stock = $option['stock'] - $g['total'];
							($stock <= 0) && ($stock = 0);

							if ($stock <= $stockwarn) {
								m('notice')->sendStockWarnMessage($g['goodsid'], $g['optionid']);
							}

						}


						if ($stock != -1) {
							pdo_update('ewei_shop_goods_option', array('stock' => $stock), array('uniacid' => $_W['uniacid'], 'goodsid' => $g['goodsid'], 'id' => $g['optionid']));
						}

					}

				}


				if (!(empty($g['goodstotal'])) && ($g['goodstotal'] != -1)) {
					$totalstock = -1;

					if ($stocktype == 1) {
						$totalstock = $g['goodstotal'] + $g['total'];
					}
					 else if ($stocktype == -1) {
						$totalstock = $g['goodstotal'] - $g['total'];
						($totalstock <= 0) && ($totalstock = 0);

						if ($totalstock <= $stockwarn) {
							m('notice')->sendStockWarnMessage($g['goodsid'], 0);
						}

					}


					if ($totalstock != -1) {
						pdo_update('ewei_shop_goods', array('total' => $totalstock), array('uniacid' => $_W['uniacid'], 'id' => $g['goodsid']));
					}

				}

			}


			$gcredit = trim($g['credit']);

			if (!(empty($gcredit))) {
				if (strexists($gcredit, '%')) {
					$credits += intval((floatval(str_replace('%', '', $gcredit)) / 100) * $g['realprice']);
				}
				 else {
					$credits += intval($g['credit']) * $g['total'];
				}
			}


			if ($type == 0) {
				if ($g['totalcnf'] != 1) {
					pdo_update('ewei_shop_goods', array('sales' => $g['sales'] + $g['total']), array('uniacid' => $_W['uniacid'], 'id' => $g['goodsid']));
				}

			}
			 else if ($type == 1) {
				if (1 <= $order['status']) {
					if ($g['totalcnf'] != 1) {
						pdo_update('ewei_shop_goods', array('sales' => $g['sales'] + $g['total']), array('uniacid' => $_W['uniacid'], 'id' => $g['goodsid']));
					}


					$salesreal = pdo_fetchcolumn('select ifnull(sum(total),0) from ' . tablename('ewei_shop_order_goods') . ' og ' . ' left join ' . tablename('ewei_shop_order') . ' o on o.id = og.orderid ' . ' where og.goodsid=:goodsid and o.status>=1 and o.uniacid=:uniacid limit 1', array(':goodsid' => $g['goodsid'], ':uniacid' => $_W['uniacid']));
					pdo_update('ewei_shop_goods', array('salesreal' => $salesreal), array('id' => $g['goodsid']));
				}

			}

		}

		if (0 < $credits) {
			$shopset = m('common')->getSysset('shop');

			if ($type == 1) {
				m('member')->setCredit($order['openid'], 'credit1', $credits, array(0, $shopset['name'] . '购物积分 订单号: ' . $order['ordersn']));
				m('notice')->sendMemberPointChange($order['openid'], $credits, 0);
			}
			 else if ($type == 2) {
				if (1 <= $order['status']) {
					m('member')->setCredit($order['openid'], 'credit1', -$credits, array(0, $shopset['name'] . '购物取消订单扣除积分 订单号: ' . $order['ordersn']));
					m('notice')->sendMemberPointChange($order['openid'], $credits, 1);
				}

			}

		}
		 else if ($type == 1) {
			$money = com_run('sale::getCredit1', $order['openid'], (double) $order['price'], $order['paytype'], 1);

			if (0 < $money) {
				m('notice')->sendMemberPointChange($order['openid'], $money, 0);
			}

		}
		 else if ($type == 2) {
			if (1 <= $order['status']) {
				$money = com_run('sale::getCredit1', $order['openid'], (double) $order['price'], $order['paytype'], 1, 1);

				if (0 < $money) {
					m('notice')->sendMemberPointChange($order['openid'], $money, 1);
				}

			}

		}

	}

	public function getTotals($merch = 0)
	{
		global $_W;
		$paras = array(':uniacid' => $_W['uniacid']);
		$merch = intval($merch);
		$condition = ' and isparent=0';

		if ($merch < 0) {
			$condition .= ' and merchid=0';
		}


		$totals['all'] = pdo_fetchcolumn('SELECT COUNT(1) FROM ' . tablename('ewei_shop_order') . '' . ' WHERE uniacid = :uniacid ' . $condition . ' and ismr=0 and deleted=0', $paras);
		$totals['status_1'] = pdo_fetchcolumn('SELECT COUNT(1) FROM ' . tablename('ewei_shop_order') . '' . ' WHERE uniacid = :uniacid ' . $condition . ' and ismr=0 and status=-1 and refundtime=0 and deleted=0', $paras);
		$totals['status0'] = pdo_fetchcolumn('SELECT COUNT(1) FROM ' . tablename('ewei_shop_order') . '' . ' WHERE uniacid = :uniacid ' . $condition . ' and ismr=0  and status=0 and paytype<>3 and deleted=0', $paras);
		$totals['status1'] = pdo_fetchcolumn('SELECT COUNT(1) FROM ' . tablename('ewei_shop_order') . '' . ' WHERE uniacid = :uniacid ' . $condition . ' and ismr=0  and ( status=1 or ( status=0 and paytype=3) ) and deleted=0', $paras);
		$totals['status2'] = pdo_fetchcolumn('SELECT COUNT(1) FROM ' . tablename('ewei_shop_order') . '' . ' WHERE uniacid = :uniacid ' . $condition . ' and ismr=0  and ( status=2 or (status = 1 and sendtype > 0) ) and deleted=0', $paras);
		$totals['status3'] = pdo_fetchcolumn('SELECT COUNT(1) FROM ' . tablename('ewei_shop_order') . '' . ' WHERE uniacid = :uniacid ' . $condition . ' and ismr=0  and status=3 and deleted=0', $paras);
		$totals['status4'] = pdo_fetchcolumn('SELECT COUNT(1) FROM ' . tablename('ewei_shop_order') . '' . ' WHERE uniacid = :uniacid ' . $condition . ' and ismr=0  and refundstate>0 and refundid<>0 and deleted=0', $paras);
		$totals['status5'] = pdo_fetchcolumn('SELECT COUNT(1) FROM ' . tablename('ewei_shop_order') . '' . ' WHERE uniacid = :uniacid ' . $condition . ' and ismr=0 and refundtime<>0 and deleted=0', $paras);
		return $totals;
	}

	public function getFormartDiscountPrice($isd, $gprice, $gtotal = 1)
	{
		$price = $gprice;

		if (!(empty($isd))) {
			if (strexists($isd, '%')) {
				$dd = floatval(str_replace('%', '', $isd));

				if ((0 < $dd) && ($dd < 100)) {
					$price = round(($dd / 100) * $gprice, 2);
				}

			}
			 else if (0 < floatval($isd)) {
				$price = round(floatval($isd * $gtotal), 2);
			}

		}


		return $price;
	}

	public function getGoodsDiscounts($goods, $isdiscount_discounts, $levelid, $options = array())
	{
		$key = ((empty($levelid) ? 'default' : 'level' . $levelid));
		$prices = array();

		if (empty($goods['merchsale'])) {
			if (!(empty($isdiscount_discounts[$key]))) {
				foreach ($isdiscount_discounts[$key] as $k => $v ) {
					$k = substr($k, 6);
					$op_marketprice = m('goods')->getOptionPirce($goods['id'], $k);
					$gprice = $this->getFormartDiscountPrice($v, $op_marketprice);
					$prices[] = $gprice;

					if (!(empty($options))) {
						foreach ($options as $key => $value ) {
							if ($value['id'] == $k) {
								$options[$key]['marketprice'] = $gprice;
							}

						}
					}

				}
			}

		}
		 else if (!(empty($isdiscount_discounts['merch']))) {
			foreach ($isdiscount_discounts['merch'] as $k => $v ) {
				$k = substr($k, 6);
				$op_marketprice = m('goods')->getOptionPirce($goods['id'], $k);
				$gprice = $this->getFormartDiscountPrice($v, $op_marketprice);
				$prices[] = $gprice;

				if (!(empty($options))) {
					foreach ($options as $key => $value ) {
						if ($value['id'] == $k) {
							$options[$key]['marketprice'] = $gprice;
						}

					}
				}

			}
		}


		$data = array();
		$data['prices'] = $prices;
		$data['options'] = $options;
		return $data;
	}

	public function getGoodsDiscountPrice($g, $level, $type = 0)
	{
		global $_W;

		if (!(empty($level['id']))) {
			$level = pdo_fetch('select * from ' . tablename('ewei_shop_member_level') . ' where id=:id and uniacid=:uniacid and enabled=1 limit 1', array(':id' => $level['id'], ':uniacid' => $_W['uniacid']));
			$level = ((empty($level) ? array() : $level));
		}


		if ($type == 0) {
			$total = $g['total'];
		}
		 else {
			$total = 1;
		}

		$gprice = $g['marketprice'] * $total;

		if (empty($g['buyagain_islong'])) {
			$gprice = $g['marketprice'] * $total;
		}


		$buyagain_sale = true;
		$buyagainprice = 0;
		$canbuyagain = false;

		if (empty($g['is_task_goods'])) {
			if (0 < floatval($g['buyagain'])) {
				if (m('goods')->canBuyAgain($g)) {
					$canbuyagain = true;

					if (empty($g['buyagain_sale'])) {
						$buyagain_sale = false;
					}

				}

			}

		}


		$price = $gprice;
		$price1 = $gprice;
		$price2 = $gprice;
		$taskdiscountprice = 0;
		$lotterydiscountprice = 0;

		if (!(empty($g['is_task_goods']))) {
			$buyagain_sale = false;
			$price = $g['task_goods']['marketprice'] * $total;

			if ($price < $gprice) {
				$d_price = abs($gprice - $price);

				if ($g['is_task_goods'] == 1) {
					$taskdiscountprice = $d_price;
				}
				 else if ($g['is_task_goods'] == 2) {
					$lotterydiscountprice = $d_price;
				}

			}

		}


		$discountprice = 0;
		$isdiscountprice = 0;
		$isd = false;
		@$isdiscount_discounts = json_decode($g['isdiscount_discounts'], true);
		$discounttype = 0;
		$isCdiscount = 0;
		$isHdiscount = 0;
		if ($g['isdiscount'] && (time() <= $g['isdiscount_time']) && $buyagain_sale) {
			if (is_array($isdiscount_discounts)) {
				$key = ((!(empty($level['id'])) ? 'level' . $level['id'] : 'default'));
				if (!(isset($isdiscount_discounts['type'])) || empty($isdiscount_discounts['type'])) {
					if (empty($g['merchsale'])) {
						$isd = trim($isdiscount_discounts[$key]['option0']);

						if (!(empty($isd))) {
							$price1 = $this->getFormartDiscountPrice($isd, $gprice, $total);
						}

					}
					 else {
						$isd = trim($isdiscount_discounts['merch']['option0']);

						if (!(empty($isd))) {
							$price1 = $this->getFormartDiscountPrice($isd, $gprice, $total);
						}

					}
				}
				 else if (empty($g['merchsale'])) {
					$isd = trim($isdiscount_discounts[$key]['option' . $g['optionid']]);

					if (!(empty($isd))) {
						$price1 = $this->getFormartDiscountPrice($isd, $gprice, $total);
					}

				}
				 else {
					$isd = trim($isdiscount_discounts['merch']['option' . $g['optionid']]);

					if (!(empty($isd))) {
						$price1 = $this->getFormartDiscountPrice($isd, $gprice, $total);
					}

				}
			}


			if ($gprice <= $price1) {
				$isdiscountprice = 0;
				$isCdiscount = 0;
			}
			 else {
				$isdiscountprice = abs($price1 - $gprice);
				$isCdiscount = 1;
			}
		}


		if (empty($g['isnodiscount']) && $buyagain_sale) {
			$discounts = json_decode($g['discounts'], true);

			if (is_array($discounts)) {
				$key = ((!(empty($level['id'])) ? 'level' . $level['id'] : 'default'));
				if (!(isset($discounts['type'])) || empty($discounts['type'])) {
					if (!(empty($discounts[$key]))) {
						$dd = floatval($discounts[$key]);

						if ((0 < $dd) && ($dd < 10)) {
							$price2 = round(($dd / 10) * $gprice, 2);
						}

					}
					 else {
						$dd = floatval($discounts[$key . '_pay'] * $total);
						$md = floatval($level['discount']);

						if (!(empty($dd))) {
							$price2 = round($dd, 2);
						}
						 else if (0 < $md) {
							$price2 = round(($md / 10) * $gprice, 2);
						}

					}
				}
				 else {
					$isd = trim($discounts[$key]['option' . $g['optionid']]);

					if (!(empty($isd))) {
						$price2 = $this->getFormartDiscountPrice($isd, $gprice, $total);
					}

				}
			}


			if ($gprice <= $price2) {
				$discountprice = 0;
				$isHdiscount = 0;
			}
			 else {
				$discountprice = abs($price2 - $gprice);
				$isHdiscount = 1;
			}
		}


		if ($isCdiscount == 1) {
			$price = $price1;
			$discounttype = 1;
		}
		 else if ($isHdiscount == 1) {
			$price = $price2;
			$discounttype = 2;
		}


		$unitprice = round($price / $total, 2);
		$isdiscountunitprice = round($isdiscountprice / $total, 2);
		$discountunitprice = round($discountprice / $total, 2);

		if ($canbuyagain) {
			if (empty($g['buyagain_islong'])) {
				$buyagainprice = ($unitprice * (10 - $g['buyagain'])) / 10;
			}
			 else {
				$buyagainprice = ($price * (10 - $g['buyagain'])) / 10;
			}
		}


		$price = $price - $buyagainprice;
		return array('unitprice' => $unitprice, 'price' => $price, 'taskdiscountprice' => $taskdiscountprice, 'lotterydiscountprice' => $lotterydiscountprice, 'discounttype' => $discounttype, 'isdiscountprice' => $isdiscountprice, 'discountprice' => $discountprice, 'isdiscountunitprice' => $isdiscountunitprice, 'discountunitprice' => $discountunitprice, 'price0' => $gprice, 'price1' => $price1, 'price2' => $price2, 'buyagainprice' => $buyagainprice);
	}

	public function getChildOrderPrice($order, $goods, $dispatch_array, $merch_array, $sale_plugin, $discountprice_array)
	{
		global $_GPC;
		$totalprice = $order['price'];
		$goodsprice = $order['goodsprice'];
		$grprice = $order['grprice'];
		$deductprice = $order['deductprice'];
		$deductcredit = $order['deductcredit'];
		$deductcredit2 = $order['deductcredit2'];
		$deductenough = $order['deductenough'];
		$is_deduct = 0;
		$is_deduct2 = 0;
		$deduct_total = 0;
		$deduct2_total = 0;
		$ch_order = array();

		if ($sale_plugin) {
			if (!(empty($_GPC['deduct']))) {
				$is_deduct = 1;
			}


			if (!(empty($_GPC['deduct2']))) {
				$is_deduct2 = 1;
			}

		}


		foreach ($goods as &$g ) {
			$merchid = $g['merchid'];
			$ch_order[$merchid]['goods'][] = $g['goodsid'];
			$ch_order[$merchid]['grprice'] += $g['ggprice'];
			$ch_order[$merchid]['goodsprice'] += $g['marketprice'] * $g['total'];
			$ch_order[$merchid]['couponprice'] = $discountprice_array[$merchid]['deduct'];

			if ($is_deduct == 1) {
				if ($g['manydeduct']) {
					$deduct = $g['deduct'] * $g['total'];
				}
				 else {
					$deduct = $g['deduct'];
				}

				if ($g['seckillinfo'] && ($g['seckillinfo']['status'] == 0)) {
				}
				 else {
					$deduct_total += $deduct;
					$ch_order[$merchid]['deducttotal'] += $deduct;
				}
			}


			if ($is_deduct2 == 1) {
				if ($g['deduct2'] == 0) {
					$deduct2 = $g['ggprice'];
				}
				 else if (0 < $g['deduct2']) {
					if ($g['ggprice'] < $g['deduct2']) {
						$deduct2 = $g['ggprice'];
					}
					 else {
						$deduct2 = $g['deduct2'];
					}
				}


				if ($g['seckillinfo'] && ($g['seckillinfo']['status'] == 0)) {
				}
				 else {
					$ch_order[$merchid]['deduct2total'] += $deduct2;
					$deduct2_total += $deduct2;
				}
			}

		}

		unset($g);

		foreach ($ch_order as $k => $v ) {
			if ($is_deduct == 1) {
				if (0 < $deduct_total) {
					$n = $v['deducttotal'] / $deduct_total;
					$deduct_credit = ceil(round($deductcredit * $n, 2));
					$deduct_money = round($deductprice * $n, 2);
					$ch_order[$k]['deductcredit'] = $deduct_credit;
					$ch_order[$k]['deductprice'] = $deduct_money;
				}

			}


			if ($is_deduct2 == 1) {
				if (0 < $deduct2_total) {
					$n = $v['deduct2total'] / $deduct2_total;
					$deduct_credit2 = round($deductcredit2 * $n, 2);
					$ch_order[$k]['deductcredit2'] = $deduct_credit2;
				}

			}


			$op = round($v['grprice'] / $grprice, 2);
			$ch_order[$k]['op'] = $op;

			if (0 < $deductenough) {
				$deduct_enough = round($deductenough * $op, 2);
				$ch_order[$k]['deductenough'] = $deduct_enough;
			}

		}

		foreach ($ch_order as $k => $v ) {
			$merchid = $k;
			$price = ($v['grprice'] - $v['deductprice'] - $v['deductcredit2'] - $v['deductenough'] - $v['couponprice']) + $dispatch_array['dispatch_merch'][$merchid];

			if (0 < $merchid) {
				$merchdeductenough = $merch_array[$merchid]['enoughdeduct'];

				if (0 < $merchdeductenough) {
					$price -= $merchdeductenough;
					$ch_order[$merchid]['merchdeductenough'] = $merchdeductenough;
				}

			}


			$ch_order[$merchid]['price'] = $price;
		}

		return $ch_order;
	}

	public function getMerchEnough($merch_array)
	{
		$merch_enough_total = 0;
		$merch_saleset = array();

		foreach ($merch_array as $key => $value ) {
			$merchid = $key;

			if (0 < $merchid) {
				$enoughs = $value['enoughs'];

				if (!(empty($enoughs))) {
					$ggprice = $value['ggprice'];

					foreach ($enoughs as $e ) {
						if ((floatval($e['enough']) <= $ggprice) && (0 < floatval($e['money']))) {
							$merch_array[$merchid]['showenough'] = 1;
							$merch_array[$merchid]['enoughmoney'] = $e['enough'];
							$merch_array[$merchid]['enoughdeduct'] = $e['money'];
							$merch_saleset['merch_showenough'] = 1;
							$merch_saleset['merch_enoughmoney'] += $e['enough'];
							$merch_saleset['merch_enoughdeduct'] += $e['money'];
							$merch_enough_total += floatval($e['money']);
							break;
						}

					}
				}

			}

		}

		$data = array();
		$data['merch_array'] = $merch_array;
		$data['merch_enough_total'] = $merch_enough_total;
		$data['merch_saleset'] = $merch_saleset;
		return $data;
	}

	public function getOrderDispatchPrice($goods, $member, $address, $saleset = false, $merch_array, $t, $loop = 0)
	{
		global $_W;
		$area_set = m('util')->get_area_config_set();
		$new_area = intval($area_set['new_area']);
		$realprice = 0;
		$dispatch_price = 0;
		$dispatch_array = array();
		$dispatch_merch = array();
		$total_array = array();
		$totalprice_array = array();
		$nodispatch_array = array();
		$goods_num = count($goods);
		$seckill_payprice = 0;
		$seckill_dispatchprice = 0;
		$user_city = '';
		$user_city_code = '';

		if (empty($new_area)) {
			if (!(empty($address))) {
				$user_city = $user_city_code = $address['city'];
			}
			 else if (!(empty($member['city']))) {
				$user_city = $user_city_code = $member['city'];
			}

		}
		 else if (!(empty($address))) {
			$user_city = $address['city'] . $address['area'];
			$user_city_code = $address['datavalue'];
		}

		if (is_array($goods))
		{
			foreach ($goods as $g ) {
				$realprice += $g['ggprice'];
				$dispatch_merch[$g['merchid']] = 0;
				$total_array[$g['goodsid']] += $g['total'];
				$totalprice_array[$g['goodsid']] += $g['ggprice'];
			}
	
			foreach ($goods as $g ) {
				$seckillinfo = plugin_run('seckill::getSeckill', $g['goodsid'], $g['optionid'], true, $_W['openid']);
				if ($seckillinfo && ($seckillinfo['status'] == 0)) {
					$seckill_payprice += $g['ggprice'];
				}
	
	
				$isnodispatch = 0;
				$sendfree = false;
				$merchid = $g['merchid'];
	
				if (!(empty($g['issendfree']))) {
					$sendfree = true;
				}
				 else {
					if ($seckillinfo && ($seckillinfo['status'] == 0)) {
					}
					 else if (($g['ednum'] <= $total_array[$g['goodsid']]) && (0 < $g['ednum'])) {
						if (empty($new_area)) {
							$gareas = explode(';', $g['edareas']);
						}
						 else {
							$gareas = explode(';', $g['edareas_code']);
						}
	
						if (empty($gareas)) {
							$sendfree = true;
						}
						 else if (!(empty($address))) {
							if (!(in_array($user_city_code, $gareas))) {
								$sendfree = true;
							}
	
						}
						 else if (!(empty($member['city']))) {
							if (!(in_array($member['city'], $gareas))) {
								$sendfree = true;
							}
	
						}
						 else {
							$sendfree = true;
						}
					}
	
	
					if ($seckillinfo && ($seckillinfo['status'] == 0)) {
					}
					 else if ((floatval($g['edmoney']) <= $totalprice_array[$g['goodsid']]) && (0 < floatval($g['edmoney']))) {
						if (empty($new_area)) {
							$gareas = explode(';', $g['edareas']);
						}
						 else {
							$gareas = explode(';', $g['edareas_code']);
						}
	
						if (empty($gareas)) {
							$sendfree = true;
						}
						 else if (!(empty($address))) {
							if (!(in_array($user_city_code, $gareas))) {
								$sendfree = true;
							}
	
						}
						 else if (!(empty($member['city']))) {
							if (!(in_array($member['city'], $gareas))) {
								$sendfree = true;
							}
	
						}
						 else {
							$sendfree = true;
						}
					}
	
				}
	
				if ($g['dispatchtype'] == 1) {
					if (!(empty($user_city))) {
						if (empty($new_area)) {
							$citys = m('dispatch')->getAllNoDispatchAreas();
						}
						 else {
							$citys = m('dispatch')->getAllNoDispatchAreas('', 1);
						}
	
						if (!(empty($citys))) {
							if (in_array($user_city_code, $citys) && !(empty($citys))) {
								$isnodispatch = 1;
								$has_goodsid = 0;
	
								if (!(empty($nodispatch_array['goodid']))) {
									if (in_array($g['goodsid'], $nodispatch_array['goodid'])) {
										$has_goodsid = 1;
									}
	
								}
	
	
								if ($has_goodsid == 0) {
									$nodispatch_array['goodid'][] = $g['goodsid'];
									$nodispatch_array['title'][] = $g['title'];
									$nodispatch_array['city'] = $user_city;
								}
	
							}
	
						}
	
					}
	
	
					if ((0 < $g['dispatchprice']) && !($sendfree) && ($isnodispatch == 0)) {
						$dispatch_merch[$merchid] += $g['dispatchprice'];
						if ($seckillinfo && ($seckillinfo['status'] == 0)) {
							$seckill_dispatchprice += $g['dispatchprice'];
						}
						 else {
							$dispatch_price += $g['dispatchprice'];
						}
					}
	
				}
				 else if ($g['dispatchtype'] == 0) {
					if (empty($g['dispatchid'])) {
						$dispatch_data = m('dispatch')->getDefaultDispatch($merchid);
					}
					 else {
						$dispatch_data = m('dispatch')->getOneDispatch($g['dispatchid']);
					}
	
					if (empty($dispatch_data)) {
						$dispatch_data = m('dispatch')->getNewDispatch($merchid);
					}
	
	
					if (!(empty($dispatch_data))) {
						$isnoarea = 0;
						$dkey = $dispatch_data['id'];
						$isdispatcharea = intval($dispatch_data['isdispatcharea']);
	
						if (!(empty($user_city))) {
							if (empty($isdispatcharea)) {
								if (empty($new_area)) {
									$citys = m('dispatch')->getAllNoDispatchAreas($dispatch_data['nodispatchareas']);
								}
								 else {
									$citys = m('dispatch')->getAllNoDispatchAreas($dispatch_data['nodispatchareas_code'], 1);
								}
	
								if (!(empty($citys))) {
									if (in_array($user_city_code, $citys)) {
										$isnoarea = 1;
									}
	
								}
	
							}
							 else {
								if (empty($new_area)) {
									$citys = m('dispatch')->getAllNoDispatchAreas();
								}
								 else {
									$citys = m('dispatch')->getAllNoDispatchAreas('', 1);
								}
	
								if (!(empty($citys))) {
									if (in_array($user_city_code, $citys)) {
										$isnoarea = 1;
									}
	
								}
	
	
								if (empty($isnoarea)) {
									$isnoarea = m('dispatch')->checkOnlyDispatchAreas($user_city_code, $dispatch_data);
								}
	
							}
	
							if (!(empty($isnoarea))) {
								$isnodispatch = 1;
								$has_goodsid = 0;
	
								if (!(empty($nodispatch_array['goodid']))) {
									if (in_array($g['goodsid'], $nodispatch_array['goodid'])) {
										$has_goodsid = 1;
									}
	
								}
	
	
								if ($has_goodsid == 0) {
									$nodispatch_array['goodid'][] = $g['goodsid'];
									$nodispatch_array['title'][] = $g['title'];
									$nodispatch_array['city'] = $user_city;
								}
	
							}
	
						}
	
	
						if (!$sendfree  && !$sendfree && ($isnodispatch == 0)) {
							$areas = unserialize($dispatch_data['areas']);
	
							if ($dispatch_data['calculatetype'] == 1) {
								$param = $g['total'];
							}
							 else {
								$param = $g['weight'] * $g['total'];
							}
	
							if (array_key_exists($dkey, $dispatch_array)) {
								$dispatch_array[$dkey]['param'] += $param;
							}
							 else {
								$dispatch_array[$dkey]['data'] = $dispatch_data;
								$dispatch_array[$dkey]['param'] = $param;
							}
	
							if ($seckillinfo && ($seckillinfo['status'] == 0)) {
								if (array_key_exists($dkey, $dispatch_array)) {
									$dispatch_array[$dkey]['seckillnums'] += $param;
								}
								 else {
									$dispatch_array[$dkey]['seckillnums'] = $param;
								}
							}
	
						}
	
					}
	
				}
	
			}
		}

		if (!(empty($dispatch_array))) {
			$dispatch_info = array();

			foreach ($dispatch_array as $k => $v ) {
				$dispatch_data = $dispatch_array[$k]['data'];
				$param = $dispatch_array[$k]['param'];
				$areas = unserialize($dispatch_data['areas']);

				if (!(empty($address))) {
					$dprice = m('dispatch')->getCityDispatchPrice($areas, $address, $param, $dispatch_data);
				}
				 else if (!(empty($member['city']))) {
					$dprice = m('dispatch')->getCityDispatchPrice($areas, $member, $param, $dispatch_data);
				}
				 else {
					$dprice = m('dispatch')->getDispatchPrice($param, $dispatch_data);
				}

				$merchid = $dispatch_data['merchid'];
				$dispatch_merch[$merchid] += $dprice;

				if (0 < $v['seckillnums']) {
					$seckill_dispatchprice += $dprice;
				}
				 else {
					$dispatch_price += $dprice;
				}

				$dispatch_info[$dispatch_data['id']]['price'] += $dprice;
				$dispatch_info[$dispatch_data['id']]['freeprice'] = intval($dispatch_data['freeprice']);
			}

			if (!(empty($dispatch_info))) {
				foreach ($dispatch_info as $k => $v ) {
					if ((0 < $v['freeprice']) && ($v['freeprice'] <= $v['price'])) {
						$dispatch_price -= $v['price'];
					}

				}

				if ($dispatch_price < 0) {
					$dispatch_price = 0;
				}

			}

		}


		if (!(empty($merch_array))) {
			foreach ($merch_array as $key => $value ) {
				$merchid = $key;

				if (0 < $merchid) {
					$merchset = $value['set'];

					if (!(empty($merchset['enoughfree']))) {
						if (floatval($merchset['enoughorder']) <= 0) {
							$dispatch_price = $dispatch_price - $dispatch_merch[$merchid];
							$dispatch_merch[$merchid] = 0;
						}
						 else if (floatval($merchset['enoughorder']) <= $merch_array[$merchid]['ggprice']) {
							if (empty($merchset['enoughareas'])) {
								$dispatch_price = $dispatch_price - $dispatch_merch[$merchid];
								$dispatch_merch[$merchid] = 0;
							}
							 else {
								$areas = explode(';', $merchset['enoughareas']);

								if (!(empty($address))) {
									if (!(in_array($address['city'], $areas))) {
										$dispatch_price = $dispatch_price - $dispatch_merch[$merchid];
										$dispatch_merch[$merchid] = 0;
									}

								}
								 else if (!(empty($member['city']))) {
									if (!(in_array($member['city'], $areas))) {
										$dispatch_price = $dispatch_price - $dispatch_merch[$merchid];
										$dispatch_merch[$merchid] = 0;
									}

								}
								 else if (empty($member['city'])) {
									$dispatch_price = $dispatch_price - $dispatch_merch[$merchid];
									$dispatch_merch[$merchid] = 0;
								}

							}
						}

					}

				}

			}
		}
		if ($saleset) {
			if (!(empty($saleset['enoughfree']))) {
				$saleset_free = 0;

				if ($loop == 0) {
					if (floatval($saleset['enoughorder']) <= 0) {
						$saleset_free = 1;
					}
					 else if (floatval($saleset['enoughorder']) <= $realprice - $seckill_payprice) {
						if (empty($saleset['enoughareas'])) {
							$saleset_free = 1;
						}
						 else {
							if (empty($new_area)) {
								$areas = explode(';', trim($saleset['enoughareas'], ';'));
							}
							 else {
								$areas = explode(';', trim($saleset['enoughareas_code'], ';'));
							}

							if (!(empty($user_city_code))) {
								if (!(in_array($user_city_code, $areas))) {
									$saleset_free = 1;
								}

							}

						}
					}

				}


				if ($saleset_free == 1) {
					$is_nofree = 0;
					$new_goods = array();

					if (!(empty($saleset['goodsids']))) {
						foreach ($goods as $k => $v ) {
							if (!(in_array($v['goodsid'], $saleset['goodsids']))) {
								$new_goods[$k] = $goods[$k];
								unset($goods[$k]);
							}
							 else {
								$is_nofree = 1;
							}
						}
					}


					if (($is_nofree == 1) && ($loop == 0)) {
						if ($goods_num == 1) {
							$new_data1 = $this->getOrderDispatchPrice($goods, $member, $address, $saleset, $merch_array, $t, 1);
							$dispatch_price = $new_data1['dispatch_price'];
						}
						 else {
							$new_data2 = $this->getOrderDispatchPrice($new_goods, $member, $address, $saleset, $merch_array, $t, 1);
							$dispatch_price = $dispatch_price - $new_data2['dispatch_price'];
						}
					}
					 else if ($saleset_free == 1) {
						$dispatch_price = 0;
					}

				}

			}

		}


		if ($dispatch_price == 0) {
			foreach ($dispatch_merch as &$dm ) {
				$dm = 0;
			}

			unset($dm);
		}


		if (!(empty($nodispatch_array))) {
			$nodispatch = '商品';

			foreach ($nodispatch_array['title'] as $k => $v ) {
				$nodispatch .= $v . ',';
			}

			$nodispatch = trim($nodispatch, ',');
			$nodispatch .= '不支持配送到' . $nodispatch_array['city'];
			$nodispatch_array['nodispatch'] = $nodispatch;
			$nodispatch_array['isnodispatch'] = 1;
		}


		$data = array();
		$data['dispatch_price'] = $dispatch_price + $seckill_dispatchprice;
		$data['dispatch_merch'] = $dispatch_merch;
		$data['nodispatch_array'] = $nodispatch_array;
		$data['seckill_dispatch_price'] = $seckill_dispatchprice;
		return $data;
	}

	public function changeParentOrderPrice($parent_order)
	{
		global $_W;
		$id = $parent_order['id'];
		$item = pdo_fetch('SELECT price,ordersn2,dispatchprice,changedispatchprice FROM ' . tablename('ewei_shop_order') . ' WHERE id = :id and uniacid=:uniacid', array(':id' => $id, ':uniacid' => $_W['uniacid']));

		if (!(empty($item))) {
			$orderupdate = array();
			$orderupdate['price'] = $item['price'] + $parent_order['price_change'];
			$orderupdate['ordersn2'] = $item['ordersn2'] + 1;
			$orderupdate['dispatchprice'] = $item['dispatchprice'] + $parent_order['dispatch_change'];
			$orderupdate['changedispatchprice'] = $item['changedispatchprice'] + $parent_order['dispatch_change'];

			if (!(empty($orderupdate))) {
				pdo_update('ewei_shop_order', $orderupdate, array('id' => $id, 'uniacid' => $_W['uniacid']));
			}

		}

	}

	public function getOrderCommission($orderid, $agentid = 0)
	{
		global $_W;

		if (empty($agentid)) {
			$item = pdo_fetch('select agentid from ' . tablename('ewei_shop_order') . ' where id=:id and uniacid=:uniacid Limit 1', array('id' => $orderid, ':uniacid' => $_W['uniacid']));

			if (!(empty($item))) {
				$agentid = $item['agentid'];
			}

		}


		$level = 0;
		$pc = p('commission');

		if ($pc) {
			$pset = $pc->getSet();
			$level = intval($pset['level']);
		}


		$commission1 = 0;
		$commission2 = 0;
		$commission3 = 0;
		$m1 = false;
		$m2 = false;
		$m3 = false;

		if (!(empty($level))) {
			if (!(empty($agentid))) {
				$m1 = m('member')->getMember($agentid);

				if (!(empty($m1['agentid']))) {
					$m2 = m('member')->getMember($m1['agentid']);

					if (!(empty($m2['agentid']))) {
						$m3 = m('member')->getMember($m2['agentid']);
					}

				}

			}

		}


		$order_goods = pdo_fetchall('select g.id,g.title,g.thumb,g.goodssn,og.goodssn as option_goodssn, g.productsn,og.productsn as option_productsn, og.total,og.price,og.optionname as optiontitle, og.realprice,og.changeprice,og.oldprice,og.commission1,og.commission2,og.commission3,og.commissions,og.diyformdata,og.diyformfields from ' . tablename('ewei_shop_order_goods') . ' og ' . ' left join ' . tablename('ewei_shop_goods') . ' g on g.id=og.goodsid ' . ' where og.uniacid=:uniacid and og.orderid=:orderid ', array(':uniacid' => $_W['uniacid'], ':orderid' => $orderid));

		foreach ($order_goods as &$og ) {
			if (!(empty($level)) && !(empty($agentid))) {
				$commissions = iunserializer($og['commissions']);

				if (!(empty($m1))) {
					if (is_array($commissions)) {
						$commission1 += ((isset($commissions['level1']) ? floatval($commissions['level1']) : 0));
					}
					 else {
						$c1 = iunserializer($og['commission1']);
						$l1 = $pc->getLevel($m1['openid']);
						$commission1 += ((isset($c1['level' . $l1['id']]) ? $c1['level' . $l1['id']] : $c1['default']));
					}
				}


				if (!(empty($m2))) {
					if (is_array($commissions)) {
						$commission2 += ((isset($commissions['level2']) ? floatval($commissions['level2']) : 0));
					}
					 else {
						$c2 = iunserializer($og['commission2']);
						$l2 = $pc->getLevel($m2['openid']);
						$commission2 += ((isset($c2['level' . $l2['id']]) ? $c2['level' . $l2['id']] : $c2['default']));
					}
				}


				if (!(empty($m3))) {
					if (is_array($commissions)) {
						$commission3 += ((isset($commissions['level3']) ? floatval($commissions['level3']) : 0));
					}
					 else {
						$c3 = iunserializer($og['commission3']);
						$l3 = $pc->getLevel($m3['openid']);
						$commission3 += ((isset($c3['level' . $l3['id']]) ? $c3['level' . $l3['id']] : $c3['default']));
					}
				}

			}

		}

		unset($og);
		$commission = $commission1 + $commission2 + $commission3;
		return $commission;
	}
	
	/* 插入订单商品 */
	function insertOrderGoods($goods_list, $orderid)
	{
		global $_W;
		$openid  = m('member')->getOpenid();;
		if ($orderid > 0 && is_array($goods_list))
		{
			$mid = m('member')->getMid();
			foreach ($goods_list as $goods)
			{
				if ($goods['id'] > 0 && $goods['total'] > 0)
				{
					$order_goods = array (
						'uniacid'    => $_W['uniacid'],
						'userid' 	 => $mid,
						'orderid'    => $orderid,
						'goodsid'    => $goods['id'],
						'price'      => $goods['subtotal'],
						'total'      => $goods['total'],
						'optionid'   => $goods['optionid'],
						'createtime' => time(),
						'optionname' => $goods['optiontitle'],
						'goodssn'    => $goods['goodssn'],
						'productsn'  => $goods['productsn'],
						'realprice'  => $goods['realprice'],
						'oldprice'   => $goods['oldprice'],
						'ismeeting'  => $goods['meetingprice'],
						'isdiscountprice'  => $goods['isdiscountprice']);
				}
				pdo_insert( 'ewei_shop_order_goods', $order_goods );
				
				
				// 清空购物车中的数据
				if ($goods['cartid'] > 0)
				{
					pdo_update('ewei_shop_member_cart', array('deleted' => 1),
						array('id' => $goods['cartid'], 'openid' => $openid));
				}
			}
		}
	}
	
	/* 取得订单商品 */
	function getOrderGoods($id, $columns = '')
	{
		global $_W;
		$shopset = m('common')->getSysset('shop');
		if (!$id)
		{
			return 0;
		}
		$ids = $id;
		if ($columns)
		{
			$columns .= ',';
		}
		$plugin_diyform = p('diyform');
		$rows = pdo_fetchall(' select g.id,g.title,g.thumb,g.goodssn,g.type, g.credit, '.
							 '  g.totalcnf, g.salesreal, g.isdiscount, g.sales, '. $columns .
							 ' og.*,  og.optionname as optiontitle from ' . 
			                 tablename('ewei_shop_order_goods') .  'as  og ' . ' left join ' . tablename('ewei_shop_goods') . 
							 ' g on g.id = og.goodsid' . ' where og.orderid in ('. $ids .')  and og.uniacid = :uniacid', 
							 array(':uniacid' => $_W['uniacid']));
		foreach($rows as &$row)
		{
			$row['url'] = mobileUrl('goods/detail', array('id' => $row['goodsid']));
			if (empty($row['thumb']))
			{
				$row['thumb'] =  tomedia($shopset['nothumb']);
			}
			else
			{
				$row['thumb'] =  tomedia($row['thumb']);
			}

			if (!empty($row['option_goodssn'])) {
				$row['goodssn'] = $row['option_goodssn'];
			}

			if (!empty($row['option_productsn'])) {
				$row['productsn'] = $row['option_productsn'];
			}
		
			$row['realprice']   = round($row['realprice'], 2);
			$row['subtotal']    = round($row['price'], 2);
			$row['price']       = round($row['realprice'], 2);
			$row['changeprice'] = round($row['changeprice'], 2);
			$row['oldprice']    = round($row['oldprice'], 2);
			$row['unit'] = $row['unit'] ? $row['unit'] : '件';
		}
		return $rows;					 
	}

	/* 统计订单商品数量 */
	function countOrderGoods($orderid)
	{
		$counts = 0;
		$counts = pdo_fetchcolumn('select ifnull(sum(total),0) from '. tablename('ewei_shop_order_goods') .
					' where orderid = '. $orderid .'');
		return $counts;
	}
	
	public function checkOrderGoods($orderid)
	{
		global $_W;
		$flag = 0;
		$msg = '订单中的商品' . '<br/>';
		$uniacid = $_W['uniacid'];
		$sql = 'select g.id,g.title,g.status,g.deleted' . ' from ' . tablename('ewei_shop_goods') . ' g left join  ' . tablename('ewei_shop_order_goods') . ' og on g.id=og.goodsid and g.uniacid=og.uniacid' . ' where og.orderid=:orderid and og.uniacid=:uniacid';
		$list = pdo_fetchall($sql, array(':uniacid' => $uniacid, ':orderid' => $orderid));

		if (!(empty($list))) {
			foreach ($list as $k => $v ) {
				if (empty($v['status']) || !(empty($v['deleted']))) {
					$flag = 1;
					$msg .= $v['title'] . '<br/>';
				}

			}

			if ($flag == 1) {
				$msg .= '已下架,不能付款!';
			}

		}


		$data = array();
		$data['flag'] = $flag;
		$data['msg'] = $msg;
		return $data;
	}

	public function checkpeerpay($orderid)
	{
		global $_W;
		$sql = 'SELECT p.*,o.openid FROM ' . tablename('ewei_shop_order_peerpay') . ' AS p JOIN ' . tablename('ewei_shop_order') . ' AS o ON p.orderid = o.id AND p.status = o.status WHERE p.orderid = :orderid AND p.uniacid = :uniacid AND (p.status = 0 OR p.status=1) AND o.status >= 0 LIMIT 1';
		$query = pdo_fetch($sql, array(':orderid' => $orderid, ':uniacid' => $_W['uniacid']));
		return $query;
	}

	public function peerStatus($param)
	{
		global $_W;
		return pdo_insert('ewei_shop_order_peerpay_payinfo', $param);
	}
	
	/* 某用户购买过某个商品的数量 */
	function getUserBuyGoodsCount($gid, $mid)
	{
		global $_W;
		if (!$gid || !$mid)
		{
			return 0;
		}
		$count = pdo_fetchcolumn ( 'select ifnull(sum(og.total),0)  from ' . 
			     tablename ( 'ewei_shop_order_goods' ) . ' og ' . ' left join ' . 		
				 tablename ( 'ewei_shop_order' ) . ' o on og.orderid=o.id ' . 
				 ' where og.goodsid=:goodsid and  o.status>=1 and o.userid= ' . $mid .
				 ' and og.uniacid=:uniacid ', 
				 array (':goodsid' => $gid,
						':uniacid' => $_W['uniacid']));
		return $count;
	}
	
	/* 取得某个时间段用户秒杀的商品数量 */
	public function getOrderDiscountGoodsNum($goodsid, $mid, $time = array())
	{
		if (!$mid || !$goodsid) { return 0;}
		$sql = ' o.userid = '. $mid .' and og.goodsid = '. $goodsid .' and og.is_discount = 1';
		if ($time['from'] > 0)
		{
			$sql .= ' and o.paytime >= ' .$time['from'];
		}
		if ($time['to'] > 0)
		{
			$sql .= ' and o.paytime < ' .$time['to'];
		}
		
		$num = pdo_fetchcolumn('select ifnull(sum(og.total), 0) from '. tablename('ewei_shop_order_goods') .
				' og left join '. tablename('ewei_shop_order') .' o on og.orderid = o.id '. 
				' where' . $sql . ' and o.status >= 1');
		return $num;
		
	}
	
	/* 取得支付列表 */
	function getPaymentList($goodslist = array())
	{
		global $_W, $_GPC;
		$is_offline_pay = true;  // 线下支付
		$is_cash = true;  // 货到付款
		
		/* 支付设置 */
		$payment = array();
		$payset = m('common')->getSysset('pay');

		// 微信支付
		load()->model('payment');
		$setting = uni_setting($_W['uniacid'], array('payment'));
		$pay_wechat = array('success' => false, 'qrcode' => false);
		if (is_weixin() || is_mobile()) {
			if ($payset['weixin'] == 1) {
				$pay_data = m('shop')->getPaymentByKeys('wechat');
				$pay_wechat['success'] = true;
				if (is_weixin())
				{
					$pay_wechat['isdefault'] = 1;
				}
				$pay_wechat['name'] = $pay_data['name'];
				$pay_wechat['key']  = 'wechat';
				$pay_wechat['type'] = $pay_data['type'];
				$payment['wechat'] = $pay_wechat;
			}
		}
		/*
		if (!is_mobile() && isset($payset['pay']) && ($payset['pay']['weixin'] == 1)) {
			if (isset($payset['pay']) && ($payset['pay']['weixin'] == 1)) {
				if (is_array($setting['payment']['wechat']) && $setting['payment']['wechat']['switch']) {
					$pay_wechatqr['qrcode'] = true;
					$pay_wechatqr['name'] = '微信支付';
					$pay_wechatqr['key']  = 'qrcode';
					$pay_wechatqr['type'] = 21;
					$payment['wechatqr'] = $pay_wechatqr;
				}
			}
		}
		*/
		// 支付宝
		$pay_alipay = array('success' => false);
		if ($payset['app_alipay'] == 1 && !is_weixin()) {
			if (is_array($setting['payment']['alipay']) && $setting['payment']['alipay']['switch']) {
				$pay_data = m('shop')->getPaymentByKeys('alipay');
				$pay_alipay['success'] = true;
				if (!is_weixin())
				{
					$pay_alipay['isdefault'] = 1;
				}
				$pay_alipay['name'] = $pay_data['name'];
				$pay_alipay['key']  = 'alipay';
				$pay_alipay['type'] = $pay_data['type'];
				$payment['alipay'] = $pay_alipay;
			}
		}
		
		/* 线下支付和货到付款判断 */
		if (!$payset['offline_pay'])
		{
			$is_offline_pay = false;
		}
		if (!$payset['cash'])
		{
			$is_cash = false;
		}

		foreach($goodslist as $g)
		{
			if (!$g['offline_pay']){
				$is_offline_pay = false;
			}
			if (!$g['cash']){
				$is_cash = false;
			}
		}
		if ($is_cash){
			$isdefault = count($payment) > 0 ? 0 : 1;
			$pay_data = m('shop')->getPaymentByKeys('cash');
			$payment['cash'] = array('name' => $pay_data['name'], 'key' => 'cash', 'type' => $pay_data['type'], 'isdefault' => $isdefault);
		}
		if ($is_offline_pay){
			$isdefault = count($payment) > 0 ? 0 : 1;
			$pay_data = m('shop')->getPaymentByKeys('offline');
			$payment['offline'] = array('name' => $pay_data['name'], 'key' => 'offline', 'type' => $pay_data['type'], 'isdefault' => $isdefault);
		}
		
		return $payment;
	}
	
	/* 取得免运费的活动 */
	function getDispatchFeeActive($g)
	{
		$active_arr = array();
		if ($g['ednum'] > 0)
		{
			$active_arr[]['title'] = '单品满' . $g['ednum'] . '件包邮';
		}
		if ($g['edmoney'] > 0)
		{
			$active_arr[]['title'] = '单品满' . $g['edmoney'] . '元包邮';
		}
		if ($saleset && $saleset['enoughfree'] == 1)
		{
			$active_arr[]['title'] = '订单满' . $saleset['enoughorder'] . '元包邮';
		}
		return $active_arr;
	}
	
	/* 订单统计 */
	function orderTotal($status, $mid)
	{
		global $_W;
		if (!$mid) return 0;
		// 待付款
		if ($status == 0)
		{
			$condition = ' and status=0 ';
		}
		// 待发货
		elseif ($status == 1)
		{
			$condition = ' and status=1 ';
		}
		// 待收货
		elseif ($status == 2)
		{
			$condition = ' and status=2 ';
		}
		// 已完成
		elseif ($status == 3)
		{
			$condition = ' and status=3 ';
		}
		// 已完成
		elseif ($status == 4)
		{
			$condition = ' and status=3 and iscomment = 0 ';
		}
		// 待售后
		elseif ($status == 5)
		{
			$condition = ' and refundstate>0';
		}
		// 全部
		elseif ($status == 6)
		{
			$condition = '';
		}
		$counts = pdo_fetchcolumn('select count(*) from ' . tablename('ewei_shop_order') . 
					' where uniacid = ' . $_W['uniacid'] . ' and userid = '. $mid . $condition
					. ' and userdeleted = 0 and is_vip=0 and parent_id = 0');
		return $counts;
		
	}
	
	/* 订单费用 */
	function orderPrice($order, $goods, $address)
	{
		/* 初始化订单的扩展code */
		if (!isset($order['extension_code']))
		{
			$order['extension_code'] = '';
		}
		$total  = array('total'     	 => 0,		         // 商品数量
					'marketprice'   	 => 0,               // 商品原价 
					'goodsprice'    	 => 0,               // 商品金额 
					'oldprice'     	 	 => 0,				 // 没抵扣前总费用
					'realprice'     	 => 0,               // 订单最终支付费用
					'discount_price' 	 => 0,               // 优惠价格
					'coupon_price' 	     => 0,               // 优惠券价格
					'integral_deduct'    => 0,				 // 积分抵扣金额
					'integral'    		 => 0,               // 积分抵扣
					'credit_deduct'   	 => 0,				 // 余额抵扣
					'dispatch_price' 	 => 0,               // 运费
					'old_dispatch_price' => 0,               // 没免前的运费
					'em_discount'        => 0,               // 满额减
					'em_discount_info'   => '',              // 满额减描述
					'enoughfree'         => 0,			     // 满额包邮
					'dispatch_desc'      => '',              // 满额包邮描述
					
				);
				
		$weight    = 0;		
		$isvirtual = false;               // 是否是虚拟物品
		$saleset   = false;
		$plugc     = com('coupon');
		$trade     = m('common')->getSysset('trade');
		$dispatch_array = array();
		$sale_plugin    = com('sale');
		if ($sale_plugin) $saleset = m('common')->getPluginset('sale');
		
		/* 商品总价 */
		foreach ($goods as $g)
		{
			$total['total'] 		 += $g['total'];
			$total['goodsprice']     += $g['subtotal'];
			$total['marketprice']    += $g['markettotal'];
			$total['discount_price'] += $g['discount'];
			
			// 积分抵扣
			if ($g ['deduct'] > 0) {
				$total['integral_deduct'] += $g['deduct'] * $g['total'];
			} 
			
			// 余额抵扣，0为全额抵扣, -1为不支持抵扣 
			if ($g ['deduct2'] == 0) 
			{
				$total['credit_deduct'] += $g['subtotal'];
			} else if ($g ['deduct2'] > 0) 
			{	
				$total['credit_deduct'] += $g ['deduct2'] * $g ['total'];
			}
			
			// 虚拟商品
			if (! empty ( $g ['virtual'] ) || $g ['type'] == 2) 
			{
				$isvirtual = true;
			}
			// 总重量
			$total['weight'] += $g['weights'];
		}
		
		/* 余额抵扣税费 */
		if (intval($trade['tax']))
		{
			$total['credit_deduct'] += $total['taxprice'];
		}
		
		/* 非虚拟商品 计算运费 */
		$total['isvirtual'] = $isvirtual ? 1 : 0;
		if (!$total['isvirtual'] && $address) 
		{
			foreach($goods as $g)
			{
				if($g['virtual'] == 2 || $g['virtual'] == 3)
				{
					continue;
				}
				$sendfree = false;
				// 如果是包邮商品
				if (!empty($g['issendfree'])) 
				{
					$sendfree = true;
				} 
				else 
				{
					// 如果设置了满多少件包邮
					if (($g['total']>=$g['ednum'] && $g['ednum']>0) || 
						($g['subtotal'] >= floatval($g['edmoney']) && floatval($g['edmoney'])>0)) 
					{	
						$gareas = explode(';', $g['edareas']);
						// 全部地区包邮
						if (empty($gareas)) {
							$sendfree = true;
						} else 
						{
							// 不包邮地区
							if (!in_array($address['city'], $gareas))
							{
								$sendfree = true;
							}
						}
					}
				}
				
				/* 如果不包邮费 */
				if (!$sendfree) 
				{
					// 统一邮费
					if ($g['dispatchtype'] == 1) {
						if ($g['dispatchprice'] > 0) 
						{
							$total['dispatch_price'] += $g['dispatchprice'] * $g['total'];
						}
					} 
					else if ($g['dispatchtype'] == 0) 
					{
						// 按运费模板, 找到运费模板	
						if (empty ($g['dispatchid'] )) {
							$dispatch_data = m('dispatch')->getDefaultDispatch();
						} 
						else 
						{
							$dispatch_data = m('dispatch')->getOneDispatch($g['dispatchid']);
						}
						if (empty($dispatch_data)) 
						{
							$dispatch_data = m('dispatch')->getNewDispatch();
						}
						if (! empty ( $dispatch_data )) {
							$areas = unserialize ( $dispatch_data ['areas'] );
							if ($dispatch_data ['calculatetype'] == 1) {
								$param = $g['total'];
							} else {
								$param = $g['weights'];
							}
							$dkey = $dispatch_data['id'];
							if (array_key_exists( $dkey, $dispatch_array )) {
								$dispatch_array[$dkey]['param'] += $param;
							} else {
								$dispatch_array[$dkey]['data']  = $dispatch_data;
								$dispatch_array[$dkey]['param'] = $param;
							}
						}
					}
					
				}
			}
			/* 根据收货城市统计运费 */
			if (!empty($dispatch_array)) 
			{
				foreach ( $dispatch_array as $k => $v ) {
					
					$dispatch_data = $dispatch_array [$k] ['data'];
					$param = $dispatch_array [$k] ['param'];
					$areas = unserialize ( $dispatch_data ['areas'] );
					if (!empty($address)) {
						$total['dispatch_price'] += m('dispatch')->getCityDispatchPrice($areas, 
							$address['city'], $param, $dispatch_data);
					}
				}
			}
		}
		
		/* 余额是否可以抵扣运费 */
		if ($trade['dispatch']) {
			$total['credit_deduct'] += $total['dispatch_price'];
		}
		
		/* 统计费用 */
		$total['old_dispatch_price'] = $total['dispatch_price'];
		$total['oldprice']  = $total['goodsprice'] + $total['taxprice'];
		$total['realprice'] = $total['oldprice'];

		/* 营销活动（满额减 或 满额包邮） */
		if ($saleset) 
		{
			/* 如果设置订单满额包邮 */
			if (!empty($saleset['enoughfree'])) 
			{
				// 0元为全场包邮
				if (floatval ( $saleset['enoughorder'] ) <= 0) 
				{
					$total['dispatch_price'] = 0;
					$total['enoughfree'] = 1;
					$total['dispatch_desc'] = '全场包邮';
				} 
				else 
				{   // 满额包邮
					if ($total['realprice'] >= floatval($saleset['enoughorder'])) 
					{
						if (empty($saleset['enoughareas'])) {
							$total['dispatch_price'] = 0;
							$total['enoughfree'] = 1;
							$total['dispatch_desc'] = '订单满'. $saleset['enoughorder'] .'元包邮';
						} else {
							$areas = explode (',', $saleset['enoughareas'] );
							if (!empty($address)) 
							{
								if (! in_array ( $address ['city'], $areas )) {
									$total['dispatch_price'] = 0;
									$total['enoughfree'] = 1;
									$total['dispatch_desc'] = '订单满'. $saleset['enoughorder'] .'元包邮';
								}
							} else
							{
								$total['dispatch_price'] = 0;
								$total['enoughfree'] = 1;
								$total['dispatch_desc'] = '订单满'. $saleset['enoughorder'] .'元包邮';
							}
						}
					}
				}
				
			}
			
			/* 活动营销（满额减） */
			if (com('sale'))	
			{
				$em_discount = com('sale')->fullReduction($total['realprice']);
				$total['em_discount'] = $em_discount['discount'];	
				if ($total['em_discount'] > 0)
				{
					$total['realprice'] -= $total['em_discount'];
					$total['em_discount_info'] = $em_discount['info'];
				}
			}
		}
		
		/* 运费计算完 实付款中加入运费 */
		$total['realprice'] += $total['dispatch_price'];
		
		/* 余额是否可以抵扣运费 */
		if ($trade['dispatch']) {
			$total['credit_price'] += $total['dispatch_price'];
		}
		
		/* 优惠券抵现 */
		if ($order['couponid'] > 0)
		{
			$coupon = $plugc->getCouponByDataID($order['couponid']);
			if (!empty($coupon)) 
			{
				if ($total['goodsprice'] >= $coupon['enough'] && empty($coupon['used'] )) {
					if ($coupon['backtype'] == 0) {
						if ($coupon['deduct'] > 0) {
							$total['coupon_price'] = $coupon['deduct'];
						}
					} else if ($coupon ['backtype'] == 1) {
						if ($coupon ['discount'] > 0) {
							$total['coupon_price'] = $totalprice * (1 - $coupon ['discount'] / 10);
						}
					}
					if ($total['coupon_price'] > 0) {
						if ($total['coupon_price'] >= $total['realprice'])
						{
							$total['coupon_price'] = $total['realprice'];
							$total['realprice'] = 0;
						}
						else
						{
							$total['realprice'] -= $total['coupon_price'];
						}
					}
				}
			}
		}

		/* 余额抵现 */
		if ($order['credit'] > 0 && $total['realprice'] > 0 && $total['credit_deduct'] > 0)
		{
			$credit = m('member')->getCredit($order['openid'], 'credit2');
			$order['credit'] = min($order['credit'], $credit);
			$total['credit_deduct'] = min($order['credit'], $total['credit_deduct']);
			if ($total['credit_deduct'] >= $total['realprice'])
			{
				$total['credit_deduct'] = $total['realprice'];
				$total['realprice'] = 0;
			}
			else
			{
				$total['realprice'] -= $total['credit_deduct'];
			}
		}
		else
		{    // 没有余额抵现
			 $total['credit_deduct'] = 0;
		}
		
		/* 积分抵现 */
		if ($sale_plugin && $order['integral'] > 0 && $total['realprice'] > 0 
			&& $total['integral_deduct'] > 0) 
		{
			$integral = m('member')->getCredit($order['openid'], 'credit1' );
			$integral = min($order['integral'], $integral);
			if ($saleset['creditdeduct']) 
			{
				$deductmoney = $sale_plugin->integralToMoney($integral);
				$total['integral_deduct'] = min($deductmoney, $total['integral_deduct']);
				if ($total['integral_deduct'] >= $total['realprice'])
				{
					$total['integral_deduct'] = $total['realprice'];
					$total['realprice'] = 0;
				}
				else
				{
					$total['realprice'] -= $total['integral_deduct'];
				}
				$total['integral'] =  $sale_plugin->moneyToIntegral($total['integral_deduct']);
			}
		}
		else
		{
			 // 没有积分抵现
			 $total['integral_deduct'] = 0;
		}

		/* 保存订单信息 */
    	$_SESSION['order'] = $order;
		return $total;
	
	}
	
	/* 初始化订单确认信息 */
	function initFlowOrder()
	{
		$order = array();
		$order['openid'] = m('member')->getOpenid();// 初始化openid
		$order['userid'] = m('member')->getMid();// 初始化userid
		$order['addressid'] = 0;  // 初始化收货地址
		$order['credit'] = 0;
		$order['integral'] = 0; 
		$order['couponid'] = 0;
		$order['payment'] = '';
		
		return $order;
	}
	
	/* 取得准备下单的订单信息 */
	function getFlowOrder()
	{
		$order = isset($_SESSION['order']) ? $_SESSION['order'] : array();
		
		if (!isset($order['openid']))
		{
			$order['openid'] = m('member')->getOpenid();// 初始化openid
		}
		if (!isset($order['userid']))
		{
			$order['userid'] = $_SESSION['userid'];// 初始化userid
		}
		if (!isset($order['addressid']))
		{
			$order['addressid'] = 0;  // 初始化收货地址
		}
		if (!isset($order['payment']))
		{
			$order['payment'] = '';  // 初始化支付方式
		}
		if (!isset($order['couponid']))
		{
			$order['couponid'] = 0;    // 初始化优惠券
		}
		if (!isset($order['integral']))
		{
			$order['integral'] = 0; // 初始化积分
		}
		if (!isset($order['credit']))
		{
			$order['credit'] = 0;  // 初始化余额
		}
	
		return $order;
	}
	
	/* 取得准备下单的商品 */
	function getFlowGoods()
	{
		$goods_list = array();
		if (isset($_SESSION['goods']))
		{
			foreach( $_SESSION['goods'] as $goods)
			{
				$columns = ' maxbuy, issendfree, type, isnodiscount, weight, '.
						   ' marketprice, isnodiscount, isverify,'.
						   ' deduct, deduct2, virtual, '.
						   ' dispatchtype, dispatchprice, dispatchid ';
				$row = m('goods')->getRow($goods['id'], $columns);
				$row['total'] = $goods['total'];
				if ($goods['optionid'] > 0)
				{
					$option = pdo_fetch ( 'select id,title,marketprice,goodssn,productsn,virtual,' . 
					' stock,weight from ' . tablename ( 'ewei_shop_goods_option' ) . 
					' where id=:id and goodsid=:goodsid and uniacid=:uniacid  limit 1', 
					array (':uniacid' => $uniacid,':goodsid' => $id,':id' => $goods['optionid'] ));
					if (! empty ( $option )) 
					{
						$row ['optionid'] = $optionid;
						$row ['marketprice'] = $option ['marketprice'];
						$row ['virtual'] = $option ['virtual'];
						$row ['stock'] = $option ['stock'];
						if (! empty ( $option ['weight'] )) 
						{
							$row ['weight'] = $option ['weight'];
						}
					}
				}
				$price_arr = m('goods')->getFinalPrice($goods['id'], $goods['total'], $goods['optionid']);
				$row['final_price']  = $price_arr['price'];
				$row['subtotal'] 	 = $price_arr['totalprice'];   // 商品终价小计
				$row['markettotal']  = $row['marketprice'] * $goods ['total'];

				$goods_list[] = $row;
			}
		}
		
		return $goods_list;
	}
	
	/* 订单状态 */
	function orderStatus($row)
	{
		if (!$row) return;
		$status = '';
		
		$shopset = m('common')->getSysset('shop');
		if ($shopset['webtype'] == 0 || $shopset['webtype'] == 2)
		{
			$verifyname = '使用';
		}
		elseif ($shopset['webtype'] == 1)
		{
			$verifyname = '用餐';
		}
		
		switch ($row['status']) {
		case '-1':
			$status = '已取消';
			break;

		case '0':
			if ($row['paytype'] == 3) {
				$status = '待发货';
			}
			 else {
				$status = '待付款';
			}
			break;

		case '1':
			$status = '待发货';
			break;

		case '2':
			$status = '待确认';
			break;

		case '3':
			if (empty($row['iscomment'])) {
				$status = '待评价';
			}
			 else {
				$status = '订单完成';
			}
			break;
		}
		
		return $status;
	}
	
	/* 订单可进行的操作 */
	function orderOperator($row)
	{
		if (!$row) return;
		$op = array(
				'cancel'  => 0, 		// 取消
				'pay'     => 0,			// 支付
				'use'     => 0,			// 使用
				'receive' => 0,			// 收货
				'express' => 0,			// 物流
				'comment' => 0,			// 评价
				'morecomment'  => 0,	// 再次评价
				'remove'       => 0,	// 删除
				'refund'       => 0,    // 售后
				'refundstate1' => 0,    // 售后中
				'refundreply'  => 0     // 申请退款
		);
		$trade = m ('common')->getSysset('trade');
		if ($row['status'] == 0)
		{
			if ($row['paytype'] != 3)
			{
				$op['pay'] = 1;
			}
			$op['cancel'] = 1;
		}
		elseif ($row['status'] == 1)
		{
			if($row['isverify'] == 1 && $row['verifyied'] != 1)
			{
				$op['use'] = 1;
			}
		}
		elseif ($row['status'] == 2)
		{
			$op['receive'] = 1;
			if ($row['expresssn'] != '')
			{
				$op['express'] = 1;
			}
		}
		elseif ($row['status'] == 3)
		{
			if ($row['iscomment'] == 0 && $trade['closecomment'] == 0)
			{
				$op['comment'] = 1;
			}
			elseif ($row['iscomment'] == 1 && $trade['closecomment'] == 0)
			{
				$op['morecomment'] = 1;
			}
			$op['remove'] = 1;
		}
		elseif ($row['status'] == -1)
		{
			$op['remove'] = 1;
		}
		
		
		if ($row['canrefund'])
		{
			if ($row['refundstate'] > 0)
			{
				if ($row['refundstate'] == 2 )
				{
					$op['refundstate1'] = 1;
				}
				else
				{
					$op['refundstate2'] = 1;
				}
			}
			else
			{
				$op['refundreply'] = 1;
			}
		}
		
		return $op;
		
	}
	
	/* 订单相关操作 */
	function operate($order, $op)
	{
		global $_W;
		if (!$op || !$order) return;
		
		/* 取消 */
		if ($op == 'cancel')
		{
			
			pdo_update('ewei_shop_order', array('status' => -1, 'canceltime' => time()), 
					array('id' => $order['id'], 'uniacid' => $_W['uniacid']));
			m('notice')->sendOrderMessage($orderid);
			
			// 返回余额
			if (0 < $order['deductprice2'])
			{
				$remark = '购物返回抵扣余额'. $order["deductprice2"] .'元，订单号' . $order['ordersn'];
				$other = array('other_id' => $order['id'], 'remark' => $remark);
				m("member")->setCredit($order['openid'], "credit2", $order["deductprice2"], 
					array(0, $remark));
			}
			
			// 返回积分
			if (0 < $order['deductprice']) {
				$shopset = m('common')->getSysset('shop');
				$remark = '购物返还抵扣'.$shopset['credit1'].': ' . $order['deductcredit'] . '，抵扣金额，
						  ' . $order['deductprice'] .'元，订单号' . $order['ordersn'];
				$other = array('other_id' => $order['id'], 'remark' => $remark);
				m("member")->setCredit($order['openid'], "credit1", $order['deductcredit'], 
							array(0, $remark));
			}
			
			// 返回优惠券	
			if (com('coupon') && !empty($order['couponid'])) 
			{
				com('coupon')->returnConsumeCoupon($orderid);
			}
		}
		
		/* 收货 */
		elseif ($op == 'finish')
		{
			pdo_update('ewei_shop_order', array('status' => 3, 'finishtime' => time()), 
						array('id' => $order['id'], 'uniacid' => $_W['uniacid']));
						
			// 分销
			if (p('commission')) {
				p('commission')->checkOrderFinish($order['id']);
			}		
				
			m('notice')->sendOrderMessage($order['id']);
			
			if (com('coupon'))
			{
				com('coupon')->backConsumeCoupon($order['id']);
			}
		}
		/* 付款 */
		elseif ($op == 'pay')
		{
			$log = pdo_fetch('SELECT * FROM ' . tablename('core_paylog') . 
					' WHERE `uniacid`=:uniacid AND `module`=:module AND `tid`=:tid limit 1', 
					array(':uniacid' => $uniacid, ':module' => 'ewei_shop', ':tid' => $order['ordersn']));
			if ($log)
			{
				if ($log['status'] != 1)
				{
					pdo_update('core_paylog', array('staus'=>1), array('plid' => $log['plid']));
					$log['status'] = 1;
				}
			}
			// 更改订单状态
			$log["result"] = 'success';
			$log["from"] = 'return';
			m('order')->payResult($log);

		}
	}
}


?>
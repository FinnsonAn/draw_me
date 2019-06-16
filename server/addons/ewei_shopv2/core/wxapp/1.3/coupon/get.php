<?php
// 领取优惠券
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


if ($op == 'main')
{
	$id = intval($_GPC['id']);
	$coupon = com('coupon')->getCoupon($id);
	$coupon = com('coupon')->setCoupon($coupon, time());
	if (!$coupon){
		$this->result(1, '没有找到该优惠券');
	}
	if (!$coupon['total']){
		$this->result(1, '优惠券已被领空');
	}
	if ($coupon['timelimit'] == 1 && $row['timeend'] < time())
	{
		$this->result(1, '该优惠券已过期，无法领取');
	}
	if (!$coupon['gettype']){
		$this->result(1, '无法领取');
	}
	if (!($coupon['canget'])) 
	{
		$this->result(1, '您已超出' . $coupon['gettypestr'] . '次数限制');
	}
	if (0 < $coupon['credit']) 
	{
		$credit = m('member')->getCredit($openid, 'credit1');
		if ($credit < intval($coupon['credit'])) 
		{
			show_json(-1, '您的积分不足，无法' . $coupon['gettypestr'] . '!');
		}
	}
	$mytotal = m('coupon')->hasUnused($coupon['id'], $openid);
	if ($mytotal > 0)
	{
		$this->result(1, '您已有该优惠券并没有使用的');
	}
	$needpay = false;
	if (0 < $coupon['money']) 
	{
		pdo_delete('ewei_shop_coupon_log', array('couponid' => $id, 'openid' => $openid, 'status' => 0, 'paystatus' => 0));
		$needpay = true;
		$lastlog = pdo_fetch('select * from ' . tablename('ewei_shop_coupon_log') . ' where couponid=:couponid and openid=:openid  and status=0 and paystatus=1 and uniacid=:uniacid limit 1', array(':couponid' => $id, ':openid' => $openid, ':uniacid' => $_W['uniacid']));
		
	}
	else 
	{
		pdo_delete('ewei_shop_coupon_log', array('couponid' => $id, 'openid' => $openid, 'status' => 0));
	}
	$data = array('uniacid' => $_W['uniacid'], 'merchid' => $coupon['merchid'], 'openid' => $openid, 'couponid' => $id, 'gettype' => 1, 'gettime' =>time());
	pdo_insert('ewei_shop_coupon_data', $data);
	$logno = m('common')->createNO('coupon_log', 'logno', 'CC');
	$log = array('uniacid' => $_W['uniacid'], 'merchid' => $coupon['merchid'], 'openid' => $openid, 'logno' => $logno, 'couponid' => $id, 'status' => 0, 'paystatus' => (0 < $coupon['money'] ? 0 : -1), 'creditstatus' => (0 < $coupon['credit'] ? 0 : -1), 'createtime' => time(), 'getfrom' => 1);
	pdo_insert('ewei_shop_coupon_log', $log);
	
	$logid = pdo_insertid();
	if ($needpay) 
	{
		$useweixin = true;
		if (!(empty($coupon['usecredit2']))) 
		{
			$money = m('member')->getCredit($openid, 'credit2');
			if ($coupon['money'] <= $money) 
			{
				$useweixin = false;
			}
		}
		pdo_update('ewei_shop_coupon_log', array('paytype' => ($useweixin ? 1 : 0)), array('id' => $logid));
		$set = m('common')->getSysset();
		$sec = m('common')->getSec();
		$sec = iunserializer($sec['sec']);
		if ($useweixin) 
		{
			if (empty($sec['app_wechat']['merchname']) || empty($set['pay']['app_wechat']) || empty($sec['app_wechat']['appid']) || empty($sec['app_wechat']['appsecret']) || empty($sec['app_wechat']['merchid']) || empty($sec['app_wechat']['apikey']) || empty($coupon['money'])) 
			{
				$useweixin = false;
			}
		}
		if ($useweixin) 
		{
			
			$set['pay']['weixin'] = ((!(empty($set['pay']['weixin_sub'])) ? 1 : $set['pay']['weixin']));
			$set['pay']['weixin_jie'] = ((!(empty($set['pay']['weixin_jie_sub'])) ? 1 : $set['pay']['weixin_jie']));
			if (!(is_weixin())) 
			{
				$this->result(1, '非微信环境!');
			}
			if (empty($set['pay']['weixin']) && empty($set['pay']['weixin_jie'])) 
			{
				$this->result(1, '未开启微信支付!');
			}
			$wechat = array('success' => false);
			$jie = intval($_GPC['jie']);
			$params = array();
			$params['tid'] = $log['logno'];
			$params['user'] = $openid;
			$params['fee'] = $coupon['money'];
			$params['title'] = $set['shop']['name'] . '优惠券领取单号:' . $log['logno'];
			if (isset($set['pay']) && ($set['pay']['weixin'] == 1) && ($jie !== 1)) 
			{
				load()->model('payment');
				$setting = uni_setting($_W['uniacid'], array('payment'));
				$options = array();
				if (is_array($setting['payment'])) 
				{
					$options = $setting['payment']['wechat'];
					$options['appid'] = $_W['account']['key'];
					$options['secret'] = $_W['account']['secret'];
				}
				$wechat = m('common')->wechat_build($params, $options, 4);
				if (!(is_error($wechat))) 
				{
					$wechat['success'] = true;
					if (!(empty($wechat['code_url']))) 
					{
						$wechat['weixin_jie'] = true;
					}
					else 
					{
						$wechat['weixin'] = true;
					}
				}
			}
			if ((isset($set['pay']) && ($set['pay']['weixin_jie'] == 1) && !($wechat['success'])) || ($jie === 1)) 
			{
				$params['tid'] = $params['tid'] . '_borrow';
				$options = array();
				$options['appid'] = $sec['appid'];
				$options['mchid'] = $sec['mchid'];
				$options['apikey'] = $sec['apikey'];
				if (!(empty($set['pay']['weixin_jie_sub'])) && !(empty($sec['sub_secret_jie_sub']))) 
				{
					$wxuser = m('member')->wxuser($sec['sub_appid_jie_sub'], $sec['sub_secret_jie_sub']);
					$params['openid'] = $wxuser['openid'];
				}
				else if (!(empty($sec['secret']))) 
				{
					$wxuser = m('member')->wxuser($sec['appid'], $sec['secret']);
					$params['openid'] = $wxuser['openid'];
				}
				$wechat = m('common')->wechat_native_build($params, $options, 4);
				if (!(is_error($wechat))) 
				{
					$wechat['success'] = true;
					if (!(empty($params['openid']))) 
					{
						$wechat['weixin'] = true;
					}
					else 
					{
						$wechat['weixin_jie'] = true;
					}
				}
			}
			$wechat['jie'] = $jie;
			if (!($wechat['success'])) 
			{
				$this->result(1, '微信支付参数错误!');
			}
			$this->result(0, '', array('logid' => $logid, 'wechat' => $wechat));
		}
	}
	
	
}

$this->result(0, '', $res);

?>
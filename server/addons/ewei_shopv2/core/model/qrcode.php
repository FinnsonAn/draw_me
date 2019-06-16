<?php
if (!(defined('IN_IA'))) 
{
	exit('Access Denied');
}
class Qrcode_EweiShopV2Model 
{
	public function createShopQrcode($mid = 0, $posterid = 0) 
	{
		global $_W;
		global $_GPC;
		$path = IA_ROOT . '/addons/ewei_shopv2/data/qrcode/' . $_W['uniacid'] . '/';
		if (!(is_dir($path))) 
		{
			load()->func('file');
			mkdirs($path);
		}
		$url = mobileUrl('', array('mid' => $mid), true);
		if (!(empty($posterid))) 
		{
			$url .= '&posterid=' . $posterid;
		}
		$file = 'shop_qrcode_' . $posterid . '_' . $mid . '.png';
		$qrcode_file = $path . $file;
		if (!(is_file($qrcode_file))) 
		{
			require_once IA_ROOT . '/framework/library/qrcode/phpqrcode.php';
			QRcode::png($url, $qrcode_file, QR_ECLEVEL_L, 4);
		}
		return $_W['siteroot'] . 'addons/ewei_shopv2/data/qrcode/' . $_W['uniacid'] . '/' . $file;
	}
	public function createGoodsQrcode($mid = 0, $goodsid = 0, $posterid = 0) 
	{
		global $_W;
		global $_GPC;
		$path = IA_ROOT . '/addons/ewei_shopv2/data/qrcode/' . $_W['uniacid'];
		if (!(is_dir($path))) 
		{
			load()->func('file');
			mkdirs($path);
		}
		$url = mobileUrl('goods/detail', array('id' => $goodsid, 'mid' => $mid), true);
		if (!(empty($posterid))) 
		{
			$url .= '&posterid=' . $posterid;
		}
		$file = 'goods_qrcode_' . $posterid . '_' . $mid . '_' . $goodsid . '.png';
		$qrcode_file = $path . '/' . $file;
		if (!(is_file($qrcode_file))) 
		{
			require_once IA_ROOT . '/framework/library/qrcode/phpqrcode.php';
			QRcode::png($url, $qrcode_file, QR_ECLEVEL_L, 4);
		}
		return $_W['siteroot'] . 'addons/ewei_shopv2/data/qrcode/' . $_W['uniacid'] . '/' . $file;
	}
	public function createQrcode($url) 
	{
		global $_W;
		global $_GPC;
		$path = IA_ROOT . '/addons/ewei_shopv2/data/qrcode/' . $_W['uniacid'] . '/';
		if (!(is_dir($path))) 
		{
			load()->func('file');
			mkdirs($path);
		}
		$file = md5(base64_encode($url)) . '.jpg';
		$qrcode_file = $path . $file;
		if (!(is_file($qrcode_file))) 
		{
			require_once IA_ROOT . '/framework/library/qrcode/phpqrcode.php';
			QRcode::png($url, $qrcode_file, QR_ECLEVEL_L, 4);
		}
		return $_W['siteroot'] . 'addons/ewei_shopv2/data/qrcode/' . $_W['uniacid'] . '/' . $file;
	}
	
	/* 生成手机号二维码 */
	public function createPhoneNumQrcode($mobile)
	{
		global $_W;
		global $_GPC;
		$path = IA_ROOT . '/addons/ewei_shopv2/data/qrcode/phoneNum/' . $_W['uniacid'] . '/';
		if (!(is_dir($path))) 
		{
			load()->func('file');
			mkdirs($path);
		}
		$file = md5(base64_encode($mobile)) . '.jpg';
		$qrcode_file = $path . $file;
		if (!(is_file($qrcode_file))) 
		{
			require_once IA_ROOT . '/framework/library/qrcode/phpqrcode.php';
			QRcode::png($url, $qrcode_file, QR_ECLEVEL_L, 4);
		}
		return $_W['siteroot'] . 'addons/ewei_shopv2/data/qrcode/phoneNum/' . $_W['uniacid'] . '/' . $file;
	}
	
	/* 生成会员openid二维码 */
	public function createMemIdQrcode($id)
	{
		global $_W;
		global $_GPC;
		$path = IA_ROOT . '/addons/ewei_shopv2/data/qrcode/memid/' . $_W['uniacid'] . '/';
		if (!(is_dir($path))) 
		{
			load()->func('file');
			mkdirs($path);
		}
		$file = md5(base64_encode($id)) . '.jpg';
		$qrcode_file = $path . $file;
		if (!(is_file($qrcode_file))) 
		{
			require_once IA_ROOT . '/framework/library/qrcode/phpqrcode.php';
			QRcode::png($id, $qrcode_file, QR_ECLEVEL_L, 4);
		}
		return $_W['siteroot'] . 'addons/ewei_shopv2/data/qrcode/memid/' . $_W['uniacid'] . '/' . $file;
	}
	
	/* 生成订单编号 */
	public function createOrdersnQrcode($sn)
	{
		global $_W;
		global $_GPC;
		$path = IA_ROOT . '/addons/ewei_shopv2/data/qrcode/order/' . $_W['uniacid'] . '/';
		if (!(is_dir($path))) 
		{
			load()->func('file');
			mkdirs($path);
		}
		$file = md5(base64_encode($sn)) . '.jpg';
		$qrcode_file = $path . $file;
		if (!(is_file($qrcode_file))) 
		{
			require_once IA_ROOT . '/framework/library/qrcode/phpqrcode.php';
			QRcode::png($sn, $qrcode_file, QR_ECLEVEL_L, 4);
		}
		return $_W['siteroot'] . 'addons/ewei_shopv2/data/qrcode/order/' . $_W['uniacid'] . '/' . $file;
	}
}
?>
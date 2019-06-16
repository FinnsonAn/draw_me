<?php
if (!(defined('IN_IA'))) {
	exit('Access Denied');
}

require_once IA_ROOT . '/addons/ewei_shopv2/version.php';
require_once IA_ROOT . '/addons/ewei_shopv2/defines.php';
require_once EWEI_SHOPV2_INC . 'functions.php';

if (!(function_exists('getIsSecureConnection'))) {
	function getIsSecureConnection()
	{
		if (isset($_SERVER['HTTPS']) && (('1' == $_SERVER['HTTPS']) || ('on' == strtolower($_SERVER['HTTPS'])))) {
			return true;
		}


		if (isset($_SERVER['SERVER_PORT']) && ('443' == $_SERVER['SERVER_PORT'])) {
			return true;
		}


		return false;
	}
}


if (function_exists('getIsSecureConnection')) {
	$secure = getIsSecureConnection();
	$http = (($secure ? 'https' : 'http'));
	$_W['siteroot'] = ((strexists($_W['siteroot'], 'https://') ? $_W['siteroot'] : str_replace('http', $http, $_W['siteroot'])));
}

class Ewei_shopv2ModuleWxapp extends WeModuleWxapp {
	public $token = ''; //接口通信token
	
	public function run() {
		global $_GPC;
		global $_W;
		$_GPC['op'] = empty($_GPC['op']) ? 'main' : $_GPC['op'];
		$_W['uniacid'] = $_GPC['uniacid'] ? intval($_GPC['uniacid']) : 1;
		$version = $_GPC['v'] ? trim($_GPC['v']) : '1.0';
		$_W['v'] = $version;
		if (empty($_GPC['do']) || empty($_GPC['pn']) || empty($_GPC['op']))
		{
			$this->result(1, '参数错误');
		}
		$this->__call($_GPC['do'], array('page' => $_GPC['pn'], 'version' => $version));
	}
}

?>
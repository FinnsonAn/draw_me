<?php
if (!(defined('IN_IA'))) {
	exit('Access Denied');
}

class Wxtmpl_EweiShopV2Model
{
	protected $account = false;
	
	public function __construct() {
		global $_W;
		if ($this->account) {
			return true;
		}
		$_W['account']['type'] = ACCOUNT_TYPE_APP_NORMAL;
		$wxapp_set = m('common')->getSysset('wxapp');
		$_W['account']['key']    = $wxapp_set['AppId'];
		$_W['account']['secret'] = $wxapp_set['AppSecret'];
		$account_api = WeAccount::create($_W['account']);
		$this->account = $account_api;
	}
	
	public function getToken()
	{
		$account = $this->account;
		$token   = $account->getAccessToken();
		return $token;
	}
	
	public function orderSend($order)
	{
		// 取得参数
		$openid = $order['openid'];
		$openid = str_replace('xcx_', '', $openid);
		$goods = m('order')->getOrderGoods($order['id']);
		$gtitle = $goods[0]['title'];
		$order['desc'] = '您的作品已创作完成，快点开查看吧';
		$account = $this->account;
		$set = m('common')->getSysset('wxtmpl');
		if (!empty($set['send']) && $order && !empty($openid))
		{
			$token = $this->getToken();
			$url = 'https://api.weixin.qq.com/cgi-bin/message/wxopen/template/send?access_token=' . $token;
			$params['touser'] = $openid;
			$params['template_id'] = $set['send'];
			$params['page'] = 'pages/order/detail?id=' . $order['id'];
			$params['form_id'] = $order['formid'];
			$data =  array(
				'keyword1' => array('value' => $order['ordersn'], 'color' => '#000'),
				'keyword2' => array('value' => $gtitle,           'color' => '#000'),
				'keyword3' => array('value' => $order['desc'],    'color' => '#000')
			);
			$params['data'] = $data;
			$response = $account->requestApi($url, json_encode($params));
			print_r($response);
		}
	}
}
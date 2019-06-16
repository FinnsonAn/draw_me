<?php
if (!(defined('IN_IA'))) 
{
	exit('Access Denied');
}
class Index_EweiShopV2Page extends PluginWebPage 
{
	public function main() 
	{
		global $_W;

		if (cv('case.product')) 
		{
			header('location: ' . webUrl('case/product'));
		}
		else if (cv('case.category')) 
		{
			header('location: ' . webUrl('case/category'));
		}
		else if (cv('case.author')) 
		{
			header('location: ' . webUrl('case/author'));
		}
		else if (cv('case.aucate')) 
		{
			header('location: ' . webUrl('case/aucate'));
		}
		else if (cv('case.set')) 
		{
			header('location: ' . webUrl('case/set'));
		}
		else 
		{
			header('location: ' . webUrl());
		}
		exit();
	}
	public function notice() 
	{
		global $_W;
		global $_GPC;
		$set = $this->set;
		if ($_W['ispost']) 
		{
			ca('case.notice.edit');
			$data = ((is_array($_GPC['tm']) ? $_GPC['tm'] : array()));
			if (is_array($_GPC['openids'])) 
			{
				$data['openids'] = implode(',', $_GPC['openids']);
			}
			$this->updateSet(array('tm' => $data));
			plog('case.notice.edit', '修改积分商城通知设置');
			show_json(1);
		}
		$salers = array();
		if (isset($set['tm']['openids'])) 
		{
			if (!(empty($set['tm']['openids']))) 
			{
				$openids = array();
				$strsopenids = explode(',', $set['tm']['openids']);
				foreach ($strsopenids as $openid ) 
				{
					$openids[] = '\'' . $openid . '\'';
				}
				$salers = pdo_fetchall('select id,nickname,avatar,openid from ' . tablename('ewei_shop_member') . ' where openid in (' . implode(',', $openids) . ') and uniacid=' . $_W['uniacid']);
			}
		}
		include $this->template();
	}
}
?>
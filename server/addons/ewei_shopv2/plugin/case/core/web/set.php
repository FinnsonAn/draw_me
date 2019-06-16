<?php
if (!(defined('IN_IA'))) 
{
	exit('Access Denied');
}
class Set_EweiShopV2Page extends PluginWebPage 
{
	public function main() 
	{
		global $_W;
		global $_GPC;
		if ($_W['ispost']) 
		{
			ca('case.set.edit');
			$data = ((is_array($_GPC['data']) ? $_GPC['data'] : array()));
			$this->updateSet($data);
			show_json(1, array('url' => webUrl('case/set')));
		}
		$styles = array();
		$data = $this->getSet();
		include $this->template();
	}
}
?>
<?php

/* 客户的旧会员数据导入到小程序中 */
if (!(defined('IN_IA'))) 
{
	exit('Access Denied');
}
class Import_EweiShopV2Page extends WebPage 
{
	public function main() 
	{
		global $_W, $_GPC;
		echo('开始转化会员数据<br>');
		$old_users = pdo_fetchall('select * from '. tablename('ewei_shop_member_import1') .
				' where uniacid = :uniacid', array(':uniacid'=>$_W['uniacid']));
		if (is_array($old_users))
		{
			foreach($old_users as $k=>$item)
			{
				$new = array();
				$is_exsit = pdo_fetchcolumn('select count(*) from '. tablename('ewei_shop_member_import') .'
							where mobile = :mobile and uniacid = :uniacid', array(':mobile' => $item['mobile'],
							":uniacid" => $_W['uniacid']));
				if (!$is_exsit)
				{
					
					$money = $item['money'] + $item['money1'];
					$isagent = $this->replace_blank($item['cardtype']) == '积分卡' || $item['money1'] > 0 ? 1 : 0;
					if ($money == 0 && !$isagent)
					{
						continue;
					}
					$new['mobile']   = $this->replace_blank($item['mobile']);
					$new['realname'] = $this->replace_blank($item['realname']);
					$new['money']    = $money;
					$new['isagent']  = $isagent;
					$new['birthday'] = $item['birthday'];
					$new['birthtype'] = $this->replace_blank($item['birthtype']) == '阳历' ? 1 : 0;
					$new['uniacid']  = $_W['uniacid'];
					pdo_insert('ewei_shop_member_import', $new);
				}
				
			}
		}
		echo('结束转化会员数据<br>');
	}
	
	public function replace_blank($str)
	{
		$str = trim($str);
		$str = str_replace(' ', '', $str);
		return $str;
	}
}
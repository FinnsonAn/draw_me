<?php
if (!(defined('IN_IA'))) {
	exit('Access Denied');
}

class Wxqrcode_EweiShopV2Model
{
	/* 生成分销二维码 */
	function createCommissionQrcode($openid, $goodsid = 0, $type = 0, $qrtype, $account_api, $page = '')
	{
		global $_W;
		if (!($type)) 
		{
			$type = 2;
			if (!(empty($goodsid))) 
			{
				$type = 3;
			}
		}
		$poster = pdo_fetch('select * from ' . tablename('ewei_shop_poster') . 
				  ' where uniacid=:uniacid and `type`=:type and isdefault=1 limit 1', 
				  array(':uniacid' => $_W['uniacid'], ':type' => $type));
		$member = m('member')->getMember($openid);
		$qr = $this->getQrcode($poster, $member, $goodsid, $type, $qrtype, $account_api, $page);
		if (empty($qr)) 
		{
			return array(0, '没有相关二维码');
		}
		/* 合成海报 */
		$data = $this->createPoster($poster, $member, $qr, $type); 
		return $data;
	}
	
	/* 获得二维码 */
	function getQrcode($poster, $member = 0, $goodsid = 0, $type = 0, $qrtype, $account_api, $page='')
	{
		global $_W;
		global $_GPC;
		$uniacid = $_W['uniacid'];
		if ($poster['type'] == 2) 
		{
			$p = p('commission');
			if ($p) 
			{
				$qrimg = $p->createMyShopQrcode($member['id'], $poster['id']);
				$qr = pdo_fetch('select * from ' . tablename('wxapp_qr') . ' where userid=:userid and uniacid=:uniacid and type=:type limit 1', array(':userid' => $member['id'], ':uniacid' => $_W['uniacid'], ':type' => 2));
				if (empty($qr)) 
				{
					$qr = array('uniacid' => $uniacid, 'userid' => $member['id'], 'type' => 2, 'qrimg' => $qrimg);
					pdo_insert('wxapp_qr', $qr);
					$qr['id'] = pdo_insertid();
				}
				$qr['current_qrimg'] = $qrimg;
				return $qr;
			}
		}
		/* 小程序页面二维码 */
		else if ($poster['type'] == 3) 
		{
			$qr = pdo_fetch('select * from ' . tablename('wxapp_qr') . ' where uniacid=:uniacid and type=:type and page=:page limit 1', 
						array(':uniacid' => $_W['uniacid'], ':type' => 3, ':page' => $page));		
			if (empty($qr)) 
			{	
				$content = $account_api->getCodeWithPath($page, $poster['width']);
				if ($content)
				{
					$file_name = TIMESTAMP. rand(10000,99999).'.png';
					$path = '/attachment/qrcode/' . $_W['uniacid'] .'/'. $file_name;
					$folder_path = IA_ROOT . '/attachment/qrcode/' . $_W['uniacid'];
					if (!file_exists($folder_path))
					{
						mkdir($folder_path);
					}
					@file_put_contents(IA_ROOT . $path, $content);
					$data['type']    = $type;
					$data['qrtype']  = $qrtype;
					$data['page']    = $page;
					$data['uniacid'] = $_W['uniacid'];
					$new_path = str_replace('/attachment/', '', $path);
					$data['url'] = $new_path;
					$data['qrcode'] = $new_path;
					$data['updatetime'] = TIMESTAMP;
					pdo_insert('wxapp_qr', $data);
					$qr = $data;
					$qr['id'] = pdo_insertid();
				}
				else
				{
					return false;
				}
				
			}
			return $qr;
		}
		/* 关注海报 */
		else if ($poster['type'] == 4 || !$poster) 
		{
			$uniaccount = WeAccount::create($uniacid);
			$scene = $member['id'];
			$qr = pdo_fetch('select * from ' . tablename('wxapp_qr') . ' where userid=:userid and uniacid=:uniacid and page=\'index\' limit 1', array(':userid' => $member['id'], ':uniacid' => $uniacid));
			if (empty($qr) || empty($qr['scene'])) 
			{
				$content = $account_api->getCodeUnlimit($scene);
				$file_name = TIMESTAMP. rand(10000,99999).'.png';
				$path = '/attachment/qrcode/' . $_W['uniacid'] .'/'. $file_name;
				$folder_path = IA_ROOT . '/attachment/qrcode/' . $_W['uniacid'];
				if (!file_exists($folder_path))
				{
					mkdir($folder_path);
				}
				@file_put_contents(IA_ROOT . $path, $content);
				$data['scene']   = $scene;
				$data['type']    = $type;
				$data['qrtype']  = $qrtype;
				$data['page']    = $page;
				$data['uniacid'] = $_W['uniacid'];
				$data['userid']  = $member['id'];
				$new_path = str_replace('/attachment/', '', $path);
				$data['url'] = $new_path;
				$data['qrcode'] = $new_path;
				$data['updatetime'] = TIMESTAMP;
				pdo_insert('wxapp_qr', $data);
				$qr = $data;
				$qr['id'] = pdo_insertid();
			}
			if (empty($qr['scene'])) 
			{
				pdo_update('wxapp_qr', array('scene' => $scene, 'url' => $new_path, 'qrcode' => $new_path), array('id' => $qr['id']));
				$qr['current_qrimg'] = $new_path;
			}
			else 
			{
				$qr['current_qrimg'] = $qr['qrcode'];
			}
			return $qr;
		}
	}
	
	/* 小程序页面二维码 */
	function getPathQrcode($path, $width = 450)
	{
		global $_W;
		if (empty($path))
		{
			return false;
		}
		$_W['account']['type'] = ACCOUNT_TYPE_APP_NORMAL;
		
		/* 得到相关小程序的appid和secret */
		$wxapp_set = m('common')->getSysset('wxapp');
		$_W['account']['key']    = $wxapp_set['AppId'];
		$_W['account']['secret'] = $wxapp_set['AppSecret'];
		if (empty($wxapp_set['AppId']) || empty($wxapp_set['AppSecret']))
		{
			return false;
		}
		$account_api = WeAccount::create($_W['account']);
		$qr = $this->getQrcode(array('width' => $width, 'type' => 3), 0, 0, 3, 'wxacodepath', $account_api, $path);
		$qr['url'] = tomedia($qr['url']);
		return $qr;
	}
	
	
	/* 合成海报 */
	function createPoster($poster, $member, $qr)
	{
		global $_W;
		$path = IA_ROOT . '/attachment/poster/' . $_W['uniacid'] . '/';
		if (!(is_dir($path))) 
		{
			load()->func('file');
			mkdirs($path);
		}
		if (!$poster)
		{
			return array(1, $qr);
		}
		if (!(empty($qr['goodsid']))) 
		{
			$goods = pdo_fetch('select id,title,thumb,commission_thumb,marketprice,productprice from ' . tablename('ewei_shop_goods') . ' where id=:id and uniacid=:uniacid limit 1', array(':id' => $qr['goodsid'], ':uniacid' => $_W['uniacid']));
			if (empty($goods)) 
			{
				return array(1, '未找到商品，无法生成海报');
				exit();
			}
		}
		$md5 = md5(json_encode(array('userid' => $member['id'], 'goodsid' => $qr['goodsid'], 'bg' => $poster['bg'], 'data' => $poster['data'], 'version' => 1)));
		$file = $md5 . '.png';
		// 如果没有该二维码或者二维码发生变化则重新合成海报
		if (!(is_file($path . $file)) || ($qr['qrimg'] != $qr['current_qrimg'])) 
		{
			set_time_limit(0);
			@ini_set('memory_limit', '256M');
			$target = imagecreatetruecolor(640, 1008);
			$bg = p('poster')->createImage(tomedia($poster['bg']));
			imagecopy($target, $bg, 0, 0, 0, 0, 640, 1008);
			imagedestroy($bg);
			$data = json_decode(str_replace('&quot;', '\'', $poster['data']), true);
			foreach ($data as $d ) 
			{
				$d = p('poster')->getRealData($d);
				if ($d['type'] == 'head') 
				{
					$avatar = preg_replace('/\\/0$/i', '/96', $member['avatar']);
					$target = p('poster')->mergeImage($target, $d, $avatar);
				}
				else if ($d['type'] == 'img') 
				{
					$target = p('poster')->mergeImage($target, $d, $d['src']);
				}
				else if ($d['type'] == 'qr') 
				{
					$target = p('poster')->mergeImage($target, $d, tomedia($qr['current_qrimg']));
				}
				else if ($d['type'] == 'nickname') 
				{
					$target = p('poster')->mergeText($target, $d, $member['nickname']);
				}
				else if (!(empty($goods))) 
				{
					if ($d['type'] == 'title') 
					{
						$target = p('poster')->mergeText($target, $d, $goods['title']);
					}
					else if ($d['type'] == 'thumb') 
					{
						$thumb = ((!(empty($goods['commission_thumb'])) ? tomedia($goods['commission_thumb']) : tomedia($goods['thumb'])));
						$target = p('poster')->mergeImage($target, $d, $thumb);
					}
					else if ($d['type'] == 'marketprice') 
					{
						$target = p('poster')->mergeText($target, $d, $goods['marketprice']);
					}
					else if ($d['type'] == 'productprice') 
					{
						$target = p('poster')->mergeText($target, $d, $goods['productprice']);
					}
				}
			}
			imagepng($target, $path . $file);
			imagedestroy($target);
			$img = 'poster/' . $_W['uniacid'] . '/' . $file;
			$qr['url'] = $img;
			pdo_update('wxapp_qr', array('url' => $img), array('id' => $qr['id']));
		}
		
		
		return array(1, $qr);
	}
}
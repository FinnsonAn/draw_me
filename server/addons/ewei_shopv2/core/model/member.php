<?php
if (!(defined('IN_IA'))) {
	exit('Access Denied');
}

class Member_EweiShopV2Model
{
	/* 获得openid */
	public function getOpenid()
	{
		global $_W;
		if ($_W['openid'])
		{
			return $_W['openid'];
		}
		elseif ($_SESSION['openid'])
		{
			return $_SESSION['openid'];
		}
		elseif ($_SESSION['userid'])
		{
			return $this->getMidByOpenid($_SESSION['userid']);
		}
	}
	
	/**
     * 获取会员资料
     */
	public function getInfo($openid = '')
	{
		global $_W;
		$uid = intval($openid);

		if ($uid == 0) {
			$info = pdo_fetch('select * from ' . tablename('ewei_shop_member') . ' where openid=:openid and uniacid=:uniacid limit 1', array(':uniacid' => $_W['uniacid'], ':openid' => $openid));

			if (empty($info)) {
				if (strexists($openid, 'sns_qq_')) {
					$openid = str_replace('sns_qq_', '', $openid);
					$condition = ' openid_qq=:openid ';
					$bindsns = 'qq';
				}
				 else if (strexists($openid, 'sns_wx_')) {
					$openid = str_replace('sns_wx_', '', $openid);
					$condition = ' openid_wx=:openid ';
					$bindsns = 'wx';
				}
				 else if (strexists($openid, 'sns_wa_')) {
					$openid = str_replace('sns_wa_', '', $openid);
					$condition = ' openid_wa=:openid ';
					$bindsns = 'wa';
				}


				if (!(empty($condition))) {
					$info = pdo_fetch('select * from ' . tablename('ewei_shop_member') . ' where ' . $condition . '  and uniacid=:uniacid limit 1', array(':uniacid' => $_W['uniacid'], ':openid' => $openid));

					if (!(empty($info))) {
						$info['bindsns'] = $bindsns;
					}

				}

			}

		}
		 else {
			$info = pdo_fetch('select * from ' . tablename('ewei_shop_member') . ' where id=:id  and uniacid=:uniacid limit 1', array(':uniacid' => $_W['uniacid'], ':id' => $uid));
		}

		if (!(empty($info['uid']))) {
			load()->model('mc');
			$uid = mc_openid2uid($info['openid']);
			$fans = mc_fetch($uid, array('credit1', 'credit2', 'birthyear', 'birthmonth', 'birthday', 'gender', 'avatar', 'resideprovince', 'residecity', 'nickname'));
			$info['credit1'] = $fans['credit1'];
			$info['credit2'] = $fans['credit2'];
			$info['birthyear'] = ((empty($info['birthyear']) ? $fans['birthyear'] : $info['birthyear']));
			$info['birthmonth'] = ((empty($info['birthmonth']) ? $fans['birthmonth'] : $info['birthmonth']));
			$info['birthday'] = ((empty($info['birthday']) ? $fans['birthday'] : $info['birthday']));
			$info['nickname'] = ((empty($info['nickname']) ? $fans['nickname'] : $info['nickname']));
			$info['gender'] = ((empty($info['gender']) ? $fans['gender'] : $info['gender']));
			$info['sex'] = $info['gender'];
			$info['avatar'] = ((empty($info['avatar']) ? $fans['avatar'] : $info['avatar']));
			$info['headimgurl'] = $info['avatar'];
			$info['province'] = ((empty($info['province']) ? $fans['resideprovince'] : $info['province']));
			$info['city'] = ((empty($info['city']) ? $fans['residecity'] : $info['city']));
		}


		if (!(empty($info['birthyear'])) && !(empty($info['birthmonth'])) && !(empty($info['birthday']))) {
			$info['birthday'] = $info['birthyear'] . '-' . ((strlen($info['birthmonth']) <= 1 ? '0' . $info['birthmonth'] : $info['birthmonth'])) . '-' . ((strlen($info['birthday']) <= 1 ? '0' . $info['birthday'] : $info['birthday']));
		}


		if (empty($info['birthday'])) {
			$info['birthday'] = '';
		}


		if (!(empty($info))) {
			if (!(strexists($info['avatar'], 'http://')) && !(strexists($info['avatar'], 'https://'))) {
				$info['avatar'] = tomedia($info['avatar']);
			}


			if ($_W['ishttps']) {
				$info['avatar'] = str_replace('http://', 'https://', $info['avatar']);
			}

		}


		return $info;
	}

	/**
     * 获取会员信息
     */
	public function getMember($openid = '', $args = '*')
	{
		global $_W;
		$uid = (int) $openid;

		if ($uid == 0) {
			$info = pdo_fetch('select '. $args .' from ' . tablename('ewei_shop_member') . ' where  openid=:openid and uniacid=:uniacid limit 1', 
					array(':uniacid' => $_W['uniacid'], ':openid' => $openid));
			if (empty($info)) {
				if (strexists($openid, 'sns_qq_')) {
					$openid = str_replace('sns_qq_', '', $openid);
					$condition = ' openid_qq=:openid ';
					$bindsns = 'qq';
				}
				 else if (strexists($openid, 'sns_wx_')) {
					$openid = str_replace('sns_wx_', '', $openid);
					$condition = ' openid_wx=:openid ';
					$bindsns = 'wx';
				}
				 else if (strexists($openid, 'sns_wa_')) {
					$openid = str_replace('sns_wa_', '', $openid);
					$condition = ' openid_wa=:openid ';
					$bindsns = 'wa';
				}
				else if (strexists($openid, 'xcx_')) {
					$openid = str_replace('xcx_', '', $openid);
					$condition = ' openid_xcx=:openid ';
					$bindsns = 'xcx';
				}
				


				if (!(empty($condition))) {
					$info = pdo_fetch('select '. $args .' from ' . tablename('ewei_shop_member') . ' where ' . $condition . 
						'  and uniacid=:uniacid limit 1', array(':uniacid' => $_W['uniacid'], ':openid' => $openid));

					if (!(empty($info))) {
						$info['bindsns'] = $bindsns;
					}

				}

			}

		}
		 else {
			$info = pdo_fetch('select '. $args .' from ' . tablename('ewei_shop_member') . ' where id=:id and uniacid=:uniacid limit 1', array(':uniacid' => $_W['uniacid'], ':id' => $openid));
		}

		if (!(empty($info))) {
			if (!(strexists($info['avatar'], 'http://')) && !(strexists($info['avatar'], 'https://'))) {
				$info['avatar'] = tomedia($info['avatar']);
			}


			if ($_W['ishttps']) {
				$info['avatar'] = str_replace('http://', 'https://', $info['avatar']);
			}


			//$info = $this->updateCredits($info);
		}


		return $info;
	}


	public function updateCredits($info)
	{
		global $_W;
		$openid = $info['openid'];

		if (empty($info['uid'])) {
			$followed = m('user')->followed($openid);

			if ($followed) {
				load()->model('mc');
				$uid = mc_openid2uid($openid);

				if (!(empty($uid))) {
					$info['uid'] = $uid;
					$upgrade = array('uid' => $uid);

					if (0 < $info['credit1']) {
						mc_credit_update($uid, 'credit1', $info['credit1']);
						$upgrade['credit1'] = 0;
					}


					if (0 < $info['credit2']) {
						mc_credit_update($uid, 'credit2', $info['credit2']);
						$upgrade['credit2'] = 0;
					}


					if (!(empty($upgrade))) {
						pdo_update('ewei_shop_member', $upgrade, array('id' => $info['id']));
					}

				}

			}

		}


		$credits = $this->getCredits($openid);
		$info['credit1'] = $credits['credit1'];
		$info['credit2'] = $credits['credit2'];
		return $info;
	}
	
	/*
	** 记录账目变动
	** mid   int   会员id
	** price float 金额
	** type  int   变动类型
	** other  array  other_id 其他有关id remark 备注 operator  有关操作人
	*/
	public function accountRecord($mid, $price, $type, $other = array())
	{
		$_W = $GLOBALS['_W'];
		
		/* 会员id, 金额 类型为空，都属非法 */
		if (!$mid || !$price || !$type)
		{
			return;
		}
		
		$remark   = empty($other['remark'])   ? '' : $other['remark'];
		$operator = empty($other['operator']) ? 0  : intval($other['operator']);
		$other_id = empty($other['other_id']) ? 0  : intval($other['other_id']);
		$status   = empty($other['status'])   ? 1  : intval($other['status']);
		
		$record = array(
		           'mid'         => $mid,
				   'price'       => round($price, 2),
				   'change_type' => $type,
				   'other_id'    => $other_id,
				   'log_time'    => time(),
				   'uniacid'     => $_W['uniacid'],
				   'remark'      => $remark,
				   'operator'    => $operator,
				   'status'      => $status
				  );
		pdo_insert('ewei_shop_member_account_log', $record);		  
	}
	
	/* 余额账目变动生效 */
	public function accountRecordTakeEffect($condition, $openid)
	{
		$log = pdo_fetch('ewei_shop_member_account_log', $condition);
		if ($log)
		{
			pdo_update('ewei_shop_member_account_log', array('status' => 1), 
					array('log_id' => $log['log_id']));
			m("member")->setCredit($openid, "credit2", $log["price"], 
				array(0, $log['remark']));	
		}
	}
	
	/*
	** 记录积分变动
	** mid   int   会员id
	** intgral int 积分
	** type  int   变动类型
	** other  array  other_id 其他有关id remark 备注 operator  有关操作人
	*/
	public function integralLog($mid, $integral, $type, $other = array())
	{
		$_W = $GLOBALS['_W'];
		
		/* 会员id, 金额 类型为空，都属非法 */
		if (!$mid || !$integral || !$type)
		{
			return;
		}
		
		$remark   = empty($other['remark'])   ? '' : $other['remark'];
		$operator = empty($other['operator']) ? 0  : intval($other['operator']);
		$other_id = empty($other['other_id']) ? 0  : intval($other['other_id']);
		$status   = empty($other['status'])   ? 1  : intval($other['status']);
		
		$record = array(
		           'mid'         => $mid,
				   'integral'    => $integral,
				   'change_type' => $type,
				   'other_id'    => $other_id,
				   'log_time'    => time(),
				   'uniacid'     => $_W['uniacid'],
				   'remark'      => $remark,
				   'operator'    => $operator,
				   'status'      => $status
				  );
		pdo_insert('member_integral_log', $record);		  
	}
	
	/* 积分生效 */
	public function integralLogTakeEffect($condition, $openid)
	{
		$log = pdo_fetch('member_integral_log', $condition);
		if ($log)
		{
			pdo_update('member_integral_log', array('status' => 1), 
					array('log_id' => $log['log_id']));
			m("member")->setCredit($openid, "credit1", $log["integral"], 
				array(0, $log['remark']));	
		}
	}
	
	/* 更新消费额 */
	public function updateConsume($mid, $val = 0)
	{
		global $_W;
		if (!$mid) return false;
		$consume = $this->getColumn($mid, 'consume');
		$consume += $val;
		pdo_update('ewei_shop_member', array('consume' => $consume), array('id' => $mid));
	}
	
	/* 统计充值 */
	public function countRechargePrice($mid)
	{
		global $_W;
		
		$sql = 'select openid from '. tablename('ewei_shop_member') .' where id = '. $mid .'';
		$openid = pdo_fetchcolumn($sql);
		if (empty($openid))
		{
			return 0;
		}
		$sql = ' select ifnull(sum(money), 0) from '. tablename('ewei_shop_member_log') .
			   ' where openid = :openid and uniacid = :uniacid and status = 1';
		$price = pdo_fetchcolumn($sql, 
				   array(':openid' => $openid, ':uniacid' => $_W['uniacid']));
		return round($price, 2);
	}

	/**
     * 通过手机号获取用户信息
     * @param $mobile
     */
	public function getMobileMember($mobile)
	{
		global $_W;
		$info = pdo_fetch('select * from ' . tablename('ewei_shop_member') . ' where mobile=:mobile and uniacid=:uniacid limit 1', array(':uniacid' => $_W['uniacid'], ':mobile' => $mobile));

		if (!(empty($info))) {
			$info = $this->updateCredits($info);
		}


		return $info;
	}

	public function getMid()
	{
		global $_W;
		if ($_SESSION['userid'])
		{
			return $_SESSION['userid'];
		}
		$openid = $this->getOpenid();
		$member = $this->getMember($openid);
		return $member['id'];
	}

	public function setCredit($openid = '', $credittype = 'credit1', $credits = 0, $log = array())
	{
		global $_W;
		load()->model('mc');
		$uid = mc_openid2uid($openid);
		$member = $this->getMember($openid);

		if (empty($uid)) {
			$uid = intval($member['uid']);
		}


		if (empty($log)) {
			$log = array($uid, '未记录');
		}
		 else if (!(is_array($log))) {
			$log = array(0, $log);
		}


		if (($credittype == 'credit1') && empty($log[0]) && (0 < $credits)) {
			$shopset = m('common')->getSysset('trade');

			if (empty($member['diymaxcredit'])) {
				if (0 < $shopset['maxcredit']) {
					if ($shopset['maxcredit'] <= $member['credit1']) {
						return error(-1, '用户积分已达上限');
					}


					if ($shopset['maxcredit'] < ($member['credit1'] + $credits)) {
						$credits = $shopset['maxcredit'] - $member['credit1'];
					}

				}

			}
			 else if (0 < $member['maxcredit']) {
				if ($member['maxcredit'] <= $member['credit1']) {
					return error(-1, '用户积分已达上限');
				}


				if ($member['maxcredit'] < ($member['credit1'] + $credits)) {
					$credits = $member['maxcredit'] - $member['credit1'];
				}

			}

		}


		if (empty($log)) {
			$log = array($uid, '未记录');
		}
		 else if (!(is_array($log))) {
			$log = array(0, $log);
		}


		$log_data = array('uid' => intval($uid), 'credittype' => $credittype, 'uniacid' => $_W['uniacid'], 'num' => $credits, 'createtime' => TIMESTAMP, 'module' => 'ewei_shopv2', 'operator' => intval($log[0]), 'remark' => $log[1]);

		if (!(empty($uid))) {
			$value = pdo_fetchcolumn('SELECT ' . $credittype . ' FROM ' . tablename('mc_members') . ' WHERE `uid` = :uid', array(':uid' => $uid));
			$newcredit = $credits + $value;

			if ($newcredit <= 0) {
				$newcredit = 0;
			}


			pdo_update('mc_members', array($credittype => $newcredit), array('uid' => $uid));
		}
		 else {
			$value = pdo_fetchcolumn('SELECT ' . $credittype . ' FROM ' . tablename('ewei_shop_member') . ' WHERE  uniacid=:uniacid and openid=:openid limit 1', array(':uniacid' => $_W['uniacid'], ':openid' => $openid));
			$newcredit = $credits + $value;

			if ($newcredit <= 0) {
				$newcredit = 0;
			}

			pdo_update('ewei_shop_member', array($credittype => $newcredit), array('uniacid' => $_W['uniacid'], 'openid' => $openid));
			$log_data['remark'] = $log_data['remark'] . ' OPENID: ' . $openid;
		}

		pdo_insert('mc_credits_record', $log_data);

		if (p('task')) {
			if ($credittype == 'credit1') {
			}
			 else {
				p('task')->checkTaskReward('cost_rechargeenough', $credits, $openid);
				p('task')->checkTaskReward('cost_rechargetotal', $credits, $openid);
			}
		}

	}

	public function getCredit($openid = '', $credittype = 'credit1')
	{
		global $_W;
		load()->model('mc');
		$uid = mc_openid2uid($openid);

		if (!(empty($uid))) {
			return pdo_fetchcolumn('SELECT ' . $credittype . ' FROM ' . tablename('mc_members') . ' WHERE `uid` = :uid', array(':uid' => $uid));
		}


		return pdo_fetchcolumn('SELECT ' . $credittype . ' FROM ' . tablename('ewei_shop_member') . ' WHERE  openid=:openid and uniacid=:uniacid limit 1', array(':uniacid' => $_W['uniacid'], ':openid' => $openid));
	}

	public function getCredits($openid = '', $credittypes = array('credit1', 'credit2'))
	{
		global $_W;
		load()->model('mc');
		$uid = mc_openid2uid($openid);
		$types = implode(',', $credittypes);

		if (!(empty($uid))) {
			return pdo_fetch('SELECT ' . $types . ' FROM ' . tablename('mc_members') . ' WHERE `uid` = :uid limit 1', array(':uid' => $uid));
		}


		return pdo_fetch('SELECT ' . $types . ' FROM ' . tablename('ewei_shop_member') . ' WHERE  openid=:openid and uniacid=:uniacid limit 1', array(':uniacid' => $_W['uniacid'], ':openid' => $openid));
	}

	/**
	 * 检测用户,注册用户
	 */
	public function checkMember()
	{
		global $_W;
		global $_GPC;
		$member = array();
		$shopset = m('common')->getSysset(array('shop', 'wap'));
		$openid = $_W['openid'];
		if (($_W['routes'] == 'order.pay_alipay') || ($_W['routes'] == 'creditshop.log.dispatch_complete') || ($_W['routes'] == 'threen.register.threen_complete') || ($_W['routes'] == 'creditshop.detail.creditshop_complete') || ($_W['routes'] == 'order.pay_alipay.recharge_complete') || ($_W['routes'] == 'order.pay_alipay.complete') || ($_W['routes'] == 'newmr.alipay') || ($_W['routes'] == 'newmr.callback.gprs') || ($_W['routes'] == 'newmr.callback.bill') || ($_W['routes'] == 'account.sns') || ($_W['plugin'] == 'mmanage')) {
			return;
		}


		if ($shopset['wap']['open']) {
			if (($shopset['wap']['inh5app'] && is_h5app()) || (empty($shopset['wap']['inh5app']) && empty($openid))) {
				return;
			}

		}


		$redis = redis();

		if (!(is_error($redis))) {
			$member = $redis->get($_W['openid']);

			if (!(empty($member))) {
				return array('openid' => $_W['openid']);
			}

		}


		if (empty($openid) && !(EWEI_SHOPV2_DEBUG)) {
			$diemsg = ((is_h5app() ? 'APP正在维护, 请到公众号中访问' : '请在微信客户端打开链接'));
			exit('<!DOCTYPE html>' . "\r\n" . '                <html>' . "\r\n" . '                    <head>' . "\r\n" . '                        <meta name=\'viewport\' content=\'width=device-width, initial-scale=1, user-scalable=0\'>' . "\r\n" . '                        <title>抱歉，出错了</title><meta charset=\'utf-8\'><meta name=\'viewport\' content=\'width=device-width, initial-scale=1, user-scalable=0\'><link rel=\'stylesheet\' type=\'text/css\' href=\'https://res.wx.qq.com/connect/zh_CN/htmledition/style/wap_err1a9853.css\'>' . "\r\n" . '                    </head>' . "\r\n" . '                    <body>' . "\r\n" . '                    <div class=\'page_msg\'><div class=\'inner\'><span class=\'msg_icon_wrp\'><i class=\'icon80_smile\'></i></span><div class=\'msg_content\'><h4>' . $diemsg . '</h4></div></div></div>' . "\r\n" . '                    </body>' . "\r\n" . '                </html>');
		}


		$member = $this->getMember($openid);
		$followed = m('user')->followed($openid);
		$uid = 0;
		$mc = array();
		load()->model('mc');
		if ($followed || empty($shopset['shop']['getinfo']) || ($shopset['shop']['getinfo'] == 1)) {
			$uid = mc_openid2uid($openid);

			if (!(EWEI_SHOPV2_DEBUG)) {
				$userinfo = mc_oauth_userinfo();
			}
			 else {
				$userinfo = array('openid' => $member['openid'], 'nickname' => $member['nickname'], 'headimgurl' => $member['avatar'], 'gender' => $member['gender'], 'province' => $member['province'], 'city' => $member['city']);
			}

			$mc = array();
			$mc['nickname'] = $userinfo['nickname'];
			$mc['avatar'] = $userinfo['headimgurl'];
			$mc['gender'] = $userinfo['sex'];
			$mc['resideprovince'] = $userinfo['province'];
			$mc['residecity'] = $userinfo['city'];
		}


		if (!(is_error($redis))) {
			$redis->set($_W['openid'], 1, 20);
		}


		if (empty($member) && !(empty($openid))) {
			$member = array('uniacid' => $_W['uniacid'], 'uid' => $uid, 'openid' => $openid, 'realname' => (!(empty($mc['realname'])) ? $mc['realname'] : ''), 'mobile' => (!(empty($mc['mobile'])) ? $mc['mobile'] : ''), 'nickname' => (!(empty($mc['nickname'])) ? $mc['nickname'] : ''), 'nickname_wechat' => (!(empty($mc['nickname'])) ? $mc['nickname'] : ''), 'avatar' => (!(empty($mc['avatar'])) ? $mc['avatar'] : ''), 'avatar_wechat' => (!(empty($mc['avatar'])) ? $mc['avatar'] : ''), 'gender' => (!(empty($mc['gender'])) ? $mc['gender'] : '-1'), 'province' => (!(empty($mc['resideprovince'])) ? $mc['resideprovince'] : ''), 'city' => (!(empty($mc['residecity'])) ? $mc['residecity'] : ''), 'area' => (!(empty($mc['residedist'])) ? $mc['residedist'] : ''), 'createtime' => time(), 'status' => 0);
			pdo_insert('ewei_shop_member', $member);
			$member['id'] = pdo_insertid();
		}
		 else {
			if ($member['isblack'] == 1) {
				show_message('暂时无法访问，请稍后再试!');
			}


			$upgrade = array('uid' => $uid);

			if (isset($mc['nickname']) && ($member['nickname_wechat'] != $mc['nickname'])) {
				$upgrade['nickname_wechat'] = $mc['nickname'];
			}


			if (isset($mc['nickname']) && empty($member['nickname'])) {
				$upgrade['nickname'] = $mc['nickname'];
			}


			if (isset($mc['avatar']) && ($member['avatar_wechat'] != $mc['avatar'])) {
				$upgrade['avatar_wechat'] = $mc['avatar'];
			}


			if (isset($mc['avatar']) && empty($member['avatar'])) {
				$upgrade['avatar'] = $mc['avatar'];
			}


			if (isset($mc['gender']) && ($member['gender'] != $mc['gender'])) {
				$upgrade['gender'] = $mc['gender'];
			}


			if (!(empty($upgrade))) {
				pdo_update('ewei_shop_member', $upgrade, array('id' => $member['id']));
			}

		}

		if (p('commission')) {
			p('commission')->checkAgent($openid);
		}


		if (p('poster')) {
			p('poster')->checkScan($openid);
		}


		if (empty($member)) {
			return false;
		}


		return array('id' => $member['id'], 'openid' => $member['openid']);
	}

	/**
     * 获取所有会员等级
     * @global type $_W
     * @return type
     */
	public function getLevels($all = true)
	{
		global $_W;
		$condition = '';

		if (!($all)) {
			$condition = ' and enabled=1';
		}


		return pdo_fetchall('select * from ' . tablename('ewei_shop_member_level') . ' where uniacid=:uniacid' . $condition . ' order by level asc', array(':uniacid' => $_W['uniacid']));
	}

	public function getLevel($openid)
	{
		global $_W;
		global $_S;

		if (empty($openid)) {
			return false;
		}


		$member = m('member')->getMember($openid);

		if (!(empty($member)) && !(empty($member['level']))) {
			$level = pdo_fetch('select * from ' . tablename('ewei_shop_member_level') . ' where id=:id and uniacid=:uniacid limit 1', array(':id' => $member['level'], ':uniacid' => $_W['uniacid']));

			if (!(empty($level))) {
				return $level;
			}

		}


		return array('levelname' => (empty($_S['shop']['levelname']) ? '普通会员' : $_S['shop']['levelname']), 'discount' => (empty($_S['shop']['leveldiscount']) ? 10 : $_S['shop']['leveldiscount']));
	}

	public function getOneGoodsLevel($openid, $goodsid)
	{
		global $_W;
		$uniacid = $_W['uniacid'];
		$level_info = $this->getLevel($openid);
		$level = intval($level_info['level']);
		$data = array();
		$levels = pdo_fetchall('select * from ' . tablename('ewei_shop_member_level') . ' where uniacid=:uniacid and buygoods=1 and level and level > :level order by level asc', array(':uniacid' => $uniacid, ':level' => $level));

		if (!(empty($levels))) {
			foreach ($levels as $k => $v ) {
				$goodsids = iunserializer($v['goodsids']);

				if (!(empty($goodsids))) {
					if (in_array($goodsid, $goodsids)) {
						$data = $v;
					}

				}

			}
		}


		return $data;
	}

	public function getGoodsLevel($openid, $orderid)
	{
		global $_W;
		$uniacid = $_W['uniacid'];
		$order_goods = pdo_fetchall('select goodsid from ' . tablename('ewei_shop_order_goods') . ' where orderid=:orderid and uniacid=:uniacid', array(':uniacid' => $uniacid, ':orderid' => $orderid));
		$levels = array();
		$data = array();

		if (!(empty($order_goods))) {
			foreach ($order_goods as $k => $v ) {
				$item = $this->getOneGoodsLevel($openid, $v['goodsid']);

				if (!(empty($item))) {
					$levels[$item['level']] = $item;
				}

			}
		}


		if (!(empty($levels))) {
			$level = max(array_keys($levels));
			$data = $levels[$level];
		}


		return $data;
	}

	/**
     * 会员升级
     * @param type $mid
     */
	public function upgradeLevel($openid, $orderid = 0)
	{
		global $_W;

		if (empty($openid)) {
			return;
		}


		$shopset = m('common')->getSysset('shop');
		$leveltype = intval($shopset['leveltype']);
		$member = m('member')->getMember($openid);

		if (empty($member)) {
			return;
		}


		$level = false;

		if (empty($leveltype)) {
			$ordermoney = pdo_fetchcolumn('select ifnull( sum(og.realprice),0) from ' . tablename('ewei_shop_order_goods') . ' og ' . ' left join ' . tablename('ewei_shop_order') . ' o on o.id=og.orderid ' . ' where o.openid=:openid and o.status=3 and o.uniacid=:uniacid ', array(':uniacid' => $_W['uniacid'], ':openid' => $member['openid']));
			$level = pdo_fetch('select * from ' . tablename('ewei_shop_member_level') . ' where uniacid=:uniacid  and enabled=1 and ' . $ordermoney . ' >= ordermoney and ordermoney>0  order by level desc limit 1', array(':uniacid' => $_W['uniacid']));
		}
		 else if ($leveltype == 1) {
			$ordercount = pdo_fetchcolumn('select count(*) from ' . tablename('ewei_shop_order') . ' where openid=:openid and status=3 and uniacid=:uniacid ', array(':uniacid' => $_W['uniacid'], ':openid' => $member['openid']));
			$level = pdo_fetch('select * from ' . tablename('ewei_shop_member_level') . ' where uniacid=:uniacid and enabled=1 and ' . $ordercount . ' >= ordercount and ordercount>0  order by level desc limit 1', array(':uniacid' => $_W['uniacid']));
		}


		if (!(empty($orderid))) {
			$goods_level = $this->getGoodsLevel($openid, $orderid);

			if (empty($level)) {
				$level = $goods_level;
			}
			 else if (!(empty($goods_level))) {
				if ($level['level'] < $goods_level['level']) {
					$level = $goods_level;
				}

			}

		}


		if (empty($level)) {
			return;
		}


		if ($level['id'] == $member['level']) {
			return;
		}


		$oldlevel = $this->getLevel($openid);
		$canupgrade = false;

		if (empty($oldlevel['id'])) {
			$canupgrade = true;
		}
		 else if ($oldlevel['level'] < $level['level']) {
			$canupgrade = true;
		}
		if ($canupgrade) {
			pdo_update('ewei_shop_member', array('level' => $level['id']), array('id' => $member['id']));
			m('notice')->sendMemberUpgradeMessage($openid, $oldlevel, $level);
		}

	}

	/**
     * 获取所有会员分组
     * @global type $_W
     * @return type
     */
	public function getGroups()
	{
		global $_W;
		return pdo_fetchall('select * from ' . tablename('ewei_shop_member_group') . ' where uniacid=:uniacid order by id asc', array(':uniacid' => $_W['uniacid']));
	}

	public function getGroup($openid)
	{
		if (empty($openid)) {
			return false;
		}


		$member = m('member')->getMember($openid);
		return $member['groupid'];
	}

	public function setRechargeCredit($openid = '', $money = 0)
	{
		if (empty($openid)) {
			return;
		}


		global $_W;
		$credit = 0;
		$set = m('common')->getSysset(array('trade', 'shop'));

		if ($set['trade']) {
			$tmoney = floatval($set['trade']['money']);

			if (!(empty($tmoney))) {
				$tcredit = intval($set['trade']['credit']);

				if ($tmoney <= $money) {
					if (($money % $tmoney) == 0) {
						$credit = intval($money / $tmoney) * $tcredit;
					}
					 else {
						$credit = (intval($money / $tmoney) + 1) * $tcredit;
					}
				}

			}

		}


		if (0 < $credit) {
			$this->setCredit($openid, 'credit1', $credit, array(0, $set['shop']['name'] . '会员充值积分:credit2:' . $credit));
		}

	}

	public function getCalculateMoney($money, $set_array)
	{
		$charge = $set_array['charge'];
		$begin = $set_array['begin'];
		$end = $set_array['end'];
		$array = array();
		$array['deductionmoney'] = round(($money * $charge) / 100, 2);

		if (($begin <= $array['deductionmoney']) && ($array['deductionmoney'] <= $end)) {
			$array['deductionmoney'] = 0;
		}


		$array['realmoney'] = round($money - $array['deductionmoney'], 2);

		if ($money == $array['realmoney']) {
			$array['flag'] = 0;
		}
		 else {
			$array['flag'] = 1;
		}

		return $array;
	}

	public function checkMemberFromPlatform($openid = '')
	{
		global $_W;
		$acc = WeiXinAccount::create($_W['acid']);
		$userinfo = $acc->fansQueryInfo($openid);
		$userinfo['avatar'] = $userinfo['headimgurl'];
		$redis = redis();

		if (!(is_error($redis))) {
			$member = $redis->get($openid . '_checkMemberFromPlatform');

			if (!(empty($member))) {
				return json_decode($member, true);
			}

		}


		load()->model('mc');
		$uid = mc_openid2uid($openid);

		if (!(empty($uid))) {
			pdo_update('mc_members', array('nickname' => $userinfo['nickname'], 'gender' => $userinfo['sex'], 'nationality' => $userinfo['country'], 'resideprovince' => $userinfo['province'], 'residecity' => $userinfo['city'], 'avatar' => $userinfo['headimgurl']), array('uid' => $uid));
		}


		pdo_update('mc_mapping_fans', array('nickname' => $userinfo['nickname']), array('uniacid' => $_W['uniacid'], 'openid' => $openid));
		$member = $this->getMember($openid);

		if (empty($member)) {
			$mc = mc_fetch($uid, array('realname', 'nickname', 'mobile', 'avatar', 'resideprovince', 'residecity', 'residedist'));
			$member = array('uniacid' => $_W['uniacid'], 'uid' => $uid, 'openid' => $openid, 'realname' => $mc['realname'], 'mobile' => $mc['mobile'], 'nickname' => (!(empty($mc['nickname'])) ? $mc['nickname'] : $userinfo['nickname']), 'avatar' => (!(empty($mc['avatar'])) ? $mc['avatar'] : $userinfo['avatar']), 'gender' => (!(empty($mc['gender'])) ? $mc['gender'] : $userinfo['sex']), 'province' => (!(empty($mc['resideprovince'])) ? $mc['resideprovince'] : $userinfo['province']), 'city' => (!(empty($mc['residecity'])) ? $mc['residecity'] : $userinfo['city']), 'area' => $mc['residedist'], 'createtime' => time(), 'status' => 0);
			pdo_insert('ewei_shop_member', $member);
			$member['id'] = pdo_insertid();
			$member['isnew'] = true;
		}
		 else {
			$member['nickname'] = $userinfo['nickname'];
			$member['avatar'] = $userinfo['headimgurl'];
			$member['province'] = $userinfo['province'];
			$member['city'] = $userinfo['city'];
			pdo_update('ewei_shop_member', $member, array('id' => $member['id']));
			$member['isnew'] = false;
		}

		if (!(is_error($redis))) {
			$redis->set($openid . '_checkMemberFromPlatform', json_encode($member), 20);
		}


		return $member;
	}

	public function mc_update($mid, $data)
	{
		global $_W;
		if (empty($mid) || empty($data)) {
			return;
		}


		$wapset = m('common')->getSysset('wap');
		$member = $this->getMember($mid);

		if (!(empty($wapset['open'])) && isset($data['mobile']) && ($data['mobile'] != $member['mobile'])) {
			unset($data['mobile']);
		}


		load()->model('mc');
		mc_update($this->member['uid'], $data);
	}

	public function checkMemberSNS($sns)
	{
		global $_W;
		global $_GPC;

		if (empty($sns)) {
			$sns = $_GPC['sns'];
		}


		if (empty($sns)) {
			return;
		}


		if ($sns == 'wx') {
			load()->func('communication');
			$token = trim($_GPC['token']);
			$openid = trim($_GPC['openid']);
			$appid = 'wxc3d9d8efae0ae858';
			$secret = '93d4f6085f301c405b5812217e6d5025';

			if (empty($token) && !(empty($_GPC['code']))) {
				$codeurl = 'https://api.weixin.qq.com/sns/oauth2/access_token?appid=' . $appid . '&secret=' . $secret . '&code=' . trim($_GPC['code']) . '&grant_type=authorization_code';
				$coderesult = $userinfo = ihttp_request($codeurl);
				$coderesult = json_decode($coderesult['content'], true);
				if (empty($coderesult['access_token']) || empty($coderesult['openid'])) {
					return;
				}


				$token = $coderesult['access_token'];
				$openid = $coderesult['openid'];
			}


			if (empty($token) || empty($openid)) {
				return;
			}


			$snsurl = 'https://api.weixin.qq.com/sns/userinfo?access_token=' . $token . '&openid=' . $openid . '&lang=zh_CN';
			$userinfo = ihttp_request($snsurl);
			$userinfo = json_decode($userinfo['content'], true);

			if (empty($userinfo['openid'])) {
				return;
			}


			$userinfo['openid'] = 'sns_wx_' . $userinfo['openid'];
		}
		 else if ($sns == 'qq') {
			$userinfo = htmlspecialchars_decode($_GPC['userinfo']);
			$userinfo = json_decode($userinfo, true);
			$userinfo['openid'] = 'sns_qq_' . $_GPC['openid'];
			$userinfo['headimgurl'] = $userinfo['figureurl_qq_2'];
			(($userinfo['gender'] == '男' ? 1 : 2));
		}


		$data = array('nickname' => $userinfo['nickname'], 'avatar' => $userinfo['headimgurl'], 'province' => $userinfo['province'], 'city' => $userinfo['city'], 'gender' => $userinfo['sex'], 'comefrom' => 'h5app_sns_' . $sns);
		$openid = trim($_GPC['openid']);

		if ($sns == 'qq') {
			$data['openid_qq'] = trim($_GPC['openid']);
			$openid = 'sns_qq_' . trim($_GPC['openid']);
		}


		if ($sns == 'wx') {
			$data['openid_wx'] = trim($_GPC['openid']);
			$openid = 'sns_wx_' . trim($_GPC['openid']);
		}


		$member = $this->getMember($openid);

		if (empty($member)) {
			$data['openid'] = $userinfo['openid'];
			$data['uniacid'] = $_W['uniacid'];
			$data['comefrom'] = 'sns_' . $sns;
			$data['createtime'] = time();
			$data['salt'] = m('account')->getSalt();
			$data['pwd'] = rand(10000, 99999) . $data['salt'];
			pdo_insert('ewei_shop_member', $data);
			return pdo_insertid();
		}


		if (empty($member['bindsns']) || ($member['bindsns'] == $sns)) {
			pdo_update('ewei_shop_member', $data, array('id' => $member['id'], 'uniacid' => $_W['uniacid']));
			return $member['id'];
		}

	}

	/**
     * @param array $level 数组中有两个参数 一个是等级,一个是新等级
     * @param array $levels 分销商等级数组
     * @return bool 如果新等级大于 原等级 则返回true 否则 false
     */
	public function compareLevel(array $level, array $levels = array())
	{
		global $_W;
		$levels = ((!(empty($levels)) ? $levels : $this->getLevels()));
		$old_key = -1;
		$new_key = -1;

		foreach ($levels as $kk => $vv ) {
			if ($vv['id'] == $level[0]) {
				$old_key = $vv['level'];
			}


			if ($vv['id'] == $level[1]) {
				$new_key = $vv['level'];
			}

		}

		return $old_key < $new_key;
	}

	/**
     * 微信获取网页openid整合
     * @param $appid APPID;
     * @param $secret SECRET;
     * @param $snsapi 类型有snsapi_userinfo,snsapi_base;
     * @param $expired 本地cookie缓存过期时间 默认600秒
     * @return array(openid,nickname,sex,province,city,country,headimgurl,privilege,[unionid])
     */
	public function wxuser($appid, $secret, $snsapi = 'snsapi_base', $expired = '600')
	{
		global $_W;
		$wxuser = $_COOKIE[$_W['config']['cookie']['pre'] . $appid];

		if ($wxuser === NULL) {
			$code = ((isset($_GET['code']) ? $_GET['code'] : ''));

			if (!($code)) {
				$url = 'http://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
				$oauth_url = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=' . $appid . '&redirect_uri=' . urlencode($url) . '&response_type=code&scope=' . $snsapi . '&state=wxbase#wechat_redirect';
				header('Location: ' . $oauth_url);
				exit();
			}


			load()->func('communication');
			$getOauthAccessToken = ihttp_get('https://api.weixin.qq.com/sns/oauth2/access_token?appid=' . $appid . '&secret=' . $secret . '&code=' . $code . '&grant_type=authorization_code');
			$json = json_decode($getOauthAccessToken['content'], true);

			if (!(empty($json['errcode'])) && (($json['errcode'] == '40029') || ($json['errcode'] == '40163'))) {
				$url = 'http://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'] . ((strpos($_SERVER['REQUEST_URI'], '?') ? '' : '?'));
				$parse = parse_url($url);

				if (isset($parse['query'])) {
					parse_str($parse['query'], $params);
					unset($params['code'], $params['state']);
					$url = 'http://' . $_SERVER['HTTP_HOST'] . $parse['path'] . '?' . http_build_query($params);
				}


				$oauth_url = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=' . $appid . '&redirect_uri=' . urlencode($url) . '&response_type=code&scope=' . $snsapi . '&state=wxbase#wechat_redirect';
				header('Location: ' . $oauth_url);
				exit();
			}


			if ($snsapi == 'snsapi_userinfo') {
				$userinfo = ihttp_get('https://api.weixin.qq.com/sns/userinfo?access_token=' . $json['access_token'] . '&openid=' . $json['openid'] . '&lang=zh_CN');
				$userinfo = $userinfo['content'];
			}
			 else if ($snsapi == 'snsapi_base') {
				$userinfo = array();
				$userinfo['openid'] = $json['openid'];
			}


			$userinfostr = json_encode($userinfo);
			isetcookie($appid, $userinfostr, $expired);
			return $userinfo;
		}


		return json_decode($wxuser, true);
	}
	
	/* 取得会员名字 */
	public function getMemName($id)
	{
		if (!$id) return;
		$info = $this->getRow($id, 'nickname, realname,  id');
		$name = $info['nickname'] != '' ? $info['nickname'] : $info['realname'];
		return $name;
	}
	
	/* 取得一条会员数据 */
	public function getRow($id, $columns = '*')
	{
		global $_W;
		if (!$id)
		{
			return 0;
		}
		$row = pdo_fetch(' select '. $columns .' from ' . tablename('ewei_shop_member') . 
		                 ' where id=:id and uniacid=:uniacid limit 1 ', 
						 array(':id' => $id, ':uniacid' => $_W['uniacid']));
		return $row;				 
	}
	
	/* 通过openid取得id */
	public function getMidByOpenid($openid)
	{
		global $_W;
		if (empty($openid))
		{
			return 0;
		}
		$id = pdo_fetchcolumn('select id from '. tablename('ewei_shop_member') .
				' where uniacid=:uniacid and openid = :openid',
				array(':openid' => $openid, ':uniacid' => $_W['uniacid']));
		if (!$id) $id = 0;
		return $id;
	}
	
	/* 取得会员某个字段值 */
	public function getColumn($openid, $column)
	{
		global $_W;
		if (!$openid)
		{
			return 0;
		}
		$value = pdo_fetchcolumn('select '. $column .' from ' . tablename('ewei_shop_member') . 
		                         ' where openid=:openid and uniacid=:uniacid ', 
								 array(':openid' => $openid, ':uniacid' => $_W['uniacid']));						 
		return $value;						 
	}
	
	
	/* 第一条收货地址 */
	public function getFirstAddress($openid, $id = 0)
	{
		$condition = '';
		if (empty($openid)) return;
		if ($id > 0)
		{
			$condition = ' and id = '. $id;
		}
		$row =  pdo_fetch ( 'select * from ' .  tablename ( 'ewei_shop_member_address' ) . 
				' where openid=:openid and deleted=0 '. $condition .' order by isdefault desc ', 
				array (':openid' => $openid));
		return $row;
	}
	
	/* 取得某条收货地址信息 */
	public function getAddress($id, $openid)
	{
		global $_W;
		if (empty($openid)) return;
		$row =  pdo_fetch( 'select * from ' .tablename ( 'ewei_shop_member_address' ) .
			    ' where uniacid = '. $_W['uniacid'] .' and  openid=:openid  ',
				array(':openid' => $openid));
		return $row;
	}
	
	public function getAddressList($id, $openid, $columns = '*', $limit = 10)
	{
		global $_W;
		if (empty($openid)) return;
		
		$list =  pdo_fetchall( 'select '. $columns .' from ' . 
				tablename ( 'ewei_shop_member_address' ) .
			    ' where uniacid = '. $_W['uniacid'] .' and  openid=:openid  '.
				' order by isdefault desc, id desc limit ' . $limit, 
				array(':openid' => $openid));
		return $list;
	}
	
	/* 验证余额或者积分是否合法 */
	public function validateCreditOrIntegral($openid, $type, $val)
	{
		$islegal = false;
		if (!empty($type))
		{
			$val = $val > 0 ? $val : 0;
			$val1 = $this->getColumn($openid, $type);
			if ($val <= $val1)
			{
				$islegal = true;
			}
		}
		return $islegal;
	}
	
	/* 验证收货地址是否合法 */
	public function validateAddress($address)
	{
		
		$islegal = true;
		if (empty($address['realname']) || empty($address['mobile']))
		{
			$islegal = false;
		}
		$sysset = m('common')->getSysset('shop');
		if (empty($sysset['webtype']))
		{
			if(empty($address['province']) || empty($address['city']) || empty($address['area']))
			{
				$islegal = false;
			}
		}
		
		return $islegal;
	}
	
	/* 性别 */
	public function getDender($gender)
	{
		global $_W;
		if ($gender == 1)
		{
			$str = $_W['lang']['member_name'];
		}
		elseif ($gender == 2)
		{
			$str = $_W['lang']['female_member_name'];
		}
		else
		{
			$str = '未定义';
		}
		return $str;
	}
}


?>
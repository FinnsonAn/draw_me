-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2018 �?03 �?13 �?06:21
-- 服务器版本: 5.5.53
-- PHP 版本: 5.5.38

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `huawo`
--

-- --------------------------------------------------------

--
-- 表的结构 `ims_account`
--

CREATE TABLE IF NOT EXISTS `ims_account` (
  `acid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `hash` varchar(8) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `isconnect` tinyint(4) NOT NULL,
  `isdeleted` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`acid`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `ims_account`
--

INSERT INTO `ims_account` (`acid`, `uniacid`, `hash`, `type`, `isconnect`, `isdeleted`) VALUES
(1, 1, 'uRr8qvQV', 1, 0, 0),
(3, 3, 'O8FiczS2', 1, 0, 1),
(4, 4, 'C1K6HD66', 1, 0, 1),
(5, 5, 'eDre6DnW', 1, 0, 1),
(6, 6, 'Omt8PVAK', 1, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_account_wechats`
--

CREATE TABLE IF NOT EXISTS `ims_account_wechats` (
  `acid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `token` varchar(32) NOT NULL,
  `access_token` varchar(1000) NOT NULL,
  `encodingaeskey` varchar(255) NOT NULL,
  `level` tinyint(4) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `account` varchar(30) NOT NULL,
  `original` varchar(50) NOT NULL,
  `signature` varchar(100) NOT NULL,
  `country` varchar(10) NOT NULL,
  `province` varchar(3) NOT NULL,
  `city` varchar(15) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  `key` varchar(50) NOT NULL,
  `secret` varchar(50) NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `subscribeurl` varchar(120) NOT NULL,
  `auth_refresh_token` varchar(255) NOT NULL,
  PRIMARY KEY (`acid`),
  KEY `idx_key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_account_wechats`
--

INSERT INTO `ims_account_wechats` (`acid`, `uniacid`, `token`, `access_token`, `encodingaeskey`, `level`, `name`, `account`, `original`, `signature`, `country`, `province`, `city`, `username`, `password`, `lastupdate`, `key`, `secret`, `styleid`, `subscribeurl`, `auth_refresh_token`) VALUES
(1, 1, 'omJNpZEhZeHj1ZxFECKkP48B5VFbk1HP', '', '', 4, '画个我', '', '', '', '', '', '', '', '', 0, 'wx1223d08ee7dcb407', 'f307cac71d3faee7578b80819583b8e0', 1, '', ''),
(3, 3, 'qFz2sffUrIdimSmcz8k2iFSf2CzKrUXf', '', 'MfM82zffxfsBmcKsUfxm2fFZsX8kSKF22KMbFDf8MSc', 1, '羽月智能科技测试版', '', '', '', '', '', '', '', '', 0, '', '', 0, '', ''),
(4, 4, 'K8M9iZc6zD2ORmmwmPh6mo1piHpkPtrw', '', 'vRDw69LwV69W8iW8k9P96dP9ZVl229mPm6H6RPP66rl', 1, '多店铺', '', '', '', '', '', '', '', '', 0, '', '', 0, '', ''),
(5, 5, 'DsRez1nyEojfd6SJn8TwJwfRd6WjDtN1', '', 'uy8T1rR2688DnydFn2dOonTJ21c86OWT6CWYDcA6yZf', 4, '青岛海鲜锅贴', '', '', '', '', '', '', '', '', 0, '', '', 0, '', ''),
(6, 6, 'ca68H6vnehZikPfST86hMSf6hUMvFfVZ', '', 'eVufKKhKmfUV8ek8t8IpNEk88ffs8na6SpfNihHf6aT', 1, '青岛海鲜锅贴', '', '', '', '', '', '', '', '', 0, '', '', 0, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_clerks`
--

CREATE TABLE IF NOT EXISTS `ims_activity_clerks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `storeid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`) USING BTREE,
  KEY `password` (`password`) USING BTREE,
  KEY `openid` (`openid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_clerk_menu`
--

CREATE TABLE IF NOT EXISTS `ims_activity_clerk_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `displayorder` int(4) NOT NULL,
  `pid` int(6) NOT NULL,
  `group_name` varchar(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `url` varchar(60) NOT NULL,
  `type` varchar(20) NOT NULL,
  `permission` varchar(50) NOT NULL,
  `system` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `ims_activity_clerk_menu`
--

INSERT INTO `ims_activity_clerk_menu` (`id`, `uniacid`, `displayorder`, `pid`, `group_name`, `title`, `icon`, `url`, `type`, `permission`, `system`) VALUES
(1, 0, 0, 0, 'mc', '快捷交易', '', '', '', 'mc_manage', 1),
(2, 0, 0, 1, '', '积分充值', 'fa fa-money', 'credit1', 'modal', 'mc_credit1', 1),
(3, 0, 0, 1, '', '余额充值', 'fa fa-cny', 'credit2', 'modal', 'mc_credit2', 1),
(4, 0, 0, 1, '', '消费', 'fa fa-usd', 'consume', 'modal', 'mc_consume', 1),
(5, 0, 0, 1, '', '发放会员卡', 'fa fa-credit-card', 'card', 'modal', 'mc_card', 1),
(6, 0, 0, 0, 'stat', '数据统计', '', '', '', 'stat_manage', 1),
(7, 0, 0, 6, '', '积分统计', 'fa fa-bar-chart', './index.php?c=stat&a=credit1', 'url', 'stat_credit1', 1),
(8, 0, 0, 6, '', '余额统计', 'fa fa-bar-chart', './index.php?c=stat&a=credit2', 'url', 'stat_credit2', 1),
(9, 0, 0, 6, '', '现金消费统计', 'fa fa-bar-chart', './index.php?c=stat&a=cash', 'url', 'stat_cash', 1),
(10, 0, 0, 6, '', '会员卡统计', 'fa fa-bar-chart', './index.php?c=stat&a=card', 'url', 'stat_card', 1),
(11, 0, 0, 0, 'activity', '系统优惠券核销', '', '', '', 'activity_card_manage', 1),
(12, 0, 0, 11, '', '折扣券核销', 'fa fa-money', './index.php?c=activity&a=consume&do=display&type=1', 'url', 'activity_consume_coupon', 1),
(13, 0, 0, 11, '', '代金券核销', 'fa fa-money', './index.php?c=activity&a=consume&do=display&type=2', 'url', 'activity_consume_token', 1),
(14, 0, 0, 0, 'wechat', '微信卡券核销', '', '', '', 'wechat_card_manage', 1),
(15, 0, 0, 14, '', '卡券核销', 'fa fa-money', './index.php?c=wechat&a=consume', 'url', 'wechat_consume', 1),
(16, 0, 0, 6, '', '收银台收款统计', 'fa fa-bar-chart', './index.php?c=stat&a=paycenter', 'url', 'stat_paycenter', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_coupon`
--

CREATE TABLE IF NOT EXISTS `ims_activity_coupon` (
  `couponid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `type` tinyint(4) NOT NULL,
  `title` varchar(30) NOT NULL,
  `couponsn` varchar(50) NOT NULL,
  `description` text,
  `discount` decimal(10,2) NOT NULL,
  `condition` decimal(10,2) NOT NULL,
  `starttime` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  `limit` int(11) NOT NULL,
  `dosage` int(11) unsigned NOT NULL,
  `amount` int(11) unsigned NOT NULL,
  `thumb` varchar(500) NOT NULL,
  `credit` int(10) unsigned NOT NULL,
  `use_module` tinyint(3) unsigned NOT NULL,
  `credittype` varchar(20) NOT NULL,
  PRIMARY KEY (`couponid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_coupon_allocation`
--

CREATE TABLE IF NOT EXISTS `ims_activity_coupon_allocation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `couponid` int(10) unsigned NOT NULL,
  `groupid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`couponid`,`groupid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_coupon_modules`
--

CREATE TABLE IF NOT EXISTS `ims_activity_coupon_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `couponid` int(10) unsigned NOT NULL,
  `module` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `couponid` (`couponid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_coupon_record`
--

CREATE TABLE IF NOT EXISTS `ims_activity_coupon_record` (
  `recid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `code` varchar(50) NOT NULL,
  `grantmodule` varchar(50) NOT NULL,
  `granttime` int(10) unsigned NOT NULL,
  `usemodule` varchar(50) NOT NULL,
  `usetime` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `operator` varchar(30) NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL,
  `remark` varchar(300) NOT NULL,
  `couponid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`recid`),
  KEY `couponid` (`uid`,`grantmodule`,`usemodule`,`status`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_exchange`
--

CREATE TABLE IF NOT EXISTS `ims_activity_exchange` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `thumb` varchar(500) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `extra` varchar(3000) NOT NULL,
  `credit` int(10) unsigned NOT NULL,
  `credittype` varchar(10) NOT NULL,
  `pretotal` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `total` int(10) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `starttime` int(10) unsigned NOT NULL,
  `endtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extra` (`extra`(333)) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_exchange_trades`
--

CREATE TABLE IF NOT EXISTS `ims_activity_exchange_trades` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `exid` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `uniacid` (`uniacid`,`uid`,`exid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_exchange_trades_shipping`
--

CREATE TABLE IF NOT EXISTS `ims_activity_exchange_trades_shipping` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `exid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `province` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `district` varchar(30) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `mobile` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_modules`
--

CREATE TABLE IF NOT EXISTS `ims_activity_modules` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `exid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `available` int(10) unsigned NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `uniacid` (`uniacid`),
  KEY `module` (`module`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_modules_record`
--

CREATE TABLE IF NOT EXISTS `ims_activity_modules_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `num` tinyint(3) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_stores`
--

CREATE TABLE IF NOT EXISTS `ims_activity_stores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `business_name` varchar(50) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `category` varchar(255) NOT NULL,
  `province` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `district` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `longitude` varchar(15) NOT NULL,
  `latitude` varchar(15) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `photo_list` varchar(10000) NOT NULL,
  `avg_price` int(10) unsigned NOT NULL,
  `recommend` varchar(255) NOT NULL,
  `special` varchar(255) NOT NULL,
  `introduction` varchar(255) NOT NULL,
  `open_time` varchar(50) NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `source` tinyint(3) unsigned NOT NULL,
  `message` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `location_id` (`location_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_article_category`
--

CREATE TABLE IF NOT EXISTS `ims_article_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_article_news`
--

CREATE TABLE IF NOT EXISTS `ims_article_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_show_home` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `cateid` (`cateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_article_notice`
--

CREATE TABLE IF NOT EXISTS `ims_article_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_show_home` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `cateid` (`cateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_article_unread_notice`
--

CREATE TABLE IF NOT EXISTS `ims_article_unread_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notice_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `is_new` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `notice_id` (`notice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_basic_reply`
--

CREATE TABLE IF NOT EXISTS `ims_basic_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `content` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_business`
--

CREATE TABLE IF NOT EXISTS `ims_business` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `dist` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `lng` varchar(10) NOT NULL,
  `lat` varchar(10) NOT NULL,
  `industry1` varchar(10) NOT NULL,
  `industry2` varchar(10) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lat_lng` (`lng`,`lat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_attachment`
--

CREATE TABLE IF NOT EXISTS `ims_core_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=445 ;

--
-- 转存表中的数据 `ims_core_attachment`
--

INSERT INTO `ims_core_attachment` (`id`, `uniacid`, `uid`, `filename`, `attachment`, `type`, `createtime`) VALUES
(2, 1, 1, 'img1.jpg', 'images/1/2017/08/Mo0wW6BCAl5HOCLhaaBKWRzOOZ8ECT.jpg', 1, 1501919206),
(3, 1, 1, 'banner.jpg', 'images/1/2017/08/nNGg644nFTg5Z4g466854Csi55G4kN.jpg', 1, 1502456802),
(4, 1, 1, 'nav1.png', 'images/1/2017/08/eNX35AeZ8QfqZy43mMEHmm3B882NIi.png', 1, 1502460426),
(5, 1, 1, 'nav2.png', 'images/1/2017/08/dAHDAgW9CMyN63m8WGn3wIdNcmz1aA.png', 1, 1502464864),
(6, 1, 1, 'nav3.png', 'images/1/2017/08/zhsCLlGyZg5uh5E5EIiEy5L5tg5N75.png', 1, 1502465023),
(7, 1, 1, 'nav4.png', 'images/1/2017/08/IO11Oc2rOz51rX1or1ggRw2ryROXaR.png', 1, 1502465083),
(8, 1, 1, 'thumb.jpg', 'images/1/2017/08/W3yr031QlrP37mrQcUqC07YOBYcYCl.jpg', 1, 1502468613),
(9, 1, 1, 'h.jpg', 'images/1/2017/08/bT3hvvvT70HOcsjttEc3T413pO4PC4.jpg', 1, 1502525203),
(10, 1, 1, 'caiwu.webp.jpg', 'images/1/2017/08/v51L18ETZe1Ekl1Qb1E8sTE6b3E1qU.jpg', 1, 1502525447),
(11, 1, 1, 'timg.jpg', 'images/1/2017/08/xY4oUT3lo4Yl83YY6tHxjJOo30eyoU.jpg', 1, 1502785450),
(12, 1, 1, 'd2.jpg', 'images/1/2017/08/P3aH0O011Qccbcziajc1cH3oBQOFBb.jpg', 1, 1502790561),
(13, 1, 1, 'd1.jpg', 'images/1/2017/08/XbK1KrzjCmBjoKkrc3aFCCo3ZkFk0r.jpg', 1, 1502790561),
(14, 1, 1, 'd3.jpg', 'images/1/2017/08/OT4gzO4eeggF7hq7DvaAAzOEctFoaf.jpg', 1, 1502790561),
(15, 1, 1, 'd4.jpg', 'images/1/2017/08/vf1s18V35v1VvJ91W1hj1hjFir1111.jpg', 1, 1502790561),
(16, 1, 1, 'd3.png', 'images/1/2017/08/BkwFFFf1XXTkDBP8ZLTtlDtL1ji0QN.png', 1, 1502790690),
(17, 1, 1, 'userbg.jpg', 'images/1/2017/08/kgtcC1Cz0cttTTGDaZdWtbwkcG5cT9.jpg', 1, 1503111738),
(18, 1, 1, 'q.png', 'images/1/2017/09/md2cBBSDoosPBsBdpts3p3Jp3u2bSB.png', 1, 1504678349),
(19, 1, 1, 'Tzqcu16LBhkzk9Ub3BKMEDLLbTbHlG.jpg', 'images/1/2017/09/BwCWU3zG0u4wYDL3u13lcDWy4O30EY.jpg', 1, 1504678430),
(20, 1, 1, 'sunshi.jpg', 'images/1/2017/09/uPXdPENLdPyenTTrdxAx6Iin6xC6iL.jpg', 1, 1504678910),
(21, 1, 1, 'xd.jpg', 'images/1/2017/09/tK2KC3K02CaCukk0CUt2AKc2a01kKC.jpg', 1, 1504678935),
(22, 1, 1, 'nav1.png', 'images/1/2017/09/N2v7f552q90Fbb227k55TktRFk5B05.png', 1, 1504700448),
(23, 1, 1, 'nav6.png', 'images/1/2017/09/m6eTeseeS6eT9wDZDzS3WDoDNE3AN3.png', 1, 1504700577),
(24, 1, 1, 'nav2.png', 'images/1/2017/09/WJuD3513CP58P3gGpVc1j1V3P154c5.png', 1, 1504700626),
(25, 1, 1, 'nav4.png', 'images/1/2017/09/uq0RKwQmiUc60Ljw6yjucclJj666MZ.png', 1, 1504700667),
(26, 1, 1, 'nav3.png', 'images/1/2017/09/Z8cE1D7qdeQ19eQ1QC7QD0g4AedNdn.png', 1, 1504700709),
(27, 1, 1, 'nav8.png', 'images/1/2017/09/vLWKAlMFMwZU99MLLJ8rwrrAwrjuZM.png', 1, 1504700827),
(28, 1, 1, 'fdhm.jpg', 'images/1/2017/09/UbPLD6fFY8lFe6yjhYQn8THtzh8E8F.jpg', 1, 1505124429),
(29, 1, 1, 'kf.jpg', 'images/1/2017/09/AwlYQ2OBu8NBz0l7YWN8JlyFYuUoUR.jpg', 1, 1505139204),
(30, 1, 1, 'banner1.jpg', 'images/1/2017/09/KOPY5Q9D3Q9ODuZJOoJPd3Y3iOoOOd.jpg', 1, 1505554778),
(31, 1, 1, 's-1.jpg', 'images/1/2017/09/y6066LEvLLwyML0lwyZMaQTlOhL0NV.jpg', 1, 1505577133),
(32, 1, 1, 's-2.jpg', 'images/1/2017/09/WlXq3LZW3KehKLHyyh8YHCHkqx3hkY.jpg', 1, 1505577254),
(33, 1, 1, '未标题-1.jpg', 'images/1/2017/09/jO49NBVlbV0oV00KV4nN5X0GZ1EM9p.jpg', 1, 1505577847),
(34, 1, 1, 's-4.jpg', 'images/1/2017/09/T74879r4OaOecO7O8xNg6RJE19aJn7.jpg', 1, 1505577913),
(35, 1, 1, '2.jpg', 'images/1/2017/09/G3OSfIiigiZSLGg8IoFs19931I3FlL.jpg', 1, 1505578032),
(36, 1, 1, '2.jpg', 'images/1/2017/09/sJ38bl8LaLBA84L88o3154De88zlL1.jpg', 1, 1505578081),
(37, 1, 1, 'timg.jpg', 'images/1/2017/09/L6G5tWWJtU7XrTxQZg5YS7YStZkTDQ.jpg', 1, 1505578998),
(38, 1, 1, 'case-1.jpg', 'images/1/2017/09/skPAiCCNJsvwYAC51kkwrjskaWwcCs.jpg', 1, 1505581938),
(39, 1, 1, '34.jpg', 'images/1/2017/09/ipz5i5iThHlI5PYt59F99PstI9UitY.jpg', 1, 1505617289),
(40, 1, 1, '23.jpg', 'images/1/2017/09/eGobBp0OvyPtppwVrlG5w3VzxN5kT9.jpg', 1, 1505617328),
(42, 1, 1, '微信图片_20170917115056.jpg', 'images/1/2017/09/inD31SQ1rSSc1e2S3R7RF2QVcRPe97.jpg', 1, 1505620328),
(43, 1, 1, '微信图片_20170917115056.jpg', 'images/1/2017/09/HkbT223rRhHO004Kqhkmq3D222JRb0.jpg', 1, 1505620376),
(44, 1, 1, 'xxx.jpg', 'images/1/2017/09/QtR887845R75cRaRiRK484xzoI7tOq.jpg', 1, 1505620387),
(45, 1, 1, 'xcx.jpg', 'images/1/2017/09/pzw7DwMwDLSvOcNodlG2OJGVL2Nqc4.jpg', 1, 1505620466),
(46, 1, 1, 'app.jpg', 'images/1/2017/09/d9ennZLKHZowDE5B9dVozzo0LDe5X0.jpg', 1, 1505620758),
(47, 1, 1, 'gddz.jpg', 'images/1/2017/09/reeygpGqzN2G05GUGAnG29YfqA425L.jpg', 1, 1505620812),
(48, 1, 1, 'lxwm.jpg', 'images/1/2017/09/zS5CeK0F244pgL8b70z55255FJ5554.jpg', 1, 1505633456),
(49, 1, 1, '123.jpg', 'images/1/2017/09/Y2SSeW6sHWO3kh988tM9O6E3s9MsmE.jpg', 1, 1505657677),
(50, 1, 1, '微信图片_20170917221112.jpg', 'images/1/2017/09/b4uufDFMZ2o9fu9uU5l4vl6ru2wlr8.jpg', 1, 1505657791),
(51, 1, 1, '微信图片_20170917221106.jpg', 'images/1/2017/09/Ej7p3KPZPiZKJpoHvrj1zQiOIq1IIh.jpg', 1, 1505657811),
(52, 1, 1, '我们的案例.jpg', 'images/1/2017/09/hPr693al14lLlVLH6V49v4vHL9bp9A.jpg', 1, 1505660697),
(53, 1, 1, '朕要了商城二维码.jpg', 'images/1/2017/09/PwicdpUil8N7n8i8oUWwpSoBO3d9Qr.jpg', 1, 1505660777),
(54, 1, 1, 'anli2.jpg', 'images/1/2017/09/fzjjmRMG5Rf5SMzSKtJztJ5jJsZm5M.jpg', 1, 1505662371),
(55, 1, 1, 'anli2.jpg', 'images/1/2017/09/p7Ohh9XrIXo979Y3eU4R794D4s9uh2.jpg', 1, 1505662719),
(56, 1, 1, '微信图片_20170918111354.jpg', 'images/1/2017/09/fgGlYMrp7JNGLlyBK7XRNbIbBMKY8L.jpg', 1, 1505712031),
(57, 1, 1, 'q1.jpg', 'images/1/2017/09/uTWosR7ooa61TA86nm6iAR1o8XKV77.jpg', 1, 1505750991),
(58, 1, 1, 'content-1.jpg', 'images/1/2017/09/TkHdXDzU90xuuKVUpHT2CH2duUXxYv.jpg', 1, 1505790603),
(59, 1, 1, 'g1.jpg', 'images/1/2017/09/v6I3IyDex34P663PPe7dJ4o4PzosZE.jpg', 1, 1505801268),
(60, 1, 1, 'g2.jpg', 'images/1/2017/09/ENX3n5NZW37WBn7zG33g3Pacl3w5cW.jpg', 1, 1505801269),
(61, 1, 1, 'g3.jpg', 'images/1/2017/09/fkXv6AQkSsoZUAxtvVaqkkyZPax9lJ.jpg', 1, 1505801269),
(62, 1, 1, 'g4.jpg', 'images/1/2017/09/fY5f95i2B7QYS5u5bSi2qeSu616qre.jpg', 1, 1505801269),
(63, 1, 1, '历程.jpg', 'images/1/2017/09/v8rtem48ju4XZuduQ613TmzbUeqTFM.jpg', 1, 1505804519),
(64, 1, 1, '历程.jpg', 'images/1/2017/09/S13RzAjOoEHxh8hM3azzT630v06QVI.jpg', 1, 1505804766),
(65, 1, 1, '历程.jpg', 'images/1/2017/09/XJ60j5eq4yy5RkP6gyQxrbfzBj0xx5.jpg', 1, 1505805129),
(66, 1, 1, '001.jpg', 'images/1/2017/09/qEb77q78z7AkB9edIl228rEgGJ7kgl.jpg', 1, 1505898392),
(67, 1, 1, '002.jpg', 'images/1/2017/09/D4Mf544ZsdW6gsG2wd48FR5M6aVGS5.jpg', 1, 1505898400),
(68, 1, 1, '003.jpg', 'images/1/2017/09/IeLt9Ro1l16eYiy555uo70K9zlvQOq.jpg', 1, 1505898407),
(69, 1, 1, '004.jpg', 'images/1/2017/09/IsN5RP3rlWE8lwlWsw7L8Yly6naPzz.jpg', 1, 1505898414),
(70, 1, 1, '005.jpg', 'images/1/2017/09/nsMHXkn9HStj99H4nSkKAJ3Js9sA0H.jpg', 1, 1505898420),
(71, 1, 1, '006.jpg', 'images/1/2017/09/b2ysn2dXIYYiskz2SY22ZdQn23HNfF.jpg', 1, 1505898426),
(72, 1, 1, '013.jpg', 'images/1/2017/09/IkYV7oRVDcOd8q95c7nzK789kR5SFQ.jpg', 1, 1505898436),
(73, 1, 1, '014.jpg', 'images/1/2017/09/Y0NrOQ2JBSWjcwjuJ0ZUNKu2s0Q35N.jpg', 1, 1505898444),
(74, 1, 1, 'app简介.jpg', 'images/1/2017/09/e14KvSz43640VA0Z4Lddu11f1s0D40.jpg', 1, 1505901336),
(75, 1, 1, 'app简介.jpg', 'images/1/2017/09/I1HoZhHchL1Cy0Y140btAC1YqlcoA5.jpg', 1, 1505901669),
(76, 1, 1, '001.jpg', 'images/1/2017/09/KBTJIozh8nzTo8ww6DJ4j98joKlwoU.jpg', 1, 1505902125),
(77, 1, 1, '002.jpg', 'images/1/2017/09/vjR4yj10rzjY74ajUA0JzrySrj10rs.jpg', 1, 1505902132),
(78, 1, 1, '003.jpg', 'images/1/2017/09/wzZqitT6vqGgvenzzN6t8XtEN60N0r.jpg', 1, 1505902140),
(79, 1, 1, '004.jpg', 'images/1/2017/09/ph3h6WDw36zJ37Y6ZchDh3kFW36JkP.jpg', 1, 1505902145),
(80, 1, 1, 'g-1.jpg', 'images/1/2017/09/F02tR0C95fAF5GaMp828bg82La5C2z.jpg', 1, 1505987894),
(81, 1, 1, 'g-2.jpg', 'images/1/2017/09/wS28g2W0wWA09r9ufWUWWUS9oF9OBF.jpg', 1, 1505987906),
(82, 1, 1, 'g-3.jpg', 'images/1/2017/09/E72Sib22xs28yLxA2LhHkA5LHYB277.jpg', 1, 1505987915),
(83, 1, 1, 'g-4.jpg', 'images/1/2017/09/e9g63tb8uUWt9z9t68TTsZn6W6uEsY.jpg', 1, 1505987923),
(84, 1, 1, 'g-5.jpg', 'images/1/2017/09/T3f7b68gg5oZ8k5Orr3OlK8RxK3kZ5.jpg', 1, 1505987933),
(85, 1, 1, 'g-5.jpg', 'images/1/2017/09/P4t8Lc6bK5tazA66n56LK54z6V04cN.jpg', 1, 1505987944),
(86, 1, 1, 'g-6.jpg', 'images/1/2017/09/WSA3Rss01NxbaAAnkQPDaR0XbsYpp1.jpg', 1, 1505987956),
(87, 1, 1, 'g-7.jpg', 'images/1/2017/09/xj6E2XUpzcCZT363TekZMrtxz37Rc7.jpg', 1, 1505987965),
(88, 1, 1, 'w-1.jpg', 'images/1/2017/09/MLceC66ZhLJ4cpC5emLHCj1p0Qjcj6.jpg', 1, 1505993915),
(89, 1, 1, 'w-2.jpg', 'images/1/2017/09/OpGbmb65mnvb3bygGeBNZ5spVgezam.jpg', 1, 1505993923),
(90, 1, 1, 'w-3.jpg', 'images/1/2017/09/vqX1OQMd7xWtGr1DrOxj1MyZaOMaJQ.jpg', 1, 1505993930),
(91, 1, 1, 'w-4.jpg', 'images/1/2017/09/yN7B037l5Ngx9C7u5ECXLVZMGU7cTU.jpg', 1, 1505993944),
(92, 1, 1, 'w-5.jpg', 'images/1/2017/09/j3kOJU6K88SU6qWWWrjuotStz3q99k.jpg', 1, 1505993951),
(93, 1, 1, 'w-6.jpg', 'images/1/2017/09/M1173ZXtiIDK1njIUC87NXTEc17Xas.jpg', 1, 1505993961),
(94, 1, 1, 'w-7.jpg', 'images/1/2017/09/BQ7x3Q1q6QM6z7W6s3MZ1PFf6umyUq.jpg', 1, 1505993969),
(95, 1, 1, 'w-8.jpg', 'images/1/2017/09/zBND772z27HLA2Ejz8v22J2zD8HsOL.jpg', 1, 1505993975),
(96, 1, 1, 'w-9.jpg', 'images/1/2017/09/H90iHsjsWjfN4YI0i34s4jwMWHmmwW.jpg', 1, 1505993983),
(97, 1, 1, '1427003394090955622.jpg', 'images/1/2017/09/vE3o9poK6vCvkc9zEAWo8WK8P6E8w8.jpg', 1, 1506045116),
(98, 3, 1, 'Z3KxKt4umFM6kK0L9Lv6TqlU9QBlxl.jpg', 'images/3/2017/09/M2p3n85TNp22I8E3Tjz5zE5N36x5BP.jpg', 1, 1506171000),
(99, 3, 1, 'FLlAeNPkaEAEenu92Udy42eYaa3kI2.jpg', 'images/3/2017/09/p7T4TTl4CxEVccX1LOVF3t7zSm7Tsm.jpg', 1, 1506171027),
(100, 3, 1, 'q8aA8VrIPArZAahkraagkTriIR2wV8.jpg', 'images/3/2017/09/cjd7FF6XF77Zj7XXfIXUPFjdJpfuDX.jpg', 1, 1506171309),
(101, 1, 1, 'timg.jpg', 'images/1/2017/09/Rd2xRktDfaZ8jts0oa8LRhDtL0zfAX.jpg', 1, 1506172102),
(104, 1, 1, 'OOd.jpg', 'images/1/2017/09/h4Ld4Yik4SYl4WLA111swTD44zXXK2.jpg', 1, 1506420298),
(103, 1, 1, '羽月智能推广二维码.jpg', 'images/1/2017/09/bMP5juvm6Nw3gM5fjB3GB4G4TPw3V4.jpg', 1, 1506246795),
(105, 6, 4, 'banner-1.jpg', 'images/6/2017/11/ll0ljFdl9xUD20ZxXtaFHaXJDgHrSg.jpg', 1, 1510976565),
(106, 6, 4, 'c-1.png', 'images/6/2017/11/Yczzhc759mHu2Y399h995F9u020HUU.png', 1, 1510976791),
(107, 6, 4, 'c-2.png', 'images/6/2017/11/ZZHHNOoC31Q0533n3OXCqoBFcq3hom.png', 1, 1510976820),
(108, 6, 4, 'c-3.png', 'images/6/2017/11/GjLKJZdVKN7jICS6rI7CyL0jO7iya0.png', 1, 1510976847),
(109, 6, 4, 'c-4.png', 'images/6/2017/11/VbjJeOiEkUY424NwGAU7gbuG2Fzaa2.png', 1, 1510976879),
(110, 6, 4, 'QQ图片20171118115953.jpg', 'images/6/2017/11/cFTWHXqgoKXCz4XMf46lFklxixQCLf.jpg', 1, 1510977960),
(111, 6, 4, 'h1.jpg', 'images/6/2017/11/T37EzWWfW23eEqLElF7eQ3F0bLpN7Z.jpg', 1, 1510978800),
(112, 6, 4, 'timg.jpg', 'images/6/2017/11/NvEZLmQ9Kl36kwUqpPHEvwKo59koKl.jpg', 1, 1510982512),
(113, 6, 4, '酱牛肉1.jpg', 'images/6/2017/11/wR8ihUIj6GI38z7G5zi5R87eHJqPrU.jpg', 1, 1510983067),
(114, 6, 4, '麻辣鸭头.jpg', 'images/6/2017/11/mUepnGlte2EgTEt2QSTPqEquL1S7P1.jpg', 1, 1510983605),
(115, 6, 4, '麻辣鸭头1.jpg', 'images/6/2017/11/yG7XzjnxgwR9PeXLp7Wpnpg781pGqZ.jpg', 1, 1510983631),
(116, 6, 4, '锅贴.jpg', 'images/6/2017/11/yK1i16frPf6zrI4STflzf1IZC6KLGl.jpg', 1, 1510983830),
(117, 6, 4, '麻辣鸭头1.jpg', 'images/6/2017/11/gyKCCvwn5pdrdt5R402L1yDLg5Gc4l.jpg', 1, 1510983943),
(118, 6, 4, '酱牛肉1.jpg', 'images/6/2017/11/u3zQD6BQLfoo0Z8OcCk7jZB7HjK3QH.jpg', 1, 1510984013),
(119, 6, 4, '酱牛肉.jpg', 'images/6/2017/11/a2SKfM2I8T8bbkZsnt40n2tB7TZk2D.jpg', 1, 1510984030),
(120, 6, 4, 'm-1.jpg', 'images/6/2017/11/aq2Nqyy98i9m9LfqI89inYCt97MflL.jpg', 1, 1510985920),
(121, 6, 1, '待支付-1.png', 'images/6/2017/11/qIo5XZ1lDGxK8ilbaOibL3lTlXzGT3.png', 1, 1511543081),
(122, 6, 1, '待用餐-1.png', 'images/6/2017/11/mZomXLX3UGp96P6CtM3oLnGcgbiLzI.png', 1, 1511543116),
(123, 6, 1, '评价-1.png', 'images/6/2017/11/g1M9Jaf07XF5s0Sa5podJTRTA9oJZR.png', 1, 1511543237),
(124, 6, 1, '结束-1.png', 'images/6/2017/11/eXzAR5p4E5EI8z1458J8rb3sye5p4B.png', 1, 1511543352),
(125, 6, 1, '收益-1.png', 'images/6/2017/11/OI116CXYXs1KIc34SixXXSP4y1n3xk.png', 1, 1511543431),
(126, 6, 1, '团队-1.png', 'images/6/2017/11/gOonXgzxwXo5oGxl56lOdnWd7x6AEd.png', 1, 1511543618),
(127, 6, 1, '二维码.png', 'images/6/2017/11/Px7FfU3Gy8w7B2bQ2z23bzZM7N3XU1.png', 1, 1511543672),
(128, 6, 1, '通知-1.png', 'images/6/2017/11/w3m820y2ypYPP113imyRRm28oa8ym3.png', 1, 1511543918),
(129, 6, 1, '余额-1.png', 'images/6/2017/11/MnIPkzhonT6Z9ttqjp8jOOiP8nPPqh.png', 1, 1511543980),
(130, 6, 1, '优惠-1.png', 'images/6/2017/11/DXM2ERXGoHEe2x8thrT32x1Fg3862x.png', 1, 1511544104),
(131, 6, 1, '收藏-1.png', 'images/6/2017/11/bn6RRjTz44Nh6qj1R1rij8h6RIH9hl.png', 1, 1511544141),
(132, 6, 1, 'utbg.png', 'images/6/2017/11/APnnf0nn04f570p7fP12ZnNG75mYpn.png', 1, 1511544382),
(133, 6, 1, '微信图片_20171030190410.jpg', 'images/6/2017/11/yPPFYs011sq33m11S3T0fQQ31iiKtm.jpg', 1, 1511544673),
(134, 6, 1, '微信图片_20171030190432.jpg', 'images/6/2017/11/pV3gxX1RL25rOGQ3LrELlVrB4c53jA.jpg', 1, 1511544673),
(135, 6, 1, '微信图片_20171030190426.jpg', 'images/6/2017/11/yOO9Vut966J8tJn7W72j22W2Td7jM6.jpg', 1, 1511544673),
(136, 6, 1, '微信图片_20171030190437.jpg', 'images/6/2017/11/vznnZcI5nS7nuo71INO9P45Iz1IbPC.jpg', 1, 1511544673),
(137, 6, 1, 'TkHdXDzU90xuuKVUpHT2CH2duUXxYv.jpg', 'images/6/2017/11/Pb87T63zoqaEjA7CO599eOoZ3I75Ci.jpg', 1, 1511544817),
(138, 6, 1, 'kgtcC1Cz0cttTTGDaZdWtbwkcG5cT9.jpg', 'images/6/2017/11/u77waQujsZXQjDDTtK3XxJXTTt5DSQ.jpg', 1, 1511547148),
(139, 6, 1, '2.jpg', 'images/6/2017/11/kpPwU2jp1q2Pf7pUWC3zZWjIGE3uFE.jpg', 1, 1511576720),
(142, 6, 1, '微信图片_20171125161800.jpg', 'images/6/2017/11/hBb65bt67T575g757cTGtlTvVVtC5y.jpg', 1, 1511599301),
(141, 6, 1, '微信图片_20171125110956.jpg', 'images/6/2017/11/bdWS3x1dmGvAVAxTrZ3z0Xd3VgNrmd.jpg', 1, 1511580134),
(143, 6, 1, 'yh-bj.png', 'images/6/2017/11/Zf6noWvMsOofz3mB10v1HHB31rtL3o.png', 1, 1511607654),
(144, 6, 1, 'yh-bj.png', 'images/6/2017/11/VAOVZoff5SFTw3RgoaTgoRTxGLr79Z.png', 1, 1511607817),
(145, 6, 4, '锅贴1.jpg', 'images/6/2017/12/R2I2ISMPgpSKTS7gAS2Xi53p3i4X2Y.jpg', 1, 1513741353),
(146, 6, 4, '锅贴1.jpg', 'images/6/2017/12/nob5Bn24Bnxn2393Uy2Bbo9t9WBK4W.jpg', 1, 1513747961),
(147, 6, 4, '锅贴1.jpg', 'images/6/2017/12/e8oZhuiUVI2V9tj9A2Ai0xrL4Y0air.jpg', 1, 1513748046),
(148, 6, 4, '锅贴1.jpg', 'images/6/2017/12/OBNyFr5BWRzm95B66X153161BQe33n.jpg', 1, 1513748138),
(149, 6, 4, '锅贴1.jpg', 'images/6/2017/12/Fpmz7Ii7ul6ZQVM7UMHMhoVh8M6q8C.jpg', 1, 1513748228),
(150, 6, 4, '锅贴1.jpg', 'images/6/2017/12/Rr4Aad838v48D9LMvm4T5vRdv4ta49.jpg', 1, 1513748305),
(151, 6, 4, '锅贴1.jpg', 'images/6/2017/12/gv3CGoUC6sTS6iooIZOzGtTOTCgSGg.jpg', 1, 1513748366),
(152, 6, 4, '锅贴1.jpg', 'images/6/2017/12/QnGL77X12x2N1HNDn9gXX7u2N4XU4x.jpg', 1, 1513748432),
(153, 6, 4, '锅贴1.jpg', 'images/6/2017/12/eezEZiJ3V4Ix3x3v2xxv40Vzxfh4fx.jpg', 1, 1513748496),
(154, 6, 4, '锅贴1.jpg', 'images/6/2017/12/iyw6Qk442ZaHAdqN2aSAWw164K4je4.jpg', 1, 1513748543),
(155, 6, 4, '锅贴1.jpg', 'images/6/2017/12/npuu1Spzep0EUR8Lur8z1kkzuwlsdd.jpg', 1, 1513748603),
(156, 6, 4, '锅贴1.jpg', 'images/6/2017/12/gpc2IYi240htht70ooTYZpOXz7BPf9.jpg', 1, 1513748659),
(157, 6, 4, '锅贴1.jpg', 'images/6/2017/12/QA0ZoGu9x86NNxXOhV0X70x5L8x9Zo.jpg', 1, 1513748713),
(158, 6, 4, '锅贴1.jpg', 'images/6/2017/12/FxRaJSa4Ai5Gfft4AfkfIs6Kf6DRR5.jpg', 1, 1513748755),
(159, 6, 4, '锅贴1.jpg', 'images/6/2017/12/TUTr19311V3r111cyiE2qZI1pu9Q3R.jpg', 1, 1513748967),
(160, 6, 4, '锅贴1.jpg', 'images/6/2017/12/bAJsmZm81aaMsMMzB1Z9Bmmt1mmMlM.jpg', 1, 1513749209),
(161, 6, 4, '锅贴1.jpg', 'images/6/2017/12/UX1ZSjhS1ssuTjA11Tlijc7115I71c.jpg', 1, 1513749254),
(162, 6, 4, '5年西凤   45度1.jpg', 'images/6/2017/12/WmN1npGp7JudBXzj3x1Dbq7P0BY8zL.jpg', 1, 1513749522),
(163, 6, 4, '大瓶果汁（蓝莓）1.jpg', 'images/6/2017/12/KhJAjU968H29jJUzZFK9njRHxRNhXJ.jpg', 1, 1513749607),
(164, 6, 4, '大瓶果汁（芒果）1.jpg', 'images/6/2017/12/VXRZv2ie8KpH7JGW83e82H38ze2g3h.jpg', 1, 1513749688),
(165, 6, 4, '贵州习酒  53度1.jpg', 'images/6/2017/12/L44Y4m4e4mmVy1hFM04d4o3fym0LZY.jpg', 1, 1513749772),
(166, 6, 4, '海之蓝 38度1.jpg', 'images/6/2017/12/eTVZv5qvlKOovTbEbrpZB2bOZvoKBZ.jpg', 1, 1513749853),
(167, 6, 4, '海之蓝 52度1.jpg', 'images/6/2017/12/G3G32ef3I5d1FOI1B1B2MFwxd2tiO3.jpg', 1, 1513749888),
(168, 6, 4, '海之蓝 52度1.jpg', 'images/6/2017/12/xY63psvLYKYQfcc8vz6c536MmKhvzH.jpg', 1, 1513749953),
(169, 6, 4, '海之蓝 52度1.jpg', 'images/6/2017/12/e221GBC13nnNJ3c3bS2EPEVB20mTnP.jpg', 1, 1513749962),
(170, 6, 4, '海之蓝 52度1.jpg', 'images/6/2017/12/k4Ob4C33TSS3cVLc3OslrLhrScOB5H.jpg', 1, 1513749969),
(171, 6, 4, '花生豆浆1.jpg', 'images/6/2017/12/hNqA6yadK9A6kgcGCGGRgV66qzd6Cc.jpg', 1, 1513750046),
(172, 6, 4, '花生豆浆一扎1.jpg', 'images/6/2017/12/C161y6cnPBlsfIjcil1OpFhpc5ijOc.jpg', 1, 1513750133),
(173, 6, 4, '加多宝凉茶1.jpg', 'images/6/2017/12/Sp8gG8CyY0PGIZMNlVp3P8McCVLNLy.jpg', 1, 1513750207),
(174, 6, 4, '可口可乐听装1.jpg', 'images/6/2017/12/suRS3uXUS343Uk4WuUn33GGgXuSFtg.jpg', 1, 1513750293),
(175, 6, 4, '爽爽小国酒 53度1.jpg', 'images/6/2017/12/B1k6CuCS5vAjKAsvAko1kttTS5KA6k.jpg', 1, 1513750395),
(176, 6, 4, '爽爽小国酒1988 53度1.jpg', 'images/6/2017/12/cReRp9NxKPXkzkhNXGPklo6roopgth.jpg', 1, 1513750476),
(177, 6, 4, '哇哈哈矿泉水 600ML1.jpg', 'images/6/2017/12/o2PqFpZmZ9pjLOO9pK533JlJjO3579.jpg', 1, 1513750530),
(178, 6, 4, '旺仔牛奶1.jpg', 'images/6/2017/12/pUUU8ROUZvWWUf5p26U0uF0o2U6O82.jpg', 1, 1513750628),
(179, 6, 4, '雪碧听装1.jpg', 'images/6/2017/12/VP166312sy14eYE79sy4pS3AEC4631.jpg', 1, 1513750723),
(180, 6, 4, '锅贴1.jpg', 'images/6/2017/12/YLkleJl47qlsESsblS4HLZ24hUzfHL.jpg', 1, 1513751681),
(181, 6, 4, '锅贴1.jpg', 'images/6/2017/12/cdq7DvH6o6o7lc48L1LhciHhO2ZdB6.jpg', 1, 1513751688),
(182, 6, 4, '锅贴1.jpg', 'images/6/2017/12/fzKiZKI8D39BII7Khh1dHNZ7117Ymh.jpg', 1, 1513751724),
(183, 6, 4, '锅贴1.jpg', 'images/6/2017/12/SzE03WT5Dk9z0OkozMO0mo19opsK20.jpg', 1, 1513751735),
(184, 6, 4, '锅贴1.jpg', 'images/6/2017/12/hAaRsRgzOFGHJUMmg0U5jrj5jkAzhF.jpg', 1, 1513751782),
(185, 6, 4, '锅贴1.jpg', 'images/6/2017/12/p7Z6lULQwf69FE9W0eQhLz5w0lZ369.jpg', 1, 1513751814),
(186, 6, 4, '锅贴1.jpg', 'images/6/2017/12/FQB8hJ8bbHlH8LgqP1bbQHl6WephqD.jpg', 1, 1513751878),
(187, 6, 4, '锅贴1.jpg', 'images/6/2017/12/eyl3pqiQyik9YL6QktL6ZqjkIctljI.jpg', 1, 1513751920),
(188, 6, 4, '锅贴1.jpg', 'images/6/2017/12/hWwQZqerW3110637WW11wEj7E7C3CN.jpg', 1, 1513751949),
(189, 6, 4, '锅贴1.jpg', 'images/6/2017/12/Q8862UrhBuZr8Bu15QUHk6qQH9Ugbq.jpg', 1, 1513751976),
(190, 6, 4, '锅贴1.jpg', 'images/6/2017/12/ZeEjPEmRw0mLZ0mes1ibmgivtbhH1m.jpg', 1, 1513752004),
(191, 6, 4, '锅贴1.jpg', 'images/6/2017/12/j3FxGD35KXf3uMkfkUMF54p9fdjP45.jpg', 1, 1513752027),
(192, 6, 4, '锅贴1.jpg', 'images/6/2017/12/gPkqhA7JnFUjLareSR7J7KKH7Hw1au.jpg', 1, 1513752053),
(193, 6, 4, '锅贴1.jpg', 'images/6/2017/12/HguufRh260wFguiNipFc6C96009Uv6.jpg', 1, 1513752073),
(194, 6, 4, '锅贴1.jpg', 'images/6/2017/12/zdn02441CUZ1s58Ch730p4n37JHWsn.jpg', 1, 1513752103),
(195, 6, 4, '锅贴1.jpg', 'images/6/2017/12/yF872Nk1eU23e34ee7e2K318zF7n2n.jpg', 1, 1513752122),
(196, 6, 4, '雪碧听装1.jpg', 'images/6/2017/12/K3LyQmQHMxRgz4ljV35XmMV9PQiI99.jpg', 1, 1513752904),
(197, 6, 4, '旺仔牛奶1.jpg', 'images/6/2017/12/Ws4fPgrXrzQ4ZS1u1EaSBn9qGB99PZ.jpg', 1, 1513753016),
(198, 6, 4, '生态鱼头汤11.jpg', 'images/6/2017/12/HU9t6ylCYCwGl69TtTiv6ONJq90OtQ.jpg', 1, 1513754146),
(199, 6, 4, '生态鱼头汤11.jpg', 'images/6/2017/12/p29GUZM4j9tuvLVwM2W4MgGJf4zV4a.jpg', 1, 1513754201),
(200, 6, 4, '生态鱼头汤22.jpg', 'images/6/2017/12/WhFH5HqcjAhq5zQNhHRON1HScRchu5.jpg', 1, 1513754336),
(201, 6, 4, '生态鱼头汤22.jpg', 'images/6/2017/12/Pd4HSjGshlBHd6Tc0u65S0v0GD5Ub6.jpg', 1, 1513754364),
(202, 6, 4, '生态鱼头汤33.jpg', 'images/6/2017/12/Y557Z5I1q5Aw9I5W615Z6G6ahJJ759.jpg', 1, 1513754373),
(203, 6, 4, '微信图片_201712192243222.jpg', 'images/6/2017/12/EMermCU2UxJrMUJK3yBmTxCk3SXkMC.jpg', 1, 1513754380),
(204, 6, 4, '雪碧听装1.jpg', 'images/6/2017/12/H8lcOzY8o8VOzPH2KH0ey2kzHkeKlO.jpg', 1, 1513755825),
(205, 6, 4, '雪碧听装1.jpg', 'images/6/2017/12/QjEtJahPTPHwaQHpw2aMQE7Pthi2QP.jpg', 1, 1513755833),
(206, 6, 4, '旺仔牛奶1.jpg', 'images/6/2017/12/h1T1wj1JW60w8V0H5MKLz077v88w65.jpg', 1, 1513755853),
(207, 6, 4, '哇哈哈矿泉水 600ML1.jpg', 'images/6/2017/12/WNEM1SE0nssSRmMFB1AFQxeFZf1Ba0.jpg', 1, 1513755876),
(208, 6, 4, '爽爽小国酒1988 53度1.jpg', 'images/6/2017/12/h9Z8DZ5RpOUP5x8DHRj8Drkufr5qk9.jpg', 1, 1513755902),
(209, 6, 4, '爽爽小国酒 53度1.jpg', 'images/6/2017/12/qjC1Y8DojcCCn8Y6CooOrccC7jj6jR.jpg', 1, 1513755928),
(210, 6, 4, '可口可乐听装1.jpg', 'images/6/2017/12/GgT8x4MX4uZ45jNG89xxzzxnp6tT5p.jpg', 1, 1513755950),
(211, 6, 4, '加多宝凉茶1.jpg', 'images/6/2017/12/otPVplZP37kvAUstpkgt57SVatLSTp.jpg', 1, 1513755971),
(212, 6, 4, '花生豆浆一扎1.jpg', 'images/6/2017/12/GFq9t7q6v0aZoGG00GAWGzgtG76Qg0.jpg', 1, 1513755989),
(213, 6, 4, '花生豆浆1.jpg', 'images/6/2017/12/YT9Q5pTUAJzVOUVM5EOMtU1h9pP595.jpg', 1, 1513756009),
(214, 6, 4, '海之蓝 52度1.jpg', 'images/6/2017/12/MvNKsqVVEeNZdXH5Q560n6QQ85v1c6.jpg', 1, 1513756033),
(215, 6, 4, '海之蓝 38度1.jpg', 'images/6/2017/12/vfFg4JqR9cXEqva1aZPgaRerRXHVVz.jpg', 1, 1513756053),
(216, 6, 4, '贵州习酒  53度1.jpg', 'images/6/2017/12/yYLjK4KFk4KpkFY412flOqf4yGx1o2.jpg', 1, 1513756076),
(217, 6, 4, '大瓶果汁（芒果）1.jpg', 'images/6/2017/12/u8KsLdx7ZXeX1asXPCEP3NA6d2Usee.jpg', 1, 1513756095),
(218, 6, 4, '大瓶果汁（蓝莓）1.jpg', 'images/6/2017/12/Pt8kNHNTh553T9Cxx21292TxhXLy1N.jpg', 1, 1513756113),
(219, 6, 4, '5年西凤   45度1.jpg', 'images/6/2017/12/ONRf55X557bMxX75ynRFat5wLlx5aH.jpg', 1, 1513756132),
(220, 6, 4, '白菜心拌蜇皮 26元.jpg', 'images/6/2017/12/wm82MNMM4uM48422Lxnic2c2ON9X7l.jpg', 1, 1513756410),
(221, 6, 4, '东坡肉 58元.jpg', 'images/6/2017/12/YZe1OyFF6l2me71Dyh17YYEN2peQhy.jpg', 1, 1513756500),
(222, 6, 4, '东坡肉 58元.jpg', 'images/6/2017/12/Kx3a4ppOvRaCpCv3S49CS0h0o8XP4x.jpg', 1, 1513756583),
(223, 6, 4, '风干鸡 32元.jpg', 'images/6/2017/12/ixl5HX609R2c2xTR655Lx25062U6Lc.jpg', 1, 1513756698),
(224, 6, 4, '干炸小黄花鱼 38元.jpg', 'images/6/2017/12/Pz575oO7254R15S471VDq33XqKsrD4.jpg', 1, 1513756829),
(225, 6, 4, '蛤蜊汤 18元.jpg', 'images/6/2017/12/jaNUu8Wc8111LZ1FmcAF3NjFfVUUMa.jpg', 1, 1513756913),
(226, 6, 4, '黄椒鱼鳍 38元.jpg', 'images/6/2017/12/vi2vX2VnWNinbf5wADknpBwIaqkXdp.jpg', 1, 1513757054),
(227, 6, 4, '将军菜 18元.jpg', 'images/6/2017/12/evYtDdu59vdpS537ll757DzYk795sP.jpg', 1, 1513757147),
(228, 6, 4, '姜汁海螺 48元.jpg', 'images/6/2017/12/Ok0mm93LOvH3V9MzZ37KHsIOvVHz30.jpg', 1, 1513757224),
(229, 6, 4, '姜汁扇贝 18元.jpg', 'images/6/2017/12/wMNRz4yy40024j7RhlJ0220kH9yh3t.jpg', 1, 1513757282),
(230, 6, 4, '浇汁海蜇头  39元.jpg', 'images/6/2017/12/m6r71Q3ATsbUb1EzAyRRR1B1eq4U1r.jpg', 1, 1513757345),
(231, 6, 4, '辣炒活八带  58元.jpg', 'images/6/2017/12/NDU85DRGZZiH8ug1RRD32553h8L1SR.jpg', 1, 1513757430),
(232, 6, 4, '凉拌海草  18元.jpg', 'images/6/2017/12/g1nH6KXII0pl1f6f7LYjIdwKXn5l7K.jpg', 1, 1513757506),
(233, 6, 4, '凉拌马家沟 18元.jpg', 'images/6/2017/12/TEvk1fHrKUsu1z0MkMRZ7kfNn5fFJk.jpg', 1, 1513757564),
(234, 6, 4, '流亭猪蹄 35元.jpg', 'images/6/2017/12/Ky2ft9gp2q2SeztFtO2s2sQY1oo1Yy.jpg', 1, 1513757613),
(235, 6, 4, '萝卜干蒸腊肉 38元.jpg', 'images/6/2017/12/J999GMYW999wTd9G9wR7Ww6yww79rR.jpg', 1, 1513757701),
(236, 6, 4, '墨鱼炖豆腐 48元.jpg', 'images/6/2017/12/CjHHjpNZnt6JDmu0h2DDJmp6RnTo6u.jpg', 1, 1513757762),
(237, 6, 4, '清炒鲍芹 20元.jpg', 'images/6/2017/12/PW9z9Sfv66G2wjw90WJWG2XlLwn2s6.jpg', 1, 1513757810),
(238, 6, 4, '清蒸活牙片 78元.jpg', 'images/6/2017/12/tE7GB5z7i28gGeB8Eb7dzbB3b4AN98.jpg', 1, 1513757869),
(239, 6, 4, '乳山生蚝 58元.jpg', 'images/6/2017/12/q9BfoXB4OoCbPO9or9lZQoFlo22TD9.jpg', 1, 1513757930),
(240, 6, 4, '酸辣土豆丝 12元.jpg', 'images/6/2017/12/oa8M7Zn55u4864775H9A5H99L9Ma93.jpg', 1, 1513757986),
(241, 6, 4, '蒜黄炒鸡蛋 22元.jpg', 'images/6/2017/12/Bp3g89p85Q5s895837GkZsZSSE539U.jpg', 1, 1513758029),
(242, 6, 4, '蒜蓉西兰花 18元.jpg', 'images/6/2017/12/G8mNYZLXn701877zma17M8UB005M10.jpg', 1, 1513758074),
(243, 6, 4, '熏鱼 28元.jpg', 'images/6/2017/12/W0jorg5Nd0ZvR7701NrGssTrNgOuJd.jpg', 1, 1513758115),
(244, 6, 4, '鱼香肉丝 29元.jpg', 'images/6/2017/12/fC4ZCZxhSWcze8cNMSbxshCe58Hbwv.jpg', 1, 1513758162),
(245, 6, 4, '芫爆羊肚 38元.jpg', 'images/6/2017/12/Uq0SXuXk0PTQPZqQux09qKx0vpPKUl.jpg', 1, 1513758216),
(246, 6, 4, '自制甜蒜 6元   .jpg', 'images/6/2017/12/Ezc2YHFEuYeya4CCUpz6yb2MBFpEHf.jpg', 1, 1513758311),
(247, 6, 4, 'w.jpg', 'images/6/2017/12/OqTeIvbg0VN1giHhHHGziAiwIiV5Uv.jpg', 1, 1513822886),
(248, 6, 4, '乳山生蚝 58元.jpg', 'images/6/2017/12/mDDIdjuOPUhNono2f2nn7H2fN2H22w.jpg', 1, 1513823088),
(249, 6, 4, 'w.jpg', 'images/6/2017/12/RoOQ35L4h4CLQCMCowZ5W5hHuNHCuw.jpg', 1, 1513823321),
(250, 6, 4, '1.jpg', 'images/6/2017/12/wq6BoQRbx1A6iizv1RbI2SsaR1C6xA.jpg', 1, 1513911940),
(251, 6, 4, '2.jpg', 'images/6/2017/12/XzvvtAwUi2GT13i6jIuz23PP268DiL.jpg', 1, 1513912022),
(252, 6, 4, '3.jpg', 'images/6/2017/12/UXDSFF9f7y7OdXswzbna7oXS9M7fBX.jpg', 1, 1513912051),
(253, 6, 4, '4.jpg', 'images/6/2017/12/lq0SRo9Q9QS6PP8I9F4PDDB0OEhpId.jpg', 1, 1513912093),
(254, 6, 4, '5.jpg', 'images/6/2017/12/gr449SERF5EW2900z4rzSrk40RwF4p.jpg', 1, 1513912162),
(255, 6, 4, '6.jpg', 'images/6/2017/12/mMmibcYx8YFoKI21yCzc81CcMCi1Xu.jpg', 1, 1513912214),
(256, 6, 4, '7.jpg', 'images/6/2017/12/om8rqb54MXXq438sXX1eqmTBTG15e1.jpg', 1, 1513912242),
(257, 6, 4, '8.jpg', 'images/6/2017/12/lB0PYKdXpHNhiSpPszBiPzI0NFIBPb.jpg', 1, 1513912279),
(258, 6, 4, '9.jpg', 'images/6/2017/12/BUc7e9kKgDDkfEyfdUkcNKYcF282fo.jpg', 1, 1513912310),
(259, 6, 4, '10.jpg', 'images/6/2017/12/D26sOmS2TRM22bM9x2txx07t8X0rs2.jpg', 1, 1513912370),
(260, 6, 4, '11.jpg', 'images/6/2017/12/qHltfoxOjvTfJpclWxqx9hHWxoxrTL.jpg', 1, 1513912399),
(261, 6, 4, '12.jpg', 'images/6/2017/12/txEduTds54eXQd5tWjx4X95UFCW9qz.jpg', 1, 1513912423),
(262, 6, 4, '13.jpg', 'images/6/2017/12/wH4444E3s99Yck49Yp1zNh299sCvhk.jpg', 1, 1513912462),
(263, 6, 4, '14.jpg', 'images/6/2017/12/gUC2z96bBOO2J26bxUBAxJXBO2uayo.jpg', 1, 1513912532),
(264, 6, 4, '15.jpg', 'images/6/2017/12/gkHcR10jE6maZ2Kx81688CC8hl8xHc.jpg', 1, 1513912562),
(265, 6, 4, '16.jpg', 'images/6/2017/12/ZgTpuZ8uLHO18UkaYY8Lq5k5JooQq1.jpg', 1, 1513912594),
(266, 6, 4, '17.jpg', 'images/6/2017/12/zUY09NNvpqV033Vn834B8QTb9XNtt9.jpg', 1, 1513912637),
(267, 6, 4, '18.jpg', 'images/6/2017/12/JxySJWYYOgVrG5dLW9BS5Lgbrz5dgZ.jpg', 1, 1513912717),
(268, 6, 4, '19.jpg', 'images/6/2017/12/ukFZ5q0755uW7F5wKK5qFXKWVf0ZQF.jpg', 1, 1513912742),
(269, 6, 4, '20.jpg', 'images/6/2017/12/SF2izBFN0QzFIR0zOal6vNIB62RiF0.jpg', 1, 1513912770),
(270, 6, 4, '21.jpg', 'images/6/2017/12/wjGPEvsCgVpewlKT5KQrGxCxjLkjJz.jpg', 1, 1513912822),
(271, 6, 4, '22.jpg', 'images/6/2017/12/o5kvzOLnoLYnAn4L0Iw0v0dYbdD5VA.jpg', 1, 1513912861),
(272, 6, 4, '23.jpg', 'images/6/2017/12/zM3PW5zpGg0lpHEVLtjg0t2gu0Hmwv.jpg', 1, 1513912886),
(273, 6, 4, '24.jpg', 'images/6/2017/12/w8PL7gMMLp1ALj4lL2JLLZHLGL010J.jpg', 1, 1513912917),
(274, 6, 4, 'T37EzWWfW23eEqLElF7eQ3F0bLpN7Z.jpg', 'images/6/2017/12/YN77eNNIr2n1zHLHGrD4e2rnZ7n4Hr.jpg', 1, 1513920339),
(275, 6, 4, 'ZgTpuZ8uLHO18UkaYY8Lq5k5JooQq1.jpg', 'images/6/2017/12/w93xPXC300LqCvHOC93OCaZAq4jGX3.jpg', 1, 1513920425),
(276, 6, 4, 'NvEZLmQ9Kl36kwUqpPHEvwKo59koKl.jpg', 'images/6/2017/12/AZZWTnP95Tj9dNdUDPDMn0PPU9nPDd.jpg', 1, 1513920428),
(277, 6, 4, 'wR8ihUIj6GI38z7G5zi5R87eHJqPrU.jpg', 'images/6/2017/12/qvCtBHH6Ncnn2w4HcjJRntOh6pCuNj.jpg', 1, 1513920454),
(278, 6, 4, 'zM3PW5zpGg0lpHEVLtjg0t2gu0Hmwv.jpg', 'images/6/2017/12/LFM5m5Mv44mY4vXp164Vddo134VO4o.jpg', 1, 1513920498),
(279, 6, 4, 'mUepnGlte2EgTEt2QSTPqEquL1S7P1.jpg', 'images/6/2017/12/VsyicZfW2ahUw4Cfwkf3i2I4ECc3Wc.jpg', 1, 1513920510),
(280, 6, 4, 'Ezc2YHFEuYeya4CCUpz6yb2MBFpEHf.jpg', 'images/6/2017/12/r7roSVcvnXzUnkwErke0rE1rwik1cR.jpg', 1, 1513920545),
(281, 6, 4, 'cdq7DvH6o6o7lc48L1LhciHhO2ZdB6.jpg', 'images/6/2017/12/SNrCEmlCXWC1AYz6YeGl6GG4gy2EYG.jpg', 1, 1513920567),
(282, 6, 4, 'w8PL7gMMLp1ALj4lL2JLLZHLGL010J.jpg', 'images/6/2017/12/qwTw89YYRFNiw3KNKjKFjPIrJ9v29p.jpg', 1, 1513920579),
(283, 6, 4, 'cdq7DvH6o6o7lc48L1LhciHhO2ZdB6.jpg', 'images/6/2017/12/r3pDe56j1G4JJGyCmE4Ef766646c77.jpg', 1, 1513920590),
(284, 6, 4, 'fC4ZCZxhSWcze8cNMSbxshCe58Hbwv.jpg', 'images/6/2017/12/B6AU1HLgI9wjWuZ6aA0Dg4jj1I4ndh.jpg', 1, 1513920602),
(285, 6, 4, 'cdq7DvH6o6o7lc48L1LhciHhO2ZdB6.jpg', 'images/6/2017/12/pllh5aGoZAG7ofhVv4292qUT2BrytO.jpg', 1, 1513920610),
(286, 6, 4, 'cdq7DvH6o6o7lc48L1LhciHhO2ZdB6.jpg', 'images/6/2017/12/lryV9V8V75V8si6v8vsrnDk8iQKyK8.jpg', 1, 1513920631),
(287, 6, 4, 'txEduTds54eXQd5tWjx4X95UFCW9qz.jpg', 'images/6/2017/12/mTTzCtlNynTB102uU0b2b17IzQynnz.jpg', 1, 1513920634),
(288, 6, 4, 'cdq7DvH6o6o7lc48L1LhciHhO2ZdB6.jpg', 'images/6/2017/12/Wgo6FG59525TG45O5645f5O9f9OoT4.jpg', 1, 1513920651),
(289, 6, 4, 'wq6BoQRbx1A6iizv1RbI2SsaR1C6xA.jpg', 'images/6/2017/12/cdgVZOOLg6UGxBZG6ggv7i06ZpX6gi.jpg', 1, 1513920658),
(290, 6, 4, 'cdq7DvH6o6o7lc48L1LhciHhO2ZdB6.jpg', 'images/6/2017/12/Apu27yG1O57FqW03gCe2M1514mPW32.jpg', 1, 1513920673),
(291, 6, 4, 'cdq7DvH6o6o7lc48L1LhciHhO2ZdB6.jpg', 'images/6/2017/12/PUX8EJ499Q9yyIFqIjEAt9yoEetj8F.jpg', 1, 1513920692),
(292, 6, 4, 'cdq7DvH6o6o7lc48L1LhciHhO2ZdB6.jpg', 'images/6/2017/12/HkNUz61NuE9nJWdux9n4A6d4ZuUWnn.jpg', 1, 1513920712),
(293, 6, 4, 'cdq7DvH6o6o7lc48L1LhciHhO2ZdB6.jpg', 'images/6/2017/12/l3E62o76S6jXT26JJDIibiOS1ieeO8.jpg', 1, 1513920731),
(294, 6, 4, 'XzvvtAwUi2GT13i6jIuz23PP268DiL.jpg', 'images/6/2017/12/PBxxXI1710xCxBxcX9bNpPiCUP03cx.jpg', 1, 1513920749),
(295, 6, 4, 'cdq7DvH6o6o7lc48L1LhciHhO2ZdB6.jpg', 'images/6/2017/12/Lb771O1gZRBrURu1VMfS4iu4gSFs1f.jpg', 1, 1513920750),
(296, 6, 4, 'cdq7DvH6o6o7lc48L1LhciHhO2ZdB6.jpg', 'images/6/2017/12/C7C67gTc7GUUZt969Utcq2t9C3kTCF.jpg', 1, 1513920769),
(297, 6, 4, 'UXDSFF9f7y7OdXswzbna7oXS9M7fBX.jpg', 'images/6/2017/12/ou01x1ssm008qUC91qq2zXCGcmMg3p.jpg', 1, 1513920777),
(298, 6, 4, 'ukFZ5q0755uW7F5wKK5qFXKWVf0ZQF.jpg', 'images/6/2017/12/pCUsW5MSffwWW6cwsbskS6zDfujWb3.jpg', 1, 1513920807),
(299, 6, 4, 'qHltfoxOjvTfJpclWxqx9hHWxoxrTL.jpg', 'images/6/2017/12/WtDD5b8K767peh7jBtKTCJek6d7bKh.jpg', 1, 1513920832),
(300, 6, 4, 'cdq7DvH6o6o7lc48L1LhciHhO2ZdB6.jpg', 'images/6/2017/12/h6iP7i2vC6n99o6mZZlc5vGg69pjIj.jpg', 1, 1513920852),
(301, 6, 4, 'lq0SRo9Q9QS6PP8I9F4PDDB0OEhpId.jpg', 'images/6/2017/12/gofFo474fS41o716T6dO6o7zspOd1O.jpg', 1, 1513920865),
(302, 6, 4, 'cdq7DvH6o6o7lc48L1LhciHhO2ZdB6.jpg', 'images/6/2017/12/wl9Q1y1MjogQlk6My29J1lj9LoQ1wA.jpg', 1, 1513920911),
(303, 6, 4, 'wjGPEvsCgVpewlKT5KQrGxCxjLkjJz.jpg', 'images/6/2017/12/J7e47r1Cn7FgeP427J0c95A97g229o.jpg', 1, 1513920917),
(304, 6, 4, 'D26sOmS2TRM22bM9x2txx07t8X0rs2.jpg', 'images/6/2017/12/PNn675n0ziPJ5RJ9Gnn7M427pl9N72.jpg', 1, 1513920946),
(305, 6, 4, 'BUc7e9kKgDDkfEyfdUkcNKYcF282fo.jpg', 'images/6/2017/12/rePgfe5eksTZ5RR5GwTphFI654kHie.jpg', 1, 1513920974),
(306, 6, 4, 'ONRf55X557bMxX75ynRFat5wLlx5aH.jpg', 'images/6/2017/12/E2xLWl4e24MrLbcvwVvulrEH6236ie.jpg', 1, 1513920982),
(307, 6, 4, 'Pt8kNHNTh553T9Cxx21292TxhXLy1N.jpg', 'images/6/2017/12/JN92kceeNkUww96K90x596E09EkZN6.jpg', 1, 1513921003),
(308, 6, 4, 'gr449SERF5EW2900z4rzSrk40RwF4p.jpg', 'images/6/2017/12/p5dYDLWlT2t8U21y2V2fWw2TV2MD01.jpg', 1, 1513921006),
(309, 6, 4, 'wH4444E3s99Yck49Yp1zNh299sCvhk.jpg', 'images/6/2017/12/i7FfbA4110MPovZJjfJWpOxGABvJ41.jpg', 1, 1513921066),
(310, 6, 4, 'u8KsLdx7ZXeX1asXPCEP3NA6d2Usee.jpg', 'images/6/2017/12/LBSSKc5tXetpvx4149uxtVX4Px21s1.jpg', 1, 1513921074),
(311, 6, 4, 'SF2izBFN0QzFIR0zOal6vNIB62RiF0.jpg', 'images/6/2017/12/PuASxj3GXq7GEg7a73jBEQU31Mi1V0.jpg', 1, 1513921104),
(312, 6, 4, 'yYLjK4KFk4KpkFY412flOqf4yGx1o2.jpg', 'images/6/2017/12/DIdDE56RAHoRZ5A6rwIiEb6cZEeHbz.jpg', 1, 1513921125),
(313, 6, 4, 'gkHcR10jE6maZ2Kx81688CC8hl8xHc.jpg', 'images/6/2017/12/xsAe8QKa8ibEiiS8QmLLCmBBMCSQnS.jpg', 1, 1513921143),
(314, 6, 4, 'vfFg4JqR9cXEqva1aZPgaRerRXHVVz.jpg', 'images/6/2017/12/YJ7GBUZs6ogg7NZNJzj66s0S5SOjdB.jpg', 1, 1513921172),
(315, 6, 4, 'MvNKsqVVEeNZdXH5Q560n6QQ85v1c6.jpg', 'images/6/2017/12/zIA3ZyeIKYjR3XzJn9FrEAheYkSnKF.jpg', 1, 1513921251),
(316, 6, 4, 'YT9Q5pTUAJzVOUVM5EOMtU1h9pP595.jpg', 'images/6/2017/12/R1XLqnpaGA7I1Ige1w2tEtn7x77XaZ.jpg', 1, 1513921432),
(317, 6, 4, 'qjC1Y8DojcCCn8Y6CooOrccC7jj6jR.jpg', 'images/6/2017/12/bfkzrNkppaN95doENzoArPDA5pZRPN.jpg', 1, 1513921479),
(318, 6, 4, 'otPVplZP37kvAUstpkgt57SVatLSTp.jpg', 'images/6/2017/12/oGi4As9hgXV1dRgD8d3H82V8271rZ4.jpg', 1, 1513921524),
(319, 6, 4, 'h9Z8DZ5RpOUP5x8DHRj8Drkufr5qk9.jpg', 'images/6/2017/12/dhRCn7cDnaBQN7bJkdxqK7LQQK7k87.jpg', 1, 1513921563),
(320, 6, 4, 'GgT8x4MX4uZ45jNG89xxzzxnp6tT5p.jpg', 'images/6/2017/12/uAUU5pCu0C33p7C0c1cecppGPL0lDh.jpg', 1, 1513921604),
(321, 6, 4, 'GFq9t7q6v0aZoGG00GAWGzgtG76Qg0.jpg', 'images/6/2017/12/Sv4vIFdj76fRn669af5VjJ9v99fDB9.jpg', 1, 1513921631),
(322, 6, 4, 'WNEM1SE0nssSRmMFB1AFQxeFZf1Ba0.jpg', 'images/6/2017/12/PP0M0mvym0iU4v7i0Mv4YSmp7j7As4.jpg', 1, 1513921675),
(323, 6, 4, 'h1T1wj1JW60w8V0H5MKLz077v88w65.jpg', 'images/6/2017/12/kl7VlVWv32j9v17Wq7VOlrjv30F2MZ.jpg', 1, 1513921708),
(324, 6, 4, 'QjEtJahPTPHwaQHpw2aMQE7Pthi2QP.jpg', 'images/6/2017/12/F8428HLn5Al1mx2mz4O1grI2OG81I5.jpg', 1, 1513921746),
(325, 6, 4, 'p29GUZM4j9tuvLVwM2W4MgGJf4zV4a.jpg', 'images/6/2017/12/E66X6mz1pUby6Ukt7ParxXXgZ66T7Y.jpg', 1, 1513921853),
(326, 6, 4, 'Pd4HSjGshlBHd6Tc0u65S0v0GD5Ub6.jpg', 'images/6/2017/12/Ez6dYtp6076XKYXBu5pYdNnX0XEO4X.jpg', 1, 1513921869),
(327, 6, 4, 'EMermCU2UxJrMUJK3yBmTxCk3SXkMC.jpg', 'images/6/2017/12/c0j0JJERRcGydG3JuZVUy0g2vjoYJU.jpg', 1, 1513921898),
(328, 6, 4, 'p29GUZM4j9tuvLVwM2W4MgGJf4zV4a.jpg', 'images/6/2017/12/pY3O79x69hZ6kLK2uh6HoX0mfHK0Kh.jpg', 1, 1513921938),
(329, 6, 4, 'JxySJWYYOgVrG5dLW9BS5Lgbrz5dgZ.jpg', 'images/6/2017/12/u9ntmCTfGTo9HCaFtPceaXPoHp901T.jpg', 1, 1513922044),
(330, 6, 4, 'mMmibcYx8YFoKI21yCzc81CcMCi1Xu.jpg', 'images/6/2017/12/yJz5pZgppaAlGPSHUP0naoalnrPv0G.jpg', 1, 1513922088),
(331, 6, 4, 'om8rqb54MXXq438sXX1eqmTBTG15e1.jpg', 'images/6/2017/12/D1eJde4s3tjtu16xN8RLSm34u1seEn.jpg', 1, 1513922130),
(332, 6, 4, 'o5kvzOLnoLYnAn4L0Iw0v0dYbdD5VA.jpg', 'images/6/2017/12/md73e7mM9LDEeUbFO7u938MedE5UL7.jpg', 1, 1513922179),
(333, 6, 4, 'zUY09NNvpqV033Vn834B8QTb9XNtt9.jpg', 'images/6/2017/12/Iccc3XoOzC21R2r129Oc3erlzJ9RZr.jpg', 1, 1513922223),
(334, 6, 4, 'lB0PYKdXpHNhiSpPszBiPzI0NFIBPb.jpg', 'images/6/2017/12/MY228fzo4W4WgOmosoQojO482O4No5.jpg', 1, 1513922261),
(335, 6, 4, 'logo.png', 'images/6/2017/12/qqc02BT0gtQ828Cts02NZshtFVFfbC.png', 1, 1514433642),
(336, 6, 4, '1903  10元2.jpg', 'images/6/2018/01/K7t38A7uT88tud88zWzWotZ8du38x7.jpg', 1, 1514819344),
(337, 6, 4, '1903  10元.jpg', 'images/6/2018/01/iFW363CCCW6nFeFy3e2B23F2H1643M.jpg', 1, 1514819364),
(338, 6, 4, '白啤 10元2.jpg', 'images/6/2018/01/imQ2RxN0n33n0KDxxMXXNxmE3x22x8.jpg', 1, 1514819829),
(339, 6, 4, '白啤 10元1.jpg', 'images/6/2018/01/P2xOTdh4XNHK6O7mzo20K7OD020Vmk.jpg', 1, 1514819838),
(340, 6, 4, '出口青啤大瓶 18元2.jpg', 'images/6/2018/01/pxSYmyYyb7lKLX7h8yRmD9YM69DD97.jpg', 1, 1514819962),
(341, 6, 4, '出口青啤大瓶 18元1.jpg', 'images/6/2018/01/wFCco1jr5C4FzJ17j9jrGjDzGFJoiH.jpg', 1, 1514819970),
(342, 6, 4, '出口青啤小瓶10元瓶2.jpg', 'images/6/2018/01/ECu6wk1FEu64ERVlvcwck03EZNNc6w.jpg', 1, 1514820157),
(343, 6, 4, '出口青啤小瓶10元瓶1.jpg', 'images/6/2018/01/MKMRKzP6770P0d330Ghbk3b14n3G4R.jpg', 1, 1514820173),
(344, 6, 4, '大白金 15元2.jpg', 'images/6/2018/01/FHl6l6623Ddk1eqR12qqO21O821BrL.jpg', 1, 1514820229),
(345, 6, 4, '大白金 15元1.jpg', 'images/6/2018/01/L32jrdeit3ruRAjyt3Tj44eEH84wtQ.jpg', 1, 1514820238),
(346, 6, 4, '鸿运当头 35元2.jpg', 'images/6/2018/01/B4z498DQOc429FQ4O595Q4EqqZO9N7.jpg', 1, 1514820326),
(347, 6, 4, '鸿运当头 35元1.jpg', 'images/6/2018/01/Ie4O249Dx34k339z623o5P7Yd9494Z.jpg', 1, 1514820337),
(348, 6, 4, '崂特纯生 8元2.jpg', 'images/6/2018/01/Lh0q7Q159ZVgVV797h7F2fV0kGh850.jpg', 1, 1514820554),
(349, 6, 4, '崂特纯生 8元1.jpg', 'images/6/2018/01/Bx5kZs8pSYk2y17Nna76s8SS820xIT.jpg', 1, 1514820565),
(350, 6, 4, '青岛9度 6元2.jpg', 'images/6/2018/01/bPP8BpAewUWbEpqz69zeQePqpQpB9p.jpg', 1, 1514820656),
(351, 6, 4, '青岛9度 6元1.jpg', 'images/6/2018/01/vw1z3Q61uonRq6zx5DW57N6x316qOX.jpg', 1, 1514820667),
(352, 6, 4, '青岛大优 8元2.jpg', 'images/6/2018/01/vPWKNDMupKPDOnjWPu0PnqW98d7mif.jpg', 1, 1514820745),
(353, 6, 4, '青岛大优 8元1.jpg', 'images/6/2018/01/c33GKeZWuKSsfFqos3u3pGj3e8fp33.jpg', 1, 1514820754),
(354, 6, 4, '沙子口    6元2.jpg', 'images/6/2018/01/L9NWHiYdq9GzVL2LRYDNW2GhD18Yg6.jpg', 1, 1514820887),
(355, 6, 4, '沙子口    6元1.jpg', 'images/6/2018/01/g0e1Yeg02QRy2NHmyr2An4y5rQNNrb.jpg', 1, 1514820895),
(356, 6, 4, '蛤蜊肉汆蛋-22元1.jpg', 'images/6/2018/01/uKi8zjk9k0KjIk4D0x048Cj0m9qi4z.jpg', 1, 1514821793),
(357, 6, 4, '蛤蜊肉汆蛋-22元.jpg', 'images/6/2018/01/N0MfC0w2f4f0PPzqw3Fpc4P4FnQ407.jpg', 1, 1514821801),
(358, 6, 4, '姜汁活爬虾-68元1.jpg', 'images/6/2018/01/ph0X2QZ5HXM8Ddq80Ss830Fd8f8zR2.jpg', 1, 1514821930),
(359, 6, 4, '姜汁活爬虾-68元.jpg', 'images/6/2018/01/T2hlrr45ad2DDH1WL2oDrdo1OlE1dZ.jpg', 1, 1514821945),
(360, 6, 4, '姜汁扇贝-18元1.jpg', 'images/6/2018/01/A57m2l77qQHz5KgibcMiMHq8hmDHhK.jpg', 1, 1514822089),
(361, 6, 4, '姜汁扇贝-18元.jpg', 'images/6/2018/01/S9h731oHjOj4YjoJcY3zTdRyo9zH1N.jpg', 1, 1514822094),
(362, 6, 4, '辣炒红岛花蛤--26元1.jpg', 'images/6/2018/01/qu5dCtT2gDIBBGc2IG57GKRCbzd755.jpg', 1, 1514822158),
(363, 6, 4, '辣炒红岛花蛤--26元.jpg', 'images/6/2018/01/naf5757ftxiJ7f7f6zj5tj57WGsRrG.jpg', 1, 1514822164),
(364, 6, 4, '炝拌活八带--58元1.jpg', 'images/6/2018/01/el1vhVnXk0a978A9ANx966lAIiVX8a.jpg', 1, 1514822320),
(365, 6, 4, '炝拌活八带--58元.jpg', 'images/6/2018/01/GObXfZX8b8U1e01XhMMXSLch90fZ1S.jpg', 1, 1514822350),
(366, 6, 4, '乳山生蚝-58元1.jpg', 'images/6/2018/01/EQW8ack81L1WFQXlkc8uKC38Zcw841.jpg', 1, 1514822403),
(367, 6, 4, '乳山生蚝-58元.jpg', 'images/6/2018/01/X9R8332r6dd0jj2m62dm62R6KD69k9.jpg', 1, 1514822409),
(368, 6, 4, '铁锅蛤蜊鸡-68元1.jpg', 'images/6/2018/01/g3FmUF1RjkM3ke9Hf1lUHI6lNn1897.jpg', 1, 1514822476),
(369, 6, 4, '铁锅蛤蜊鸡-68元.jpg', 'images/6/2018/01/Cly3c3z32ovuCYvOOY7cLz33k2uMrA.jpg', 1, 1514822482),
(370, 6, 4, '西红柿炒鸡蛋-18元1.jpg', 'images/6/2018/01/lI2FIbflg5i5Jy7j9BdN0lLL1d4sys.jpg', 1, 1514822532),
(371, 6, 4, '西红柿炒鸡蛋-18元.jpg', 'images/6/2018/01/y4FDn46zyFq92yN68gxf6QwgkNdXyn.jpg', 1, 1514822538),
(372, 6, 6, '麻辣豆腐 14元.jpg', 'images/6/2018/01/aerTgjJ00G2JJIImtDKG40Y11g1JEY.jpg', 1, 1515046955),
(373, 6, 6, '麻辣豆腐-14元.jpg', 'images/6/2018/01/eMt2EzT6fZex50k7n9Th7NEH580W8w.jpg', 1, 1515046968),
(374, 6, 6, '麻辣豆腐 14元.jpg', 'images/6/2018/01/e65l7l5NU5LNRgP8L54HmnqJQ7UlR4.jpg', 1, 1515046976),
(375, 6, 6, '杭椒牛柳--39元.jpg', 'images/6/2018/01/AqQl7A1YA3Q133gEEeGQAl3QUYu4S3.jpg', 1, 1515047040),
(376, 6, 6, '杭椒牛柳  39元.jpg', 'images/6/2018/01/J6WHsMPM42DF4Sp5fuf75XXbsf4979.jpg', 1, 1515047047),
(377, 6, 6, '浇汁小海鲜-22元.jpg', 'images/6/2018/01/hiT5EX3dhiHHh4guH23dz5XgHZngvV.jpg', 1, 1515047099),
(378, 6, 6, '浇汁小海鲜 22元.jpg', 'images/6/2018/01/f9nB7dCXZJ7C7y82aNOYD9bZBBYdB7.jpg', 1, 1515047106),
(379, 6, 6, '紫菜蛋花汤1 10元.jpg', 'images/6/2018/01/QP0aUV17k4kpPVH1jz7S47SSJs5SzA.jpg', 1, 1515047251),
(380, 6, 6, '紫菜蛋花汤 10元.jpg', 'images/6/2018/01/a6v8YKMvAp7PmvPyg8KvaGVmzYaYPP.jpg', 1, 1515047257),
(381, 6, 6, '麻辣鸭头1 38元.jpg', 'images/6/2018/01/qDj66BKzJN1DKjRpKV6kbIssRMkVbj.jpg', 1, 1515047303),
(382, 6, 6, '麻辣鸭头 38元.jpg', 'images/6/2018/01/cB0jCHw0sCKh2vHaBbkvkaVu44BU0K.jpg', 1, 1515047309),
(383, 6, 6, '蒸汽海鲜锅1 78元.jpg', 'images/6/2018/01/iXMs051k0x19FSp0fy9SM4M4nMpymx.jpg', 1, 1515047346),
(384, 6, 6, '蒸汽海鲜锅 78元.jpg', 'images/6/2018/01/swjI1wRURP0lwIum1PXp10Rei8Lq0J.jpg', 1, 1515047353),
(385, 6, 6, 'nothumb.jpg', 'images/6/2018/01/Bq59qv4eEE08ee9DzAAOl9DOEEZa85.jpg', 1, 1515396574),
(386, 6, 6, 'nothumnb.jpg', 'images/6/2018/01/nDNdaXni8DmDADCncSaIdAMDUx7qYZ.jpg', 1, 1515397233),
(387, 6, 4, '蒸汽海鲜锅 78元.jpg', 'images/6/2018/01/i62Ri3R5m3s66rE23mQe383iw633mZ.jpg', 1, 1515978832),
(388, 6, 4, '海鲜毛血旺.jpg', 'images/6/2018/01/Z8AaL087S000cwXba80BoB0ZLxN8lN.jpg', 1, 1515978921),
(389, 6, 4, '海鲜毛血旺1.jpg', 'images/6/2018/01/ioFHX1BVS1QLlbdBff9usL2v7baYqb.jpg', 1, 1515979457),
(390, 6, 4, '流亭猪蹄 35元.jpg', 'images/6/2018/01/wsZ3n0O3HoBOHR4YNtUjhz4oO6B690.jpg', 1, 1515979595),
(391, 6, 4, '麻辣海鲜汇.jpg', 'images/6/2018/01/Qj111RKJkKLJ2bjJ6ZJKKbpaOKs1Pv.jpg', 1, 1515979690),
(392, 6, 4, '麻辣海鲜汇1.jpg', 'images/6/2018/01/AI3ycGOwhAZho0lp4ItIfaIytzSLg0.jpg', 1, 1515979815),
(393, 6, 4, '风干鸡 32元.jpg', 'images/6/2018/01/lZoUzvfNfg8223gnS2FRovqKsfzz2U.jpg', 1, 1515979872),
(394, 6, 4, '一品鱼锅.jpg', 'images/6/2018/01/ch5h3ycj7gJyaGzyGEj5G47pPoRY2h.jpg', 1, 1515980029),
(395, 6, 4, '一品鱼锅1.jpg', 'images/6/2018/01/KhOx3r9l0L2oFmXMF0l93ofC9UHfHm.jpg', 1, 1515980100),
(396, 6, 4, '一品鱼锅1.jpg', 'images/6/2018/01/GqVNls7tLvzn7vZq7T0l1IkI8718iq.jpg', 1, 1515980108),
(397, 6, 4, '1-1.jpg', 'images/6/2018/01/u5060VJFVJ0IKS00J8H5jH55nmhojK.jpg', 1, 1515980196),
(398, 6, 4, 'lurou.jpg', 'images/6/2018/01/jEGEN5n5eafxbgt5NnBx54GaTZ4ASg.jpg', 1, 1515980272),
(399, 6, 4, 'lurou.jpg', 'images/6/2018/01/gUkUUhIkC7qmI1H3w17P1lpY11oyww.jpg', 1, 1515980279),
(400, 6, 4, 'rechage.jpg', 'images/6/2018/01/b2grxGyBa2pFwyfY9zZSFzg2A9sgxY.jpg', 1, 1515992335),
(401, 6, 1, '1.png', 'images/6/2018/01/LgOnEv31vyXVV53o0vd3n5yG0Zx03G.png', 1, 1516064350),
(402, 6, 1, '2.png', 'images/6/2018/01/R0q0U6qhueQsXdH0sBudUXkeBvaZko.png', 1, 1516064698),
(403, 6, 1, '3.png', 'images/6/2018/01/x9FM08FxQ0fx8sU0Bf9B0z0CxfzW0w.png', 1, 1516064789),
(404, 6, 1, '4.png', 'images/6/2018/01/uHhHjd2hH581G86zgQ2H4h858465J6.png', 1, 1516065034),
(405, 6, 1, '5.png', 'images/6/2018/01/ba6HICAF9JiFH868FN8jchOpJCNRj6.png', 1, 1516065127),
(406, 6, 6, '微信图片_20180130194220.jpg', 'images/6/2018/01/ver3M13Uek7bl9XaaFaMB9AJu7FlB1.jpg', 1, 1517317659),
(407, 1, 1, 'banner-1.jpg', 'images/1/2018/02/PzKsTToO8XW77Yk7GijyGYa67vymjs.jpg', 1, 1518455845),
(408, 1, 1, 'a-1.jpg', 'images/1/2018/02/B8Vt28AH2zys6yhJD26sV89FhsvYHA.jpg', 1, 1518488468),
(409, 1, 1, 'p-1.jpg', 'images/1/2018/02/Nppscsd3K0DcNSgydpysPPAHCOCSEQ.jpg', 1, 1518488610),
(410, 1, 1, 'banner_buy.jpg', 'images/1/2018/02/BhdvybKZIwxcBzmvM0FivKD9dIVMgd.jpg', 1, 1518488801),
(411, 1, 1, 'p-1.jpg', 'images/1/2018/02/nPOrppYCx51gewRJNIbI2jEjYnC2ei.jpg', 1, 1518489628),
(412, 1, 1, 'banner_buy.jpg', 'images/1/2018/02/JsdLmmSSLXe5ZSXH5vM58ZIII83A3D.jpg', 1, 1518489706),
(413, 1, 1, 'boy.jpg', 'images/1/2018/02/r0NkugJ3RF4orFrZTjjzNft4Uk9kK9.jpg', 1, 1518602643),
(414, 1, 1, 'boy2.jpg', 'images/1/2018/02/zkAja8H4zw4bEjUW9b49433ZaF1449.jpg', 1, 1518602731),
(415, 1, 1, 'h1.jpg', 'images/1/2018/02/vDQN6KZ30aB6B556P4z6h50qC22k5K.jpg', 1, 1518602887),
(416, 1, 1, 'h2.jpg', 'images/1/2018/02/zc62ZBwB25wvW86eVB45VbBBw5s52B.jpg', 1, 1518602955),
(417, 1, 1, 'q1.jpg', 'images/1/2018/02/bGEPLATBxatVW1pV1W1jBjxlwvAyv1.jpg', 1, 1518603045),
(418, 1, 1, 'q2.jpg', 'images/1/2018/02/q8Hq6e70Su7cDzOooEHFSSI030Qj6d.jpg', 1, 1518603103),
(419, 1, 1, 'c-1.jpg', 'images/1/2018/02/GSl4P856QZJsqwzL55Q585LlkLplwZ.jpg', 1, 1518677142),
(420, 1, 1, 'c-3.jpg', 'images/1/2018/02/MirrC4hCIr4vnrrcZRCqDCaVcczcVD.jpg', 1, 1518677281),
(421, 1, 1, 'c1.png', 'images/1/2018/02/cVRykgJ7j7KrWRvzbVHUhVZVyvgV3k.png', 1, 1518801672),
(422, 1, 1, 'c2.png', 'images/1/2018/02/YpEeS7AI6j37J7X3377IZsABZIaJa9.png', 1, 1518801734),
(423, 1, 1, 'c3.png', 'images/1/2018/02/q90sR29Z1XAl62Rn9o9rPp2N5n9asm.png', 1, 1518802107),
(424, 1, 1, 'c4.png', 'images/1/2018/02/Qusi0farr2isfUsjR25QjZvffiO9A2.png', 1, 1518802139),
(425, 1, 1, 'c5.png', 'images/1/2018/02/nn1wNwLZ15NfFy1Ld11Nz3dD2D5WKF.png', 1, 1518802172),
(426, 1, 1, 'pro1.jpg', 'images/1/2018/02/b070wVnteebGWZzd0lgWBwG718T57T.jpg', 1, 1519183109),
(427, 1, 1, 'pro3.jpg', 'images/1/2018/02/vw2MlmLOgVVapK0GGMMoPpgaPnurKb.jpg', 1, 1519183305),
(428, 1, 1, 'pro2.jpg', 'images/1/2018/02/gTwY8k2z8A8w9ky3x3S2edVkk8wGVY.jpg', 1, 1519183334),
(429, 1, 1, '微信图片_20180221225636.png', 'images/1/2018/02/v7SxUXMPjMVAJU4m2xuBQT5Qvv2AqZ.png', 1, 1519304624),
(430, 1, 1, 'LOGO第10版(换位置).jpg', 'images/1/2018/03/qlsB26lkiiekW6KPlswggwWsWwWwKY.jpg', 1, 1519980419),
(431, 1, 1, '未标题-8.jpg', 'images/1/2018/03/VoZ661bbBSCV3Ee6PD88w844J8BSzo.jpg', 1, 1519991756),
(432, 1, 1, '日漫风.jpg', 'images/1/2018/03/dCR515lYlYoYSRz1v8rVvOvr3yeRZz.jpg', 1, 1520055785),
(433, 1, 1, 'haixian.jpg', 'images/1/2018/03/rwySy595655a9A0gqF5485QA9Mqp61.jpg', 1, 1520417104),
(434, 1, 1, 'icon1.png', 'images/1/2018/03/x8R74dR7b722B2C2B457cdC8NZ254Y.png', 1, 1520486094),
(435, 1, 1, 'icon1-sel.png', 'images/1/2018/03/YDhB9hz06ehAZggg6Nb68NM09KgN6k.png', 1, 1520486102),
(436, 1, 1, 'icon2.png', 'images/1/2018/03/D6gkRjlr4vlkl4vQlGXLVdrY446gGR.png', 1, 1520486175),
(437, 1, 1, 'icon2-sel.png', 'images/1/2018/03/YgvMciUMuZsgMmO1DMvXiCvgsI55Cc.png', 1, 1520486183),
(438, 1, 1, 'icon3.png', 'images/1/2018/03/uPPmcjJfzmcflLL2i8RB9ppC5RlCJl.png', 1, 1520486306),
(439, 1, 1, 'icon3-sel.png', 'images/1/2018/03/dBz1H400tY8Jb4hhblZtUy84Hz4O84.png', 1, 1520486315),
(440, 1, 1, '阿里旺旺图片20180309220650.jpg', 'images/1/2018/03/CtDKDjJepRgLrTxEetEleEjzhZjJIe.jpg', 1, 1520769562),
(441, 1, 1, '阿里旺旺图片20180123192850.jpg', 'images/1/2018/03/SOT0SQqctDebdn0JltDINl0DnHANJt.jpg', 1, 1520771939),
(442, 1, 1, '宠物.png', 'images/1/2018/03/yRv0YIx438d8qOXm0Ivqj8x3IX770R.png', 1, 1520833741),
(443, 1, 1, '商品详情页.jpg', 'images/1/2018/03/W6id27Z7dS5Kas77ADAs5AiaASVo2O.jpg', 1, 1520837755),
(444, 1, 1, '新背景.jpg', 'images/1/2018/03/XBDdD86IEM6tNZqimbD2EUeL4lbY6n.jpg', 1, 1520838282);

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_cache`
--

CREATE TABLE IF NOT EXISTS `ims_core_cache` (
  `key` varchar(50) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_core_cache`
--

INSERT INTO `ims_core_cache` (`key`, `value`) VALUES
('setting', 'a:6:{s:9:"copyright";a:24:{s:6:"status";s:1:"0";s:10:"verifycode";s:1:"0";s:6:"reason";s:0:"";s:8:"sitename";s:36:"羽月智能weshop2.0版分销商城";s:3:"url";s:7:"http://";s:8:"statcode";s:0:"";s:10:"footerleft";s:14:"Copyright 2017";s:11:"footerright";s:19:"All Rights Reserved";s:4:"icon";s:0:"";s:5:"flogo";s:0:"";s:6:"slides";s:216:"a:3:{i:0;s:58:"https://img.alicdn.com/tps/TB1pfG4IFXXXXc6XXXXXXXXXXXX.jpg";i:1;s:58:"https://img.alicdn.com/tps/TB1sXGYIFXXXXc5XpXXXXXXXXXX.jpg";i:2;s:58:"https://img.alicdn.com/tps/TB1h9xxIFXXXXbKXXXXXXXXXXXX.jpg";}";s:6:"notice";s:0:"";s:5:"blogo";s:0:"";s:8:"baidumap";a:2:{s:3:"lng";s:0:"";s:3:"lat";s:0:"";}s:7:"company";s:27:"山东省羽月智能科技";s:14:"companyprofile";s:0:"";s:7:"address";s:27:"山东省羽月智能科技";s:6:"person";s:0:"";s:5:"phone";s:12:"020-88888888";s:2:"qq";s:8:"88888888";s:5:"email";s:13:"888888@qq.com";s:8:"keywords";s:36:"羽月智能weshop2.0版分销商城";s:11:"description";s:36:"羽月智能weshop2.0版分销商城";s:12:"showhomepage";i:1;}s:8:"authmode";i:1;s:5:"close";a:2:{s:6:"status";s:1:"0";s:6:"reason";s:0:"";}s:8:"register";a:4:{s:4:"open";i:1;s:6:"verify";i:0;s:4:"code";i:1;s:7:"groupid";i:1;}s:18:"module_receive_ban";a:0:{}s:5:"basic";a:1:{s:8:"template";s:7:"default";}}'),
('checkupgrade:system', 'a:1:{s:10:"lastupdate";i:1520846628;}'),
('system_frame', 'a:5:{s:8:"platform";a:3:{i:0;a:2:{s:5:"title";s:12:"基本功能";s:5:"items";a:9:{i:0;a:5:{s:2:"id";s:1:"3";s:5:"title";s:12:"文字回复";s:3:"url";s:38:"./index.php?c=platform&a=reply&m=basic";s:15:"permission_name";s:20:"platform_reply_basic";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:46:"./index.php?c=platform&a=reply&do=post&m=basic";}}i:1;a:5:{s:2:"id";s:1:"4";s:5:"title";s:12:"图文回复";s:3:"url";s:37:"./index.php?c=platform&a=reply&m=news";s:15:"permission_name";s:19:"platform_reply_news";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:45:"./index.php?c=platform&a=reply&do=post&m=news";}}i:2;a:5:{s:2:"id";s:1:"5";s:5:"title";s:12:"音乐回复";s:3:"url";s:38:"./index.php?c=platform&a=reply&m=music";s:15:"permission_name";s:20:"platform_reply_music";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:46:"./index.php?c=platform&a=reply&do=post&m=music";}}i:3;a:5:{s:2:"id";s:1:"6";s:5:"title";s:12:"图片回复";s:3:"url";s:39:"./index.php?c=platform&a=reply&m=images";s:15:"permission_name";s:21:"platform_reply_images";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:47:"./index.php?c=platform&a=reply&do=post&m=images";}}i:4;a:5:{s:2:"id";s:1:"7";s:5:"title";s:12:"语音回复";s:3:"url";s:38:"./index.php?c=platform&a=reply&m=voice";s:15:"permission_name";s:20:"platform_reply_voice";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:46:"./index.php?c=platform&a=reply&do=post&m=voice";}}i:5;a:5:{s:2:"id";s:1:"8";s:5:"title";s:12:"视频回复";s:3:"url";s:38:"./index.php?c=platform&a=reply&m=video";s:15:"permission_name";s:20:"platform_reply_video";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:46:"./index.php?c=platform&a=reply&do=post&m=video";}}i:6;a:5:{s:2:"id";s:1:"9";s:5:"title";s:18:"微信卡券回复";s:3:"url";s:39:"./index.php?c=platform&a=reply&m=wxcard";s:15:"permission_name";s:21:"platform_reply_wxcard";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:47:"./index.php?c=platform&a=reply&do=post&m=wxcard";}}i:7;a:5:{s:2:"id";s:2:"10";s:5:"title";s:21:"自定义接口回复";s:3:"url";s:40:"./index.php?c=platform&a=reply&m=userapi";s:15:"permission_name";s:22:"platform_reply_userapi";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:48:"./index.php?c=platform&a=reply&do=post&m=userapi";}}i:8;a:4:{s:2:"id";s:2:"11";s:5:"title";s:12:"系统回复";s:3:"url";s:44:"./index.php?c=platform&a=special&do=display&";s:15:"permission_name";s:21:"platform_reply_system";}}}i:1;a:2:{s:5:"title";s:12:"高级功能";s:5:"items";a:6:{i:0;a:4:{s:2:"id";s:2:"13";s:5:"title";s:18:"常用服务接入";s:3:"url";s:43:"./index.php?c=platform&a=service&do=switch&";s:15:"permission_name";s:16:"platform_service";}i:1;a:4:{s:2:"id";s:2:"14";s:5:"title";s:15:"自定义菜单";s:3:"url";s:30:"./index.php?c=platform&a=menu&";s:15:"permission_name";s:13:"platform_menu";}i:2;a:4:{s:2:"id";s:2:"15";s:5:"title";s:18:"特殊消息回复";s:3:"url";s:44:"./index.php?c=platform&a=special&do=message&";s:15:"permission_name";s:16:"platform_special";}i:3;a:4:{s:2:"id";s:2:"16";s:5:"title";s:15:"二维码管理";s:3:"url";s:28:"./index.php?c=platform&a=qr&";s:15:"permission_name";s:11:"platform_qr";}i:4;a:4:{s:2:"id";s:2:"17";s:5:"title";s:15:"多客服接入";s:3:"url";s:39:"./index.php?c=platform&a=reply&m=custom";s:15:"permission_name";s:21:"platform_reply_custom";}i:5;a:4:{s:2:"id";s:2:"18";s:5:"title";s:18:"长链接二维码";s:3:"url";s:32:"./index.php?c=platform&a=url2qr&";s:15:"permission_name";s:15:"platform_url2qr";}}}i:2;a:2:{s:5:"title";s:12:"数据统计";s:5:"items";a:4:{i:0;a:4:{s:2:"id";s:2:"20";s:5:"title";s:12:"聊天记录";s:3:"url";s:41:"./index.php?c=platform&a=stat&do=history&";s:15:"permission_name";s:21:"platform_stat_history";}i:1;a:4:{s:2:"id";s:2:"21";s:5:"title";s:24:"回复规则使用情况";s:3:"url";s:38:"./index.php?c=platform&a=stat&do=rule&";s:15:"permission_name";s:18:"platform_stat_rule";}i:2;a:4:{s:2:"id";s:2:"22";s:5:"title";s:21:"关键字命中情况";s:3:"url";s:41:"./index.php?c=platform&a=stat&do=keyword&";s:15:"permission_name";s:21:"platform_stat_keyword";}i:3;a:4:{s:2:"id";s:2:"23";s:5:"title";s:6:"参数";s:3:"url";s:41:"./index.php?c=platform&a=stat&do=setting&";s:15:"permission_name";s:21:"platform_stat_setting";}}}}s:4:"site";a:3:{i:0;a:2:{s:5:"title";s:12:"微站管理";s:5:"items";a:3:{i:0;a:5:{s:2:"id";s:2:"26";s:5:"title";s:12:"站点管理";s:3:"url";s:38:"./index.php?c=site&a=multi&do=display&";s:15:"permission_name";s:18:"site_multi_display";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:35:"./index.php?c=site&a=multi&do=post&";}}i:1;a:4:{s:2:"id";s:2:"29";s:5:"title";s:12:"模板管理";s:3:"url";s:39:"./index.php?c=site&a=style&do=template&";s:15:"permission_name";s:19:"site_style_template";}i:2;a:4:{s:2:"id";s:2:"30";s:5:"title";s:18:"模块模板扩展";s:3:"url";s:37:"./index.php?c=site&a=style&do=module&";s:15:"permission_name";s:17:"site_style_module";}}}i:1;a:2:{s:5:"title";s:18:"特殊页面管理";s:5:"items";a:2:{i:0;a:4:{s:2:"id";s:2:"32";s:5:"title";s:12:"会员中心";s:3:"url";s:34:"./index.php?c=site&a=editor&do=uc&";s:15:"permission_name";s:14:"site_editor_uc";}i:1;a:5:{s:2:"id";s:2:"33";s:5:"title";s:12:"专题页面";s:3:"url";s:36:"./index.php?c=site&a=editor&do=page&";s:15:"permission_name";s:16:"site_editor_page";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:38:"./index.php?c=site&a=editor&do=design&";}}}}i:2;a:2:{s:5:"title";s:12:"功能组件";s:5:"items";a:2:{i:0;a:4:{s:2:"id";s:2:"35";s:5:"title";s:12:"分类设置";s:3:"url";s:30:"./index.php?c=site&a=category&";s:15:"permission_name";s:13:"site_category";}i:1;a:4:{s:2:"id";s:2:"36";s:5:"title";s:12:"文章管理";s:3:"url";s:29:"./index.php?c=site&a=article&";s:15:"permission_name";s:12:"site_article";}}}}s:2:"mc";a:9:{i:0;a:2:{s:5:"title";s:12:"粉丝管理";s:5:"items";a:2:{i:0;a:4:{s:2:"id";s:2:"39";s:5:"title";s:12:"粉丝分组";s:3:"url";s:28:"./index.php?c=mc&a=fangroup&";s:15:"permission_name";s:11:"mc_fangroup";}i:1;a:4:{s:2:"id";s:2:"40";s:5:"title";s:6:"粉丝";s:3:"url";s:24:"./index.php?c=mc&a=fans&";s:15:"permission_name";s:7:"mc_fans";}}}i:1;a:2:{s:5:"title";s:12:"会员中心";s:5:"items";a:3:{i:0;a:4:{s:2:"id";s:2:"42";s:5:"title";s:21:"会员中心关键字";s:3:"url";s:37:"./index.php?c=platform&a=cover&do=mc&";s:15:"permission_name";s:17:"platform_cover_mc";}i:1;a:5:{s:2:"id";s:2:"43";s:5:"title";s:6:"会员";s:3:"url";s:25:"./index.php?c=mc&a=member";s:15:"permission_name";s:9:"mc_member";s:6:"append";a:2:{s:5:"title";s:26:"<i class="fa fa-plus"></i>";s:3:"url";s:32:"./index.php?c=mc&a=member&do=add";}}i:2;a:4:{s:2:"id";s:2:"44";s:5:"title";s:9:"会员组";s:3:"url";s:25:"./index.php?c=mc&a=group&";s:15:"permission_name";s:8:"mc_group";}}}i:2;a:2:{s:5:"title";s:15:"会员卡管理";s:5:"items";a:4:{i:0;a:4:{s:2:"id";s:2:"46";s:5:"title";s:18:"会员卡关键字";s:3:"url";s:39:"./index.php?c=platform&a=cover&do=card&";s:15:"permission_name";s:19:"platform_cover_card";}i:1;a:4:{s:2:"id";s:2:"47";s:5:"title";s:15:"会员卡管理";s:3:"url";s:33:"./index.php?c=mc&a=card&do=manage";s:15:"permission_name";s:14:"mc_card_manage";}i:2;a:4:{s:2:"id";s:2:"48";s:5:"title";s:15:"会员卡设置";s:3:"url";s:33:"./index.php?c=mc&a=card&do=editor";s:15:"permission_name";s:14:"mc_card_editor";}i:3;a:4:{s:2:"id";s:2:"49";s:5:"title";s:21:"会员卡其他功能";s:3:"url";s:32:"./index.php?c=mc&a=card&do=other";s:15:"permission_name";s:13:"mc_card_other";}}}i:3;a:2:{s:5:"title";s:12:"积分兑换";s:5:"items";a:5:{i:0;a:4:{s:2:"id";s:2:"51";s:5:"title";s:9:"折扣券";s:3:"url";s:32:"./index.php?c=activity&a=coupon&";s:15:"permission_name";s:23:"activity_coupon_display";}i:1;a:4:{s:2:"id";s:2:"52";s:5:"title";s:15:"折扣券核销";s:3:"url";s:59:"./index.php?c=activity&a=consume&do=display&type=1&status=2";s:15:"permission_name";s:23:"activity_consume_coupon";}i:2;a:4:{s:2:"id";s:2:"53";s:5:"title";s:9:"代金券";s:3:"url";s:30:"./index.php?c=activity&a=token";s:15:"permission_name";s:22:"activity_token_display";}i:3;a:4:{s:2:"id";s:2:"54";s:5:"title";s:15:"代金券核销";s:3:"url";s:59:"./index.php?c=activity&a=consume&do=display&type=2&status=2";s:15:"permission_name";s:22:"activity_consume_token";}i:4;a:4:{s:2:"id";s:2:"55";s:5:"title";s:12:"真实物品";s:3:"url";s:30:"./index.php?c=activity&a=goods";s:15:"permission_name";s:22:"activity_goods_display";}}}i:4;a:2:{s:5:"title";s:19:"微信素材&群发";s:5:"items";a:2:{i:0;a:4:{s:2:"id";s:2:"57";s:5:"title";s:13:"素材&群发";s:3:"url";s:32:"./index.php?c=material&a=display";s:15:"permission_name";s:16:"material_display";}i:1;a:4:{s:2:"id";s:2:"58";s:5:"title";s:12:"定时群发";s:3:"url";s:29:"./index.php?c=material&a=mass";s:15:"permission_name";s:13:"material_mass";}}}i:5;a:2:{s:5:"title";s:18:"微信卡券管理";s:5:"items";a:3:{i:0;a:4:{s:2:"id";s:2:"60";s:5:"title";s:12:"卡券列表";s:3:"url";s:35:"./index.php?c=wechat&a=card&do=list";s:15:"permission_name";s:16:"wechat_card_list";}i:1;a:4:{s:2:"id";s:2:"61";s:5:"title";s:12:"卡券核销";s:3:"url";s:30:"./index.php?c=wechat&a=consume";s:15:"permission_name";s:14:"wechat_consume";}i:2;a:4:{s:2:"id";s:2:"62";s:5:"title";s:15:"测试白名单";s:3:"url";s:36:"./index.php?c=wechat&a=white&do=list";s:15:"permission_name";s:17:"wechat_white_list";}}}i:6;a:2:{s:5:"title";s:12:"门店管理";s:5:"items";a:2:{i:0;a:4:{s:2:"id";s:2:"64";s:5:"title";s:12:"门店列表";s:3:"url";s:30:"./index.php?c=activity&a=store";s:15:"permission_name";s:19:"activity_store_list";}i:1;a:4:{s:2:"id";s:2:"65";s:5:"title";s:12:"店员列表";s:3:"url";s:30:"./index.php?c=activity&a=clerk";s:15:"permission_name";s:19:"activity_clerk_list";}}}i:7;a:2:{s:5:"title";s:9:"收银台";s:5:"items";a:2:{i:0;a:4:{s:2:"id";s:2:"67";s:5:"title";s:18:"微信刷卡收款";s:3:"url";s:40:"./index.php?c=paycenter&a=wxmicro&do=pay";s:15:"permission_name";s:21:"paycenter_wxmicro_pay";}i:1;a:4:{s:2:"id";s:2:"68";s:5:"title";s:18:"收银台关键字";s:3:"url";s:39:"./index.php?c=platform&a=cover&do=clerk";s:15:"permission_name";s:15:"paycenter_clerk";}}}i:8;a:2:{s:5:"title";s:12:"统计中心";s:5:"items";a:5:{i:0;a:4:{s:2:"id";s:2:"70";s:5:"title";s:18:"会员积分统计";s:3:"url";s:28:"./index.php?c=stat&a=credit1";s:15:"permission_name";s:12:"stat_credit1";}i:1;a:4:{s:2:"id";s:2:"71";s:5:"title";s:18:"会员余额统计";s:3:"url";s:28:"./index.php?c=stat&a=credit2";s:15:"permission_name";s:12:"stat_credit2";}i:2;a:4:{s:2:"id";s:2:"72";s:5:"title";s:24:"会员现金消费统计";s:3:"url";s:25:"./index.php?c=stat&a=cash";s:15:"permission_name";s:9:"stat_cash";}i:3;a:4:{s:2:"id";s:2:"73";s:5:"title";s:15:"会员卡统计";s:3:"url";s:25:"./index.php?c=stat&a=card";s:15:"permission_name";s:9:"stat_card";}i:4;a:4:{s:2:"id";s:2:"74";s:5:"title";s:21:"收银台收款统计";s:3:"url";s:30:"./index.php?c=stat&a=paycenter";s:15:"permission_name";s:14:"stat_paycenter";}}}}s:7:"setting";a:3:{i:0;a:2:{s:5:"title";s:15:"公众号选项";s:5:"items";a:7:{i:0;a:4:{s:2:"id";s:2:"77";s:5:"title";s:12:"支付参数";s:3:"url";s:32:"./index.php?c=profile&a=payment&";s:15:"permission_name";s:15:"profile_payment";}i:1;a:4:{s:2:"id";s:2:"78";s:5:"title";s:19:"借用 oAuth 权限";s:3:"url";s:37:"./index.php?c=mc&a=passport&do=oauth&";s:15:"permission_name";s:17:"mc_passport_oauth";}i:2;a:4:{s:2:"id";s:2:"79";s:5:"title";s:22:"借用 JS 分享权限";s:3:"url";s:31:"./index.php?c=profile&a=jsauth&";s:15:"permission_name";s:14:"profile_jsauth";}i:3;a:4:{s:2:"id";s:2:"80";s:5:"title";s:18:"会员字段管理";s:3:"url";s:25:"./index.php?c=mc&a=fields";s:15:"permission_name";s:9:"mc_fields";}i:4;a:4:{s:2:"id";s:2:"81";s:5:"title";s:18:"微信通知设置";s:3:"url";s:28:"./index.php?c=mc&a=tplnotice";s:15:"permission_name";s:12:"mc_tplnotice";}i:5;a:4:{s:2:"id";s:2:"82";s:5:"title";s:21:"工作台菜单设置";s:3:"url";s:32:"./index.php?c=profile&a=deskmenu";s:15:"permission_name";s:16:"profile_deskmenu";}i:6;a:4:{s:2:"id";s:2:"83";s:5:"title";s:18:"会员扩展功能";s:3:"url";s:25:"./index.php?c=mc&a=plugin";s:15:"permission_name";s:9:"mc_plugin";}}}i:1;a:2:{s:5:"title";s:21:"会员及粉丝选项";s:5:"items";a:5:{i:0;a:4:{s:2:"id";s:2:"85";s:5:"title";s:12:"积分设置";s:3:"url";s:26:"./index.php?c=mc&a=credit&";s:15:"permission_name";s:9:"mc_credit";}i:1;a:4:{s:2:"id";s:2:"86";s:5:"title";s:12:"注册设置";s:3:"url";s:40:"./index.php?c=mc&a=passport&do=passport&";s:15:"permission_name";s:20:"mc_passport_passport";}i:2;a:4:{s:2:"id";s:2:"87";s:5:"title";s:18:"粉丝同步设置";s:3:"url";s:36:"./index.php?c=mc&a=passport&do=sync&";s:15:"permission_name";s:16:"mc_passport_sync";}i:3;a:4:{s:2:"id";s:2:"88";s:5:"title";s:14:"UC站点整合";s:3:"url";s:22:"./index.php?c=mc&a=uc&";s:15:"permission_name";s:5:"mc_uc";}i:4;a:4:{s:2:"id";s:2:"89";s:5:"title";s:18:"邮件通知参数";s:3:"url";s:30:"./index.php?c=profile&a=notify";s:15:"permission_name";s:14:"profile_notify";}}}i:2;a:1:{s:5:"title";s:18:"其他功能选项";}}s:3:"ext";a:1:{i:0;a:2:{s:5:"title";s:6:"管理";s:5:"items";a:1:{i:0;a:4:{s:2:"id";s:2:"93";s:5:"title";s:18:"扩展功能管理";s:3:"url";s:31:"./index.php?c=profile&a=module&";s:15:"permission_name";s:14:"profile_module";}}}}}'),
('module_receive_enable', 'a:13:{s:5:"image";a:1:{i:0;s:11:"ewei_shopv2";}s:5:"voice";a:1:{i:0;s:11:"ewei_shopv2";}s:5:"video";a:1:{i:0;s:11:"ewei_shopv2";}s:10:"shortvideo";a:1:{i:0;s:11:"ewei_shopv2";}s:8:"location";a:1:{i:0;s:11:"ewei_shopv2";}s:4:"link";a:1:{i:0;s:11:"ewei_shopv2";}s:9:"subscribe";a:1:{i:0;s:11:"ewei_shopv2";}s:11:"unsubscribe";a:1:{i:0;s:11:"ewei_shopv2";}s:2:"qr";a:1:{i:0;s:11:"ewei_shopv2";}s:5:"trace";a:1:{i:0;s:11:"ewei_shopv2";}s:5:"click";a:1:{i:0;s:11:"ewei_shopv2";}s:4:"view";a:1:{i:0;s:11:"ewei_shopv2";}s:14:"merchant_order";a:1:{i:0;s:11:"ewei_shopv2";}}'),
('unimodules:1:', 'a:14:{s:5:"basic";a:19:{s:3:"mid";s:1:"1";s:4:"name";s:5:"basic";s:4:"type";s:6:"system";s:5:"title";s:18:"基本文字回复";s:7:"version";s:3:"1.0";s:7:"ability";s:24:"和您进行简单对话";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:4:"news";a:19:{s:3:"mid";s:1:"2";s:4:"name";s:4:"news";s:4:"type";s:6:"system";s:5:"title";s:24:"基本混合图文回复";s:7:"version";s:3:"1.0";s:7:"ability";s:33:"为你提供生动的图文资讯";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"music";a:19:{s:3:"mid";s:1:"3";s:4:"name";s:5:"music";s:4:"type";s:6:"system";s:5:"title";s:18:"基本音乐回复";s:7:"version";s:3:"1.0";s:7:"ability";s:39:"提供语音、音乐等音频类回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:7:"userapi";a:19:{s:3:"mid";s:1:"4";s:4:"name";s:7:"userapi";s:4:"type";s:6:"system";s:5:"title";s:21:"自定义接口回复";s:7:"version";s:3:"1.1";s:7:"ability";s:33:"更方便的第三方接口设置";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:8:"recharge";a:19:{s:3:"mid";s:1:"5";s:4:"name";s:8:"recharge";s:4:"type";s:6:"system";s:5:"title";s:24:"会员中心充值模块";s:7:"version";s:3:"1.0";s:7:"ability";s:24:"提供会员充值功能";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"custom";a:19:{s:3:"mid";s:1:"6";s:4:"name";s:6:"custom";s:4:"type";s:6:"system";s:5:"title";s:15:"多客服转接";s:7:"version";s:5:"1.0.0";s:7:"ability";s:36:"用来接入腾讯的多客服系统";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";a:0:{}s:7:"handles";a:6:{i:0;s:5:"image";i:1;s:5:"voice";i:2;s:5:"video";i:3;s:8:"location";i:4;s:4:"link";i:5;s:4:"text";}s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"images";a:19:{s:3:"mid";s:1:"7";s:4:"name";s:6:"images";s:4:"type";s:6:"system";s:5:"title";s:18:"基本图片回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供图片回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"video";a:19:{s:3:"mid";s:1:"8";s:4:"name";s:5:"video";s:4:"type";s:6:"system";s:5:"title";s:18:"基本视频回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供图片回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"voice";a:19:{s:3:"mid";s:1:"9";s:4:"name";s:5:"voice";s:4:"type";s:6:"system";s:5:"title";s:18:"基本语音回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供语音回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"chats";a:19:{s:3:"mid";s:2:"10";s:4:"name";s:5:"chats";s:4:"type";s:6:"system";s:5:"title";s:18:"发送客服消息";s:7:"version";s:3:"1.0";s:7:"ability";s:77:"公众号可以在粉丝最后发送消息的48小时内无限制发送消息";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"wxcard";a:19:{s:3:"mid";s:2:"11";s:4:"name";s:6:"wxcard";s:4:"type";s:6:"system";s:5:"title";s:18:"微信卡券回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"微信卡券回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:9:"paycenter";a:19:{s:3:"mid";s:2:"12";s:4:"name";s:9:"paycenter";s:4:"type";s:6:"system";s:5:"title";s:9:"收银台";s:7:"version";s:3:"1.0";s:7:"ability";s:9:"收银台";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:11:"ewei_shopv2";a:19:{s:3:"mid";s:2:"15";s:4:"name";s:11:"ewei_shopv2";s:4:"type";s:8:"business";s:5:"title";s:12:"羽月weshop";s:7:"version";s:6:"2.10.3";s:7:"ability";s:87:"羽月weshop(分销),多用户分权，淘宝商品一键转换，多种插件支持。";s:6:"author";s:18:"羽月智能科技";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";a:14:{i:0;s:4:"text";i:1;s:5:"image";i:2;s:5:"voice";i:3;s:5:"video";i:4;s:10:"shortvideo";i:5;s:8:"location";i:6;s:4:"link";i:7;s:9:"subscribe";i:8;s:11:"unsubscribe";i:9;s:2:"qr";i:10;s:5:"trace";i:11;s:5:"click";i:12;s:4:"view";i:13;s:14:"merchant_order";}s:7:"handles";a:12:{i:0;s:4:"text";i:1;s:5:"image";i:2;s:5:"voice";i:3;s:5:"video";i:4;s:10:"shortvideo";i:5;s:8:"location";i:6;s:4:"link";i:7;s:9:"subscribe";i:8;s:2:"qr";i:9;s:5:"trace";i:10;s:5:"click";i:11;s:14:"merchant_order";}s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:6:"a:0:{}";s:7:"enabled";s:1:"1";s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:4:"core";a:5:{s:5:"title";s:24:"系统事件处理模块";s:4:"name";s:4:"core";s:8:"issystem";i:1;s:7:"enabled";i:1;s:9:"isdisplay";i:0;}}'),
('unimodules:1:1', 'a:14:{s:5:"basic";a:19:{s:3:"mid";s:1:"1";s:4:"name";s:5:"basic";s:4:"type";s:6:"system";s:5:"title";s:18:"基本文字回复";s:7:"version";s:3:"1.0";s:7:"ability";s:24:"和您进行简单对话";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:4:"news";a:19:{s:3:"mid";s:1:"2";s:4:"name";s:4:"news";s:4:"type";s:6:"system";s:5:"title";s:24:"基本混合图文回复";s:7:"version";s:3:"1.0";s:7:"ability";s:33:"为你提供生动的图文资讯";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"music";a:19:{s:3:"mid";s:1:"3";s:4:"name";s:5:"music";s:4:"type";s:6:"system";s:5:"title";s:18:"基本音乐回复";s:7:"version";s:3:"1.0";s:7:"ability";s:39:"提供语音、音乐等音频类回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:7:"userapi";a:19:{s:3:"mid";s:1:"4";s:4:"name";s:7:"userapi";s:4:"type";s:6:"system";s:5:"title";s:21:"自定义接口回复";s:7:"version";s:3:"1.1";s:7:"ability";s:33:"更方便的第三方接口设置";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:8:"recharge";a:19:{s:3:"mid";s:1:"5";s:4:"name";s:8:"recharge";s:4:"type";s:6:"system";s:5:"title";s:24:"会员中心充值模块";s:7:"version";s:3:"1.0";s:7:"ability";s:24:"提供会员充值功能";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"custom";a:19:{s:3:"mid";s:1:"6";s:4:"name";s:6:"custom";s:4:"type";s:6:"system";s:5:"title";s:15:"多客服转接";s:7:"version";s:5:"1.0.0";s:7:"ability";s:36:"用来接入腾讯的多客服系统";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";a:0:{}s:7:"handles";a:6:{i:0;s:5:"image";i:1;s:5:"voice";i:2;s:5:"video";i:3;s:8:"location";i:4;s:4:"link";i:5;s:4:"text";}s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"images";a:19:{s:3:"mid";s:1:"7";s:4:"name";s:6:"images";s:4:"type";s:6:"system";s:5:"title";s:18:"基本图片回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供图片回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"video";a:19:{s:3:"mid";s:1:"8";s:4:"name";s:5:"video";s:4:"type";s:6:"system";s:5:"title";s:18:"基本视频回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供图片回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"voice";a:19:{s:3:"mid";s:1:"9";s:4:"name";s:5:"voice";s:4:"type";s:6:"system";s:5:"title";s:18:"基本语音回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供语音回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"chats";a:19:{s:3:"mid";s:2:"10";s:4:"name";s:5:"chats";s:4:"type";s:6:"system";s:5:"title";s:18:"发送客服消息";s:7:"version";s:3:"1.0";s:7:"ability";s:77:"公众号可以在粉丝最后发送消息的48小时内无限制发送消息";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"wxcard";a:19:{s:3:"mid";s:2:"11";s:4:"name";s:6:"wxcard";s:4:"type";s:6:"system";s:5:"title";s:18:"微信卡券回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"微信卡券回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:9:"paycenter";a:19:{s:3:"mid";s:2:"12";s:4:"name";s:9:"paycenter";s:4:"type";s:6:"system";s:5:"title";s:9:"收银台";s:7:"version";s:3:"1.0";s:7:"ability";s:9:"收银台";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:11:"ewei_shopv2";a:19:{s:3:"mid";s:2:"15";s:4:"name";s:11:"ewei_shopv2";s:4:"type";s:8:"business";s:5:"title";s:12:"羽月weshop";s:7:"version";s:6:"2.10.3";s:7:"ability";s:87:"羽月weshop(分销),多用户分权，淘宝商品一键转换，多种插件支持。";s:6:"author";s:18:"羽月智能科技";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";a:14:{i:0;s:4:"text";i:1;s:5:"image";i:2;s:5:"voice";i:3;s:5:"video";i:4;s:10:"shortvideo";i:5;s:8:"location";i:6;s:4:"link";i:7;s:9:"subscribe";i:8;s:11:"unsubscribe";i:9;s:2:"qr";i:10;s:5:"trace";i:11;s:5:"click";i:12;s:4:"view";i:13;s:14:"merchant_order";}s:7:"handles";a:12:{i:0;s:4:"text";i:1;s:5:"image";i:2;s:5:"voice";i:3;s:5:"video";i:4;s:10:"shortvideo";i:5;s:8:"location";i:6;s:4:"link";i:7;s:9:"subscribe";i:8;s:2:"qr";i:9;s:5:"trace";i:10;s:5:"click";i:11;s:14:"merchant_order";}s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:6:"a:0:{}";s:7:"enabled";s:1:"1";s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:4:"core";a:5:{s:5:"title";s:24:"系统事件处理模块";s:4:"name";s:4:"core";s:8:"issystem";i:1;s:7:"enabled";i:1;s:9:"isdisplay";i:0;}}'),
('userbasefields', 'a:44:{s:7:"uniacid";s:17:"同一公众号id";s:7:"groupid";s:8:"分组id";s:7:"credit1";s:6:"积分";s:7:"credit2";s:6:"余额";s:7:"credit3";s:19:"预留积分类型3";s:7:"credit4";s:19:"预留积分类型4";s:7:"credit5";s:19:"预留积分类型5";s:7:"credit6";s:19:"预留积分类型6";s:10:"createtime";s:12:"加入时间";s:6:"mobile";s:12:"手机号码";s:5:"email";s:12:"电子邮箱";s:8:"realname";s:12:"真实姓名";s:8:"nickname";s:6:"昵称";s:6:"avatar";s:6:"头像";s:2:"qq";s:5:"QQ号";s:6:"gender";s:6:"性别";s:5:"birth";s:6:"生日";s:13:"constellation";s:6:"星座";s:6:"zodiac";s:6:"生肖";s:9:"telephone";s:12:"固定电话";s:6:"idcard";s:12:"证件号码";s:9:"studentid";s:6:"学号";s:5:"grade";s:6:"班级";s:7:"address";s:6:"地址";s:7:"zipcode";s:6:"邮编";s:11:"nationality";s:6:"国籍";s:6:"reside";s:9:"居住地";s:14:"graduateschool";s:12:"毕业学校";s:7:"company";s:6:"公司";s:9:"education";s:6:"学历";s:10:"occupation";s:6:"职业";s:8:"position";s:6:"职位";s:7:"revenue";s:9:"年收入";s:15:"affectivestatus";s:12:"情感状态";s:10:"lookingfor";s:13:" 交友目的";s:9:"bloodtype";s:6:"血型";s:6:"height";s:6:"身高";s:6:"weight";s:6:"体重";s:6:"alipay";s:15:"支付宝帐号";s:3:"msn";s:3:"MSN";s:6:"taobao";s:12:"阿里旺旺";s:4:"site";s:6:"主页";s:3:"bio";s:12:"自我介绍";s:8:"interest";s:12:"兴趣爱好";}'),
('uniaccount:1', 'a:28:{s:4:"acid";s:1:"1";s:7:"uniacid";s:1:"1";s:5:"token";s:32:"omJNpZEhZeHj1ZxFECKkP48B5VFbk1HP";s:12:"access_token";s:0:"";s:14:"encodingaeskey";s:0:"";s:5:"level";s:1:"4";s:4:"name";s:9:"画个我";s:7:"account";s:0:"";s:8:"original";s:0:"";s:9:"signature";s:0:"";s:7:"country";s:0:"";s:8:"province";s:0:"";s:4:"city";s:0:"";s:8:"username";s:0:"";s:8:"password";s:0:"";s:10:"lastupdate";s:1:"0";s:3:"key";s:18:"wx1223d08ee7dcb407";s:6:"secret";s:32:"f307cac71d3faee7578b80819583b8e0";s:7:"styleid";s:1:"1";s:12:"subscribeurl";s:0:"";s:18:"auth_refresh_token";s:0:"";s:12:"default_acid";s:1:"1";s:4:"type";s:1:"1";s:3:"uid";N;s:9:"starttime";N;s:7:"endtime";N;s:6:"groups";a:1:{i:1;a:5:{s:7:"groupid";s:1:"1";s:7:"uniacid";s:1:"1";s:5:"title";s:15:"默认会员组";s:6:"credit";s:1:"0";s:9:"isdefault";s:1:"1";}}s:10:"grouplevel";s:1:"0";}'),
('ewei_shop_fc7363d7a42e85fde52ad752308d9a0d', 'a:5:{s:2:"id";s:2:"12";s:7:"uniacid";s:1:"6";s:4:"sets";s:1806:"a:6:{s:5:"wxapp";a:7:{s:4:"name";s:18:"青岛海鲜锅贴";s:4:"logo";s:0:"";s:7:"account";s:0:"";s:8:"original";s:0:"";s:5:"AppId";s:18:"wx1faed05e0cba8892";s:9:"AppSecret";s:32:"9c58e73c3f6cf18f9fc03a3266a2e180";s:7:"version";s:3:"1.0";}s:4:"shop";a:22:{s:4:"name";s:18:"青岛海鲜锅贴";s:4:"logo";s:0:"";s:11:"description";s:0:"";s:3:"img";s:0:"";s:7:"signimg";s:0:"";s:5:"uc_bg";s:51:"images/6/2017/11/bdWS3x1dmGvAVAxTrZ3z0Xd3VgNrmd.jpg";s:10:"contact_bg";s:51:"images/6/2017/11/Pb87T63zoqaEjA7CO599eOoZ3I75Ci.jpg";s:7:"getinfo";s:1:"1";s:7:"saleout";s:0:"";s:7:"loading";s:0:"";s:7:"diycode";s:0:"";s:6:"funbar";s:1:"0";s:9:"ordertype";i:0;s:7:"webtype";i:1;s:2:"qq";s:0:"";s:7:"address";s:0:"";s:5:"phone";s:12:"0546-8795956";s:7:"nothumb";s:51:"images/6/2018/01/nDNdaXni8DmDADCncSaIdAMDUx7qYZ.jpg";s:9:"levelname";s:0:"";s:8:"levelurl";s:0:"";s:9:"leveltype";i:0;s:11:"recharge_bg";s:51:"images/6/2018/01/ver3M13Uek7bl9XaaFaMB9AJu7FlB1.jpg";}s:3:"pay";a:12:{s:9:"weixin_id";i:2;s:6:"weixin";i:1;s:10:"weixin_sub";i:0;s:10:"weixin_jie";i:0;s:14:"weixin_jie_sub";i:0;s:6:"alipay";i:0;s:6:"credit";i:1;s:4:"cash";i:0;s:11:"offline_pay";i:0;s:10:"app_wechat";i:0;s:10:"app_alipay";i:0;s:7:"paytype";a:3:{s:10:"commission";s:1:"0";s:8:"withdraw";s:1:"0";s:7:"redpack";s:1:"0";}}s:7:"contact";a:5:{s:5:"phone";s:12:"0546-8795956";s:8:"province";s:15:"请选择省份";s:4:"city";s:15:"请选择城市";s:7:"address";s:0:"";s:2:"qq";s:0:"";}s:7:"printer";a:9:{s:13:"order_printer";s:1:"1";s:14:"order_template";i:1;s:13:"printer_merch";i:0;s:9:"ordertype";s:1:"2";s:11:"printer_pay";i:1;s:16:"printer_recharge";i:1;s:12:"mem_fontsize";i:16;s:9:"mem_width";i:238;s:15:"printer_offline";i:1;}s:6:"member";a:4:{s:8:"levelurl";s:0:"";s:15:"bind_old_member";i:1;s:9:"leveltype";i:0;s:9:"levelname";s:0:"";}}";s:7:"plugins";s:3072:"a:3:{s:7:"diyform";a:6:{s:17:"user_diyform_open";s:1:"0";s:12:"user_diyform";s:1:"0";s:23:"commission_diyform_open";s:1:"0";s:18:"commission_diyform";s:1:"0";s:18:"order_diyform_open";s:1:"1";s:13:"order_diyform";s:1:"7";}s:10:"commission";a:59:{s:5:"level";s:1:"3";s:7:"selfbuy";s:1:"1";s:12:"become_child";s:1:"0";s:6:"become";s:1:"3";s:17:"become_ordercount";s:1:"1";s:17:"become_moneycount";s:3:"128";s:12:"become_check";s:1:"1";s:12:"become_order";s:1:"0";s:13:"open_protocol";s:1:"0";s:10:"become_reg";s:1:"1";s:17:"no_commission_url";s:0:"";s:10:"cashcredit";i:1;s:8:"withdraw";s:1:"1";s:14:"commissiontype";s:1:"2";s:14:"withdrawcharge";s:0:"";s:13:"withdrawbegin";d:0;s:11:"withdrawend";d:0;s:10:"settledays";s:0:"";s:8:"levelurl";s:0:"";s:9:"leveltype";s:1:"0";s:11:"qrcodeshare";s:1:"0";s:9:"codeShare";s:1:"1";s:15:"openorderdetail";s:1:"0";s:14:"openorderbuyer";s:1:"0";s:13:"closed_qrcode";s:1:"0";s:6:"qrcode";s:1:"0";s:12:"qrcode_title";s:0:"";s:14:"qrcode_content";s:0:"";s:13:"qrcode_remark";s:0:"";s:15:"register_bottom";s:1:"0";s:22:"register_bottom_title1";s:0:"";s:24:"register_bottom_content1";s:0:"";s:22:"register_bottom_title2";s:0:"";s:24:"register_bottom_content2";s:0:"";s:22:"register_bottom_title3";s:0:"";s:24:"register_bottom_content3";s:0:"";s:22:"register_bottom_remark";s:0:"";s:23:"register_bottom_content";s:0:"";s:11:"closemyshop";s:1:"0";s:12:"select_goods";s:1:"0";s:5:"style";s:7:"default";s:5:"regbg";s:0:"";s:10:"applytitle";s:0:"";s:12:"applycontent";s:0:"";s:10:"cashweixin";i:0;s:9:"cashother";i:0;s:10:"cashalipay";i:0;s:8:"cashcard";i:0;s:14:"become_goodsid";i:0;s:5:"texts";a:26:{s:5:"agent";s:9:"代言人";s:4:"shop";s:6:"小店";s:6:"myshop";s:12:"我的小店";s:6:"center";s:12:"分销中心";s:6:"become";s:15:"成为分销商";s:8:"withdraw";s:6:"提现";s:10:"commission";s:6:"佣金";s:11:"commission1";s:12:"分销佣金";s:16:"commission_total";s:12:"累计佣金";s:13:"commission_ok";s:15:"可提现佣金";s:16:"commission_apply";s:15:"已申请佣金";s:16:"commission_check";s:15:"待打款佣金";s:15:"commission_lock";s:15:"未结算佣金";s:15:"commission_wait";s:15:"待收货佣金";s:15:"commission_fail";s:12:"无效佣金";s:14:"commission_pay";s:18:"成功提现佣金";s:17:"commission_charge";s:21:"扣除个人所得税";s:17:"commission_detail";s:12:"佣金明细";s:5:"order";s:12:"佣金明细";s:4:"down";s:6:"下线";s:6:"mydown";s:12:"我的下线";s:2:"c1";s:12:"一代下级";s:2:"c2";s:12:"二代下级";s:2:"c3";s:12:"三代下级";s:4:"yuan";s:3:"元";s:5:"icode";s:9:"邀请码";}s:9:"levelname";s:12:"默认等级";s:11:"commission1";s:1:"5";s:11:"commission2";s:1:"3";s:11:"commission3";s:1:"2";s:6:"mempay";i:1;s:16:"check_cashcredit";i:0;s:10:"offlinePay";i:1;s:10:"mempay_com";i:0;s:14:"offlinePay_com";i:1;}s:4:"sale";a:1:{s:9:"recharges";s:224:"a:4:{i:0;a:2:{s:6:"enough";s:3:"800";s:4:"give";s:2:"80";}i:1;a:2:{s:6:"enough";s:4:"1500";s:4:"give";s:3:"180";}i:2;a:2:{s:6:"enough";s:4:"3000";s:4:"give";s:3:"420";}i:3;a:2:{s:6:"enough";s:4:"5000";s:4:"give";s:3:"800";}}";}}";s:3:"sec";s:338:"a:3:{s:10:"app_wechat";a:5:{s:5:"appid";s:0:"";s:9:"appsecret";s:0:"";s:9:"merchname";s:0:"";s:7:"merchid";s:0:"";s:6:"apikey";s:0:"";}s:10:"alipay_pay";a:4:{s:7:"partner";s:0:"";s:12:"account_name";s:0:"";s:5:"email";s:0:"";s:3:"key";s:0:"";}s:10:"app_alipay";a:3:{s:10:"public_key";s:0:"";s:11:"private_key";s:0:"";s:5:"appid";s:0:"";}}";}'),
('ewei_shop_46d6600d2ebf7065b95b3682e51654da', 'a:9:{s:5:"wxapp";a:7:{s:4:"name";s:18:"青岛海鲜锅贴";s:4:"logo";s:0:"";s:7:"account";s:0:"";s:8:"original";s:0:"";s:5:"AppId";s:18:"wx1faed05e0cba8892";s:9:"AppSecret";s:32:"9c58e73c3f6cf18f9fc03a3266a2e180";s:7:"version";s:3:"1.0";}s:4:"shop";a:22:{s:4:"name";s:18:"青岛海鲜锅贴";s:4:"logo";s:0:"";s:11:"description";s:0:"";s:3:"img";s:0:"";s:7:"signimg";s:0:"";s:5:"uc_bg";s:51:"images/6/2017/11/bdWS3x1dmGvAVAxTrZ3z0Xd3VgNrmd.jpg";s:10:"contact_bg";s:51:"images/6/2017/11/Pb87T63zoqaEjA7CO599eOoZ3I75Ci.jpg";s:7:"getinfo";s:1:"1";s:7:"saleout";s:0:"";s:7:"loading";s:0:"";s:7:"diycode";s:0:"";s:6:"funbar";s:1:"0";s:9:"ordertype";i:0;s:7:"webtype";i:1;s:2:"qq";s:0:"";s:7:"address";s:0:"";s:5:"phone";s:12:"0546-8795956";s:7:"nothumb";s:51:"images/6/2018/01/nDNdaXni8DmDADCncSaIdAMDUx7qYZ.jpg";s:9:"levelname";s:0:"";s:8:"levelurl";s:0:"";s:9:"leveltype";i:0;s:11:"recharge_bg";s:51:"images/6/2018/01/ver3M13Uek7bl9XaaFaMB9AJu7FlB1.jpg";}s:3:"pay";a:12:{s:9:"weixin_id";i:2;s:6:"weixin";i:1;s:10:"weixin_sub";i:0;s:10:"weixin_jie";i:0;s:14:"weixin_jie_sub";i:0;s:6:"alipay";i:0;s:6:"credit";i:1;s:4:"cash";i:0;s:11:"offline_pay";i:0;s:10:"app_wechat";i:0;s:10:"app_alipay";i:0;s:7:"paytype";a:3:{s:10:"commission";s:1:"0";s:8:"withdraw";s:1:"0";s:7:"redpack";s:1:"0";}}s:7:"contact";a:5:{s:5:"phone";s:12:"0546-8795956";s:8:"province";s:15:"请选择省份";s:4:"city";s:15:"请选择城市";s:7:"address";s:0:"";s:2:"qq";s:0:"";}s:7:"printer";a:9:{s:13:"order_printer";s:1:"1";s:14:"order_template";i:1;s:13:"printer_merch";i:0;s:9:"ordertype";s:1:"2";s:11:"printer_pay";i:1;s:16:"printer_recharge";i:1;s:12:"mem_fontsize";i:16;s:9:"mem_width";i:238;s:15:"printer_offline";i:1;}s:6:"member";a:4:{s:8:"levelurl";s:0:"";s:15:"bind_old_member";i:1;s:9:"leveltype";i:0;s:9:"levelname";s:0:"";}s:7:"diyform";a:6:{s:17:"user_diyform_open";s:1:"0";s:12:"user_diyform";s:1:"0";s:23:"commission_diyform_open";s:1:"0";s:18:"commission_diyform";s:1:"0";s:18:"order_diyform_open";s:1:"1";s:13:"order_diyform";s:1:"7";}s:10:"commission";a:59:{s:5:"level";s:1:"3";s:7:"selfbuy";s:1:"1";s:12:"become_child";s:1:"0";s:6:"become";s:1:"3";s:17:"become_ordercount";s:1:"1";s:17:"become_moneycount";s:3:"128";s:12:"become_check";s:1:"1";s:12:"become_order";s:1:"0";s:13:"open_protocol";s:1:"0";s:10:"become_reg";s:1:"1";s:17:"no_commission_url";s:0:"";s:10:"cashcredit";i:1;s:8:"withdraw";s:1:"1";s:14:"commissiontype";s:1:"2";s:14:"withdrawcharge";s:0:"";s:13:"withdrawbegin";d:0;s:11:"withdrawend";d:0;s:10:"settledays";s:0:"";s:8:"levelurl";s:0:"";s:9:"leveltype";s:1:"0";s:11:"qrcodeshare";s:1:"0";s:9:"codeShare";s:1:"1";s:15:"openorderdetail";s:1:"0";s:14:"openorderbuyer";s:1:"0";s:13:"closed_qrcode";s:1:"0";s:6:"qrcode";s:1:"0";s:12:"qrcode_title";s:0:"";s:14:"qrcode_content";s:0:"";s:13:"qrcode_remark";s:0:"";s:15:"register_bottom";s:1:"0";s:22:"register_bottom_title1";s:0:"";s:24:"register_bottom_content1";s:0:"";s:22:"register_bottom_title2";s:0:"";s:24:"register_bottom_content2";s:0:"";s:22:"register_bottom_title3";s:0:"";s:24:"register_bottom_content3";s:0:"";s:22:"register_bottom_remark";s:0:"";s:23:"register_bottom_content";s:0:"";s:11:"closemyshop";s:1:"0";s:12:"select_goods";s:1:"0";s:5:"style";s:7:"default";s:5:"regbg";s:0:"";s:10:"applytitle";s:0:"";s:12:"applycontent";s:0:"";s:10:"cashweixin";i:0;s:9:"cashother";i:0;s:10:"cashalipay";i:0;s:8:"cashcard";i:0;s:14:"become_goodsid";i:0;s:5:"texts";a:26:{s:5:"agent";s:9:"代言人";s:4:"shop";s:6:"小店";s:6:"myshop";s:12:"我的小店";s:6:"center";s:12:"分销中心";s:6:"become";s:15:"成为分销商";s:8:"withdraw";s:6:"提现";s:10:"commission";s:6:"佣金";s:11:"commission1";s:12:"分销佣金";s:16:"commission_total";s:12:"累计佣金";s:13:"commission_ok";s:15:"可提现佣金";s:16:"commission_apply";s:15:"已申请佣金";s:16:"commission_check";s:15:"待打款佣金";s:15:"commission_lock";s:15:"未结算佣金";s:15:"commission_wait";s:15:"待收货佣金";s:15:"commission_fail";s:12:"无效佣金";s:14:"commission_pay";s:18:"成功提现佣金";s:17:"commission_charge";s:21:"扣除个人所得税";s:17:"commission_detail";s:12:"佣金明细";s:5:"order";s:12:"佣金明细";s:4:"down";s:6:"下线";s:6:"mydown";s:12:"我的下线";s:2:"c1";s:12:"一代下级";s:2:"c2";s:12:"二代下级";s:2:"c3";s:12:"三代下级";s:4:"yuan";s:3:"元";s:5:"icode";s:9:"邀请码";}s:9:"levelname";s:12:"默认等级";s:11:"commission1";s:1:"5";s:11:"commission2";s:1:"3";s:11:"commission3";s:1:"2";s:6:"mempay";i:1;s:16:"check_cashcredit";i:0;s:10:"offlinePay";i:1;s:10:"mempay_com";i:0;s:14:"offlinePay_com";i:1;}s:4:"sale";a:1:{s:9:"recharges";s:224:"a:4:{i:0;a:2:{s:6:"enough";s:3:"800";s:4:"give";s:2:"80";}i:1;a:2:{s:6:"enough";s:4:"1500";s:4:"give";s:3:"180";}i:2;a:2:{s:6:"enough";s:4:"3000";s:4:"give";s:3:"420";}i:3;a:2:{s:6:"enough";s:4:"5000";s:4:"give";s:3:"800";}}";}}'),
('ewei_shop_9a52bfbf32243c1f30edc58b89a2935a', 'a:0:{}'),
('ewei_shop_a4676ec36c0e61443f52f5bf9c711135', 'a:0:{}'),
('ewei_shop_09110ee6c3659ae7c87f306b6c6a8616', 'a:6:{i:0;a:13:{s:2:"id";s:1:"6";s:12:"displayorder";s:1:"6";s:8:"identity";s:8:"tmessage";s:4:"name";s:12:"会员群发";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:4:"tool";s:5:"thumb";s:48:"../addons/ewei_shopv2/static/images/tmessage.jpg";s:4:"desc";s:0:"";s:5:"iscom";s:1:"0";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"0";}i:1;a:13:{s:2:"id";s:2:"12";s:12:"displayorder";s:2:"11";s:8:"identity";s:7:"article";s:4:"name";s:12:"文章营销";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:4:"help";s:5:"thumb";s:47:"../addons/ewei_shopv2/static/images/article.jpg";s:4:"desc";s:0:"";s:5:"iscom";s:1:"0";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"0";}i:2;a:13:{s:2:"id";s:2:"43";s:12:"displayorder";s:2:"11";s:8:"identity";s:4:"case";s:4:"name";s:12:"作品案例";s:7:"version";s:3:"1.0";s:6:"author";s:6:"weshop";s:6:"status";s:1:"1";s:8:"category";s:3:"biz";s:5:"thumb";s:44:"../addons/ewei_shopv2/static/images/case.jpg";s:4:"desc";N;s:5:"iscom";s:1:"0";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"0";}i:3;a:13:{s:2:"id";s:2:"16";s:12:"displayorder";s:2:"15";s:8:"identity";s:7:"diyform";s:4:"name";s:12:"自定表单";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:4:"help";s:5:"thumb";s:47:"../addons/ewei_shopv2/static/images/diyform.jpg";s:4:"desc";s:0:"";s:5:"iscom";s:1:"0";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"0";}i:4;a:13:{s:2:"id";s:2:"22";s:12:"displayorder";s:2:"26";s:8:"identity";s:2:"qa";s:4:"name";s:12:"帮助中心";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:4:"help";s:5:"thumb";s:42:"../addons/ewei_shopv2/static/images/qa.jpg";s:4:"desc";s:0:"";s:5:"iscom";s:1:"0";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"1";}i:5;a:13:{s:2:"id";s:2:"34";s:12:"displayorder";s:2:"37";s:8:"identity";s:8:"messages";s:4:"name";s:12:"消息群发";s:7:"version";s:3:"1.0";s:6:"author";s:6:"官方";s:6:"status";s:1:"1";s:8:"category";s:4:"tool";s:5:"thumb";s:48:"../addons/ewei_shopv2/static/images/messages.jpg";s:4:"desc";s:0:"";s:5:"iscom";s:1:"0";s:10:"deprecated";s:1:"0";s:4:"isv2";s:1:"1";}}'),
('jsticket:1', 'a:2:{s:6:"ticket";s:86:"LIKLckvwlJT9cWIhEQTwfPBiq0XDr9jUsToTGM1vw8oEtF5i_X9jJvBbWBGKFkESfSbCTMkvTNiIROc28WcuOA";s:6:"expire";i:1520861354;}');
INSERT INTO `ims_core_cache` (`key`, `value`) VALUES
('unimodules::1', 'a:14:{s:5:"basic";a:19:{s:3:"mid";s:1:"1";s:4:"name";s:5:"basic";s:4:"type";s:6:"system";s:5:"title";s:18:"基本文字回复";s:7:"version";s:3:"1.0";s:7:"ability";s:24:"和您进行简单对话";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:4:"news";a:19:{s:3:"mid";s:1:"2";s:4:"name";s:4:"news";s:4:"type";s:6:"system";s:5:"title";s:24:"基本混合图文回复";s:7:"version";s:3:"1.0";s:7:"ability";s:33:"为你提供生动的图文资讯";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"music";a:19:{s:3:"mid";s:1:"3";s:4:"name";s:5:"music";s:4:"type";s:6:"system";s:5:"title";s:18:"基本音乐回复";s:7:"version";s:3:"1.0";s:7:"ability";s:39:"提供语音、音乐等音频类回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:7:"userapi";a:19:{s:3:"mid";s:1:"4";s:4:"name";s:7:"userapi";s:4:"type";s:6:"system";s:5:"title";s:21:"自定义接口回复";s:7:"version";s:3:"1.1";s:7:"ability";s:33:"更方便的第三方接口设置";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:8:"recharge";a:19:{s:3:"mid";s:1:"5";s:4:"name";s:8:"recharge";s:4:"type";s:6:"system";s:5:"title";s:24:"会员中心充值模块";s:7:"version";s:3:"1.0";s:7:"ability";s:24:"提供会员充值功能";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"custom";a:19:{s:3:"mid";s:1:"6";s:4:"name";s:6:"custom";s:4:"type";s:6:"system";s:5:"title";s:15:"多客服转接";s:7:"version";s:5:"1.0.0";s:7:"ability";s:36:"用来接入腾讯的多客服系统";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";a:0:{}s:7:"handles";a:6:{i:0;s:5:"image";i:1;s:5:"voice";i:2;s:5:"video";i:3;s:8:"location";i:4;s:4:"link";i:5;s:4:"text";}s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"images";a:19:{s:3:"mid";s:1:"7";s:4:"name";s:6:"images";s:4:"type";s:6:"system";s:5:"title";s:18:"基本图片回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供图片回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"video";a:19:{s:3:"mid";s:1:"8";s:4:"name";s:5:"video";s:4:"type";s:6:"system";s:5:"title";s:18:"基本视频回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供图片回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"voice";a:19:{s:3:"mid";s:1:"9";s:4:"name";s:5:"voice";s:4:"type";s:6:"system";s:5:"title";s:18:"基本语音回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供语音回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"chats";a:19:{s:3:"mid";s:2:"10";s:4:"name";s:5:"chats";s:4:"type";s:6:"system";s:5:"title";s:18:"发送客服消息";s:7:"version";s:3:"1.0";s:7:"ability";s:77:"公众号可以在粉丝最后发送消息的48小时内无限制发送消息";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"wxcard";a:19:{s:3:"mid";s:2:"11";s:4:"name";s:6:"wxcard";s:4:"type";s:6:"system";s:5:"title";s:18:"微信卡券回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"微信卡券回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:9:"paycenter";a:19:{s:3:"mid";s:2:"12";s:4:"name";s:9:"paycenter";s:4:"type";s:6:"system";s:5:"title";s:9:"收银台";s:7:"version";s:3:"1.0";s:7:"ability";s:9:"收银台";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:11:"ewei_shopv2";a:19:{s:3:"mid";s:2:"15";s:4:"name";s:11:"ewei_shopv2";s:4:"type";s:8:"business";s:5:"title";s:12:"羽月weshop";s:7:"version";s:6:"2.10.3";s:7:"ability";s:87:"羽月weshop(分销),多用户分权，淘宝商品一键转换，多种插件支持。";s:6:"author";s:18:"羽月智能科技";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";a:14:{i:0;s:4:"text";i:1;s:5:"image";i:2;s:5:"voice";i:3;s:5:"video";i:4;s:10:"shortvideo";i:5;s:8:"location";i:6;s:4:"link";i:7;s:9:"subscribe";i:8;s:11:"unsubscribe";i:9;s:2:"qr";i:10;s:5:"trace";i:11;s:5:"click";i:12;s:4:"view";i:13;s:14:"merchant_order";}s:7:"handles";a:12:{i:0;s:4:"text";i:1;s:5:"image";i:2;s:5:"voice";i:3;s:5:"video";i:4;s:10:"shortvideo";i:5;s:8:"location";i:6;s:4:"link";i:7;s:9:"subscribe";i:8;s:2:"qr";i:9;s:5:"trace";i:10;s:5:"click";i:11;s:14:"merchant_order";}s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:6:"a:0:{}";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:4:"core";a:5:{s:5:"title";s:24:"系统事件处理模块";s:4:"name";s:4:"core";s:8:"issystem";i:1;s:7:"enabled";i:1;s:9:"isdisplay";i:0;}}'),
('accesstoken:wx1223d08ee7dcb407', 'a:2:{s:5:"token";s:156:"7_EBu-fy8P7mqRA04aivv_AV-y9h2oFXjDgO5LH_LoaSlDRKww-U1rPQgBOign0oiqiOW_cifbqG5z9JuthgNQePUDpG00cBztjqbCfsGgHTrC2vicKZrUt-2eEXW8JaZ1zqmV9C-WlO0SCwX_AMNcABAGST";s:6:"expire";i:1520855837;}'),
('ewei_shop_02b72fcc49fb8916836f109352f05d59', 's:19:"2018-03-12 15:15:00";'),
('ewei_shop_6d73376bea992c47c8c6b93095553199', 'a:5:{s:2:"id";s:2:"11";s:7:"uniacid";s:1:"4";s:4:"sets";N;s:7:"plugins";s:25:"a:1:{s:6:"coupon";a:0:{}}";s:3:"sec";N;}'),
('ewei_shop_52285de7717f2d78ca6623c56da33f82', 's:19:"2018-03-12 15:15:00";'),
('ewei_shop_106d0296ca686e59fdfbf235c85a1569', 's:19:"2018-03-12 15:15:00";'),
('ewei_shop_3b67348a577d9548c80c1015085a5c72', 's:19:"2018-03-12 15:15:00";'),
('ewei_shop_2f815720a2f517136716dbb1096bea5d', 's:19:"2018-03-12 15:15:00";'),
('ewei_shop_d45488b13ce1f38aa2bba754b153037f', 's:19:"2018-03-12 15:15:00";'),
('unimodules::', 'a:14:{s:5:"basic";a:19:{s:3:"mid";s:1:"1";s:4:"name";s:5:"basic";s:4:"type";s:6:"system";s:5:"title";s:18:"基本文字回复";s:7:"version";s:3:"1.0";s:7:"ability";s:24:"和您进行简单对话";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:4:"news";a:19:{s:3:"mid";s:1:"2";s:4:"name";s:4:"news";s:4:"type";s:6:"system";s:5:"title";s:24:"基本混合图文回复";s:7:"version";s:3:"1.0";s:7:"ability";s:33:"为你提供生动的图文资讯";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"music";a:19:{s:3:"mid";s:1:"3";s:4:"name";s:5:"music";s:4:"type";s:6:"system";s:5:"title";s:18:"基本音乐回复";s:7:"version";s:3:"1.0";s:7:"ability";s:39:"提供语音、音乐等音频类回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:7:"userapi";a:19:{s:3:"mid";s:1:"4";s:4:"name";s:7:"userapi";s:4:"type";s:6:"system";s:5:"title";s:21:"自定义接口回复";s:7:"version";s:3:"1.1";s:7:"ability";s:33:"更方便的第三方接口设置";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:8:"recharge";a:19:{s:3:"mid";s:1:"5";s:4:"name";s:8:"recharge";s:4:"type";s:6:"system";s:5:"title";s:24:"会员中心充值模块";s:7:"version";s:3:"1.0";s:7:"ability";s:24:"提供会员充值功能";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"custom";a:19:{s:3:"mid";s:1:"6";s:4:"name";s:6:"custom";s:4:"type";s:6:"system";s:5:"title";s:15:"多客服转接";s:7:"version";s:5:"1.0.0";s:7:"ability";s:36:"用来接入腾讯的多客服系统";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";a:0:{}s:7:"handles";a:6:{i:0;s:5:"image";i:1;s:5:"voice";i:2;s:5:"video";i:3;s:8:"location";i:4;s:4:"link";i:5;s:4:"text";}s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"images";a:19:{s:3:"mid";s:1:"7";s:4:"name";s:6:"images";s:4:"type";s:6:"system";s:5:"title";s:18:"基本图片回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供图片回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"video";a:19:{s:3:"mid";s:1:"8";s:4:"name";s:5:"video";s:4:"type";s:6:"system";s:5:"title";s:18:"基本视频回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供图片回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"voice";a:19:{s:3:"mid";s:1:"9";s:4:"name";s:5:"voice";s:4:"type";s:6:"system";s:5:"title";s:18:"基本语音回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供语音回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"chats";a:19:{s:3:"mid";s:2:"10";s:4:"name";s:5:"chats";s:4:"type";s:6:"system";s:5:"title";s:18:"发送客服消息";s:7:"version";s:3:"1.0";s:7:"ability";s:77:"公众号可以在粉丝最后发送消息的48小时内无限制发送消息";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"wxcard";a:19:{s:3:"mid";s:2:"11";s:4:"name";s:6:"wxcard";s:4:"type";s:6:"system";s:5:"title";s:18:"微信卡券回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"微信卡券回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:9:"paycenter";a:19:{s:3:"mid";s:2:"12";s:4:"name";s:9:"paycenter";s:4:"type";s:6:"system";s:5:"title";s:9:"收银台";s:7:"version";s:3:"1.0";s:7:"ability";s:9:"收银台";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:11:"ewei_shopv2";a:19:{s:3:"mid";s:2:"15";s:4:"name";s:11:"ewei_shopv2";s:4:"type";s:8:"business";s:5:"title";s:12:"羽月weshop";s:7:"version";s:6:"2.10.3";s:7:"ability";s:87:"羽月weshop(分销),多用户分权，淘宝商品一键转换，多种插件支持。";s:6:"author";s:18:"羽月智能科技";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";a:14:{i:0;s:4:"text";i:1;s:5:"image";i:2;s:5:"voice";i:3;s:5:"video";i:4;s:10:"shortvideo";i:5;s:8:"location";i:6;s:4:"link";i:7;s:9:"subscribe";i:8;s:11:"unsubscribe";i:9;s:2:"qr";i:10;s:5:"trace";i:11;s:5:"click";i:12;s:4:"view";i:13;s:14:"merchant_order";}s:7:"handles";a:12:{i:0;s:4:"text";i:1;s:5:"image";i:2;s:5:"voice";i:3;s:5:"video";i:4;s:10:"shortvideo";i:5;s:8:"location";i:6;s:4:"link";i:7;s:9:"subscribe";i:8;s:2:"qr";i:9;s:5:"trace";i:10;s:5:"click";i:11;s:14:"merchant_order";}s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:6:"a:0:{}";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:4:"core";a:5:{s:5:"title";s:24:"系统事件处理模块";s:4:"name";s:4:"core";s:8:"issystem";i:1;s:7:"enabled";i:1;s:9:"isdisplay";i:0;}}'),
('unisetting:1', 'a:23:{s:7:"uniacid";s:1:"1";s:8:"passport";a:3:{s:8:"focusreg";i:0;s:4:"item";s:5:"email";s:4:"type";s:8:"password";}s:5:"oauth";a:2:{s:7:"account";i:1;s:4:"host";N;}s:11:"jsauth_acid";s:1:"0";s:2:"uc";a:1:{s:6:"status";i:0;}s:6:"notify";a:1:{s:3:"sms";a:2:{s:7:"balance";i:0;s:9:"signature";s:0:"";}}s:11:"creditnames";a:5:{s:7:"credit1";a:2:{s:5:"title";s:6:"积分";s:7:"enabled";i:1;}s:7:"credit2";a:2:{s:5:"title";s:6:"余额";s:7:"enabled";i:1;}s:7:"credit3";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}s:7:"credit4";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}s:7:"credit5";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}}s:15:"creditbehaviors";a:2:{s:8:"activity";s:7:"credit1";s:8:"currency";s:7:"credit2";}s:7:"welcome";s:0:"";s:7:"default";s:0:"";s:15:"default_message";s:0:"";s:9:"shortcuts";a:1:{s:11:"ewei_shopv2";a:2:{s:4:"name";s:11:"ewei_shopv2";s:4:"link";s:49:"./index.php?c=home&a=welcome&do=ext&m=ewei_shopv2";}}s:7:"payment";a:7:{s:6:"credit";a:1:{s:6:"switch";b:0;}s:6:"alipay";a:4:{s:6:"switch";b:1;s:7:"account";s:3:"fef";s:7:"partner";s:3:"wef";s:6:"secret";s:4:"fwef";}s:6:"wechat";a:10:{s:6:"switch";b:0;s:7:"account";s:1:"1";s:7:"signkey";s:32:"JzpAUlxGX4w4yGhkUA9Uaw4RXgOFhz0x";s:7:"partner";s:0:"";s:3:"key";s:0:"";s:7:"version";s:1:"2";s:5:"mchid";s:0:"";s:6:"apikey";s:32:"JzpAUlxGX4w4yGhkUA9Uaw4RXgOFhz0x";s:6:"borrow";s:1:"0";s:10:"sub_mch_id";s:0:"";}s:8:"delivery";a:1:{s:6:"switch";b:0;}s:8:"unionpay";a:3:{s:6:"switch";b:0;s:11:"signcertpwd";s:0:"";s:5:"merid";s:0:"";}s:8:"baifubao";a:3:{s:6:"switch";b:0;s:7:"signkey";s:0:"";s:5:"mchid";s:0:"";}s:4:"line";a:2:{s:6:"switch";b:1;s:7:"message";s:0:"";}}s:4:"stat";s:0:"";s:12:"default_site";s:1:"1";s:4:"sync";s:1:"0";s:8:"recharge";s:0:"";s:9:"tplnotice";s:0:"";s:10:"grouplevel";s:1:"0";s:8:"mcplugin";s:0:"";s:15:"exchange_enable";s:1:"0";s:11:"coupon_type";s:1:"0";s:7:"menuset";s:0:"";}'),
('accesstoken:1', 'a:2:{s:5:"token";s:156:"7_FU56V54pQ1GRwOSHSF_1HZ-mxs1-rXi9COb8zyjvEymG_TmJNqSmP7GUPvejhRiNanrj_l-hEqRdLS321T3rK4SJoEZzvQKk0leaAri8dtjKSrUAzCTP36Q7e3qCYkHacxCDK1kCKhvHEujmBTAhAFARJQ";s:6:"expire";i:1520861354;}'),
('ewei_shop_c63f0b1d52faebdb70e565393f9a13d6', 'a:5:{s:2:"id";s:2:"10";s:7:"uniacid";s:1:"1";s:4:"sets";s:2694:"a:7:{s:3:"wap";a:13:{s:4:"open";i:1;s:7:"inh5app";s:1:"0";s:8:"mustbind";s:1:"0";s:5:"style";s:7:"default";s:5:"color";s:0:"";s:2:"bg";s:53:"../addons/ewei_shopv2/template/account/default/bg.jpg";s:7:"sms_reg";s:1:"5";s:10:"sms_forget";s:1:"5";s:13:"sms_changepwd";s:1:"5";s:8:"sms_bind";s:1:"5";s:7:"loginbg";N;s:5:"regbg";N;s:3:"sns";a:2:{s:2:"wx";i:0;s:2:"qq";i:0;}}s:5:"wxapp";a:7:{s:4:"name";s:9:"画个我";s:4:"logo";s:0:"";s:7:"account";s:0:"";s:8:"original";s:0:"";s:5:"AppId";s:18:"wx1223d08ee7dcb407";s:9:"AppSecret";s:32:"f307cac71d3faee7578b80819583b8e0";s:7:"version";s:3:"1.0";}s:4:"shop";a:19:{s:4:"name";s:9:"画个我";s:4:"logo";s:51:"images/1/2018/03/qlsB26lkiiekW6KPlswggwWsWwWwKY.jpg";s:11:"description";s:0:"";s:3:"img";s:0:"";s:7:"signimg";s:0:"";s:7:"getinfo";s:1:"1";s:5:"uc_bg";s:51:"images/1/2017/08/kgtcC1Cz0cttTTGDaZdWtbwkcG5cT9.jpg";s:7:"saleout";s:0:"";s:7:"loading";s:0:"";s:7:"diycode";s:0:"";s:6:"funbar";s:1:"0";s:2:"qq";s:0:"";s:7:"address";s:0:"";s:5:"phone";s:12:"0546-6081566";s:10:"contact_bg";s:51:"images/1/2017/09/TkHdXDzU90xuuKVUpHT2CH2duUXxYv.jpg";s:9:"ordertype";i:2;s:11:"recharge_bg";s:0:"";s:7:"nothumb";s:0:"";s:7:"webtype";i:0;}s:5:"trade";a:32:{s:12:"set_realname";s:1:"0";s:10:"set_mobile";s:1:"0";s:10:"closeorder";s:0:"";s:14:"willcloseorder";s:0:"";s:9:"stockwarn";s:0:"";s:7:"receive";s:0:"";s:10:"refunddays";s:0:"";s:13:"refundcontent";s:0:"";s:16:"offline_pay_desc";s:43:"工行：298320390239  收款人： 2030033";s:10:"credittext";s:6:"积分";s:9:"moneytext";s:6:"余额";s:13:"closerecharge";s:1:"0";s:5:"money";s:0:"";s:6:"credit";s:0:"";s:13:"minimumcharge";d:0;s:8:"withdraw";s:1:"0";s:13:"withdrawmoney";s:0:"";s:14:"withdrawcharge";s:0:"";s:13:"withdrawbegin";d:0;s:11:"withdrawend";d:0;s:9:"maxcredit";s:1:"0";s:12:"closecomment";s:1:"0";s:16:"closecommentshow";s:1:"0";s:14:"commentchecked";s:1:"0";s:12:"shareaddress";s:1:"0";s:10:"istimetext";s:9:"限时购";s:15:"nodispatchareas";s:7:"s:0:"";";s:20:"nodispatchareas_code";s:7:"s:0:"";";s:18:"withdrawcashweixin";i:0;s:18:"withdrawcashalipay";i:0;s:16:"withdrawcashcard";i:0;s:6:"paybtn";i:1;}s:3:"pay";a:12:{s:9:"weixin_id";i:1;s:6:"weixin";i:1;s:10:"weixin_sub";i:0;s:10:"weixin_jie";i:0;s:14:"weixin_jie_sub";i:0;s:6:"alipay";i:1;s:6:"credit";i:1;s:4:"cash";i:0;s:11:"offline_pay";i:1;s:10:"app_wechat";i:1;s:10:"app_alipay";i:1;s:7:"paytype";a:3:{s:10:"commission";s:1:"0";s:8:"withdraw";s:1:"0";s:7:"redpack";s:1:"0";}}s:7:"contact";a:5:{s:5:"phone";s:12:"0546-6081566";s:8:"province";s:15:"请选择省份";s:4:"city";s:15:"请选择城市";s:7:"address";s:0:"";s:2:"qq";s:0:"";}s:6:"wxtmpl";a:1:{s:4:"send";s:43:"C_HLT0raUG5EciqQrhOz5t0-fBXWskpTZwnDGNwSEB8";}}";s:7:"plugins";s:3397:"a:5:{s:5:"merch";a:13:{s:12:"is_openmerch";s:1:"0";s:17:"deduct_commission";s:1:"0";s:16:"apply_openmobile";s:1:"1";s:13:"open_protocol";s:1:"0";s:5:"regbg";s:0:"";s:13:"apply_diyform";s:1:"0";s:15:"apply_diyformid";s:1:"0";s:6:"regpic";s:0:"";s:10:"applytitle";s:0:"";s:12:"applycontent";s:0:"";s:15:"applycashweixin";i:0;s:15:"applycashalipay";i:0;s:13:"applycashcard";i:0;}s:4:"sale";a:3:{s:11:"enoughmoney";d:0;s:12:"enoughdeduct";d:0;s:7:"enoughs";a:0:{}}s:10:"commission";a:54:{s:5:"level";s:1:"2";s:7:"selfbuy";s:1:"0";s:12:"become_child";s:1:"0";s:6:"become";s:1:"0";s:17:"become_ordercount";s:0:"";s:17:"become_moneycount";s:3:"500";s:12:"become_check";s:1:"1";s:12:"become_order";s:1:"0";s:13:"open_protocol";s:1:"0";s:10:"become_reg";s:1:"1";s:17:"no_commission_url";s:0:"";s:8:"withdraw";s:2:"50";s:14:"commissiontype";s:1:"0";s:14:"withdrawcharge";s:0:"";s:13:"withdrawbegin";d:0;s:11:"withdrawend";d:0;s:10:"settledays";s:0:"";s:8:"levelurl";s:0:"";s:9:"leveltype";s:1:"0";s:11:"qrcodeshare";s:1:"0";s:9:"codeShare";s:1:"1";s:15:"openorderdetail";s:1:"0";s:14:"openorderbuyer";s:1:"0";s:13:"closed_qrcode";s:1:"0";s:6:"qrcode";s:1:"0";s:12:"qrcode_title";s:0:"";s:14:"qrcode_content";s:0:"";s:13:"qrcode_remark";s:0:"";s:15:"register_bottom";s:1:"0";s:22:"register_bottom_title1";s:0:"";s:24:"register_bottom_content1";s:0:"";s:22:"register_bottom_title2";s:0:"";s:24:"register_bottom_content2";s:0:"";s:22:"register_bottom_title3";s:0:"";s:24:"register_bottom_content3";s:0:"";s:22:"register_bottom_remark";s:0:"";s:23:"register_bottom_content";s:0:"";s:11:"closemyshop";s:1:"0";s:12:"select_goods";s:1:"0";s:5:"style";s:7:"default";s:5:"regbg";s:0:"";s:10:"applytitle";s:0:"";s:12:"applycontent";s:0:"";s:10:"cashcredit";i:0;s:10:"cashweixin";i:0;s:9:"cashother";i:1;s:10:"cashalipay";i:1;s:8:"cashcard";i:0;s:14:"become_goodsid";i:0;s:5:"texts";a:26:{s:5:"agent";s:9:"分销商";s:4:"shop";s:6:"小店";s:6:"myshop";s:12:"我的小店";s:6:"center";s:12:"分销中心";s:6:"become";s:15:"成为分销商";s:8:"withdraw";s:6:"提现";s:10:"commission";s:6:"佣金";s:11:"commission1";s:12:"分销佣金";s:16:"commission_total";s:12:"累计佣金";s:13:"commission_ok";s:15:"可提现佣金";s:16:"commission_apply";s:15:"已申请佣金";s:16:"commission_check";s:15:"待打款佣金";s:15:"commission_lock";s:15:"未结算佣金";s:15:"commission_wait";s:15:"待收货佣金";s:15:"commission_fail";s:12:"无效佣金";s:14:"commission_pay";s:18:"成功提现佣金";s:17:"commission_charge";s:21:"扣除个人所得税";s:17:"commission_detail";s:12:"佣金明细";s:5:"order";s:12:"佣金明细";s:4:"down";s:6:"下线";s:6:"mydown";s:12:"我的下线";s:2:"c1";s:6:"一级";s:2:"c2";s:6:"二级";s:2:"c3";s:6:"三级";s:4:"yuan";s:3:"元";s:5:"icode";s:9:"邀请码";}s:9:"levelname";s:12:"默认等级";s:11:"commission1";s:2:"10";s:11:"commission2";s:1:"5";s:11:"commission3";s:0:"";}s:6:"coupon";a:14:{s:14:"sendtemplateid";s:0:"";s:5:"frist";s:0:"";s:10:"fristcolor";s:7:"#000000";s:8:"keyword1";s:24:"恭喜您获得优惠卷";s:13:"keyword1color";s:7:"#000000";s:8:"keyword2";s:18:"请您点击查看";s:13:"keyword2color";s:7:"#000000";s:6:"remark";s:0:"";s:11:"remarkcolor";s:7:"#000000";s:11:"templateurl";s:0:"";s:8:"custitle";s:0:"";s:8:"custhumb";s:0:"";s:7:"cusdesc";s:0:"";s:6:"cusurl";s:0:"";}s:4:"case";a:2:{s:4:"case";s:6:"作品";s:6:"author";s:6:"画师";}}";s:3:"sec";s:385:"a:3:{s:10:"app_wechat";a:5:{s:5:"appid";s:6:"345345";s:9:"appsecret";s:6:"345345";s:9:"merchname";s:6:"345345";s:7:"merchid";s:6:"345345";s:6:"apikey";s:6:"345345";}s:10:"alipay_pay";a:4:{s:7:"partner";s:0:"";s:12:"account_name";s:0:"";s:5:"email";s:0:"";s:3:"key";s:0:"";}s:10:"app_alipay";a:3:{s:10:"public_key";s:6:"345345";s:11:"private_key";s:6:"345345";s:5:"appid";s:5:"45435";}}";}'),
('ewei_shop_74d1cea9b4bb0b717d26c64287fa94e9', 'a:12:{s:3:"wap";a:13:{s:4:"open";i:1;s:7:"inh5app";s:1:"0";s:8:"mustbind";s:1:"0";s:5:"style";s:7:"default";s:5:"color";s:0:"";s:2:"bg";s:53:"../addons/ewei_shopv2/template/account/default/bg.jpg";s:7:"sms_reg";s:1:"5";s:10:"sms_forget";s:1:"5";s:13:"sms_changepwd";s:1:"5";s:8:"sms_bind";s:1:"5";s:7:"loginbg";N;s:5:"regbg";N;s:3:"sns";a:2:{s:2:"wx";i:0;s:2:"qq";i:0;}}s:5:"wxapp";a:7:{s:4:"name";s:9:"画个我";s:4:"logo";s:0:"";s:7:"account";s:0:"";s:8:"original";s:0:"";s:5:"AppId";s:18:"wx1223d08ee7dcb407";s:9:"AppSecret";s:32:"f307cac71d3faee7578b80819583b8e0";s:7:"version";s:3:"1.0";}s:4:"shop";a:19:{s:4:"name";s:9:"画个我";s:4:"logo";s:51:"images/1/2018/03/qlsB26lkiiekW6KPlswggwWsWwWwKY.jpg";s:11:"description";s:0:"";s:3:"img";s:0:"";s:7:"signimg";s:0:"";s:7:"getinfo";s:1:"1";s:5:"uc_bg";s:51:"images/1/2017/08/kgtcC1Cz0cttTTGDaZdWtbwkcG5cT9.jpg";s:7:"saleout";s:0:"";s:7:"loading";s:0:"";s:7:"diycode";s:0:"";s:6:"funbar";s:1:"0";s:2:"qq";s:0:"";s:7:"address";s:0:"";s:5:"phone";s:12:"0546-6081566";s:10:"contact_bg";s:51:"images/1/2017/09/TkHdXDzU90xuuKVUpHT2CH2duUXxYv.jpg";s:9:"ordertype";i:2;s:11:"recharge_bg";s:0:"";s:7:"nothumb";s:0:"";s:7:"webtype";i:0;}s:5:"trade";a:32:{s:12:"set_realname";s:1:"0";s:10:"set_mobile";s:1:"0";s:10:"closeorder";s:0:"";s:14:"willcloseorder";s:0:"";s:9:"stockwarn";s:0:"";s:7:"receive";s:0:"";s:10:"refunddays";s:0:"";s:13:"refundcontent";s:0:"";s:16:"offline_pay_desc";s:43:"工行：298320390239  收款人： 2030033";s:10:"credittext";s:6:"积分";s:9:"moneytext";s:6:"余额";s:13:"closerecharge";s:1:"0";s:5:"money";s:0:"";s:6:"credit";s:0:"";s:13:"minimumcharge";d:0;s:8:"withdraw";s:1:"0";s:13:"withdrawmoney";s:0:"";s:14:"withdrawcharge";s:0:"";s:13:"withdrawbegin";d:0;s:11:"withdrawend";d:0;s:9:"maxcredit";s:1:"0";s:12:"closecomment";s:1:"0";s:16:"closecommentshow";s:1:"0";s:14:"commentchecked";s:1:"0";s:12:"shareaddress";s:1:"0";s:10:"istimetext";s:9:"限时购";s:15:"nodispatchareas";s:7:"s:0:"";";s:20:"nodispatchareas_code";s:7:"s:0:"";";s:18:"withdrawcashweixin";i:0;s:18:"withdrawcashalipay";i:0;s:16:"withdrawcashcard";i:0;s:6:"paybtn";i:1;}s:3:"pay";a:12:{s:9:"weixin_id";i:1;s:6:"weixin";i:1;s:10:"weixin_sub";i:0;s:10:"weixin_jie";i:0;s:14:"weixin_jie_sub";i:0;s:6:"alipay";i:1;s:6:"credit";i:1;s:4:"cash";i:0;s:11:"offline_pay";i:1;s:10:"app_wechat";i:1;s:10:"app_alipay";i:1;s:7:"paytype";a:3:{s:10:"commission";s:1:"0";s:8:"withdraw";s:1:"0";s:7:"redpack";s:1:"0";}}s:7:"contact";a:5:{s:5:"phone";s:12:"0546-6081566";s:8:"province";s:15:"请选择省份";s:4:"city";s:15:"请选择城市";s:7:"address";s:0:"";s:2:"qq";s:0:"";}s:6:"wxtmpl";a:1:{s:4:"send";s:43:"C_HLT0raUG5EciqQrhOz5t0-fBXWskpTZwnDGNwSEB8";}s:5:"merch";a:13:{s:12:"is_openmerch";s:1:"0";s:17:"deduct_commission";s:1:"0";s:16:"apply_openmobile";s:1:"1";s:13:"open_protocol";s:1:"0";s:5:"regbg";s:0:"";s:13:"apply_diyform";s:1:"0";s:15:"apply_diyformid";s:1:"0";s:6:"regpic";s:0:"";s:10:"applytitle";s:0:"";s:12:"applycontent";s:0:"";s:15:"applycashweixin";i:0;s:15:"applycashalipay";i:0;s:13:"applycashcard";i:0;}s:4:"sale";a:3:{s:11:"enoughmoney";d:0;s:12:"enoughdeduct";d:0;s:7:"enoughs";a:0:{}}s:10:"commission";a:54:{s:5:"level";s:1:"2";s:7:"selfbuy";s:1:"0";s:12:"become_child";s:1:"0";s:6:"become";s:1:"0";s:17:"become_ordercount";s:0:"";s:17:"become_moneycount";s:3:"500";s:12:"become_check";s:1:"1";s:12:"become_order";s:1:"0";s:13:"open_protocol";s:1:"0";s:10:"become_reg";s:1:"1";s:17:"no_commission_url";s:0:"";s:8:"withdraw";s:2:"50";s:14:"commissiontype";s:1:"0";s:14:"withdrawcharge";s:0:"";s:13:"withdrawbegin";d:0;s:11:"withdrawend";d:0;s:10:"settledays";s:0:"";s:8:"levelurl";s:0:"";s:9:"leveltype";s:1:"0";s:11:"qrcodeshare";s:1:"0";s:9:"codeShare";s:1:"1";s:15:"openorderdetail";s:1:"0";s:14:"openorderbuyer";s:1:"0";s:13:"closed_qrcode";s:1:"0";s:6:"qrcode";s:1:"0";s:12:"qrcode_title";s:0:"";s:14:"qrcode_content";s:0:"";s:13:"qrcode_remark";s:0:"";s:15:"register_bottom";s:1:"0";s:22:"register_bottom_title1";s:0:"";s:24:"register_bottom_content1";s:0:"";s:22:"register_bottom_title2";s:0:"";s:24:"register_bottom_content2";s:0:"";s:22:"register_bottom_title3";s:0:"";s:24:"register_bottom_content3";s:0:"";s:22:"register_bottom_remark";s:0:"";s:23:"register_bottom_content";s:0:"";s:11:"closemyshop";s:1:"0";s:12:"select_goods";s:1:"0";s:5:"style";s:7:"default";s:5:"regbg";s:0:"";s:10:"applytitle";s:0:"";s:12:"applycontent";s:0:"";s:10:"cashcredit";i:0;s:10:"cashweixin";i:0;s:9:"cashother";i:1;s:10:"cashalipay";i:1;s:8:"cashcard";i:0;s:14:"become_goodsid";i:0;s:5:"texts";a:26:{s:5:"agent";s:9:"分销商";s:4:"shop";s:6:"小店";s:6:"myshop";s:12:"我的小店";s:6:"center";s:12:"分销中心";s:6:"become";s:15:"成为分销商";s:8:"withdraw";s:6:"提现";s:10:"commission";s:6:"佣金";s:11:"commission1";s:12:"分销佣金";s:16:"commission_total";s:12:"累计佣金";s:13:"commission_ok";s:15:"可提现佣金";s:16:"commission_apply";s:15:"已申请佣金";s:16:"commission_check";s:15:"待打款佣金";s:15:"commission_lock";s:15:"未结算佣金";s:15:"commission_wait";s:15:"待收货佣金";s:15:"commission_fail";s:12:"无效佣金";s:14:"commission_pay";s:18:"成功提现佣金";s:17:"commission_charge";s:21:"扣除个人所得税";s:17:"commission_detail";s:12:"佣金明细";s:5:"order";s:12:"佣金明细";s:4:"down";s:6:"下线";s:6:"mydown";s:12:"我的下线";s:2:"c1";s:6:"一级";s:2:"c2";s:6:"二级";s:2:"c3";s:6:"三级";s:4:"yuan";s:3:"元";s:5:"icode";s:9:"邀请码";}s:9:"levelname";s:12:"默认等级";s:11:"commission1";s:2:"10";s:11:"commission2";s:1:"5";s:11:"commission3";s:0:"";}s:6:"coupon";a:14:{s:14:"sendtemplateid";s:0:"";s:5:"frist";s:0:"";s:10:"fristcolor";s:7:"#000000";s:8:"keyword1";s:24:"恭喜您获得优惠卷";s:13:"keyword1color";s:7:"#000000";s:8:"keyword2";s:18:"请您点击查看";s:13:"keyword2color";s:7:"#000000";s:6:"remark";s:0:"";s:11:"remarkcolor";s:7:"#000000";s:11:"templateurl";s:0:"";s:8:"custitle";s:0:"";s:8:"custhumb";s:0:"";s:7:"cusdesc";s:0:"";s:6:"cusurl";s:0:"";}s:4:"case";a:2:{s:4:"case";s:6:"作品";s:6:"author";s:6:"画师";}}'),
('unicount:1', 's:1:"1";'),
('ewei_shop_583ced713665d93ef46469755cfb6df6', 'a:2:{s:6:"parent";a:5:{i:0;a:13:{s:2:"id";s:4:"1174";s:7:"uniacid";s:1:"1";s:4:"name";s:6:"女生";s:5:"thumb";s:0:"";s:8:"parentid";s:1:"0";s:11:"isrecommand";s:1:"0";s:11:"description";s:0:"";s:12:"displayorder";s:2:"10";s:7:"enabled";s:1:"1";s:6:"ishome";s:1:"0";s:6:"advimg";s:0:"";s:6:"advurl";s:0:"";s:5:"level";i:1;}i:1;a:13:{s:2:"id";s:4:"1175";s:7:"uniacid";s:1:"1";s:4:"name";s:6:"男生";s:5:"thumb";s:0:"";s:8:"parentid";s:1:"0";s:11:"isrecommand";s:1:"0";s:11:"description";s:0:"";s:12:"displayorder";s:1:"0";s:7:"enabled";s:1:"1";s:6:"ishome";s:1:"0";s:6:"advimg";s:0:"";s:6:"advurl";s:0:"";s:5:"level";i:1;}i:2;a:13:{s:2:"id";s:4:"1176";s:7:"uniacid";s:1:"1";s:4:"name";s:6:"情侣";s:5:"thumb";s:0:"";s:8:"parentid";s:1:"0";s:11:"isrecommand";s:1:"0";s:11:"description";s:0:"";s:12:"displayorder";s:1:"0";s:7:"enabled";s:1:"1";s:6:"ishome";s:1:"0";s:6:"advimg";s:0:"";s:6:"advurl";s:0:"";s:5:"level";i:1;}i:3;a:13:{s:2:"id";s:4:"1177";s:7:"uniacid";s:1:"1";s:4:"name";s:6:"家庭";s:5:"thumb";s:0:"";s:8:"parentid";s:1:"0";s:11:"isrecommand";s:1:"0";s:11:"description";s:0:"";s:12:"displayorder";s:1:"0";s:7:"enabled";s:1:"1";s:6:"ishome";s:1:"0";s:6:"advimg";s:0:"";s:6:"advurl";s:0:"";s:5:"level";i:1;}i:4;a:13:{s:2:"id";s:4:"1190";s:7:"uniacid";s:1:"1";s:4:"name";s:6:"宠物";s:5:"thumb";s:0:"";s:8:"parentid";s:1:"0";s:11:"isrecommand";s:1:"0";s:11:"description";s:0:"";s:12:"displayorder";s:1:"0";s:7:"enabled";s:1:"1";s:6:"ishome";s:1:"0";s:6:"advimg";s:0:"";s:6:"advurl";s:0:"";s:5:"level";i:1;}}s:8:"children";a:0:{}}'),
('ewei_shop_37a6e22cca3ec22db3720886454b2e19', 'a:6:{i:1174;a:5:{s:2:"id";s:4:"1174";s:8:"parentid";s:1:"0";s:7:"uniacid";s:1:"1";s:4:"name";s:6:"女生";s:5:"thumb";s:0:"";}i:1175;a:5:{s:2:"id";s:4:"1175";s:8:"parentid";s:1:"0";s:7:"uniacid";s:1:"1";s:4:"name";s:6:"男生";s:5:"thumb";s:0:"";}i:1176;a:5:{s:2:"id";s:4:"1176";s:8:"parentid";s:1:"0";s:7:"uniacid";s:1:"1";s:4:"name";s:6:"情侣";s:5:"thumb";s:0:"";}i:1177;a:5:{s:2:"id";s:4:"1177";s:8:"parentid";s:1:"0";s:7:"uniacid";s:1:"1";s:4:"name";s:6:"家庭";s:5:"thumb";s:0:"";}i:1191;a:5:{s:2:"id";s:4:"1191";s:8:"parentid";s:1:"0";s:7:"uniacid";s:1:"1";s:4:"name";s:6:"实物";s:5:"thumb";s:0:"";}i:1190;a:5:{s:2:"id";s:4:"1190";s:8:"parentid";s:1:"0";s:7:"uniacid";s:1:"1";s:4:"name";s:6:"宠物";s:5:"thumb";s:0:"";}}'),
('uniaccount:0', 'a:6:{s:4:"type";b:0;s:3:"uid";N;s:9:"starttime";N;s:7:"endtime";N;s:6:"groups";a:0:{}s:10:"grouplevel";b:0;}'),
('unisetting:0', 'b:0;'),
('unimodules:0:1', 'a:14:{s:5:"basic";a:19:{s:3:"mid";s:1:"1";s:4:"name";s:5:"basic";s:4:"type";s:6:"system";s:5:"title";s:18:"基本文字回复";s:7:"version";s:3:"1.0";s:7:"ability";s:24:"和您进行简单对话";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:4:"news";a:19:{s:3:"mid";s:1:"2";s:4:"name";s:4:"news";s:4:"type";s:6:"system";s:5:"title";s:24:"基本混合图文回复";s:7:"version";s:3:"1.0";s:7:"ability";s:33:"为你提供生动的图文资讯";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"music";a:19:{s:3:"mid";s:1:"3";s:4:"name";s:5:"music";s:4:"type";s:6:"system";s:5:"title";s:18:"基本音乐回复";s:7:"version";s:3:"1.0";s:7:"ability";s:39:"提供语音、音乐等音频类回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:7:"userapi";a:19:{s:3:"mid";s:1:"4";s:4:"name";s:7:"userapi";s:4:"type";s:6:"system";s:5:"title";s:21:"自定义接口回复";s:7:"version";s:3:"1.1";s:7:"ability";s:33:"更方便的第三方接口设置";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:8:"recharge";a:19:{s:3:"mid";s:1:"5";s:4:"name";s:8:"recharge";s:4:"type";s:6:"system";s:5:"title";s:24:"会员中心充值模块";s:7:"version";s:3:"1.0";s:7:"ability";s:24:"提供会员充值功能";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"custom";a:19:{s:3:"mid";s:1:"6";s:4:"name";s:6:"custom";s:4:"type";s:6:"system";s:5:"title";s:15:"多客服转接";s:7:"version";s:5:"1.0.0";s:7:"ability";s:36:"用来接入腾讯的多客服系统";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";a:0:{}s:7:"handles";a:6:{i:0;s:5:"image";i:1;s:5:"voice";i:2;s:5:"video";i:3;s:8:"location";i:4;s:4:"link";i:5;s:4:"text";}s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"images";a:19:{s:3:"mid";s:1:"7";s:4:"name";s:6:"images";s:4:"type";s:6:"system";s:5:"title";s:18:"基本图片回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供图片回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"video";a:19:{s:3:"mid";s:1:"8";s:4:"name";s:5:"video";s:4:"type";s:6:"system";s:5:"title";s:18:"基本视频回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供图片回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"voice";a:19:{s:3:"mid";s:1:"9";s:4:"name";s:5:"voice";s:4:"type";s:6:"system";s:5:"title";s:18:"基本语音回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供语音回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:5:"chats";a:19:{s:3:"mid";s:2:"10";s:4:"name";s:5:"chats";s:4:"type";s:6:"system";s:5:"title";s:18:"发送客服消息";s:7:"version";s:3:"1.0";s:7:"ability";s:77:"公众号可以在粉丝最后发送消息的48小时内无限制发送消息";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:6:"wxcard";a:19:{s:3:"mid";s:2:"11";s:4:"name";s:6:"wxcard";s:4:"type";s:6:"system";s:5:"title";s:18:"微信卡券回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"微信卡券回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:9:"paycenter";a:19:{s:3:"mid";s:2:"12";s:4:"name";s:9:"paycenter";s:4:"type";s:6:"system";s:5:"title";s:9:"收银台";s:7:"version";s:3:"1.0";s:7:"ability";s:9:"收银台";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:11:"ewei_shopv2";a:19:{s:3:"mid";s:2:"15";s:4:"name";s:11:"ewei_shopv2";s:4:"type";s:8:"business";s:5:"title";s:12:"羽月weshop";s:7:"version";s:6:"2.10.3";s:7:"ability";s:87:"羽月weshop(分销),多用户分权，淘宝商品一键转换，多种插件支持。";s:6:"author";s:18:"羽月智能科技";s:3:"url";s:19:"https://www.yyzn.co";s:8:"settings";s:1:"0";s:10:"subscribes";a:14:{i:0;s:4:"text";i:1;s:5:"image";i:2;s:5:"voice";i:3;s:5:"video";i:4;s:10:"shortvideo";i:5;s:8:"location";i:6;s:4:"link";i:7;s:9:"subscribe";i:8;s:11:"unsubscribe";i:9;s:2:"qr";i:10;s:5:"trace";i:11;s:5:"click";i:12;s:4:"view";i:13;s:14:"merchant_order";}s:7:"handles";a:12:{i:0;s:4:"text";i:1;s:5:"image";i:2;s:5:"voice";i:3;s:5:"video";i:4;s:10:"shortvideo";i:5;s:8:"location";i:6;s:4:"link";i:7;s:9:"subscribe";i:8;s:2:"qr";i:9;s:5:"trace";i:10;s:5:"click";i:11;s:14:"merchant_order";}s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:6:"a:0:{}";s:7:"enabled";i:1;s:6:"config";a:0:{}s:9:"isdisplay";i:1;}s:4:"core";a:5:{s:5:"title";s:24:"系统事件处理模块";s:4:"name";s:4:"core";s:8:"issystem";i:1;s:7:"enabled";i:1;s:9:"isdisplay";i:0;}}'),
('ewei_shop_fd1255c56fe21924bc8d60a82c58a461', 'b:0;'),
('usersfields', 'a:45:{s:8:"realname";s:12:"真实姓名";s:8:"nickname";s:6:"昵称";s:6:"avatar";s:6:"头像";s:2:"qq";s:5:"QQ号";s:6:"mobile";s:12:"手机号码";s:3:"vip";s:9:"VIP级别";s:6:"gender";s:6:"性别";s:9:"birthyear";s:12:"出生生日";s:13:"constellation";s:6:"星座";s:6:"zodiac";s:6:"生肖";s:9:"telephone";s:12:"固定电话";s:6:"idcard";s:12:"证件号码";s:9:"studentid";s:6:"学号";s:5:"grade";s:6:"班级";s:7:"address";s:12:"邮寄地址";s:7:"zipcode";s:6:"邮编";s:11:"nationality";s:6:"国籍";s:14:"resideprovince";s:12:"居住地址";s:14:"graduateschool";s:12:"毕业学校";s:7:"company";s:6:"公司";s:9:"education";s:6:"学历";s:10:"occupation";s:6:"职业";s:8:"position";s:6:"职位";s:7:"revenue";s:9:"年收入";s:15:"affectivestatus";s:12:"情感状态";s:10:"lookingfor";s:13:" 交友目的";s:9:"bloodtype";s:6:"血型";s:6:"height";s:6:"身高";s:6:"weight";s:6:"体重";s:6:"alipay";s:15:"支付宝帐号";s:3:"msn";s:3:"MSN";s:5:"email";s:12:"电子邮箱";s:6:"taobao";s:12:"阿里旺旺";s:4:"site";s:6:"主页";s:3:"bio";s:12:"自我介绍";s:8:"interest";s:12:"兴趣爱好";s:7:"uniacid";s:17:"同一公众号id";s:7:"groupid";s:8:"分组id";s:7:"credit1";s:6:"积分";s:7:"credit2";s:6:"余额";s:7:"credit3";s:19:"预留积分类型3";s:7:"credit4";s:19:"预留积分类型4";s:7:"credit5";s:19:"预留积分类型5";s:7:"credit6";s:19:"预留积分类型6";s:10:"createtime";s:12:"加入时间";}');

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_cron`
--

CREATE TABLE IF NOT EXISTS `ims_core_cron` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cloudid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `lastruntime` int(10) unsigned NOT NULL,
  `nextruntime` int(10) unsigned NOT NULL,
  `weekday` tinyint(3) NOT NULL,
  `day` tinyint(3) NOT NULL,
  `hour` tinyint(3) NOT NULL,
  `minute` varchar(255) NOT NULL,
  `extra` varchar(5000) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `createtime` (`createtime`),
  KEY `nextruntime` (`nextruntime`),
  KEY `uniacid` (`uniacid`),
  KEY `cloudid` (`cloudid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_cron_record`
--

CREATE TABLE IF NOT EXISTS `ims_core_cron_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `tid` int(10) unsigned NOT NULL,
  `note` varchar(500) NOT NULL,
  `tag` varchar(5000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `tid` (`tid`),
  KEY `module` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_menu`
--

CREATE TABLE IF NOT EXISTS `ims_core_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL,
  `title` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(60) NOT NULL,
  `append_title` varchar(30) NOT NULL,
  `append_url` varchar(255) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_system` tinyint(3) unsigned NOT NULL,
  `permission_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=94 ;

--
-- 转存表中的数据 `ims_core_menu`
--

INSERT INTO `ims_core_menu` (`id`, `pid`, `title`, `name`, `url`, `append_title`, `append_url`, `displayorder`, `type`, `is_display`, `is_system`, `permission_name`) VALUES
(1, 0, '基础设置', 'platform', '', 'fa fa-cog', '', 0, 'url', 1, 1, ''),
(2, 1, '基本功能', 'platform', '', '', '', 0, 'url', 1, 1, 'platform_basic_function'),
(3, 2, '文字回复', 'platform', './index.php?c=platform&a=reply&m=basic', 'fa fa-plus', './index.php?c=platform&a=reply&do=post&m=basic', 0, 'url', 1, 1, 'platform_reply_basic'),
(4, 2, '图文回复', 'platform', './index.php?c=platform&a=reply&m=news', 'fa fa-plus', './index.php?c=platform&a=reply&do=post&m=news', 0, 'url', 1, 1, 'platform_reply_news'),
(5, 2, '音乐回复', 'platform', './index.php?c=platform&a=reply&m=music', 'fa fa-plus', './index.php?c=platform&a=reply&do=post&m=music', 0, 'url', 1, 1, 'platform_reply_music'),
(6, 2, '图片回复', 'platform', './index.php?c=platform&a=reply&m=images', 'fa fa-plus', './index.php?c=platform&a=reply&do=post&m=images', 0, 'url', 1, 1, 'platform_reply_images'),
(7, 2, '语音回复', 'platform', './index.php?c=platform&a=reply&m=voice', 'fa fa-plus', './index.php?c=platform&a=reply&do=post&m=voice', 0, 'url', 1, 1, 'platform_reply_voice'),
(8, 2, '视频回复', 'platform', './index.php?c=platform&a=reply&m=video', 'fa fa-plus', './index.php?c=platform&a=reply&do=post&m=video', 0, 'url', 1, 1, 'platform_reply_video'),
(9, 2, '微信卡券回复', 'platform', './index.php?c=platform&a=reply&m=wxcard', 'fa fa-plus', './index.php?c=platform&a=reply&do=post&m=wxcard', 0, 'url', 1, 1, 'platform_reply_wxcard'),
(10, 2, '自定义接口回复', 'platform', './index.php?c=platform&a=reply&m=userapi', 'fa fa-plus', './index.php?c=platform&a=reply&do=post&m=userapi', 0, 'url', 1, 1, 'platform_reply_userapi'),
(11, 2, '系统回复', 'platform', './index.php?c=platform&a=special&do=display&', '', '', 0, 'url', 1, 1, 'platform_reply_system'),
(12, 1, '高级功能', 'platform', '', '', '', 0, 'url', 1, 1, 'platform_high_function'),
(13, 12, '常用服务接入', 'platform', './index.php?c=platform&a=service&do=switch&', '', '', 0, 'url', 1, 1, 'platform_service'),
(14, 12, '自定义菜单', 'platform', './index.php?c=platform&a=menu&', '', '', 0, 'url', 1, 1, 'platform_menu'),
(15, 12, '特殊消息回复', 'platform', './index.php?c=platform&a=special&do=message&', '', '', 0, 'url', 1, 1, 'platform_special'),
(16, 12, '二维码管理', 'platform', './index.php?c=platform&a=qr&', '', '', 0, 'url', 1, 1, 'platform_qr'),
(17, 12, '多客服接入', 'platform', './index.php?c=platform&a=reply&m=custom', '', '', 0, 'url', 1, 1, 'platform_reply_custom'),
(18, 12, '长链接二维码', 'platform', './index.php?c=platform&a=url2qr&', '', '', 0, 'url', 1, 1, 'platform_url2qr'),
(19, 1, '数据统计', 'platform', '', '', '', 0, 'url', 1, 1, 'platform_stat'),
(20, 19, '聊天记录', 'platform', './index.php?c=platform&a=stat&do=history&', '', '', 0, 'url', 1, 1, 'platform_stat_history'),
(21, 19, '回复规则使用情况', 'platform', './index.php?c=platform&a=stat&do=rule&', '', '', 0, 'url', 1, 1, 'platform_stat_rule'),
(22, 19, '关键字命中情况', 'platform', './index.php?c=platform&a=stat&do=keyword&', '', '', 0, 'url', 1, 1, 'platform_stat_keyword'),
(23, 19, '参数', 'platform', './index.php?c=platform&a=stat&do=setting&', '', '', 0, 'url', 1, 1, 'platform_stat_setting'),
(24, 0, '微站功能', 'site', '', 'fa fa-life-bouy', '', 0, 'url', 1, 1, ''),
(25, 24, '微站管理', 'site', '', '', '', 0, 'url', 1, 1, 'site_manage'),
(26, 25, '站点管理', 'site', './index.php?c=site&a=multi&do=display&', 'fa fa-plus', './index.php?c=site&a=multi&do=post&', 0, 'url', 1, 1, 'site_multi_display'),
(27, 25, '站点添加/编辑', 'site', '', '', '', 0, 'permission', 0, 1, 'site_multi_post'),
(28, 25, '站点删除', 'site', '', '', '', 0, 'permission', 0, 1, 'site_multi_del'),
(29, 25, '模板管理', 'site', './index.php?c=site&a=style&do=template&', '', '', 0, 'url', 1, 1, 'site_style_template'),
(30, 25, '模块模板扩展', 'site', './index.php?c=site&a=style&do=module&', '', '', 0, 'url', 1, 1, 'site_style_module'),
(31, 24, '特殊页面管理', 'site', '', '', '', 0, 'url', 1, 1, 'site_special_page'),
(32, 31, '会员中心', 'site', './index.php?c=site&a=editor&do=uc&', '', '', 0, 'url', 1, 1, 'site_editor_uc'),
(33, 31, '专题页面', 'site', './index.php?c=site&a=editor&do=page&', 'fa fa-plus', './index.php?c=site&a=editor&do=design&', 0, 'url', 1, 1, 'site_editor_page'),
(34, 24, '功能组件', 'site', '', '', '', 0, 'url', 1, 1, 'site_article'),
(35, 34, '分类设置', 'site', './index.php?c=site&a=category&', '', '', 0, 'url', 1, 1, 'site_category'),
(36, 34, '文章管理', 'site', './index.php?c=site&a=article&', '', '', 0, 'url', 1, 1, 'site_article'),
(37, 0, '粉丝营销', 'mc', '', 'fa fa-gift', '', 0, 'url', 1, 1, ''),
(38, 37, '粉丝管理', 'mc', '', '', '', 0, 'url', 1, 1, 'mc_fans_manage'),
(39, 38, '粉丝分组', 'mc', './index.php?c=mc&a=fangroup&', '', '', 0, 'url', 1, 1, 'mc_fangroup'),
(40, 38, '粉丝', 'mc', './index.php?c=mc&a=fans&', '', '', 0, 'url', 1, 1, 'mc_fans'),
(41, 37, '会员中心', 'mc', '', '', '', 0, 'url', 1, 1, 'mc_members_manage'),
(42, 41, '会员中心关键字', 'mc', './index.php?c=platform&a=cover&do=mc&', '', '', 0, 'url', 1, 1, 'platform_cover_mc'),
(43, 41, '会员', 'mc', './index.php?c=mc&a=member', 'fa fa-plus', './index.php?c=mc&a=member&do=add', 0, 'url', 1, 1, 'mc_member'),
(44, 41, '会员组', 'mc', './index.php?c=mc&a=group&', '', '', 0, 'url', 1, 1, 'mc_group'),
(45, 37, '会员卡管理', 'mc', '', '', '', 0, 'url', 1, 1, 'mc_card_manage'),
(46, 45, '会员卡关键字', 'mc', './index.php?c=platform&a=cover&do=card&', '', '', 0, 'url', 1, 1, 'platform_cover_card'),
(47, 45, '会员卡管理', 'mc', './index.php?c=mc&a=card&do=manage', '', '', 0, 'url', 1, 1, 'mc_card_manage'),
(48, 45, '会员卡设置', 'mc', './index.php?c=mc&a=card&do=editor', '', '', 0, 'url', 1, 1, 'mc_card_editor'),
(49, 45, '会员卡其他功能', 'mc', './index.php?c=mc&a=card&do=other', '', '', 0, 'url', 1, 1, 'mc_card_other'),
(50, 37, '积分兑换', 'mc', '', '', '', 0, 'url', 1, 1, 'activity_discount_manage'),
(51, 50, '折扣券', 'mc', './index.php?c=activity&a=coupon&', '', '', 0, 'url', 1, 1, 'activity_coupon_display'),
(52, 50, '折扣券核销', 'mc', './index.php?c=activity&a=consume&do=display&type=1&status=2', '', '', 0, 'url', 1, 1, 'activity_consume_coupon'),
(53, 50, '代金券', 'mc', './index.php?c=activity&a=token', '', '', 0, 'url', 1, 1, 'activity_token_display'),
(54, 50, '代金券核销', 'mc', './index.php?c=activity&a=consume&do=display&type=2&status=2', '', '', 0, 'url', 1, 1, 'activity_consume_token'),
(55, 50, '真实物品', 'mc', './index.php?c=activity&a=goods', '', '', 0, 'url', 1, 1, 'activity_goods_display'),
(56, 37, '微信素材&群发', 'mc', '', '', '', 0, 'url', 1, 1, 'material_manage'),
(57, 56, '素材&群发', 'mc', './index.php?c=material&a=display', '', '', 0, 'url', 1, 1, 'material_display'),
(58, 56, '定时群发', 'mc', './index.php?c=material&a=mass', '', '', 0, 'url', 1, 1, 'material_mass'),
(59, 37, '微信卡券管理', 'mc', '', '', '', 0, 'url', 1, 1, 'wechat_card_manage'),
(60, 59, '卡券列表', 'mc', './index.php?c=wechat&a=card&do=list', '', '', 0, 'url', 1, 1, 'wechat_card_list'),
(61, 59, '卡券核销', 'mc', './index.php?c=wechat&a=consume', '', '', 0, 'url', 1, 1, 'wechat_consume'),
(62, 59, '测试白名单', 'mc', './index.php?c=wechat&a=white&do=list', '', '', 0, 'url', 1, 1, 'wechat_white_list'),
(63, 37, '门店管理', 'mc', '', '', '', 0, 'url', 1, 1, 'activity_store_manage'),
(64, 63, '门店列表', 'mc', './index.php?c=activity&a=store', '', '', 0, 'url', 1, 1, 'activity_store_list'),
(65, 63, '店员列表', 'mc', './index.php?c=activity&a=clerk', '', '', 0, 'url', 1, 1, 'activity_clerk_list'),
(66, 37, '收银台', 'mc', '', '', '', 0, 'url', 1, 1, 'paycenter_manage'),
(67, 66, '微信刷卡收款', 'mc', './index.php?c=paycenter&a=wxmicro&do=pay', '', '', 0, 'url', 1, 1, 'paycenter_wxmicro_pay'),
(68, 66, '收银台关键字', 'mc', './index.php?c=platform&a=cover&do=clerk', '', '', 0, 'url', 1, 1, 'paycenter_clerk'),
(69, 37, '统计中心', 'mc', '', '', '', 0, 'url', 1, 1, 'stat_center'),
(70, 69, '会员积分统计', 'mc', './index.php?c=stat&a=credit1', '', '', 0, 'url', 1, 1, 'stat_credit1'),
(71, 69, '会员余额统计', 'mc', './index.php?c=stat&a=credit2', '', '', 0, 'url', 1, 1, 'stat_credit2'),
(72, 69, '会员现金消费统计', 'mc', './index.php?c=stat&a=cash', '', '', 0, 'url', 1, 1, 'stat_cash'),
(73, 69, '会员卡统计', 'mc', './index.php?c=stat&a=card', '', '', 0, 'url', 1, 1, 'stat_card'),
(74, 69, '收银台收款统计', 'mc', './index.php?c=stat&a=paycenter', '', '', 0, 'url', 1, 1, 'stat_paycenter'),
(75, 0, '功能选项', 'setting', '', 'fa fa-umbrella', '', 0, 'url', 1, 1, ''),
(76, 75, '公众号选项', 'setting', '', '', '', 0, 'url', 1, 1, 'account_setting'),
(77, 76, '支付参数', 'setting', './index.php?c=profile&a=payment&', '', '', 0, 'url', 1, 1, 'profile_payment'),
(78, 76, '借用 oAuth 权限', 'setting', './index.php?c=mc&a=passport&do=oauth&', '', '', 0, 'url', 1, 1, 'mc_passport_oauth'),
(79, 76, '借用 JS 分享权限', 'setting', './index.php?c=profile&a=jsauth&', '', '', 0, 'url', 1, 1, 'profile_jsauth'),
(80, 76, '会员字段管理', 'setting', './index.php?c=mc&a=fields', '', '', 0, 'url', 1, 1, 'mc_fields'),
(81, 76, '微信通知设置', 'setting', './index.php?c=mc&a=tplnotice', '', '', 0, 'url', 1, 1, 'mc_tplnotice'),
(82, 76, '工作台菜单设置', 'setting', './index.php?c=profile&a=deskmenu', '', '', 0, 'url', 1, 1, 'profile_deskmenu'),
(83, 76, '会员扩展功能', 'setting', './index.php?c=mc&a=plugin', '', '', 0, 'url', 1, 1, 'mc_plugin'),
(84, 75, '会员及粉丝选项', 'setting', '', '', '', 0, 'url', 1, 1, 'mc_setting'),
(85, 84, '积分设置', 'setting', './index.php?c=mc&a=credit&', '', '', 0, 'url', 1, 1, 'mc_credit'),
(86, 84, '注册设置', 'setting', './index.php?c=mc&a=passport&do=passport&', '', '', 0, 'url', 1, 1, 'mc_passport_passport'),
(87, 84, '粉丝同步设置', 'setting', './index.php?c=mc&a=passport&do=sync&', '', '', 0, 'url', 1, 1, 'mc_passport_sync'),
(88, 84, 'UC站点整合', 'setting', './index.php?c=mc&a=uc&', '', '', 0, 'url', 1, 1, 'mc_uc'),
(89, 84, '邮件通知参数', 'setting', './index.php?c=profile&a=notify', '', '', 0, 'url', 1, 1, 'profile_notify'),
(90, 75, '其他功能选项', 'setting', '', '', '', 0, 'url', 1, 1, 'others_setting'),
(91, 0, '扩展功能', 'ext', '', 'fa fa-cubes', '', 0, 'url', 1, 1, ''),
(92, 91, '管理', 'ext', '', '', '', 0, 'url', 1, 1, ''),
(93, 92, '扩展功能管理', 'ext', './index.php?c=profile&a=module&', '', '', 0, 'url', 1, 1, 'profile_module');

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_paylog`
--

CREATE TABLE IF NOT EXISTS `ims_core_paylog` (
  `plid` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `acid` int(10) NOT NULL,
  `openid` varchar(40) NOT NULL,
  `uniontid` varchar(64) NOT NULL,
  `tid` varchar(128) NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `module` varchar(50) NOT NULL,
  `tag` varchar(2000) NOT NULL,
  `is_usecard` tinyint(3) unsigned NOT NULL,
  `card_type` tinyint(3) unsigned NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `card_fee` decimal(10,2) unsigned NOT NULL,
  `encrypt_code` varchar(100) NOT NULL,
  PRIMARY KEY (`plid`),
  KEY `idx_openid` (`openid`),
  KEY `idx_tid` (`tid`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `uniontid` (`uniontid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `ims_core_paylog`
--

INSERT INTO `ims_core_paylog` (`plid`, `type`, `uniacid`, `acid`, `openid`, `uniontid`, `tid`, `fee`, `status`, `module`, `tag`, `is_usecard`, `card_type`, `card_id`, `card_fee`, `encrypt_code`) VALUES
(1, 'wechat', 1, 0, 'xcx_oUSEM5G4GIZQj1KugQlWQY3bQN9w', '', 'SH20180309161458436222', '0.01', 1, 'ewei_shopv2', 'a:1:{s:14:"transaction_id";s:28:"4200000079201803095575959859";}', 0, 0, '', '0.00', ''),
(2, 'wechat', 1, 0, 'xcx_oUSEM5G4GIZQj1KugQlWQY3bQN9w', '', 'SH20180309162009639406', '0.01', 1, 'ewei_shopv2', 'a:1:{s:14:"transaction_id";s:28:"4200000056201803095572489151";}', 0, 0, '', '0.00', ''),
(3, 'wechat', 1, 0, 'xcx_oUSEM5Cwm-VyY0XLfdRScsqEL2G4', '', 'SH20180311195431662655', '0.01', 1, 'ewei_shopv2', 'a:1:{s:14:"transaction_id";s:28:"4200000053201803116963812882";}', 0, 0, '', '0.00', ''),
(4, 'wechat', 1, 0, 'xcx_oUSEM5Cwm-VyY0XLfdRScsqEL2G4', '', 'SH20180311195755891622', '0.01', 1, 'ewei_shopv2', 'a:1:{s:14:"transaction_id";s:28:"4200000052201803116995239904";}', 0, 0, '', '0.00', ''),
(5, 'wechat', 1, 0, 'xcx_oUSEM5Cwm-VyY0XLfdRScsqEL2G4', '', 'SH20180311201142882287', '20.00', 0, 'ewei_shopv2', '', 0, 0, '', '0.00', ''),
(6, 'wechat', 1, 0, 'xcx_oUSEM5Cwm-VyY0XLfdRScsqEL2G4', '', 'SH20180311201408464436', '20.00', 0, 'ewei_shopv2', '', 0, 0, '', '0.00', ''),
(7, 'wechat', 1, 0, 'xcx_oUSEM5Cwm-VyY0XLfdRScsqEL2G4', '', 'SH20180311201449422694', '20.00', 1, 'ewei_shopv2', 'a:1:{s:14:"transaction_id";s:28:"4200000073201803116977236944";}', 0, 0, '', '0.00', ''),
(8, 'wechat', 1, 0, 'xcx_oUSEM5Cwm-VyY0XLfdRScsqEL2G4', '', 'SH20180312150323843758', '0.10', 1, 'ewei_shopv2', 'a:1:{s:14:"transaction_id";s:28:"4200000072201803127389567816";}', 0, 0, '', '0.00', ''),
(9, 'wechat', 1, 0, 'xcx_oUSEM5Cwm-VyY0XLfdRScsqEL2G4', '', 'SH20180312175925624857', '0.01', 1, 'ewei_shopv2', 'a:1:{s:14:"transaction_id";s:28:"4200000077201803127471185648";}', 0, 0, '', '0.00', '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_performance`
--

CREATE TABLE IF NOT EXISTS `ims_core_performance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  `runtime` varchar(10) NOT NULL,
  `runurl` varchar(512) NOT NULL,
  `runsql` varchar(512) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_queue`
--

CREATE TABLE IF NOT EXISTS `ims_core_queue` (
  `qid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `message` varchar(2000) NOT NULL,
  `params` varchar(1000) NOT NULL,
  `keyword` varchar(1000) NOT NULL,
  `response` varchar(2000) NOT NULL,
  `module` varchar(50) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`qid`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `module` (`module`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_resource`
--

CREATE TABLE IF NOT EXISTS `ims_core_resource` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `media_id` varchar(100) NOT NULL,
  `trunk` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `acid` (`uniacid`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_sendsms_log`
--

CREATE TABLE IF NOT EXISTS `ims_core_sendsms_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `result` varchar(255) NOT NULL,
  `createtime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_sessions`
--

CREATE TABLE IF NOT EXISTS `ims_core_sessions` (
  `sid` char(32) NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `data` varchar(5000) NOT NULL,
  `expiretime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_core_sessions`
--

INSERT INTO `ims_core_sessions` (`sid`, `uniacid`, `openid`, `data`, `expiretime`) VALUES
('425994147c76fb6e59f6af049159d3b5', 1, '39.79.101.95', 'acid|s:1:"1";uniacid|i:1;token|a:1:{s:4:"FaWz";i:1520836060;}', 1520839660),
('29d1ffc7086e711a8e0a1a363e2673f5', 1, '39.79.101.95', 'acid|s:1:"1";uniacid|i:1;token|a:1:{s:4:"RPyH";i:1520842184;}', 1520845784),
('02e7237e2464493321ee264d72f414c8', 1, '111.201.151.211', 'acid|s:1:"1";uniacid|i:1;token|a:1:{s:4:"qw7M";i:1520605873;}', 1520609473),
('00732768639c209ef1c109849eee25d9', 1, '223.104.3.207', 'acid|s:1:"1";uniacid|i:1;token|a:1:{s:4:"hOTy";i:1520650974;}', 1520654574),
('7415058f68ce94d163bd29d7bff0bb5f', 1, '111.201.151.211', 'acid|s:1:"1";uniacid|i:1;token|a:1:{s:4:"eTtB";i:1520667205;}', 1520670805),
('dc8d814f283f12b1caf2a0fa813aa336', 1, '114.242.249.100', 'acid|s:1:"1";uniacid|i:1;token|a:1:{s:4:"Z6nd";i:1520768972;}', 1520772572),
('422bbcf49342c4dd84aff7549ac58255', 1, '111.201.144.68', 'acid|s:1:"1";uniacid|i:1;token|a:1:{s:4:"WX16";i:1520835536;}', 1520839136),
('72d94535daf8a073ce630d25f4d3e6c7', 1, '111.201.144.68', 'acid|s:1:"1";uniacid|i:1;token|a:6:{s:4:"keXC";i:1520836049;s:4:"nnzX";i:1520836051;s:4:"UrGs";i:1520836052;s:4:"xA9H";i:1520836053;s:4:"CEqp";i:1520836054;s:4:"Od53";i:1520836062;}openid|s:32:"xcx_oUSEM5Cwm-VyY0XLfdRScsqEL2G4";session_key|s:24:"ZfyE+Tas7C6NNWouKPDMFg==";userid|s:1:"2";author|s:1:"6";', 1520839662),
('22c2b02ab3f03745103bbe19412f65a4', 1, '39.79.101.95', 'acid|s:1:"1";uniacid|i:1;token|a:1:{s:4:"ippM";i:1520583270;}', 1520586870),
('cd2f8b006e81acac9b49018a1b27a51f', 1, '39.79.101.95', 'acid|s:1:"1";uniacid|i:1;token|a:1:{s:4:"RpIZ";i:1520829981;}', 1520833581),
('5121403f6336d8019a1607ebe08fc885', 1, '39.79.101.95', 'acid|s:1:"1";uniacid|i:1;token|a:1:{s:4:"Bct9";i:1520844510;}', 1520848110),
('31ec200c73e6e7703e2205f7092ea32a', 1, '39.79.101.95', 'acid|s:1:"1";uniacid|i:1;token|a:5:{s:4:"OUJu";i:1520842185;s:4:"gIF1";i:1520842185;s:4:"xAa7";i:1520842186;s:4:"jECr";i:1520842187;s:4:"yN6A";i:1520842188;}openid|s:32:"xcx_oUSEM5G4GIZQj1KugQlWQY3bQN9w";session_key|s:24:"mbdWb+JqZNFaFAPMyS5HPA==";userid|s:1:"1";author|s:1:"2";', 1520845788),
('5ab39db1509fa66449b56bd0a876c1fd', 1, '117.136.0.218', 'acid|s:1:"1";uniacid|i:1;token|a:1:{s:4:"VWmW";i:1520848710;}', 1520852310),
('2f02054cad551aa2ae3192f3a0e8ca22', 1, '39.79.101.95', 'acid|s:1:"1";uniacid|i:1;token|a:6:{s:4:"M8vt";i:1520848091;s:4:"gekL";i:1520848093;s:4:"V2Vp";i:1520848129;s:4:"kOlT";i:1520848129;s:4:"xzCW";i:1520848133;s:4:"DU4D";i:1520848133;}openid|s:32:"xcx_oUSEM5G4GIZQj1KugQlWQY3bQN9w";session_key|s:24:"lk6CFC+SOwLIfg4kGgBcqA==";userid|s:1:"1";', 1520851733),
('224619804462fc4ffc0034bbc2568084', 1, '117.136.0.218', 'acid|s:1:"1";uniacid|i:1;token|a:6:{s:4:"OzdH";i:1520848963;s:4:"q9Q0";i:1520848977;s:4:"pmQT";i:1520848980;s:4:"NUqU";i:1520848981;s:4:"zm3J";i:1520848981;s:4:"oYZy";i:1520848986;}openid|s:32:"xcx_oUSEM5Cwm-VyY0XLfdRScsqEL2G4";session_key|s:24:"tkT7RR0xOqBFHxF3+ttG1A==";userid|s:1:"2";author|s:1:"6";', 1520852586),
('7cc39639f416acf71d4381a7a57c3f1c', 1, '111.201.144.68', 'acid|s:1:"1";uniacid|i:1;token|a:2:{s:4:"w9FW";i:1520838899;s:4:"I5nw";i:1520838900;}', 1520842500),
('d519ba010e7ab26aa7b8d5246a883863', 1, '112.224.1.250', 'acid|s:1:"1";uniacid|i:1;token|a:1:{s:4:"PBwR";i:1520854354;}', 1520857954),
('3a00186c4077dc783317f7b9cf77142c', 1, '112.224.1.250', 'acid|s:1:"1";uniacid|i:1;token|a:3:{s:4:"Uas8";i:1520854355;s:4:"I6qx";i:1520854356;s:4:"QfPP";i:1520854356;}openid|s:32:"xcx_oUSEM5KZMuRQoNJt5LkR-v5kGSyY";session_key|s:24:"PkM3G6DznMaQPhiLBEwuxw==";userid|s:1:"7";', 1520857956),
('64c1fc2863452f7d921620fc8b4c3508', 1, '112.224.1.250', 'acid|s:1:"1";uniacid|i:1;token|a:6:{s:4:"c0e2";i:1520854356;s:4:"nxme";i:1520854356;s:4:"DO0L";i:1520854388;s:4:"iDd7";i:1520854388;s:4:"MrZL";i:1520854389;s:4:"Vc9o";i:1520854399;}openid|s:32:"xcx_oUSEM5KZMuRQoNJt5LkR-v5kGSyY";session_key|s:24:"PkM3G6DznMaQPhiLBEwuxw==";userid|s:1:"7";', 1520857999);

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_settings`
--

CREATE TABLE IF NOT EXISTS `ims_core_settings` (
  `key` varchar(200) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_core_settings`
--

INSERT INTO `ims_core_settings` (`key`, `value`) VALUES
('copyright', 'a:24:{s:6:"status";s:1:"0";s:10:"verifycode";s:1:"0";s:6:"reason";s:0:"";s:8:"sitename";s:36:"羽月智能weshop2.0版分销商城";s:3:"url";s:7:"http://";s:8:"statcode";s:0:"";s:10:"footerleft";s:14:"Copyright 2017";s:11:"footerright";s:19:"All Rights Reserved";s:4:"icon";s:0:"";s:5:"flogo";s:0:"";s:6:"slides";s:216:"a:3:{i:0;s:58:"https://img.alicdn.com/tps/TB1pfG4IFXXXXc6XXXXXXXXXXXX.jpg";i:1;s:58:"https://img.alicdn.com/tps/TB1sXGYIFXXXXc5XpXXXXXXXXXX.jpg";i:2;s:58:"https://img.alicdn.com/tps/TB1h9xxIFXXXXbKXXXXXXXXXXXX.jpg";}";s:6:"notice";s:0:"";s:5:"blogo";s:0:"";s:8:"baidumap";a:2:{s:3:"lng";s:0:"";s:3:"lat";s:0:"";}s:7:"company";s:27:"山东省羽月智能科技";s:14:"companyprofile";s:0:"";s:7:"address";s:27:"山东省羽月智能科技";s:6:"person";s:0:"";s:5:"phone";s:12:"020-88888888";s:2:"qq";s:8:"88888888";s:5:"email";s:13:"888888@qq.com";s:8:"keywords";s:36:"羽月智能weshop2.0版分销商城";s:11:"description";s:36:"羽月智能weshop2.0版分销商城";s:12:"showhomepage";i:1;}'),
('authmode', 'i:1;'),
('close', 'a:2:{s:6:"status";s:1:"0";s:6:"reason";s:0:"";}'),
('register', 'a:4:{s:4:"open";i:1;s:6:"verify";i:0;s:4:"code";i:1;s:7:"groupid";i:1;}'),
('module_receive_ban', 'a:0:{}'),
('basic', 'a:1:{s:8:"template";s:7:"default";}');

-- --------------------------------------------------------

--
-- 表的结构 `ims_coupon`
--

CREATE TABLE IF NOT EXISTS `ims_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `type` varchar(15) NOT NULL,
  `logo_url` varchar(150) NOT NULL,
  `code_type` tinyint(3) unsigned NOT NULL,
  `brand_name` varchar(15) NOT NULL,
  `title` varchar(15) NOT NULL,
  `sub_title` varchar(20) NOT NULL,
  `color` varchar(15) NOT NULL,
  `notice` varchar(15) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `date_info` varchar(200) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `use_custom_code` tinyint(3) NOT NULL,
  `bind_openid` tinyint(3) unsigned NOT NULL,
  `can_share` tinyint(3) unsigned NOT NULL,
  `can_give_friend` tinyint(3) unsigned NOT NULL,
  `get_limit` tinyint(3) unsigned NOT NULL,
  `service_phone` varchar(20) NOT NULL,
  `extra` varchar(1000) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_selfconsume` tinyint(3) unsigned NOT NULL,
  `promotion_url_name` varchar(10) NOT NULL,
  `promotion_url` varchar(100) NOT NULL,
  `promotion_url_sub_title` varchar(10) NOT NULL,
  `source` tinyint(3) unsigned NOT NULL,
  `dosage` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_coupon_activity`
--

CREATE TABLE IF NOT EXISTS `ims_coupon_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `msg_id` int(10) NOT NULL,
  `status` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` int(3) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `coupons` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `members` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_coupon_groups`
--

CREATE TABLE IF NOT EXISTS `ims_coupon_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `couponid` varchar(255) NOT NULL,
  `groupid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_coupon_location`
--

CREATE TABLE IF NOT EXISTS `ims_coupon_location` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `sid` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `business_name` varchar(50) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `category` varchar(255) NOT NULL,
  `province` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `district` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `longitude` varchar(15) NOT NULL,
  `latitude` varchar(15) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `photo_list` varchar(10000) NOT NULL,
  `avg_price` int(10) unsigned NOT NULL,
  `open_time` varchar(50) NOT NULL,
  `recommend` varchar(255) NOT NULL,
  `special` varchar(255) NOT NULL,
  `introduction` varchar(255) NOT NULL,
  `offset_type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_coupon_modules`
--

CREATE TABLE IF NOT EXISTS `ims_coupon_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `couponid` int(10) unsigned NOT NULL,
  `module` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `couponid` (`couponid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_coupon_record`
--

CREATE TABLE IF NOT EXISTS `ims_coupon_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `friend_openid` varchar(50) NOT NULL,
  `givebyfriend` tinyint(3) unsigned NOT NULL,
  `code` varchar(50) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  `usetime` int(10) unsigned NOT NULL,
  `status` tinyint(3) NOT NULL,
  `clerk_name` varchar(15) NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL,
  `couponid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `grantmodule` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `card_id` (`card_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_coupon_setting`
--

CREATE TABLE IF NOT EXISTS `ims_coupon_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) NOT NULL,
  `logourl` varchar(150) NOT NULL,
  `whitelist` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_coupon_store`
--

CREATE TABLE IF NOT EXISTS `ims_coupon_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `couponid` varchar(255) NOT NULL,
  `storeid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `couponid` (`couponid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_cover_reply`
--

CREATE TABLE IF NOT EXISTS `ims_cover_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `module` varchar(30) NOT NULL,
  `do` varchar(30) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `ims_cover_reply`
--

INSERT INTO `ims_cover_reply` (`id`, `uniacid`, `multiid`, `rid`, `module`, `do`, `title`, `description`, `thumb`, `url`) VALUES
(1, 1, 0, 7, 'mc', '', '进入个人中心', '', '', './index.php?c=mc&a=home&i=1'),
(2, 1, 1, 8, 'site', '', '进入首页', '', '', './index.php?c=home&i=1&t=1'),
(3, 1, 0, 9, 'ewei_shopv2', '', '', '', '', './index.php?i=1&c=entry&m=ewei_shopv2&do=mobile&r=article.list'),
(4, 1, 0, 10, 'ewei_shopv2', '', '1', '', '', './index.php?i=1&c=entry&m=ewei_shopv2&do=mobile&r=sign.list');

-- --------------------------------------------------------

--
-- 表的结构 `ims_custom_reply`
--

CREATE TABLE IF NOT EXISTS `ims_custom_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `start1` int(10) NOT NULL,
  `end1` int(10) NOT NULL,
  `start2` int(10) NOT NULL,
  `end2` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_message_mass_sign`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_message_mass_sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `openid` varchar(50) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `taskid` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `log` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_message_mass_task`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_message_mass_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `status` tinyint(1) DEFAULT '0',
  `processnum` int(11) DEFAULT '1',
  `sendnum` int(11) DEFAULT '0',
  `messagetype` tinyint(1) DEFAULT '0',
  `templateid` int(11) DEFAULT '0',
  `resptitle` varchar(255) DEFAULT NULL,
  `respthumb` varchar(255) DEFAULT NULL,
  `respdesc` varchar(255) DEFAULT NULL,
  `respurl` varchar(255) DEFAULT NULL,
  `sendlimittype` tinyint(1) DEFAULT '0',
  `send_openid` text,
  `send_level` int(11) DEFAULT NULL,
  `send_group` int(11) DEFAULT NULL,
  `send_agentlevel` int(11) DEFAULT NULL,
  `customertype` tinyint(1) DEFAULT '0',
  `resdesc2` varchar(255) DEFAULT '',
  `pagecount` int(11) DEFAULT '0',
  `successnum` int(11) DEFAULT '0',
  `failnum` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_message_mass_template`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_message_mass_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `template_id` varchar(255) DEFAULT '',
  `first` text NOT NULL,
  `firstcolor` varchar(255) DEFAULT '',
  `data` text NOT NULL,
  `remark` text NOT NULL,
  `remarkcolor` varchar(255) DEFAULT '',
  `url` varchar(255) NOT NULL,
  `createtime` int(11) DEFAULT '0',
  `sendtimes` int(11) DEFAULT '0',
  `sendcount` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_abonus_bill`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_abonus_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `billno` varchar(100) DEFAULT '',
  `paytype` int(11) DEFAULT '0',
  `year` int(11) DEFAULT '0',
  `month` int(11) DEFAULT '0',
  `week` int(11) DEFAULT '0',
  `ordercount` int(11) DEFAULT '0',
  `ordermoney` decimal(10,2) DEFAULT '0.00',
  `paytime` int(11) DEFAULT '0',
  `aagentcount1` int(11) DEFAULT '0',
  `aagentcount2` int(11) DEFAULT '0',
  `aagentcount3` int(11) DEFAULT '0',
  `bonusmoney1` decimal(10,2) DEFAULT '0.00',
  `bonusmoney_send1` decimal(10,2) DEFAULT '0.00',
  `bonusmoney_pay1` decimal(10,2) DEFAULT '0.00',
  `bonusmoney2` decimal(10,2) DEFAULT '0.00',
  `bonusmoney_send2` decimal(10,2) DEFAULT '0.00',
  `bonusmoney_pay2` decimal(10,2) DEFAULT '0.00',
  `bonusmoney3` decimal(10,2) DEFAULT '0.00',
  `bonusmoney_send3` decimal(10,2) DEFAULT '0.00',
  `bonusmoney_pay3` decimal(10,2) DEFAULT '0.00',
  `createtime` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '0',
  `starttime` int(11) DEFAULT '0',
  `endtime` int(11) DEFAULT '0',
  `confirmtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`) USING BTREE,
  KEY `idx_paytype` (`paytype`) USING BTREE,
  KEY `idx_createtime` (`createtime`) USING BTREE,
  KEY `idx_paytime` (`paytime`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE,
  KEY `idx_month` (`month`) USING BTREE,
  KEY `idx_week` (`week`) USING BTREE,
  KEY `idx_year` (`year`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_abonus_billo`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_abonus_billo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `billid` int(11) DEFAULT '0',
  `orderid` int(11) DEFAULT '0',
  `ordermoney` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `idx_billid` (`billid`) USING BTREE,
  KEY `idx_uniacid` (`uniacid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_abonus_billp`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_abonus_billp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `billid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `payno` varchar(255) DEFAULT '',
  `paytype` tinyint(3) DEFAULT '0',
  `bonus1` decimal(10,4) DEFAULT '0.0000',
  `bonus2` decimal(10,4) DEFAULT '0.0000',
  `bonus3` decimal(10,4) DEFAULT '0.0000',
  `money1` decimal(10,2) DEFAULT '0.00',
  `realmoney1` decimal(10,2) DEFAULT '0.00',
  `paymoney1` decimal(10,2) DEFAULT '0.00',
  `money2` decimal(10,2) DEFAULT '0.00',
  `realmoney2` decimal(10,2) DEFAULT '0.00',
  `paymoney2` decimal(10,2) DEFAULT '0.00',
  `money3` decimal(10,2) DEFAULT '0.00',
  `realmoney3` decimal(10,2) DEFAULT '0.00',
  `paymoney3` decimal(10,2) DEFAULT '0.00',
  `chargemoney1` decimal(10,2) DEFAULT '0.00',
  `chargemoney2` decimal(10,2) DEFAULT '0.00',
  `chargemoney3` decimal(10,2) DEFAULT '0.00',
  `charge` decimal(10,2) DEFAULT '0.00',
  `status` tinyint(3) DEFAULT '0',
  `reason` varchar(255) DEFAULT '',
  `paytime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_billid` (`billid`) USING BTREE,
  KEY `idx_uniacid` (`uniacid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_abonus_level`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_abonus_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `levelname` varchar(50) DEFAULT '',
  `bonus1` decimal(10,4) DEFAULT '0.0000',
  `bonus2` decimal(10,4) DEFAULT '0.0000',
  `bonus3` decimal(10,4) DEFAULT '0.0000',
  `ordermoney` decimal(10,2) DEFAULT '0.00',
  `ordercount` int(11) DEFAULT '0',
  `bonusmoney` decimal(10,2) DEFAULT '0.00',
  `downcount` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_adv`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_id` int(5) NOT NULL,
  `uniacid` int(11) DEFAULT '0',
  `advname` varchar(50) DEFAULT '',
  `bgcolor` varchar(20) NOT NULL,
  `link` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '0',
  `shopid` int(11) DEFAULT '0',
  `iswxapp` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_enabled` (`enabled`),
  KEY `idx_displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `ims_ewei_shop_adv`
--

INSERT INTO `ims_ewei_shop_adv` (`id`, `position_id`, `uniacid`, `advname`, `bgcolor`, `link`, `thumb`, `displayorder`, `enabled`, `shopid`, `iswxapp`) VALUES
(9, 13, 1, '幻灯片', '', '', 'images/1/2018/02/PzKsTToO8XW77Yk7GijyGYa67vymjs.jpg', 10, 1, 0, 0),
(13, 18, 1, '小程序', '', '', 'images/1/2017/09/uTWosR7ooa61TA86nm6iAR1o8XKV77.jpg', 10, 1, 0, 0),
(17, 13, 1, '幻灯片2', '', '', 'images/1/2018/03/SOT0SQqctDebdn0JltDINl0DnHANJt.jpg', 0, 1, 0, 0),
(15, 19, 6, '海鲜锅贴宣传', '', '', 'images/6/2017/11/ll0ljFdl9xUD20ZxXtaFHaXJDgHrSg.jpg', 10, 1, 0, 0),
(16, 19, 6, '宣传幻灯片', '', '', 'images/6/2017/11/ll0ljFdl9xUD20ZxXtaFHaXJDgHrSg.jpg', 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_adv_position`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_adv_position` (
  `pid` int(5) NOT NULL AUTO_INCREMENT,
  `position_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `sort_num` int(5) NOT NULL DEFAULT '10',
  `enabled` int(1) NOT NULL DEFAULT '1',
  `size` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '图片尺寸',
  `desc` varchar(250) CHARACTER SET utf8 NOT NULL,
  `uniacid` int(5) NOT NULL DEFAULT '0',
  `is_system` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `ims_ewei_shop_adv_position`
--

INSERT INTO `ims_ewei_shop_adv_position` (`pid`, `position_name`, `sort_num`, `enabled`, `size`, `desc`, `uniacid`, `is_system`) VALUES
(13, '小程序首页', 0, 1, '750*180', '', 1, 1),
(18, '小程序端服务列表页', 0, 1, '720 * 400', '', 1, 0),
(19, '首页幻灯片', 0, 1, '750*400', '', 6, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_area_config`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_area_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `new_area` tinyint(3) NOT NULL DEFAULT '0',
  `address_street` tinyint(3) NOT NULL DEFAULT '0',
  `createtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_article`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_title` varchar(255) NOT NULL DEFAULT '',
  `resp_desc` text NOT NULL,
  `resp_img` text NOT NULL,
  `article_content` longtext,
  `article_category` int(11) NOT NULL DEFAULT '0',
  `article_date_v` varchar(20) NOT NULL DEFAULT '',
  `article_date` varchar(20) NOT NULL DEFAULT '',
  `article_mp` varchar(50) NOT NULL DEFAULT '',
  `article_author` varchar(20) NOT NULL DEFAULT '',
  `article_readnum_v` int(11) NOT NULL DEFAULT '0',
  `article_readnum` int(11) NOT NULL DEFAULT '0',
  `article_likenum_v` int(11) NOT NULL DEFAULT '0',
  `article_likenum` int(11) NOT NULL DEFAULT '0',
  `article_linkurl` varchar(300) NOT NULL DEFAULT '',
  `article_rule_daynum` int(11) NOT NULL DEFAULT '0',
  `article_rule_allnum` int(11) NOT NULL DEFAULT '0',
  `article_rule_credit` int(11) NOT NULL DEFAULT '0',
  `article_rule_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `page_set_option_nocopy` int(1) NOT NULL DEFAULT '0',
  `page_set_option_noshare_tl` int(1) NOT NULL DEFAULT '0',
  `page_set_option_noshare_msg` int(1) NOT NULL DEFAULT '0',
  `article_keyword` varchar(255) NOT NULL DEFAULT '',
  `article_report` int(1) NOT NULL DEFAULT '0',
  `product_advs_type` int(1) NOT NULL DEFAULT '0',
  `product_advs_title` varchar(255) NOT NULL DEFAULT '',
  `product_advs_more` varchar(255) NOT NULL DEFAULT '',
  `product_advs_link` varchar(255) NOT NULL DEFAULT '',
  `product_advs` text NOT NULL,
  `article_state` int(1) NOT NULL DEFAULT '0',
  `network_attachment` varchar(255) DEFAULT '',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `article_rule_credittotal` int(11) DEFAULT '0',
  `article_rule_moneytotal` decimal(10,2) DEFAULT '0.00',
  `article_rule_credit2` int(11) NOT NULL DEFAULT '0',
  `article_rule_money2` decimal(10,2) NOT NULL DEFAULT '0.00',
  `article_rule_creditm` int(11) NOT NULL DEFAULT '0',
  `article_rule_moneym` decimal(10,2) NOT NULL DEFAULT '0.00',
  `article_rule_creditm2` int(11) NOT NULL DEFAULT '0',
  `article_rule_moneym2` decimal(10,2) NOT NULL DEFAULT '0.00',
  `article_readtime` int(11) DEFAULT '0',
  `article_areas` varchar(255) DEFAULT '',
  `article_endtime` int(11) DEFAULT '0',
  `article_hasendtime` tinyint(3) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  `article_keyword2` varchar(255) NOT NULL DEFAULT '',
  `article_advance` int(11) DEFAULT '0',
  `article_virtualadd` tinyint(3) DEFAULT '0',
  `article_visit` tinyint(3) DEFAULT '0',
  `article_visit_level` text,
  `article_visit_tip` varchar(500) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_article_title` (`article_title`),
  KEY `idx_article_content` (`article_content`(10)),
  KEY `idx_article_keyword` (`article_keyword`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='营销文章' AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `ims_ewei_shop_article`
--

INSERT INTO `ims_ewei_shop_article` (`id`, `article_title`, `resp_desc`, `resp_img`, `article_content`, `article_category`, `article_date_v`, `article_date`, `article_mp`, `article_author`, `article_readnum_v`, `article_readnum`, `article_likenum_v`, `article_likenum`, `article_linkurl`, `article_rule_daynum`, `article_rule_allnum`, `article_rule_credit`, `article_rule_money`, `page_set_option_nocopy`, `page_set_option_noshare_tl`, `page_set_option_noshare_msg`, `article_keyword`, `article_report`, `product_advs_type`, `product_advs_title`, `product_advs_more`, `product_advs_link`, `product_advs`, `article_state`, `network_attachment`, `uniacid`, `article_rule_credittotal`, `article_rule_moneytotal`, `article_rule_credit2`, `article_rule_money2`, `article_rule_creditm`, `article_rule_moneym`, `article_rule_creditm2`, `article_rule_moneym2`, `article_readtime`, `article_areas`, `article_endtime`, `article_hasendtime`, `displayorder`, `article_keyword2`, `article_advance`, `article_virtualadd`, `article_visit`, `article_visit_level`, `article_visit_tip`) VALUES
(15, '推广文章测试一', '', '', '<p>推广文章测试一</p>', 12, '2018-01-15', '2018-01-15 15:42:40', '羽月智能科技', '', 0, 0, 0, 0, '', 0, 0, 1, '0.00', 0, 0, 0, '', 0, 0, '', '', '', '[]', 1, '', 1, 200, '0.00', 1, '0.00', 0, '0.00', 0, '0.00', 55, '', 1516002120, 0, 0, '赚积分', 0, 0, 0, 'N;', 'a:2:{s:4:"text";s:0:"";s:4:"link";s:0:"";}');

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_article_category`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_article_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL DEFAULT '',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `displayorder` int(11) NOT NULL DEFAULT '0',
  `isshow` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_category_name` (`category_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='营销表单分类' AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `ims_ewei_shop_article_category`
--

INSERT INTO `ims_ewei_shop_article_category` (`id`, `category_name`, `uniacid`, `displayorder`, `isshow`) VALUES
(12, '文章分类', 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_article_log`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_article_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL DEFAULT '0',
  `read` int(11) NOT NULL DEFAULT '0',
  `like` int(11) NOT NULL DEFAULT '0',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aid` (`aid`),
  KEY `idx_openid` (`openid`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='点赞/阅读记录' AUTO_INCREMENT=621 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_article_report`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_article_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT '0',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `aid` int(11) DEFAULT '0',
  `cate` varchar(255) NOT NULL DEFAULT '',
  `cons` varchar(255) NOT NULL DEFAULT '',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户举报记录' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_article_share`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_article_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL DEFAULT '0',
  `share_user` int(11) NOT NULL DEFAULT '0',
  `click_user` int(11) NOT NULL DEFAULT '0',
  `click_date` varchar(20) NOT NULL DEFAULT '',
  `add_credit` int(11) NOT NULL DEFAULT '0',
  `add_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aid` (`aid`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户分享数据' AUTO_INCREMENT=63 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_article_sys`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_article_sys` (
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `article_message` varchar(255) NOT NULL DEFAULT '',
  `article_title` varchar(255) NOT NULL DEFAULT '',
  `article_image` varchar(300) NOT NULL DEFAULT '',
  `article_shownum` int(11) NOT NULL DEFAULT '0',
  `article_keyword` varchar(255) NOT NULL DEFAULT '',
  `article_temp` int(11) NOT NULL DEFAULT '0',
  `article_source` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`uniacid`),
  KEY `idx_article_message` (`article_message`),
  KEY `idx_article_keyword` (`article_keyword`),
  KEY `idx_article_title` (`article_title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章设置';

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_author_bill`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_author_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `billno` varchar(100) DEFAULT '',
  `paytype` int(11) DEFAULT '0',
  `year` int(11) DEFAULT '0',
  `month` int(11) DEFAULT '0',
  `week` int(11) DEFAULT '0',
  `ordercount` int(11) DEFAULT '0',
  `ordermoney` decimal(10,2) DEFAULT '0.00',
  `bonusordermoney` decimal(10,2) DEFAULT '0.00',
  `bonusrate` decimal(10,2) DEFAULT '0.00',
  `bonusmoney` decimal(10,2) DEFAULT '0.00',
  `bonusmoney_send` decimal(10,2) DEFAULT '0.00',
  `bonusmoney_pay` decimal(10,2) DEFAULT '0.00',
  `paytime` int(11) DEFAULT '0',
  `partnercount` int(11) DEFAULT '0',
  `createtime` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '0',
  `starttime` int(11) DEFAULT '0',
  `endtime` int(11) DEFAULT '0',
  `confirmtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`) USING BTREE,
  KEY `idx_paytype` (`paytype`) USING BTREE,
  KEY `idx_createtime` (`createtime`) USING BTREE,
  KEY `idx_paytime` (`paytime`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE,
  KEY `idx_month` (`month`) USING BTREE,
  KEY `idx_week` (`week`) USING BTREE,
  KEY `idx_year` (`year`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_author_billo`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_author_billo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `billid` int(11) DEFAULT '0',
  `authorid` int(11) DEFAULT NULL,
  `orderid` text,
  `ordermoney` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `idx_billid` (`billid`) USING BTREE,
  KEY `idx_uniacid` (`uniacid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_author_billp`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_author_billp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `billid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `payno` varchar(255) DEFAULT '',
  `paytype` tinyint(3) DEFAULT '0',
  `bonus` decimal(10,2) DEFAULT '0.00',
  `money` decimal(10,2) DEFAULT '0.00',
  `realmoney` decimal(10,2) DEFAULT '0.00',
  `paymoney` decimal(10,2) DEFAULT '0.00',
  `charge` decimal(10,2) DEFAULT '0.00',
  `chargemoney` decimal(10,2) DEFAULT '0.00',
  `status` tinyint(3) DEFAULT '0',
  `reason` varchar(255) DEFAULT '',
  `paytime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_billid` (`billid`) USING BTREE,
  KEY `idx_uniacid` (`uniacid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_author_level`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_author_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `levelname` varchar(50) DEFAULT '',
  `bonus` decimal(10,4) DEFAULT '0.0000',
  `ordermoney` decimal(10,2) DEFAULT '0.00',
  `ordercount` int(11) DEFAULT '0',
  `commissionmoney` decimal(10,2) DEFAULT '0.00',
  `bonusmoney` decimal(10,2) DEFAULT '0.00',
  `downcount` int(11) DEFAULT '0',
  `bonus_fg` varchar(500) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_author_team`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_author_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `teamno` varchar(50) DEFAULT '',
  `year` int(11) DEFAULT '0',
  `month` int(11) DEFAULT '0',
  `team_count` int(11) DEFAULT '0',
  `team_ids` longtext,
  `status` tinyint(1) DEFAULT '0',
  `createtime` int(11) DEFAULT '0',
  `paytime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`) USING BTREE,
  KEY `teamno` (`teamno`) USING BTREE,
  KEY `year` (`year`) USING BTREE,
  KEY `month` (`month`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `createtime` (`createtime`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_author_team_pay`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_author_team_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `teamid` int(11) DEFAULT '0',
  `mid` int(11) DEFAULT '0',
  `payno` varchar(255) DEFAULT '',
  `money` decimal(10,2) DEFAULT '0.00',
  `paymoney` decimal(10,2) DEFAULT '0.00',
  `paytime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`) USING BTREE,
  KEY `idx_teamid` (`teamid`) USING BTREE,
  KEY `idx_mid` (`mid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_banner`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `position_id` int(5) NOT NULL DEFAULT '0',
  `bannername` varchar(50) DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '0',
  `shopid` int(11) DEFAULT '0',
  `iswxapp` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_enabled` (`enabled`),
  KEY `idx_displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `ims_ewei_shop_banner`
--

INSERT INTO `ims_ewei_shop_banner` (`id`, `uniacid`, `position_id`, `bannername`, `link`, `thumb`, `displayorder`, `enabled`, `shopid`, `iswxapp`) VALUES
(4, 1, 16, '广告高', '', '', 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_banner_position`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_banner_position` (
  `pid` int(5) NOT NULL AUTO_INCREMENT,
  `position_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `sort_num` int(5) NOT NULL DEFAULT '10',
  `enabled` int(1) NOT NULL DEFAULT '1',
  `size` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '图片尺寸',
  `desc` varchar(250) CHARACTER SET utf8 NOT NULL,
  `uniacid` int(5) NOT NULL DEFAULT '0',
  `is_system` int(1) NOT NULL DEFAULT '0' COMMENT '系统保护',
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `ims_ewei_shop_banner_position`
--

INSERT INTO `ims_ewei_shop_banner_position` (`pid`, `position_name`, `sort_num`, `enabled`, `size`, `desc`, `uniacid`, `is_system`) VALUES
(16, '小程序首页广告位', 0, 1, '200*200', '', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_bargain_account`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_bargain_account` (
  `id` int(11) NOT NULL,
  `mall_name` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `mall_title` varchar(255) DEFAULT NULL,
  `mall_content` varchar(255) DEFAULT NULL,
  `mall_logo` varchar(255) DEFAULT NULL,
  `message` int(11) DEFAULT '0',
  `partin` int(11) DEFAULT '0',
  `rule` text,
  `end_message` int(11) DEFAULT '0',
  `follow_swi` tinyint(1) NOT NULL DEFAULT '0',
  `sharestyle` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `ims_ewei_shop_bargain_account`
--

INSERT INTO `ims_ewei_shop_bargain_account` (`id`, `mall_name`, `banner`, `mall_title`, `mall_content`, `mall_logo`, `message`, `partin`, `rule`, `end_message`, `follow_swi`, `sharestyle`) VALUES
(1, '砍价商城', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_bargain_actor`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_bargain_actor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `now_price` decimal(9,2) NOT NULL,
  `created_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `bargain_times` int(10) NOT NULL,
  `openid` varchar(50) NOT NULL DEFAULT '',
  `nickname` varchar(20) NOT NULL,
  `head_image` varchar(200) NOT NULL,
  `bargain_price` decimal(9,2) NOT NULL,
  `status` tinyint(2) NOT NULL,
  `account_id` int(11) NOT NULL,
  `initiate` tinyint(4) NOT NULL DEFAULT '0',
  `order` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_bargain_goods`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_bargain_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `goods_id` varchar(20) NOT NULL,
  `end_price` decimal(10,2) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `status` tinyint(2) NOT NULL,
  `type` tinyint(2) NOT NULL,
  `user_set` text,
  `rule` text,
  `act_times` int(11) NOT NULL,
  `mode` tinyint(4) NOT NULL,
  `total_time` int(11) NOT NULL,
  `each_time` int(11) NOT NULL,
  `time_limit` int(11) NOT NULL,
  `probability` text NOT NULL,
  `custom` varchar(255) DEFAULT NULL,
  `maximum` int(11) DEFAULT NULL,
  `initiate` tinyint(4) NOT NULL DEFAULT '0',
  `myself` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_bargain_record`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_bargain_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actor_id` int(11) NOT NULL,
  `bargain_price` decimal(9,2) NOT NULL,
  `openid` varchar(50) NOT NULL DEFAULT '',
  `nickname` varchar(20) NOT NULL,
  `head_image` varchar(200) NOT NULL,
  `bargain_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_brand`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_brand` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `uniacid` int(5) NOT NULL DEFAULT '0',
  `brand_logo` varchar(250) CHARACTER SET utf8 NOT NULL,
  `banner` varchar(250) CHARACTER SET utf8 NOT NULL,
  `wap_thumb` varchar(250) CHARACTER SET utf8 NOT NULL,
  `short_desc` tinytext CHARACTER SET utf8 NOT NULL COMMENT '简短描述',
  `desc` text CHARACTER SET utf8 NOT NULL,
  `displayorder` int(5) NOT NULL DEFAULT '10',
  `enabled` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `ims_ewei_shop_brand`
--

INSERT INTO `ims_ewei_shop_brand` (`id`, `brand_name`, `uniacid`, `brand_logo`, `banner`, `wap_thumb`, `short_desc`, `desc`, `displayorder`, `enabled`) VALUES
(7, '黑马财务', 1, 'images/1/2017/09/md2cBBSDoosPBsBdpts3p3Jp3u2bSB.png', '', '', '黑马财务', '', 100, 1),
(8, '兄弟财务', 1, 'images/1/2017/09/tK2KC3K02CaCukk0CUt2AKc2a01kKC.jpg', '', '', '兄弟财务', '', 10, 1),
(9, '孙氏财务', 1, 'images/1/2017/09/uPXdPENLdPyenTTrdxAx6Iin6xC6iL.jpg', '', '', '孙氏财务', '', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_carrier`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_carrier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `realname` varchar(50) DEFAULT '',
  `mobile` varchar(50) DEFAULT '',
  `address` varchar(255) DEFAULT '',
  `deleted` tinyint(1) DEFAULT '0',
  `createtime` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_deleted` (`deleted`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_case_aucate`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_case_aucate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `displayorder` tinyint(3) unsigned DEFAULT '0',
  `enabled` tinyint(1) DEFAULT '1',
  `advimg` varchar(255) DEFAULT '',
  `advurl` varchar(500) DEFAULT '',
  `isrecommand` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_displayorder` (`displayorder`),
  KEY `idx_enabled` (`enabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ims_ewei_shop_case_aucate`
--

INSERT INTO `ims_ewei_shop_case_aucate` (`id`, `uniacid`, `name`, `thumb`, `displayorder`, `enabled`, `advimg`, `advurl`, `isrecommand`) VALUES
(1, 1, '金牌画家', '', 0, 1, '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_case_author`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_case_author` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uniacid` int(5) NOT NULL DEFAULT '0',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `mid` int(10) NOT NULL DEFAULT '0',
  `cate` int(5) NOT NULL DEFAULT '0',
  `displayorder` int(5) NOT NULL DEFAULT '0',
  `thumb` varchar(250) CHARACTER SET utf8 NOT NULL,
  `desc` text CHARACTER SET utf8 NOT NULL,
  `content` text CHARACTER SET utf8 NOT NULL,
  `mobile` varchar(50) CHARACTER SET utf8 NOT NULL,
  `enabled` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `ims_ewei_shop_case_author`
--

INSERT INTO `ims_ewei_shop_case_author` (`id`, `uniacid`, `name`, `mid`, `cate`, `displayorder`, `thumb`, `desc`, `content`, `mobile`, `enabled`) VALUES
(2, 1, '王文泽', 1, 1, 0, '', '', '', '15678789090', 1),
(6, 1, 'jonny', 2, 1, 0, '', '', '', '', 1),
(4, 1, '画师1', 4, 1, 0, '', '', '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_case_cate`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_case_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `displayorder` tinyint(3) unsigned DEFAULT '0',
  `enabled` tinyint(1) DEFAULT '1',
  `advimg` varchar(255) DEFAULT '',
  `advurl` varchar(500) DEFAULT '',
  `isrecommand` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_displayorder` (`displayorder`),
  KEY `idx_enabled` (`enabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ims_ewei_shop_case_cate`
--

INSERT INTO `ims_ewei_shop_case_cate` (`id`, `uniacid`, `name`, `thumb`, `displayorder`, `enabled`, `advimg`, `advurl`, `isrecommand`) VALUES
(1, 1, '1月', '', 1, 1, '', '', 0),
(2, 1, '2月', '', 50, 1, '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_case_param`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_case_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `proid` int(10) DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `value` text,
  `displayorder` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_goodsid` (`proid`),
  KEY `idx_displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ims_ewei_shop_case_param`
--

INSERT INTO `ims_ewei_shop_case_param` (`id`, `uniacid`, `proid`, `title`, `value`, `displayorder`) VALUES
(1, 1, 1, '尺寸', '200*600', 0),
(2, 1, 4, '参数一', '参数值', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_case_product`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_case_product` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uniacid` int(5) NOT NULL DEFAULT '0',
  `title` varchar(250) CHARACTER SET utf8 NOT NULL,
  `subtitle` varchar(250) CHARACTER SET utf8 NOT NULL,
  `cate` int(5) NOT NULL DEFAULT '0',
  `thumb` varchar(250) CHARACTER SET utf8 NOT NULL,
  `thumbs` text CHARACTER SET utf8 NOT NULL,
  `author` int(8) NOT NULL DEFAULT '0',
  `ishot` int(1) NOT NULL DEFAULT '0',
  `isrecommand` int(1) NOT NULL DEFAULT '0',
  `isnew` int(1) NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL DEFAULT '0',
  `content` text CHARACTER SET utf8 NOT NULL,
  `enabled` int(1) NOT NULL DEFAULT '1',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `displayorder` int(5) NOT NULL DEFAULT '0',
  `desc` tinytext CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `ims_ewei_shop_case_product`
--

INSERT INTO `ims_ewei_shop_case_product` (`id`, `uniacid`, `title`, `subtitle`, `cate`, `thumb`, `thumbs`, `author`, `ishot`, `isrecommand`, `isnew`, `date`, `content`, `enabled`, `createtime`, `displayorder`, `desc`) VALUES
(1, 1, '昨夜星辰恰似你', '', 2, 'images/1/2018/03/SOT0SQqctDebdn0JltDINl0DnHANJt.jpg', 'a:1:{i:0;s:51:"images/1/2018/02/DEU0nvz1vzHxRVN5vv0R0bvZrhX1N7.jpg";}', 2, 0, 1, 0, 1519056000, '&lt;p&gt;范文芳&lt;/p&gt;', 1, 1519105357, 0, '简介'),
(2, 1, '美丽的邂逅', '', 2, 'images/1/2018/02/vw2MlmLOgVVapK0GGMMoPpgaPnurKb.jpg', 'a:1:{i:0;s:51:"images/1/2018/02/DEU0nvz1vzHxRVN5vv0R0bvZrhX1N7.jpg";}', 0, 0, 1, 0, 1519056000, '', 1, 1519105433, 0, '简介'),
(4, 1, '酷玩地带', '', 2, 'images/1/2018/02/gTwY8k2z8A8w9ky3x3S2edVkk8wGVY.jpg', 'a:1:{i:0;s:51:"images/1/2018/02/DEU0nvz1vzHxRVN5vv0R0bvZrhX1N7.jpg";}', 0, 0, 1, 0, 1519056000, '&lt;p&gt;详情&lt;/p&gt;', 1, 1519105680, 0, '简介');

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_cashier_category`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_cashier_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `catename` varchar(255) DEFAULT '',
  `createtime` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_cashier_clearing`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_cashier_clearing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `cashierid` int(11) DEFAULT '0',
  `clearno` varchar(64) DEFAULT '',
  `status` tinyint(3) DEFAULT '0',
  `money` decimal(10,2) DEFAULT '0.00',
  `realmoney` decimal(10,2) DEFAULT '0.00',
  `remark` varchar(500) DEFAULT '',
  `orderids` text,
  `createtime` int(11) DEFAULT '0',
  `paytime` int(11) DEFAULT '0',
  `deleted` tinyint(3) DEFAULT '0',
  `paytype` tinyint(1) DEFAULT '0',
  `payinfo` varchar(1000) DEFAULT '',
  `charge` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`) USING BTREE,
  KEY `storeid` (`cashierid`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `createtime` (`createtime`) USING BTREE,
  KEY `deleted` (`deleted`) USING BTREE,
  KEY `clearno` (`clearno`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_cashier_goods`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_cashier_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `cashierid` int(11) DEFAULT '0',
  `createtime` int(10) unsigned DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `image` varchar(255) DEFAULT '',
  `categoryid` tinyint(1) DEFAULT '0',
  `price` decimal(10,2) DEFAULT '0.00',
  `total` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `goodssn` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`) USING BTREE,
  KEY `cashierid` (`cashierid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_cashier_goods_category`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_cashier_goods_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `cashierid` int(11) DEFAULT '0',
  `catename` varchar(255) DEFAULT '',
  `createtime` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`) USING BTREE,
  KEY `idx_cashierid` (`cashierid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_cashier_operator`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_cashier_operator` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `cashierid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `manageopenid` varchar(50) DEFAULT '',
  `username` varchar(255) DEFAULT '',
  `password` varchar(50) DEFAULT '',
  `salt` varchar(8) DEFAULT '',
  `perm` text,
  `createtime` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`) USING BTREE,
  KEY `cashierid` (`cashierid`) USING BTREE,
  KEY `manageopenid` (`manageopenid`) USING BTREE,
  KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_cashier_order`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_cashier_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `ordersn` varchar(255) DEFAULT '',
  `price` decimal(10,2) DEFAULT '0.00',
  `openid` varchar(50) DEFAULT '',
  `payopenid` varchar(50) DEFAULT '',
  `createtime` int(10) unsigned DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  `paytime` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_cashier_pay_log`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_cashier_pay_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `cashierid` int(11) DEFAULT '0',
  `operatorid` int(11) DEFAULT '0',
  `openid` varchar(50) DEFAULT '',
  `paytype` tinyint(3) DEFAULT NULL,
  `logno` varchar(255) DEFAULT '',
  `title` varchar(255) DEFAULT '',
  `createtime` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `money` decimal(10,2) DEFAULT '0.00',
  `paytime` int(11) DEFAULT '0',
  `is_applypay` tinyint(1) DEFAULT '0',
  `randommoney` decimal(10,2) DEFAULT '0.00',
  `enough` decimal(10,2) DEFAULT '0.00',
  `mobile` varchar(20) DEFAULT '',
  `deduction` decimal(10,2) DEFAULT '0.00',
  `discountmoney` decimal(10,2) DEFAULT '0.00',
  `discount` decimal(5,2) DEFAULT '0.00',
  `isgoods` tinyint(1) DEFAULT '0',
  `orderid` int(11) DEFAULT '0',
  `orderprice` decimal(10,2) DEFAULT '0.00',
  `goodsprice` decimal(10,2) DEFAULT '0.00',
  `couponpay` decimal(10,2) DEFAULT '0.00',
  `payopenid` varchar(50) DEFAULT '',
  `nosalemoney` decimal(10,2) DEFAULT '0.00',
  `coupon` int(11) DEFAULT '0',
  `usecoupon` int(11) DEFAULT '0',
  `usecouponprice` decimal(10,2) DEFAULT '0.00',
  `present_credit1` int(11) DEFAULT '0',
  `refundsn` varchar(50) DEFAULT '',
  `refunduser` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`) USING BTREE,
  KEY `idx_type` (`paytype`) USING BTREE,
  KEY `idx_createtime` (`createtime`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE,
  KEY `idx_storeid` (`cashierid`) USING BTREE,
  KEY `idx_logno` (`logno`) USING BTREE,
  KEY `is_applypay` (`is_applypay`) USING BTREE,
  KEY `orderid` (`orderid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_cashier_pay_log_goods`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_cashier_pay_log_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cashierid` int(11) DEFAULT '0',
  `logid` int(11) DEFAULT '0',
  `goodsid` int(11) DEFAULT '0',
  `price` decimal(10,2) DEFAULT '0.00',
  `total` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `logid` (`logid`) USING BTREE,
  KEY `goodsid` (`goodsid`) USING BTREE,
  KEY `cashierid` (`cashierid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_cashier_qrcode`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_cashier_qrcode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `cashierid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `goodstitle` varchar(255) DEFAULT '',
  `money` decimal(10,2) DEFAULT '0.00',
  `createtime` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`) USING BTREE,
  KEY `cashierid` (`cashierid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_cashier_user`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_cashier_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `storeid` int(11) DEFAULT '0',
  `merchid` int(11) DEFAULT '0',
  `setmeal` tinyint(3) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `logo` varchar(255) DEFAULT '',
  `manageopenid` varchar(50) DEFAULT '',
  `isopen_commission` tinyint(1) DEFAULT '0',
  `name` varchar(50) DEFAULT '',
  `mobile` varchar(50) DEFAULT '',
  `categoryid` int(11) DEFAULT '0',
  `wechat_status` tinyint(1) DEFAULT '0',
  `wechatpay` text,
  `alipay_status` tinyint(1) DEFAULT '0',
  `alipay` text,
  `withdraw` decimal(10,2) DEFAULT '0.00',
  `openid` varchar(50) DEFAULT '',
  `diyformfields` text,
  `diyformdata` text,
  `createtime` int(11) DEFAULT '0',
  `username` varchar(255) DEFAULT '',
  `password` varchar(32) DEFAULT '',
  `salt` char(8) DEFAULT '',
  `lifetimestart` int(10) unsigned DEFAULT '0',
  `lifetimeend` int(10) unsigned DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `set` longtext,
  `deleted` tinyint(1) DEFAULT '0',
  `can_withdraw` tinyint(1) DEFAULT '0',
  `show_paytype` tinyint(1) DEFAULT '0',
  `couponid` varchar(255) DEFAULT '',
  `management` varchar(1000) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`) USING BTREE,
  KEY `openid` (`manageopenid`) USING BTREE,
  KEY `username` (`username`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_category`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `parentid` int(11) DEFAULT '0',
  `isrecommand` int(10) DEFAULT '0',
  `description` varchar(500) DEFAULT NULL,
  `displayorder` tinyint(3) unsigned DEFAULT '0',
  `enabled` tinyint(1) DEFAULT '1',
  `ishome` tinyint(3) DEFAULT '0',
  `advimg` varchar(255) DEFAULT '',
  `advurl` varchar(500) DEFAULT '',
  `level` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_displayorder` (`displayorder`),
  KEY `idx_enabled` (`enabled`),
  KEY `idx_parentid` (`parentid`),
  KEY `idx_isrecommand` (`isrecommand`),
  KEY `idx_ishome` (`ishome`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1192 ;

--
-- 转存表中的数据 `ims_ewei_shop_category`
--

INSERT INTO `ims_ewei_shop_category` (`id`, `uniacid`, `name`, `thumb`, `parentid`, `isrecommand`, `description`, `displayorder`, `enabled`, `ishome`, `advimg`, `advurl`, `level`) VALUES
(1174, 1, '女生', '', 0, 0, '', 10, 1, 0, '', '', 1),
(1175, 1, '男生', '', 0, 0, '', 0, 1, 0, '', '', 1),
(1176, 1, '情侣', '', 0, 0, '', 0, 1, 0, '', '', 1),
(1177, 1, '家庭', '', 0, 0, '', 0, 1, 0, '', '', 1),
(1190, 1, '宠物', '', 0, 0, '', 0, 1, 0, '', '', 1),
(1180, 3, '母婴用品', '', 0, 0, '', 0, 1, 0, '', '', 1),
(1181, 3, '靓丽美妆', '', 0, 0, '', 0, 1, 0, '', '', 1),
(1182, 3, '家居个护', '', 0, 0, '', 0, 1, 0, '', '', 1),
(1183, 6, '招牌菜', '', 0, 0, '', 10, 1, 0, '', '', 1),
(1184, 6, '海鲜鱼类', '', 0, 0, '', 9, 1, 0, '', '', 1),
(1185, 6, '家常菜', '', 0, 0, '', 0, 1, 0, '', '', 1),
(1186, 6, '锅贴', '', 0, 0, '', 0, 1, 0, '', '', 1),
(1187, 6, '凉菜', '', 0, 0, '', 0, 1, 0, '', '', 1),
(1188, 6, '酒水', '', 0, 0, '', 0, 1, 0, '', '', 1),
(1189, 6, '海鲜贝壳类', '', 0, 0, '', 8, 1, 0, '', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_commission_apply`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_commission_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `applyno` varchar(255) DEFAULT '',
  `mid` int(11) DEFAULT '0',
  `type` tinyint(3) DEFAULT '0',
  `orderids` longtext,
  `commission` decimal(10,2) DEFAULT '0.00',
  `commission_pay` decimal(10,2) DEFAULT '0.00',
  `content` text,
  `status` tinyint(3) DEFAULT '0',
  `applytime` int(11) DEFAULT '0',
  `checktime` int(11) DEFAULT '0',
  `paytime` int(11) DEFAULT '0',
  `invalidtime` int(11) DEFAULT '0',
  `refusetime` int(11) DEFAULT '0',
  `realmoney` decimal(10,2) DEFAULT '0.00',
  `charge` decimal(10,2) DEFAULT '0.00',
  `deductionmoney` decimal(10,2) DEFAULT '0.00',
  `beginmoney` decimal(10,2) DEFAULT '0.00',
  `endmoney` decimal(10,2) DEFAULT '0.00',
  `alipay` varchar(50) NOT NULL DEFAULT '',
  `bankname` varchar(50) NOT NULL DEFAULT '',
  `bankcard` varchar(50) NOT NULL DEFAULT '',
  `realname` varchar(50) NOT NULL DEFAULT '',
  `mobile` varchar(50) NOT NULL,
  `repurchase` decimal(10,2) DEFAULT '0.00',
  `alipay1` varchar(50) NOT NULL DEFAULT '',
  `bankname1` varchar(50) NOT NULL DEFAULT '',
  `bankcard1` varchar(50) NOT NULL DEFAULT '',
  `sendmoney` decimal(10,2) DEFAULT '0.00',
  `senddata` text,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_mid` (`mid`),
  KEY `idx_checktime` (`checktime`),
  KEY `idx_paytime` (`paytime`),
  KEY `idx_applytime` (`applytime`),
  KEY `idx_status` (`status`),
  KEY `idx_invalidtime` (`invalidtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=97 ;

--
-- 转存表中的数据 `ims_ewei_shop_commission_apply`
--

INSERT INTO `ims_ewei_shop_commission_apply` (`id`, `uniacid`, `applyno`, `mid`, `type`, `orderids`, `commission`, `commission_pay`, `content`, `status`, `applytime`, `checktime`, `paytime`, `invalidtime`, `refusetime`, `realmoney`, `charge`, `deductionmoney`, `beginmoney`, `endmoney`, `alipay`, `bankname`, `bankcard`, `realname`, `mobile`, `repurchase`, `alipay1`, `bankname1`, `bankcard1`, `sendmoney`, `senddata`) VALUES
(1, 1, 'CA20170909181546148063', 2192, 2, 'a:1:{i:0;a:2:{s:7:"orderid";s:3:"190";s:5:"level";i:1;}}', '50.00', '50.00', NULL, 3, 1504952146, 1504952260, 1504952295, 0, 0, '50.00', '0.00', '0.00', '0.00', '0.00', '978889177@qq.com', '', '', '李大羽', '15604567876', '0.00', '', '', '', '0.00', NULL),
(2, 1, 'CA20170914133938845289', 2192, 0, 'a:2:{i:0;a:2:{s:7:"orderid";s:3:"210";s:5:"level";i:1;}i:1;a:2:{s:7:"orderid";s:3:"212";s:5:"level";i:1;}}', '100.00', '0.00', NULL, -2, 1505367578, 0, 0, 0, 1505368519, '100.00', '0.00', '0.00', '0.00', '0.00', '', '', '', '李大羽', '15604567876', '0.00', '', '', '', '0.00', NULL),
(3, 1, 'CA20170914135008245144', 2192, 0, 'a:1:{i:0;a:2:{s:7:"orderid";s:3:"209";s:5:"level";i:1;}}', '50.00', '0.00', NULL, -2, 1505368208, 0, 0, 0, 1505368464, '50.00', '0.00', '0.00', '0.00', '0.00', '', '', '', '李大羽', '15604567876', '0.00', '', '', '', '0.00', NULL),
(4, 1, 'CA20170914135452113568', 2192, 2, 'a:1:{i:0;a:2:{s:7:"orderid";s:3:"209";s:5:"level";i:1;}}', '50.00', '50.00', NULL, 3, 1505368492, 1505368546, 1505368567, 0, 0, '50.00', '0.00', '0.00', '0.00', '0.00', '978889172@qq.com', '', '', '李大羽', '15604567876', '0.00', '', '', '', '0.00', NULL),
(5, 1, 'CA20170914135711448196', 2192, 2, 'a:2:{i:0;a:2:{s:7:"orderid";s:3:"210";s:5:"level";i:1;}i:1;a:2:{s:7:"orderid";s:3:"212";s:5:"level";i:1;}}', '100.00', '100.00', NULL, 3, 1505368631, 1505368656, 1505368685, 0, 0, '100.00', '0.00', '0.00', '0.00', '0.00', '978889172@qq.com', '', '', '李大羽', '15604567876', '0.00', '', '', '', '0.00', NULL),
(6, 6, 'CA20180112100422666654', 2333, 0, NULL, '5.00', '0.00', NULL, 3, 1515722662, 0, 1515722662, 0, 0, '5.00', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(7, 6, 'CA20180112101349992669', 2310, 0, NULL, '5.00', '0.00', NULL, 3, 1515723229, 0, 1515723229, 0, 0, '5.00', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(8, 6, 'CA20180112101349494306', 2333, 0, NULL, '3.00', '0.00', NULL, 3, 1515723229, 0, 1515723229, 0, 0, '3.00', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(9, 6, 'CA20180112101349992422', 2493, 0, NULL, '2.00', '0.00', NULL, 3, 1515723229, 0, 1515723229, 0, 0, '2.00', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(10, 6, 'CA20180115135408281664', 2493, 0, 'a:1:{i:0;a:2:{s:7:"orderid";s:3:"261";s:5:"level";i:1;}}', '6.30', '0.00', NULL, 3, 1515995648, 0, 1515995648, 0, 0, '6.30', '0.00', '0.00', '0.00', '0.00', '', '', '', '李', '15666677699', '0.00', '', '', '', '0.00', NULL),
(11, 6, 'CA20180115152315756585', 2493, 0, NULL, '10.00', '0.00', NULL, 3, 1516000995, 0, 1516000995, 0, 0, '10.00', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(12, 6, 'CA20180116101831988298', 2577, 0, NULL, '5.00', '0.00', NULL, 3, 1516069111, 0, 1516069111, 0, 0, '5.00', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(13, 6, 'CA20180116102351877814', 2333, 0, NULL, '31.70', '0.00', NULL, 3, 1516069431, 0, 1516069431, 0, 0, '31.70', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(14, 6, 'CA20180116122638242670', 2585, 0, NULL, '0.35', '0.00', NULL, 3, 1516076798, 0, 1516076798, 0, 0, '0.35', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(15, 6, 'CA20180116142827507994', 2582, 0, NULL, '5.00', '0.00', NULL, 3, 1516084107, 0, 1516084107, 0, 0, '5.00', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(16, 6, 'CA20180116143010868499', 2582, 0, NULL, '5.00', '0.00', NULL, 3, 1516084210, 0, 1516084210, 0, 0, '5.00', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(17, 6, 'CA20180116145617656332', 2582, 0, NULL, '5.00', '0.00', NULL, 3, 1516085777, 0, 1516085777, 0, 0, '5.00', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(18, 6, 'CA20180117132630683425', 2379, 0, NULL, '5.00', '0.00', NULL, 3, 1516166790, 0, 1516166790, 0, 0, '5.00', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(19, 6, 'CA20180117132807668564', 2379, 0, NULL, '5.00', '0.00', NULL, 3, 1516166887, 0, 1516166887, 0, 0, '5.00', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(20, 6, 'CA20180117142943460667', 2392, 0, NULL, '5.00', '0.00', NULL, 3, 1516170583, 0, 1516170583, 0, 0, '5.00', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(21, 6, 'CA20180118121848472804', 2622, 0, NULL, '2.50', '0.00', NULL, 3, 1516249128, 0, 1516249128, 0, 0, '2.50', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(22, 6, 'CA20180119200702622107', 2641, 0, NULL, '8.65', '0.00', NULL, 3, 1516363622, 0, 1516363622, 0, 0, '8.65', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(23, 6, 'CA20180120111852483802', 2647, 0, NULL, '31.65', '0.00', NULL, 3, 1516418332, 0, 1516418332, 0, 0, '31.65', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(24, 6, 'CA20180120122128815026', 2649, 0, NULL, '1.90', '0.00', NULL, 3, 1516422088, 0, 1516422088, 0, 0, '1.90', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(25, 6, 'CA20180120123040220802', 2651, 0, NULL, '14.10', '0.00', NULL, 3, 1516422640, 0, 1516422640, 0, 0, '14.10', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(26, 6, 'CA20180120134912461455', 2653, 0, NULL, '10.50', '0.00', NULL, 3, 1516427352, 0, 1516427352, 0, 0, '10.50', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(27, 6, 'CA20180120142926831267', 2649, 0, NULL, '8.65', '0.00', NULL, 3, 1516429766, 0, 1516429766, 0, 0, '8.65', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(28, 6, 'CA20180121201452747244', 2673, 0, NULL, '22.40', '0.00', NULL, 3, 1516536892, 0, 1516536892, 0, 0, '22.40', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(29, 6, 'CA20180122112646238724', 2675, 0, NULL, '2.80', '0.00', NULL, 3, 1516591606, 0, 1516591606, 0, 0, '2.80', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(30, 6, 'CA20180122153005226290', 2693, 0, NULL, '12.85', '0.00', NULL, 3, 1516606205, 0, 1516606205, 0, 0, '12.85', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(31, 6, 'CA20180123192325944426', 2758, 0, NULL, '17.65', '0.00', NULL, 3, 1516706605, 0, 1516706605, 0, 0, '17.65', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(32, 6, 'CA20180123212330321841', 2760, 0, NULL, '7.20', '0.00', NULL, 3, 1516713810, 0, 1516713810, 0, 0, '7.20', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(33, 6, 'CA20180124112631036819', 2768, 0, NULL, '9.20', '0.00', NULL, 3, 1516764391, 0, 1516764391, 0, 0, '9.20', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(34, 6, 'CA20180125120448781200', 2585, 0, NULL, '0.40', '0.00', NULL, 3, 1516853088, 0, 1516853088, 0, 0, '0.40', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(35, 6, 'CA20180125191221099328', 2801, 0, NULL, '16.55', '0.00', NULL, 3, 1516878741, 0, 1516878741, 0, 0, '16.55', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(36, 6, 'CA20180126182617204766', 2801, 0, NULL, '73.50', '0.00', NULL, 3, 1516962377, 0, 1516962377, 0, 0, '73.50', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(37, 6, 'CA20180126201055276212', 2821, 0, NULL, '19.95', '0.00', NULL, 3, 1516968655, 0, 1516968655, 0, 0, '19.95', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(38, 6, 'CA20180127180257686621', 2801, 0, NULL, '70.45', '0.00', NULL, 3, 1517047377, 0, 1517047377, 0, 0, '70.45', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(39, 6, 'CA20180128140137660185', 2801, 0, NULL, '41.75', '0.00', NULL, 3, 1517119297, 0, 1517119297, 0, 0, '41.75', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(40, 6, 'CA20180129112135384684', 2857, 0, NULL, '33.65', '0.00', NULL, 3, 1517196095, 0, 1517196095, 0, 0, '33.65', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(41, 6, 'CA20180129120410827618', 2859, 0, NULL, '0.40', '0.00', NULL, 3, 1517198650, 0, 1517198650, 0, 0, '0.40', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(42, 6, 'CA20180129125434734281', 2857, 0, NULL, '17.25', '0.00', NULL, 3, 1517201674, 0, 1517201674, 0, 0, '17.25', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(43, 6, 'CA20180129193807288292', 2864, 0, NULL, '9.40', '0.00', NULL, 3, 1517225887, 0, 1517225887, 0, 0, '9.40', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(44, 6, 'CA20180130121145789846', 2649, 0, NULL, '0.55', '0.00', NULL, 3, 1517285505, 0, 1517285505, 0, 0, '0.55', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(45, 6, 'CA20180130140822442921', 2874, 0, NULL, '25.00', '0.00', NULL, 3, 1517292502, 0, 1517292502, 0, 0, '25.00', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(46, 6, 'CA20180131124038969825', 2622, 0, NULL, '0.60', '0.00', NULL, 3, 1517373638, 0, 1517373638, 0, 0, '0.60', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(47, 6, 'CA20180131124750828890', 2882, 0, NULL, '5.95', '0.00', NULL, 3, 1517374070, 0, 1517374070, 0, 0, '5.95', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(48, 6, 'CA20180131135439852140', 2884, 0, NULL, '15.60', '0.00', NULL, 3, 1517378079, 0, 1517378079, 0, 0, '15.60', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(49, 6, 'CA20180131173848820661', 2886, 0, NULL, '1.50', '0.00', NULL, 3, 1517391528, 0, 1517391528, 0, 0, '1.50', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(50, 6, 'CA20180131175254129149', 2593, 0, NULL, '47.05', '0.00', NULL, 3, 1517392374, 0, 1517392374, 0, 0, '47.05', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(51, 6, 'CA20180131182644840224', 2593, 0, NULL, '3.40', '0.00', NULL, 3, 1517394404, 0, 1517394404, 0, 0, '3.40', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(52, 6, 'CA20180131190612678621', 2887, 0, NULL, '4.35', '0.00', NULL, 3, 1517396772, 0, 1517396772, 0, 0, '4.35', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(53, 6, 'CA20180131193352824488', 2889, 0, NULL, '20.15', '0.00', NULL, 3, 1517398432, 0, 1517398432, 0, 0, '20.15', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(54, 6, 'CA20180131195314806648', 2890, 0, NULL, '18.25', '0.00', NULL, 3, 1517399594, 0, 1517399594, 0, 0, '18.25', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(55, 6, 'CA20180131212022248253', 2893, 0, NULL, '20.00', '0.00', NULL, 3, 1517404822, 0, 1517404822, 0, 0, '20.00', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(56, 6, 'CA20180201124912383416', 2895, 0, NULL, '4.00', '0.00', NULL, 3, 1517460552, 0, 1517460552, 0, 0, '4.00', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(57, 6, 'CA20180201130918186488', 2897, 0, NULL, '14.40', '0.00', NULL, 3, 1517461758, 0, 1517461758, 0, 0, '14.40', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(58, 6, 'CA20180201133414429837', 2898, 0, NULL, '10.60', '0.00', NULL, 3, 1517463254, 0, 1517463254, 0, 0, '10.60', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(59, 6, 'CA20180201194344116845', 2903, 0, NULL, '16.95', '0.00', NULL, 3, 1517485424, 0, 1517485424, 0, 0, '16.95', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(60, 6, 'CA20180202120101448802', 2886, 0, NULL, '1.75', '0.00', NULL, 3, 1517544061, 0, 1517544061, 0, 0, '1.75', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(61, 6, 'CA20180202132713614946', 2907, 0, NULL, '7.05', '0.00', NULL, 3, 1517549233, 0, 1517549233, 0, 0, '7.05', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(62, 6, 'CA20180202185239648866', 2912, 0, NULL, '3.00', '0.00', NULL, 3, 1517568759, 0, 1517568759, 0, 0, '3.00', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(63, 6, 'CA20180203143314082621', 2874, 0, NULL, '38.50', '0.00', NULL, 3, 1517639594, 0, 1517639594, 0, 0, '38.50', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(64, 6, 'CA20180203201446056358', 2923, 0, NULL, '9.35', '0.00', NULL, 3, 1517660086, 0, 1517660086, 0, 0, '9.35', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(65, 6, 'CA20180204194312661404', 2666, 0, NULL, '6.20', '0.00', NULL, 3, 1517744592, 0, 1517744592, 0, 0, '6.20', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(66, 6, 'CA20180204212629623248', 2937, 0, NULL, '23.85', '0.00', NULL, 3, 1517750789, 0, 1517750789, 0, 0, '23.85', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(67, 6, 'CA20180205175809844880', 2943, 0, NULL, '6.10', '0.00', NULL, 3, 1517824689, 0, 1517824689, 0, 0, '6.10', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(68, 6, 'CA20180205194513482713', 2946, 0, NULL, '13.20', '0.00', NULL, 3, 1517831113, 0, 1517831113, 0, 0, '13.20', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(69, 6, 'CA20180205211302463127', 2949, 0, NULL, '26.00', '0.00', NULL, 3, 1517836382, 0, 1517836382, 0, 0, '26.00', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(70, 6, 'CA20180206185955468383', 2956, 0, NULL, '31.80', '0.00', NULL, 3, 1517914795, 0, 1517914795, 0, 0, '31.80', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(71, 6, 'CA20180206195940332728', 2666, 0, NULL, '8.75', '0.00', NULL, 3, 1517918380, 0, 1517918380, 0, 0, '8.75', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(72, 6, 'CA20180207214121065266', 2972, 0, NULL, '17.75', '0.00', NULL, 3, 1518010881, 0, 1518010881, 0, 0, '17.75', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(73, 6, 'CA20180208114622585867', 2975, 0, NULL, '8.90', '0.00', NULL, 3, 1518061582, 0, 1518061582, 0, 0, '8.90', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(74, 6, 'CA20180208184145659866', 2976, 0, NULL, '3.05', '0.00', NULL, 3, 1518086505, 0, 1518086505, 0, 0, '3.05', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(75, 6, 'CA20180208193006464486', 2783, 0, NULL, '9.95', '0.00', NULL, 3, 1518089406, 0, 1518089406, 0, 0, '9.95', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(76, 6, 'CA20180208201052484034', 2978, 0, NULL, '15.95', '0.00', NULL, 3, 1518091852, 0, 1518091852, 0, 0, '15.95', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(77, 6, 'CA20180209115057122280', 2984, 0, NULL, '11.05', '0.00', NULL, 3, 1518148257, 0, 1518148257, 0, 0, '11.05', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(78, 6, 'CA20180209125425796868', 2988, 0, NULL, '19.35', '0.00', NULL, 3, 1518152065, 0, 1518152065, 0, 0, '19.35', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(79, 6, 'CA20180209125513246814', 2990, 0, NULL, '5.85', '0.00', NULL, 3, 1518152113, 0, 1518152113, 0, 0, '5.85', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(80, 6, 'CA20180209200234434656', 2821, 0, NULL, '26.30', '0.00', NULL, 3, 1518177754, 0, 1518177754, 0, 0, '26.30', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(81, 6, 'CA20180210132618744826', 2666, 0, NULL, '8.80', '0.00', NULL, 3, 1518240378, 0, 1518240378, 0, 0, '8.80', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(82, 6, 'CA20180210133601212886', 2996, 0, NULL, '7.10', '0.00', NULL, 3, 1518240961, 0, 1518240961, 0, 0, '7.10', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(83, 6, 'CA20180210182221261609', 2903, 0, NULL, '9.00', '0.00', NULL, 3, 1518258141, 0, 1518258141, 0, 0, '9.00', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(84, 6, 'CA20180210200609774148', 2999, 0, NULL, '14.75', '0.00', NULL, 3, 1518264369, 0, 1518264369, 0, 0, '14.75', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(85, 6, 'CA20180211113856862888', 3001, 0, NULL, '8.25', '0.00', NULL, 3, 1518320336, 0, 1518320336, 0, 0, '8.25', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(86, 6, 'CA20180211121927626246', 3002, 0, NULL, '2.50', '0.00', NULL, 3, 1518322767, 0, 1518322767, 0, 0, '2.50', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(87, 6, 'CA20180211195646504964', 3005, 0, NULL, '14.40', '0.00', NULL, 3, 1518350206, 0, 1518350206, 0, 0, '14.40', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(88, 6, 'CA20180212134226666622', 2889, 0, NULL, '33.05', '0.00', NULL, 3, 1518414146, 0, 1518414146, 0, 0, '33.05', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(89, 6, 'CA20180212144317497242', 3011, 0, NULL, '28.65', '0.00', NULL, 3, 1518417797, 0, 1518417797, 0, 0, '28.65', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(90, 6, 'CA20180212174924824046', 3012, 0, NULL, '8.15', '0.00', NULL, 3, 1518428964, 0, 1518428964, 0, 0, '8.15', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(91, 6, 'CA20180212190716608283', 2912, 0, NULL, '0.65', '0.00', NULL, 3, 1518433636, 0, 1518433636, 0, 0, '0.65', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(92, 6, 'CA20180212193546838824', 3014, 0, NULL, '35.00', '0.00', NULL, 3, 1518435346, 0, 1518435346, 0, 0, '35.00', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(93, 6, 'CA20180212202945764363', 3015, 0, NULL, '8.70', '0.00', NULL, 3, 1518438585, 0, 1518438585, 0, 0, '8.70', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(94, 6, 'CA20180212204632662969', 3016, 0, NULL, '20.05', '0.00', NULL, 3, 1518439592, 0, 1518439592, 0, 0, '20.05', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(95, 6, 'CA20180212212702808681', 2890, 0, NULL, '26.80', '0.00', NULL, 3, 1518442022, 0, 1518442022, 0, 0, '26.80', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL),
(96, 6, 'CA20180212214745066964', 3017, 0, NULL, '10.95', '0.00', NULL, 3, 1518443265, 0, 1518443265, 0, 0, '10.95', '0.00', '0.00', '0.00', '0.00', '', '', '', '', '', '0.00', '', '', '', '0.00', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_commission_bank`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_commission_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `bankname` varchar(255) NOT NULL DEFAULT '',
  `content` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_commission_clickcount`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_commission_clickcount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `from_openid` varchar(255) DEFAULT '',
  `clicktime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_openid` (`openid`),
  KEY `idx_from_openid` (`from_openid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=301 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_commission_level`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_commission_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `levelname` varchar(50) DEFAULT '',
  `commission1` decimal(10,2) DEFAULT '0.00',
  `commission2` decimal(10,2) DEFAULT '0.00',
  `commission3` decimal(10,2) DEFAULT '0.00',
  `commissionmoney` decimal(10,2) DEFAULT '0.00',
  `ordermoney` decimal(10,2) DEFAULT '0.00',
  `downcount` varchar(255) DEFAULT '',
  `ordercount` int(11) DEFAULT '0',
  `withdraw` decimal(10,2) DEFAULT '0.00',
  `repurchase` decimal(10,2) DEFAULT '0.00',
  `goodsids` varchar(1000) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_commission_log`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_commission_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `applyid` int(11) DEFAULT '0',
  `mid` int(11) DEFAULT '0',
  `commission` decimal(10,2) DEFAULT '0.00',
  `createtime` int(11) DEFAULT '0',
  `commission_pay` decimal(10,2) DEFAULT '0.00',
  `realmoney` decimal(10,2) DEFAULT '0.00',
  `charge` decimal(10,2) DEFAULT '0.00',
  `deductionmoney` decimal(10,2) DEFAULT '0.00',
  `type` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_applyid` (`applyid`),
  KEY `idx_mid` (`mid`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ims_ewei_shop_commission_log`
--

INSERT INTO `ims_ewei_shop_commission_log` (`id`, `uniacid`, `applyid`, `mid`, `commission`, `createtime`, `commission_pay`, `realmoney`, `charge`, `deductionmoney`, `type`) VALUES
(1, 1, 1, 2192, '50.00', 1504952295, '50.00', '50.00', '0.00', '0.00', 2),
(2, 1, 4, 2192, '50.00', 1505368567, '50.00', '50.00', '0.00', '0.00', 2),
(3, 1, 5, 2192, '100.00', 1505368685, '100.00', '100.00', '0.00', '0.00', 2);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_commission_rank`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_commission_rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_commission_repurchase`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_commission_repurchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `openid` varchar(50) DEFAULT '',
  `year` int(4) DEFAULT '0',
  `month` tinyint(2) DEFAULT '0',
  `repurchase` decimal(10,2) DEFAULT '0.00',
  `applyid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `applyid` (`applyid`),
  KEY `openid` (`openid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_commission_shop`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_commission_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `mid` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT '',
  `logo` varchar(255) DEFAULT '',
  `img` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT '',
  `selectgoods` tinyint(3) DEFAULT '0',
  `selectcategory` tinyint(3) DEFAULT '0',
  `goodsids` text,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_mid` (`mid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_coupon`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `catid` int(11) DEFAULT '0',
  `couponname` varchar(255) DEFAULT '',
  `gettype` tinyint(3) DEFAULT '0',
  `getmax` int(11) DEFAULT '0',
  `usetype` tinyint(3) DEFAULT '0',
  `returntype` tinyint(3) DEFAULT '0',
  `bgcolor` varchar(255) DEFAULT '',
  `enough` decimal(10,2) DEFAULT '0.00',
  `timelimit` tinyint(3) DEFAULT '0',
  `coupontype` tinyint(3) DEFAULT '0',
  `timedays` int(11) DEFAULT '0',
  `timestart` int(11) DEFAULT '0',
  `timeend` int(11) DEFAULT '0',
  `discount` decimal(10,2) DEFAULT '0.00',
  `deduct` decimal(10,2) DEFAULT '0.00',
  `backtype` tinyint(3) DEFAULT '0',
  `backmoney` varchar(50) DEFAULT '',
  `backcredit` varchar(50) DEFAULT '',
  `backredpack` varchar(50) DEFAULT '',
  `backwhen` tinyint(3) DEFAULT '0',
  `thumb` varchar(255) DEFAULT '',
  `desc` text,
  `createtime` int(11) DEFAULT '0',
  `total` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '0',
  `money` decimal(10,2) DEFAULT '0.00',
  `respdesc` text,
  `respthumb` varchar(255) DEFAULT '',
  `resptitle` varchar(255) DEFAULT '',
  `respurl` varchar(255) DEFAULT '',
  `credit` int(11) DEFAULT '0',
  `usecredit2` tinyint(3) DEFAULT '0',
  `remark` varchar(1000) DEFAULT '',
  `descnoset` tinyint(3) DEFAULT '0',
  `pwdkey` varchar(255) DEFAULT '',
  `pwdsuc` text,
  `pwdfail` text,
  `pwdurl` varchar(255) DEFAULT '',
  `pwdask` text,
  `pwdstatus` tinyint(3) DEFAULT '0',
  `pwdtimes` int(11) DEFAULT '0',
  `pwdfull` text,
  `pwdwords` text,
  `pwdopen` tinyint(3) DEFAULT '0',
  `pwdown` text,
  `pwdexit` varchar(255) DEFAULT '',
  `pwdexitstr` text,
  `displayorder` int(11) DEFAULT '0',
  `pwdkey2` varchar(255) DEFAULT '',
  `merchid` int(11) DEFAULT '0',
  `limitgoodtype` tinyint(1) DEFAULT '0',
  `limitgoodcatetype` tinyint(1) DEFAULT '0',
  `limitgoodcateids` varchar(500) DEFAULT '',
  `limitgoodids` varchar(500) DEFAULT '',
  `islimitlevel` tinyint(1) DEFAULT '0',
  `limitmemberlevels` varchar(500) DEFAULT '',
  `limitagentlevels` varchar(500) DEFAULT '',
  `limitpartnerlevels` varchar(500) DEFAULT '',
  `limitaagentlevels` varchar(500) DEFAULT '',
  `tagtitle` varchar(20) DEFAULT '',
  `settitlecolor` tinyint(1) DEFAULT '0',
  `titlecolor` varchar(10) DEFAULT '',
  `limitdiscounttype` tinyint(1) DEFAULT '1',
  `quickget` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_coupontype` (`coupontype`),
  KEY `idx_timestart` (`timestart`),
  KEY `idx_timeend` (`timeend`),
  KEY `idx_timelimit` (`timelimit`),
  KEY `idx_status` (`status`),
  KEY `idx_givetype` (`backtype`),
  KEY `idx_catid` (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `ims_ewei_shop_coupon`
--

INSERT INTO `ims_ewei_shop_coupon` (`id`, `uniacid`, `catid`, `couponname`, `gettype`, `getmax`, `usetype`, `returntype`, `bgcolor`, `enough`, `timelimit`, `coupontype`, `timedays`, `timestart`, `timeend`, `discount`, `deduct`, `backtype`, `backmoney`, `backcredit`, `backredpack`, `backwhen`, `thumb`, `desc`, `createtime`, `total`, `status`, `money`, `respdesc`, `respthumb`, `resptitle`, `respurl`, `credit`, `usecredit2`, `remark`, `descnoset`, `pwdkey`, `pwdsuc`, `pwdfail`, `pwdurl`, `pwdask`, `pwdstatus`, `pwdtimes`, `pwdfull`, `pwdwords`, `pwdopen`, `pwdown`, `pwdexit`, `pwdexitstr`, `displayorder`, `pwdkey2`, `merchid`, `limitgoodtype`, `limitgoodcatetype`, `limitgoodcateids`, `limitgoodids`, `islimitlevel`, `limitmemberlevels`, `limitagentlevels`, `limitpartnerlevels`, `limitaagentlevels`, `tagtitle`, `settitlecolor`, `titlecolor`, `limitdiscounttype`, `quickget`) VALUES
(6, 1, 6, '满200减50', 1, 1, 0, 0, '', '200.00', 0, 0, 100, 1506096000, 1506787199, '0.00', '50.00', 0, '', '', '', 0, '', '<p>只能使用一次</p>', 1506172807, -1, 0, '0.00', '', '', '', '', 0, 0, '', 0, '', '', '', '', '', 0, 0, '', '', 0, '', '', '', 0, '', 0, 1, 1, '1174', '205', 0, '', '', '', '', '满200减50', 1, '#000000', 3, 0),
(7, 6, 7, '订餐满128元减16元', 1, 1, 0, 0, '', '128.00', 0, 0, 0, 1511539200, 1512230399, '0.00', '16.00', 0, '', '', '', 0, 'images/6/2017/11/Zf6noWvMsOofz3mB10v1HHB31rtL3o.png', '', 1511607771, -1, 0, '0.00', '', '', '', '', 0, 0, '', 0, '', '', '', '', '', 0, 0, '', '', 0, '', '', '', 50, '', 0, 0, 0, '', '', 0, '', '', '', '', '', 0, '#000000', 3, 0),
(8, 6, 7, '订餐满68元减6元', 1, 1, 0, 0, '', '68.00', 0, 0, 0, 1511539200, 1512230399, '0.00', '6.00', 0, '', '', '', 0, 'images/6/2017/11/VAOVZoff5SFTw3RgoaTgoRTxGLr79Z.png', '', 1511607869, -1, 0, '0.00', '', '', '', '', 0, 0, '', 0, '', '', '', '', '', 0, 0, '', '', 0, '', '', '', 40, '', 0, 0, 0, '', '', 0, '', '', '', '', '', 0, '#000000', 3, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_coupon_category`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_coupon_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `merchid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_displayorder` (`displayorder`),
  KEY `idx_status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_coupon_data`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_coupon_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `couponid` int(11) DEFAULT '0',
  `gettype` tinyint(3) DEFAULT '0',
  `used` int(11) DEFAULT '0',
  `usetime` int(11) DEFAULT '0',
  `gettime` int(11) DEFAULT '0',
  `senduid` int(11) DEFAULT '0',
  `ordersn` varchar(255) DEFAULT '',
  `back` tinyint(3) DEFAULT '0',
  `backtime` int(11) DEFAULT '0',
  `merchid` int(11) DEFAULT '0',
  `isnew` tinyint(1) DEFAULT '1',
  `nocount` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_couponid` (`couponid`),
  KEY `idx_gettype` (`gettype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_coupon_goodsendtask`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_coupon_goodsendtask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `goodsid` int(11) DEFAULT '0',
  `couponid` int(11) DEFAULT '0',
  `starttime` int(11) DEFAULT '0',
  `endtime` int(11) DEFAULT '0',
  `sendnum` int(11) DEFAULT '1',
  `num` int(11) DEFAULT '0',
  `sendpoint` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_coupon_guess`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_coupon_guess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `couponid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `times` int(11) DEFAULT '0',
  `pwdkey` varchar(255) DEFAULT '',
  `ok` tinyint(3) DEFAULT '0',
  `merchid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_couponid` (`couponid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_coupon_log`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_coupon_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `logno` varchar(255) DEFAULT '',
  `openid` varchar(255) DEFAULT '',
  `couponid` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `paystatus` tinyint(3) DEFAULT '0',
  `creditstatus` tinyint(3) DEFAULT '0',
  `createtime` int(11) DEFAULT '0',
  `paytype` tinyint(3) DEFAULT '0',
  `getfrom` tinyint(3) DEFAULT '0',
  `merchid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_couponid` (`couponid`),
  KEY `idx_status` (`status`),
  KEY `idx_paystatus` (`paystatus`),
  KEY `idx_createtime` (`createtime`),
  KEY `idx_getfrom` (`getfrom`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_coupon_sendshow`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_coupon_sendshow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `showkey` varchar(20) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `openid` varchar(255) NOT NULL,
  `coupondataid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_coupon_sendtasks`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_coupon_sendtasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `enough` decimal(10,2) DEFAULT '0.00',
  `couponid` int(11) DEFAULT '0',
  `starttime` int(11) DEFAULT '0',
  `endtime` int(11) DEFAULT '0',
  `sendnum` int(11) DEFAULT '1',
  `num` int(11) DEFAULT '0',
  `sendpoint` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_coupon_taskdata`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_coupon_taskdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `openid` varchar(50) DEFAULT NULL,
  `taskid` int(11) DEFAULT '0',
  `couponid` int(11) DEFAULT '0',
  `sendnum` int(11) DEFAULT '0',
  `tasktype` tinyint(1) DEFAULT '0',
  `orderid` int(11) DEFAULT '0',
  `parentorderid` int(11) DEFAULT '0',
  `createtime` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `sendpoint` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_coupon_usesendtasks`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_coupon_usesendtasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `usecouponid` int(11) DEFAULT '0',
  `couponid` int(11) DEFAULT '0',
  `starttime` int(11) DEFAULT '0',
  `endtime` int(11) DEFAULT '0',
  `sendnum` int(11) DEFAULT '1',
  `num` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_creditshop_adv`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_creditshop_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `advname` varchar(50) DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '0',
  `merchid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_enabled` (`enabled`),
  KEY `idx_displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_creditshop_category`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_creditshop_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `displayorder` tinyint(3) unsigned DEFAULT '0',
  `enabled` tinyint(1) DEFAULT '1',
  `advimg` varchar(255) DEFAULT '',
  `advurl` varchar(500) DEFAULT '',
  `isrecommand` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_displayorder` (`displayorder`),
  KEY `idx_enabled` (`enabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `ims_ewei_shop_creditshop_category`
--

INSERT INTO `ims_ewei_shop_creditshop_category` (`id`, `uniacid`, `name`, `thumb`, `displayorder`, `enabled`, `advimg`, `advurl`, `isrecommand`) VALUES
(11, 1, '礼品', '', 0, 1, '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_creditshop_comment`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_creditshop_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `logid` int(11) NOT NULL DEFAULT '0',
  `logno` varchar(50) NOT NULL DEFAULT '',
  `goodsid` int(11) NOT NULL DEFAULT '0',
  `openid` varchar(50) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `headimg` varchar(255) DEFAULT NULL,
  `level` tinyint(3) NOT NULL DEFAULT '0',
  `content` varchar(255) DEFAULT NULL,
  `images` text,
  `time` int(11) NOT NULL DEFAULT '0',
  `reply_content` varchar(255) DEFAULT NULL,
  `reply_images` text,
  `reply_time` int(11) NOT NULL DEFAULT '0',
  `append_content` varchar(255) DEFAULT NULL,
  `append_images` text,
  `append_time` int(11) NOT NULL DEFAULT '0',
  `append_reply_content` varchar(255) DEFAULT NULL,
  `append_reply_images` text,
  `append_reply_time` int(11) NOT NULL DEFAULT '0',
  `istop` tinyint(3) NOT NULL DEFAULT '0',
  `checked` tinyint(3) NOT NULL DEFAULT '0',
  `append_checked` tinyint(3) NOT NULL DEFAULT '0',
  `virtual` tinyint(3) NOT NULL DEFAULT '0',
  `deleted` tinyint(3) NOT NULL DEFAULT '0',
  `merchid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_creditshop_goods`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_creditshop_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `cate` int(11) DEFAULT '0',
  `thumb` varchar(255) DEFAULT '',
  `price` decimal(10,2) DEFAULT '0.00',
  `type` tinyint(3) DEFAULT '0',
  `credit` int(11) DEFAULT '0',
  `money` decimal(10,2) DEFAULT '0.00',
  `total` int(11) DEFAULT '0',
  `totalday` int(11) DEFAULT '0',
  `chance` int(11) DEFAULT '0',
  `chanceday` int(11) DEFAULT '0',
  `detail` text,
  `rate1` int(11) DEFAULT '0',
  `rate2` int(11) DEFAULT '0',
  `endtime` int(11) DEFAULT '0',
  `joins` int(11) DEFAULT '0',
  `views` int(11) DEFAULT '0',
  `createtime` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '0',
  `deleted` tinyint(3) DEFAULT '0',
  `showlevels` text,
  `buylevels` text,
  `showgroups` text,
  `buygroups` text,
  `vip` tinyint(3) DEFAULT '0',
  `istop` tinyint(3) DEFAULT '0',
  `isrecommand` tinyint(3) DEFAULT '0',
  `istime` tinyint(3) DEFAULT '0',
  `timestart` int(11) DEFAULT '0',
  `timeend` int(11) DEFAULT '0',
  `share_title` varchar(255) DEFAULT '',
  `share_icon` varchar(255) DEFAULT '',
  `share_desc` varchar(500) DEFAULT '',
  `followneed` tinyint(3) DEFAULT '0',
  `followtext` varchar(255) DEFAULT '',
  `subtitle` varchar(255) DEFAULT '',
  `subdetail` text,
  `noticedetail` text,
  `usedetail` varchar(255) DEFAULT '',
  `goodsdetail` text,
  `isendtime` tinyint(3) DEFAULT '0',
  `usecredit2` tinyint(3) DEFAULT '0',
  `area` varchar(255) DEFAULT '',
  `dispatch` decimal(10,2) DEFAULT '0.00',
  `storeids` text,
  `noticeopenid` varchar(255) DEFAULT '',
  `noticetype` tinyint(3) DEFAULT '0',
  `isverify` tinyint(3) DEFAULT '0',
  `goodstype` tinyint(3) DEFAULT '0',
  `couponid` int(11) DEFAULT '0',
  `goodsid` int(11) DEFAULT '0',
  `merchid` int(11) NOT NULL DEFAULT '0',
  `productprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `mincredit` decimal(10,2) NOT NULL DEFAULT '0.00',
  `minmoney` decimal(10,2) NOT NULL DEFAULT '0.00',
  `maxcredit` decimal(10,2) NOT NULL DEFAULT '0.00',
  `maxmoney` decimal(10,2) NOT NULL DEFAULT '0.00',
  `dispatchtype` tinyint(3) NOT NULL DEFAULT '0',
  `dispatchid` int(11) NOT NULL DEFAULT '0',
  `verifytype` tinyint(3) NOT NULL DEFAULT '0',
  `verifynum` int(11) NOT NULL DEFAULT '0',
  `grant1` decimal(10,2) NOT NULL DEFAULT '0.00',
  `grant2` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goodssn` varchar(255) NOT NULL,
  `productsn` varchar(255) NOT NULL,
  `weight` int(11) NOT NULL,
  `showtotal` tinyint(3) NOT NULL,
  `totalcnf` tinyint(3) NOT NULL DEFAULT '0',
  `usetime` int(11) NOT NULL DEFAULT '0',
  `hasoption` tinyint(3) NOT NULL DEFAULT '0',
  `noticedetailshow` tinyint(3) NOT NULL DEFAULT '0',
  `detailshow` tinyint(3) NOT NULL DEFAULT '0',
  `packetmoney` decimal(10,2) NOT NULL DEFAULT '0.00',
  `surplusmoney` decimal(10,2) NOT NULL DEFAULT '0.00',
  `packetlimit` decimal(10,2) NOT NULL DEFAULT '0.00',
  `packettype` tinyint(3) NOT NULL DEFAULT '0',
  `minpacketmoney` decimal(10,2) NOT NULL DEFAULT '0.00',
  `packettotal` int(11) NOT NULL DEFAULT '0',
  `packetsurplus` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_type` (`type`),
  KEY `idx_endtime` (`endtime`),
  KEY `idx_createtime` (`createtime`),
  KEY `idx_status` (`status`),
  KEY `idx_displayorder` (`displayorder`),
  KEY `idx_deleted` (`deleted`),
  KEY `idx_istop` (`istop`),
  KEY `idx_isrecommand` (`isrecommand`),
  KEY `idx_istime` (`istime`),
  KEY `idx_timestart` (`timestart`),
  KEY `idx_timeend` (`timeend`),
  KEY `idx_goodstype` (`goodstype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_creditshop_log`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_creditshop_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `logno` varchar(255) DEFAULT '',
  `eno` varchar(255) DEFAULT '',
  `openid` varchar(255) DEFAULT '',
  `goodsid` int(11) DEFAULT '0',
  `createtime` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '0',
  `paystatus` tinyint(3) DEFAULT '0',
  `paytype` tinyint(3) DEFAULT '-1',
  `dispatchstatus` tinyint(3) DEFAULT '0',
  `creditpay` tinyint(3) DEFAULT '0',
  `addressid` int(11) DEFAULT '0',
  `dispatchno` varchar(255) DEFAULT '',
  `usetime` int(11) DEFAULT '0',
  `express` varchar(255) DEFAULT '',
  `expresssn` varchar(255) DEFAULT '',
  `expresscom` varchar(255) DEFAULT '',
  `verifyopenid` varchar(255) DEFAULT '',
  `storeid` int(11) DEFAULT '0',
  `realname` varchar(255) DEFAULT '',
  `mobile` varchar(255) DEFAULT '',
  `couponid` int(11) DEFAULT '0',
  `dupdate1` tinyint(3) DEFAULT '0',
  `transid` varchar(255) DEFAULT '',
  `dispatchtransid` varchar(255) DEFAULT '',
  `address` text,
  `optionid` int(11) NOT NULL DEFAULT '0',
  `time_send` int(11) NOT NULL DEFAULT '0',
  `time_finish` int(11) NOT NULL DEFAULT '0',
  `iscomment` tinyint(3) NOT NULL DEFAULT '0',
  `dispatchtime` int(11) NOT NULL DEFAULT '0',
  `verifynum` int(11) NOT NULL DEFAULT '1',
  `verifytime` int(11) NOT NULL DEFAULT '0',
  `merchid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=54 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_creditshop_option`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_creditshop_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `goodsid` int(10) DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `thumb` varchar(60) DEFAULT '',
  `credit` int(10) NOT NULL DEFAULT '0',
  `money` decimal(10,2) DEFAULT '0.00',
  `total` int(11) DEFAULT '0',
  `weight` decimal(10,2) DEFAULT '0.00',
  `displayorder` int(11) DEFAULT '0',
  `specs` text,
  `skuId` varchar(255) DEFAULT '',
  `goodssn` varchar(255) DEFAULT '',
  `productsn` varchar(255) DEFAULT '',
  `virtual` int(11) DEFAULT '0',
  `exchange_stock` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_creditshop_spec`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_creditshop_spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `goodsid` int(11) DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `description` varchar(1000) DEFAULT '',
  `displaytype` tinyint(3) DEFAULT '0',
  `content` text,
  `displayorder` int(11) DEFAULT '0',
  `propId` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_creditshop_spec_item`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_creditshop_spec_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `specid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `show` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  `valueId` varchar(255) DEFAULT '',
  `virtual` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_creditshop_verify`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_creditshop_verify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `openid` varchar(45) DEFAULT '0',
  `logid` int(11) DEFAULT '0',
  `verifycode` varchar(45) DEFAULT NULL,
  `storeid` int(11) DEFAULT '0',
  `verifier` varchar(45) DEFAULT '0',
  `isverify` tinyint(3) DEFAULT '0',
  `verifytime` int(11) DEFAULT '0',
  `merchid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_customer`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `kf_id` varchar(255) DEFAULT NULL,
  `kf_account` varchar(255) DEFAULT '',
  `kf_nick` varchar(255) DEFAULT '',
  `kf_pwd` varchar(255) DEFAULT '',
  `kf_headimgurl` varchar(255) DEFAULT '',
  `createtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_customer_category`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_customer_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_customer_guestbook`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_customer_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `realname` varchar(11) DEFAULT '',
  `mobile` varchar(255) DEFAULT '',
  `weixin` varchar(255) DEFAULT '',
  `images` text,
  `content` text,
  `remark` text,
  `status` tinyint(3) DEFAULT '0',
  `createtime` int(11) DEFAULT '0',
  `deleted` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_customer_robot`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_customer_robot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `cate` int(11) DEFAULT '0',
  `keywords` varchar(500) DEFAULT '',
  `title` varchar(255) DEFAULT '',
  `content` longtext,
  `url` varchar(255) DEFAULT '',
  `createtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_cate` (`cate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_designer`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_designer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `pagename` varchar(255) NOT NULL DEFAULT '',
  `pagetype` tinyint(3) NOT NULL DEFAULT '0',
  `pageinfo` text NOT NULL,
  `createtime` varchar(255) NOT NULL DEFAULT '',
  `keyword` varchar(255) DEFAULT '',
  `savetime` varchar(255) NOT NULL DEFAULT '',
  `setdefault` tinyint(3) NOT NULL DEFAULT '0',
  `datas` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_pagetype` (`pagetype`),
  KEY `idx_keyword` (`keyword`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_designer_menu`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_designer_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `menuname` varchar(255) DEFAULT '',
  `isdefault` tinyint(3) DEFAULT '0',
  `createtime` int(11) DEFAULT '0',
  `menus` text,
  `params` text,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_isdefault` (`isdefault`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_dispatch`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_dispatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `dispatchname` varchar(50) DEFAULT '',
  `dispatchtype` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  `firstprice` decimal(10,2) DEFAULT '0.00',
  `secondprice` decimal(10,2) DEFAULT '0.00',
  `firstweight` int(11) DEFAULT '0',
  `secondweight` int(11) DEFAULT '0',
  `express` varchar(250) DEFAULT '',
  `areas` longtext,
  `carriers` text,
  `enabled` int(11) DEFAULT '0',
  `calculatetype` tinyint(1) DEFAULT '0',
  `firstnum` int(11) DEFAULT '0',
  `secondnum` int(11) DEFAULT '0',
  `firstnumprice` decimal(10,2) DEFAULT '0.00',
  `secondnumprice` decimal(10,2) DEFAULT '0.00',
  `isdefault` tinyint(1) DEFAULT '0',
  `shopid` int(11) DEFAULT '0',
  `merchid` int(11) DEFAULT '0',
  `nodispatchareas` text,
  `nodispatchareas_code` longtext,
  `isdispatcharea` tinyint(3) NOT NULL DEFAULT '0',
  `freeprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_diyform_category`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_diyform_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `ims_ewei_shop_diyform_category`
--

INSERT INTO `ims_ewei_shop_diyform_category` (`id`, `uniacid`, `name`) VALUES
(5, 6, '订餐类');

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_diyform_data`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_diyform_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `typeid` int(11) NOT NULL DEFAULT '0',
  `cid` int(11) DEFAULT '0',
  `diyformfields` text,
  `fields` text NOT NULL,
  `openid` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_typeid` (`typeid`),
  KEY `idx_cid` (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_diyform_temp`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_diyform_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `typeid` int(11) DEFAULT '0',
  `cid` int(11) NOT NULL DEFAULT '0',
  `diyformfields` text,
  `fields` text NOT NULL,
  `openid` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) DEFAULT '0',
  `diyformid` int(11) DEFAULT '0',
  `diyformdata` text,
  `carrier_realname` varchar(255) DEFAULT '',
  `carrier_mobile` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_cid` (`cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_diyform_type`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_diyform_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `cate` int(11) DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `fields` text NOT NULL,
  `usedata` int(11) NOT NULL DEFAULT '0',
  `alldata` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_cate` (`cate`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `ims_ewei_shop_diyform_type`
--

INSERT INTO `ims_ewei_shop_diyform_type` (`id`, `uniacid`, `cate`, `title`, `fields`, `usedata`, `alldata`, `status`) VALUES
(7, 6, 5, '下单时', 'a:4:{s:14:"diyyongcanriqi";a:5:{s:9:"data_type";s:1:"8";s:7:"tp_name";s:12:"用餐日期";s:7:"tp_must";i:1;s:18:"default_btime_type";i:1;s:18:"default_etime_type";i:0;}s:17:"diyyongcanshijian";a:4:{s:9:"data_type";s:1:"3";s:7:"tp_name";s:12:"用餐时间";s:7:"tp_must";i:1;s:7:"tp_text";a:16:{i:0;s:5:"10:30";i:1;s:5:"11:00";i:2;s:5:"11:30";i:3;s:5:"12:00";i:4;s:5:"12:30";i:5;s:5:"13:00";i:6;s:5:"13:30";i:7;s:5:"14:00";i:8;s:5:"17:00";i:9;s:5:"17:30";i:10;s:5:"18:00";i:11;s:5:"18:30";i:12;s:5:"19:00";i:13;s:5:"19:30";i:14;s:5:"20:00";i:15;s:5:"20:30";}}s:17:"diyyongcanfangshi";a:4:{s:9:"data_type";s:1:"3";s:7:"tp_name";s:12:"用餐方式";s:7:"tp_must";i:1;s:7:"tp_text";a:2:{i:0;s:6:"到店";i:1;s:6:"打包";}}s:16:"diyyongcanrenshu";a:5:{s:9:"data_type";s:1:"0";s:7:"tp_name";s:12:"用餐人数";s:7:"tp_must";i:1;s:13:"tp_is_default";s:1:"0";s:11:"placeholder";s:0:"";}}', 0, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_diypage`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_diypage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `data` longtext NOT NULL,
  `createtime` int(11) NOT NULL DEFAULT '0',
  `lastedittime` int(11) NOT NULL DEFAULT '0',
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `diymenu` int(11) NOT NULL DEFAULT '0',
  `merch` int(11) NOT NULL DEFAULT '0',
  `diyadv` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_type` (`type`),
  KEY `idx_keyword` (`keyword`),
  KEY `idx_lastedittime` (`lastedittime`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_diypage_menu`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_diypage_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  `createtime` int(11) NOT NULL DEFAULT '0',
  `lastedittime` int(11) NOT NULL DEFAULT '0',
  `merch` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_createtime` (`createtime`),
  KEY `idx_lastedittime` (`lastedittime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_diypage_plu`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_diypage_plu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  `createtime` int(11) NOT NULL DEFAULT '0',
  `lastedittime` int(11) NOT NULL DEFAULT '0',
  `merch` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`) USING BTREE,
  KEY `idx_createtime` (`createtime`) USING BTREE,
  KEY `idx_lastedittime` (`lastedittime`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_diypage_template`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_diypage_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `data` longtext NOT NULL,
  `preview` varchar(255) NOT NULL DEFAULT '',
  `tplid` int(11) DEFAULT '0',
  `cate` int(11) DEFAULT '0',
  `deleted` tinyint(3) DEFAULT '0',
  `merch` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_type` (`type`),
  KEY `idx_cate` (`cate`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `ims_ewei_shop_diypage_template`
--

INSERT INTO `ims_ewei_shop_diypage_template` (`id`, `uniacid`, `type`, `name`, `data`, `preview`, `tplid`, `cate`, `deleted`, `merch`) VALUES
(1, 0, 2, '系统模板01', 'eyJwYWdlIjp7InR5cGUiOiIyIiwidGl0bGUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwMSIsIm5hbWUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwMSIsImRlc2MiOiIiLCJpY29uIjoiIiwia2V5d29yZCI6IiIsImJhY2tncm91bmQiOiIjZmFmYWZhIiwiZGl5bWVudSI6Ii0xIn0sIml0ZW1zIjp7Ik0xNDY1ODAyOTg0ODg1Ijp7InN0eWxlIjp7ImRvdHN0eWxlIjoicm91bmQiLCJkb3RhbGlnbiI6ImNlbnRlciIsImJhY2tncm91bmQiOiIjZmZmZmZmIiwibGVmdHJpZ2h0IjoiNSIsImJvdHRvbSI6IjEwIiwib3BhY2l0eSI6IjAuOCJ9LCJkYXRhIjp7IkMxNDY1ODAyOTg0ODg1Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQxXC9iYW5uZXJfMS5qcGciLCJsaW5rdXJsIjoiIn0sIkMxNDY1ODAyOTg0ODg2Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQxXC9iYW5uZXJfMi5qcGciLCJsaW5rdXJsIjoiIn0sIk0xNDY1ODAzMDE0ODM3Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQxXC9iYW5uZXJfMy5qcGciLCJsaW5rdXJsIjoiIn19LCJpZCI6ImJhbm5lciJ9LCJNMTQ2NTgwMzY5MjkzMiI6eyJzdHlsZSI6eyJoZWlnaHQiOiIxMCIsImJhY2tncm91bmQiOiIjZmZmZmZmIn0sImlkIjoiYmxhbmsifSwiTTE0NjU4MDMzMTk4NTMiOnsic3R5bGUiOnsibmF2c3R5bGUiOiIiLCJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsInJvd251bSI6IjUifSwiZGF0YSI6eyJDMTQ2NTgwMzMxOTg1MyI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0MVwvbWVudV8xLnBuZyIsImxpbmt1cmwiOiIiLCJ0ZXh0IjoiXHU2NWIwXHU1NGMxIiwiY29sb3IiOiIjNjY2NjY2In0sIkMxNDY1ODAzMzE5ODU0Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQxXC9tZW51XzIucG5nIiwibGlua3VybCI6IiIsInRleHQiOiJcdTcwZWRcdTUzNTYiLCJjb2xvciI6IiM2NjY2NjYifSwiQzE0NjU4MDMzMTk4NTUiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDFcL21lbnVfMy5wbmciLCJsaW5rdXJsIjoiIiwidGV4dCI6Ilx1NGZjM1x1OTUwMCIsImNvbG9yIjoiIzY2NjY2NiJ9LCJDMTQ2NTgwMzMxOTg1NiI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0MVwvbWVudV80LnBuZyIsImxpbmt1cmwiOiIiLCJ0ZXh0IjoiXHU4YmEyXHU1MzU1IiwiY29sb3IiOiIjNjY2NjY2In0sIk0xNDY1ODAzMzQ3MDQ1Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQxXC9tZW51XzUucG5nIiwibGlua3VybCI6IiIsInRleHQiOiJcdTdiN2VcdTUyMzAiLCJjb2xvciI6IiM2NjY2NjYifX0sImlkIjoibWVudSJ9LCJNMTQ2NTgwMzM1OTEwMCI6eyJzdHlsZSI6eyJuYXZzdHlsZSI6IiIsImJhY2tncm91bmQiOiIjZmZmZmZmIiwicm93bnVtIjoiNSJ9LCJkYXRhIjp7IkMxNDY1ODAzMzU5MTAwIjp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQxXC9tZW51XzYucG5nIiwibGlua3VybCI6IiIsInRleHQiOiJcdTRlMGFcdTg4NjMiLCJjb2xvciI6IiM2NjY2NjYifSwiQzE0NjU4MDMzNTkxMDEiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDFcL21lbnVfNy5wbmciLCJsaW5rdXJsIjoiIiwidGV4dCI6Ilx1NGUwYlx1ODg2MyIsImNvbG9yIjoiIzY2NjY2NiJ9LCJDMTQ2NTgwMzM1OTEwMiI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0MVwvbWVudV84LnBuZyIsImxpbmt1cmwiOiIiLCJ0ZXh0IjoiXHU5NzhiXHU1YjUwIiwiY29sb3IiOiIjNjY2NjY2In0sIkMxNDY1ODAzMzU5MTAzIjp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQxXC9tZW51XzkucG5nIiwibGlua3VybCI6IiIsInRleHQiOiJcdTUxODVcdTg4NjMiLCJjb2xvciI6IiM2NjY2NjYifSwiTTE0NjU4MDM0NTA4MjciOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDFcL21lbnVfMTAucG5nIiwibGlua3VybCI6IiIsInRleHQiOiJcdTUxNjhcdTkwZTgiLCJjb2xvciI6IiM2NjY2NjYifX0sImlkIjoibWVudSJ9LCJNMTQ2NTgwMzcwMDEzMiI6eyJzdHlsZSI6eyJoZWlnaHQiOiIxMCIsImJhY2tncm91bmQiOiIjZmZmZmZmIn0sImlkIjoiYmxhbmsifSwiTTE0NjU4MDM2MjE5ODAiOnsicGFyYW1zIjp7Imljb251cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2Mlwvc3RhdGljXC9pbWFnZXNcL2hvdGRvdC5qcGciLCJub3RpY2VkYXRhIjoiMSIsInNwZWVkIjoiNCIsIm5vdGljZW51bSI6IjUifSwic3R5bGUiOnsiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJpY29uY29sb3IiOiIjZmQ1NDU0IiwiY29sb3IiOiIjNjY2NjY2In0sImRhdGEiOnsiQzE0NjU4MDM2MjE5ODAiOnsidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTdiMmNcdTRlMDBcdTY3NjFcdTgxZWFcdTViOWFcdTRlNDlcdTUxNmNcdTU0NGFcdTc2ODRcdTY4MDdcdTk4OTgiLCJsaW5rdXJsIjoiaHR0cDpcL1wvd3d3LmJhaWR1LmNvbSJ9LCJDMTQ2NTgwMzYyMTk4MSI6eyJ0aXRsZSI6Ilx1OGZkOVx1OTFjY1x1NjYyZlx1N2IyY1x1NGU4Y1x1Njc2MVx1ODFlYVx1NWI5YVx1NGU0OVx1NTE2Y1x1NTQ0YVx1NzY4NFx1NjgwN1x1OTg5OCIsImxpbmt1cmwiOiJodHRwOlwvXC93d3cuYmFpZHUuY29tIn19LCJpZCI6Im5vdGljZSJ9LCJNMTQ2NTgwMzkzMjQ2MCI6eyJwYXJhbXMiOnsicm93IjoiMiJ9LCJkYXRhIjp7IkMxNDY1ODAzOTMyNDYwIjp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQxXC9waWN0dXJld18xLmpwZyIsImxpbmt1cmwiOiIifSwiQzE0NjU4MDM5MzI0NjMiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDFcL3BpY3R1cmV3XzIuanBnIiwibGlua3VybCI6IiJ9fSwiaWQiOiJwaWN0dXJldyIsInN0eWxlIjp7InBhZGRpbmd0b3AiOiIxNiIsInBhZGRpbmdsZWZ0IjoiNCJ9fSwiTTE0NjU4MDQwMjU1MDgiOnsicGFyYW1zIjp7InRpdGxlIjoiXHU2NWIwXHU1NGMxXHU0ZTBhXHU1ZTAyIiwiaWNvbiI6Imljb24tbmV3In0sInN0eWxlIjp7ImJhY2tncm91bmQiOiIjZmZmZmZmIiwiY29sb3IiOiIjZjA2MjkyIiwidGV4dGFsaWduIjoiY2VudGVyIiwiZm9udHNpemUiOiIxOCIsInBhZGRpbmd0b3AiOiI1IiwicGFkZGluZ2xlZnQiOiI1In0sImlkIjoidGl0bGUifSwiTTE0NjU4MTMzNjgwODUiOnsicGFyYW1zIjp7InNob3d0aXRsZSI6IjEiLCJzaG93cHJpY2UiOiIxIiwiZ29vZHNkYXRhIjoiMCIsImNhdGVpZCI6IiIsImNhdGVuYW1lIjoiIiwiZ3JvdXBpZCI6IiIsImdyb3VwbmFtZSI6IiIsImdvb2Rzc29ydCI6IjAiLCJnb29kc251bSI6IjYiLCJzaG93aWNvbiI6IjAiLCJpY29ucG9zaXRpb24iOiJsZWZ0IHRvcCJ9LCJzdHlsZSI6eyJsaXN0c3R5bGUiOiJibG9jayIsImJ1eXN0eWxlIjoiYnV5YnRuLTEiLCJnb29kc2ljb24iOiJyZWNvbW1hbmQiLCJwcmljZWNvbG9yIjoiI2VkMjgyMiIsImljb25wYWRkaW5ndG9wIjoiMCIsImljb25wYWRkaW5nbGVmdCI6IjAiLCJidXlidG5jb2xvciI6IiNmZTU0NTUiLCJpY29uem9vbSI6IjEwMCIsInRpdGxlY29sb3IiOiIjMjYyNjI2In0sImRhdGEiOnsiQzE0NjU4MTMzNjgwODUiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtMS5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifSwiQzE0NjU4MTMzNjgwODYiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtMi5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifSwiQzE0NjU4MTMzNjgwODciOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtMy5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifSwiQzE0NjU4MTMzNjgwODgiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtNC5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifX0sImlkIjoiZ29vZHMifSwiTTE0NjU4MDU4MjEwNjciOnsicGFyYW1zIjp7InRpdGxlIjoiXHU3MGVkXHU1MzU2XHU1NTQ2XHU1NGMxIiwiaWNvbiI6Imljb24taG90In0sInN0eWxlIjp7ImJhY2tncm91bmQiOiIjZmZmZmZmIiwiY29sb3IiOiIjZmFjMDQyIiwidGV4dGFsaWduIjoiY2VudGVyIiwiZm9udHNpemUiOiIxOCIsInBhZGRpbmd0b3AiOiI1IiwicGFkZGluZ2xlZnQiOiI1In0sImlkIjoidGl0bGUifSwiTTE0NjU4MTMzNzY4OTIiOnsicGFyYW1zIjp7InNob3d0aXRsZSI6IjEiLCJzaG93cHJpY2UiOiIxIiwiZ29vZHNkYXRhIjoiMCIsImNhdGVpZCI6IiIsImNhdGVuYW1lIjoiIiwiZ3JvdXBpZCI6IiIsImdyb3VwbmFtZSI6IiIsImdvb2Rzc29ydCI6IjAiLCJnb29kc251bSI6IjYiLCJzaG93aWNvbiI6IjEiLCJpY29ucG9zaXRpb24iOiJsZWZ0IHRvcCJ9LCJzdHlsZSI6eyJsaXN0c3R5bGUiOiJibG9jayIsImJ1eXN0eWxlIjoiYnV5YnRuLTEiLCJnb29kc2ljb24iOiJyZWNvbW1hbmQiLCJwcmljZWNvbG9yIjoiI2VkMjgyMiIsImljb25wYWRkaW5ndG9wIjoiMCIsImljb25wYWRkaW5nbGVmdCI6IjAiLCJidXlidG5jb2xvciI6IiNmZTU0NTUiLCJpY29uem9vbSI6IjEwMCIsInRpdGxlY29sb3IiOiIjMjYyNjI2In0sImRhdGEiOnsiQzE0NjU4MTMzNzY4OTIiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtMS5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifSwiQzE0NjU4MTMzNzY4OTMiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtMi5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifSwiQzE0NjU4MTMzNzY4OTQiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtMy5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifSwiQzE0NjU4MTMzNzY4OTUiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtNC5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifX0sImlkIjoiZ29vZHMifX19', '../addons/ewei_shopv2/plugin/diypage/static/template/default1/preview.jpg', 1, 0, 0, 0),
(2, 0, 1, '系统模板02', 'eyJwYWdlIjp7InR5cGUiOiIxIiwidGl0bGUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwMiIsIm5hbWUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwMiIsImRlc2MiOiIiLCJpY29uIjoiIiwia2V5d29yZCI6IiIsImJhY2tncm91bmQiOiIjZmFmYWZhIiwiZGl5bWVudSI6Ii0xIn0sIml0ZW1zIjp7Ik0xNDY1ODA4NTU2MDAxIjp7InN0eWxlIjp7ImRvdHN0eWxlIjoicm91bmQiLCJkb3RhbGlnbiI6InJpZ2h0IiwiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJsZWZ0cmlnaHQiOiIxMCIsImJvdHRvbSI6IjEwIiwib3BhY2l0eSI6IjAuOCJ9LCJkYXRhIjp7IkMxNDY1ODA4NTU2MDAxIjp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQyXC9iYW5uZXJfMS5qcGciLCJsaW5rdXJsIjoiIn0sIkMxNDY1ODA4NTU2MDAyIjp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQyXC9iYW5uZXJfMi5qcGciLCJsaW5rdXJsIjoiIn0sIk0xNDY1ODA4NTc1MTIyIjp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQyXC9iYW5uZXJfMy5qcGciLCJsaW5rdXJsIjoiIn19LCJpZCI6ImJhbm5lciJ9LCJNMTQ2NTgwODcwNTA2NCI6eyJzdHlsZSI6eyJoZWlnaHQiOiIyMCIsImJhY2tncm91bmQiOiIjZmZmZmZmIn0sImlkIjoiYmxhbmsifSwiTTE0NjU4MDg2NzMwNDAiOnsicGFyYW1zIjp7InJvdyI6IjIifSwiZGF0YSI6eyJDMTQ2NTgwODY3MzA0MCI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0MlwvcGljdHVyZXdfMS5qcGciLCJsaW5rdXJsIjoiIn0sIkMxNDY1ODA4NjczMDQxIjp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQyXC9waWN0dXJld18yLmpwZyIsImxpbmt1cmwiOiIifX0sImlkIjoicGljdHVyZXciLCJzdHlsZSI6eyJwYWRkaW5ndG9wIjoiMCIsInBhZGRpbmdsZWZ0IjoiMCJ9fSwiTTE0NjU4MDg3MDkyODAiOnsic3R5bGUiOnsiaGVpZ2h0IjoiMjAiLCJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiJ9LCJpZCI6ImJsYW5rIn0sIk0xNDY1ODA4NzY2NTY3Ijp7InBhcmFtcyI6eyJyb3ciOiIyIn0sImRhdGEiOnsiQzE0NjU4MDg3NjY1NzAiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDJcL3BpY3R1cmV3XzMuanBnIiwibGlua3VybCI6IiJ9LCJDMTQ2NTgwODc2NjU3MSI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0MlwvcGljdHVyZXdfNC5qcGciLCJsaW5rdXJsIjoiIn19LCJpZCI6InBpY3R1cmV3Iiwic3R5bGUiOnsicGFkZGluZ3RvcCI6IjAiLCJwYWRkaW5nbGVmdCI6IjAifX0sIk0xNDY1ODA4NzkxMDcyIjp7InN0eWxlIjp7ImhlaWdodCI6IjIwIiwiYmFja2dyb3VuZCI6IiNmZmZmZmYifSwiaWQiOiJibGFuayJ9LCJNMTQ2NTgwODg3MDY4MCI6eyJkYXRhIjp7IkMxNDY1ODA4ODcwNjgwIjp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQyXC9iYW5uZXJfMy5qcGciLCJsaW5rdXJsIjoiIn19LCJpZCI6InBpY3R1cmUiLCJzdHlsZSI6eyJwYWRkaW5ndG9wIjoiMCIsInBhZGRpbmdsZWZ0IjoiMCJ9fSwiTTE0NjU4MDkwMTA0MTUiOnsic3R5bGUiOnsiaGVpZ2h0IjoiMjAiLCJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiJ9LCJpZCI6ImJsYW5rIn0sIk0xNDY1ODA4OTgxNTk5Ijp7InBhcmFtcyI6eyJyb3ciOiIyIn0sImRhdGEiOnsiQzE0NjU4MDg5ODE1OTkiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDJcL3BpY3R1cmV3XzUuanBnIiwibGlua3VybCI6IiJ9LCJDMTQ2NTgwODk4MTYwMCI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0MlwvcGljdHVyZXdfNi5qcGciLCJsaW5rdXJsIjoiIn19LCJpZCI6InBpY3R1cmV3Iiwic3R5bGUiOnsicGFkZGluZ3RvcCI6IjAiLCJwYWRkaW5nbGVmdCI6IjAifX0sIk0xNDY1ODg5MzczNTY3Ijp7InBhcmFtcyI6eyJzaG93dGl0bGUiOiIxIiwic2hvd3ByaWNlIjoiMSIsImdvb2RzZGF0YSI6IjAiLCJjYXRlaWQiOiIiLCJjYXRlbmFtZSI6IiIsImdyb3VwaWQiOiIiLCJncm91cG5hbWUiOiIiLCJnb29kc3NvcnQiOiIwIiwiZ29vZHNudW0iOiI2Iiwic2hvd2ljb24iOiIxIiwiaWNvbnBvc2l0aW9uIjoibGVmdCB0b3AifSwic3R5bGUiOnsibGlzdHN0eWxlIjoiYmxvY2siLCJidXlzdHlsZSI6ImJ1eWJ0bi0xIiwiZ29vZHNpY29uIjoicmVjb21tYW5kIiwicHJpY2Vjb2xvciI6IiNlZDI4MjIiLCJpY29ucGFkZGluZ3RvcCI6IjAiLCJpY29ucGFkZGluZ2xlZnQiOiIwIiwiYnV5YnRuY29sb3IiOiIjZmU1NDU1IiwiaWNvbnpvb20iOiIxMDAiLCJ0aXRsZWNvbG9yIjoiIzI2MjYyNiJ9LCJkYXRhIjp7IkMxNDY1ODg5MzczNTY3Ijp7InRodW1iIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2dvb2RzLTEuanBnIiwicHJpY2UiOiIyMC4wMCIsInRpdGxlIjoiXHU4ZmQ5XHU5MWNjXHU2NjJmXHU1NTQ2XHU1NGMxXHU2ODA3XHU5ODk4IiwiZ2lkIjoiIn0sIkMxNDY1ODg5MzczNTY4Ijp7InRodW1iIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2dvb2RzLTIuanBnIiwicHJpY2UiOiIyMC4wMCIsInRpdGxlIjoiXHU4ZmQ5XHU5MWNjXHU2NjJmXHU1NTQ2XHU1NGMxXHU2ODA3XHU5ODk4IiwiZ2lkIjoiIn0sIkMxNDY1ODg5MzczNTY5Ijp7InRodW1iIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2dvb2RzLTMuanBnIiwicHJpY2UiOiIyMC4wMCIsInRpdGxlIjoiXHU4ZmQ5XHU5MWNjXHU2NjJmXHU1NTQ2XHU1NGMxXHU2ODA3XHU5ODk4IiwiZ2lkIjoiIn0sIkMxNDY1ODg5MzczNTcwIjp7InRodW1iIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2dvb2RzLTQuanBnIiwicHJpY2UiOiIyMC4wMCIsInRpdGxlIjoiXHU4ZmQ5XHU5MWNjXHU2NjJmXHU1NTQ2XHU1NGMxXHU2ODA3XHU5ODk4IiwiZ2lkIjoiIn19LCJpZCI6Imdvb2RzIn0sIk0xNDY1ODg5Mzc3NDIzIjp7InBhcmFtcyI6eyJjb250ZW50IjoiUEhBZ2MzUjViR1U5SW5SbGVIUXRZV3hwWjI0NklHTmxiblJsY2pzaVB1V2J2dWVKaCthZHBlYTZrT1M2anVlOWtlZTduTys4ak9lSmlPYWRnK1c5a3VXT24rUzluT2lBaGVhSmdPYWNpVHd2Y0Q0PSJ9LCJzdHlsZSI6eyJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsInBhZGRpbmciOiIyMCJ9LCJpZCI6InJpY2h0ZXh0In19fQ==', '../addons/ewei_shopv2/plugin/diypage/static/template/default2/preview.jpg', 2, 0, 0, 0),
(3, 0, 2, '系统模板03', 'eyJwYWdlIjp7InR5cGUiOiIyIiwidGl0bGUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwMyIsIm5hbWUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwMyIsImRlc2MiOiIiLCJpY29uIjoiIiwia2V5d29yZCI6IiIsImJhY2tncm91bmQiOiIjZmFmYWZhIiwiZGl5bWVudSI6Ii0xIn0sIml0ZW1zIjp7Ik0xNDY1ODA5MjQyOTc2Ijp7InN0eWxlIjp7ImRvdHN0eWxlIjoicm91bmQiLCJkb3RhbGlnbiI6ImxlZnQiLCJiYWNrZ3JvdW5kIjoiIzM0YmVkYyIsImxlZnRyaWdodCI6IjEwIiwiYm90dG9tIjoiMTAiLCJvcGFjaXR5IjoiMC43In0sImRhdGEiOnsiQzE0NjU4MDkyNDI5NzYiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDNcL2Jhbm5lcl8xLmpwZyIsImxpbmt1cmwiOiIifSwiQzE0NjU4MDkyNDI5NzciOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDNcL2Jhbm5lcl8yLmpwZyIsImxpbmt1cmwiOiIifSwiTTE0NjU4MDkyNjU5OTIiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDNcL2Jhbm5lcl8zLmpwZyIsImxpbmt1cmwiOiIifX0sImlkIjoiYmFubmVyIn0sIk0xNDY1ODA5NTQxNTM1Ijp7InBhcmFtcyI6eyJyb3ciOiIxIn0sImRhdGEiOnsiQzE0NjU4MDk1NDE1MzUiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDNcL3BpY3R1cmV3XzEuanBnIiwibGlua3VybCI6IiJ9LCJDMTQ2NTgwOTU0MTUzNiI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0M1wvcGljdHVyZXdfMi5qcGciLCJsaW5rdXJsIjoiIn0sIkMxNDY1ODA5NTQxNTM3Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQzXC9waWN0dXJld18zLmpwZyIsImxpbmt1cmwiOiIifX0sImlkIjoicGljdHVyZXciLCJzdHlsZSI6eyJwYWRkaW5ndG9wIjoiNSIsInBhZGRpbmdsZWZ0IjoiNSIsImJhY2tncm91bmQiOiIjZmFmYWZhIn19LCJNMTQ2NTgwOTc2MzQxNSI6eyJzdHlsZSI6eyJoZWlnaHQiOiI1IiwiYmFja2dyb3VuZCI6IiNmYWZhZmEifSwiaWQiOiJibGFuayJ9LCJNMTQ2NTgwOTcwOTA0MCI6eyJwYXJhbXMiOnsidGl0bGUiOiJcdTY1YjBcdTU0YzFcdTRlMGFcdTVlMDIiLCJpY29uIjoiaWNvbi1uZXcifSwic3R5bGUiOnsiYmFja2dyb3VuZCI6IiMyOGMxOTIiLCJjb2xvciI6IiNmZmZmZmYiLCJ0ZXh0YWxpZ24iOiJsZWZ0IiwiZm9udHNpemUiOiIxOCIsInBhZGRpbmd0b3AiOiI1IiwicGFkZGluZ2xlZnQiOiI1In0sImlkIjoidGl0bGUifSwiTTE0NjU4MDk3OTEyMzEiOnsicGFyYW1zIjp7InNob3d0aXRsZSI6IjEiLCJzaG93cHJpY2UiOiIxIiwiZ29vZHNkYXRhIjoiMCIsImNhdGVpZCI6IiIsImNhdGVuYW1lIjoiIiwiZ3JvdXBpZCI6IiIsImdyb3VwbmFtZSI6IiIsImdvb2Rzc29ydCI6IjAiLCJnb29kc251bSI6IjYiLCJzaG93aWNvbiI6IjAiLCJpY29ucG9zaXRpb24iOiJsZWZ0IHRvcCJ9LCJzdHlsZSI6eyJsaXN0c3R5bGUiOiJibG9jayIsImJ1eXN0eWxlIjoiYnV5YnRuLTMiLCJnb29kc2ljb24iOiJyZWNvbW1hbmQiLCJwcmljZWNvbG9yIjoiIzI4YzE5MiIsImljb25wYWRkaW5ndG9wIjoiMCIsImljb25wYWRkaW5nbGVmdCI6IjAiLCJidXlidG5jb2xvciI6IiMyOGMxOGYiLCJpY29uem9vbSI6IjEwMCIsInRpdGxlY29sb3IiOiIjMjhjMTkyIn0sImRhdGEiOnsiQzE0NjU4MDk3OTEyMzEiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtMS5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifSwiQzE0NjU4MDk3OTEyMzIiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtMi5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifSwiQzE0NjU4MDk3OTEyMzMiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtMy5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifSwiQzE0NjU4MDk3OTEyMzQiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtNC5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifX0sImlkIjoiZ29vZHMifSwiTTE0NjU4MDk5NTA4NDciOnsicGFyYW1zIjp7InRpdGxlIjoiXHU2MzhjXHU2N2RjXHU2M2E4XHU4MzUwIiwiaWNvbiI6Imljb24tYXBwcmVjaWF0ZSJ9LCJzdHlsZSI6eyJiYWNrZ3JvdW5kIjoiI2ZmYmQzMyIsImNvbG9yIjoiI2ZmZmZmZiIsInRleHRhbGlnbiI6InJpZ2h0IiwiZm9udHNpemUiOiIxOCIsInBhZGRpbmd0b3AiOiI1IiwicGFkZGluZ2xlZnQiOiI1In0sImlkIjoidGl0bGUifSwiTTE0NjU4MDk5NDMyMzEiOnsicGFyYW1zIjp7InNob3d0aXRsZSI6IjEiLCJzaG93cHJpY2UiOiIxIiwiZ29vZHNkYXRhIjoiMCIsImNhdGVpZCI6IiIsImNhdGVuYW1lIjoiIiwiZ3JvdXBpZCI6IiIsImdyb3VwbmFtZSI6IiIsImdvb2Rzc29ydCI6IjAiLCJnb29kc251bSI6IjYiLCJzaG93aWNvbiI6IjEiLCJpY29ucG9zaXRpb24iOiJsZWZ0IHRvcCJ9LCJzdHlsZSI6eyJsaXN0c3R5bGUiOiJibG9jayIsImJ1eXN0eWxlIjoiYnV5YnRuLTEiLCJnb29kc2ljb24iOiJyZWNvbW1hbmQiLCJwcmljZWNvbG9yIjoiI2VkMjgyMiIsImljb25wYWRkaW5ndG9wIjoiMCIsImljb25wYWRkaW5nbGVmdCI6IjAiLCJidXlidG5jb2xvciI6IiNmZTU0NTUiLCJpY29uem9vbSI6IjEwMCIsInRpdGxlY29sb3IiOiIjMjYyNjI2In0sImRhdGEiOnsiQzE0NjU4MDk5NDMyMzEiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtMS5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifSwiQzE0NjU4MDk5NDMyMzIiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtMi5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifSwiQzE0NjU4MDk5NDMyMzMiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtMy5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifSwiQzE0NjU4MDk5NDMyMzQiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtNC5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIifX0sImlkIjoiZ29vZHMifSwiTTE0NjU4MTAwNTk2OTQiOnsicGFyYW1zIjp7ImNvbnRlbnQiOiJQSEFnYzNSNWJHVTlJblJsZUhRdFlXeHBaMjQ2SUdObGJuUmxjanNpUGp4aWNpOCtQQzl3UGp4d0lITjBlV3hsUFNKMFpYaDBMV0ZzYVdkdU9pQmpaVzUwWlhJN0lqN25pWWptbllQbWlZRG1uSWtvWXlsWVdPV1ZodVdmamp3dmNENDhjRDRtYm1KemNEczhZbkl2UGp3dmNEND0ifSwic3R5bGUiOnsiYmFja2dyb3VuZCI6IiNmZmZmZmYifSwiaWQiOiJyaWNodGV4dCJ9fX0=', '../addons/ewei_shopv2/plugin/diypage/static/template/default3/preview.jpg', 3, 0, 0, 0),
(4, 0, 1, '系统模板04', 'eyJwYWdlIjp7InR5cGUiOiIxIiwidGl0bGUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwNCIsIm5hbWUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwNCIsImRlc2MiOiIiLCJpY29uIjoiIiwia2V5d29yZCI6IiIsImJhY2tncm91bmQiOiIjZmFmYWZhIiwiZGl5bWVudSI6Ii0xIn0sIml0ZW1zIjp7Ik0xNDY1ODEwMzUyODk0Ijp7ImRhdGEiOnsiQzE0NjU4MTAzNTI4OTQiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDRcL3BpY3R1cmVfMS5wbmciLCJsaW5rdXJsIjoiIn0sIkMxNDY1ODEwMzUyODk1Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQ0XC9waWN0dXJlXzIucG5nIiwibGlua3VybCI6IiJ9LCJNMTQ2NTgxMDM3MDM5OSI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0NFwvcGljdHVyZV8zLnBuZyIsImxpbmt1cmwiOiIifSwiTTE0NjU4MTAzNzE3MDEiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDRcL3BpY3R1cmVfNC5wbmciLCJsaW5rdXJsIjoiIn0sIk0xNDY1ODEwMzcyNzkxIjp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQ0XC9waWN0dXJlXzUucG5nIiwibGlua3VybCI6IiJ9fSwiaWQiOiJwaWN0dXJlIiwic3R5bGUiOnsicGFkZGluZ3RvcCI6IjAiLCJwYWRkaW5nbGVmdCI6IjAifX0sIk0xNDY1ODg5OTQ0NzY5Ijp7InBhcmFtcyI6eyJjb250ZW50IjoiUEhBZ2MzUjViR1U5SW5SbGVIUXRZV3hwWjI0NklHTmxiblJsY2pzaVB1V2J2dWVKaCthZHBlYTZrT1M2anVlOWtlZTduTys4ak9lSmlPYWRnK1c5a3VXT24rUzluT2lBaGVhSmdPYWNpVHd2Y0Q0PSJ9LCJzdHlsZSI6eyJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsInBhZGRpbmciOiIyMCJ9LCJpZCI6InJpY2h0ZXh0In19fQ==', '../addons/ewei_shopv2/plugin/diypage/static/template/default4/preview.jpg', 4, 0, 0, 0),
(5, 0, 2, '系统模板05', 'eyJwYWdlIjp7InR5cGUiOiIyIiwidGl0bGUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwNSIsIm5hbWUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwNSIsImRlc2MiOiIiLCJpY29uIjoiIiwia2V5d29yZCI6InQ1IiwiYmFja2dyb3VuZCI6IiNmYWZhZmEiLCJkaXltZW51IjoiLTEifSwiaXRlbXMiOnsiTTE0NjU4MTA3NTE4MDciOnsic3R5bGUiOnsiZG90c3R5bGUiOiJyb3VuZCIsImRvdGFsaWduIjoibGVmdCIsImJhY2tncm91bmQiOiIjZmZmZmZmIiwibGVmdHJpZ2h0IjoiMTAiLCJib3R0b20iOiIxMCIsIm9wYWNpdHkiOiIwLjcifSwiZGF0YSI6eyJDMTQ2NTgxMDc1MTgwNyI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0NVwvYmFubmVyXzEuanBnIiwibGlua3VybCI6IiJ9LCJDMTQ2NTgxMDc1MTgwOCI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0NVwvYmFubmVyXzIuanBnIiwibGlua3VybCI6IiJ9LCJNMTQ2NTgxMDc2NjQ4NiI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0NVwvYmFubmVyXzMuanBnIiwibGlua3VybCI6IiJ9fSwiaWQiOiJiYW5uZXIifSwiTTE0NjU4MTA5NzA0OTQiOnsic3R5bGUiOnsibmF2c3R5bGUiOiIiLCJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsInJvd251bSI6IjQifSwiZGF0YSI6eyJDMTQ2NTgxMDk3MDQ5NCI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0NVwvbWVudV8xLnBuZyIsImxpbmt1cmwiOiIiLCJ0ZXh0IjoiSE9NRSIsImNvbG9yIjoiIzY2NjY2NiJ9LCJDMTQ2NTgxMDk3MDQ5NSI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0NVwvbWVudV8yLnBuZyIsImxpbmt1cmwiOiIiLCJ0ZXh0IjoiTkVXIiwiY29sb3IiOiIjNjY2NjY2In0sIkMxNDY1ODEwOTcwNDk2Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQ1XC9tZW51XzMucG5nIiwibGlua3VybCI6IiIsInRleHQiOiJIT1QiLCJjb2xvciI6IiM2NjY2NjYifSwiQzE0NjU4MTA5NzA0OTciOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDVcL21lbnVfNC5wbmciLCJsaW5rdXJsIjoiIiwidGV4dCI6IkxJU1QiLCJjb2xvciI6IiM2NjY2NjYifX0sImlkIjoibWVudSJ9LCJNMTQ2NTgxMTA5OTI0MCI6eyJwYXJhbXMiOnsicm93IjoiMyJ9LCJkYXRhIjp7IkMxNDY1ODExMDk5MjQwIjp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQ1XC9waWN0dXJld18xLmpwZyIsImxpbmt1cmwiOiIifSwiQzE0NjU4MTEwOTkyNDEiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDVcL3BpY3R1cmV3XzQuanBnIiwibGlua3VybCI6IiJ9LCJDMTQ2NTgxMTA5OTI0MyI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0NVwvcGljdHVyZXdfMS5qcGciLCJsaW5rdXJsIjoiIn19LCJpZCI6InBpY3R1cmV3Iiwic3R5bGUiOnsiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJwYWRkaW5ndG9wIjoiNSIsInBhZGRpbmdsZWZ0IjoiNSJ9fSwiTTE0NjU4MTIzOTAxNzQiOnsicGFyYW1zIjp7InJvdyI6IjIifSwiZGF0YSI6eyJDMTQ2NTgxMjM5MDE3NSI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0NVwvcGljdHVyZXdfMy5qcGciLCJsaW5rdXJsIjoiIn0sIkMxNDY1ODEyMzkwMTc2Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQ1XC9waWN0dXJld18zLmpwZyIsImxpbmt1cmwiOiIifX0sImlkIjoicGljdHVyZXciLCJzdHlsZSI6eyJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsInBhZGRpbmd0b3AiOiIwIiwicGFkZGluZ2xlZnQiOiI1In19LCJNMTQ2NTg3MjQ4NTQ4NiI6eyJzdHlsZSI6eyJoZWlnaHQiOiIxMCIsImJhY2tncm91bmQiOiIjZmFmYWZhIn0sImlkIjoiYmxhbmsifSwiTTE0NjU4MTExNzQ5NTgiOnsiZGF0YSI6eyJDMTQ2NTgxMTE3NDk1OSI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0NVwvcGljdHVyZV8xLmpwZyIsImxpbmt1cmwiOiIifX0sImlkIjoicGljdHVyZSIsInN0eWxlIjp7InBhZGRpbmd0b3AiOiIwIiwicGFkZGluZ2xlZnQiOiIwIn19LCJNMTQ2NTgxMjQxMTM4MSI6eyJwYXJhbXMiOnsic2hvd3RpdGxlIjoiMSIsInNob3dwcmljZSI6IjEiLCJnb29kc2RhdGEiOiIwIiwiY2F0ZWlkIjoiIiwiY2F0ZW5hbWUiOiIiLCJncm91cGlkIjoiIiwiZ3JvdXBuYW1lIjoiIiwiZ29vZHNzb3J0IjoiMCIsImdvb2RzbnVtIjoiNiIsInNob3dpY29uIjoiMSIsImljb25wb3NpdGlvbiI6ImxlZnQgdG9wIn0sInN0eWxlIjp7Imxpc3RzdHlsZSI6ImJsb2NrIiwiYnV5c3R5bGUiOiJidXlidG4tMSIsImdvb2RzaWNvbiI6InJlY29tbWFuZCIsInByaWNlY29sb3IiOiIjZWQyODIyIiwiaWNvbnBhZGRpbmd0b3AiOiIwIiwiaWNvbnBhZGRpbmdsZWZ0IjoiMCIsImJ1eWJ0bmNvbG9yIjoiI2ZlNTQ1NSIsImljb256b29tIjoiMTAwIiwidGl0bGVjb2xvciI6IiMyNjI2MjYifSwiZGF0YSI6eyJDMTQ2NTgxMjQxMTM4MSI6eyJ0aHVtYiI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvaW1hZ2VzXC9kZWZhdWx0XC9nb29kcy0xLmpwZyIsInByaWNlIjoiMjAuMDAiLCJ0aXRsZSI6Ilx1OGZkOVx1OTFjY1x1NjYyZlx1NTU0Nlx1NTRjMVx1NjgwN1x1OTg5OCIsImdpZCI6IiJ9LCJDMTQ2NTgxMjQxMTM4MiI6eyJ0aHVtYiI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvaW1hZ2VzXC9kZWZhdWx0XC9nb29kcy0yLmpwZyIsInByaWNlIjoiMjAuMDAiLCJ0aXRsZSI6Ilx1OGZkOVx1OTFjY1x1NjYyZlx1NTU0Nlx1NTRjMVx1NjgwN1x1OTg5OCIsImdpZCI6IiJ9LCJDMTQ2NTgxMjQxMTM4MyI6eyJ0aHVtYiI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvaW1hZ2VzXC9kZWZhdWx0XC9nb29kcy0zLmpwZyIsInByaWNlIjoiMjAuMDAiLCJ0aXRsZSI6Ilx1OGZkOVx1OTFjY1x1NjYyZlx1NTU0Nlx1NTRjMVx1NjgwN1x1OTg5OCIsImdpZCI6IiJ9LCJDMTQ2NTgxMjQxMTM4NCI6eyJ0aHVtYiI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvaW1hZ2VzXC9kZWZhdWx0XC9nb29kcy00LmpwZyIsInByaWNlIjoiMjAuMDAiLCJ0aXRsZSI6Ilx1OGZkOVx1OTFjY1x1NjYyZlx1NTU0Nlx1NTRjMVx1NjgwN1x1OTg5OCIsImdpZCI6IiJ9fSwiaWQiOiJnb29kcyJ9LCJNMTQ2NTgxMjQ2Njg5MyI6eyJwYXJhbXMiOnsiY29udGVudCI6IlBIQWdjM1I1YkdVOUluUmxlSFF0WVd4cFoyNDZJR05sYm5SbGNqc2lQanhpY2k4K1BDOXdQanh3SUhOMGVXeGxQU0owWlhoMExXRnNhV2R1T2lCalpXNTBaWEk3SWo3a3U2WGt1SXJsbTc3bmlZZmxuWWZtbmFYbXVwRGt1bzdudlpIbnU1enZ2SXpuaVlqbW5ZUGx2WkxsanBcL2t2WnpvZ0lYbWlZRG1uSW5qZ0lJOEwzQStQSEErUEdKeUx6NDhMM0ErIn0sInN0eWxlIjp7ImJhY2tncm91bmQiOiIjZmZmZmZmIn0sImlkIjoicmljaHRleHQifX19', '../addons/ewei_shopv2/plugin/diypage/static/template/default5/preview.jpg', 5, 0, 0, 0),
(6, 0, 1, '系统模板06', 'eyJwYWdlIjp7InR5cGUiOiIxIiwidGl0bGUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwNiIsIm5hbWUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwNiIsImRlc2MiOiIiLCJpY29uIjoiIiwia2V5d29yZCI6IiIsImJhY2tncm91bmQiOiIjZmFmYWZhIiwiZGl5bWVudSI6Ii0xIn0sIml0ZW1zIjp7Ik0xNDY1ODEyNjAyOTMzIjp7ImRhdGEiOnsiQzE0NjU4MTI2MDI5MzMiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDZcL3BpY3R1cmVfMS5qcGciLCJsaW5rdXJsIjoiIn0sIkMxNDY1ODEyNjAyOTM0Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQ2XC9waWN0dXJlXzIuanBnIiwibGlua3VybCI6IiJ9LCJNMTQ2NTgxMjYwNDQ5NCI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0NlwvcGljdHVyZV8zLmpwZyIsImxpbmt1cmwiOiIifSwiTTE0NjU4MTI2MDUyNDUiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDZcL3BpY3R1cmVfNC5qcGciLCJsaW5rdXJsIjoiIn0sIk0xNDY1ODEyNjA1OTgwIjp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQ2XC9waWN0dXJlXzUuanBnIiwibGlua3VybCI6IiJ9LCJNMTQ2NTgxMjYwNzA0NSI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0NlwvcGljdHVyZV82LmpwZyIsImxpbmt1cmwiOiIifX0sImlkIjoicGljdHVyZSIsInN0eWxlIjp7InBhZGRpbmd0b3AiOiIwIiwicGFkZGluZ2xlZnQiOiIwIn19LCJNMTQ2NTg5MDE4NDY1MCI6eyJwYXJhbXMiOnsiY29udGVudCI6IlBIQWdjM1I1YkdVOUluUmxlSFF0WVd4cFoyNDZJR05sYm5SbGNqc2lQdVdidnVlSmgrYWRwZWE2a09TNmp1ZTlrZWU3bk8rOGpPZUppT2FkZytXOWt1V09uK1M5bk9pQWhlYUpnT2FjaVR3dmNEND0ifSwic3R5bGUiOnsiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJwYWRkaW5nIjoiMjAifSwiaWQiOiJyaWNodGV4dCJ9fX0=', '../addons/ewei_shopv2/plugin/diypage/static/template/default6/preview.jpg', 6, 0, 0, 0),
(7, 0, 2, '系统模板07', 'eyJwYWdlIjp7InR5cGUiOiIyIiwidGl0bGUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwNyIsIm5hbWUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwNyIsImRlc2MiOiIiLCJpY29uIjoiIiwia2V5d29yZCI6IiIsImJhY2tncm91bmQiOiIjZmFmYWZhIiwiZGl5bWVudSI6Ii0xIn0sIml0ZW1zIjp7Ik0xNDY1ODEyNjkxMzg5Ijp7ImRhdGEiOnsiQzE0NjU4MTI2OTEzODkiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDdcL3BpY3R1cmVfMS5qcGciLCJsaW5rdXJsIjoiIn19LCJpZCI6InBpY3R1cmUiLCJzdHlsZSI6eyJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsInBhZGRpbmd0b3AiOiIwIiwicGFkZGluZ2xlZnQiOiIwIn19LCJNMTQ2NTgxMjcyODgyMSI6eyJwYXJhbXMiOnsicGxhY2Vob2xkZXIiOiJcdThiZjdcdThmOTNcdTUxNjVcdTUxNzNcdTk1MmVcdTViNTdcdThmZGJcdTg4NGNcdTY0MWNcdTdkMjIifSwic3R5bGUiOnsiaW5wdXRiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsImJhY2tncm91bmQiOiIjZjFmMWYyIiwiaWNvbmNvbG9yIjoiI2I0YjRiNCIsImNvbG9yIjoiIzk5OTk5OSIsInBhZGRpbmd0b3AiOiIxMCIsInBhZGRpbmdsZWZ0IjoiMTAiLCJ0ZXh0YWxpZ24iOiJsZWZ0Iiwic2VhcmNoc3R5bGUiOiIifSwiaWQiOiJzZWFyY2gifSwiTTE0NjU4MTI3MzkxOTciOnsicGFyYW1zIjp7InJvdyI6IjMifSwiZGF0YSI6eyJDMTQ2NTgxMjczOTE5NyI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0N1wvcGljdHVyZXdfMS5qcGciLCJsaW5rdXJsIjoiIn0sIkMxNDY1ODEyNzM5MTk4Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQ3XC9waWN0dXJld18yLmpwZyIsImxpbmt1cmwiOiIifSwiQzE0NjU4MTI3MzkxOTkiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDdcL3BpY3R1cmV3XzMuanBnIiwibGlua3VybCI6IiJ9fSwiaWQiOiJwaWN0dXJldyIsInN0eWxlIjp7ImJhY2tncm91bmQiOiIjZmZmZmZmIiwicGFkZGluZ3RvcCI6IjAiLCJwYWRkaW5nbGVmdCI6IjUifX0sIk0xNDY1ODEyNzg0NTY1Ijp7ImRhdGEiOnsiQzE0NjU4MTI3ODQ1NjUiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDdcL3BpY3R1cmVfMy5qcGciLCJsaW5rdXJsIjoiIn0sIk0xNDY1ODEyODE5OTQ4Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQ3XC9waWN0dXJlXzIuanBnIiwibGlua3VybCI6IiJ9fSwiaWQiOiJwaWN0dXJlIiwic3R5bGUiOnsiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJwYWRkaW5ndG9wIjoiNCIsInBhZGRpbmdsZWZ0IjoiMCJ9fSwiTTE0NjU4MTI4NzU5ODgiOnsicGFyYW1zIjp7InJvdyI6IjIifSwiZGF0YSI6eyJDMTQ2NTgxMjg3NTk4OCI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0N1wvcGljdHVyZXdfNC5qcGciLCJsaW5rdXJsIjoiIn0sIkMxNDY1ODEyODc1OTg5Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQ3XC9waWN0dXJld181LmpwZyIsImxpbmt1cmwiOiIifSwiQzE0NjU4MTI4NzU5OTAiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDdcL3BpY3R1cmV3XzYuanBnIiwibGlua3VybCI6IiJ9LCJDMTQ2NTgxMjg3NTk5MSI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0N1wvcGljdHVyZXdfNy5qcGciLCJsaW5rdXJsIjoiIn19LCJpZCI6InBpY3R1cmV3Iiwic3R5bGUiOnsiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJwYWRkaW5ndG9wIjoiMCIsInBhZGRpbmdsZWZ0IjoiMCJ9fSwiTTE0NjU4NzI4OTQxMjAiOnsic3R5bGUiOnsiaGVpZ2h0IjoiMTAiLCJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiJ9LCJpZCI6ImJsYW5rIn0sIk0xNDY1ODcyODMyODk1Ijp7InBhcmFtcyI6eyJ0aXRsZSI6Ilx1NzBlZFx1OTUwMFx1NTU0Nlx1NTRjMSIsImljb24iOiIifSwic3R5bGUiOnsiYmFja2dyb3VuZCI6IiNmMjMyNGMiLCJjb2xvciI6IiNmZmZmZmYiLCJ0ZXh0YWxpZ24iOiJjZW50ZXIiLCJmb250c2l6ZSI6IjE4IiwicGFkZGluZ3RvcCI6IjUiLCJwYWRkaW5nbGVmdCI6IjUifSwiaWQiOiJ0aXRsZSJ9LCJNMTQ2NTgxMjkwNDA1MyI6eyJwYXJhbXMiOnsic2hvd3RpdGxlIjoiMSIsInNob3dwcmljZSI6IjEiLCJnb29kc2RhdGEiOiIwIiwiY2F0ZWlkIjoiIiwiY2F0ZW5hbWUiOiIiLCJncm91cGlkIjoiIiwiZ3JvdXBuYW1lIjoiIiwiZ29vZHNzb3J0IjoiMCIsImdvb2RzbnVtIjoiNiIsInNob3dpY29uIjoiMSIsImljb25wb3NpdGlvbiI6ImxlZnQgdG9wIn0sInN0eWxlIjp7Imxpc3RzdHlsZSI6ImJsb2NrIiwiYnV5c3R5bGUiOiJidXlidG4tMSIsImdvb2RzaWNvbiI6InJlY29tbWFuZCIsInByaWNlY29sb3IiOiIjZWQyODIyIiwiaWNvbnBhZGRpbmd0b3AiOiIwIiwiaWNvbnBhZGRpbmdsZWZ0IjoiMCIsImJ1eWJ0bmNvbG9yIjoiI2ZlNTQ1NSIsImljb256b29tIjoiMTAwIiwidGl0bGVjb2xvciI6IiMyNjI2MjYifSwiZGF0YSI6eyJDMTQ2NTgxMjkwNDA1MyI6eyJ0aHVtYiI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvaW1hZ2VzXC9kZWZhdWx0XC9nb29kcy0xLmpwZyIsInByaWNlIjoiMjAuMDAiLCJ0aXRsZSI6Ilx1OGZkOVx1OTFjY1x1NjYyZlx1NTU0Nlx1NTRjMVx1NjgwN1x1OTg5OCIsImdpZCI6IiJ9LCJDMTQ2NTgxMjkwNDA1NCI6eyJ0aHVtYiI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvaW1hZ2VzXC9kZWZhdWx0XC9nb29kcy0yLmpwZyIsInByaWNlIjoiMjAuMDAiLCJ0aXRsZSI6Ilx1OGZkOVx1OTFjY1x1NjYyZlx1NTU0Nlx1NTRjMVx1NjgwN1x1OTg5OCIsImdpZCI6IiJ9LCJDMTQ2NTgxMjkwNDA1NSI6eyJ0aHVtYiI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvaW1hZ2VzXC9kZWZhdWx0XC9nb29kcy0zLmpwZyIsInByaWNlIjoiMjAuMDAiLCJ0aXRsZSI6Ilx1OGZkOVx1OTFjY1x1NjYyZlx1NTU0Nlx1NTRjMVx1NjgwN1x1OTg5OCIsImdpZCI6IiJ9LCJDMTQ2NTgxMjkwNDA1NiI6eyJ0aHVtYiI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvaW1hZ2VzXC9kZWZhdWx0XC9nb29kcy00LmpwZyIsInByaWNlIjoiMjAuMDAiLCJ0aXRsZSI6Ilx1OGZkOVx1OTFjY1x1NjYyZlx1NTU0Nlx1NTRjMVx1NjgwN1x1OTg5OCIsImdpZCI6IiJ9fSwiaWQiOiJnb29kcyJ9LCJNMTQ2NTg4ODU1MjYwNiI6eyJwYXJhbXMiOnsiY29udGVudCI6IlBIQWdjM1I1YkdVOUluUmxlSFF0WVd4cFoyNDZJR05sYm5SbGNqc2lQdVdidnVlSmgrYWRwZWE2a09TNmp1ZTlrZWU3bk8rOGpPZUppT2FkZytXOWt1V09uK1M5bk9pQWhlYUpnT2FjaVR3dmNEND0ifSwic3R5bGUiOnsiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJwYWRkaW5nIjoiMjAifSwiaWQiOiJyaWNodGV4dCJ9fX0=', '../addons/ewei_shopv2/plugin/diypage/static/template/default7/preview.jpg', 7, 0, 0, 0),
(8, 0, 2, '系统模板08', 'eyJwYWdlIjp7InR5cGUiOiIyIiwidGl0bGUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwOCIsIm5hbWUiOiJcdTMwMTBcdTZhMjFcdTY3N2ZcdTMwMTFcdTdjZmJcdTdlZGZcdTZhMjFcdTY3N2YwOCIsImRlc2MiOiIiLCJpY29uIjoiIiwia2V5d29yZCI6IiIsImJhY2tncm91bmQiOiIjZmFmYWZhIiwiZGl5bWVudSI6Ii0xIn0sIml0ZW1zIjp7Ik0xNDY1ODEyOTk3MDQ1Ijp7ImRhdGEiOnsiQzE0NjU4MTI5OTcwNDUiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDhcL3BpY3R1cmVfMS5qcGciLCJsaW5rdXJsIjoiIn19LCJpZCI6InBpY3R1cmUiLCJzdHlsZSI6eyJwYWRkaW5ndG9wIjoiMCIsInBhZGRpbmdsZWZ0IjoiMCJ9fSwiTTE0NjU4MTMwMTc1NDkiOnsicGFyYW1zIjp7InJvdyI6IjMifSwiZGF0YSI6eyJDMTQ2NTgxMzAxNzU1MCI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0OFwvcGljdHVyZXdfMS5qcGciLCJsaW5rdXJsIjoiIn0sIkMxNDY1ODEzMDE3NTUxIjp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQ4XC9waWN0dXJld18yLmpwZyIsImxpbmt1cmwiOiIifSwiQzE0NjU4MTMwMTc1NTIiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDhcL3BpY3R1cmV3XzMuanBnIiwibGlua3VybCI6IiJ9fSwiaWQiOiJwaWN0dXJldyIsInN0eWxlIjp7ImJhY2tncm91bmQiOiIjZmZmZmZmIiwicGFkZGluZ3RvcCI6IjAiLCJwYWRkaW5nbGVmdCI6IjAifX0sIk0xNDY1ODEzMDQyODc2Ijp7ImRhdGEiOnsiQzE0NjU4MTMwNDI4NzYiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDhcL3BpY3R1cmVfMi5qcGciLCJsaW5rdXJsIjoiIn0sIkMxNDY1ODEzMDQyODc3Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQ4XC9waWN0dXJlXzMuanBnIiwibGlua3VybCI6IiJ9fSwiaWQiOiJwaWN0dXJlIiwic3R5bGUiOnsicGFkZGluZ3RvcCI6IjAiLCJwYWRkaW5nbGVmdCI6IjAifX0sIk0xNDY1ODEzMDg4ODA0Ijp7InBhcmFtcyI6eyJyb3ciOiI0In0sImRhdGEiOnsiQzE0NjU4MTMwODg4MDQiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDhcL3BpY3R1cmV3XzQuanBnIiwibGlua3VybCI6IiJ9LCJDMTQ2NTgxMzA4ODgwNSI6eyJpbWd1cmwiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL3RlbXBsYXRlXC9kZWZhdWx0OFwvcGljdHVyZXdfNS5qcGciLCJsaW5rdXJsIjoiIn0sIkMxNDY1ODEzMDg4ODA2Ijp7ImltZ3VybCI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvdGVtcGxhdGVcL2RlZmF1bHQ4XC9waWN0dXJld182LmpwZyIsImxpbmt1cmwiOiIifSwiQzE0NjU4MTMwODg4MDciOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC90ZW1wbGF0ZVwvZGVmYXVsdDhcL3BpY3R1cmV3XzcuanBnIiwibGlua3VybCI6IiJ9fSwiaWQiOiJwaWN0dXJldyIsInN0eWxlIjp7ImJhY2tncm91bmQiOiIjZmZmZmZmIiwicGFkZGluZ3RvcCI6IjAiLCJwYWRkaW5nbGVmdCI6IjAifX0sIk0xNDY1ODEzMTMxMzgwIjp7InBhcmFtcyI6eyJzaG93dGl0bGUiOiIxIiwic2hvd3ByaWNlIjoiMSIsImdvb2RzZGF0YSI6IjAiLCJjYXRlaWQiOiIiLCJjYXRlbmFtZSI6IiIsImdyb3VwaWQiOiIiLCJncm91cG5hbWUiOiIiLCJnb29kc3NvcnQiOiIwIiwiZ29vZHNudW0iOiI2Iiwic2hvd2ljb24iOiIxIiwiaWNvbnBvc2l0aW9uIjoibGVmdCB0b3AifSwic3R5bGUiOnsibGlzdHN0eWxlIjoiYmxvY2siLCJidXlzdHlsZSI6ImJ1eWJ0bi0xIiwiZ29vZHNpY29uIjoicmVjb21tYW5kIiwicHJpY2Vjb2xvciI6IiNlZDI4MjIiLCJpY29ucGFkZGluZ3RvcCI6IjAiLCJpY29ucGFkZGluZ2xlZnQiOiIwIiwiYnV5YnRuY29sb3IiOiIjZmU1NDU1IiwiaWNvbnpvb20iOiIxMDAiLCJ0aXRsZWNvbG9yIjoiIzI2MjYyNiJ9LCJkYXRhIjp7IkMxNDY1ODEzMTMxMzgwIjp7InRodW1iIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2dvb2RzLTEuanBnIiwicHJpY2UiOiIyMC4wMCIsInRpdGxlIjoiXHU4ZmQ5XHU5MWNjXHU2NjJmXHU1NTQ2XHU1NGMxXHU2ODA3XHU5ODk4IiwiZ2lkIjoiIn0sIkMxNDY1ODEzMTMxMzgxIjp7InRodW1iIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2dvb2RzLTIuanBnIiwicHJpY2UiOiIyMC4wMCIsInRpdGxlIjoiXHU4ZmQ5XHU5MWNjXHU2NjJmXHU1NTQ2XHU1NGMxXHU2ODA3XHU5ODk4IiwiZ2lkIjoiIn0sIkMxNDY1ODEzMTMxMzgyIjp7InRodW1iIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2dvb2RzLTMuanBnIiwicHJpY2UiOiIyMC4wMCIsInRpdGxlIjoiXHU4ZmQ5XHU5MWNjXHU2NjJmXHU1NTQ2XHU1NGMxXHU2ODA3XHU5ODk4IiwiZ2lkIjoiIn0sIkMxNDY1ODEzMTMxMzgzIjp7InRodW1iIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2dvb2RzLTQuanBnIiwicHJpY2UiOiIyMC4wMCIsInRpdGxlIjoiXHU4ZmQ5XHU5MWNjXHU2NjJmXHU1NTQ2XHU1NGMxXHU2ODA3XHU5ODk4IiwiZ2lkIjoiIn19LCJpZCI6Imdvb2RzIn0sIk0xNDY1ODg4ODMxMjc4Ijp7InBhcmFtcyI6eyJjb250ZW50IjoiUEhBZ2MzUjViR1U5SW5SbGVIUXRZV3hwWjI0NklHTmxiblJsY2pzaVB1V2J2dWVKaCthZHBlYTZrT1M2anVlOWtlZTduTys4ak9lSmlPYWRnK1c5a3VXT24rUzluT2lBaGVhSmdPYWNpVHd2Y0Q0PSJ9LCJzdHlsZSI6eyJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsInBhZGRpbmciOiIyMCJ9LCJpZCI6InJpY2h0ZXh0In19fQ==', '../addons/ewei_shopv2/plugin/diypage/static/template/default8/preview.jpg', 8, 0, 0, 0),
(9, 0, 3, '会员中心01', 'eyJwYWdlIjp7InR5cGUiOiIzIiwidGl0bGUiOiJcdTRmMWFcdTU0NThcdTRlMmRcdTVmYzMiLCJuYW1lIjoiXHU0ZjFhXHU1NDU4XHU0ZTJkXHU1ZmMzIiwiZGVzYyI6IiIsImljb24iOiIiLCJrZXl3b3JkIjoiIiwiYmFja2dyb3VuZCI6IiNmYWZhZmEiLCJkaXltZW51IjoiMCIsImZvbGxvd2JhciI6IjAiLCJ2aXNpdCI6IjAiLCJ2aXNpdGxldmVsIjp7Im1lbWJlciI6IiIsImNvbW1pc3Npb24iOiIifSwibm92aXNpdCI6eyJ0aXRsZSI6IiIsImxpbmsiOiIifX0sIml0ZW1zIjp7Ik0xNDc0NTI2MTM0ODE0Ijp7InBhcmFtcyI6eyJzdHlsZSI6ImRlZmF1bHQxIiwibGV2ZWxsaW5rIjoiIiwic2V0aWNvbiI6Imljb24tc2V0dGluZ3MiLCJzZXRsaW5rIjoiIiwibGVmdG5hdiI6Ilx1NTE0NVx1NTAzYyIsImxlZnRuYXZsaW5rIjoiIiwicmlnaHRuYXYiOiJcdTUxNTFcdTYzNjIiLCJyaWdodG5hdmxpbmsiOiIifSwic3R5bGUiOnsiYmFja2dyb3VuZCI6IiNmZTU0NTUiLCJ0ZXh0Y29sb3IiOiIjZmZmZmZmIiwidGV4dGxpZ2h0IjoiI2ZlZjMxZiIsImhlYWRzdHlsZSI6IiJ9LCJpbmZvIjp7ImF2YXRhciI6IiIsIm5pY2tuYW1lIjoiIiwibGV2ZWxuYW1lIjoiIiwidGV4dG1vbmV5IjoiIiwidGV4dGNyZWRpdCI6IiIsIm1vbmV5IjoiIiwiY3JlZGl0IjoiIn0sImlkIjoibWVtYmVyIn0sIk0xNDc0NTI2MTM4OTEwIjp7InBhcmFtcyI6eyJsaW5rdXJsIjoiIiwidGl0bGUiOiJcdTdlZDFcdTViOWFcdTYyNGJcdTY3M2FcdTUzZjciLCJ0ZXh0IjoiXHU1OTgyXHU2NzljXHU2MGE4XHU3NTI4XHU2MjRiXHU2NzNhXHU1M2Y3XHU2Y2U4XHU1MThjXHU4ZmM3XHU0ZjFhXHU1NDU4XHU2MjE2XHU2MGE4XHU2MGYzXHU5MDFhXHU4ZmM3XHU1ZmFlXHU0ZmUxXHU1OTE2XHU4ZDJkXHU3MjY5XHU4YmY3XHU3ZWQxXHU1YjlhXHU2MGE4XHU3Njg0XHU2MjRiXHU2NzNhXHU1M2Y3XHU3ODAxIiwiaWNvbmNsYXNzIjoiaWNvbi1tb2JpbGUifSwic3R5bGUiOnsibWFyZ2ludG9wIjoiMTAiLCJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsInRpdGxlY29sb3IiOiIjZmYwMDExIiwidGV4dGNvbG9yIjoiIzk5OTk5OSIsImljb25jb2xvciI6IiM5OTk5OTkifSwiaWQiOiJiaW5kbW9iaWxlIn0sIk0xNDc0NTI2MTQzNDg3Ijp7InN0eWxlIjp7Im1hcmdpbnRvcCI6IjEwIiwiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJpY29uY29sb3IiOiIjOTk5OTk5IiwidGV4dGNvbG9yIjoiIzMzMzMzMyIsInJlbWFya2NvbG9yIjoiIzg4ODg4OCJ9LCJkYXRhIjp7IkMxNDc0NTI2MTQzNDg5Ijp7InRleHQiOiJcdTYyMTFcdTc2ODRcdThiYTJcdTUzNTUiLCJsaW5rdXJsIjoiIiwiaWNvbmNsYXNzIjoiaWNvbi1saXN0IiwicmVtYXJrIjoiXHU2N2U1XHU3NzBiXHU1MTY4XHU5MGU4IiwiZG90bnVtIjoiIn19LCJpZCI6Imxpc3RtZW51In0sIk0xNDc0NTI2MTgxNDMxIjp7InBhcmFtcyI6eyJyb3dudW0iOiI0IiwiYm9yZGVyIjoiMSIsImJvcmRlcnRvcCI6IjAiLCJib3JkZXJib3R0b20iOiIxIn0sInN0eWxlIjp7ImJhY2tncm91bmQiOiIjZmZmZmZmIiwiYm9yZGVyY29sb3IiOiIjZWJlYmViIiwidGV4dGNvbG9yIjoiIzdhN2E3YSIsImljb25jb2xvciI6IiNhYWFhYWEiLCJkb3Rjb2xvciI6IiNmZjAwMTEifSwiZGF0YSI6eyJDMTQ3NDUyNjE4MTQzMSI6eyJpY29uY2xhc3MiOiJpY29uLWNhcmQiLCJ0ZXh0IjoiXHU1Zjg1XHU0ZWQ4XHU2YjNlIiwibGlua3VybCI6IiIsImRvdG51bSI6IjAifSwiQzE0NzQ1MjYxODE0MzIiOnsiaWNvbmNsYXNzIjoiaWNvbi1ib3giLCJ0ZXh0IjoiXHU1Zjg1XHU1M2QxXHU4ZDI3IiwibGlua3VybCI6IiIsImRvdG51bSI6IjAifSwiQzE0NzQ1MjYxODE0MzMiOnsiaWNvbmNsYXNzIjoiaWNvbi1kZWxpdmVyIiwidGV4dCI6Ilx1NWY4NVx1NjUzNlx1OGQyNyIsImxpbmt1cmwiOiIiLCJkb3RudW0iOiIwIn0sIkMxNDc0NTI2MTgxNDM0Ijp7Imljb25jbGFzcyI6Imljb24tZWxlY3RyaWNhbCIsInRleHQiOiJcdTkwMDBcdTYzNjJcdThkMjciLCJsaW5rdXJsIjoiIiwiZG90bnVtIjoiMCJ9fSwiaWQiOiJpY29uZ3JvdXAifSwiTTE0NzQ1MjYxOTkxMDIiOnsic3R5bGUiOnsibWFyZ2ludG9wIjoiMTAiLCJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsImljb25jb2xvciI6IiM5OTk5OTkiLCJ0ZXh0Y29sb3IiOiIjMzMzMzMzIiwicmVtYXJrY29sb3IiOiIjODg4ODg4In0sImRhdGEiOnsiQzE0NzQ1MjYxOTkxMDIiOnsidGV4dCI6Ilx1NTIwNlx1OTUwMFx1NGUyZFx1NWZjMyIsImxpbmt1cmwiOiIiLCJpY29uY2xhc3MiOiJpY29uLWdyb3VwIiwicmVtYXJrIjoiXHU2N2U1XHU3NzBiIiwiZG90bnVtIjoiIn0sIkMxNDc0NTI2MTk5MTAzIjp7InRleHQiOiJcdTc5ZWZcdTUyMDZcdTdiN2VcdTUyMzAiLCJsaW5rdXJsIjoiIiwiaWNvbmNsYXNzIjoiaWNvbi1naWZ0cyIsInJlbWFyayI6Ilx1NjdlNVx1NzcwYiIsImRvdG51bSI6IiJ9LCJDMTQ3NDUyNjE5OTEwNCI6eyJ0ZXh0IjoiXHU3OWVmXHU1MjA2XHU1NTQ2XHU1N2NlIiwibGlua3VybCI6IiIsImljb25jbGFzcyI6Imljb24tY3JlZGl0bGV2ZWwiLCJyZW1hcmsiOiJcdTY3ZTVcdTc3MGIiLCJkb3RudW0iOiIifX0sImlkIjoibGlzdG1lbnUifSwiTTE0NzQ1MjYyMjIyMDYiOnsic3R5bGUiOnsibWFyZ2ludG9wIjoiMTAiLCJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsImljb25jb2xvciI6IiM5OTk5OTkiLCJ0ZXh0Y29sb3IiOiIjMzMzMzMzIiwicmVtYXJrY29sb3IiOiIjODg4ODg4In0sImRhdGEiOnsiQzE0NzQ1MjYyMjIyMDYiOnsidGV4dCI6Ilx1OTg4Nlx1NTNkNlx1NGYxOFx1NjBlMFx1NTIzOCIsImxpbmt1cmwiOiIiLCJpY29uY2xhc3MiOiJpY29uLXNhbWUiLCJyZW1hcmsiOiJcdTY3ZTVcdTc3MGIiLCJkb3RudW0iOiIifSwiQzE0NzQ1MjYyMjIyMDciOnsidGV4dCI6Ilx1NjIxMVx1NzY4NFx1NGYxOFx1NjBlMFx1NTIzOCIsImxpbmt1cmwiOiIiLCJpY29uY2xhc3MiOiJpY29uLWNhcmQiLCJyZW1hcmsiOiJcdTY3ZTVcdTc3MGIiLCJkb3RudW0iOiIifX0sImlkIjoibGlzdG1lbnUifSwiTTE0NzQ1MjYyNTM2MTQiOnsic3R5bGUiOnsibWFyZ2ludG9wIjoiMTAiLCJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsImljb25jb2xvciI6IiM5OTk5OTkiLCJ0ZXh0Y29sb3IiOiIjMzMzMzMzIiwicmVtYXJrY29sb3IiOiIjODg4ODg4In0sImRhdGEiOnsiQzE0NzQ1MjYyNTM2MTQiOnsidGV4dCI6Ilx1NzllZlx1NTIwNlx1NjM5Mlx1ODg0YyIsImxpbmt1cmwiOiIiLCJpY29uY2xhc3MiOiJpY29uLXJhbmsiLCJyZW1hcmsiOiJcdTY3ZTVcdTc3MGIiLCJkb3RudW0iOiIifSwiQzE0NzQ1MjYyNTM2MTUiOnsidGV4dCI6Ilx1NmQ4OFx1OGQzOVx1NjM5Mlx1ODg0YyIsImxpbmt1cmwiOiIiLCJpY29uY2xhc3MiOiJpY29uLW1vbmV5IiwicmVtYXJrIjoiXHU2N2U1XHU3NzBiIiwiZG90bnVtIjoiIn19LCJpZCI6Imxpc3RtZW51In0sIk0xNDc0NTI2MjgxNzYwIjp7InN0eWxlIjp7Im1hcmdpbnRvcCI6IjEwIiwiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJpY29uY29sb3IiOiIjOTk5OTk5IiwidGV4dGNvbG9yIjoiIzMzMzMzMyIsInJlbWFya2NvbG9yIjoiIzg4ODg4OCJ9LCJkYXRhIjp7IkMxNDc0NTI2MjgxNzYwIjp7InRleHQiOiJcdTYyMTFcdTc2ODRcdThkMmRcdTcyNjlcdThmNjYiLCJsaW5rdXJsIjoiIiwiaWNvbmNsYXNzIjoiaWNvbi1jYXJ0IiwicmVtYXJrIjoiXHU2N2U1XHU3NzBiIiwiZG90bnVtIjoiIn0sIkMxNDc0NTI2MjgxNzYxIjp7InRleHQiOiJcdTYyMTFcdTc2ODRcdTUxNzNcdTZjZTgiLCJsaW5rdXJsIjoiIiwiaWNvbmNsYXNzIjoiaWNvbi1saWtlIiwicmVtYXJrIjoiXHU2N2U1XHU3NzBiIiwiZG90bnVtIjoiIn0sIkMxNDc0NTI2MjgxNzYyIjp7InRleHQiOiJcdTYyMTFcdTc2ODRcdThkYjNcdThmZjkiLCJsaW5rdXJsIjoiIiwiaWNvbmNsYXNzIjoiaWNvbi1mb290cHJpbnQiLCJyZW1hcmsiOiJcdTY3ZTVcdTc3MGIiLCJkb3RudW0iOiIifSwiTTE0NzQ1MjYzMDA1NDMiOnsidGV4dCI6Ilx1NmQ4OFx1NjA2Zlx1NjNkMFx1OTE5Mlx1OGJiZVx1N2Y2ZSIsImxpbmt1cmwiOiIiLCJpY29uY2xhc3MiOiJpY29uLW5vdGljZSIsInJlbWFyayI6Ilx1NjdlNVx1NzcwYiIsImRvdG51bSI6IiJ9fSwiaWQiOiJsaXN0bWVudSJ9LCJNMTQ3NDUyNjMwNzI3MCI6eyJzdHlsZSI6eyJtYXJnaW50b3AiOiIxMCIsImJhY2tncm91bmQiOiIjZmZmZmZmIiwiaWNvbmNvbG9yIjoiIzk5OTk5OSIsInRleHRjb2xvciI6IiMzMzMzMzMiLCJyZW1hcmtjb2xvciI6IiM4ODg4ODgifSwiZGF0YSI6eyJDMTQ3NDUyNjMwNzI3MCI6eyJ0ZXh0IjoiXHU2NTM2XHU4ZDI3XHU1NzMwXHU1NzQwXHU3YmExXHU3NDA2IiwibGlua3VybCI6IiIsImljb25jbGFzcyI6Imljb24tYWRkcmVzcyIsInJlbWFyayI6Ilx1NjdlNVx1NzcwYiIsImRvdG51bSI6IiJ9LCJDMTQ3NDUyNjMwNzI3MSI6eyJ0ZXh0IjoiXHU1ZTJlXHU1MmE5XHU0ZTJkXHU1ZmMzIiwibGlua3VybCI6IiIsImljb25jbGFzcyI6Imljb24tcXVlc3Rpb25maWxsIiwicmVtYXJrIjoiXHU2N2U1XHU3NzBiIiwiZG90bnVtIjoiIn19LCJpZCI6Imxpc3RtZW51In0sIk0xNDc0NTk3NzI2NTU2Ijp7InBhcmFtcyI6eyJiaW5kdXJsIjoiIiwibG9nb3V0dXJsIjoiIn0sInN0eWxlIjp7InRleHRjb2xvciI6IiNmZjAwMTEiLCJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsIm1hcmdpbnRvcCI6IjEwIn0sImlkIjoibG9nb3V0In0sIk0xNDc0NTk3OTcxMjE4Ijp7InBhcmFtcyI6eyJjb250ZW50IjoiUEhBZ2MzUjViR1U5SW5SbGVIUXRZV3hwWjI0NklHTmxiblJsY2pzaVB1ZUppT2FkZythSmdPYWNpU0FvWXlrZ2VIaDQ1WldHNVorT1BDOXdQZz09In0sInN0eWxlIjp7ImJhY2tncm91bmQiOiIjZmZmZmZmIiwicGFkZGluZyI6IjIwIn0sImlkIjoicmljaHRleHQifX19', '../addons/ewei_shopv2/plugin/diypage/static/template/member1/preview.jpg', 9, 0, 0, 0),
(10, 0, 4, '分销中心01', 'eyJwYWdlIjp7InR5cGUiOiI0IiwidGl0bGUiOiJcdThiZjdcdThmOTNcdTUxNjVcdTk4NzVcdTk3NjJcdTY4MDdcdTk4OTgiLCJuYW1lIjoiXHU2NzJhXHU1NDdkXHU1NDBkXHU5ODc1XHU5NzYyIiwiZGVzYyI6IiIsImljb24iOiIiLCJrZXl3b3JkIjoiIiwiYmFja2dyb3VuZCI6IiNmYWZhZmEiLCJkaXltZW51IjoiLTEiLCJmb2xsb3diYXIiOiIwIiwidmlzaXQiOiIwIiwidmlzaXRsZXZlbCI6eyJtZW1iZXIiOiIiLCJjb21taXNzaW9uIjoiIn0sIm5vdmlzaXQiOnsidGl0bGUiOiIiLCJsaW5rIjoiIn19LCJpdGVtcyI6eyJNMTQ3NTk3NjIxMDU0NiI6eyJwYXJhbXMiOnsic3R5bGUiOiJkZWZhdWx0MSIsInNldGljb24iOiJpY29uLXNldHRpbmdzIiwic2V0bGluayI6IiIsImxlZnRuYXYiOiJcdTYzZDBcdTczYjAxIiwibGVmdG5hdmxpbmsiOiIiLCJyaWdodG5hdiI6Ilx1NjNkMFx1NzNiMDIiLCJyaWdodG5hdmxpbmsiOiIiLCJjZW50ZXJuYXYiOiJcdTYzZDBcdTczYjAiLCJjZW50ZXJuYXZsaW5rIjoiIn0sInN0eWxlIjp7ImJhY2tncm91bmQiOiIjZmU1NDU1IiwidGV4dGNvbG9yIjoiI2ZmZmZmZiIsInRleHRsaWdodCI6IiNmZWYzMWYifSwiaWQiOiJtZW1iZXJjIn0sIk0xNDc1OTc2MjEyMzA1Ijp7InBhcmFtcyI6eyJyb3dudW0iOiIzIn0sInN0eWxlIjp7ImJhY2tncm91bmQiOiIjZmZmZmZmIiwidGlwY29sb3IiOiIjZmViMzEyIn0sImRhdGEiOnsiQzE0NzU5NzYyMTIzMDUiOnsiaWNvbmNsYXNzIjoiaWNvbi1tb25leSIsImljb25jb2xvciI6IiNmZWIzMTIiLCJ0ZXh0IjoiXHU1MjA2XHU5NTAwXHU0ZjYzXHU5MWQxIiwidGV4dGNvbG9yIjoiIzY2NjY2NiIsImxpbmt1cmwiOiIiLCJ0aXBudW0iOiIwLjAwIiwidGlwdGV4dCI6Ilx1NTE0MyJ9LCJDMTQ3NTk3NjIxMjMwNiI6eyJpY29uY2xhc3MiOiJpY29uLWxpc3QiLCJpY29uY29sb3IiOiIjNTBiNmZlIiwidGV4dCI6Ilx1NGY2M1x1OTFkMVx1NjYwZVx1N2VjNiIsInRleHRjb2xvciI6IiM2NjY2NjYiLCJsaW5rdXJsIjoiIiwidGlwbnVtIjoiNTAiLCJ0aXB0ZXh0IjoiXHU3YjE0In0sIkMxNDc1OTc2MjEyMzA4Ijp7Imljb25jbGFzcyI6Imljb24tbWFuYWdlb3JkZXIiLCJpY29uY29sb3IiOiIjZmY3NDFkIiwidGV4dCI6Ilx1NjNkMFx1NzNiMFx1NjYwZVx1N2VjNiIsInRleHRjb2xvciI6IiM2NjY2NjYiLCJsaW5rdXJsIjoiIiwidGlwbnVtIjoiMTAiLCJ0aXB0ZXh0IjoiXHU3YjE0In0sIkMxNDc1OTc2MjEyMzA5Ijp7Imljb25jbGFzcyI6Imljb24tZ3JvdXAiLCJpY29uY29sb3IiOiIjZmY3NDFkIiwidGV4dCI6Ilx1NjIxMVx1NzY4NFx1NGUwYlx1N2ViZiIsInRleHRjb2xvciI6IiM2NjY2NjYiLCJsaW5rdXJsIjoiIiwidGlwbnVtIjoiMiIsInRpcHRleHQiOiJcdTRlYmEifSwiQzE0NzU5NzYyMTIzMTAiOnsiaWNvbmNsYXNzIjoiaWNvbi1xcmNvZGUiLCJpY29uY29sb3IiOiIjZmViMzEyIiwidGV4dCI6Ilx1NjNhOFx1NWU3Zlx1NGU4Y1x1N2VmNFx1NzgwMSIsInRleHRjb2xvciI6IiM2NjY2NjYiLCJsaW5rdXJsIjoiIiwidGlwbnVtIjoiIiwidGlwdGV4dCI6IiJ9LCJDMTQ3NTk3NjIxMjMxMSI6eyJpY29uY2xhc3MiOiJpY29uLXNob3BmaWxsIiwiaWNvbmNvbG9yIjoiIzUwYjZmZSIsInRleHQiOiJcdTVjMGZcdTVlOTdcdThiYmVcdTdmNmUiLCJ0ZXh0Y29sb3IiOiIjNjY2NjY2IiwibGlua3VybCI6IiIsInRpcG51bSI6IiIsInRpcHRleHQiOiIifSwiQzE0NzU5NzYyMTIzMTIiOnsiaWNvbmNsYXNzIjoiaWNvbi1yYW5rIiwiaWNvbmNvbG9yIjoiI2ZmNzQxZCIsInRleHQiOiJcdTRmNjNcdTkxZDFcdTYzOTJcdTU0MGQiLCJ0ZXh0Y29sb3IiOiIjNjY2NjY2IiwibGlua3VybCI6IiIsInRpcG51bSI6IiIsInRpcHRleHQiOiIifX0sImlkIjoiYmxvY2tncm91cCJ9fX0=', '../addons/ewei_shopv2/plugin/diypage/static/template/commission1/preview.jpg', 10, 0, 0, 0);
INSERT INTO `ims_ewei_shop_diypage_template` (`id`, `uniacid`, `type`, `name`, `data`, `preview`, `tplid`, `cate`, `deleted`, `merch`) VALUES
(11, 0, 5, '商品详情', 'eyJwYWdlIjp7InR5cGUiOiI1IiwidGl0bGUiOiJcdTU1NDZcdTU0YzFcdThiZTZcdTYwYzUiLCJuYW1lIjoiXHU1NTQ2XHU1NGMxXHU4YmU2XHU2MGM1IiwiZGVzYyI6IiIsImljb24iOiIiLCJrZXl3b3JkIjoiIiwiYmFja2dyb3VuZCI6IiNmYWZhZmEiLCJkaXltZW51IjoiLTEiLCJmb2xsb3diYXIiOiIwIiwidmlzaXQiOiIwIiwidmlzaXRsZXZlbCI6eyJtZW1iZXIiOiIiLCJjb21taXNzaW9uIjoiIn0sIm5vdmlzaXQiOnsidGl0bGUiOiIiLCJsaW5rIjoiIn0sImRpeWxheWVyIjoiMSJ9LCJpdGVtcyI6eyJNMTQ3ODc4Mjg4ODAyOCI6eyJ0eXBlIjoiNSIsIm1heCI6IjEiLCJwYXJhbXMiOnsiZ29vZHN0ZXh0IjoiXHU1NTQ2XHU1NGMxIiwiZGV0YWlsdGV4dCI6Ilx1OGJlNlx1NjBjNSJ9LCJzdHlsZSI6eyJiYWNrZ3JvdW5kIjoiI2Y3ZjdmNyIsInRleHRjb2xvciI6IiM2NjY2NjYiLCJhY3RpdmVjb2xvciI6IiNlZjRmNGYifSwiaWQiOiJkZXRhaWxfdGFiIn0sIk0xNDc4NzgyODkwMTA3Ijp7InR5cGUiOiI1IiwibWF4IjoiMSIsInN0eWxlIjp7ImRvdHN0eWxlIjoicmVjdGFuZ2xlIiwiZG90YWxpZ24iOiJsZWZ0IiwiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJsZWZ0cmlnaHQiOiI1IiwiYm90dG9tIjoiNSIsIm9wYWNpdHkiOiIwLjgifSwiaWQiOiJkZXRhaWxfc3dpcGUifSwiTTE0Nzg3ODMxMzUzNjUiOnsidHlwZSI6IjUiLCJtYXgiOiIxIiwicGFyYW1zIjp7InNoYXJlIjoiXHU1MjA2XHU0ZWFiIiwic2hhcmVfbGluayI6IiJ9LCJzdHlsZSI6eyJtYXJnaW50b3AiOiIwIiwibWFyZ2luYm90dG9tIjoiMCIsImJhY2tncm91bmQiOiIjZmZmZmZmIiwidGl0bGVjb2xvciI6IiMzMzMzMzMiLCJzdWJ0aXRsZWNvbG9yIjoiI2VmNGY0ZiIsInByaWNlY29sb3IiOiIjZWY0ZjRmIiwidGV4dGNvbG9yIjoiI2MwYzBjMCIsInRpbWVjb2xvciI6IiNlZjRmNGYiLCJ0aW1ldGV4dGNvbG9yIjoiI2VmNGY0ZiJ9LCJpZCI6ImRldGFpbF9pbmZvIn0sIk0xNDc4NzgyOTAzODE5Ijp7InR5cGUiOiI1IiwibWF4IjoiMSIsInN0eWxlIjp7Im1hcmdpbnRvcCI6IjAiLCJtYXJnaW5ib3R0b20iOiIwIiwiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJ0ZXh0Y29sb3IiOiIjNjY2NjY2IiwidGV4dGNvbG9yaGlnaCI6IiNlZjRmNGYifSwiZGF0YSI6eyJDMTQ3ODc4MjkwMzgxOSI6eyJuYW1lIjoiXHU0ZThjXHU2YjIxXHU4ZDJkXHU0ZTcwIiwidHlwZSI6ImVyY2kifSwiQzE0Nzg3ODI5MDM4MjAiOnsibmFtZSI6Ilx1NGYxYVx1NTQ1OFx1NGVmNyIsInR5cGUiOiJodWl5dWFuIn0sIkMxNDc4NzgyOTAzODIxIjp7Im5hbWUiOiJcdTRmMThcdTYwZTAiLCJ0eXBlIjoieW91aHVpIn0sIkMxNDc4NzgyOTAzODIyIjp7Im5hbWUiOiJcdTc5ZWZcdTUyMDYiLCJ0eXBlIjoiamlmZW4ifSwiQzE0Nzg3ODI5MDM4MjMiOnsibmFtZSI6Ilx1NGUwZFx1OTE0ZFx1OTAwMVx1NTMzYVx1NTdkZiIsInR5cGUiOiJidXBlaXNvbmcifSwiQzE0Nzg3ODI5MDM4MjQiOnsibmFtZSI6Ilx1NTU0Nlx1NTRjMVx1NjgwN1x1N2I3ZSIsInR5cGUiOiJiaWFvcWlhbiJ9fSwiaWQiOiJkZXRhaWxfc2FsZSJ9LCJNMTQ3ODc4MzE5MDI1NSI6eyJ0eXBlIjoiNSIsIm1heCI6IjEiLCJzdHlsZSI6eyJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsInRleHRjb2xvciI6IiMzMzMzMzMiLCJtYXJnaW50b3AiOiIxMCIsIm1hcmdpbmJvdHRvbSI6IjAifSwiaWQiOiJkZXRhaWxfc3BlYyJ9LCJNMTQ3ODc4MzE5NjIxOSI6eyJ0eXBlIjoiNSIsIm1heCI6IjEiLCJzdHlsZSI6eyJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsIm1hcmdpbnRvcCI6IjEwIiwibWFyZ2luYm90dG9tIjoiMCIsInRleHRjb2xvciI6IiM3YzdjN2MifSwiaWQiOiJkZXRhaWxfcGFja2FnZSJ9LCJNMTQ3ODc4MjkyNDA3NiI6eyJ0eXBlIjoiNSIsIm1heCI6IjEiLCJwYXJhbXMiOnsic2hvcGxvZ28iOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2Mlwvc3RhdGljXC9pbWFnZXNcL2Rlc2lnbmVyLmpwZyIsInNob3BuYW1lIjoiIiwic2hvcGRlc2MiOiIiLCJoaWRlbnVtIjoiMCIsImxlZnRuYXZ0ZXh0IjoiXHU1MTY4XHU5MGU4XHU1NTQ2XHU1NGMxIiwibGVmdG5hdmxpbmsiOiIiLCJyaWdodG5hdnRleHQiOiJcdThmZGJcdTVlOTdcdTkwMWJcdTkwMWIiLCJyaWdodG5hdmxpbmsiOiIifSwic3R5bGUiOnsibWFyZ2ludG9wIjoiMTAiLCJtYXJnaW5ib3R0b20iOiIwIiwiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJnb29kc251bWNvbG9yIjoiIzMzMzMzMyIsImdvb2RzdGV4dGNvbG9yIjoiIzdjN2M3YyIsInJpZ2h0bmF2Y29sb3IiOiIjN2M3YzdjIiwic2hvcG5hbWVjb2xvciI6IiMzMzMzMzMiLCJzaG9wZGVzY2NvbG9yIjoiIzQ0NDQ0NCJ9LCJpZCI6ImRldGFpbF9zaG9wIn0sIk0xNDc4NzgyOTI4ODg0Ijp7InR5cGUiOiI1IiwibWF4IjoiMSIsInN0eWxlIjp7ImJhY2tncm91bmQiOiIjZmZmZmZmIiwibWFyZ2ludG9wIjoiMTAiLCJtYXJnaW5ib3R0b20iOiIwIiwidGl0bGVjb2xvciI6IiMzMzMzMzMiLCJzaG9wbmFtZWNvbG9yIjoiIzMzMzMzMyIsInNob3BpbmZvY29sb3IiOiIjNjY2NjY2IiwibmF2dGVsY29sb3IiOiIjMDA4MDAwIiwibmF2bG9jYXRpb25jb2xvciI6IiNmZjk5MDAifSwiaWQiOiJkZXRhaWxfc3RvcmUifSwiTTE0Nzg3ODMyMTAxNDciOnsidHlwZSI6IjUiLCJtYXgiOiIxIiwic3R5bGUiOnsiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJtYXJnaW50b3AiOiIxMCIsIm1hcmdpbmJvdHRvbSI6IjAifSwiaWQiOiJkZXRhaWxfYnV5c2hvdyJ9LCJNMTQ3ODc4MzIxNDg3OSI6eyJ0eXBlIjoiNSIsIm1heCI6IjEiLCJzdHlsZSI6eyJtYXJnaW50b3AiOiIxMCIsIm1hcmdpbmJvdHRvbSI6IjEwIiwiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJtYWluY29sb3IiOiIjZmQ1NDU0Iiwic3ViY29sb3IiOiIjN2M3YzdjIiwidGV4dGNvbG9yIjoiIzMzMzMzMyJ9LCJpZCI6ImRldGFpbF9jb21tZW50In0sIk0xNDc4NzgzMjI1MTU4Ijp7InR5cGUiOiI1IiwibWF4IjoiMSIsInBhcmFtcyI6eyJoaWRlbGlrZSI6IjAiLCJoaWRlc2hvcCI6IjAiLCJoaWRlY2FydCI6IjAiLCJoaWRlY2FydGJ0biI6IjAiLCJ0ZXh0YnV5IjoiXHU3YWNiXHU1MjNiXHU4ZDJkXHU0ZTcwIiwiZ29vZHN0ZXh0IjoiXHU1NTQ2XHU1NGMxIiwibGlrZXRleHQiOiJcdTUxNzNcdTZjZTgiLCJsaWtlaWNvbmNsYXNzIjoiaWNvbi1saWtlIiwibGlrZWxpbmsiOiJpY29uLWxpa2UiLCJzaG9wdGV4dCI6Ilx1NWU5N1x1OTRmYSIsInNob3BpY29uY2xhc3MiOiJpY29uLXNob3AiLCJjYXJ0dGV4dCI6Ilx1OGQyZFx1NzI2OVx1OGY2NiIsImNhcnRpY29uY2xhc3MiOiJpY29uLWNhcnQifSwic3R5bGUiOnsiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJ0ZXh0Y29sb3IiOiIjOTk5OTk5IiwiaWNvbmNvbG9yIjoiIzk5OTk5OSIsImNhcnRjb2xvciI6IiNmZTk0MDIiLCJidXljb2xvciI6IiNmZDU1NTUiLCJkb3Rjb2xvciI6IiNmZjAwMTEifSwiaWQiOiJkZXRhaWxfbmF2YmFyIn19fQ==', '../addons/ewei_shopv2/plugin/diypage/static/template/detail1/preview.jpg', 11, 0, 0, 0),
(12, 0, 7, '整点秒杀', 'eyJwYWdlIjp7InR5cGUiOiI3IiwidGl0bGUiOiJcdTY1NzRcdTcwYjlcdTc5ZDJcdTY3NDAiLCJuYW1lIjoiXHU2NTc0XHU3MGI5XHU3OWQyXHU2NzQwIiwiZGVzYyI6IiIsImljb24iOiIiLCJrZXl3b3JkIjoiIiwiYmFja2dyb3VuZCI6IiNmYWZhZmEiLCJkaXltZW51IjoiLTEiLCJmb2xsb3diYXIiOiIwIiwidmlzaXQiOiIwIiwidmlzaXRsZXZlbCI6eyJtZW1iZXIiOiIiLCJjb21taXNzaW9uIjoiIn0sIm5vdmlzaXQiOnsidGl0bGUiOiIiLCJsaW5rIjoiIn19LCJpdGVtcyI6eyJNMTQ4MDQ5ODExNTc4MCI6eyJ0eXBlIjoiNyIsIm1heCI6IjEiLCJzdHlsZSI6eyJtYXJnaW50b3AiOiIwIiwiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJjb2xvciI6IiMzMzMzMzMiLCJiZ2NvbG9yIjoiI2ZmZmZmZiIsInNlbGVjdGVkY29sb3IiOiIjZmYzMzAwIiwic2VsZWN0ZWRiZ2NvbG9yIjoiI2ZmZmZmZiJ9LCJpZCI6InNlY2tpbGxfdGltZXMifSwiTTE0ODA0OTgxMTgwMTkiOnsidHlwZSI6IjciLCJtYXgiOiIxIiwic3R5bGUiOnsibWFyZ2ludG9wIjoiMTAiLCJtYXJnaW5ib3R0b20iOiIwIiwiYmFja2dyb3VuZCI6IiNmZmZmZmYifSwiaWQiOiJzZWNraWxsX2FkdnMifSwiTTE0ODA0OTgxMTcwNDMiOnsidHlwZSI6IjciLCJtYXgiOiIxIiwic3R5bGUiOnsibWFyZ2ludG9wIjoiMTAiLCJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsImNvbG9yIjoiIzMzMzMzMyIsImJnY29sb3IiOiIjZmZmZmZmIiwic2VsZWN0ZWRjb2xvciI6IiNlZjRmNGYiLCJzZWxlY3RlZGJnY29sb3IiOiIjZmZmZmZmIn0sImlkIjoic2Vja2lsbF9yb29tcyJ9LCJNMTQ4MDQ5ODExODQ1MyI6eyJ0eXBlIjoiNyIsIm1heCI6IjEiLCJwYXJhbXMiOnsidGl0bGV0ZXh0IjoiXHU1MTQ4XHU0ZTBiXHU1MzU1XHU1MTQ4XHU1Zjk3XHU1NGU2fiIsInRpdGxlb3ZlcnRleHQiOiJcdThmZDhcdTUzZWZcdTRlZTVcdTdlZTdcdTdlZWRcdTYyYTJcdThkMmRcdTU0ZTZ+IiwidGl0bGV3YWl0dGV4dCI6Ilx1NTM3M1x1NWMwNlx1NWYwMFx1NTljYiBcdTUxNDhcdTRlMGJcdTUzNTVcdTUxNDhcdTVmOTdcdTU0ZTYiLCJidG50ZXh0IjoiXHU2MmEyXHU4ZDJkXHU0ZTJkIiwiYnRub3ZlcnRleHQiOiJcdTVkZjJcdTYyYTJcdTViOGMiLCJidG53YWl0dGV4dCI6Ilx1N2I0OVx1NWY4NVx1NjJhMlx1OGQyZCJ9LCJzdHlsZSI6eyJtYXJnaW50b3AiOiIxMCIsIm1hcmdpbmJvdHRvbSI6IjAiLCJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsInRvcGJnY29sb3IiOiIjZjBmMmY1IiwidG9wY29sb3IiOiIjMzMzMzMzIiwidGltZWJnY29sb3IiOiIjNDY0NTUzIiwidGltZWNvbG9yIjoiI2ZmZmZmZiIsInRpdGxlY29sb3IiOiIjMzMzMzMzIiwicHJpY2Vjb2xvciI6IiNlZjRmNGYiLCJtYXJrZXRwcmljZWNvbG9yIjoiIzk0OTU5OCIsImJ0bmJnY29sb3IiOiIjZWY0ZjRmIiwiYnRub3ZlcmJnY29sb3IiOiIjZjdmN2Y3IiwiYnRud2FpdGJnY29sb3IiOiIjMDRiZTAyIiwiYnRuY29sb3IiOiIjZmZmZmZmIiwiYnRub3ZlcmNvbG9yIjoiIzMzMzMzMyIsImJ0bndhaXRjb2xvciI6IiNmZmZmZmYiLCJwcm9jZXNzdGV4dGNvbG9yIjoiI2QwZDFkMiIsInByb2Nlc3NiZ2NvbG9yIjoiI2ZmOGY4ZiJ9LCJpZCI6InNlY2tpbGxfbGlzdCJ9fX0=', '../addons/ewei_shopv2/plugin/diypage/static/template/seckill/preview.png', 12, 0, 0, 0),
(13, 0, 6, '积分商城', 'eyJwYWdlIjp7InR5cGUiOiI2IiwidGl0bGUiOiJcdTc5ZWZcdTUyMDZcdTU1NDZcdTU3Y2UiLCJuYW1lIjoiXHU2ZDRiXHU4YmQ1XHU3OWVmXHU1MjA2XHU1NTQ2XHU1N2NlXHU5ODc1XHU5NzYyIiwiZGVzYyI6IiIsImljb24iOiIiLCJrZXl3b3JkIjoiIiwiYmFja2dyb3VuZCI6IiNmYWZhZmEiLCJkaXltZW51IjoiLTEiLCJmb2xsb3diYXIiOiIwIiwidmlzaXQiOiIwIiwidmlzaXRsZXZlbCI6eyJtZW1iZXIiOiIiLCJjb21taXNzaW9uIjoiIn0sIm5vdmlzaXQiOnsidGl0bGUiOiIiLCJsaW5rIjoiIn19LCJpdGVtcyI6eyJNMTQ3OTI2MTA2MTY0NSI6eyJzdHlsZSI6eyJkb3RzdHlsZSI6InJvdW5kIiwiZG90YWxpZ24iOiJjZW50ZXIiLCJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsImxlZnRyaWdodCI6IjUiLCJib3R0b20iOiI1Iiwib3BhY2l0eSI6IjAuOCJ9LCJkYXRhIjp7IkMxNDc5MjYxMDYxNjQ1Ijp7ImltZ3VybCI6Imh0dHA6XC9cL29mNm9kaGRxMS5ia3QuY2xvdWRkbi5jb21cLzA2M2E2ZWM4NGY0NWE3MGQ2Y2NhOGQ4ZjI2NWQxYjcyLmpwZyIsImxpbmt1cmwiOiIuXC9pbmRleC5waHA/aT0xMiZjPWVudHJ5Jm09ZXdlaV9zaG9wdjImZG89bW9iaWxlJnI9Y3JlZGl0c2hvcC5kZXRhaWwmaWQ9MTE3In0sIkMxNDc5MjYxMDYxNjQ2Ijp7ImltZ3VybCI6Imh0dHA6XC9cL29mNm9kaGRxMS5ia3QuY2xvdWRkbi5jb21cLzQwMTgzYzEyY2M0MWIxYWYwMjY3NDIwYzUwNjQyODliLmpwZyIsImxpbmt1cmwiOiIuXC9pbmRleC5waHA/aT0xMiZjPWVudHJ5Jm09ZXdlaV9zaG9wdjImZG89bW9iaWxlJnI9Y3JlZGl0c2hvcC5saXN0cyJ9fSwiaWQiOiJiYW5uZXIifSwiTTE0NzkyNjgxMTQxNjEiOnsic3R5bGUiOnsibWFyZ2ludG9wIjoiMTAiLCJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiJ9LCJkYXRhIjp7IkMxNDc5MjY4MTE0MTYxIjp7InRleHQiOiJcdTYyMTFcdTc2ODRcdTc5ZWZcdTUyMDYiLCJpY29uY2xhc3MiOiJpY29uLWppZmVuIiwidGV4dGNvbG9yIjoiIzY2NjY2NiIsImljb25jb2xvciI6IiM2NjY2NjYiLCJsaW5rdXJsIjoiLlwvaW5kZXgucGhwP2k9MTImYz1lbnRyeSZtPWV3ZWlfc2hvcHYyJmRvPW1vYmlsZSZyPWNyZWRpdHNob3AuY3JlZGl0bG9nIn0sIkMxNDc5MjY4MTE0MTYyIjp7InRleHQiOiJcdTUxNTFcdTYzNjJcdThiYjBcdTVmNTUiLCJpY29uY2xhc3MiOiJpY29uLWxpc3QiLCJ0ZXh0Y29sb3IiOiIjNjY2NjY2IiwiaWNvbmNvbG9yIjoiIzY2NjY2NiIsImxpbmt1cmwiOiIuXC9pbmRleC5waHA/aT0xMiZjPWVudHJ5Jm09ZXdlaV9zaG9wdjImZG89bW9iaWxlJnI9Y3JlZGl0c2hvcC5sb2cifX0sImlkIjoibWVudTIifSwiTTE0NzkyOTA3OTU0MjciOnsicGFyYW1zIjp7InBsYWNlaG9sZGVyIjoiXHU4YmY3XHU4ZjkzXHU1MTY1XHU1MTczXHU5NTJlXHU1YjU3XHU4ZmRiXHU4ODRjXHU2NDFjXHU3ZDIyIiwiZ29vZHN0eXBlIjoiMSJ9LCJzdHlsZSI6eyJpbnB1dGJhY2tncm91bmQiOiIjZmZmZmZmIiwiYmFja2dyb3VuZCI6IiNmMWYxZjIiLCJpY29uY29sb3IiOiIjYjRiNGI0IiwiY29sb3IiOiIjOTk5OTk5IiwicGFkZGluZ3RvcCI6IjYiLCJwYWRkaW5nbGVmdCI6IjEwIiwidGV4dGFsaWduIjoibGVmdCIsInNlYXJjaHN0eWxlIjoiIn0sImlkIjoic2VhcmNoIn0sIk0xNDc5NTQ0NjE5NDQwIjp7InN0eWxlIjp7ImhlaWdodCI6IjEwIiwiYmFja2dyb3VuZCI6IiNmYWZhZmEifSwiaWQiOiJibGFuayJ9LCJNMTQ3OTI2MTA3NjMzMyI6eyJzdHlsZSI6eyJuYXZzdHlsZSI6IiIsImJhY2tncm91bmQiOiIjZmZmZmZmIiwicm93bnVtIjoiNCIsInNob3d0eXBlIjoiMCIsInNob3dkb3QiOiIxIiwicGFnZW51bSI6IjgifSwiZGF0YSI6eyJDMTQ3OTI2MTA3NjMzMyI6eyJpbWd1cmwiOiJodHRwOlwvXC9vZjZvZGhkcTEuYmt0LmNsb3VkZG4uY29tXC9mNGM0ZWZlNjEwMzJiNGE5N2VjYTAzNWM3ZTcyNTA2OC5wbmciLCJsaW5rdXJsIjoiIiwidGV4dCI6Ilx1NzNiMFx1OTFkMVx1N2VhMlx1NTMwNSIsImNvbG9yIjoiIzY2NjY2NiJ9LCJDMTQ3OTI2MTA3NjMzNCI6eyJpbWd1cmwiOiJodHRwOlwvXC9vZjZvZGhkcTEuYmt0LmNsb3VkZG4uY29tXC83MTg2ZWI1NDE2OWExMzU1YTcwMjQxNjA1OGY1ODg2My5wbmciLCJsaW5rdXJsIjoiIiwidGV4dCI6Ilx1N2NiZVx1N2Y4ZVx1NWI5ZVx1NzI2OSIsImNvbG9yIjoiIzY2NjY2NiJ9LCJDMTQ3OTI2MTA3NjMzNSI6eyJpbWd1cmwiOiJodHRwOlwvXC9vZjZvZGhkcTEuYmt0LmNsb3VkZG4uY29tXC85NzFhODQxYzI1NzdlZDlhYjQyNDJlOTkxZjU5YWE1My5wbmciLCJsaW5rdXJsIjoiIiwidGV4dCI6Ilx1NGYxOFx1NjBlMFx1NTIzOCIsImNvbG9yIjoiIzY2NjY2NiJ9LCJDMTQ3OTI2MTA3NjMzNiI6eyJpbWd1cmwiOiJodHRwOlwvXC9vZjZvZGhkcTEuYmt0LmNsb3VkZG4uY29tXC80NWE3NDYwOTRlOWM5NmY2ZTY5Njg0OWFlNmYxMDFhZS5wbmciLCJsaW5rdXJsIjoiIiwidGV4dCI6Ilx1NGY1OVx1OTg5ZFx1NTk1Nlx1NTJiMSIsImNvbG9yIjoiIzY2NjY2NiJ9fSwiaWQiOiJtZW51In0sIk0xNDc5MjYxNDUwNzM0Ijp7InN0eWxlIjp7Im1hcmdpbnRvcCI6IjEwIiwiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJpY29uY29sb3IiOiIjOTk5OTk5IiwidGV4dGNvbG9yIjoiIzMzMzMzMyIsInJlbWFya2NvbG9yIjoiIzg4ODg4OCJ9LCJkYXRhIjp7IkMxNDc5MjYxNDUwNzM0Ijp7InRleHQiOiJcdTdjYmVcdTdmOGVcdTViOWVcdTcyNjlcdTYyYmRcdTU5NTYiLCJsaW5rdXJsIjoiIiwiaWNvbmNsYXNzIjoiaWNvbi1naWZ0cyIsInJlbWFyayI6Ilx1NjZmNFx1NTkxYSIsImRvdG51bSI6IiJ9fSwiaWQiOiJsaXN0bWVudSJ9LCJNMTQ3OTU0Mzc4MTg2NyI6eyJwYXJhbXMiOnsiZ29vZHN0eXBlIjoiMSIsInNob3d0aXRsZSI6IjEiLCJzaG93cHJpY2UiOiIxIiwic2hvd3RhZyI6IjIiLCJnb29kc2RhdGEiOiI1IiwiY2F0ZWlkIjoiIiwiY2F0ZW5hbWUiOiIiLCJncm91cGlkIjoiIiwiZ3JvdXBuYW1lIjoiIiwiZ29vZHNzb3J0IjoiMCIsImdvb2RzbnVtIjoiNiIsInNob3dpY29uIjoiMSIsImljb25wb3NpdGlvbiI6ImxlZnQgdG9wIiwicHJvZHVjdHByaWNlIjoiMSIsImdvb2Rzc2Nyb2xsIjoiMSJ9LCJzdHlsZSI6eyJiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsImxpc3RzdHlsZSI6ImJsb2NrIiwiYnV5c3R5bGUiOiJidXlidG4tMSIsImdvb2RzaWNvbiI6InJlY29tbWFuZCIsInByaWNlY29sb3IiOiIjZWQyODIyIiwiaWNvbnBhZGRpbmd0b3AiOiIwIiwiaWNvbnBhZGRpbmdsZWZ0IjoiMCIsImJ1eWJ0bmNvbG9yIjoiI2ZlNTQ1NSIsImljb256b29tIjoiMTAwIiwidGl0bGVjb2xvciI6IiMyNjI2MjYiLCJ0YWdiYWNrZ3JvdW5kIjoiI2ZlNTQ1NSJ9LCJkYXRhIjp7IkMxNDc5NTQzNzgxODY3Ijp7InRodW1iIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2dvb2RzLTEuanBnIiwicHJpY2UiOiIyMC4wMCIsInRpdGxlIjoiXHU4ZmQ5XHU5MWNjXHU2NjJmXHU1NTQ2XHU1NGMxXHU2ODA3XHU5ODk4IiwiZ2lkIjoiIiwiYmFyZ2FpbiI6IjAiLCJjcmVkaXQiOiIwIiwiY3R5cGUiOiIxIn0sIkMxNDc5NTQzNzgxODY4Ijp7InRodW1iIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2dvb2RzLTIuanBnIiwicHJpY2UiOiIyMC4wMCIsInRpdGxlIjoiXHU4ZmQ5XHU5MWNjXHU2NjJmXHU1NTQ2XHU1NGMxXHU2ODA3XHU5ODk4IiwiZ2lkIjoiIiwiYmFyZ2FpbiI6IjAiLCJjcmVkaXQiOiIwIiwiY3R5cGUiOiIxIn0sIkMxNDc5NTQzNzgxODY5Ijp7InRodW1iIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2dvb2RzLTMuanBnIiwicHJpY2UiOiIyMC4wMCIsInRpdGxlIjoiXHU4ZmQ5XHU5MWNjXHU2NjJmXHU1NTQ2XHU1NGMxXHU2ODA3XHU5ODk4IiwiZ2lkIjoiIiwiYmFyZ2FpbiI6IjAiLCJjcmVkaXQiOiIwIiwiY3R5cGUiOiIwIn0sIkMxNDc5NTQzNzgxODcwIjp7InRodW1iIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2dvb2RzLTQuanBnIiwicHJpY2UiOiIyMC4wMCIsInRpdGxlIjoiXHU4ZmQ5XHU5MWNjXHU2NjJmXHU1NTQ2XHU1NGMxXHU2ODA3XHU5ODk4IiwiZ2lkIjoiIiwiYmFyZ2FpbiI6IjAiLCJjcmVkaXQiOiIwIiwiY3R5cGUiOiIwIn19LCJpZCI6Imdvb2RzIn0sIk0xNDc5MjYxNTk0MDc3Ijp7InN0eWxlIjp7Im1hcmdpbnRvcCI6IjEwIiwiYmFja2dyb3VuZCI6IiNmZmZmZmYiLCJpY29uY29sb3IiOiIjOTk5OTk5IiwidGV4dGNvbG9yIjoiIzMzMzMzMyIsInJlbWFya2NvbG9yIjoiIzg4ODg4OCJ9LCJkYXRhIjp7IkMxNDc5MjYxNTk0MDc3Ijp7InRleHQiOiJcdTU1NDZcdTU3Y2VcdTRmMThcdTYwZTBcdTUyMzgiLCJsaW5rdXJsIjoiIiwiaWNvbmNsYXNzIjoiaWNvbi1naWZ0cyIsInJlbWFyayI6Ilx1NjZmNFx1NTkxYSIsImRvdG51bSI6IiJ9fSwiaWQiOiJsaXN0bWVudSJ9LCJNMTQ3OTI2MTY1NTkxOSI6eyJwYXJhbXMiOnsic2hvd3RpdGxlIjoiMSIsInNob3dwcmljZSI6IjEiLCJnb29kc2RhdGEiOiIxIiwiY2F0ZWlkIjoiOTAiLCJjYXRlbmFtZSI6Ilx1NmQ0Ylx1OGJkNVx1NTIwNlx1N2M3YjAxMCIsImdyb3VwaWQiOiIiLCJncm91cG5hbWUiOiIiLCJnb29kc3NvcnQiOiIwIiwiZ29vZHNudW0iOiI2Iiwic2hvd2ljb24iOiIxIiwiaWNvbnBvc2l0aW9uIjoibGVmdCB0b3AiLCJnb29kc3R5cGUiOiIxIiwiZ29vZHNzY3JvbGwiOiIwIn0sInN0eWxlIjp7Imxpc3RzdHlsZSI6IiIsImJ1eXN0eWxlIjoiYnV5YnRuLTEiLCJnb29kc2ljb24iOiJyZWNvbW1hbmQiLCJwcmljZWNvbG9yIjoiI2VkMjgyMiIsImljb25wYWRkaW5ndG9wIjoiMCIsImljb25wYWRkaW5nbGVmdCI6IjAiLCJidXlidG5jb2xvciI6IiNmZTU0NTUiLCJpY29uem9vbSI6IjEwMCIsInRpdGxlY29sb3IiOiIjMjYyNjI2In0sImRhdGEiOnsiQzE0NzkyNjE2NTU5MTkiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtMS5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIiLCJiYXJnYWluIjoiMCJ9LCJDMTQ3OTI2MTY1NTkyMCI6eyJ0aHVtYiI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvaW1hZ2VzXC9kZWZhdWx0XC9nb29kcy0yLmpwZyIsInByaWNlIjoiMjAuMDAiLCJ0aXRsZSI6Ilx1OGZkOVx1OTFjY1x1NjYyZlx1NTU0Nlx1NTRjMVx1NjgwN1x1OTg5OCIsImdpZCI6IiIsImJhcmdhaW4iOiIwIn0sIkMxNDc5MjYxNjU1OTIxIjp7InRodW1iIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2dvb2RzLTMuanBnIiwicHJpY2UiOiIyMC4wMCIsInRpdGxlIjoiXHU4ZmQ5XHU5MWNjXHU2NjJmXHU1NTQ2XHU1NGMxXHU2ODA3XHU5ODk4IiwiZ2lkIjoiIiwiYmFyZ2FpbiI6IjAifSwiQzE0NzkyNjE2NTU5MjIiOnsidGh1bWIiOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvZ29vZHMtNC5qcGciLCJwcmljZSI6IjIwLjAwIiwidGl0bGUiOiJcdThmZDlcdTkxY2NcdTY2MmZcdTU1NDZcdTU0YzFcdTY4MDdcdTk4OTgiLCJnaWQiOiIiLCJiYXJnYWluIjoiMCJ9fSwiaWQiOiJnb29kcyJ9fX0=', '../addons/ewei_shopv2/plugin/diypage/static/template/creditshop/preview.png', 13, 0, 0, 0),
(14, 0, 8, '兑换中心', 'eyJwYWdlIjp7InR5cGUiOiI4IiwidGl0bGUiOiJcdTUxNTFcdTYzNjJcdTRlMmRcdTVmYzMiLCJuYW1lIjoiXHU1MTUxXHU2MzYyXHU0ZTJkXHU1ZmMzXHU2YTIxXHU2NzdmIiwiZGVzYyI6IiIsImljb24iOiIiLCJrZXl3b3JkIjoiIiwiYmFja2dyb3VuZCI6IiNmYWZhZmEiLCJkaXltZW51IjoiLTEiLCJkaXlsYXllciI6IjAiLCJkaXlnb3RvcCI6IjAiLCJmb2xsb3diYXIiOiIwIiwidmlzaXQiOiIwIiwidmlzaXRsZXZlbCI6eyJtZW1iZXIiOiIiLCJjb21taXNzaW9uIjoiIn0sIm5vdmlzaXQiOnsidGl0bGUiOiIiLCJsaW5rIjoiIn19LCJpdGVtcyI6eyJNMTQ4MjM3Mjk0MjA3NSI6eyJtYXgiOiIxIiwidHlwZSI6IjgiLCJwYXJhbXMiOnsiZGF0YXR5cGUiOiIwIn0sInN0eWxlIjp7ImRvdHN0eWxlIjoicm91bmQiLCJkb3RhbGlnbiI6ImNlbnRlciIsImJhY2tncm91bmQiOiIjZmZmZmZmIiwibGVmdHJpZ2h0IjoiNSIsImJvdHRvbSI6IjUiLCJvcGFjaXR5IjoiMC44In0sImRhdGEiOnsiQzE0ODIzNzI5NDIwNzUiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2Jhbm5lci0xLmpwZyIsImxpbmt1cmwiOiIifSwiQzE0ODIzNzI5NDIwNzYiOnsiaW1ndXJsIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2Jhbm5lci0yLmpwZyIsImxpbmt1cmwiOiIifX0sImlkIjoiZXhjaGFuZ2VfYmFubmVyIn0sIk0xNDgyMzcyOTQyNTE1Ijp7Im1heCI6IjEiLCJ0eXBlIjoiOCIsInBhcmFtcyI6eyJwcmV2aWV3IjoiMCIsInRpdGxlIjoiXHU1MTUxXHU2MzYyXHU3ODAxXHU1MTUxXHU2MzYyIiwicGxhY2Vob2xkZXIiOiJcdThiZjdcdThmOTNcdTUxNjVcdTUxNTFcdTYzNjJcdTc4MDEiLCJidG50ZXh0IjoiXHU3YWNiXHU1MzczXHU1MTUxXHU2MzYyIiwiYmFja2J0biI6Ilx1OGZkNFx1NTZkZVx1OTFjZFx1NjViMFx1OGY5M1x1NTE2NVx1NTE1MVx1NjM2Mlx1NzgwMSIsImV4YnRudGV4dCI6Ilx1NTE1MVx1NjM2MiIsImV4YnRuMnRleHQiOiJcdTVkZjJcdTUxNTFcdTYzNjIiLCJjcmVkaXRpY29uIjoiLi5cL2FkZG9uc1wvZXdlaV9zaG9wdjJcL3BsdWdpblwvZGl5cGFnZVwvc3RhdGljXC9pbWFnZXNcL2RlZmF1bHRcL2ljb25fY3JlZGl0LnBuZyIsIm1vbmV5aWNvbiI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvaW1hZ2VzXC9kZWZhdWx0XC9pY29uX21vbmV5LnBuZyIsImNvdXBvbmljb24iOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvaWNvbl9jb3Vwb24ucG5nIiwicmVkYmFnaWNvbiI6Ii4uXC9hZGRvbnNcL2V3ZWlfc2hvcHYyXC9wbHVnaW5cL2RpeXBhZ2VcL3N0YXRpY1wvaW1hZ2VzXC9kZWZhdWx0XC9pY29uX3JlZGJhZy5wbmciLCJnb29kc2ljb24iOiIuLlwvYWRkb25zXC9ld2VpX3Nob3B2MlwvcGx1Z2luXC9kaXlwYWdlXC9zdGF0aWNcL2ltYWdlc1wvZGVmYXVsdFwvaWNvbl9nb29kcy5wbmcifSwic3R5bGUiOnsidGl0bGVjb2xvciI6IiM0NDQ0NDQiLCJidG5jb2xvciI6IiNmZmZmZmYiLCJidG5iYWNrZ3JvdW5kIjoiI2VkNTU2NSIsImlucHV0Y29sb3IiOiIjNjY2NjY2IiwiaW5wdXRiYWNrZ3JvdW5kIjoiI2ZmZmZmZiIsImlucHV0Ym9yZGVyIjoiI2VmZWZlZiIsImNvZGVjb2xvciI6IiM0NDQ0NDQiLCJudW1jb2xvciI6IiM5OTk5OTkiLCJleGJ0bmNvbG9yIjoiI2ZmZmZmZiIsImV4YnRuYmFja2dyb3VuZCI6IiNlZDU1NjUiLCJleGJ0bjJjb2xvciI6IiNmZmZmZmYiLCJleGJ0bjJiYWNrZ3JvdW5kIjoiI2NjY2NjYyIsImJhY2tidG5jb2xvciI6IiM0NDQ0NDQiLCJiYWNrYnRuYm9yZGVyIjoiI2U3ZWFlYyIsImJhY2tidG5iYWNrZ3JvdW5kIjoiI2Y3ZjdmNyIsImdvb2RzdGl0bGUiOiIjNDQ0NDQ0IiwiZ29vZHNwcmljZSI6IiNhYWFhYWEifSwiaWQiOiJleGNoYW5nZV9pbnB1dCJ9LCJNMTQ4MjM3Mjk0MzE3MyI6eyJtYXgiOiIxIiwidHlwZSI6IjgiLCJwYXJhbXMiOnsicnVsZXRpdGxlIjoiXHU1MTUxXHU2MzYyXHU4OWM0XHU1MjE5In0sInN0eWxlIjp7InJ1bGV0aXRsZWNvbG9yIjoiIzU1NTU1NSJ9LCJpZCI6ImV4Y2hhbmdlX3J1bGUifX19', '../addons/ewei_shopv2/plugin/diypage/static/template/exchange/preview.png', 14, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_diypage_template_category`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_diypage_template_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `merch` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_exchange_cart`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_exchange_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `openid` varchar(100) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  `total` int(10) DEFAULT '1',
  `marketprice` decimal(10,2) DEFAULT NULL,
  `optionid` int(11) DEFAULT NULL,
  `selected` tinyint(1) DEFAULT '1',
  `deleted` tinyint(1) DEFAULT '0',
  `merchid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `groupid` int(11) DEFAULT NULL,
  `serial` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_exchange_code`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_exchange_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupid` int(11) NOT NULL DEFAULT '0',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `endtime` datetime NOT NULL DEFAULT '2016-10-01 00:00:00',
  `status` int(2) NOT NULL DEFAULT '1',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `count` int(11) NOT NULL DEFAULT '0',
  `key` varchar(255) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  `scene` int(11) NOT NULL DEFAULT '0',
  `qrcode_url` varchar(255) NOT NULL DEFAULT '',
  `serial` varchar(255) NOT NULL DEFAULT '',
  `balancestatus` int(11) DEFAULT '1',
  `redstatus` int(11) DEFAULT '1',
  `scorestatus` int(11) DEFAULT '1',
  `couponstatus` int(11) DEFAULT '1',
  `goodsstatus` int(11) DEFAULT NULL,
  `repeatcount` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_exchange_group`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_exchange_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `type` int(2) NOT NULL DEFAULT '0',
  `endtime` datetime NOT NULL DEFAULT '2016-10-01 00:00:00',
  `mode` int(2) NOT NULL DEFAULT '0',
  `status` int(2) NOT NULL DEFAULT '0',
  `max` int(2) NOT NULL DEFAULT '0',
  `value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `starttime` datetime NOT NULL DEFAULT '2016-10-01 00:00:00',
  `goods` text,
  `score` int(11) NOT NULL DEFAULT '0',
  `coupon` text,
  `use` int(11) NOT NULL DEFAULT '0',
  `total` int(11) NOT NULL DEFAULT '0',
  `red` decimal(10,2) NOT NULL DEFAULT '0.00',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `balance_left` decimal(10,2) NOT NULL DEFAULT '0.00',
  `balance_right` decimal(10,2) NOT NULL DEFAULT '0.00',
  `red_left` decimal(10,2) NOT NULL DEFAULT '0.00',
  `red_right` decimal(10,2) NOT NULL DEFAULT '0.00',
  `score_left` int(11) NOT NULL DEFAULT '0',
  `score_right` int(11) NOT NULL DEFAULT '0',
  `balance_type` int(11) NOT NULL,
  `red_type` int(11) NOT NULL,
  `score_type` int(11) NOT NULL,
  `title_reply` varchar(255) NOT NULL DEFAULT '',
  `img` varchar(255) NOT NULL DEFAULT '',
  `content` varchar(255) NOT NULL DEFAULT '',
  `rule` text NOT NULL,
  `coupon_type` varchar(255) DEFAULT NULL,
  `basic_content` varchar(500) NOT NULL DEFAULT '',
  `reply_type` int(11) NOT NULL DEFAULT '0',
  `code_type` int(11) NOT NULL DEFAULT '0',
  `binding` int(11) NOT NULL DEFAULT '0',
  `showcount` int(11) DEFAULT '0',
  `postage` decimal(10,2) DEFAULT '0.00',
  `postage_type` int(11) DEFAULT '0',
  `banner` varchar(800) DEFAULT '',
  `keyword_reply` int(11) DEFAULT '0',
  `reply_status` int(11) DEFAULT '1',
  `reply_keyword` varchar(255) DEFAULT '',
  `input_banner` varchar(255) DEFAULT '',
  `diypage` int(11) NOT NULL DEFAULT '0',
  `sendname` varchar(255) DEFAULT '',
  `wishing` varchar(255) DEFAULT '',
  `actname` varchar(255) DEFAULT '',
  `remark` varchar(255) DEFAULT '',
  `repeat` tinyint(1) NOT NULL DEFAULT '0',
  `koulingstart` varchar(255) NOT NULL DEFAULT '',
  `koulingend` varchar(255) NOT NULL DEFAULT '',
  `kouling` tinyint(1) NOT NULL DEFAULT '0',
  `chufa` varchar(255) NOT NULL DEFAULT '',
  `chufaend` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_exchange_query`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_exchange_query` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `querykey` varchar(255) NOT NULL DEFAULT '',
  `querytime` int(11) NOT NULL DEFAULT '0',
  `unfreeze` int(11) NOT NULL DEFAULT '0',
  `errorcount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`openid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_exchange_record`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_exchange_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL DEFAULT '',
  `uniacid` int(11) DEFAULT NULL,
  `goods` text,
  `orderid` varchar(255) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL,
  `openid` varchar(255) NOT NULL DEFAULT '',
  `mode` int(11) NOT NULL DEFAULT '0',
  `balance` decimal(10,2) DEFAULT '0.00',
  `red` decimal(10,2) NOT NULL DEFAULT '0.00',
  `coupon` text,
  `score` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(255) NOT NULL DEFAULT '',
  `groupid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `serial` varchar(255) NOT NULL DEFAULT '',
  `ordersn` varchar(255) NOT NULL DEFAULT '',
  `goods_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_exchange_setting`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_exchange_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `freeze` int(11) NOT NULL DEFAULT '0',
  `mistake` int(11) NOT NULL DEFAULT '0',
  `grouplimit` int(11) NOT NULL DEFAULT '0',
  `alllimit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_exhelper_express`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_exhelper_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `type` int(1) NOT NULL DEFAULT '1',
  `expressname` varchar(255) DEFAULT '',
  `expresscom` varchar(255) NOT NULL DEFAULT '',
  `express` varchar(255) NOT NULL DEFAULT '',
  `width` decimal(10,2) DEFAULT '0.00',
  `datas` text,
  `height` decimal(10,2) DEFAULT '0.00',
  `bg` varchar(255) DEFAULT '',
  `isdefault` tinyint(3) DEFAULT '0',
  `merchid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_isdefault` (`isdefault`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_exhelper_senduser`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_exhelper_senduser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `sendername` varchar(255) DEFAULT '',
  `sendertel` varchar(255) DEFAULT '',
  `sendersign` varchar(255) DEFAULT '',
  `sendercode` int(11) DEFAULT NULL,
  `senderaddress` varchar(255) DEFAULT '',
  `sendercity` varchar(255) DEFAULT NULL,
  `isdefault` tinyint(3) DEFAULT '0',
  `merchid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_isdefault` (`isdefault`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_exhelper_sys`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_exhelper_sys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(20) NOT NULL DEFAULT 'localhost',
  `port` int(11) NOT NULL DEFAULT '8000',
  `ip_cloud` varchar(255) NOT NULL DEFAULT '',
  `port_cloud` int(11) NOT NULL DEFAULT '8000',
  `is_cloud` int(1) NOT NULL DEFAULT '0',
  `merchid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_express`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '',
  `express` varchar(50) DEFAULT '',
  `status` tinyint(1) DEFAULT '1',
  `displayorder` tinyint(3) unsigned DEFAULT '0',
  `code` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=92 ;

--
-- 转存表中的数据 `ims_ewei_shop_express`
--

INSERT INTO `ims_ewei_shop_express` (`id`, `name`, `express`, `status`, `displayorder`, `code`) VALUES
(1, '顺丰', 'shunfeng', 1, 0, ''),
(2, '申通', 'shentong', 1, 0, ''),
(3, '韵达快运', 'yunda', 1, 0, ''),
(4, '天天快递', 'tiantian', 1, 0, ''),
(5, '圆通速递', 'yuantong', 1, 0, ''),
(6, '中通速递', 'zhongtong', 1, 0, ''),
(7, 'ems快递', 'ems', 1, 0, ''),
(8, '汇通快运', 'huitongkuaidi', 1, 0, ''),
(9, '全峰快递', 'quanfengkuaidi', 1, 0, ''),
(10, '宅急送', 'zhaijisong', 1, 0, ''),
(11, 'aae全球专递', 'aae', 1, 0, ''),
(12, '安捷快递', 'anjie', 1, 0, ''),
(13, '安信达快递', 'anxindakuaixi', 1, 0, ''),
(14, '彪记快递', 'biaojikuaidi', 1, 0, ''),
(15, 'bht', 'bht', 1, 0, ''),
(16, '百福东方国际物流', 'baifudongfang', 1, 0, ''),
(17, '中国东方（COE）', 'coe', 1, 0, ''),
(18, '长宇物流', 'changyuwuliu', 1, 0, ''),
(19, '大田物流', 'datianwuliu', 1, 0, ''),
(20, '德邦物流', 'debangwuliu', 1, 0, ''),
(21, 'dhl', 'dhl', 1, 0, ''),
(22, 'dpex', 'dpex', 1, 0, ''),
(23, 'd速快递', 'dsukuaidi', 1, 0, ''),
(24, '递四方', 'disifang', 1, 0, ''),
(25, 'fedex（国外）', 'fedex', 1, 0, ''),
(26, '飞康达物流', 'feikangda', 1, 0, ''),
(27, '凤凰快递', 'fenghuangkuaidi', 1, 0, ''),
(28, '飞快达', 'feikuaida', 1, 0, ''),
(29, '国通快递', 'guotongkuaidi', 1, 0, ''),
(30, '港中能达物流', 'ganzhongnengda', 1, 0, ''),
(31, '广东邮政物流', 'guangdongyouzhengwuliu', 1, 0, ''),
(32, '共速达', 'gongsuda', 1, 0, ''),
(33, '恒路物流', 'hengluwuliu', 1, 0, ''),
(34, '华夏龙物流', 'huaxialongwuliu', 1, 0, ''),
(35, '海红', 'haihongwangsong', 1, 0, ''),
(36, '海外环球', 'haiwaihuanqiu', 1, 0, ''),
(37, '佳怡物流', 'jiayiwuliu', 1, 0, ''),
(38, '京广速递', 'jinguangsudikuaijian', 1, 0, ''),
(39, '急先达', 'jixianda', 1, 0, ''),
(40, '佳吉物流', 'jjwl', 1, 0, ''),
(41, '加运美物流', 'jymwl', 1, 0, ''),
(42, '金大物流', 'jindawuliu', 1, 0, ''),
(43, '嘉里大通', 'jialidatong', 1, 0, ''),
(44, '晋越快递', 'jykd', 1, 0, ''),
(45, '快捷速递', 'kuaijiesudi', 1, 0, ''),
(46, '联邦快递（国内）', 'lianb', 1, 0, ''),
(47, '联昊通物流', 'lianhaowuliu', 1, 0, ''),
(48, '龙邦物流', 'longbanwuliu', 1, 0, ''),
(49, '立即送', 'lijisong', 1, 0, ''),
(50, '乐捷递', 'lejiedi', 1, 0, ''),
(51, '民航快递', 'minghangkuaidi', 1, 0, ''),
(52, '美国快递', 'meiguokuaidi', 1, 0, ''),
(53, '门对门', 'menduimen', 1, 0, ''),
(54, 'OCS', 'ocs', 1, 0, ''),
(55, '配思货运', 'peisihuoyunkuaidi', 1, 0, ''),
(56, '全晨快递', 'quanchenkuaidi', 1, 0, ''),
(57, '全际通物流', 'quanjitong', 1, 0, ''),
(58, '全日通快递', 'quanritongkuaidi', 1, 0, ''),
(59, '全一快递', 'quanyikuaidi', 1, 0, ''),
(60, '如风达', 'rufengda', 1, 0, ''),
(61, '三态速递', 'santaisudi', 1, 0, ''),
(62, '盛辉物流', 'shenghuiwuliu', 1, 0, ''),
(63, '速尔物流', 'sue', 1, 0, ''),
(64, '盛丰物流', 'shengfeng', 1, 0, ''),
(65, '赛澳递', 'saiaodi', 1, 0, ''),
(66, '天地华宇', 'tiandihuayu', 1, 0, ''),
(67, 'tnt', 'tnt', 1, 0, ''),
(68, 'ups', 'ups', 1, 0, ''),
(69, '万家物流', 'wanjiawuliu', 1, 0, ''),
(70, '文捷航空速递', 'wenjiesudi', 1, 0, ''),
(71, '伍圆', 'wuyuan', 1, 0, ''),
(72, '万象物流', 'wxwl', 1, 0, ''),
(73, '新邦物流', 'xinbangwuliu', 1, 0, ''),
(74, '信丰物流', 'xinfengwuliu', 1, 0, ''),
(75, '亚风速递', 'yafengsudi', 1, 0, ''),
(76, '一邦速递', 'yibangwuliu', 1, 0, ''),
(77, '优速物流', 'youshuwuliu', 1, 0, ''),
(78, '邮政包裹挂号信', 'youzhengguonei', 1, 0, ''),
(79, '邮政国际包裹挂号信', 'youzhengguoji', 1, 0, ''),
(80, '远成物流', 'yuanchengwuliu', 1, 0, ''),
(81, '源伟丰快递', 'yuanweifeng', 1, 0, ''),
(82, '元智捷诚快递', 'yuanzhijiecheng', 1, 0, ''),
(83, '运通快递', 'yuntongkuaidi', 1, 0, ''),
(84, '越丰物流', 'yuefengwuliu', 1, 0, ''),
(85, '源安达', 'yad', 1, 0, ''),
(86, '银捷速递', 'yinjiesudi', 1, 0, ''),
(87, '中铁快运', 'zhongtiekuaiyun', 1, 0, ''),
(88, '中邮物流', 'zhongyouwuliu', 1, 0, ''),
(89, '忠信达', 'zhongxinda', 1, 0, ''),
(90, '芝麻开门', 'zhimakaimen', 1, 0, ''),
(91, '安能物流', 'annengwuliu', 1, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_express_cache`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_express_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expresssn` varchar(50) DEFAULT NULL,
  `express` varchar(50) DEFAULT NULL,
  `lasttime` int(11) NOT NULL,
  `datas` text,
  PRIMARY KEY (`id`),
  KEY `idx_expresssn` (`expresssn`) USING BTREE,
  KEY `idx_express` (`express`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_feedback`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `openid` varchar(50) DEFAULT '0',
  `type` tinyint(1) DEFAULT '1',
  `status` tinyint(1) DEFAULT '0',
  `feedbackid` varchar(100) DEFAULT '',
  `transid` varchar(100) DEFAULT '',
  `reason` varchar(1000) DEFAULT '',
  `solution` varchar(1000) DEFAULT '',
  `remark` varchar(1000) DEFAULT '',
  `createtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_feedbackid` (`feedbackid`),
  KEY `idx_createtime` (`createtime`),
  KEY `idx_transid` (`transid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_form`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  `isrequire` tinyint(3) DEFAULT '0',
  `key` varchar(255) DEFAULT '',
  `title` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT '',
  `values` text,
  `cate` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_form_category`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_form_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_fullback_goods`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_fullback_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(3) NOT NULL DEFAULT '0',
  `goodsid` int(11) NOT NULL DEFAULT '0',
  `titles` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `marketprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `minallfullbackallprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `maxallfullbackallprice` decimal(10,2) NOT NULL,
  `minallfullbackallratio` decimal(10,2) DEFAULT NULL,
  `maxallfullbackallratio` decimal(10,2) DEFAULT NULL,
  `day` int(11) NOT NULL DEFAULT '0',
  `fullbackprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fullbackratio` decimal(10,2) DEFAULT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `displayorder` int(11) NOT NULL DEFAULT '0',
  `hasoption` tinyint(3) NOT NULL DEFAULT '0',
  `optionid` text NOT NULL,
  `startday` int(11) NOT NULL DEFAULT '0',
  `refund` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_fullback_log`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_fullback_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `orderid` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `priceevery` decimal(10,2) NOT NULL,
  `day` int(10) NOT NULL,
  `fullbackday` int(10) NOT NULL,
  `createtime` int(10) NOT NULL,
  `fullbacktime` int(10) NOT NULL,
  `isfullback` tinyint(3) NOT NULL DEFAULT '0',
  `goodsid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `ims_ewei_shop_fullback_log`
--

INSERT INTO `ims_ewei_shop_fullback_log` (`id`, `uniacid`, `openid`, `orderid`, `price`, `priceevery`, `day`, `fullbackday`, `createtime`, `fullbacktime`, `isfullback`, `goodsid`) VALUES
(1, 1, 'xcx_oqh0A0SpNJiQCXZ9myNTjz_ExhC8', 212, '0.00', '0.00', 0, 0, 1505365308, 1505278908, 0, 200),
(2, 1, 'xcx_oqh0A0RkMeUCrSfeGq9BBioMpqXU', 210, '0.00', '0.00', 0, 0, 1505367380, 1505280980, 0, 200),
(3, 1, 'xcx_oqh0A0RkMeUCrSfeGq9BBioMpqXU', 209, '0.00', '0.00', 0, 0, 1505367688, 1505281288, 0, 200),
(4, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 261, '0.00', '0.00', 0, 0, 1515994263, 1515907863, 0, 522),
(5, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 261, '0.00', '0.00', 0, 0, 1515994263, 1515907863, 0, 561),
(6, 1, 'xcx_oUSEM5Cwm-VyY0XLfdRScsqEL2G4', 9, '0.00', '0.00', 0, 0, 1519985614, 1519899214, 0, 1),
(7, 1, 'xcx_oUSEM5G4GIZQj1KugQlWQY3bQN9w', 8, '0.00', '0.00', 0, 0, 1519985812, 1519899412, 0, 1),
(8, 1, 'xcx_oUSEM5Cwm-VyY0XLfdRScsqEL2G4', 3, '0.00', '0.00', 0, 0, 1520769443, 1520683043, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_funbar`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_funbar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `datas` text,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_gift`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_gift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `activity` tinyint(3) NOT NULL DEFAULT '1',
  `orderprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goodsid` varchar(255) NOT NULL,
  `giftgoodsid` varchar(255) NOT NULL,
  `starttime` int(11) NOT NULL DEFAULT '0',
  `endtime` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `displayorder` int(11) NOT NULL DEFAULT '0',
  `share_title` varchar(255) NOT NULL,
  `share_icon` varchar(255) NOT NULL,
  `share_desc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_globonus_bill`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_globonus_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `billno` varchar(100) DEFAULT '',
  `paytype` int(11) DEFAULT '0',
  `year` int(11) DEFAULT '0',
  `month` int(11) DEFAULT '0',
  `week` int(11) DEFAULT '0',
  `ordercount` int(11) DEFAULT '0',
  `ordermoney` decimal(10,2) DEFAULT '0.00',
  `bonusmoney` decimal(10,2) DEFAULT '0.00',
  `bonusmoney_send` decimal(10,2) DEFAULT '0.00',
  `bonusmoney_pay` decimal(10,2) DEFAULT '0.00',
  `paytime` int(11) DEFAULT '0',
  `partnercount` int(11) DEFAULT '0',
  `createtime` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '0',
  `starttime` int(11) DEFAULT '0',
  `endtime` int(11) DEFAULT '0',
  `confirmtime` int(11) DEFAULT '0',
  `bonusordermoney` decimal(10,2) DEFAULT '0.00',
  `bonusrate` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_paytype` (`paytype`),
  KEY `idx_createtime` (`createtime`),
  KEY `idx_paytime` (`paytime`),
  KEY `idx_status` (`status`),
  KEY `idx_month` (`month`),
  KEY `idx_week` (`week`),
  KEY `idx_year` (`year`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_globonus_billo`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_globonus_billo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `billid` int(11) DEFAULT '0',
  `orderid` int(11) DEFAULT '0',
  `ordermoney` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `idx_billid` (`billid`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_globonus_billp`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_globonus_billp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `billid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `payno` varchar(255) DEFAULT '',
  `paytype` tinyint(3) DEFAULT '0',
  `bonus` decimal(10,2) DEFAULT '0.00',
  `money` decimal(10,2) DEFAULT '0.00',
  `realmoney` decimal(10,2) DEFAULT '0.00',
  `paymoney` decimal(10,2) DEFAULT '0.00',
  `charge` decimal(10,2) DEFAULT '0.00',
  `chargemoney` decimal(10,2) DEFAULT '0.00',
  `status` tinyint(3) DEFAULT '0',
  `reason` varchar(255) DEFAULT '',
  `paytime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_billid` (`billid`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_globonus_level`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_globonus_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `levelname` varchar(50) DEFAULT '',
  `bonus` decimal(10,4) DEFAULT '0.0000',
  `ordermoney` decimal(10,2) DEFAULT '0.00',
  `ordercount` int(11) DEFAULT '0',
  `commissionmoney` decimal(10,2) DEFAULT '0.00',
  `bonusmoney` decimal(10,2) DEFAULT '0.00',
  `downcount` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_goods`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `pcate` int(11) DEFAULT '0',
  `ccate` int(11) DEFAULT '0',
  `type` tinyint(1) DEFAULT '1',
  `brand_id` int(10) NOT NULL DEFAULT '0' COMMENT '品牌',
  `status` tinyint(1) DEFAULT '1',
  `displayorder` int(11) DEFAULT '0',
  `title` varchar(100) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `unit` varchar(5) DEFAULT '',
  `min_person` int(1) NOT NULL DEFAULT '1' COMMENT '人数',
  `max_person` int(2) NOT NULL DEFAULT '1' COMMENT '最高人数',
  `person_price` float(6,2) NOT NULL DEFAULT '0.00',
  `description` varchar(1000) DEFAULT NULL,
  `info` varchar(100) NOT NULL,
  `label` varchar(100) NOT NULL,
  `content` text,
  `goodssn` varchar(50) DEFAULT '',
  `productsn` varchar(50) DEFAULT '',
  `productprice` decimal(10,2) DEFAULT '0.00',
  `marketprice` decimal(10,2) DEFAULT '0.00',
  `costprice` decimal(10,2) DEFAULT '0.00',
  `originalprice` decimal(10,2) DEFAULT '0.00',
  `meetingprice` int(1) NOT NULL DEFAULT '0' COMMENT '面议',
  `total` int(10) DEFAULT '0',
  `totalcnf` int(11) DEFAULT '0',
  `sales` int(11) DEFAULT '0',
  `salesreal` int(11) DEFAULT '0',
  `spec` varchar(5000) DEFAULT '',
  `createtime` int(11) DEFAULT '0',
  `weight` decimal(10,2) DEFAULT '0.00',
  `credit` varchar(255) DEFAULT NULL,
  `maxbuy` int(11) DEFAULT '0',
  `usermaxbuy` int(11) DEFAULT '0',
  `hasoption` int(11) DEFAULT '0',
  `dispatch` int(11) DEFAULT '0',
  `thumb_url` text,
  `tiny_thumb` varchar(250) NOT NULL,
  `istop` int(1) NOT NULL DEFAULT '0',
  `isnew` tinyint(1) DEFAULT '0',
  `ishot` tinyint(1) DEFAULT '0',
  `isdiscount` tinyint(1) DEFAULT '0',
  `isrecommand` tinyint(1) DEFAULT '0',
  `issendfree` tinyint(1) DEFAULT '0',
  `istime` tinyint(1) DEFAULT '0',
  `iscomment` tinyint(1) DEFAULT '0',
  `timestart` int(11) DEFAULT '0',
  `timeend` int(11) DEFAULT '0',
  `viewcount` int(11) DEFAULT '0',
  `deleted` tinyint(3) DEFAULT '0',
  `hascommission` tinyint(3) DEFAULT '0',
  `commission1_rate` decimal(10,2) DEFAULT '0.00',
  `commission1_pay` decimal(10,2) DEFAULT '0.00',
  `commission2_rate` decimal(10,2) DEFAULT '0.00',
  `commission2_pay` decimal(10,2) DEFAULT '0.00',
  `commission3_rate` decimal(10,2) DEFAULT '0.00',
  `commission3_pay` decimal(10,2) DEFAULT '0.00',
  `score` decimal(10,2) DEFAULT '0.00',
  `taobaoid` varchar(255) DEFAULT '',
  `taotaoid` varchar(255) DEFAULT '',
  `taobaourl` varchar(255) DEFAULT '',
  `updatetime` int(11) DEFAULT '0',
  `share_title` varchar(255) DEFAULT '',
  `share_icon` varchar(255) DEFAULT '',
  `cash` tinyint(3) DEFAULT '0',
  `offline_pay` int(1) NOT NULL DEFAULT '0' COMMENT '线下支付',
  `commission_thumb` varchar(255) DEFAULT '',
  `isnodiscount` tinyint(3) DEFAULT '0',
  `showlevels` text,
  `buylevels` text,
  `showgroups` text,
  `buygroups` text,
  `isverify` tinyint(3) DEFAULT '0',
  `storeids` text,
  `noticeopenid` varchar(255) DEFAULT '',
  `tcate` int(11) DEFAULT '0',
  `noticetype` text,
  `needfollow` tinyint(3) DEFAULT '0',
  `followtip` varchar(255) DEFAULT '',
  `followurl` varchar(255) DEFAULT '',
  `deduct` decimal(10,2) DEFAULT '0.00',
  `virtual` int(11) DEFAULT '0',
  `ccates` text,
  `discounts` text,
  `discount_fromtime` int(10) NOT NULL DEFAULT '0' COMMENT '促销开始时间',
  `discount_totime` int(10) NOT NULL DEFAULT '0' COMMENT '促销结束时间',
  `discount_type` int(1) NOT NULL DEFAULT '1' COMMENT '促销方式',
  `discount_price` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '直降',
  `discount_per` float(6,2) NOT NULL DEFAULT '0.00' COMMENT '促销折扣',
  `discount_and_memprice` int(1) NOT NULL DEFAULT '0' COMMENT '促销和会员价是否同时生效',
  `discount_total` int(10) NOT NULL DEFAULT '0' COMMENT '促销库存',
  `discount_maxbuy` int(6) NOT NULL DEFAULT '0' COMMENT '最多购买',
  `nocommission` tinyint(3) DEFAULT '0',
  `hidecommission` tinyint(3) DEFAULT '0',
  `pcates` text,
  `tcates` text,
  `cates` text,
  `artid` int(11) DEFAULT '0',
  `detail_logo` varchar(255) DEFAULT '',
  `detail_shopname` varchar(255) DEFAULT '',
  `detail_btntext1` varchar(255) DEFAULT '',
  `detail_btnurl1` varchar(255) DEFAULT '',
  `detail_btntext2` varchar(255) DEFAULT '',
  `detail_btnurl2` varchar(255) DEFAULT '',
  `detail_totaltitle` varchar(255) DEFAULT '',
  `saleupdate42392` tinyint(3) DEFAULT '0',
  `deduct2` decimal(10,2) DEFAULT '0.00',
  `ednum` int(11) DEFAULT '0',
  `edmoney` decimal(10,2) DEFAULT '0.00',
  `edareas` text,
  `diyformtype` tinyint(1) DEFAULT '0',
  `diyformid` int(11) DEFAULT '0',
  `diymode` tinyint(1) DEFAULT '0',
  `dispatchtype` tinyint(1) DEFAULT '0',
  `dispatchid` int(11) DEFAULT '0',
  `dispatchprice` decimal(10,2) DEFAULT '0.00',
  `manydeduct` tinyint(1) DEFAULT '0',
  `shorttitle` varchar(255) DEFAULT '',
  `isdiscount_title` varchar(255) DEFAULT '',
  `isdiscount_time` int(11) DEFAULT '0',
  `isdiscount_discounts` text,
  `commission` text,
  `saleupdate37975` tinyint(3) DEFAULT '0',
  `shopid` int(11) DEFAULT '0',
  `allcates` text,
  `minbuy` int(11) DEFAULT '0',
  `invoice` tinyint(3) DEFAULT '0',
  `repair` tinyint(3) DEFAULT '0',
  `seven` tinyint(3) DEFAULT '0',
  `money` varchar(255) DEFAULT '',
  `minprice` decimal(10,2) DEFAULT '0.00',
  `maxprice` decimal(10,2) DEFAULT '0.00',
  `province` varchar(255) DEFAULT '',
  `city` varchar(255) DEFAULT '',
  `buyshow` tinyint(1) DEFAULT '0',
  `buycontent` text,
  `saleupdate51117` tinyint(3) DEFAULT '0',
  `virtualsend` tinyint(1) DEFAULT '0',
  `virtualsendcontent` text,
  `verifytype` tinyint(1) DEFAULT '0',
  `diyfields` text,
  `diysaveid` int(11) DEFAULT '0',
  `diysave` tinyint(1) DEFAULT '0',
  `quality` tinyint(3) DEFAULT '0',
  `groupstype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `showtotal` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subtitle` varchar(255) DEFAULT '',
  `minpriceupdated` tinyint(1) DEFAULT '0',
  `sharebtn` tinyint(1) NOT NULL DEFAULT '0',
  `catesinit3` text,
  `showtotaladd` tinyint(1) DEFAULT '0',
  `merchid` int(11) DEFAULT '0',
  `checked` tinyint(3) DEFAULT '0',
  `thumb_first` tinyint(3) DEFAULT '0',
  `merchsale` tinyint(1) DEFAULT '0',
  `keywords` varchar(255) DEFAULT '',
  `catch_id` varchar(255) DEFAULT '',
  `catch_url` varchar(255) DEFAULT '',
  `catch_source` varchar(255) DEFAULT '',
  `saleupdate40170` tinyint(3) DEFAULT '0',
  `saleupdate35843` tinyint(3) DEFAULT '0',
  `labelname` text,
  `autoreceive` int(11) DEFAULT '0',
  `cannotrefund` tinyint(3) DEFAULT '0',
  `saleupdate33219` tinyint(3) DEFAULT '0',
  `bargain` int(11) DEFAULT '0',
  `buyagain` decimal(10,2) DEFAULT '0.00',
  `buyagain_islong` tinyint(1) DEFAULT '0',
  `buyagain_condition` tinyint(1) DEFAULT '0',
  `buyagain_sale` tinyint(1) DEFAULT '0',
  `buyagain_commission` text,
  `saleupdate32484` tinyint(3) DEFAULT '0',
  `saleupdate36586` tinyint(3) DEFAULT '0',
  `diypage` int(11) DEFAULT NULL,
  `cashier` tinyint(1) DEFAULT '0',
  `saleupdate53481` tinyint(3) DEFAULT '0',
  `saleupdate30424` tinyint(3) DEFAULT '0',
  `isendtime` tinyint(3) NOT NULL DEFAULT '0',
  `usetime` int(11) NOT NULL DEFAULT '0',
  `endtime` int(11) NOT NULL DEFAULT '0',
  `merchdisplayorder` int(11) NOT NULL DEFAULT '0',
  `exchange_stock` int(11) DEFAULT '0',
  `exchange_postage` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ispresell` tinyint(3) NOT NULL DEFAULT '0',
  `presellprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `presellover` tinyint(3) NOT NULL DEFAULT '0',
  `presellovertime` int(11) NOT NULL,
  `presellstart` tinyint(3) NOT NULL DEFAULT '0',
  `preselltimestart` int(11) NOT NULL DEFAULT '0',
  `presellend` tinyint(3) NOT NULL DEFAULT '0',
  `preselltimeend` int(11) NOT NULL DEFAULT '0',
  `presellsendtype` tinyint(3) NOT NULL DEFAULT '0',
  `presellsendstatrttime` int(11) NOT NULL DEFAULT '0',
  `presellsendtime` int(11) NOT NULL DEFAULT '0',
  `edareas_code` text NOT NULL,
  `unite_total` tinyint(3) NOT NULL DEFAULT '0',
  `buyagain_price` decimal(10,2) DEFAULT '0.00',
  `threen` varchar(255) DEFAULT '',
  `intervalfloor` tinyint(1) DEFAULT '0',
  `intervalprice` varchar(512) DEFAULT '',
  `isfullback` tinyint(3) NOT NULL DEFAULT '0',
  `isstatustime` tinyint(3) NOT NULL DEFAULT '0',
  `statustimestart` int(10) NOT NULL DEFAULT '0',
  `statustimeend` int(10) NOT NULL DEFAULT '0',
  `nosearch` tinyint(1) NOT NULL DEFAULT '0',
  `showsales` tinyint(3) NOT NULL DEFAULT '1',
  `islive` int(11) NOT NULL DEFAULT '0',
  `liveprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_pcate` (`pcate`),
  KEY `idx_ccate` (`ccate`),
  KEY `idx_isnew` (`isnew`),
  KEY `idx_ishot` (`ishot`),
  KEY `idx_isdiscount` (`isdiscount`),
  KEY `idx_isrecommand` (`isrecommand`),
  KEY `idx_iscomment` (`iscomment`),
  KEY `idx_issendfree` (`issendfree`),
  KEY `idx_istime` (`istime`),
  KEY `idx_deleted` (`deleted`),
  KEY `idx_tcate` (`tcate`),
  KEY `idx_scate` (`tcate`),
  KEY `idx_merchid` (`merchid`),
  KEY `idx_checked` (`checked`),
  FULLTEXT KEY `idx_buylevels` (`buylevels`),
  FULLTEXT KEY `idx_showgroups` (`showgroups`),
  FULLTEXT KEY `idx_buygroups` (`buygroups`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `ims_ewei_shop_goods`
--

INSERT INTO `ims_ewei_shop_goods` (`id`, `uniacid`, `pcate`, `ccate`, `type`, `brand_id`, `status`, `displayorder`, `title`, `thumb`, `unit`, `min_person`, `max_person`, `person_price`, `description`, `info`, `label`, `content`, `goodssn`, `productsn`, `productprice`, `marketprice`, `costprice`, `originalprice`, `meetingprice`, `total`, `totalcnf`, `sales`, `salesreal`, `spec`, `createtime`, `weight`, `credit`, `maxbuy`, `usermaxbuy`, `hasoption`, `dispatch`, `thumb_url`, `tiny_thumb`, `istop`, `isnew`, `ishot`, `isdiscount`, `isrecommand`, `issendfree`, `istime`, `iscomment`, `timestart`, `timeend`, `viewcount`, `deleted`, `hascommission`, `commission1_rate`, `commission1_pay`, `commission2_rate`, `commission2_pay`, `commission3_rate`, `commission3_pay`, `score`, `taobaoid`, `taotaoid`, `taobaourl`, `updatetime`, `share_title`, `share_icon`, `cash`, `offline_pay`, `commission_thumb`, `isnodiscount`, `showlevels`, `buylevels`, `showgroups`, `buygroups`, `isverify`, `storeids`, `noticeopenid`, `tcate`, `noticetype`, `needfollow`, `followtip`, `followurl`, `deduct`, `virtual`, `ccates`, `discounts`, `discount_fromtime`, `discount_totime`, `discount_type`, `discount_price`, `discount_per`, `discount_and_memprice`, `discount_total`, `discount_maxbuy`, `nocommission`, `hidecommission`, `pcates`, `tcates`, `cates`, `artid`, `detail_logo`, `detail_shopname`, `detail_btntext1`, `detail_btnurl1`, `detail_btntext2`, `detail_btnurl2`, `detail_totaltitle`, `saleupdate42392`, `deduct2`, `ednum`, `edmoney`, `edareas`, `diyformtype`, `diyformid`, `diymode`, `dispatchtype`, `dispatchid`, `dispatchprice`, `manydeduct`, `shorttitle`, `isdiscount_title`, `isdiscount_time`, `isdiscount_discounts`, `commission`, `saleupdate37975`, `shopid`, `allcates`, `minbuy`, `invoice`, `repair`, `seven`, `money`, `minprice`, `maxprice`, `province`, `city`, `buyshow`, `buycontent`, `saleupdate51117`, `virtualsend`, `virtualsendcontent`, `verifytype`, `diyfields`, `diysaveid`, `diysave`, `quality`, `groupstype`, `showtotal`, `subtitle`, `minpriceupdated`, `sharebtn`, `catesinit3`, `showtotaladd`, `merchid`, `checked`, `thumb_first`, `merchsale`, `keywords`, `catch_id`, `catch_url`, `catch_source`, `saleupdate40170`, `saleupdate35843`, `labelname`, `autoreceive`, `cannotrefund`, `saleupdate33219`, `bargain`, `buyagain`, `buyagain_islong`, `buyagain_condition`, `buyagain_sale`, `buyagain_commission`, `saleupdate32484`, `saleupdate36586`, `diypage`, `cashier`, `saleupdate53481`, `saleupdate30424`, `isendtime`, `usetime`, `endtime`, `merchdisplayorder`, `exchange_stock`, `exchange_postage`, `ispresell`, `presellprice`, `presellover`, `presellovertime`, `presellstart`, `preselltimestart`, `presellend`, `preselltimeend`, `presellsendtype`, `presellsendstatrttime`, `presellsendtime`, `edareas_code`, `unite_total`, `buyagain_price`, `threen`, `intervalfloor`, `intervalprice`, `isfullback`, `isstatustime`, `statustimestart`, `statustimeend`, `nosearch`, `showsales`, `islive`, `liveprice`) VALUES
(1, 1, 1174, 0, 2, 0, 1, 0, '快手网红版', 'images/1/2018/02/B8Vt28AH2zys6yhJD26sV89FhsvYHA.jpg', '', 1, 1, 0.00, '', '', '人气款', '<p><img src="http://d.happyhy.com/attachment/images/1/2018/02/zc62ZBwB25wvW86eVB45VbBBw5s52B.jpg" width="100%" style=""/></p><p><img src="http://d.happyhy.com/attachment/images/1/2018/02/vDQN6KZ30aB6B556P4z6h50qC22k5K.jpg" width="100%" style=""/></p><p><br/></p>', '', '', '0.00', '0.01', '0.00', '0.00', 0, 100, 2, 12, 5, '', 1518488524, '0.00', '', 0, 0, 1, 0, 'a:0:{}', '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', '', 0, '', '', 0, 0, '', 0, '', '', '', '', 1, '', '', 0, '', 0, '', '', '0.00', 0, '', '{"type":"0","default":"","default_pay":""}', 0, 0, 0, 0.00, 0.00, 0, 0, 0, 0, 0, '1174', '', '1174', 0, '', '', '', '', '', '', '', 0, '0.00', 0, '0.00', '', 0, 0, 0, 0, 0, '0.00', 0, '', '', 0, '{"type":1,"default":{"option3":null,"option4":null,"option5":null}}', '{"type":0,"default":{"option3":[],"option4":[],"option5":[]}}', 0, 0, NULL, 0, 0, 0, 0, '', '0.01', '0.02', '请选择省份', '请选择城市', 0, '', 0, 0, '', 0, NULL, 0, 0, 0, 0, 0, '快手网红个性头像', 0, 0, NULL, 0, 0, 0, 0, 0, '', '', '', '', 0, 0, 'N;', 0, 0, 0, 0, '0.00', 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1518488340, 0, 0, '0.00', 0, '0.00', 0, 0, 0, 0, 0, 0, 0, 1518488340, 0, '', 0, '0.00', '', 0, '', 0, 0, 1518488340, 1520907540, 0, 0, 0, '0.00'),
(2, 1, 1174, 0, 2, 0, 1, 0, '日漫风', 'images/1/2018/02/Nppscsd3K0DcNSgydpysPPAHCOCSEQ.jpg', '', 1, 1, 66.00, '', '', '', '<p><img src="https://d.happyhy.com/attachment/images/1/2018/03/dCR515lYlYoYSRz1v8rVvOvr3yeRZz.jpg" width="100%" alt="images/1/2018/03/dCR515lYlYoYSRz1v8rVvOvr3yeRZz.jpg"/></p>', '', '', '0.00', '66.00', '0.00', '0.00', 0, 100, 2, 35322, 0, '', 1518488700, '0.00', '', 0, 0, 1, 0, 'a:0:{}', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', '', 0, '', '', 0, 0, '', 0, '', '', '', '', 1, '', '', 0, '', 0, '', '', '0.00', 0, '', '{"type":"0","default":"","default_pay":""}', 0, 0, 0, 0.00, 0.00, 0, 0, 0, 0, 0, '1174', '', '1174', 0, '', '', '', '', '', '', '', 0, '0.00', 0, '0.00', '', 0, 0, 0, 0, 0, '0.00', 0, '', '', 0, '{"type":1,"default":{"option6":null,"option7":null,"option8":null}}', '{"type":0,"default":{"option6":[],"option7":[],"option8":[]}}', 0, 0, NULL, 0, 0, 0, 0, '', '25.00', '49.00', '请选择省份', '请选择城市', 0, '', 0, 0, '', 0, NULL, 0, 0, 0, 0, 0, 'Q版 梦幻版', 0, 0, NULL, 0, 0, 0, 0, 0, '', '', '', '', 0, 0, 'N;', 0, 0, 0, 0, '0.00', 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1518488520, 0, 0, '0.00', 0, '0.00', 0, 0, 0, 0, 0, 0, 0, 1518488520, 0, '', 0, '0.00', '', 0, '', 0, 0, 1518488520, 1520907720, 0, 1, 0, '0.00'),
(3, 1, 1174, 0, 2, 0, 1, 0, '梦幻Q版 女生头像1', 'images/1/2018/02/BhdvybKZIwxcBzmvM0FivKD9dIVMgd.jpg', '', 1, 1, 0.00, '', '', '', '', '', '', '0.00', '77.00', '0.00', '0.00', 0, 100, 2, 0, 0, '', 1518489584, '0.00', '', 0, 0, 0, 0, 'a:0:{}', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', '', 0, '', '', 0, 0, '', 0, '', '', '', '', 1, '', '', 0, '', 0, '', '', '0.00', 0, '', '{"type":"0","default":"","default_pay":""}', 0, 0, 0, 0.00, 0.00, 0, 0, 0, 0, 0, '1174', '', '1174', 0, '', '', '', '', '', '', '', 0, '0.00', 0, '0.00', '', 0, 0, 0, 0, 0, '0.00', 0, '', '', 0, '{"type":0,"default":{"option0":null}}', '{"type":0,"default":{"option0":["",""]}}', 0, 0, NULL, 0, 0, 0, 0, '', '77.00', '77.00', '请选择省份', '请选择城市', 0, '', 0, 0, '', 0, NULL, 0, 0, 0, 0, 0, '可爱梦幻', 0, 0, NULL, 0, 0, 0, 0, 0, '', '', '', '', 0, 0, 'N;', 0, 0, 0, 0, '0.00', 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1518488700, 0, 0, '0.00', 0, '0.00', 0, 0, 0, 0, 0, 0, 0, 1518488700, 0, '', 0, '0.00', '', 0, '', 0, 0, 1518488700, 1520907900, 0, 0, 0, '0.00'),
(4, 1, 1174, 0, 2, 0, 1, 0, '魅力女生头像', 'images/1/2018/02/nPOrppYCx51gewRJNIbI2jEjYnC2ei.jpg', '', 1, 1, 0.00, '', '', '', '', '', '', '0.00', '88.00', '0.00', '0.00', 0, 100, 2, 80, 0, '', 1518489660, '0.00', '', 0, 0, 0, 0, 'a:0:{}', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', '', 0, '', '', 0, 0, '', 0, '', '', '', '', 1, '', '', 0, '', 0, '', '', '0.00', 0, '', '{"type":"0","default":"","default_pay":""}', 0, 0, 0, 0.00, 0.00, 0, 0, 0, 0, 0, '1174', '', '1174', 0, '', '', '', '', '', '', '', 0, '0.00', 0, '0.00', '', 0, 0, 0, 0, 0, '0.00', 0, '', '', 0, '{"type":0,"default":{"option0":null}}', '{"type":0,"default":{"option0":["",""]}}', 0, 0, NULL, 0, 0, 0, 0, '', '88.00', '88.00', '请选择省份', '请选择城市', 0, '', 0, 0, '', 0, NULL, 0, 0, 0, 0, 0, '魅力之星', 0, 0, NULL, 0, 0, 0, 0, 0, '', '', '', '', 0, 0, 'N;', 0, 0, 0, 0, '0.00', 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1518489540, 0, 0, '0.00', 0, '0.00', 0, 0, 0, 0, 0, 0, 0, 1518489540, 0, '', 0, '0.00', '', 0, '', 0, 0, 1518489540, 1520908740, 0, 0, 0, '0.00'),
(5, 1, 1175, 0, 1, 0, 1, 0, '男生头像一', 'images/1/2018/02/r0NkugJ3RF4orFrZTjjzNft4Uk9kK9.jpg', '', 1, 1, 0.00, '', '', '', '', '', '', '0.00', '67.00', '0.00', '0.00', 0, 100, 2, 26, 0, '', 1518489735, '0.00', '', 0, 0, 0, 0, 'a:0:{}', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', '', 0, '', '', 0, 0, '', 0, '', '', '', '', 1, '', '', 0, '', 0, '', '', '0.00', 0, '', '{"type":"0","default":"","default_pay":""}', 0, 0, 0, 0.00, 0.00, 0, 0, 0, 0, 0, '1175', '', '1175', 0, '', '', '', '', '', '', '', 0, '0.00', 0, '0.00', '', 0, 0, 0, 0, 0, '0.00', 0, '', '', 0, '{"type":0,"default":{"option0":null}}', '{"type":0,"default":{"option0":["",""]}}', 0, 0, NULL, 0, 0, 0, 0, '', '67.00', '67.00', '请选择省份', '请选择城市', 0, '', 0, 0, '', 0, NULL, 0, 0, 0, 0, 0, '男生头像一', 0, 0, NULL, 0, 0, 0, 0, 0, '', '', '', '', 0, 0, 'N;', 0, 0, 0, 0, '0.00', 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1518489660, 0, 0, '0.00', 0, '0.00', 0, 0, 0, 0, 0, 0, 0, 1518489660, 0, '', 0, '0.00', '', 0, '', 0, 0, 1518489660, 1520908860, 0, 0, 0, '0.00'),
(6, 1, 1175, 0, 2, 0, 1, 0, '男生头像二', 'images/1/2018/02/zkAja8H4zw4bEjUW9b49433ZaF1449.jpg', '', 1, 1, 0.00, '', '', '', '', '', '', '0.00', '0.00', '0.00', '0.00', 0, 100, 2, 0, 0, '', 1518602755, '0.00', '', 0, 0, 0, 0, 'a:0:{}', 'images/1/2018/02/zkAja8H4zw4bEjUW9b49433ZaF1449.jpg', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', '', 0, '', '', 0, 0, '', 0, '', '', '', '', 1, '', '', 0, '', 0, '', '', '0.00', 0, '', '{"type":"0","default":"","default_pay":""}', 0, 0, 0, 0.00, 0.00, 0, 0, 0, 0, 0, '1175', '', '1175', 0, '', '', '', '', '', '', '', 0, '0.00', 0, '0.00', '', 0, 0, 0, 0, 0, '0.00', 0, '', '', 0, '{"type":0,"default":{"option0":null}}', '{"type":0,"default":{"option0":["",""]}}', 0, 0, NULL, 0, 0, 0, 0, '', '0.00', '0.00', '请选择省份', '请选择城市', 0, '', 0, 0, '', 0, NULL, 0, 0, 0, 0, 0, '', 0, 0, NULL, 0, 0, 0, 0, 0, '', '', '', '', 0, 0, 'N;', 0, 0, 0, 0, '0.00', 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1518602640, 0, 0, '0.00', 0, '0.00', 0, 0, 0, 0, 0, 0, 0, 1518602640, 0, '', 0, '0.00', '', 0, '', 0, 0, 1518602640, 1521021840, 0, 0, 0, '0.00'),
(7, 1, 1177, 0, 2, 0, 1, 0, '亲子头像一', 'images/1/2018/02/vDQN6KZ30aB6B556P4z6h50qC22k5K.jpg', '', 2, 4, 10.01, '', '多人1500像素*1500像素电子版', '', '', '', '', '0.00', '0.10', '0.00', '0.00', 0, 100, 2, 1, 1, '', 1518602901, '0.00', '', 0, 0, 1, 0, 'a:0:{}', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', '', 0, '', '', 0, 0, '', 0, '', '', '', '', 1, '', '', 0, '', 0, '', '', '0.00', 0, '', '{"type":"0","default":"","default_pay":""}', 0, 0, 0, 0.00, 0.00, 0, 0, 0, 0, 0, '1177', '', '1177', 0, '', '', '', '', '', '', '', 0, '0.00', 0, '0.00', '', 0, 0, 0, 0, 0, '0.00', 0, '', '', 0, '{"type":1,"default":{"option1":null,"option2":null}}', '{"type":0,"default":{"option1":[],"option2":[]}}', 0, 0, NULL, 0, 0, 0, 0, '', '0.10', '0.10', '请选择省份', '请选择城市', 0, '', 0, 0, '', 0, NULL, 0, 0, 0, 0, 0, '亲子头像一', 0, 0, NULL, 0, 0, 0, 0, 0, '', '', '', '', 0, 0, 'N;', 0, 0, 0, 0, '0.00', 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1518602820, 0, 0, '0.00', 0, '0.00', 0, 0, 0, 0, 0, 0, 0, 1518602820, 0, '', 0, '0.00', '', 0, '', 0, 0, 1518602820, 1521022020, 0, 0, 0, '0.00'),
(8, 1, 0, 0, 2, 0, 1, 0, '亲子头像二', 'images/1/2018/02/zc62ZBwB25wvW86eVB45VbBBw5s52B.jpg', '', 1, 1, 0.00, '', '', '', '', '', '', '0.00', '56.00', '0.00', '0.00', 0, 100, 2, 56, 0, '', 1518602974, '0.00', '', 0, 0, 0, 0, 'a:0:{}', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', '', 0, '', '', 0, 0, '', 0, '', '', '', '', 1, '', '', 0, '', 0, '', '', '0.00', 0, '', '{"type":"0","default":"","default_pay":""}', 0, 0, 0, 0.00, 0.00, 0, 0, 0, 0, 0, '', '', '', 0, '', '', '', '', '', '', '', 0, '0.00', 0, '0.00', '', 0, 0, 0, 0, 0, '0.00', 0, '', '', 0, '{"type":0,"default":{"option0":null}}', '{"type":0,"default":{"option0":["",""]}}', 0, 0, NULL, 0, 0, 0, 0, '', '56.00', '56.00', '请选择省份', '请选择城市', 0, '', 0, 0, '', 0, NULL, 0, 0, 0, 0, 0, '', 0, 0, NULL, 0, 0, 0, 0, 0, '', '', '', '', 0, 0, 'N;', 0, 0, 0, 0, '0.00', 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1518602880, 0, 0, '0.00', 0, '0.00', 0, 0, 0, 0, 0, 0, 0, 1518602880, 0, '', 0, '0.00', '', 0, '', 0, 0, 1518602880, 1521022080, 0, 0, 0, '0.00'),
(9, 1, 1176, 0, 2, 0, 1, 0, '情侣头像 甜甜蜜蜜', 'images/1/2018/02/bGEPLATBxatVW1pV1W1jBjxlwvAyv1.jpg', '', 1, 1, 0.00, '', '', '', '', '', '', '0.00', '187.00', '0.00', '0.00', 0, 100, 2, 0, 0, '', 1518603063, '0.00', '', 0, 0, 0, 0, 'a:0:{}', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', '', 0, '', '', 0, 0, '', 0, '', '', '', '', 1, '', '', 0, '', 0, '', '', '0.00', 0, '', '{"type":"0","default":"","default_pay":""}', 0, 0, 0, 0.00, 0.00, 0, 0, 0, 0, 0, '1176', '', '1176', 0, '', '', '', '', '', '', '', 0, '0.00', 0, '0.00', '', 0, 0, 0, 0, 0, '0.00', 0, '', '', 0, '{"type":0,"default":{"option0":null}}', '{"type":0,"default":{"option0":["",""]}}', 0, 0, NULL, 0, 0, 0, 0, '', '187.00', '187.00', '请选择省份', '请选择城市', 0, '', 0, 0, '', 0, NULL, 0, 0, 0, 0, 0, '', 0, 0, NULL, 0, 0, 0, 0, 0, '', '', '', '', 0, 0, 'N;', 0, 0, 0, 0, '0.00', 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1518602940, 0, 0, '0.00', 0, '0.00', 0, 0, 0, 0, 0, 0, 0, 1518602940, 0, '', 0, '0.00', '', 0, '', 0, 0, 1518602940, 1521022140, 0, 0, 0, '0.00'),
(10, 1, 1176, 0, 2, 0, 1, 0, '情侣头像二', 'images/1/2018/02/q8Hq6e70Su7cDzOooEHFSSI030Qj6d.jpg', '', 2, 2, 20.00, '', '', '', '', '', '', '0.00', '0.10', '0.00', '0.00', 0, 100, 2, 1, 1, '', 1518603114, '0.00', '', 0, 0, 1, 0, 'a:0:{}', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', '', 0, '', '', 0, 0, '', 0, '', '', '', '', 1, '', '', 0, '', 0, '', '', '0.00', 0, '', '{"type":"0","default":"","default_pay":""}', 0, 0, 0, 0.00, 0.00, 0, 0, 0, 0, 0, '1176', '', '1176', 0, '', '', '', '', '', '', '', 0, '0.00', 0, '0.00', '', 0, 0, 0, 0, 0, '0.00', 0, '', '', 0, '{"type":1,"default":{"option9":null,"option10":null,"option11":null}}', '{"type":0,"default":{"option9":[],"option10":[],"option11":[]}}', 0, 0, NULL, 0, 0, 0, 0, '', '20.00', '45.00', '请选择省份', '请选择城市', 0, '', 0, 0, '', 0, NULL, 0, 0, 0, 0, 0, '情侣头像二', 0, 0, NULL, 0, 0, 0, 0, 0, '', '', '', '', 0, 0, 'N;', 0, 0, 0, 0, '0.00', 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1518603060, 0, 0, '0.00', 0, '0.00', 0, 0, 0, 0, 0, 0, 0, 1518603060, 0, '', 0, '0.00', '', 0, '', 0, 0, 1518603060, 1521022260, 0, 0, 0, '0.00'),
(11, 1, 1190, 0, 2, 0, 1, 0, '宠物Q版', 'images/1/2018/03/SOT0SQqctDebdn0JltDINl0DnHANJt.jpg', '', 1, 1, 0.00, '', '', '人气款', '', '', '', '0.00', '0.10', '0.00', '0.00', 0, 100, 0, 654334, 0, '', 1520771983, '0.00', '', 0, 0, 0, 0, 'a:0:{}', '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', '', 0, '', '', 0, 0, '', 0, '', '', '', '', 1, '', '', 0, '', 0, '', '', '0.00', 0, '', '{"type":"0","default":"","default_pay":""}', 0, 0, 0, 0.00, 0.00, 0, 0, 0, 0, 0, '1190', '', '1190', 0, '', '', '', '', '', '', '', 0, '0.00', 0, '0.00', '', 0, 0, 0, 0, 0, '0.00', 0, '', '', 0, '{"type":0,"default":{"option0":null}}', '{"type":0}', 0, 0, NULL, 0, 0, 0, 0, '', '0.10', '0.10', '请选择省份', '请选择城市', 0, '', 0, 0, '', 0, NULL, 0, 0, 0, 0, 0, 'Q版萌宠', 0, 0, NULL, 0, 0, 0, 0, 0, '', '', '', '', 0, 0, 'N;', 0, 0, 0, 0, '0.00', 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1520771760, 0, 0, '0.00', 0, '0.00', 0, 0, 0, 0, 0, 0, 0, 1520771760, 0, '', 0, '0.00', '', 0, '', 0, 0, 1520771760, 1523450160, 0, 1, 0, '0.00'),
(12, 1, 1190, 0, 2, 0, 1, 0, '宠物Q版', 'images/1/2018/03/SOT0SQqctDebdn0JltDINl0DnHANJt.jpg', '', 1, 1, 0.00, '', '', '人气款', '', '', '', '0.00', '0.10', '0.00', '0.00', 0, 100, 0, 2121, 0, '', 1520772272, '0.00', '', 0, 0, 0, 0, 'a:0:{}', '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', '', 0, '', '', 0, 0, '', 0, '', '', '', '', 1, '', '', 0, '', 0, '', '', '0.00', 0, '', '{"type":"0","default":"","default_pay":""}', 0, 0, 0, 0.00, 0.00, 0, 0, 0, 0, 0, '1190', '', '1190', 0, '', '', '', '', '', '', '', 0, '0.00', 0, '0.00', '', 0, 0, 0, 0, 0, '0.00', 0, '', '', 0, '{"type":0,"default":{"option0":null}}', '{"type":0}', 0, 0, NULL, 0, 0, 0, 0, '', '0.10', '0.10', '请选择省份', '请选择城市', 0, '', 0, 0, '', 0, NULL, 0, 0, 0, 0, 0, 'Q版萌宠', 0, 0, NULL, 0, 0, 0, 0, 0, '', '', '', '', 0, 0, 'N;', 0, 0, 0, 0, '0.00', 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1520772180, 0, 0, '0.00', 0, '0.00', 0, 0, 0, 0, 0, 0, 0, 1520772180, 0, '', 0, '0.00', '', 0, '', 0, 0, 1520772180, 1523450580, 0, 1, 0, '0.00'),
(13, 1, 1190, 0, 2, 0, 1, 0, '宠物秀', 'images/1/2018/03/yRv0YIx438d8qOXm0Ivqj8x3IX770R.png', '', 1, 1, 0.00, '', '宠物秀', '', '', '', '', '0.00', '80.00', '0.00', '0.00', 0, 100, 2, 0, 0, '', 1520833766, '0.00', '', 0, 0, 0, 0, 'a:0:{}', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', '', 0, '', '', 0, 0, '', 0, '', '', '', '', 1, '', '', 0, '', 0, '', '', '0.00', 0, '', '{"type":"0","default":"","default_pay":""}', 0, 0, 0, 0.00, 0.00, 0, 0, 0, 0, 0, '1190', '', '1190', 0, '', '', '', '', '', '', '', 0, '0.00', 0, '0.00', '', 0, 0, 0, 0, 0, '0.00', 0, '宠物秀', '', 0, '{"type":0,"default":{"option0":null}}', '{"type":0}', 0, 0, NULL, 0, 0, 0, 0, '', '80.00', '80.00', '请选择省份', '请选择城市', 0, '', 0, 0, '', 0, NULL, 0, 0, 0, 0, 0, '宠物秀', 0, 0, NULL, 0, 0, 0, 0, 0, '', '', '', '', 0, 0, 'N;', 0, 0, 0, 0, '0.00', 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1520833440, 0, 0, '0.00', 0, '0.00', 0, 0, 0, 0, 0, 0, 0, 1520833440, 0, '', 0, '0.00', '', 0, '', 0, 0, 1520833440, 1523511840, 0, 0, 0, '0.00'),
(14, 1, 1190, 0, 2, 0, 1, 0, '宠物画像', 'images/1/2018/03/SOT0SQqctDebdn0JltDINl0DnHANJt.jpg', '', 1, 1, 0.00, '', '', '小萌宠', '<p><img src="https://d.happyhy.com/attachment/images/1/2018/03/W6id27Z7dS5Kas77ADAs5AiaASVo2O.jpg" width="100%" alt="images/1/2018/03/W6id27Z7dS5Kas77ADAs5AiaASVo2O.jpg"/></p>', '', '', '0.00', '0.00', '0.00', '0.00', 0, 297665, 0, 321122, 1, '', 1520837390, '0.00', '', 0, 0, 1, 0, 'a:0:{}', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '', '', 0, '', '', 0, 0, '', 0, '', '', '', '', 1, '', '', 0, '', 0, '', '', '0.00', 0, '', '{"type":"0","default":"","default_pay":""}', 0, 0, 0, 0.00, 0.00, 0, 0, 0, 0, 0, '1190', '', '1190', 0, '', '', '', '', '', '', '', 0, '0.00', 0, '0.00', '', 0, 0, 0, 0, 0, '0.00', 0, '', '', 0, '{"type":1,"default":{"option12":null,"option13":null}}', '{"type":0,"default":{"option12":[],"option13":[]}}', 0, 0, NULL, 0, 0, 0, 0, '', '0.10', '0.20', '请选择省份', '请选择城市', 0, '', 0, 0, '', 0, NULL, 0, 0, 0, 0, 0, '萌宠', 0, 0, NULL, 0, 0, 0, 0, 0, '', '', '', '', 0, 0, 'N;', 0, 0, 0, 0, '0.00', 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1520837280, 0, 0, '0.00', 0, '0.00', 0, 0, 0, 0, 0, 0, 0, 1520837280, 0, '', 0, '0.00', '', 0, '', 0, 0, 1520837280, 1523515680, 0, 0, 0, '0.00');

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_goodscode_good`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_goodscode_good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `goodsid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `qrcode` varchar(255) NOT NULL,
  `status` tinyint(3) NOT NULL,
  `displayorder` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_goods_comment`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_goods_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `goodsid` int(10) DEFAULT '0',
  `openid` varchar(50) DEFAULT '',
  `nickname` varchar(50) DEFAULT '',
  `headimgurl` varchar(255) DEFAULT '',
  `content` varchar(255) DEFAULT '',
  `createtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_goodsid` (`goodsid`),
  KEY `idx_openid` (`openid`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_goods_group`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_goods_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `goodsids` varchar(255) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `merchid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_enabled` (`enabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_goods_label`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_goods_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL DEFAULT '',
  `labelname` text NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `displayorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_goods_labelstyle`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_goods_labelstyle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `style` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_goods_option`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_goods_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `goodsid` int(10) DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `thumb` varchar(60) DEFAULT '',
  `productprice` decimal(10,2) DEFAULT '0.00',
  `marketprice` decimal(10,2) DEFAULT '0.00',
  `costprice` decimal(10,2) DEFAULT '0.00',
  `stock` int(11) DEFAULT '0',
  `weight` decimal(10,2) DEFAULT '0.00',
  `displayorder` int(11) DEFAULT '0',
  `specs` text,
  `skuId` varchar(255) DEFAULT '',
  `goodssn` varchar(255) DEFAULT '',
  `productsn` varchar(255) DEFAULT '',
  `virtual` int(11) DEFAULT '0',
  `exchange_stock` int(11) DEFAULT '0',
  `exchange_postage` decimal(10,2) NOT NULL DEFAULT '0.00',
  `presellprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `day` int(3) NOT NULL,
  `allfullbackprice` decimal(10,2) NOT NULL,
  `fullbackprice` decimal(10,2) NOT NULL,
  `allfullbackratio` decimal(10,2) DEFAULT NULL,
  `fullbackratio` decimal(10,2) DEFAULT NULL,
  `isfullback` tinyint(3) NOT NULL,
  `islive` int(11) NOT NULL,
  `liveprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_goodsid` (`goodsid`),
  KEY `idx_displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `ims_ewei_shop_goods_option`
--

INSERT INTO `ims_ewei_shop_goods_option` (`id`, `uniacid`, `goodsid`, `title`, `thumb`, `productprice`, `marketprice`, `costprice`, `stock`, `weight`, `displayorder`, `specs`, `skuId`, `goodssn`, `productsn`, `virtual`, `exchange_stock`, `exchange_postage`, `presellprice`, `day`, `allfullbackprice`, `fullbackprice`, `allfullbackratio`, `fullbackratio`, `isfullback`, `islive`, `liveprice`) VALUES
(1, 1, 7, '头像', '', '0.00', '0.10', '0.00', 0, '0.00', 0, '291', '', '', '', 0, 0, '0.00', '0.00', 0, '0.00', '0.00', NULL, NULL, 0, 0, '0.00'),
(2, 1, 7, '全身', '', '0.00', '0.10', '0.00', 0, '0.00', 0, '292', '', '', '', 0, 0, '0.00', '0.00', 0, '0.00', '0.00', NULL, NULL, 0, 0, '0.00'),
(3, 1, 1, '头像', '', '0.00', '0.01', '0.00', 0, '0.00', 0, '293', '', '', '', 0, 0, '0.00', '0.00', 0, '0.00', '0.00', NULL, NULL, 0, 0, '0.00'),
(4, 1, 1, '半身', '', '0.00', '0.02', '0.00', 0, '0.00', 0, '294', '', '', '', 0, 0, '0.00', '0.00', 0, '0.00', '0.00', NULL, NULL, 0, 0, '0.00'),
(5, 1, 1, '全身', '', '0.00', '0.02', '0.00', 0, '0.00', 0, '295', '', '', '', 0, 0, '0.00', '0.00', 0, '0.00', '0.00', NULL, NULL, 0, 0, '0.00'),
(6, 1, 2, '头像', '', '0.00', '25.00', '0.00', 96445664, '0.00', 0, '296', '', '', '', 0, 0, '0.00', '0.00', 0, '0.00', '0.00', NULL, NULL, 0, 0, '0.00'),
(7, 1, 2, '半身', '', '0.00', '35.00', '0.00', 96445664, '0.00', 0, '297', '', '', '', 0, 0, '0.00', '0.00', 0, '0.00', '0.00', NULL, NULL, 0, 0, '0.00'),
(8, 1, 2, '全身', '', '0.00', '49.00', '0.00', 96445664, '0.00', 0, '298', '', '', '', 0, 0, '0.00', '0.00', 0, '0.00', '0.00', NULL, NULL, 0, 0, '0.00'),
(9, 1, 10, '头像', '', '0.00', '20.00', '0.00', 12311, '0.00', 0, '299', '', '', '', 0, 0, '0.00', '0.10', 0, '0.00', '0.00', NULL, NULL, 0, 0, '0.00'),
(10, 1, 10, '半身', '', '0.00', '35.00', '0.00', 12311, '0.00', 0, '300', '', '', '', 0, 0, '0.00', '35.00', 0, '0.00', '0.00', NULL, NULL, 0, 0, '0.00'),
(11, 1, 10, '全身', '', '0.00', '45.00', '0.00', 12311, '0.00', 0, '301', '', '', '', 0, 0, '0.00', '45.00', 0, '0.00', '0.00', NULL, NULL, 0, 0, '0.00'),
(12, 1, 14, '头像', '', '0.00', '0.10', '0.00', 66353, '0.00', 0, '302', '', '', '', 0, 0, '0.00', '0.10', 0, '0.00', '0.00', NULL, NULL, 0, 0, '0.00'),
(13, 1, 14, '全身', '', '0.00', '0.20', '0.00', 231312, '0.00', 0, '303', '', '', '', 0, 0, '0.00', '0.20', 0, '0.00', '0.00', NULL, NULL, 0, 0, '0.00');

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_goods_param`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_goods_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `goodsid` int(10) DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `value` text,
  `displayorder` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_goodsid` (`goodsid`),
  KEY `idx_displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `ims_ewei_shop_goods_param`
--

INSERT INTO `ims_ewei_shop_goods_param` (`id`, `uniacid`, `goodsid`, `title`, `value`, `displayorder`) VALUES
(1, 1, 1, '商品形式', '电子版', 0),
(2, 1, 1, '分辨率', '150dpi', 1),
(3, 1, 1, '相似指数', '5', 2),
(4, 1, 2, '手绘风格', 'Q版', 0),
(5, 1, 2, '出图分辨率', '150DPI', 1),
(6, 1, 2, '相似指数', '4', 2),
(7, 1, 14, '相似指数', '3', 0),
(8, 1, 14, '手绘时间', '72小时', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_goods_spec`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_goods_spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `goodsid` int(11) DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `description` varchar(1000) DEFAULT '',
  `displaytype` tinyint(3) DEFAULT '0',
  `content` text,
  `displayorder` int(11) DEFAULT '0',
  `propId` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_goodsid` (`goodsid`),
  KEY `idx_displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `ims_ewei_shop_goods_spec`
--

INSERT INTO `ims_ewei_shop_goods_spec` (`id`, `uniacid`, `goodsid`, `title`, `description`, `displaytype`, `content`, `displayorder`, `propId`) VALUES
(1, 1, 7, '设计尺寸', '', 0, 'a:2:{i:0;s:3:"291";i:1;s:3:"292";}', 0, ''),
(2, 1, 1, '尺寸', '', 0, 'a:3:{i:0;s:3:"293";i:1;s:3:"294";i:2;s:3:"295";}', 0, ''),
(3, 1, 2, '尺寸', '', 0, 'a:3:{i:0;s:3:"296";i:1;s:3:"297";i:2;s:3:"298";}', 0, ''),
(4, 1, 10, '绘制尺寸（头像画肩部及以上，半身画腰部及以上）', '', 0, 'a:3:{i:0;s:3:"299";i:1;s:3:"300";i:2;s:3:"301";}', 0, ''),
(5, 1, 14, '设计尺寸', '', 0, 'a:2:{i:0;s:3:"302";i:1;s:3:"303";}', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_goods_spec_item`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_goods_spec_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `specid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `show` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  `valueId` varchar(255) DEFAULT '',
  `virtual` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_specid` (`specid`),
  KEY `idx_show` (`show`),
  KEY `idx_displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=304 ;

--
-- 转存表中的数据 `ims_ewei_shop_goods_spec_item`
--

INSERT INTO `ims_ewei_shop_goods_spec_item` (`id`, `uniacid`, `specid`, `title`, `thumb`, `show`, `displayorder`, `valueId`, `virtual`) VALUES
(283, 1, 91, '34', '', 1, 0, '147478970', 0),
(284, 1, 91, '35', '', 1, 1, '296172561', 0),
(285, 1, 91, '36', '', 1, 2, '59280855', 0),
(286, 1, 91, '37', '', 1, 3, '72380707', 0),
(287, 1, 91, '38', '', 1, 4, '103189693', 0),
(288, 1, 91, '39', '', 1, 5, '418624880', 0),
(289, 1, 92, '银色', 'images/1/2017/04/j01vT5jXxb44V510TVJ4500tKHB5XXBt.jpg', 1, 0, '28330', 0),
(290, 1, 92, '金色', 'images/1/2017/04/ZAKH0TnTqVmw0USSnS64mmu4uq0Tkvmm.jpg', 1, 1, '28328', 0),
(291, 1, 1, '头像', '', 1, 0, '', 0),
(292, 1, 1, '全身', '', 1, 1, '', 0),
(293, 1, 2, '头像', '', 1, 0, '', 0),
(294, 1, 2, '半身', '', 1, 1, '', 0),
(295, 1, 2, '全身', '', 1, 2, '', 0),
(296, 1, 3, '头像', '', 1, 0, '', 0),
(297, 1, 3, '半身', '', 1, 1, '', 0),
(298, 1, 3, '全身', '', 1, 2, '', 0),
(299, 1, 4, '头像', '', 1, 0, '', 0),
(300, 1, 4, '半身', '', 1, 1, '', 0),
(301, 1, 4, '全身', '', 1, 2, '', 0),
(302, 1, 5, '头像', '', 1, 0, '', 0),
(303, 1, 5, '全身', '', 1, 1, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_groups_adv`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_groups_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `advname` varchar(50) DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_enabled` (`enabled`),
  KEY `idx_displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_groups_category`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_groups_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `parentid` int(6) NOT NULL DEFAULT '0',
  `level` int(1) NOT NULL DEFAULT '1',
  `thumb` varchar(255) DEFAULT NULL,
  `displayorder` tinyint(3) unsigned DEFAULT '0',
  `enabled` tinyint(1) DEFAULT '1',
  `advimg` varchar(255) DEFAULT '',
  `advurl` varchar(500) DEFAULT '',
  `isrecommand` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_displayorder` (`displayorder`),
  KEY `idx_enabled` (`enabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `ims_ewei_shop_groups_category`
--

INSERT INTO `ims_ewei_shop_groups_category` (`id`, `uniacid`, `name`, `parentid`, `level`, `thumb`, `displayorder`, `enabled`, `advimg`, `advurl`, `isrecommand`) VALUES
(5, 1, '商品', 0, 1, '', 0, 1, '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_groups_goods`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_groups_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `displayorder` int(11) unsigned DEFAULT '0',
  `uniacid` int(11) DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `category` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stock` int(11) NOT NULL DEFAULT '0',
  `price` decimal(10,2) DEFAULT '0.00',
  `groupsprice` decimal(10,2) DEFAULT '0.00',
  `singleprice` decimal(10,2) DEFAULT '0.00',
  `goodsnum` int(11) NOT NULL DEFAULT '1',
  `units` varchar(255) NOT NULL DEFAULT '件',
  `freight` decimal(10,2) DEFAULT '0.00',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `groupnum` int(10) NOT NULL DEFAULT '0',
  `sales` int(10) NOT NULL DEFAULT '0',
  `thumb` varchar(255) DEFAULT '',
  `description` varchar(1000) DEFAULT NULL,
  `content` text,
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `ishot` tinyint(3) NOT NULL DEFAULT '0',
  `deleted` tinyint(3) NOT NULL DEFAULT '0',
  `goodsid` int(11) NOT NULL DEFAULT '0',
  `followneed` tinyint(2) NOT NULL DEFAULT '0',
  `followtext` varchar(255) DEFAULT NULL,
  `share_title` varchar(255) DEFAULT NULL,
  `share_icon` varchar(255) DEFAULT NULL,
  `share_desc` varchar(500) DEFAULT NULL,
  `goodssn` varchar(50) DEFAULT NULL,
  `productsn` varchar(50) DEFAULT NULL,
  `showstock` tinyint(2) NOT NULL,
  `purchaselimit` int(11) NOT NULL DEFAULT '0',
  `single` tinyint(2) NOT NULL DEFAULT '0',
  `dispatchtype` tinyint(2) NOT NULL,
  `dispatchid` int(11) NOT NULL,
  `isindex` tinyint(3) NOT NULL DEFAULT '0',
  `followurl` varchar(255) DEFAULT NULL,
  `deduct` decimal(10,2) NOT NULL DEFAULT '0.00',
  `rights` tinyint(2) NOT NULL DEFAULT '1',
  `thumb_url` text,
  `gid` int(11) DEFAULT '0',
  `discount` tinyint(3) DEFAULT '0',
  `headstype` tinyint(3) DEFAULT NULL,
  `headsmoney` decimal(10,2) DEFAULT '0.00',
  `headsdiscount` int(11) DEFAULT '0',
  `isdiscount` tinyint(3) DEFAULT '0',
  `isverify` tinyint(3) DEFAULT '0',
  `verifytype` tinyint(3) DEFAULT '0',
  `verifynum` int(11) DEFAULT '0',
  `storeids` text,
  `merchid` int(11) DEFAULT '0',
  `shorttitle` varchar(255) DEFAULT '',
  `teamnum` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_type` (`category`),
  KEY `idx_createtime` (`createtime`),
  KEY `idx_status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_groups_goods_atlas`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_groups_goods_atlas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `g_id` int(11) NOT NULL,
  `thumb` varchar(145) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_groups_order`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_groups_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `openid` varchar(45) NOT NULL,
  `orderno` varchar(45) NOT NULL,
  `groupnum` int(11) NOT NULL,
  `paytime` int(11) NOT NULL,
  `price` decimal(11,2) DEFAULT '0.00',
  `freight` decimal(11,2) DEFAULT '0.00',
  `status` int(9) NOT NULL,
  `pay_type` varchar(45) DEFAULT NULL,
  `goodid` int(11) NOT NULL,
  `teamid` int(11) NOT NULL,
  `is_team` int(2) NOT NULL,
  `heads` int(11) DEFAULT '0',
  `starttime` int(11) NOT NULL,
  `endtime` int(45) NOT NULL,
  `createtime` int(11) NOT NULL,
  `success` int(2) NOT NULL DEFAULT '0',
  `delete` int(2) NOT NULL DEFAULT '0',
  `credit` int(11) DEFAULT '0',
  `creditmoney` decimal(11,2) DEFAULT '0.00',
  `dispatchid` int(11) DEFAULT NULL,
  `addressid` int(11) NOT NULL DEFAULT '0',
  `address` varchar(1000) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT '0.00',
  `canceltime` int(11) NOT NULL DEFAULT '0',
  `finishtime` int(11) NOT NULL DEFAULT '0',
  `refundid` int(11) NOT NULL DEFAULT '0',
  `refundstate` tinyint(2) NOT NULL DEFAULT '0',
  `refundtime` int(11) NOT NULL DEFAULT '0',
  `express` varchar(45) DEFAULT NULL,
  `expresscom` varchar(100) DEFAULT NULL,
  `expresssn` varchar(45) DEFAULT NULL,
  `sendtime` int(45) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `remarkclose` text,
  `remarksend` text,
  `message` varchar(255) DEFAULT NULL,
  `deleted` int(2) NOT NULL DEFAULT '0',
  `realname` varchar(20) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `isverify` tinyint(3) DEFAULT '0',
  `verifytype` tinyint(3) DEFAULT '0',
  `verifycode` varchar(45) DEFAULT '0',
  `verifynum` int(11) DEFAULT '0',
  `printstate` int(11) NOT NULL DEFAULT '0',
  `printstate2` int(11) NOT NULL DEFAULT '0',
  `apppay` tinyint(3) NOT NULL DEFAULT '0',
  `isborrow` tinyint(1) DEFAULT '0',
  `borrowopenid` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_groups_order_refund`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_groups_order_refund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `openid` varchar(45) NOT NULL DEFAULT '',
  `orderid` int(11) NOT NULL DEFAULT '0',
  `refundno` varchar(45) NOT NULL DEFAULT '0',
  `refundstatus` tinyint(3) NOT NULL DEFAULT '0',
  `refundaddressid` int(11) NOT NULL DEFAULT '0',
  `refundaddress` varchar(1000) NOT NULL DEFAULT '0',
  `content` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `applytime` varchar(45) NOT NULL DEFAULT '0',
  `applycredit` int(11) NOT NULL DEFAULT '0',
  `applyprice` decimal(11,2) NOT NULL DEFAULT '0.00',
  `reply` text,
  `refundtype` varchar(45) DEFAULT NULL,
  `rtype` int(3) NOT NULL DEFAULT '0',
  `refundtime` varchar(45) NOT NULL,
  `endtime` varchar(45) NOT NULL DEFAULT '0',
  `message` varchar(255) DEFAULT NULL,
  `operatetime` varchar(45) NOT NULL DEFAULT '0',
  `realcredit` int(11) NOT NULL,
  `realmoney` decimal(11,2) NOT NULL,
  `express` varchar(45) DEFAULT NULL,
  `expresscom` varchar(100) DEFAULT NULL,
  `expresssn` varchar(45) DEFAULT NULL,
  `sendtime` varchar(45) NOT NULL DEFAULT '0',
  `returntime` int(11) NOT NULL DEFAULT '0',
  `rexpress` varchar(45) DEFAULT NULL,
  `rexpresscom` varchar(100) DEFAULT NULL,
  `rexpresssn` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_groups_paylog`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_groups_paylog` (
  `plid` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `openid` varchar(40) NOT NULL,
  `tid` varchar(64) NOT NULL,
  `credit` int(10) NOT NULL DEFAULT '0',
  `creditmoney` decimal(10,2) NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `module` varchar(50) NOT NULL,
  `tag` varchar(2000) NOT NULL,
  `is_usecard` tinyint(3) unsigned NOT NULL,
  `card_type` tinyint(3) unsigned NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `card_fee` decimal(10,2) unsigned NOT NULL,
  `encrypt_code` varchar(100) NOT NULL,
  `uniontid` varchar(50) NOT NULL,
  PRIMARY KEY (`plid`),
  KEY `idx_openid` (`openid`),
  KEY `idx_tid` (`tid`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `uniontid` (`uniontid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_groups_set`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_groups_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` varchar(45) DEFAULT NULL,
  `groups` int(2) NOT NULL DEFAULT '0',
  `followurl` varchar(255) DEFAULT NULL,
  `groupsurl` varchar(255) DEFAULT NULL,
  `share_title` varchar(255) DEFAULT NULL,
  `share_icon` varchar(255) DEFAULT NULL,
  `share_desc` varchar(255) DEFAULT NULL,
  `groups_description` text,
  `description` int(2) NOT NULL DEFAULT '0',
  `followqrcode` varchar(255) DEFAULT NULL,
  `share_url` varchar(255) DEFAULT NULL,
  `creditdeduct` tinyint(2) NOT NULL DEFAULT '0',
  `groupsdeduct` tinyint(2) NOT NULL DEFAULT '0',
  `credit` int(11) NOT NULL DEFAULT '1',
  `groupsmoney` decimal(11,2) NOT NULL DEFAULT '0.00',
  `refund` int(11) NOT NULL DEFAULT '0',
  `refundday` int(11) NOT NULL DEFAULT '0',
  `goodsid` text NOT NULL,
  `rules` text,
  `receive` int(11) DEFAULT '0',
  `discount` tinyint(3) DEFAULT '0',
  `headstype` tinyint(3) DEFAULT '0',
  `headsmoney` decimal(10,2) DEFAULT '0.00',
  `headsdiscount` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_groups_verify`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_groups_verify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `openid` varchar(45) DEFAULT '0',
  `orderid` int(11) DEFAULT '0',
  `verifycode` varchar(45) DEFAULT '',
  `storeid` int(11) DEFAULT '0',
  `verifier` varchar(45) DEFAULT '0',
  `isverify` tinyint(3) DEFAULT '0',
  `verifytime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_live`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_live` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `merchid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `livetype` tinyint(3) NOT NULL DEFAULT '0',
  `liveidentity` varchar(50) NOT NULL,
  `screen` tinyint(3) NOT NULL DEFAULT '0',
  `goodsid` varchar(255) NOT NULL,
  `category` int(11) NOT NULL DEFAULT '0',
  `url` varchar(1000) NOT NULL,
  `thumb` varchar(1000) NOT NULL,
  `hot` tinyint(3) NOT NULL DEFAULT '0',
  `recommend` tinyint(3) NOT NULL DEFAULT '0',
  `living` tinyint(3) NOT NULL DEFAULT '0',
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `displayorder` int(11) NOT NULL DEFAULT '0',
  `livetime` int(10) NOT NULL DEFAULT '0',
  `lastlivetime` int(11) NOT NULL DEFAULT '0',
  `createtime` int(10) NOT NULL DEFAULT '0',
  `introduce` text NOT NULL,
  `packetmoney` decimal(10,2) NOT NULL DEFAULT '0.00',
  `packettotal` int(11) NOT NULL DEFAULT '0',
  `packetprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `packetdes` varchar(255) NOT NULL,
  `couponid` varchar(255) NOT NULL,
  `share_title` varchar(255) NOT NULL,
  `share_icon` varchar(1000) NOT NULL,
  `share_desc` text NOT NULL,
  `share_url` varchar(1000) NOT NULL DEFAULT '',
  `subscribe` int(11) NOT NULL DEFAULT '0',
  `subscribenotice` tinyint(3) NOT NULL DEFAULT '0',
  `visit` int(11) NOT NULL DEFAULT '0',
  `video` varchar(1000) NOT NULL DEFAULT '',
  `covertype` tinyint(3) NOT NULL DEFAULT '0',
  `cover` varchar(1000) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`) USING BTREE,
  KEY `idx_merchid` (`merchid`) USING BTREE,
  KEY `idx_category` (`category`) USING BTREE,
  KEY `idx_hot` (`hot`) USING BTREE,
  KEY `idx_recommend` (`recommend`) USING BTREE,
  KEY `idx_living` (`living`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE,
  KEY `idx_livetime` (`livetime`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_live_adv`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_live_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `merchid` int(11) NOT NULL DEFAULT '0',
  `advname` varchar(50) DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`) USING BTREE,
  KEY `idx_enabled` (`enabled`) USING BTREE,
  KEY `idx_displayorder` (`displayorder`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_live_category`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_live_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `displayorder` tinyint(3) unsigned DEFAULT '0',
  `enabled` tinyint(1) DEFAULT '1',
  `advimg` varchar(255) DEFAULT '',
  `advurl` varchar(500) DEFAULT '',
  `isrecommand` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`) USING BTREE,
  KEY `idx_displayorder` (`displayorder`) USING BTREE,
  KEY `idx_enabled` (`enabled`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_live_coupon`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_live_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `roomid` int(11) NOT NULL DEFAULT '0',
  `couponid` int(11) NOT NULL DEFAULT '0',
  `coupontotal` int(11) NOT NULL DEFAULT '0',
  `couponlimit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`) USING BTREE,
  KEY `idx_roomid` (`roomid`) USING BTREE,
  KEY `idx_couponid` (`couponid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_live_favorite`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_live_favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `roomid` int(11) NOT NULL DEFAULT '0',
  `openid` tinytext NOT NULL,
  `deleted` tinyint(3) NOT NULL DEFAULT '0',
  `createtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`) USING BTREE,
  KEY `idx_roomid` (`roomid`) USING BTREE,
  KEY `idx_deleted` (`deleted`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_live_setting`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_live_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `ismember` tinyint(3) NOT NULL DEFAULT '0',
  `share_title` varchar(255) NOT NULL,
  `share_icon` varchar(1000) NOT NULL,
  `share_desc` varchar(255) NOT NULL,
  `share_url` varchar(255) NOT NULL,
  `livenoticetime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`) USING BTREE,
  KEY `idx_ismember` (`ismember`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_live_view`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_live_view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `openid` varchar(50) NOT NULL,
  `roomid` int(11) NOT NULL DEFAULT '0',
  `viewing` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`) USING BTREE,
  KEY `idx_roomid` (`roomid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_lottery`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_lottery` (
  `lottery_id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `lottery_title` varchar(150) DEFAULT NULL,
  `lottery_icon` varchar(255) DEFAULT NULL,
  `lottery_banner` varchar(255) DEFAULT NULL,
  `lottery_cannot` varchar(255) DEFAULT NULL,
  `lottery_type` tinyint(1) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT '0',
  `addtime` int(11) DEFAULT NULL,
  `lottery_data` text,
  `is_goods` tinyint(1) DEFAULT '0',
  `lottery_days` int(11) DEFAULT '0',
  `task_type` tinyint(1) DEFAULT '0',
  `task_data` text,
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`lottery_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `ims_ewei_shop_lottery`
--

INSERT INTO `ims_ewei_shop_lottery` (`lottery_id`, `uniacid`, `lottery_title`, `lottery_icon`, `lottery_banner`, `lottery_cannot`, `lottery_type`, `is_delete`, `addtime`, `lottery_data`, `is_goods`, `lottery_days`, `task_type`, `task_data`, `start_time`, `end_time`) VALUES
(1, 1, 'te', '', '12', '您没有参与抽奖的机会..', 1, 1, 1490848160, 'a:0:{}', 1, 0, 1, 'a:3:{s:9:"pay_money";d:1;s:7:"pay_num";i:1;s:8:"pay_type";i:0;}', 1490848140, 1493440140),
(2, 1, '1', '', '1', '您没有参与抽奖的机会..', 1, 1, 1490951101, 'a:0:{}', 1, -259200, 2, 'a:2:{s:8:"sign_day";i:0;s:8:"sign_num";i:0;}', 1490848200, 1493440200),
(3, 1, '1', '', '1', '您没有参与抽奖的机会..1', 1, 0, 1490951780, 'a:0:{}', 1, 0, 1, 'a:3:{s:9:"pay_money";d:1;s:7:"pay_num";i:1;s:8:"pay_type";i:0;}', 1490951100, 1493543100),
(4, 1, '0', '', '0', '您没有参与抽奖的机会..', 1, 0, 1490951335, 'a:0:{}', 1, 0, 2, 'a:2:{s:8:"sign_day";i:1;s:8:"sign_num";i:1;}', 1490951280, 1493543280);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_lottery_default`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_lottery_default` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `data` text,
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_lottery_join`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_lottery_join` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `join_user` varchar(255) DEFAULT NULL,
  `lottery_id` int(11) DEFAULT NULL,
  `lottery_num` int(10) DEFAULT '0',
  `lottery_tag` varchar(255) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_lottery_log`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_lottery_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `lottery_id` int(11) DEFAULT '0',
  `join_user` varchar(255) DEFAULT NULL,
  `lottery_data` text,
  `is_reward` tinyint(1) DEFAULT '0',
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_mc_merchant`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_mc_merchant` (
  `id` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `merchant_no` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `salt` varchar(8) NOT NULL DEFAULT '',
  `contact_name` varchar(255) NOT NULL DEFAULT '',
  `contact_mobile` varchar(16) NOT NULL DEFAULT '',
  `contact_address` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `createtime` int(11) NOT NULL,
  `validitytime` int(11) NOT NULL,
  `industry` varchar(255) NOT NULL DEFAULT '',
  `remark` varchar(1000) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_member`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `groupid` int(11) DEFAULT '0',
  `level` int(11) DEFAULT '0',
  `agentid` int(11) DEFAULT '0',
  `second_agentid` int(10) NOT NULL DEFAULT '0',
  `third_agentid` int(10) NOT NULL DEFAULT '0',
  `openid` varchar(50) DEFAULT '',
  `unionid` varchar(50) NOT NULL,
  `realname` varchar(20) DEFAULT '',
  `mobile` varchar(11) DEFAULT '',
  `pwd` varchar(32) DEFAULT '',
  `weixin` varchar(100) DEFAULT '',
  `content` text,
  `createtime` int(10) DEFAULT '0',
  `agenttime` int(10) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `isagent` tinyint(1) DEFAULT '0',
  `clickcount` int(11) DEFAULT '0',
  `agentlevel` int(11) DEFAULT '0',
  `noticeset` text,
  `nickname` varchar(255) DEFAULT '',
  `credit1` int(10) DEFAULT '0' COMMENT '积分',
  `credit2` decimal(10,2) DEFAULT '0.00' COMMENT '余额',
  `old_credit2` float(10,2) NOT NULL DEFAULT '0.00',
  `birthyear` varchar(255) DEFAULT '',
  `birthmonth` varchar(255) DEFAULT '',
  `birthday` varchar(255) DEFAULT '',
  `birthtype` int(1) NOT NULL DEFAULT '1' COMMENT '1 阳历  2 阴历',
  `gender` tinyint(3) DEFAULT '0',
  `avatar` varchar(255) DEFAULT '',
  `province` varchar(255) DEFAULT '',
  `city` varchar(255) DEFAULT '',
  `area` varchar(255) DEFAULT '',
  `childtime` int(11) DEFAULT '0',
  `inviter` int(11) DEFAULT '0',
  `agentnotupgrade` int(11) DEFAULT '0',
  `agentselectgoods` tinyint(3) DEFAULT '0',
  `agentblack` int(11) DEFAULT '0',
  `fixagentid` tinyint(3) DEFAULT '0',
  `diymemberid` int(11) DEFAULT '0',
  `diymemberfields` text,
  `diymemberdata` text,
  `diymemberdataid` int(11) DEFAULT '0',
  `diycommissionid` int(11) DEFAULT '0',
  `diycommissionfields` text,
  `diycommissiondata` text,
  `diycommissiondataid` int(11) DEFAULT '0',
  `isblack` int(11) DEFAULT '0',
  `username` varchar(255) DEFAULT '',
  `commission_total` decimal(10,2) DEFAULT '0.00',
  `endtime2` int(11) DEFAULT '0',
  `ispartner` tinyint(3) DEFAULT '0',
  `partnertime` int(11) DEFAULT '0',
  `partnerstatus` tinyint(3) DEFAULT '0',
  `partnerblack` tinyint(3) DEFAULT '0',
  `partnerlevel` int(11) DEFAULT '0',
  `partnernotupgrade` tinyint(3) DEFAULT '0',
  `diyglobonusid` int(11) DEFAULT '0',
  `diyglobonusdata` text,
  `diyglobonusfields` text,
  `isaagent` tinyint(3) DEFAULT '0',
  `aagentlevel` int(11) DEFAULT '0',
  `aagenttime` int(11) DEFAULT '0',
  `aagentstatus` tinyint(3) DEFAULT '0',
  `aagentblack` tinyint(3) DEFAULT '0',
  `aagentnotupgrade` tinyint(3) DEFAULT '0',
  `aagenttype` tinyint(3) DEFAULT '0',
  `aagentprovinces` text,
  `aagentcitys` text,
  `aagentareas` text,
  `diyaagentid` int(11) DEFAULT '0',
  `diyaagentdata` text,
  `diyaagentfields` text,
  `salt` varchar(32) DEFAULT NULL,
  `mobileverify` tinyint(3) DEFAULT '0',
  `mobileuser` tinyint(3) DEFAULT '0',
  `carrier_mobile` varchar(11) DEFAULT '0',
  `isauthor` tinyint(1) DEFAULT '0',
  `authortime` int(11) DEFAULT '0',
  `authorstatus` tinyint(1) DEFAULT '0',
  `authorblack` tinyint(1) DEFAULT '0',
  `authorlevel` int(11) DEFAULT '0',
  `authornotupgrade` tinyint(1) DEFAULT '0',
  `diyauthorid` int(11) DEFAULT '0',
  `diyauthordata` text,
  `diyauthorfields` text,
  `authorid` int(11) DEFAULT '0',
  `comefrom` varchar(20) DEFAULT NULL,
  `openid_qq` varchar(50) DEFAULT NULL,
  `openid_wx` varchar(50) DEFAULT NULL,
  `openid_xcx` varchar(50) NOT NULL COMMENT '小程序openid',
  `diymaxcredit` tinyint(3) DEFAULT '0',
  `maxcredit` int(11) DEFAULT '0',
  `datavalue` varchar(50) NOT NULL DEFAULT '',
  `openid_wa` varchar(50) DEFAULT NULL,
  `nickname_wechat` varchar(255) DEFAULT '',
  `avatar_wechat` varchar(255) DEFAULT '',
  `updateaddress` tinyint(1) NOT NULL DEFAULT '0',
  `membercardid` varchar(255) DEFAULT '',
  `membercardcode` varchar(255) DEFAULT '',
  `membershipnumber` varchar(255) DEFAULT '',
  `membercardactive` tinyint(1) DEFAULT '0',
  `alipay` varchar(50) NOT NULL,
  `bankname` varchar(50) NOT NULL,
  `bankcard` varchar(50) NOT NULL,
  `withdraw_pwd` varchar(50) NOT NULL COMMENT '提现密码',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_shareid` (`agentid`),
  KEY `idx_openid` (`openid`),
  KEY `idx_status` (`status`),
  KEY `idx_agenttime` (`agenttime`),
  KEY `idx_isagent` (`isagent`),
  KEY `idx_uid` (`uid`),
  KEY `idx_groupid` (`groupid`),
  KEY `idx_level` (`level`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `ims_ewei_shop_member`
--

INSERT INTO `ims_ewei_shop_member` (`id`, `uniacid`, `uid`, `groupid`, `level`, `agentid`, `second_agentid`, `third_agentid`, `openid`, `unionid`, `realname`, `mobile`, `pwd`, `weixin`, `content`, `createtime`, `agenttime`, `status`, `isagent`, `clickcount`, `agentlevel`, `noticeset`, `nickname`, `credit1`, `credit2`, `old_credit2`, `birthyear`, `birthmonth`, `birthday`, `birthtype`, `gender`, `avatar`, `province`, `city`, `area`, `childtime`, `inviter`, `agentnotupgrade`, `agentselectgoods`, `agentblack`, `fixagentid`, `diymemberid`, `diymemberfields`, `diymemberdata`, `diymemberdataid`, `diycommissionid`, `diycommissionfields`, `diycommissiondata`, `diycommissiondataid`, `isblack`, `username`, `commission_total`, `endtime2`, `ispartner`, `partnertime`, `partnerstatus`, `partnerblack`, `partnerlevel`, `partnernotupgrade`, `diyglobonusid`, `diyglobonusdata`, `diyglobonusfields`, `isaagent`, `aagentlevel`, `aagenttime`, `aagentstatus`, `aagentblack`, `aagentnotupgrade`, `aagenttype`, `aagentprovinces`, `aagentcitys`, `aagentareas`, `diyaagentid`, `diyaagentdata`, `diyaagentfields`, `salt`, `mobileverify`, `mobileuser`, `carrier_mobile`, `isauthor`, `authortime`, `authorstatus`, `authorblack`, `authorlevel`, `authornotupgrade`, `diyauthorid`, `diyauthordata`, `diyauthorfields`, `authorid`, `comefrom`, `openid_qq`, `openid_wx`, `openid_xcx`, `diymaxcredit`, `maxcredit`, `datavalue`, `openid_wa`, `nickname_wechat`, `avatar_wechat`, `updateaddress`, `membercardid`, `membercardcode`, `membershipnumber`, `membercardactive`, `alipay`, `bankname`, `bankcard`, `withdraw_pwd`) VALUES
(1, 1, 0, 0, 0, 0, 0, 0, 'xcx_oUSEM5G4GIZQj1KugQlWQY3bQN9w', '', '', '15666677699', '', '', NULL, 1518456515, 1518456525, 1, 1, 0, 0, NULL, '羽月智能.大羽', 0, '0.00', 0.00, '', '', '', 1, 1, 'https://wx.qlogo.cn/mmopen/vi_32/Cs8SEPLpJJUALh5kre5lt08n8DCocwqjQVj3XAOAnF6CsmMBreY9FGoJkKvyqwAEJkWZyGfpX4DHMeibmRSVFicg/0', '', '', '', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, 0, 0, '', '0.00', 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, 'JQ84x8U8', 0, 0, '0', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, 'oUSEM5G4GIZQj1KugQlWQY3bQN9w', 0, 0, '', NULL, '', '', 0, '', '', '', 0, '', '', '', ''),
(2, 1, 0, 0, 0, 0, 0, 0, 'xcx_oUSEM5Cwm-VyY0XLfdRScsqEL2G4', '', '', '18600509987', '', '', NULL, 1519967603, 1519967605, 1, 1, 0, 0, NULL, 'Jonny', 0, '0.00', 0.00, '', '', '', 1, 1, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqvSDpezWYf8lEiaIRZ5n2yrRF3pLqHQDs9838tS0nHoIhdrrEU5iahSHYIdStOSlBe2FZlI1bEwraA/0', 'Beijing', 'Haidian', '', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, 0, 0, '', '0.00', 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, 'Y01h1t0v', 0, 0, '0', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, 'oUSEM5Cwm-VyY0XLfdRScsqEL2G4', 0, 0, '', NULL, '', '', 0, '', '', '', 0, '', '', '', ''),
(3, 1, 0, 0, 0, 0, 0, 0, 'xcx_oUSEM5LiTfdFg5IQ_RM6Gp-mVOvw', '', '', '', '', '', NULL, 1519977355, 1519977366, 1, 1, 0, 0, NULL, 'rdgztest_SOGPOS', 0, '0.00', 0.00, '', '', '', 1, 0, '', '', '', '', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, 0, 0, '', '0.00', 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, 'nYkm8oCc', 0, 0, '0', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, 'oUSEM5LiTfdFg5IQ_RM6Gp-mVOvw', 0, 0, '', NULL, '', '', 0, '', '', '', 0, '', '', '', ''),
(4, 1, 0, 0, 0, 0, 0, 0, 'sys_71a91e3f2c8ac182c605ecf83fcbe4cc', '', '画师1', '18600509987', '', '', NULL, 1519979470, 0, 0, 0, 0, 0, NULL, '', 0, '0.00', 0.00, '', '', '', 1, 0, '', '', '', '', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, 0, 0, '', '0.00', 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, '0', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, '', 0, 0, '', NULL, '', '', 0, '', '', '', 0, '', '', '', ''),
(5, 1, 0, 0, 0, 0, 0, 0, 'xcx_oUSEM5EwJB_QKQYGLHtMO4pCM190', '', '', '', '', '', NULL, 1520424413, 1520424448, 1, 1, 0, 0, NULL, 'rdgztest_IHZDME', 0, '0.00', 0.00, '', '', '', 1, 0, '', '', '', '', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, 0, 0, '', '0.00', 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, 'U3ur2ONU', 0, 0, '0', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, 'oUSEM5EwJB_QKQYGLHtMO4pCM190', 0, 0, '', NULL, '', '', 0, '', '', '', 0, '', '', '', ''),
(6, 1, 0, 0, 0, 0, 0, 0, 'oq_xbwGp2g7-d0-7Ye4oNYOF5exI', '', '', '', '', '', NULL, 1520838899, 0, 0, 0, 0, 0, NULL, '', 0, '0.00', 0.00, '', '', '', 1, -1, '', '', '', '', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, 0, 0, '', '0.00', 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, '0', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, '', 0, 0, '', NULL, '', '', 0, '', '', '', 0, '', '', '', ''),
(7, 1, 0, 0, 0, 0, 0, 0, 'xcx_oUSEM5KZMuRQoNJt5LkR-v5kGSyY', '', '', '', '', '', NULL, 1520844282, 1520844285, 1, 1, 0, 0, NULL, '大羽', 0, '0.00', 0.00, '', '', '', 1, 1, 'https://wx.qlogo.cn/mmopen/vi_32/I0lf7ian3AHQicBQSPr4qhIQTgogic9EwWkzzfv1jxwZ2Ep4Db2R4nrYwLrcMJAeJYMqtLKFYJDYrbOmIojdsEB5A/0', 'Shandong', 'Qingdao', '', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, 0, 0, '', '0.00', 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, 'm8v9jB7H', 0, 0, '0', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, 'oUSEM5KZMuRQoNJt5LkR-v5kGSyY', 0, 0, '', NULL, '', '', 0, '', '', '', 0, '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_member_account_log`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_member_account_log` (
  `log_id` int(10) NOT NULL AUTO_INCREMENT,
  `mid` int(10) NOT NULL DEFAULT '0' COMMENT '会员id',
  `uniacid` int(5) NOT NULL DEFAULT '0',
  `change_type` int(2) NOT NULL DEFAULT '0' COMMENT '变动类型 1 充值 2 转让 3 活动 4 消费 5 提现 6 取消订单退回',
  `price` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `operator` int(10) NOT NULL DEFAULT '0' COMMENT '操作人',
  `module` varchar(30) CHARACTER SET utf8 NOT NULL COMMENT '模块名',
  `other_id` int(10) NOT NULL DEFAULT '0' COMMENT '有关id',
  `log_time` int(10) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `remark` varchar(250) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=404 ;

--
-- 转存表中的数据 `ims_ewei_shop_member_account_log`
--

INSERT INTO `ims_ewei_shop_member_account_log` (`log_id`, `mid`, `uniacid`, `change_type`, `price`, `operator`, `module`, `other_id`, `log_time`, `status`, `remark`) VALUES
(142, 2493, 6, 1, 100.00, 0, '', 133, 1515721406, 1, '会员充值余额'),
(143, 2333, 6, 1, 1000.00, 0, '', 134, 1515722358, 1, '会员充值余额'),
(144, 2333, 6, 1, 1000.00, 0, '', 136, 1515722515, 1, '会员充值余额'),
(145, 2333, 6, 7, -130.00, 0, '', 137, 1515722560, 1, '会员消费扣款'),
(146, 2333, 6, 7, -100.00, 0, '', 138, 1515722662, 1, '会员消费扣款'),
(147, 2333, 6, 3, 5.00, 0, '', 0, 1515722662, 1, '本人消费返佣'),
(148, 2310, 6, 7, -100.00, 0, '', 140, 1515723229, 1, '会员消费扣款'),
(149, 2310, 6, 3, 5.00, 0, '', 0, 1515723229, 1, '本人消费返佣'),
(150, 2333, 6, 3, 3.00, 0, '', 0, 1515723229, 1, '下级(ID:2310)陈桂芝消费返佣'),
(151, 2493, 6, 3, 2.00, 0, '', 0, 1515723229, 1, '下级(ID:2310)陈桂芝消费返佣'),
(152, 2493, 6, 3, 0.00, 0, '', 0, 1515995648, 1, '佣金提现'),
(153, 2493, 6, 1, 100.00, 0, '', 141, 1516000975, 1, '会员充值余额'),
(154, 2493, 6, 7, -200.00, 0, '', 142, 1516000995, 1, '会员消费扣款'),
(155, 2493, 6, 3, 10.00, 0, '', 0, 1516000995, 1, '本人消费返佣'),
(156, 2333, 6, 1, 1000.00, 0, '', 144, 1516068142, 1, '会员充值余额'),
(157, 2333, 6, 7, -212.00, 0, '', 145, 1516068721, 1, '会员消费扣款'),
(158, 2577, 6, 7, -128.00, 0, '', 146, 1516069064, 1, '会员消费扣款'),
(159, 2577, 6, 7, -100.00, 0, '', 147, 1516069111, 1, '会员消费扣款'),
(160, 2577, 6, 3, 5.00, 0, '', 0, 1516069111, 1, '本人消费返佣'),
(161, 2333, 6, 7, -634.00, 0, '', 148, 1516069431, 1, '会员消费扣款'),
(162, 2333, 6, 3, 31.70, 0, '', 0, 1516069431, 1, '本人消费返佣'),
(163, 2585, 6, 7, -7.00, 0, '', 153, 1516076798, 1, '会员消费扣款'),
(164, 2585, 6, 3, 0.35, 0, '', 0, 1516076798, 1, '本人消费返佣'),
(165, 2582, 6, 7, -500.00, 0, '', 154, 1516083015, 1, '会员消费扣款'),
(166, 2582, 6, 7, -100.00, 0, '', 155, 1516083556, 1, '会员消费扣款'),
(167, 2582, 6, 7, -100.00, 0, '', 156, 1516083757, 1, '会员消费扣款'),
(168, 2582, 6, 7, -50.00, 0, '', 157, 1516083793, 1, '会员消费扣款'),
(169, 2582, 6, 7, -20.00, 0, '', 158, 1516083920, 1, '会员消费扣款'),
(170, 2582, 6, 7, -60.00, 0, '', 159, 1516084010, 1, '会员消费扣款'),
(171, 2582, 6, 7, -100.00, 0, '', 160, 1516084039, 1, '会员消费扣款'),
(172, 2582, 6, 7, -100.00, 0, '', 161, 1516084107, 1, '会员消费扣款'),
(173, 2582, 6, 3, 5.00, 0, '', 0, 1516084107, 1, '本人消费返佣'),
(174, 2582, 6, 7, -100.00, 0, '', 162, 1516084210, 1, '会员消费扣款'),
(175, 2582, 6, 3, 5.00, 0, '', 0, 1516084210, 1, '本人消费返佣'),
(176, 2582, 6, 1, 100.00, 0, '', 163, 1516085695, 1, '会员充值余额'),
(177, 2582, 6, 7, -100.00, 0, '', 164, 1516085777, 1, '会员消费扣款'),
(178, 2582, 6, 3, 5.00, 0, '', 0, 1516085777, 1, '本人消费返佣'),
(179, 2582, 6, 1, 100.00, 0, '', 165, 1516086035, 1, '会员充值余额'),
(180, 2592, 6, 7, -15.00, 0, '', 166, 1516097063, 1, '会员消费扣款'),
(181, 2596, 6, 7, -28.00, 0, '', 167, 1516104255, 1, '会员消费扣款'),
(182, 2597, 6, 7, -411.00, 0, '', 168, 1516105930, 1, '会员消费扣款'),
(183, 2602, 6, 7, -248.00, 0, '', 169, 1516162872, 1, '会员消费扣款'),
(184, 2603, 6, 7, -34.00, 0, '', 170, 1516166066, 1, '会员消费扣款'),
(185, 2604, 6, 7, -22.00, 0, '', 171, 1516166206, 1, '会员消费扣款'),
(186, 2379, 6, 3, 5.00, 0, '', 0, 1516166790, 1, '本人消费返佣'),
(187, 2379, 6, 1, 100.00, 0, '', 172, 1516166864, 1, '会员充值余额'),
(188, 2379, 6, 7, -100.00, 0, '', 173, 1516166887, 1, '储值消费扣款'),
(189, 2379, 6, 3, 5.00, 0, '', 0, 1516166887, 1, '本人消费返佣'),
(190, 2392, 6, 3, 5.00, 0, '', 0, 1516170583, 1, '本人消费返佣'),
(191, 2611, 6, 7, -346.00, 0, '', 174, 1516195540, 1, '储值消费扣款'),
(192, 2622, 6, 3, 2.50, 0, '', 0, 1516249128, 1, '本人消费返佣'),
(193, 2624, 6, 7, -43.00, 0, '', 175, 1516270498, 1, '储值消费扣款'),
(194, 2625, 6, 7, -516.00, 0, '', 176, 1516275193, 1, '储值消费扣款'),
(195, 2603, 6, 7, -231.00, 0, '', 177, 1516285643, 1, '储值消费扣款'),
(196, 2630, 6, 1, 500.00, 0, '', 178, 1516335131, 1, '会员充值余额'),
(197, 2637, 6, 7, -52.00, 0, '', 179, 1516356982, 1, '储值消费扣款'),
(198, 2423, 6, 7, -42.00, 0, '', 180, 1516358959, 1, '储值消费扣款'),
(199, 2639, 6, 7, -338.00, 0, '', 181, 1516361084, 1, '储值消费扣款'),
(200, 2634, 6, 7, -385.00, 0, '', 182, 1516361726, 1, '储值消费扣款'),
(201, 2641, 6, 3, 8.65, 0, '', 0, 1516363622, 1, '本人消费返佣'),
(202, 2423, 6, 7, -57.00, 0, '', 183, 1516418013, 1, '储值消费扣款'),
(203, 2647, 6, 3, 31.65, 0, '', 0, 1516418332, 1, '本人消费返佣'),
(204, 2649, 6, 7, -25.00, 0, '', 184, 1516422035, 1, '储值消费扣款'),
(205, 2649, 6, 3, 1.90, 0, '', 0, 1516422088, 1, '本人消费返佣'),
(206, 2651, 6, 3, 14.10, 0, '', 0, 1516422640, 1, '本人消费返佣'),
(207, 2653, 6, 3, 10.50, 0, '', 0, 1516427352, 1, '本人消费返佣'),
(208, 2649, 6, 3, 8.65, 0, '', 0, 1516429766, 1, '本人消费返佣'),
(209, 2656, 6, 7, -145.00, 0, '', 185, 1516439917, 1, '储值消费扣款'),
(210, 2659, 6, 7, -422.00, 0, '', 186, 1516449920, 1, '储值消费扣款'),
(211, 2660, 6, 7, -67.00, 0, '', 187, 1516454068, 1, '储值消费扣款'),
(212, 2666, 6, 7, -36.00, 0, '', 188, 1516503982, 1, '储值消费扣款'),
(213, 2637, 6, 7, -61.00, 0, '', 189, 1516511178, 1, '储值消费扣款'),
(214, 2667, 6, 7, -257.00, 0, '', 190, 1516512656, 1, '储值消费扣款'),
(215, 2670, 6, 7, -24.00, 0, '', 192, 1516530588, 1, '储值消费扣款'),
(216, 2673, 6, 3, 22.40, 0, '', 0, 1516536892, 1, '本人消费返佣'),
(217, 2675, 6, 3, 2.80, 0, '', 0, 1516591606, 1, '本人消费返佣'),
(218, 2677, 6, 7, -20.00, 0, '', 193, 1516596627, 1, '储值消费扣款'),
(219, 2693, 6, 3, 12.85, 0, '', 0, 1516606205, 1, '本人消费返佣'),
(220, 2712, 6, 7, -129.00, 0, '', 194, 1516618449, 1, '储值消费扣款'),
(221, 2716, 6, 7, -177.00, 0, '', 195, 1516620409, 1, '储值消费扣款'),
(222, 2720, 6, 7, -6.00, 0, '', 198, 1516624189, 1, '储值消费扣款'),
(223, 2741, 6, 7, -66.00, 0, '', 199, 1516680442, 1, '储值消费扣款'),
(224, 2742, 6, 7, -11.00, 0, '', 200, 1516680696, 1, '储值消费扣款'),
(225, 2743, 6, 7, -35.00, 0, '', 201, 1516680820, 1, '储值消费扣款'),
(226, 2754, 6, 7, -108.00, 0, '', 202, 1516700980, 1, '储值消费扣款'),
(227, 2603, 6, 7, -77.00, 0, '', 203, 1516701797, 1, '储值消费扣款'),
(228, 2758, 6, 7, -66.00, 0, '', 204, 1516706522, 1, '储值消费扣款'),
(229, 2758, 6, 3, 17.65, 0, '', 0, 1516706605, 1, '本人消费返佣'),
(230, 2759, 6, 7, -474.00, 0, '', 205, 1516708976, 1, '储值消费扣款'),
(231, 2756, 6, 7, -184.00, 0, '', 206, 1516709981, 1, '储值消费扣款'),
(232, 2760, 6, 7, -235.00, 0, '', 207, 1516713771, 1, '储值消费扣款'),
(233, 2760, 6, 3, 7.20, 0, '', 0, 1516713810, 1, '本人消费返佣'),
(234, 2768, 6, 3, 9.20, 0, '', 0, 1516764391, 1, '本人消费返佣'),
(235, 2769, 6, 7, -72.00, 0, '', 210, 1516766057, 1, '储值消费扣款'),
(236, 2666, 6, 7, -72.00, 0, '', 211, 1516767236, 1, '储值消费扣款'),
(237, 2781, 6, 7, -50.00, 0, '', 212, 1516790540, 1, '储值消费扣款'),
(238, 2783, 6, 7, -18.00, 0, '', 213, 1516791728, 1, '储值消费扣款'),
(239, 2793, 6, 7, -219.00, 0, '', 214, 1516849416, 1, '储值消费扣款'),
(240, 2677, 6, 7, -12.00, 0, '', 215, 1516852281, 1, '储值消费扣款'),
(241, 2585, 6, 7, -8.00, 0, '', 216, 1516853088, 1, '储值消费扣款'),
(242, 2585, 6, 3, 0.40, 0, '', 0, 1516853088, 1, '本人消费返佣'),
(243, 2797, 6, 7, -233.00, 0, '', 217, 1516857325, 1, '储值消费扣款'),
(244, 2801, 6, 1, 3000.00, 0, '', 218, 1516878674, 1, '会员充值余额'),
(245, 2801, 6, 7, -331.00, 0, '', 219, 1516878741, 1, '储值消费扣款'),
(246, 2801, 6, 3, 16.55, 0, '', 0, 1516878741, 1, '本人消费返佣'),
(247, 2805, 6, 7, -820.00, 0, '', 220, 1516885802, 1, '储值消费扣款'),
(248, 2602, 6, 1, 500.00, 0, '', 221, 1516886051, 1, '会员充值余额'),
(249, 2602, 6, 7, -396.00, 0, '', 222, 1516886127, 1, '储值消费扣款'),
(250, 2809, 6, 7, -25.00, 0, '', 223, 1516937156, 1, '储值消费扣款'),
(251, 2811, 6, 7, -151.00, 0, '', 224, 1516940982, 1, '储值消费扣款'),
(252, 2813, 6, 7, -4.00, 0, '', 225, 1516942254, 1, '储值消费扣款'),
(253, 2797, 6, 7, -613.00, 0, '', 226, 1516943921, 1, '储值消费扣款'),
(254, 2801, 6, 7, -1470.00, 0, '', 227, 1516962377, 1, '储值消费扣款'),
(255, 2801, 6, 3, 73.50, 0, '', 0, 1516962377, 1, '本人消费返佣'),
(256, 2821, 6, 7, -413.00, 0, '', 228, 1516968585, 1, '储值消费扣款'),
(257, 2821, 6, 3, 19.95, 0, '', 0, 1516968655, 1, '本人消费返佣'),
(258, 2822, 6, 7, -13.00, 0, '', 229, 1516968939, 1, '储值消费扣款'),
(259, 2759, 6, 7, -518.00, 0, '', 230, 1516976950, 1, '储值消费扣款'),
(260, 2828, 6, 7, -3.00, 0, '', 231, 1517023459, 1, '储值消费扣款'),
(261, 2832, 6, 7, -88.00, 0, '', 232, 1517029564, 1, '储值消费扣款'),
(262, 2801, 6, 7, -1409.00, 0, '', 233, 1517047376, 1, '储值消费扣款'),
(263, 2801, 6, 3, 70.45, 0, '', 0, 1517047377, 1, '本人消费返佣'),
(264, 2841, 6, 7, -34.00, 0, '', 234, 1517106497, 1, '储值消费扣款'),
(265, 2656, 6, 7, -190.00, 0, '', 235, 1517115384, 1, '储值消费扣款'),
(266, 2801, 6, 1, 1000.00, 0, '', 236, 1517119246, 1, '会员充值余额'),
(267, 2801, 6, 7, -835.00, 0, '', 237, 1517119297, 1, '储值消费扣款'),
(268, 2801, 6, 3, 41.75, 0, '', 0, 1517119297, 1, '本人消费返佣'),
(269, 2850, 6, 7, -408.00, 0, '', 238, 1517139039, 1, '储值消费扣款'),
(270, 2857, 6, 3, 33.65, 0, '', 0, 1517196095, 1, '本人消费返佣'),
(271, 2859, 6, 3, 0.40, 0, '', 0, 1517198650, 1, '本人消费返佣'),
(272, 2860, 6, 7, -82.00, 0, '', 239, 1517200086, 1, '储值消费扣款'),
(273, 2857, 6, 7, -110.00, 0, '', 240, 1517201639, 1, '储值消费扣款'),
(274, 2857, 6, 3, 17.25, 0, '', 0, 1517201674, 1, '本人消费返佣'),
(275, 2603, 6, 7, -39.00, 0, '', 241, 1517218344, 1, '储值消费扣款'),
(276, 2863, 6, 7, -123.00, 0, '', 242, 1517221401, 1, '储值消费扣款'),
(277, 2864, 6, 3, 9.40, 0, '', 0, 1517225887, 1, '本人消费返佣'),
(278, 2603, 6, 7, -343.00, 0, '', 243, 1517226009, 1, '储值消费扣款'),
(279, 2754, 6, 7, -271.00, 0, '', 244, 1517227982, 1, '储值消费扣款'),
(280, 2873, 6, 7, -175.00, 0, '', 245, 1517285326, 1, '储值消费扣款'),
(281, 2649, 6, 7, -11.00, 0, '', 246, 1517285505, 1, '储值消费扣款'),
(282, 2649, 6, 3, 0.55, 0, '', 0, 1517285505, 1, '本人消费返佣'),
(283, 2656, 6, 7, -156.00, 0, '', 247, 1517288121, 1, '储值消费扣款'),
(284, 2874, 6, 7, -139.00, 0, '', 248, 1517292469, 1, '储值消费扣款'),
(285, 2874, 6, 3, 25.00, 0, '', 0, 1517292502, 1, '本人消费返佣'),
(286, 2860, 6, 7, -355.00, 0, '', 249, 1517312267, 1, '储值消费扣款'),
(287, 2880, 6, 7, -168.00, 0, '', 250, 1517373388, 1, '储值消费扣款'),
(288, 2622, 6, 7, -22.00, 0, '', 251, 1517373610, 1, '储值消费扣款'),
(289, 2622, 6, 3, 0.60, 0, '', 0, 1517373638, 1, '本人消费返佣'),
(290, 2882, 6, 7, -29.00, 0, '', 252, 1517374020, 1, '储值消费扣款'),
(291, 2882, 6, 3, 5.95, 0, '', 0, 1517374070, 1, '本人消费返佣'),
(292, 2883, 6, 7, -5.00, 0, '', 253, 1517375512, 1, '储值消费扣款'),
(293, 2717, 6, 7, -401.00, 0, '', 254, 1517375732, 1, '储值消费扣款'),
(294, 2884, 6, 3, 15.60, 0, '', 0, 1517378079, 1, '本人消费返佣'),
(295, 2885, 6, 7, -90.00, 0, '', 255, 1517389005, 1, '储值消费扣款'),
(296, 2886, 6, 3, 1.50, 0, '', 0, 1517391528, 1, '本人消费返佣'),
(297, 2593, 6, 3, 47.05, 0, '', 0, 1517392374, 1, '本人消费返佣'),
(298, 2593, 6, 7, -47.00, 0, '', 258, 1517394375, 1, '储值消费扣款'),
(299, 2593, 6, 3, 3.40, 0, '', 0, 1517394404, 1, '本人消费返佣'),
(300, 2887, 6, 7, -50.00, 0, '', 259, 1517396745, 1, '储值消费扣款'),
(301, 2887, 6, 3, 4.35, 0, '', 0, 1517396772, 1, '本人消费返佣'),
(302, 2656, 6, 7, -593.00, 0, '', 260, 1517398286, 1, '储值消费扣款'),
(303, 2889, 6, 7, -44.00, 0, '', 261, 1517398411, 1, '储值消费扣款'),
(304, 2889, 6, 3, 20.15, 0, '', 0, 1517398432, 1, '本人消费返佣'),
(305, 2890, 6, 3, 18.25, 0, '', 0, 1517399594, 1, '本人消费返佣'),
(306, 2893, 6, 7, -58.00, 0, '', 262, 1517404777, 1, '储值消费扣款'),
(307, 2893, 6, 3, 20.00, 0, '', 0, 1517404822, 1, '本人消费返佣'),
(308, 2895, 6, 3, 4.00, 0, '', 0, 1517460552, 1, '本人消费返佣'),
(309, 2896, 6, 7, -242.00, 0, '', 263, 1517461536, 1, '储值消费扣款'),
(310, 2897, 6, 3, 14.40, 0, '', 0, 1517461758, 1, '本人消费返佣'),
(311, 2898, 6, 3, 10.60, 0, '', 0, 1517463254, 1, '本人消费返佣'),
(312, 2670, 6, 7, -683.00, 0, '', 264, 1517463982, 1, '储值消费扣款'),
(313, 2603, 6, 7, -67.00, 0, '', 265, 1517478956, 1, '储值消费扣款'),
(314, 2903, 6, 7, -19.00, 0, '', 266, 1517485389, 1, '储值消费扣款'),
(315, 2903, 6, 3, 16.95, 0, '', 0, 1517485424, 1, '本人消费返佣'),
(316, 2670, 6, 7, -91.00, 0, '', 267, 1517486450, 1, '储值消费扣款'),
(317, 2886, 6, 3, 1.75, 0, '', 0, 1517544061, 1, '本人消费返佣'),
(318, 2905, 6, 7, -232.00, 0, '', 268, 1517546255, 1, '储值消费扣款'),
(319, 2907, 6, 7, -66.00, 0, '', 269, 1517549191, 1, '储值消费扣款'),
(320, 2907, 6, 3, 7.05, 0, '', 0, 1517549233, 1, '本人消费返佣'),
(321, 2910, 6, 7, -67.00, 0, '', 270, 1517564393, 1, '储值消费扣款'),
(322, 2912, 6, 3, 3.00, 0, '', 0, 1517568759, 1, '本人消费返佣'),
(323, 2911, 6, 7, -186.00, 0, '', 271, 1517568866, 1, '储值消费扣款'),
(324, 2913, 6, 7, -7.00, 0, '', 272, 1517574356, 1, '储值消费扣款'),
(325, 2602, 6, 7, -156.00, 0, '', 273, 1517579893, 1, '储值消费扣款'),
(326, 2602, 6, 1, 1500.00, 0, '', 274, 1517579944, 1, '会员充值余额'),
(327, 2916, 6, 7, -147.00, 0, '', 275, 1517631650, 1, '储值消费扣款'),
(328, 2917, 6, 7, -10.00, 0, '', 276, 1517632866, 1, '储值消费扣款'),
(329, 2918, 6, 7, -11.00, 0, '', 277, 1517633415, 1, '储值消费扣款'),
(330, 2919, 6, 7, -10.00, 0, '', 278, 1517634392, 1, '储值消费扣款'),
(331, 2874, 6, 3, 38.50, 0, '', 0, 1517639594, 1, '本人消费返佣'),
(332, 2922, 6, 7, -34.00, 0, '', 279, 1517654700, 1, '储值消费扣款'),
(333, 2923, 6, 3, 9.35, 0, '', 0, 1517660086, 1, '本人消费返佣'),
(334, 2653, 6, 7, -25.00, 0, '', 280, 1517660455, 1, '储值消费扣款'),
(335, 2930, 6, 1, 1500.00, 0, '', 281, 1517716329, 1, '会员充值余额'),
(336, 2930, 6, 7, -147.00, 0, '', 282, 1517719532, 1, '储值消费扣款'),
(337, 2933, 6, 7, -37.00, 0, '', 284, 1517723721, 1, '储值消费扣款'),
(338, 2936, 6, 7, -29.00, 0, '', 285, 1517740860, 1, '储值消费扣款'),
(339, 2666, 6, 3, 6.20, 0, '', 0, 1517744592, 1, '本人消费返佣'),
(340, 2937, 6, 3, 23.85, 0, '', 0, 1517750789, 1, '本人消费返佣'),
(341, 2939, 6, 7, -9.00, 0, '', 286, 1517806294, 1, '储值消费扣款'),
(342, 2943, 6, 3, 6.10, 0, '', 0, 1517824689, 1, '本人消费返佣'),
(343, 2946, 6, 3, 13.20, 0, '', 0, 1517831113, 1, '本人消费返佣'),
(344, 2949, 6, 3, 26.00, 0, '', 0, 1517836382, 1, '本人消费返佣'),
(345, 2952, 6, 7, -27.00, 0, '', 287, 1517893840, 1, '储值消费扣款'),
(346, 2528, 6, 7, -199.00, 0, '', 288, 1517894356, 1, '储值消费扣款'),
(347, 2811, 6, 7, -274.00, 0, '', 289, 1517894745, 1, '储值消费扣款'),
(348, 2954, 6, 7, -550.00, 0, '', 290, 1517901624, 1, '储值消费扣款'),
(349, 2956, 6, 3, 31.80, 0, '', 0, 1517914795, 1, '本人消费返佣'),
(350, 2666, 6, 3, 8.75, 0, '', 0, 1517918380, 1, '本人消费返佣'),
(351, 2957, 6, 7, -85.00, 0, '', 291, 1517919721, 1, '储值消费扣款'),
(352, 2961, 6, 7, -169.00, 0, '', 292, 1517975224, 1, '储值消费扣款'),
(353, 2965, 6, 7, -177.00, 0, '', 293, 1517978981, 1, '储值消费扣款'),
(354, 2969, 6, 7, -4.00, 0, '', 294, 1517999395, 1, '储值消费扣款'),
(355, 2970, 6, 7, -127.00, 0, '', 295, 1518000337, 1, '储值消费扣款'),
(356, 2971, 6, 7, -36.00, 0, '', 296, 1518002036, 1, '储值消费扣款'),
(357, 2634, 6, 7, -337.00, 0, '', 297, 1518004865, 1, '储值消费扣款'),
(358, 2972, 6, 3, 17.75, 0, '', 0, 1518010881, 1, '本人消费返佣'),
(359, 2797, 6, 7, -527.00, 0, '', 298, 1518012756, 1, '储值消费扣款'),
(360, 2975, 6, 3, 8.90, 0, '', 0, 1518061582, 1, '本人消费返佣'),
(361, 2974, 6, 7, -571.00, 0, '', 299, 1518066000, 1, '储值消费扣款'),
(362, 2903, 6, 7, -17.00, 0, '', 300, 1518085474, 1, '储值消费扣款'),
(363, 2976, 6, 3, 3.05, 0, '', 0, 1518086505, 1, '本人消费返佣'),
(364, 2716, 6, 7, -81.00, 0, '', 301, 1518086836, 1, '储值消费扣款'),
(365, 2783, 6, 3, 9.95, 0, '', 0, 1518089406, 1, '本人消费返佣'),
(366, 2978, 6, 3, 15.95, 0, '', 0, 1518091852, 1, '本人消费返佣'),
(367, 2980, 6, 7, -17.00, 0, '', 302, 1518095959, 1, '储值消费扣款'),
(368, 2984, 6, 3, 11.05, 0, '', 0, 1518148257, 1, '本人消费返佣'),
(369, 2985, 6, 7, -20.00, 0, '', 303, 1518150704, 1, '储值消费扣款'),
(370, 2988, 6, 3, 19.35, 0, '', 0, 1518152065, 1, '本人消费返佣'),
(371, 2990, 6, 3, 5.85, 0, '', 0, 1518152113, 1, '本人消费返佣'),
(372, 2811, 6, 7, -1080.00, 0, '', 304, 1518176953, 1, '储值消费扣款'),
(373, 2821, 6, 3, 26.30, 0, '', 0, 1518177754, 1, '本人消费返佣'),
(374, 2992, 6, 7, -389.00, 0, '', 305, 1518178609, 1, '储值消费扣款'),
(375, 2603, 6, 7, -277.00, 0, '', 306, 1518182268, 1, '储值消费扣款'),
(376, 2637, 6, 7, -47.00, 0, '', 307, 1518236198, 1, '储值消费扣款'),
(377, 2995, 6, 7, -128.00, 0, '', 308, 1518237414, 1, '储值消费扣款'),
(378, 2832, 6, 7, -35.00, 0, '', 309, 1518238874, 1, '储值消费扣款'),
(379, 2666, 6, 3, 8.80, 0, '', 0, 1518240378, 1, '本人消费返佣'),
(380, 2996, 6, 7, -14.00, 0, '', 310, 1518240933, 1, '储值消费扣款'),
(381, 2996, 6, 3, 7.10, 0, '', 0, 1518240961, 1, '本人消费返佣'),
(382, 2903, 6, 3, 9.00, 0, '', 0, 1518258141, 1, '本人消费返佣'),
(383, 2999, 6, 7, -35.00, 0, '', 311, 1518264335, 1, '储值消费扣款'),
(384, 2999, 6, 3, 14.75, 0, '', 0, 1518264369, 1, '本人消费返佣'),
(385, 3001, 6, 7, -2.00, 0, '', 312, 1518320293, 1, '储值消费扣款'),
(386, 3001, 6, 3, 8.25, 0, '', 0, 1518320336, 1, '本人消费返佣'),
(387, 3002, 6, 7, -42.00, 0, '', 313, 1518322740, 1, '储值消费扣款'),
(388, 3002, 6, 3, 2.50, 0, '', 0, 1518322767, 1, '本人消费返佣'),
(389, 3005, 6, 7, -17.00, 0, '', 314, 1518350138, 1, '储值消费扣款'),
(390, 3005, 6, 3, 14.40, 0, '', 0, 1518350206, 1, '本人消费返佣'),
(391, 2889, 6, 7, -20.00, 0, '', 315, 1518414100, 1, '储值消费扣款'),
(392, 2889, 6, 3, 33.05, 0, '', 0, 1518414146, 1, '本人消费返佣'),
(393, 3011, 6, 3, 28.65, 0, '', 0, 1518417797, 1, '本人消费返佣'),
(394, 3012, 6, 3, 8.15, 0, '', 0, 1518428964, 1, '本人消费返佣'),
(395, 2912, 6, 3, 0.65, 0, '', 0, 1518433636, 1, '本人消费返佣'),
(396, 3014, 6, 7, -3.00, 0, '', 316, 1518435175, 1, '储值消费扣款'),
(397, 3014, 6, 3, 35.00, 0, '', 0, 1518435346, 1, '本人消费返佣'),
(398, 3015, 6, 7, -252.00, 0, '', 317, 1518438559, 1, '储值消费扣款'),
(399, 3015, 6, 3, 8.70, 0, '', 0, 1518438585, 1, '本人消费返佣'),
(400, 3016, 6, 3, 20.05, 0, '', 0, 1518439592, 1, '本人消费返佣'),
(401, 3016, 6, 7, -63.00, 0, '', 318, 1518439628, 1, '储值消费扣款'),
(402, 2890, 6, 3, 26.80, 0, '', 0, 1518442022, 1, '本人消费返佣'),
(403, 3017, 6, 3, 10.95, 0, '', 0, 1518443265, 1, '本人消费返佣');

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_member_address`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_member_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `openid` varchar(50) DEFAULT '0',
  `realname` varchar(20) DEFAULT '',
  `mobile` varchar(11) DEFAULT '',
  `province` varchar(30) DEFAULT '',
  `city` varchar(30) DEFAULT '',
  `area` varchar(30) DEFAULT '',
  `address` varchar(300) DEFAULT '',
  `isdefault` tinyint(1) DEFAULT '0',
  `zipcode` varchar(255) DEFAULT '',
  `deleted` tinyint(1) DEFAULT '0',
  `street` varchar(50) NOT NULL DEFAULT '',
  `datavalue` varchar(50) NOT NULL DEFAULT '',
  `streetdatavalue` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_openid` (`openid`),
  KEY `idx_isdefault` (`isdefault`),
  KEY `idx_deleted` (`deleted`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=113 ;

--
-- 转存表中的数据 `ims_ewei_shop_member_address`
--

INSERT INTO `ims_ewei_shop_member_address` (`id`, `uniacid`, `openid`, `realname`, `mobile`, `province`, `city`, `area`, `address`, `isdefault`, `zipcode`, `deleted`, `street`, `datavalue`, `streetdatavalue`) VALUES
(87, 1, 'xcx_omn4O0Z2Jla6sXjPb5BEPk3J3RcE', '小刘', '16789890909', '黑龙江省', '鹤岗市', '向阳区', '中央民族大街2', 1, '', 0, '', '', ''),
(88, 1, 'xcx_kuajing', '老刘', '15305466535', '山西省', '阳泉市', '平定县', '黄河路305号', 1, '', 0, '', '', ''),
(86, 1, 'xcx_omn4O0Z2Jla6sXjPb5BEPk3J3RcE', '老李1', '15678789000', '山西省', '太原市', '小店区', 'fewfwef', 0, '', 0, '', '', ''),
(89, 1, 'xcx_omn4O0dEEFCYOOob9aYWy4pEFZ4g', '谢', '15059393123', '福建省', '宁德市', '福鼎市', '太姥大道324', 0, '', 0, '', '', ''),
(90, 1, 'xcx_omn4O0dEEFCYOOob9aYWy4pEFZ4g', '谢', '15059393123', '福建省', '宁德市', '福鼎市', '太姥大道324', 1, '', 0, '', '', ''),
(93, 1, 'xcx_oqh0A0YKYDgFJrFIPx9ZGUyQrDk0', '李大羽', '15678789090', '山西省', '阳泉市', '城区', '份饭', 1, '', 0, '', '', ''),
(94, 1, 'xcx_oqh0A0SpNJiQCXZ9myNTjz_ExhC8', '李', '15305466535', '山东省', '滨州市', '邹平县', '北大路', 0, '', 0, '', '', ''),
(97, 1, 'xcx_oqh0A0RkMeUCrSfeGq9BBioMpqXU', '好', '111', '山东省', '东营市', '东营区', '路', 1, '', 0, '', '', ''),
(98, 1, 'xcx_oqh0A0SpNJiQCXZ9myNTjz_ExhC8', '悟空', '15305466535', '内蒙古自治区', '包头市', '东河区', '详细', 1, '', 0, '', '', ''),
(99, 1, 'xcx_omn4O0dvi4qwHjlakwoICCS6rrMQ', '李', '15305466535', '天津市', '县', '蓟县', '两', 1, '', 0, '', '', ''),
(100, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', '李先生', '15666677699', '', '', '', '', 1, '', 0, '', '', ''),
(101, 6, 'xcx_ozAoi0Taz78QVpdOMuvjRcWQMnNs', '陈桂芝', '13181992212', '', '', '', '', 0, '', 0, '', '', ''),
(102, 6, 'xcx_ozAoi0Taz78QVpdOMuvjRcWQMnNs', '陈桂芝', '13181992212', '', '', '', '', 1, '', 0, '', '', ''),
(103, 6, 'xcx_ozAoi0eBYYfxwaoVFxKI4JNJi7qw', '刘', '18675467899', '', '', '', '', 1, '', 0, '', '', ''),
(104, 6, 'xcx_ozAoi0Vuqvw6Z8dOsqT1mE2prylA', '吗', '15677899090', '', '', '', '', 1, '', 0, '', '', ''),
(105, 6, 'xcx_ozAoi0Q30XFvi9pGju9tQqnPiiBE', '李', '15666677699', '', '', '', '', 1, '', 0, '', '', ''),
(106, 6, 'xcx_ozAoi0Uy4DEr7ddNtlNngVPPfP2Q', '连东梅', '13792064731', '', '', '', '', 1, '', 0, '', '', ''),
(107, 6, 'xcx_ozAoi0RLjA4VPVIJM3fZxioncz20', '樊', '17764714332', '', '', '', '', 1, '', 0, '', '', ''),
(108, 6, 'xcx_ozAoi0UG0eDFRlS2yDpHclcjzMh0', '李常林', '18678699800', '', '', '', '', 1, '', 0, '', '', ''),
(109, 6, 'xcx_ozAoi0XCkvTbzHJVFSFoQel5krlE', '张兵', '13121750555', '', '', '', '', 1, '', 0, '', '', ''),
(112, 6, 'xcx_ozAoi0SFFkyPlAJoH4NU_iE6hj6Q', '刘占锋', '18678679898', '', '', '', '', 1, '', 0, '', '', ''),
(111, 6, 'xcx_ozAoi0SRUURXLSGVQkBbiVfkQbsg', '张', '13589992730', '', '', '', '', 1, '', 0, '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_member_cart`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_member_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `openid` varchar(100) DEFAULT '',
  `goodsid` int(11) DEFAULT '0',
  `total` int(11) DEFAULT '0',
  `marketprice` decimal(10,2) DEFAULT '0.00',
  `deleted` tinyint(1) DEFAULT '0',
  `optionid` int(11) DEFAULT '0',
  `createtime` int(11) DEFAULT '0',
  `diyformdataid` int(11) DEFAULT '0',
  `diyformdata` text,
  `diyformfields` text,
  `diyformid` int(11) DEFAULT '0',
  `selected` tinyint(1) DEFAULT '1',
  `selectedadd` tinyint(1) DEFAULT '1',
  `merchid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_goodsid` (`goodsid`),
  KEY `idx_openid` (`openid`),
  KEY `idx_deleted` (`deleted`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=356 ;

--
-- 转存表中的数据 `ims_ewei_shop_member_cart`
--

INSERT INTO `ims_ewei_shop_member_cart` (`id`, `uniacid`, `openid`, `goodsid`, `total`, `marketprice`, `deleted`, `optionid`, `createtime`, `diyformdataid`, `diyformdata`, `diyformfields`, `diyformid`, `selected`, `selectedadd`, `merchid`) VALUES
(65, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 209, 7, '38.00', 1, 0, 1511375892, 0, '', 'a:0:{}', 0, 1, 1, 0),
(220, 6, 'xcx_ozAoi0T98Ot2weT8m2c80whLBjtI', 481, 2, '46.00', 0, 0, 1516072459, 0, '', 'a:0:{}', 0, 1, 1, 0),
(72, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 207, 1, '6.00', 1, 0, 1511583712, 0, '', 'a:0:{}', 0, 1, 1, 0),
(73, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 206, 1, '78.00', 1, 0, 1511676503, 0, '', 'a:0:{}', 0, 1, 1, 0),
(74, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 206, 1, '78.00', 1, 0, 1511754613, 0, '', 'a:0:{}', 0, 1, 1, 0),
(75, 6, 'xcx_ozAoi0Taz78QVpdOMuvjRcWQMnNs', 209, 1, '0.01', 1, 0, 1511851543, 0, '', 'a:0:{}', 0, 1, 1, 0),
(77, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 209, 3, '0.01', 1, 0, 1513231338, 0, '', 'a:0:{}', 0, 1, 1, 0),
(219, 6, 'xcx_ozAoi0T98Ot2weT8m2c80whLBjtI', 209, 1, '38.00', 0, 0, 1516072424, 0, '', 'a:0:{}', 0, 1, 1, 0),
(237, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 213, 1, '10.00', 1, 0, 1516091757, 0, '', 'a:0:{}', 0, 1, 1, 0),
(81, 6, 'xcx_ozAoi0Yjc2Ry0lnM9o13GTxiiZ00', 206, 2, '78.00', 0, 0, 1513824671, 0, '', 'a:0:{}', 0, 1, 1, 0),
(82, 6, 'xcx_ozAoi0Yjc2Ry0lnM9o13GTxiiZ00', 209, 1, '38.00', 0, 0, 1513824923, 0, '', 'a:0:{}', 0, 1, 1, 0),
(83, 6, 'xcx_ozAoi0Z9Ajv7_5StU0cAcwa_74Nw', 261, 1, '58.00', 0, 0, 1513827148, 0, '', 'a:0:{}', 0, 1, 1, 0),
(84, 6, 'xcx_ozAoi0Z9Ajv7_5StU0cAcwa_74Nw', 208, 2, '58.00', 0, 0, 1513827187, 0, '', 'a:0:{}', 0, 1, 1, 0),
(85, 6, 'xcx_ozAoi0Z9Ajv7_5StU0cAcwa_74Nw', 207, 1, '6.00', 0, 0, 1513827244, 0, '', 'a:0:{}', 0, 1, 1, 0),
(86, 6, 'xcx_ozAoi0Z9Ajv7_5StU0cAcwa_74Nw', 236, 1, '3.00', 0, 0, 1513827289, 0, '', 'a:0:{}', 0, 1, 1, 0),
(179, 6, 'xcx_ozAoi0RLjA4VPVIJM3fZxioncz20', 207, 1, '6.00', 0, 0, 1515716275, 0, '', 'a:0:{}', 0, 1, 1, 0),
(178, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 286, 1, '68.00', 1, 0, 1515490548, 0, '', 'a:0:{}', 0, 1, 1, 0),
(90, 6, 'xcx_ozAoi0RN4Xa1DXm752Y4inXKUZ_I', 261, 1, '58.00', 0, 0, 1514531283, 0, '', 'a:0:{}', 0, 1, 1, 0),
(91, 6, 'xcx_ozAoi0RN4Xa1DXm752Y4inXKUZ_I', 251, 1, '18.00', 0, 0, 1514531285, 0, '', 'a:0:{}', 0, 1, 1, 0),
(92, 6, 'xcx_ozAoi0RN4Xa1DXm752Y4inXKUZ_I', 250, 1, '48.00', 0, 0, 1514531286, 0, '', 'a:0:{}', 0, 1, 1, 0),
(93, 6, 'xcx_ozAoi0RN4Xa1DXm752Y4inXKUZ_I', 247, 1, '18.00', 0, 0, 1514531286, 0, '', 'a:0:{}', 0, 1, 1, 0),
(94, 6, 'xcx_ozAoi0RN4Xa1DXm752Y4inXKUZ_I', 242, 1, '78.00', 0, 0, 1514531287, 0, '', 'a:0:{}', 0, 1, 1, 0),
(95, 6, 'xcx_ozAoi0RN4Xa1DXm752Y4inXKUZ_I', 267, 1, '38.00', 0, 0, 1514531289, 0, '', 'a:0:{}', 0, 1, 1, 0),
(96, 6, 'xcx_ozAoi0RN4Xa1DXm752Y4inXKUZ_I', 265, 1, '28.00', 0, 0, 1514531291, 0, '', 'a:0:{}', 0, 1, 1, 0),
(97, 6, 'xcx_ozAoi0RN4Xa1DXm752Y4inXKUZ_I', 206, 1, '78.00', 0, 0, 1514535155, 0, '', 'a:0:{}', 0, 1, 1, 0),
(98, 6, 'xcx_ozAoi0ZmXqfozqwYZ4i88M3WG_5k', 226, 1, '5.00', 0, 0, 1514589630, 0, '', 'a:0:{}', 0, 1, 1, 0),
(99, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 282, 1, '18.00', 1, 0, 1514826606, 0, '', 'a:0:{}', 0, 1, 1, 0),
(104, 6, 'xcx_ozAoi0f5iIj-zsHlAHlZF7m2hVYQ', 275, 1, '35.00', 0, 0, 1514876315, 0, '', 'a:0:{}', 0, 1, 1, 0),
(103, 6, 'xcx_ozAoi0f5iIj-zsHlAHlZF7m2hVYQ', 206, 1, '78.00', 0, 0, 1514876304, 0, '', 'a:0:{}', 0, 1, 1, 0),
(106, 6, 'xcx_ozAoi0f5iIj-zsHlAHlZF7m2hVYQ', 260, 1, '78.00', 0, 0, 1514876356, 0, '', 'a:0:{}', 0, 1, 1, 0),
(107, 6, 'xcx_ozAoi0f5iIj-zsHlAHlZF7m2hVYQ', 216, 1, '8.00', 0, 0, 1514876387, 0, '', 'a:0:{}', 0, 1, 1, 0),
(108, 6, 'xcx_ozAoi0T38PHIxpvEDq_JSRgA-2wY', 207, 2, '6.00', 0, 0, 1514899336, 0, '', 'a:0:{}', 0, 1, 1, 0),
(109, 6, 'xcx_ozAoi0b71bme3Cd5kF_oh-qFayzY', 226, 1, '5.00', 0, 0, 1515009018, 0, '', 'a:0:{}', 0, 1, 1, 0),
(114, 6, 'xcx_ozAoi0RNGhHXUIH0itDKM-ZNCLUI', 261, 1, '58.00', 0, 0, 1515045487, 0, '', 'a:0:{}', 0, 1, 1, 0),
(111, 6, 'xcx_ozAoi0RNGhHXUIH0itDKM-ZNCLUI', 208, 4, '58.00', 0, 0, 1515045278, 0, '', 'a:0:{}', 0, 1, 1, 0),
(112, 6, 'xcx_ozAoi0RNGhHXUIH0itDKM-ZNCLUI', 206, 2, '78.00', 0, 0, 1515045297, 0, '', 'a:0:{}', 0, 1, 1, 0),
(113, 6, 'xcx_ozAoi0RNGhHXUIH0itDKM-ZNCLUI', 286, 2, '68.00', 0, 0, 1515045351, 0, '', 'a:0:{}', 0, 1, 1, 0),
(115, 6, 'xcx_ozAoi0RNGhHXUIH0itDKM-ZNCLUI', 207, 2, '6.00', 0, 0, 1515045494, 0, '', 'a:0:{}', 0, 1, 1, 0),
(116, 6, 'xcx_ozAoi0SIZb0piW6pEVrVRKBcesRQ', 206, 3, '78.00', 0, 0, 1515046111, 0, '', 'a:0:{}', 0, 1, 1, 0),
(117, 6, 'xcx_ozAoi0SIZb0piW6pEVrVRKBcesRQ', 209, 2, '38.00', 0, 0, 1515046220, 0, '', 'a:0:{}', 0, 1, 1, 0),
(118, 6, 'xcx_ozAoi0SIZb0piW6pEVrVRKBcesRQ', 208, 1, '58.00', 0, 0, 1515046233, 0, '', 'a:0:{}', 0, 1, 1, 0),
(119, 6, 'xcx_ozAoi0SIZb0piW6pEVrVRKBcesRQ', 260, 1, '78.00', 0, 0, 1515046296, 0, '', 'a:0:{}', 0, 1, 1, 0),
(120, 6, 'xcx_ozAoi0Taz78QVpdOMuvjRcWQMnNs', 288, 1, '1.00', 1, 0, 1515111136, 0, '', 'a:0:{}', 0, 1, 1, 0),
(180, 6, 'xcx_ozAoi0Sn3GzY3JWQpvjVZwgZhnjs', 207, 1, '6.00', 0, 0, 1515750809, 0, '', 'a:0:{}', 0, 1, 1, 0),
(122, 6, 'xcx_ozAoi0bBTMkBeuS3XNKlpJtixAso', 226, 1, '5.00', 0, 0, 1515147125, 0, '', 'a:0:{}', 0, 1, 1, 0),
(123, 6, 'xcx_ozAoi0bBTMkBeuS3XNKlpJtixAso', 225, 1, '5.00', 0, 0, 1515147130, 0, '', 'a:0:{}', 0, 1, 1, 0),
(124, 6, 'xcx_ozAoi0RAciKU1DHmEqgWNqgYUUEU', 208, 1, '58.00', 0, 0, 1515156429, 0, '', 'a:0:{}', 0, 1, 1, 0),
(125, 6, 'xcx_ozAoi0RAciKU1DHmEqgWNqgYUUEU', 260, 1, '78.00', 0, 0, 1515156453, 0, '', 'a:0:{}', 0, 1, 1, 0),
(126, 6, 'xcx_ozAoi0RAciKU1DHmEqgWNqgYUUEU', 293, 1, '10.00', 0, 0, 1515156462, 0, '', 'a:0:{}', 0, 1, 1, 0),
(127, 6, 'xcx_ozAoi0RAciKU1DHmEqgWNqgYUUEU', 209, 2, '38.00', 0, 0, 1515156470, 0, '', 'a:0:{}', 0, 1, 1, 0),
(128, 6, 'xcx_ozAoi0cD1sE0NcBFRpNNKsXL4gfo', 260, 1, '78.00', 0, 0, 1515170990, 0, '', 'a:0:{}', 0, 1, 1, 0),
(129, 6, 'xcx_ozAoi0cD1sE0NcBFRpNNKsXL4gfo', 209, 2, '38.00', 0, 0, 1515170998, 0, '', 'a:0:{}', 0, 1, 1, 0),
(130, 6, 'xcx_ozAoi0cD1sE0NcBFRpNNKsXL4gfo', 207, 1, '6.00', 0, 0, 1515171203, 0, '', 'a:0:{}', 0, 1, 1, 0),
(131, 6, 'xcx_ozAoi0Taz78QVpdOMuvjRcWQMnNs', 288, 1, '1.00', 1, 0, 1515295693, 0, '', 'a:0:{}', 0, 1, 1, 0),
(132, 6, 'xcx_ozAoi0Taz78QVpdOMuvjRcWQMnNs', 288, 1, '1.00', 1, 0, 1515378019, 0, '', 'a:0:{}', 0, 1, 1, 0),
(133, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 286, 1, '68.00', 1, 0, 1515389906, 0, '', 'a:0:{}', 0, 1, 1, 0),
(134, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 209, 1, '38.00', 1, 0, 1515389909, 0, '', 'a:0:{}', 0, 1, 1, 0),
(135, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 559, 2, '10.00', 1, 0, 1515389913, 0, '', 'a:0:{}', 0, 1, 1, 0),
(136, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 546, 1, '38.00', 1, 0, 1515389919, 0, '', 'a:0:{}', 0, 1, 1, 0),
(137, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 225, 2, '5.00', 1, 0, 1515389922, 0, '', 'a:0:{}', 0, 1, 1, 0),
(138, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 221, 2, '5.00', 1, 0, 1515389925, 0, '', 'a:0:{}', 0, 1, 1, 0),
(139, 6, 'xcx_ozAoi0bWTSlsEzQwBi_HdtRTZPiE', 286, 1, '68.00', 0, 0, 1515397416, 0, '', 'a:0:{}', 0, 1, 1, 0),
(140, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 503, 2, '6.00', 1, 0, 1515397453, 0, '', 'a:0:{}', 0, 1, 1, 0),
(141, 6, 'xcx_ozAoi0Y2HjUpLbzlbtNpLjA6fqic', 209, 1, '38.00', 0, 0, 1515403960, 0, '', 'a:0:{}', 0, 1, 1, 0),
(142, 6, 'xcx_ozAoi0Y2HjUpLbzlbtNpLjA6fqic', 260, 2, '78.00', 0, 0, 1515404043, 0, '', 'a:0:{}', 0, 1, 1, 0),
(143, 6, 'xcx_ozAoi0Y2HjUpLbzlbtNpLjA6fqic', 261, 1, '58.00', 0, 0, 1515404064, 0, '', 'a:0:{}', 0, 1, 1, 0),
(144, 6, 'xcx_ozAoi0Y2HjUpLbzlbtNpLjA6fqic', 207, 1, '6.00', 0, 0, 1515404092, 0, '', 'a:0:{}', 0, 1, 1, 0),
(145, 6, 'xcx_ozAoi0Y2HjUpLbzlbtNpLjA6fqic', 208, 2, '58.00', 0, 0, 1515404120, 0, '', 'a:0:{}', 0, 1, 1, 0),
(146, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 286, 1, '68.00', 1, 0, 1515410456, 0, '', 'a:0:{}', 0, 1, 1, 0),
(147, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 226, 2, '5.00', 1, 0, 1515410463, 0, '', 'a:0:{}', 0, 1, 1, 0),
(148, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 546, 1, '38.00', 1, 0, 1515410468, 0, '', 'a:0:{}', 0, 1, 1, 0),
(149, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 486, 1, '18.00', 1, 0, 1515410472, 0, '', 'a:0:{}', 0, 1, 1, 0),
(150, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 488, 1, '18.00', 1, 0, 1515410475, 0, '', 'a:0:{}', 0, 1, 1, 0),
(151, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 489, 1, '58.00', 1, 0, 1515410476, 0, '', 'a:0:{}', 0, 1, 1, 0),
(152, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 209, 1, '38.00', 1, 0, 1515411534, 0, '', 'a:0:{}', 0, 1, 1, 0),
(153, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 206, 1, '78.00', 1, 0, 1515411537, 0, '', 'a:0:{}', 0, 1, 1, 0),
(154, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 209, 1, '38.00', 1, 0, 1515411600, 0, '', 'a:0:{}', 0, 1, 1, 0),
(155, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 286, 1, '68.00', 1, 0, 1515412139, 0, '', 'a:0:{}', 0, 1, 1, 0),
(156, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 286, 1, '68.00', 1, 0, 1515412295, 0, '', 'a:0:{}', 0, 1, 1, 0),
(157, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 286, 1, '68.00', 1, 0, 1515412378, 0, '', 'a:0:{}', 0, 1, 1, 0),
(158, 6, 'xcx_ozAoi0RNGhHXUIH0itDKM-ZNCLUI', 535, 1, '18.00', 0, 0, 1515415014, 0, '', 'a:0:{}', 0, 1, 1, 0),
(159, 6, 'xcx_ozAoi0Taz78QVpdOMuvjRcWQMnNs', 288, 1, '1.00', 1, 0, 1515475485, 0, '', 'a:0:{}', 0, 1, 1, 0),
(160, 6, 'xcx_ozAoi0Taz78QVpdOMuvjRcWQMnNs', 288, 1, '1.00', 1, 0, 1515480064, 0, '', 'a:0:{}', 0, 1, 1, 0),
(161, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 286, 1, '68.00', 1, 0, 1515480068, 0, '', 'a:0:{}', 0, 1, 1, 0),
(163, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 560, 1, '15.00', 1, 0, 1515480076, 0, '', 'a:0:{}', 0, 1, 1, 0),
(164, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 546, 1, '38.00', 1, 0, 1515480078, 0, '', 'a:0:{}', 0, 1, 1, 0),
(165, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 543, 1, '39.00', 1, 0, 1515480079, 0, '', 'a:0:{}', 0, 1, 1, 0),
(166, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 541, 1, '26.00', 1, 0, 1515480080, 0, '', 'a:0:{}', 0, 1, 1, 0),
(167, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 225, 1, '5.00', 1, 0, 1515480082, 0, '', 'a:0:{}', 0, 1, 1, 0),
(168, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 221, 2, '5.00', 1, 0, 1515480085, 0, '', 'a:0:{}', 0, 1, 1, 0),
(169, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 560, 1, '15.00', 1, 0, 1515481876, 0, '', 'a:0:{}', 0, 1, 1, 0),
(170, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 558, 1, '12.00', 1, 0, 1515481877, 0, '', 'a:0:{}', 0, 1, 1, 0),
(171, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 557, 1, '48.00', 1, 0, 1515481878, 0, '', 'a:0:{}', 0, 1, 1, 0),
(181, 6, 'xcx_ozAoi0Sn3GzY3JWQpvjVZwgZhnjs', 217, 1, '8.00', 0, 0, 1515750880, 0, '', 'a:0:{}', 0, 1, 1, 0),
(182, 6, 'xcx_ozAoi0Sn3GzY3JWQpvjVZwgZhnjs', 226, 1, '5.00', 0, 0, 1515750917, 0, '', 'a:0:{}', 0, 1, 1, 0),
(183, 6, 'xcx_ozAoi0Sn3GzY3JWQpvjVZwgZhnjs', 385, 1, '8.00', 0, 0, 1515750974, 0, '', 'a:0:{}', 0, 1, 1, 0),
(184, 6, 'xcx_ozAoi0Sn3GzY3JWQpvjVZwgZhnjs', 539, 1, '22.00', 0, 0, 1515751042, 0, '', 'a:0:{}', 0, 1, 1, 0),
(185, 6, 'xcx_ozAoi0eBYYfxwaoVFxKI4JNJi7qw', 503, 2, '6.00', 0, 0, 1515754541, 0, '', 'a:0:{}', 0, 1, 1, 0),
(186, 6, 'xcx_ozAoi0YLeUrVG-21nJK-A3jS0i9M', 206, 1, '78.00', 0, 0, 1515758097, 0, '', 'a:0:{}', 0, 1, 1, 0),
(187, 6, 'xcx_ozAoi0c_eNrpMY8PocqAEmsHAJH4', 546, 1, '38.00', 0, 0, 1515810084, 0, '', 'a:0:{}', 0, 1, 1, 0),
(188, 6, 'xcx_ozAoi0c_eNrpMY8PocqAEmsHAJH4', 543, 1, '39.00', 0, 0, 1515810087, 0, '', 'a:0:{}', 0, 1, 1, 0),
(189, 6, 'xcx_ozAoi0Taz78QVpdOMuvjRcWQMnNs', 288, 1, '1.00', 1, 0, 1515824776, 0, '', 'a:0:{}', 0, 1, 1, 0),
(197, 6, 'xcx_ozAoi0eBYYfxwaoVFxKI4JNJi7qw', 209, 2, '38.00', 0, 0, 1515985854, 0, '', 'a:0:{}', 0, 1, 1, 0),
(196, 6, 'xcx_ozAoi0Taz78QVpdOMuvjRcWQMnNs', 288, 1, '1.00', 1, 0, 1515978543, 0, '', 'a:0:{}', 0, 1, 1, 0),
(195, 6, 'xcx_ozAoi0Taz78QVpdOMuvjRcWQMnNs', 288, 1, '1.00', 1, 0, 1515939670, 0, '', 'a:0:{}', 0, 1, 1, 0),
(193, 6, 'xcx_ozAoi0WzpXP6wiH6ucKPgGVnHQcg', 277, 1, '6.00', 0, 0, 1515922600, 0, '', 'a:0:{}', 0, 1, 1, 0),
(198, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 481, 2, '46.00', 1, 0, 1515987115, 0, '', 'a:0:{}', 0, 1, 1, 0),
(199, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 561, 1, '58.00', 1, 0, 1515987957, 0, '', 'a:0:{}', 0, 1, 1, 0),
(200, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 522, 1, '68.00', 1, 0, 1515987960, 0, '', 'a:0:{}', 0, 1, 1, 0),
(204, 6, 'xcx_ozAoi0WP-D5_qXPGavLr9KItdpqU', 347, 1, '39.00', 0, 0, 1516057086, 0, '', 'a:0:{}', 0, 1, 1, 0),
(202, 6, 'xcx_ozAoi0fyDEZWPbPr26vOpT40wHKk', 347, 1, '39.00', 0, 0, 1515997876, 0, '', 'a:0:{}', 0, 1, 1, 0),
(203, 6, 'xcx_ozAoi0fyDEZWPbPr26vOpT40wHKk', 522, 1, '68.00', 0, 0, 1515997935, 0, '', 'a:0:{}', 0, 1, 1, 0),
(205, 6, 'xcx_ozAoi0WP-D5_qXPGavLr9KItdpqU', 481, 1, '46.00', 0, 0, 1516057095, 0, '', 'a:0:{}', 0, 1, 1, 0),
(206, 6, 'xcx_ozAoi0WP-D5_qXPGavLr9KItdpqU', 248, 1, '38.00', 0, 0, 1516058443, 0, '', 'a:0:{}', 0, 1, 1, 0),
(207, 6, 'xcx_ozAoi0Qq9yufik09yhvbbpWFs-q0', 561, 1, '58.00', 0, 0, 1516061146, 0, '', 'a:0:{}', 0, 1, 1, 0),
(208, 6, 'xcx_ozAoi0Z5rZ0_pe8xb6OQtKL9Aq9s', 209, 1, '38.00', 0, 0, 1516065784, 0, '', 'a:0:{}', 0, 1, 1, 0),
(214, 6, 'xcx_ozAoi0Vuqvw6Z8dOsqT1mE2prylA', 503, 4, '6.00', 1, 0, 1516068216, 0, '', 'a:0:{}', 0, 1, 1, 0),
(213, 6, 'xcx_ozAoi0Z5rZ0_pe8xb6OQtKL9Aq9s', 473, 1, '18.00', 0, 0, 1516065933, 0, '', 'a:0:{}', 0, 1, 1, 0),
(211, 6, 'xcx_ozAoi0Z5rZ0_pe8xb6OQtKL9Aq9s', 481, 2, '46.00', 0, 0, 1516065846, 0, '', 'a:0:{}', 0, 1, 1, 0),
(212, 6, 'xcx_ozAoi0Z5rZ0_pe8xb6OQtKL9Aq9s', 271, 2, '10.00', 0, 0, 1516065879, 0, '', 'a:0:{}', 0, 1, 1, 0),
(215, 6, 'xcx_ozAoi0Vuqvw6Z8dOsqT1mE2prylA', 498, 2, '48.00', 1, 0, 1516068218, 0, '', 'a:0:{}', 0, 1, 1, 0),
(216, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 206, 1, '78.00', 1, 0, 1516071849, 0, '', 'a:0:{}', 0, 1, 1, 0),
(229, 6, 'xcx_ozAoi0Q30XFvi9pGju9tQqnPiiBE', 559, 1, '10.00', 1, 0, 1516074061, 0, '', 'a:0:{}', 0, 1, 1, 0),
(227, 6, 'xcx_ozAoi0WCxSXhCNF04lf-cFCOPWXE', 539, 1, '22.00', 0, 0, 1516073987, 0, '', 'a:0:{}', 0, 1, 1, 0),
(222, 6, 'xcx_ozAoi0ZraHimEJLr8gImGOM_a0yM', 478, 1, '12.00', 0, 0, 1516073591, 0, '', 'a:0:{}', 0, 1, 1, 0),
(223, 6, 'xcx_ozAoi0ZraHimEJLr8gImGOM_a0yM', 529, 1, '14.00', 0, 0, 1516073611, 0, '', 'a:0:{}', 0, 1, 1, 0),
(224, 6, 'xcx_ozAoi0ZraHimEJLr8gImGOM_a0yM', 272, 1, '18.00', 0, 0, 1516073767, 0, '', 'a:0:{}', 0, 1, 1, 0),
(225, 6, 'xcx_ozAoi0WCxSXhCNF04lf-cFCOPWXE', 256, 2, '35.00', 0, 0, 1516073857, 0, '', 'a:0:{}', 0, 1, 1, 0),
(230, 6, 'xcx_ozAoi0Q30XFvi9pGju9tQqnPiiBE', 560, 1, '15.00', 1, 0, 1516074062, 0, '', 'a:0:{}', 0, 1, 1, 0),
(231, 6, 'xcx_ozAoi0Q30XFvi9pGju9tQqnPiiBE', 503, 1, '6.00', 1, 0, 1516074064, 0, '', 'a:0:{}', 0, 1, 1, 0),
(232, 6, 'xcx_ozAoi0Q30XFvi9pGju9tQqnPiiBE', 501, 1, '28.00', 1, 0, 1516074067, 0, '', 'a:0:{}', 0, 1, 1, 0),
(234, 6, 'xcx_ozAoi0Q30XFvi9pGju9tQqnPiiBE', 503, 1, '6.00', 1, 0, 1516078103, 0, '', 'a:0:{}', 0, 1, 1, 0),
(235, 6, 'xcx_ozAoi0Q30XFvi9pGju9tQqnPiiBE', 501, 1, '28.00', 1, 0, 1516078105, 0, '', 'a:0:{}', 0, 1, 1, 0),
(236, 6, 'xcx_ozAoi0T98Ot2weT8m2c80whLBjtI', 522, 1, '68.00', 0, 0, 1516083310, 0, '', 'a:0:{}', 0, 1, 1, 0),
(238, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 221, 1, '5.00', 1, 0, 1516091773, 0, '', 'a:0:{}', 0, 1, 1, 0),
(239, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 522, 1, '68.00', 1, 0, 1516091843, 0, '', 'a:0:{}', 0, 1, 1, 0),
(240, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 209, 1, '38.00', 1, 0, 1516091848, 0, '', 'a:0:{}', 0, 1, 1, 0),
(241, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 289, 1, '14.00', 1, 0, 1516091950, 0, '', 'a:0:{}', 0, 1, 1, 0),
(242, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 537, 1, '10.00', 1, 0, 1516091970, 0, '', 'a:0:{}', 0, 1, 1, 0),
(243, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 207, 1, '6.00', 1, 0, 1516091981, 0, '', 'a:0:{}', 0, 1, 1, 0),
(244, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 378, 1, '18.00', 1, 0, 1516092118, 0, '', 'a:0:{}', 0, 1, 1, 0),
(245, 6, 'xcx_ozAoi0Q30XFvi9pGju9tQqnPiiBE', 561, 1, '58.00', 1, 0, 1516092843, 0, '', 'a:0:{}', 0, 1, 1, 0),
(246, 6, 'xcx_ozAoi0WJ9M1kOCLWMDFPs9Xnp9DQ', 245, 1, '32.00', 0, 0, 1516095179, 0, '', 'a:0:{}', 0, 1, 1, 0),
(247, 6, 'xcx_ozAoi0WJ9M1kOCLWMDFPs9Xnp9DQ', 209, 1, '38.00', 0, 0, 1516095368, 0, '', 'a:0:{}', 0, 1, 1, 0),
(248, 6, 'xcx_ozAoi0WJ9M1kOCLWMDFPs9Xnp9DQ', 481, 1, '46.00', 0, 0, 1516095394, 0, '', 'a:0:{}', 0, 1, 1, 0),
(249, 6, 'xcx_ozAoi0WJ9M1kOCLWMDFPs9Xnp9DQ', 347, 1, '39.00', 0, 0, 1516095401, 0, '', 'a:0:{}', 0, 1, 1, 0),
(250, 6, 'xcx_ozAoi0WJ9M1kOCLWMDFPs9Xnp9DQ', 561, 1, '58.00', 0, 0, 1516095421, 0, '', 'a:0:{}', 0, 1, 1, 0),
(253, 6, 'xcx_ozAoi0dm147mAzUyyCGUdIJMLWVE', 481, 1, '46.00', 0, 0, 1516159232, 0, '', 'a:0:{}', 0, 1, 1, 0),
(255, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 522, 1, '68.00', 1, 0, 1516167365, 0, '', 'a:0:{}', 0, 1, 1, 0),
(256, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 561, 1, '58.00', 1, 0, 1516167883, 0, '', 'a:0:{}', 0, 1, 1, 0),
(257, 6, 'xcx_ozAoi0ZKkkj9_8M5D4cZRP4AfUmI', 226, 1, '5.00', 0, 0, 1516233037, 0, '', 'a:0:{}', 0, 1, 1, 0),
(263, 6, 'xcx_ozAoi0Taz78QVpdOMuvjRcWQMnNs', 288, 1, '1.00', 1, 0, 1516347719, 0, '', 'a:0:{}', 0, 1, 1, 0),
(262, 6, 'xcx_ozAoi0TFnm9Lzrbc4wq3jQauZxIo', 561, 2, '58.00', 0, 0, 1516343738, 0, '', 'a:0:{}', 0, 1, 1, 0),
(260, 6, 'xcx_ozAoi0Taz78QVpdOMuvjRcWQMnNs', 288, 1, '1.00', 1, 0, 1516245475, 0, '', 'a:0:{}', 0, 1, 1, 0),
(265, 6, 'xcx_ozAoi0Taz78QVpdOMuvjRcWQMnNs', 288, 1, '1.00', 1, 0, 1516432229, 0, '', 'a:0:{}', 0, 1, 1, 0),
(266, 6, 'xcx_ozAoi0QdRpaigxFR6YOTFi6ycMBw', 561, 1, '58.00', 0, 0, 1516435204, 0, '', 'a:0:{}', 0, 1, 1, 0),
(267, 6, 'xcx_ozAoi0Taz78QVpdOMuvjRcWQMnNs', 288, 1, '1.00', 1, 0, 1516589347, 0, '', 'a:0:{}', 0, 1, 1, 0),
(269, 6, 'xcx_ozAoi0ZyhGUZ1AXPe5hqWA1iK4k4', 219, 2, '6.00', 0, 0, 1516674659, 0, '', 'a:0:{}', 0, 1, 1, 0),
(270, 6, 'xcx_ozAoi0ZyhGUZ1AXPe5hqWA1iK4k4', 216, 2, '8.00', 0, 0, 1516674674, 0, '', 'a:0:{}', 0, 1, 1, 0),
(271, 6, 'xcx_ozAoi0SZEQnGY7yrQFLQ2w-TUpWg', 207, 2, '5.00', 0, 0, 1516676766, 0, '', 'a:0:{}', 0, 1, 1, 0),
(272, 6, 'xcx_ozAoi0Taz78QVpdOMuvjRcWQMnNs', 288, 1, '1.00', 1, 0, 1516678135, 0, '', 'a:0:{}', 0, 1, 1, 0),
(273, 6, 'xcx_ozAoi0akJd46aQgNsYQRlRb5KC_k', 282, 1, '18.00', 0, 0, 1516786325, 0, '', 'a:0:{}', 0, 1, 1, 0),
(274, 6, 'xcx_ozAoi0akJd46aQgNsYQRlRb5KC_k', 481, 1, '46.00', 0, 0, 1516786351, 0, '', 'a:0:{}', 0, 1, 1, 0),
(275, 6, 'xcx_ozAoi0akJd46aQgNsYQRlRb5KC_k', 216, 1, '8.00', 0, 0, 1516786389, 0, '', 'a:0:{}', 0, 1, 1, 0),
(276, 6, 'xcx_ozAoi0akJd46aQgNsYQRlRb5KC_k', 212, 1, '6.00', 0, 0, 1516786397, 0, '', 'a:0:{}', 0, 1, 1, 0),
(277, 6, 'xcx_ozAoi0akJd46aQgNsYQRlRb5KC_k', 264, 1, '18.00', 0, 0, 1516786432, 0, '', 'a:0:{}', 0, 1, 1, 0),
(279, 6, 'xcx_ozAoi0Taz78QVpdOMuvjRcWQMnNs', 288, 1, '1.00', 1, 0, 1516888643, 0, '', 'a:0:{}', 0, 1, 1, 0),
(280, 6, 'xcx_ozAoi0ZbHZMxYGm45YSnItIVqJ7g', 206, 2, '78.00', 0, 0, 1517025406, 0, '', 'a:0:{}', 0, 1, 1, 0),
(281, 6, 'xcx_ozAoi0ZbHZMxYGm45YSnItIVqJ7g', 347, 1, '39.00', 0, 0, 1517025450, 0, '', 'a:0:{}', 0, 1, 1, 0),
(282, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 221, 1, '5.00', 1, 0, 1517042054, 0, '', 'a:0:{}', 0, 1, 1, 0),
(283, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 213, 1, '10.00', 1, 0, 1517042063, 0, '', 'a:0:{}', 0, 1, 1, 0),
(284, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 207, 1, '5.00', 1, 0, 1517042076, 0, '', 'a:0:{}', 0, 1, 1, 0),
(286, 6, 'xcx_ozAoi0RLjA4VPVIJM3fZxioncz20', 213, 1, '10.00', 0, 0, 1517109313, 0, '', 'a:0:{}', 0, 1, 1, 0),
(287, 6, 'xcx_ozAoi0Uy4DEr7ddNtlNngVPPfP2Q', 206, 1, '78.00', 0, 0, 1517111878, 0, '', 'a:0:{}', 0, 1, 1, 0),
(288, 6, 'xcx_ozAoi0Uy4DEr7ddNtlNngVPPfP2Q', 347, 1, '39.00', 0, 0, 1517111886, 0, '', 'a:0:{}', 0, 1, 1, 0),
(297, 6, 'xcx_ozAoi0Ws_4R2JAx5_gcxMsIwtrCs', 545, 1, '48.00', 0, 0, 1517126940, 0, '', 'a:0:{}', 0, 1, 1, 0),
(311, 6, 'xcx_ozAoi0UG0eDFRlS2yDpHclcjzMh0', 292, 1, '10.00', 1, 0, 1517276098, 0, '', 'a:0:{}', 0, 1, 1, 0),
(291, 6, 'xcx_ozAoi0Uy4DEr7ddNtlNngVPPfP2Q', 491, 1, '25.00', 0, 0, 1517111999, 0, '', 'a:0:{}', 0, 1, 1, 0),
(292, 6, 'xcx_ozAoi0Uy4DEr7ddNtlNngVPPfP2Q', 226, 1, '5.00', 0, 0, 1517112167, 0, '', 'a:0:{}', 0, 1, 1, 0),
(293, 6, 'xcx_ozAoi0Uy4DEr7ddNtlNngVPPfP2Q', 225, 1, '5.00', 0, 0, 1517112170, 0, '', 'a:0:{}', 0, 1, 1, 0),
(294, 6, 'xcx_ozAoi0Uy4DEr7ddNtlNngVPPfP2Q', 218, 1, '6.00', 0, 0, 1517112175, 0, '', 'a:0:{}', 0, 1, 1, 0),
(295, 6, 'xcx_ozAoi0Uy4DEr7ddNtlNngVPPfP2Q', 215, 1, '6.00', 0, 0, 1517112186, 0, '', 'a:0:{}', 0, 1, 1, 0),
(299, 6, 'xcx_ozAoi0d1QsjGXu6K4Stu-7c_R1ZI', 561, 1, '58.00', 0, 0, 1517132898, 0, '', 'a:0:{}', 0, 1, 1, 0),
(301, 6, 'xcx_ozAoi0UG0eDFRlS2yDpHclcjzMh0', 226, 1, '5.00', 1, 0, 1517188250, 0, '', 'a:0:{}', 0, 1, 1, 0),
(302, 6, 'xcx_ozAoi0UG0eDFRlS2yDpHclcjzMh0', 225, 1, '5.00', 1, 0, 1517188289, 0, '', 'a:0:{}', 0, 1, 1, 0),
(303, 6, 'xcx_ozAoi0UG0eDFRlS2yDpHclcjzMh0', 207, 1, '5.00', 1, 0, 1517189047, 0, '', 'a:0:{}', 0, 1, 1, 0),
(304, 6, 'xcx_ozAoi0R78JP22-yoeQeoFGlzlC5g', 547, 1, '18.00', 0, 0, 1517218695, 0, '', 'a:0:{}', 0, 1, 1, 0),
(305, 6, 'xcx_ozAoi0R78JP22-yoeQeoFGlzlC5g', 545, 1, '48.00', 0, 0, 1517218698, 0, '', 'a:0:{}', 0, 1, 1, 0),
(306, 6, 'xcx_ozAoi0RLjA4VPVIJM3fZxioncz20', 221, 1, '5.00', 0, 0, 1517218956, 0, '', 'a:0:{}', 0, 1, 1, 0),
(309, 6, 'xcx_ozAoi0RLjA4VPVIJM3fZxioncz20', 292, 1, '10.00', 0, 0, 1517219049, 0, '', 'a:0:{}', 0, 1, 1, 0),
(310, 6, 'xcx_ozAoi0RLjA4VPVIJM3fZxioncz20', 266, 1, '29.00', 0, 0, 1517219058, 0, '', 'a:0:{}', 0, 1, 1, 0),
(312, 6, 'xcx_ozAoi0UG0eDFRlS2yDpHclcjzMh0', 215, 1, '6.00', 1, 0, 1517276135, 0, '', 'a:0:{}', 0, 1, 1, 0),
(313, 6, 'xcx_ozAoi0XCkvTbzHJVFSFoQel5krlE', 208, 1, '58.00', 0, 0, 1517285911, 0, '', 'a:0:{}', 0, 1, 1, 0),
(314, 6, 'xcx_ozAoi0XCkvTbzHJVFSFoQel5krlE', 207, 1, '5.00', 0, 0, 1517285921, 0, '', 'a:0:{}', 0, 1, 1, 0),
(315, 6, 'xcx_ozAoi0XCkvTbzHJVFSFoQel5krlE', 213, 1, '10.00', 0, 0, 1517285951, 0, '', 'a:0:{}', 0, 1, 1, 0),
(316, 6, 'xcx_ozAoi0XCkvTbzHJVFSFoQel5krlE', 561, 1, '58.00', 0, 0, 1517286044, 0, '', 'a:0:{}', 0, 1, 1, 0),
(317, 6, 'xcx_ozAoi0XCkvTbzHJVFSFoQel5krlE', 430, 1, '16.00', 0, 0, 1517286227, 0, '', 'a:0:{}', 0, 1, 1, 0),
(318, 6, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 288, 1, '1.00', 1, 0, 1517324349, 0, '', 'a:0:{}', 0, 1, 1, 0),
(319, 6, 'xcx_ozAoi0Q30XFvi9pGju9tQqnPiiBE', 561, 1, '58.00', 1, 0, 1517324519, 0, '', 'a:0:{}', 0, 1, 1, 0),
(320, 6, 'xcx_ozAoi0bxeV6OnJgeG0v1ZnShk2ms', 256, 1, '35.00', 0, 0, 1517573748, 0, '', 'a:0:{}', 0, 1, 1, 0),
(321, 6, 'xcx_ozAoi0bxeV6OnJgeG0v1ZnShk2ms', 207, 1, '5.00', 0, 0, 1517573770, 0, '', 'a:0:{}', 0, 1, 1, 0),
(322, 6, 'xcx_ozAoi0bxeV6OnJgeG0v1ZnShk2ms', 248, 1, '38.00', 0, 0, 1517573789, 0, '', 'a:0:{}', 0, 1, 1, 0),
(323, 6, 'xcx_ozAoi0bxeV6OnJgeG0v1ZnShk2ms', 544, 1, '35.00', 0, 0, 1517573834, 0, '', 'a:0:{}', 0, 1, 1, 0),
(324, 6, 'xcx_ozAoi0bxeV6OnJgeG0v1ZnShk2ms', 512, 1, '25.00', 0, 0, 1517573840, 0, '', 'a:0:{}', 0, 1, 1, 0),
(325, 6, 'xcx_ozAoi0bxeV6OnJgeG0v1ZnShk2ms', 332, 1, '25.00', 0, 0, 1517573854, 0, '', 'a:0:{}', 0, 1, 1, 0),
(326, 6, 'xcx_ozAoi0bxeV6OnJgeG0v1ZnShk2ms', 247, 1, '18.00', 0, 0, 1517573879, 0, '', 'a:0:{}', 0, 1, 1, 0),
(327, 6, 'xcx_ozAoi0bxeV6OnJgeG0v1ZnShk2ms', 244, 1, '58.00', 0, 0, 1517573884, 0, '', 'a:0:{}', 0, 1, 1, 0),
(328, 6, 'xcx_ozAoi0bxeV6OnJgeG0v1ZnShk2ms', 255, 1, '18.00', 0, 0, 1517573941, 0, '', 'a:0:{}', 0, 1, 1, 0),
(329, 6, 'xcx_ozAoi0bxeV6OnJgeG0v1ZnShk2ms', 254, 1, '18.00', 0, 0, 1517573946, 0, '', 'a:0:{}', 0, 1, 1, 0),
(330, 6, 'xcx_ozAoi0SRUURXLSGVQkBbiVfkQbsg', 207, 1, '5.00', 1, 0, 1517708771, 0, '', 'a:0:{}', 0, 1, 1, 0),
(336, 6, 'xcx_ozAoi0SRUURXLSGVQkBbiVfkQbsg', 214, 1, '8.00', 1, 0, 1517708837, 0, '', 'a:0:{}', 0, 1, 1, 0),
(334, 6, 'xcx_ozAoi0SRUURXLSGVQkBbiVfkQbsg', 213, 1, '10.00', 1, 0, 1517708828, 0, '', 'a:0:{}', 0, 1, 1, 0),
(337, 6, 'xcx_ozAoi0SRUURXLSGVQkBbiVfkQbsg', 216, 1, '8.00', 1, 0, 1517708849, 0, '', 'a:0:{}', 0, 1, 1, 0),
(340, 6, 'xcx_ozAoi0SRUURXLSGVQkBbiVfkQbsg', 221, 1, '5.00', 0, 0, 1517719937, 0, '', 'a:0:{}', 0, 1, 1, 0),
(341, 6, 'xcx_ozAoi0b7XpkCdqhNwaZeLNYqXuUM', 225, 1, '5.00', 0, 0, 1517821712, 0, '', 'a:0:{}', 0, 1, 1, 0),
(342, 6, 'xcx_ozAoi0SFFkyPlAJoH4NU_iE6hj6Q', 216, 2, '8.00', 0, 0, 1518058357, 0, '', 'a:0:{}', 0, 1, 1, 0),
(343, 6, 'xcx_ozAoi0SFFkyPlAJoH4NU_iE6hj6Q', 213, 1, '10.00', 0, 0, 1518058381, 0, '', 'a:0:{}', 0, 1, 1, 0),
(344, 6, 'xcx_ozAoi0SFFkyPlAJoH4NU_iE6hj6Q', 211, 2, '5.00', 0, 0, 1518058393, 0, '', 'a:0:{}', 0, 1, 1, 0),
(345, 6, 'xcx_ozAoi0SFFkyPlAJoH4NU_iE6hj6Q', 219, 1, '6.00', 0, 0, 1518058403, 0, '', 'a:0:{}', 0, 1, 1, 0),
(346, 6, 'xcx_ozAoi0SFFkyPlAJoH4NU_iE6hj6Q', 225, 1, '5.00', 0, 0, 1518058456, 0, '', 'a:0:{}', 0, 1, 1, 0),
(347, 6, 'xcx_ozAoi0SFFkyPlAJoH4NU_iE6hj6Q', 226, 1, '5.00', 0, 0, 1518058469, 0, '', 'a:0:{}', 0, 1, 1, 0),
(348, 6, 'xcx_ozAoi0SFFkyPlAJoH4NU_iE6hj6Q', 214, 2, '8.00', 0, 0, 1518058530, 0, '', 'a:0:{}', 0, 1, 1, 0),
(351, 6, 'xcx_ozAoi0b7XpkCdqhNwaZeLNYqXuUM', 262, 1, '12.00', 0, 0, 1518166900, 0, '', 'a:0:{}', 0, 1, 1, 0),
(350, 6, 'xcx_ozAoi0T2Lx2nBb-OhrtnmdUAhOnk', 248, 1, '38.00', 0, 0, 1518142067, 0, '', 'a:0:{}', 0, 1, 1, 0),
(352, 6, 'xcx_ozAoi0b7XpkCdqhNwaZeLNYqXuUM', 264, 1, '18.00', 0, 0, 1518166904, 0, '', 'a:0:{}', 0, 1, 1, 0),
(353, 6, 'xcx_ozAoi0b7XpkCdqhNwaZeLNYqXuUM', 212, 1, '6.00', 0, 0, 1518166918, 0, '', 'a:0:{}', 0, 1, 1, 0),
(354, 6, 'xcx_ozAoi0b7XpkCdqhNwaZeLNYqXuUM', 216, 1, '8.00', 0, 0, 1518166971, 0, '', 'a:0:{}', 0, 1, 1, 0),
(355, 6, 'xcx_ozAoi0cG0SWk91TUiusbIDjctMOc', 543, 1, '39.00', 0, 0, 1518233656, 0, '', 'a:0:{}', 0, 1, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_member_favorite`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_member_favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `goodsid` int(10) DEFAULT '0',
  `openid` varchar(50) DEFAULT '',
  `deleted` tinyint(1) DEFAULT '0',
  `createtime` int(11) DEFAULT '0',
  `merchid` int(11) DEFAULT '0',
  `type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_goodsid` (`goodsid`),
  KEY `idx_openid` (`openid`),
  KEY `idx_deleted` (`deleted`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- 转存表中的数据 `ims_ewei_shop_member_favorite`
--

INSERT INTO `ims_ewei_shop_member_favorite` (`id`, `uniacid`, `goodsid`, `openid`, `deleted`, `createtime`, `merchid`, `type`) VALUES
(26, 6, 209, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 1, 1511594348, 0, 0),
(27, 6, 209, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 0, 1511594658, 0, 0),
(28, 6, 209, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 1, 1511594897, 0, 0),
(29, 6, 209, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 0, 1511595042, 0, 0),
(30, 6, 206, 'xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic', 0, 1511598424, 0, 0),
(31, 6, 209, 'xcx_ozAoi0Z9Ajv7_5StU0cAcwa_74Nw', 0, 1513827408, 0, 0),
(32, 6, 209, 'xcx_ozAoi0f5iIj-zsHlAHlZF7m2hVYQ', 0, 1514876260, 0, 0),
(33, 6, 286, 'xcx_ozAoi0RNGhHXUIH0itDKM-ZNCLUI', 0, 1515045339, 0, 0),
(34, 6, 206, 'xcx_ozAoi0SIZb0piW6pEVrVRKBcesRQ', 0, 1515046269, 0, 0),
(35, 6, 209, 'xcx_ozAoi0RAciKU1DHmEqgWNqgYUUEU', 0, 1515156482, 0, 0),
(36, 6, 209, 'xcx_ozAoi0cD1sE0NcBFRpNNKsXL4gfo', 0, 1515171245, 0, 0),
(37, 6, 485, 'xcx_ozAoi0Y2HjUpLbzlbtNpLjA6fqic', 0, 1515404011, 0, 0),
(38, 6, 206, 'xcx_ozAoi0RNGhHXUIH0itDKM-ZNCLUI', 0, 1515414851, 0, 0),
(39, 6, 209, 'xcx_ozAoi0YLeUrVG-21nJK-A3jS0i9M', 0, 1515758936, 0, 0),
(40, 6, 248, 'xcx_ozAoi0fyDEZWPbPr26vOpT40wHKk', 0, 1515997909, 0, 0),
(41, 6, 347, 'xcx_ozAoi0Z5rZ0_pe8xb6OQtKL9Aq9s', 0, 1516065822, 0, 0),
(42, 6, 245, 'xcx_ozAoi0WJ9M1kOCLWMDFPs9Xnp9DQ', 0, 1516095191, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_member_group`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_member_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `groupname` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_member_history`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_member_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `goodsid` int(10) DEFAULT '0',
  `openid` varchar(50) DEFAULT '',
  `deleted` tinyint(1) DEFAULT '0',
  `createtime` int(11) DEFAULT '0',
  `times` int(11) DEFAULT '0',
  `merchid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_goodsid` (`goodsid`),
  KEY `idx_openid` (`openid`),
  KEY `idx_deleted` (`deleted`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2234 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_member_level`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_member_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `level` int(11) DEFAULT '0',
  `levelname` varchar(50) DEFAULT '',
  `ordermoney` decimal(10,2) DEFAULT '0.00',
  `ordercount` int(10) DEFAULT '0',
  `discount` decimal(10,2) DEFAULT '0.00',
  `enabled` tinyint(3) DEFAULT '0',
  `enabledadd` tinyint(1) DEFAULT '0',
  `buygoods` tinyint(1) NOT NULL DEFAULT '0',
  `goodsids` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_member_log`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_member_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `type` tinyint(3) DEFAULT NULL,
  `logno` varchar(255) DEFAULT '',
  `title` varchar(255) DEFAULT '',
  `createtime` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `money` decimal(10,2) DEFAULT '0.00',
  `rechargetype` varchar(255) DEFAULT '',
  `payment` varchar(20) NOT NULL,
  `gives` decimal(10,2) DEFAULT NULL,
  `couponid` int(11) DEFAULT '0',
  `transid` varchar(255) DEFAULT '',
  `realmoney` decimal(10,2) DEFAULT '0.00',
  `charge` decimal(10,2) DEFAULT '0.00',
  `deductionmoney` decimal(10,2) DEFAULT '0.00',
  `isborrow` tinyint(3) DEFAULT '0',
  `borrowopenid` varchar(100) DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `apppay` tinyint(3) NOT NULL DEFAULT '0',
  `alipay` varchar(50) NOT NULL DEFAULT '',
  `bankname` varchar(50) NOT NULL DEFAULT '',
  `bankcard` varchar(50) NOT NULL DEFAULT '',
  `realname` varchar(50) NOT NULL DEFAULT '',
  `applytype` tinyint(3) NOT NULL DEFAULT '0',
  `sendmoney` decimal(10,2) DEFAULT '0.00',
  `senddata` text,
  `is_commission` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_openid` (`openid`),
  KEY `idx_type` (`type`),
  KEY `idx_createtime` (`createtime`),
  KEY `idx_status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_member_mergelog`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_member_mergelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `mergetime` int(11) NOT NULL DEFAULT '0',
  `openid_a` varchar(30) NOT NULL,
  `openid_b` varchar(30) NOT NULL,
  `mid_a` int(11) NOT NULL,
  `mid_b` int(11) NOT NULL,
  `detail_a` text,
  `detail_b` text,
  `detail_c` text,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`) USING BTREE,
  KEY `idx_mid_a` (`mid_a`) USING BTREE,
  KEY `idx_mid_b` (`mid_b`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_member_message_template`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_member_message_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `template_id` varchar(255) DEFAULT '',
  `first` text NOT NULL,
  `firstcolor` varchar(255) DEFAULT '',
  `data` text NOT NULL,
  `remark` text NOT NULL,
  `remarkcolor` varchar(255) DEFAULT '',
  `url` varchar(255) NOT NULL,
  `createtime` int(11) DEFAULT '0',
  `sendtimes` int(11) DEFAULT '0',
  `sendcount` int(11) DEFAULT '0',
  `typecode` varchar(30) DEFAULT '',
  `messagetype` tinyint(1) DEFAULT '0',
  `send_desc` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_member_message_template_default`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_member_message_template_default` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typecode` varchar(255) DEFAULT NULL,
  `uniacid` int(11) DEFAULT NULL,
  `templateid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_member_message_template_type`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_member_message_template_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `typecode` varchar(255) DEFAULT NULL,
  `templatecode` varchar(255) DEFAULT NULL,
  `templateid` varchar(255) DEFAULT NULL,
  `templatename` varchar(255) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `showtotaladd` tinyint(1) DEFAULT '0',
  `typegroup` varchar(255) DEFAULT '',
  `groupname` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `ims_ewei_shop_member_message_template_type`
--

INSERT INTO `ims_ewei_shop_member_message_template_type` (`id`, `name`, `typecode`, `templatecode`, `templateid`, `templatename`, `content`, `showtotaladd`, `typegroup`, `groupname`) VALUES
(1, '订单付款通知', 'saler_pay', 'OPENTM405584202', 'xldHFTObiLLm7AK544PzW4bFJGgbS0o8Po4cXOgYEis', '订单付款通知', '{{first.DATA}}订单编号：{{keyword1.DATA}}商品名称：{{keyword2.DATA}}商品数量：{{keyword3.DATA}}支付金额：{{keyword4.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知'),
(2, '自提订单提交成功通知', 'carrier', 'OPENTM201594720', 'W6-XbT9l2Wb9FUUISss9yVZdPU8iEmEes9IZfvNZnbc', '订单付款通知', '{{first.DATA}}自提码：{{keyword1.DATA}}商品详情：{{keyword2.DATA}}提货地址：{{keyword3.DATA}}提货时间：{{keyword4.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知'),
(3, '订单取消通知', 'cancel', 'OPENTM201764653', 'EA6fL2052fvAs7F9w0Dx_UGbVuXmDFqLcrdT4IukWEY', '订单关闭提醒', '{{first.DATA}}订单商品：{{keyword1.DATA}}订单编号：{{keyword2.DATA}}下单时间：{{keyword3.DATA}}订单金额：{{keyword4.DATA}}关闭时间：{{keyword5.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知'),
(4, '订单即将取消通知', 'willcancel', 'OPENTM201764653', 'EA6fL2052fvAs7F9w0Dx_UGbVuXmDFqLcrdT4IukWEY', '订单关闭提醒', '{{first.DATA}}订单商品：{{keyword1.DATA}}订单编号：{{keyword2.DATA}}下单时间：{{keyword3.DATA}}订单金额：{{keyword4.DATA}}关闭时间：{{keyword5.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知'),
(5, '订单支付成功通知', 'pay', 'OPENTM405584202', 'xldHFTObiLLm7AK544PzW4bFJGgbS0o8Po4cXOgYEis', '订单支付通知', '{{first.DATA}}订单编号：{{keyword1.DATA}}商品名称：{{keyword2.DATA}}商品数量：{{keyword3.DATA}}支付金额：{{keyword4.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知'),
(6, '订单发货通知', 'send', 'OPENTM401874827', 'c0Db6XJBYJ0PcdDyDR5YsoGKy6zfvnQrNM97Ml2hBt4', '订单发货通知', '{{first.DATA}}订单编号：{{keyword1.DATA}}快递公司：{{keyword2.DATA}}快递单号：{{keyword3.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知'),
(7, '自动发货通知(虚拟物品及卡密)', 'virtualsend', 'OPENTM207793687', 'c2kQ5Pf7QkBUXhAVQRGpRusO1BS2uu_IBjPlIZ7IbYo', '自动发货通知', '{{first.DATA}}商品名称：{{keyword1.DATA}}订单号：{{keyword2.DATA}}订单金额：{{keyword3.DATA}}卡密信息：{{keyword4.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知'),
(8, '订单状态更新(修改收货地址)(修改价格)', 'orderstatus', 'TM00017', 'v6w5z7I8FMki08ndnGnfHSyx46eyYq9m_cIZUcvwCgU', '订单付款通知', '{{first.DATA}}订单编号: {{OrderSn.DATA}}订单状态: {{OrderStatus.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知'),
(9, '退款成功通知', 'refund1', 'TM00430', 'ez-VqnyVFEX6msJfoegrwMK2qZ6Va02sbOWvaHIMFNw', '退款成功通知', '{{first.DATA}}退款金额：{{orderProductPrice.DATA}}商品详情：{{orderProductName.DATA}}订单编号：{{orderName.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知'),
(10, '换货成功通知', 'refund3', 'OPENTM200605630', 'uS1mhnM85BtUum0s5xmlfEhnDGupvYqUkjK0A5o0sb8', '任务处理通知', '{{first.DATA}}任务名称：{{keyword1.DATA}}通知类型：{{keyword2.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知'),
(11, '退款申请驳回通知', 'refund2', 'OPENTM200605630', 'uS1mhnM85BtUum0s5xmlfEhnDGupvYqUkjK0A5o0sb8', '任务处理通知', '{{first.DATA}}任务名称：{{keyword1.DATA}}通知类型：{{keyword2.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知'),
(12, '充值成功通知', 'recharge_ok', 'OPENTM207727673', 'PWycmpCcbBEOuB99kZK6Lb_S_Ve6rZoigooR8lHtRHk', '充值成功提醒', '{{first.DATA}}充值金额：{{keyword1.DATA}}充值时间：{{keyword2.DATA}}账户余额：{{keyword3.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知'),
(13, '提现成功通知', 'withdraw_ok', 'OPENTM207422808', 'dpgcRnw1OrF_Beo7kgkK_0ThxcEY3nxpGHUPZ9Q4Yt0', '提现通知', '{{first.DATA}}申请提现金额：{{keyword1.DATA}}取提现手续费：{{keyword2.DATA}}实际到账金额：{{keyword3.DATA}}提现渠道：{{keyword4.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知'),
(14, '会员升级通知(任务处理通知)', 'upgrade', 'OPENTM200605630', 'UhLLmFRFoJB21zWe8Ue6s2Wbs6-hwAIcywjXFPEgAfk', '任务处理通知', '{{first.DATA}}任务名称：{{keyword1.DATA}}通知类型：{{keyword2.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知'),
(15, '充值成功通知（后台管理员手动）', 'backrecharge_ok', 'OPENTM207727673', '8cH0W4PS46ttwb0NKaOsWlZXzp68pFkvhmz8Cx1TFYI', '充值成功提醒', '{{first.DATA}}充值金额：{{keyword1.DATA}}充值时间：{{keyword2.DATA}}账户余额：{{keyword3.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知'),
(16, '积分变动提醒', 'backpoint_ok', 'OPENTM207509450', 't4X8tcZsZRfiLaxvlZSd9QTgmQTZRpy110DgoJeu4DU', '积分变动提醒', '{{first.DATA}}获得时间：{{keyword1.DATA}}获得积分：{{keyword2.DATA}}获得原因：{{keyword3.DATA}}当前积分：{{keyword4.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知'),
(17, '换货发货通知', 'refund4', 'OPENTM401874827', 'c0Db6XJBYJ0PcdDyDR5YsoGKy6zfvnQrNM97Ml2hBt4', '订单发货通知', '{{first.DATA}}订单编号：{{keyword1.DATA}}快递公司：{{keyword2.DATA}}快递单号：{{keyword3.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知'),
(18, '砍价活动通知', 'bargain_message', 'OPENTM200605630', NULL, '任务处理通知', '{{first.DATA}}任务名称：{{keyword1.DATA}}通知类型：{{keyword2.DATA}}{{remark.DATA}}', 0, 'bargain', '砍价消息通知'),
(19, '拼团活动通知', 'groups', NULL, NULL, NULL, NULL, 0, 'groups', '拼团消息通知'),
(20, '人人分销通知', 'commission', NULL, NULL, NULL, NULL, 0, 'commission', '分销消息通知'),
(21, '商品付款通知', 'saler_goodpay', 'OPENTM200605630', '', '任务处理通知', '{{first.DATA}}任务名称：{{keyword1.DATA}}通知类型：{{keyword2.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知'),
(22, '砍到底价通知', 'bargain_fprice', 'OPENTM200605630', '', '任务处理通知', '{{first.DATA}}任务名称：{{keyword1.DATA}}通知类型：{{keyword2.DATA}}{{remark.DATA}}', 0, 'bargain', '砍价消息通知'),
(23, '订单收货通知(卖家)', 'saler_finish', 'OPENTM200605630', '', '任务处理通知', '{{first.DATA}}任务名称：{{keyword1.DATA}}通知类型：{{keyword2.DATA}}{{remark.DATA}}', 0, 'sys', '系统消息通知'),
(24, '余额兑换成功通知', 'exchange_balance', 'OPENTM207727673', '', '充值成功提醒', '{{first.DATA}}充值金额：{{keyword1.DATA}}充值时间：{{keyword2.DATA}}账户余额：{{keyword3.DATA}}{{remark.DATA}}', 0, 'exchange', '兑换中心消息通知'),
(25, '积分兑换成功通知', 'exchange_score', 'OPENTM207509450', '', '积分变动提醒', '{{first.DATA}}获得时间：{{keyword1.DATA}}获得积分：{{keyword2.DATA}}获得原因：{{keyword3.DATA}}当前积分：{{keyword4.DATA}}{{remark.DATA}}', 0, 'exchange', '兑换中心消息通知'),
(26, '兑换中心余额充值通知', 'exchange_recharge', 'OPENTM207727673', '', '充值成功提醒', '{{first.DATA}}充值金额：{{keyword1.DATA}}充值时间：{{keyword2.DATA}}账户余额：{{keyword3.DATA}}{{remark.DATA}}', 0, 'exchange', '兑换中心消息通知');

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_member_offline`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_member_offline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `type` tinyint(3) DEFAULT NULL,
  `logno` varchar(255) DEFAULT '',
  `title` varchar(255) DEFAULT '',
  `createtime` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `money` decimal(10,2) DEFAULT '0.00',
  `payment` varchar(20) NOT NULL,
  `remark` varchar(255) NOT NULL DEFAULT '',
  `is_commission` int(1) NOT NULL DEFAULT '0',
  `commission` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_openid` (`openid`),
  KEY `idx_type` (`type`),
  KEY `idx_createtime` (`createtime`),
  KEY `idx_status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=83 ;

--
-- 转存表中的数据 `ims_ewei_shop_member_offline`
--

INSERT INTO `ims_ewei_shop_member_offline` (`id`, `uniacid`, `openid`, `type`, `logno`, `title`, `createtime`, `status`, `money`, `payment`, `remark`, `is_commission`, `commission`) VALUES
(1, 6, 'xcx_ozAoi0fexXDGfeQOxBE5BMGISodw', NULL, 'RC20180117132548427474', '线下消费', 1516166748, 1, '128.00', 'alipay', '', 1, '[]'),
(2, 6, 'xcx_ozAoi0fexXDGfeQOxBE5BMGISodw', NULL, 'RC20180117132630463624', '线下消费', 1516166790, 1, '100.00', '0', '', 1, '[5]'),
(3, 6, 'xcx_ozAoi0T3-us_I_F6OnYElSGTxnmQ', NULL, 'RC20180117142748688086', '线下消费', 1516170467, 1, '128.00', 'alipay', '', 1, '[]'),
(4, 6, 'xcx_ozAoi0T3-us_I_F6OnYElSGTxnmQ', NULL, 'RC20180117142943272447', '线下消费', 1516170583, 1, '100.00', 'alipay', '', 1, '[5]'),
(5, 6, 'sys_a36d0b0e82ddfa808009917b1bf0c058', NULL, 'RC20180117203809693166', '线下消费', 1516192689, 1, '170.00', '0', '', 1, '[]'),
(6, 6, 'sys_b8fa8759846c5b7708fd74d5a04ec843', NULL, 'RC20180118121848878659', '线下消费', 1516249128, 1, '50.00', 'alipay', '', 1, '[2.5]'),
(7, 6, 'xcx_ozAoi0R9keZSPXV6x9KAuI03ZzeA', NULL, 'RC20180119193130454808', '线下消费', 1516361490, 1, '94.00', '0', '', 1, '[]'),
(8, 6, 'sys_f8fc1d6064e7af3f701860767a37afa7', NULL, 'RC20180119200702884972', '线下消费', 1516363622, 1, '173.00', '0', '', 1, '[8.65]'),
(9, 6, 'sys_a5daf45ed1cf609f9ed7d0b48662f00e', NULL, 'RC20180120111852009226', '线下消费', 1516418332, 1, '633.00', '0', '', 1, '[31.65]'),
(10, 6, 'sys_6f9c8b9b5f5bbfd4a009d3e20eedf1d2', NULL, 'RC20180120122128816406', '线下消费', 1516422088, 1, '38.00', 'bankcard', '', 1, '[1.9]'),
(11, 6, 'sys_e91d92e420c1b8615147d2c86e2c07ec', NULL, 'RC20180120123040202198', '线下消费', 1516422639, 1, '282.00', 'cash', '', 1, '[14.1]'),
(12, 6, 'sys_d1109aa4b5b6155738c72766adbf908f', NULL, 'RC20180120134912758454', '线下消费', 1516427351, 1, '210.00', 'wechat', '', 1, '[10.5]'),
(13, 6, 'sys_6f9c8b9b5f5bbfd4a009d3e20eedf1d2', NULL, 'RC20180120142926256168', '线下消费', 1516429766, 1, '173.00', 'bankcard', '', 1, '[8.65]'),
(14, 6, 'xcx_ozAoi0R9keZSPXV6x9KAuI03ZzeA', NULL, 'RC20180121112659281683', '线下消费', 1516505219, 1, '79.00', '0', '', 1, '[]'),
(15, 6, 'xcx_ozAoi0biBfZKyCVgAJiYkfzLwtk4', NULL, 'RC20180121172829885238', '线下消费', 1516526909, 1, '45.00', '0', '', 1, '[]'),
(16, 6, 'sys_18a44ac9b185d560fc7d7ddbc0b4e1cb', NULL, 'RC20180121201452434471', '线下消费', 1516536892, 1, '448.00', 'cash', '', 1, '[22.4]'),
(17, 6, 'xcx_ozAoi0XIzaY7k85AiA0RVEbMfaDg', NULL, 'RC20180121202602441242', '线下消费', 1516537561, 1, '143.00', '0', '', 1, '[]'),
(18, 6, 'sys_241acc074a51f2d502cb3271dcbae3f4', NULL, 'RC20180122112646908788', '线下消费', 1516591606, 1, '56.00', 'cash', '', 1, '[2.8]'),
(19, 6, 'sys_0a846eb991a259f1628bf82f259a7bc1', NULL, 'RC20180122153005469029', '线下消费', 1516606205, 1, '257.00', 'bankcard', '', 1, '[12.85]'),
(20, 6, 'sys_92ed9f46058ae6d079ad1313a2d82e27', NULL, 'RC20180122185508646651', '线下消费', 1516618508, 1, '229.00', '0', '', 1, '[]'),
(21, 6, 'sys_292f9ed507cb9aba81dd2b211d9c809d', NULL, 'RC20180123192325442762', '线下消费', 1516706605, 1, '353.00', '0', '', 1, '[17.65]'),
(22, 6, 'sys_709f54b007174fb80b012fda3e7d4e4e', NULL, 'RC20180123212330354848', '线下消费', 1516713810, 1, '144.00', '0', '', 1, '[7.2]'),
(23, 6, 'sys_2fdb91d026570c7dc3828cc178b9fd62', NULL, 'RC20180124112631062844', '线下消费', 1516764391, 1, '184.00', 'cash', '', 1, '[9.2]'),
(24, 6, 'sys_4251dacfc3d3f14d8535eca153ca4369', NULL, 'RC20180126201054033880', '线下消费', 1516968654, 1, '399.00', '0', '', 1, '[19.95]'),
(25, 6, 'sys_224225290ceda24f6bf1e4a7429b42ed', NULL, 'RC20180129112135204129', '线下消费', 1517196095, 1, '673.00', 'cash', '', 1, '[33.65]'),
(26, 6, 'sys_86724f625b947e9944259b6c34ae2aba', NULL, 'RC20180129120410221248', '线下消费', 1517198650, 1, '8.00', 'wechat', '', 1, '[0.4]'),
(27, 6, 'sys_224225290ceda24f6bf1e4a7429b42ed', NULL, 'RC20180129125434896866', '线下消费', 1517201674, 1, '345.00', '0', '', 1, '[17.25]'),
(28, 6, 'sys_6796b40c7dc262799a83e6b20a75664c', NULL, 'RC20180129193807228441', '线下消费', 1517225887, 1, '188.00', '0', '', 1, '[9.4]'),
(29, 6, 'sys_83d0126d1b75d3ab0d98eff4b5dc73ed', NULL, 'RC20180130140822204923', '线下消费', 1517292502, 1, '500.00', 'cash', '', 1, '[25]'),
(30, 6, 'sys_b8fa8759846c5b7708fd74d5a04ec843', NULL, 'RC20180131124038255289', '线下消费', 1517373637, 1, '12.00', 'wechat', '', 1, '[0.6]'),
(31, 6, 'sys_e55499de1a76c427951f9937d3ad4887', NULL, 'RC20180131124750824905', '线下消费', 1517374070, 1, '119.00', 'alipay', '', 1, '[5.95]'),
(32, 6, 'sys_42706eeb709a965ea5e1eab9437fcec3', NULL, 'RC20180131135439972446', '线下消费', 1517378079, 1, '312.00', '0', '', 1, '[15.6]'),
(33, 6, 'sys_7fd1c996de1c118240849804553063a2', NULL, 'RC20180131173848494496', '线下消费', 1517391528, 1, '30.00', 'cash', '', 1, '[1.5]'),
(34, 6, 'xcx_ozAoi0cWBdd3uOoKKxldkJ665Ko0', NULL, 'RC20180131175134446617', '线下消费', 1517392294, 1, '941.00', '0', '', 1, '[]'),
(35, 6, 'xcx_ozAoi0cWBdd3uOoKKxldkJ665Ko0', NULL, 'RC20180131175254412223', '线下消费', 1517392373, 1, '941.00', '0', '', 1, '[47.05]'),
(36, 6, 'xcx_ozAoi0cWBdd3uOoKKxldkJ665Ko0', NULL, 'RC20180131182644848566', '线下消费', 1517394404, 1, '68.00', 'alipay', '', 1, '[3.4]'),
(37, 6, 'sys_9dd170694ea3e3e7364d8b933cdedc11', NULL, 'RC20180131190612688421', '线下消费', 1517396772, 1, '87.00', '0', '', 1, '[4.35]'),
(38, 6, 'sys_8bba8a691291579b02535ec01bacbee6', NULL, 'RC20180131193352670269', '线下消费', 1517398432, 1, '403.00', '0', '', 1, '[20.15]'),
(39, 6, 'sys_1218093cffbe6c9c99495ff17104a3db', NULL, 'RC20180131195314591018', '线下消费', 1517399594, 1, '365.00', '0', '', 1, '[18.25]'),
(40, 6, 'sys_936dacb2d050eca7db7efbf526f39f15', NULL, 'RC20180131212022222243', '线下消费', 1517404822, 1, '400.00', '0', '', 1, '[20]'),
(41, 6, 'sys_dec4851c1bf1f9ccfa0d7289a00c8f3d', NULL, 'RC20180201124912633184', '线下消费', 1517460552, 1, '80.00', '0', '', 1, '[4]'),
(42, 6, 'sys_389abbfae95ceaba33f2f655ea18f89e', NULL, 'RC20180201130918844363', '线下消费', 1517461758, 1, '288.00', 'cash', '', 1, '[14.4]'),
(43, 6, 'sys_547de599071c5770c4bbe994f2b0fac6', NULL, 'RC20180201133414584678', '线下消费', 1517463254, 1, '212.00', '0', '', 1, '[10.6]'),
(44, 6, 'sys_687749503e1c1a1d97488bec30709f2c', NULL, 'RC20180201194344272408', '线下消费', 1517485423, 1, '339.00', 'wechat', '', 1, '[16.95]'),
(45, 6, 'sys_7fd1c996de1c118240849804553063a2', NULL, 'RC20180202120101324558', '线下消费', 1517544061, 1, '35.00', 'cash', '', 1, '[1.75]'),
(46, 6, 'sys_395ca315224c8c5341889bb98f981583', NULL, 'RC20180202132713602665', '线下消费', 1517549233, 1, '141.00', 'alipay', '', 1, '[7.05]'),
(47, 6, 'sys_4e3cfdcb60b5b2600222a66173592ea0', NULL, 'RC20180202185239838203', '线下消费', 1517568759, 1, '60.00', 'cash', '', 1, '[3]'),
(48, 6, 'sys_83d0126d1b75d3ab0d98eff4b5dc73ed', NULL, 'RC20180203143314234768', '线下消费', 1517639594, 1, '770.00', '0', '', 1, '[38.5]'),
(49, 6, 'sys_5c35283a4a8b9d21458c8badabdabecc', NULL, 'RC20180203201446654406', '线下消费', 1517660086, 1, '187.00', '0', '', 1, '[9.35]'),
(50, 6, 'sys_defb1717b719fd91459ceb066028ac57', NULL, 'RC20180204194312482123', '线下消费', 1517744592, 1, '124.00', 'cash', '', 1, '[6.2]'),
(51, 6, 'sys_5cd00b70d206b236dbdd6fc69f4f31fa', NULL, 'RC20180204212629149586', '线下消费', 1517750789, 1, '477.00', 'bankcard', '', 1, '[23.85]'),
(52, 6, 'sys_98a294e69841d41ed87e001909664e4f', NULL, 'RC20180205175809644288', '线下消费', 1517824689, 1, '122.00', 'bankcard', '', 1, '[6.1]'),
(53, 6, 'sys_a102fb69dabc438f017a5ff067b2270a', NULL, 'RC20180205194513242884', '线下消费', 1517831113, 1, '264.00', '0', '', 1, '[13.2]'),
(54, 6, 'sys_4f8501fc413b36cc7a779ec08939454e', NULL, 'RC20180205211302286543', '线下消费', 1517836382, 1, '520.00', '0', '', 1, '[26]'),
(55, 6, 'sys_0ef08ce48579049dfd0d49b57ee89a03', NULL, 'RC20180206185955646200', '线下消费', 1517914795, 1, '636.00', 'bankcard', '', 1, '[31.8]'),
(56, 6, 'sys_defb1717b719fd91459ceb066028ac57', NULL, 'RC20180206195940936481', '线下消费', 1517918380, 1, '175.00', 'cash', '', 1, '[8.75]'),
(57, 6, 'sys_1e3fb8fc2df533893ba3e9fdcaa51164', NULL, 'RC20180207214121629685', '线下消费', 1518010881, 1, '355.00', 'bankcard', '', 1, '[17.75]'),
(58, 6, 'sys_97a3b5001c94ef55dba9d719501e9d9d', NULL, 'RC20180208114622262404', '线下消费', 1518061582, 1, '178.00', 'cash', '', 1, '[8.9]'),
(59, 6, 'sys_f7dcdf18ec8d245266bec16842f9b4d9', NULL, 'RC20180208184145662122', '线下消费', 1518086505, 1, '61.00', 'wechat', '', 1, '[3.05]'),
(60, 6, 'sys_463ff77dead8d0e1967c3731b0d9b127', NULL, 'RC20180208193006449445', '线下消费', 1518089406, 1, '199.00', 'bankcard', '', 1, '[9.95]'),
(61, 6, 'sys_ef1056e3a2a2698b0fce6a91a581ea3e', NULL, 'RC20180208201052634089', '线下消费', 1518091852, 1, '319.00', 'wechat', '', 1, '[15.95]'),
(62, 6, 'sys_f50ca0ce71b22d65871c0957bc9d4f1d', NULL, 'RC20180209115057161980', '线下消费', 1518148257, 1, '221.00', 'alipay', '', 1, '[11.05]'),
(63, 6, 'sys_df3fb4b2dff9594779ec0580a7ba9c5e', NULL, 'RC20180209125159982423', '线下消费', 1518151919, 1, '210.00', 'cash', '', 1, '[]'),
(64, 6, 'sys_fb70f40ddd0a5febbd6440e21995d142', NULL, 'RC20180209125425664475', '线下消费', 1518152065, 1, '387.00', 'cash', '', 1, '[19.35]'),
(65, 6, 'sys_08e3c6fed32ed887a703098381272227', NULL, 'RC20180209125513893022', '线下消费', 1518152113, 1, '117.00', 'alipay', '', 1, '[5.85]'),
(66, 6, 'sys_4251dacfc3d3f14d8535eca153ca4369', NULL, 'RC20180209200234323563', '线下消费', 1518177754, 1, '526.00', 'alipay', '', 1, '[26.3]'),
(67, 6, 'sys_defb1717b719fd91459ceb066028ac57', NULL, 'RC20180210132618796830', '线下消费', 1518240378, 1, '176.00', 'cash', '', 1, '[8.8]'),
(68, 6, 'sys_4f70a42d0a3b1222ca8f02b8321454a4', NULL, 'RC20180210133601524445', '线下消费', 1518240961, 1, '142.00', 'alipay', '', 1, '[7.1]'),
(69, 6, 'sys_687749503e1c1a1d97488bec30709f2c', NULL, 'RC20180210182221848894', '线下消费', 1518258141, 1, '180.00', '0', '', 1, '[9]'),
(70, 6, 'sys_d16c62112caec56528f3f108faa093e6', NULL, 'RC20180210200609226938', '线下消费', 1518264369, 1, '295.00', 'alipay', '', 1, '[14.75]'),
(71, 6, 'sys_22f456b853b287eefcfbedcae6d113fe', NULL, 'RC20180211113856576746', '线下消费', 1518320336, 1, '165.00', 'wechat', '', 1, '[8.25]'),
(72, 6, 'sys_953e4d15d844fbbee125b0d9c529e252', NULL, 'RC20180211121927286202', '线下消费', 1518322767, 1, '50.00', '0', '', 1, '[2.5]'),
(73, 6, 'sys_3c0114bc8f59bf2812e1f11a7ea08df6', NULL, 'RC20180211195646502924', '线下消费', 1518350206, 1, '288.00', 'alipay', '', 1, '[14.4]'),
(74, 6, 'sys_8bba8a691291579b02535ec01bacbee6', NULL, 'RC20180212134226422429', '线下消费', 1518414146, 1, '661.00', 'bankcard', '', 1, '[33.05]'),
(75, 6, 'sys_7591150d8b03fbea37624c5a8008738a', NULL, 'RC20180212144317983440', '线下消费', 1518417797, 1, '573.00', '0', '', 1, '[28.65]'),
(76, 6, 'sys_8ff9f6ac74c74f6b0e6d0c6866f5abb1', NULL, 'RC20180212174924680427', '线下消费', 1518428963, 1, '163.00', 'wechat', '', 1, '[8.15]'),
(77, 6, 'sys_4e3cfdcb60b5b2600222a66173592ea0', NULL, 'RC20180212190716812229', '线下消费', 1518433636, 1, '13.00', 'cash', '', 1, '[0.65]'),
(78, 6, 'sys_77ffb89074418bf00d3410dfded6220e', NULL, 'RC20180212193546883496', '线下消费', 1518435346, 1, '700.00', 'wechat', '', 1, '[35]'),
(79, 6, 'sys_173646e7a9ea960f7b587fb18ff22423', NULL, 'RC20180212202945386676', '线下消费', 1518438584, 1, '174.00', 'cash', '', 1, '[8.7]'),
(80, 6, 'sys_8df24fdc466dd4f0fd3e852583f51437', NULL, 'RC20180212204632128029', '线下消费', 1518439592, 1, '401.00', 'alipay', '', 1, '[20.05]'),
(81, 6, 'sys_1218093cffbe6c9c99495ff17104a3db', NULL, 'RC20180212212702226629', '线下消费', 1518442022, 1, '536.00', 'bankcard', '', 1, '[26.8]'),
(82, 6, 'sys_d8508dbfa7fb2255cfc8fa009ed89444', NULL, 'RC20180212214745127250', '线下消费', 1518443265, 1, '219.00', 'wechat', '', 1, '[10.95]');

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_member_printer`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_member_printer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `type` tinyint(3) DEFAULT '0',
  `print_data` text,
  `createtime` int(11) DEFAULT '0',
  `merchid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`) USING BTREE,
  KEY `idx_createtime` (`createtime`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ims_ewei_shop_member_printer`
--

INSERT INTO `ims_ewei_shop_member_printer` (`id`, `uniacid`, `title`, `type`, `print_data`, `createtime`, `merchid`) VALUES
(1, 6, '订单打印', 4, '{"printer_365":{"deviceNo":"","key":"","times":"1","url":"http:\\/\\/open.printcenter.cn:8080\\/addOrder"},"printer_feie":{"deviceNo":"","key":"","times":"","url":""},"printer_yilianyun":{"machine_code":"","msign":"","partner":"","apikey":"","url":"http:\\/\\/open.10ss.net:8888","times":""},"printer_yilianyun_new":{"machine_code":"4004552340","msign":"jcyv6wdjrpnf","partner":"19854","apikey":"49b0288274aaa97f2a0cfc15aed907d5e34373f1","url":"http:\\/\\/open.10ss.net:8888","times":"1"},"printer_365_s1":{"deviceNo":"","key":"","times":"","url":"http:\\/\\/open.printcenter.cn:8080\\/addOrder"}}', 1515060061, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_member_printer_template`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_member_printer_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `type` tinyint(3) DEFAULT '0',
  `print_title` varchar(255) DEFAULT '',
  `print_style` varchar(255) DEFAULT '',
  `print_data` text,
  `code` varchar(500) DEFAULT '',
  `qrcode` varchar(500) DEFAULT '',
  `createtime` int(11) DEFAULT '0',
  `merchid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`) USING BTREE,
  KEY `idx_createtime` (`createtime`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ims_ewei_shop_member_printer_template`
--

INSERT INTO `ims_ewei_shop_member_printer_template` (`id`, `uniacid`, `title`, `type`, `print_title`, `print_style`, `print_data`, `code`, `qrcode`, `createtime`, `merchid`) VALUES
(1, 6, '订单', 0, '青岛海鲜锅贴', '菜品:16|单价:6|数量:5|金额:5', '{"key":["[\\u5546\\u54c1\\u540d\\u79f0]|[\\u5546\\u54c1\\u4ef7\\u683c]|[\\u5546\\u54c1\\u6570\\u91cf]|[\\u5355\\u5546\\u54c1\\u5408\\u8ba1]","\\u8ba2\\u5355\\u7f16\\u53f7\\uff1a[\\u8ba2\\u5355\\u7f16\\u53f7]","\\u4e0b\\u5355\\u65f6\\u95f4\\uff1a[\\u8ba2\\u5355\\u65f6\\u95f4]","\\u8ba2\\u5355\\u91d1\\u989d\\uff1a[\\u8ba2\\u5355\\u91d1\\u989d]\\u5143","\\u8ba2\\u5355\\u72b6\\u6001\\uff1a[\\u8ba2\\u5355\\u72b6\\u6001]","\\u8ba2\\u9910\\u4eba\\uff1a[\\u6536\\u8d27\\u4eba][\\u6536\\u8d27\\u7535\\u8bdd]","\\u5907\\u6ce8\\uff1a[\\u5907\\u6ce8]","\\u95e8\\u5e97\\uff1a[\\u95e8\\u5e97\\u540d\\u79f0][\\u95e8\\u5e97\\u8054\\u7cfb\\u65b9\\u5f0f]"],"value":["0","0","0","0","0","0","0","0"]}', '0', '', 1515060015, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_member_rank`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_member_rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_merch_account`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_merch_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `merchid` int(11) DEFAULT '0',
  `username` varchar(255) DEFAULT '',
  `pwd` varchar(255) DEFAULT '',
  `salt` varchar(255) DEFAULT '',
  `status` tinyint(3) DEFAULT '0',
  `perms` text,
  `isfounder` tinyint(3) DEFAULT '0',
  `lastip` varchar(255) DEFAULT '',
  `lastvisit` varchar(255) DEFAULT '',
  `roleid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_merchid` (`merchid`),
  KEY `idx_status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=95 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_merch_adv`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_merch_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `advname` varchar(50) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `displayorder` int(11) DEFAULT NULL,
  `enabled` int(11) DEFAULT NULL,
  `merchid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_merchid` (`merchid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_merch_banner`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_merch_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `bannername` varchar(50) DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '0',
  `merchid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_enabled` (`enabled`),
  KEY `idx_displayorder` (`displayorder`),
  KEY `idx_merchid` (`merchid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_merch_bill`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_merch_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `applyno` varchar(255) NOT NULL DEFAULT '',
  `merchid` int(11) NOT NULL DEFAULT '0',
  `orderids` text NOT NULL,
  `realprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `realpricerate` decimal(10,2) NOT NULL DEFAULT '0.00',
  `finalprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payrateprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payrate` decimal(10,2) NOT NULL DEFAULT '0.00',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `applytime` int(11) NOT NULL DEFAULT '0',
  `checktime` int(11) NOT NULL DEFAULT '0',
  `paytime` int(11) NOT NULL DEFAULT '0',
  `invalidtime` int(11) NOT NULL DEFAULT '0',
  `refusetime` int(11) NOT NULL DEFAULT '0',
  `remark` text NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `ordernum` int(11) NOT NULL DEFAULT '0',
  `orderprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `passrealprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `passrealpricerate` decimal(10,2) NOT NULL DEFAULT '0.00',
  `passorderids` text NOT NULL,
  `passordernum` int(11) NOT NULL DEFAULT '0',
  `passorderprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `alipay` varchar(50) NOT NULL DEFAULT '',
  `bankname` varchar(50) NOT NULL DEFAULT '',
  `bankcard` varchar(50) NOT NULL DEFAULT '',
  `applyrealname` varchar(50) NOT NULL DEFAULT '',
  `applytype` tinyint(3) NOT NULL DEFAULT '0',
  `handpay` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_merchid` (`merchid`),
  KEY `idx_status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_merch_billo`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_merch_billo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `billid` int(11) NOT NULL DEFAULT '0',
  `orderid` int(11) NOT NULL DEFAULT '0',
  `ordermoney` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=54 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_merch_category`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_merch_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `catename` varchar(255) DEFAULT '',
  `createtime` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  `thumb` varchar(500) DEFAULT '',
  `isrecommand` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_merch_category_swipe`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_merch_category_swipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `createtime` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  `thumb` varchar(500) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_merch_clearing`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_merch_clearing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `merchid` int(11) NOT NULL DEFAULT '0',
  `clearno` varchar(64) NOT NULL DEFAULT '',
  `goodsprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `dispatchprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `deductprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `deductcredit2` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discountprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `deductenough` decimal(10,2) NOT NULL DEFAULT '0.00',
  `merchdeductenough` decimal(10,2) NOT NULL DEFAULT '0.00',
  `isdiscountprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `realprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `realpricerate` decimal(10,2) NOT NULL DEFAULT '0.00',
  `finalprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `remark` varchar(2000) NOT NULL DEFAULT '',
  `paytime` int(11) NOT NULL DEFAULT '0',
  `payrate` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `merchid` (`merchid`),
  KEY `starttime` (`starttime`),
  KEY `endtime` (`endtime`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_merch_group`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_merch_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `groupname` varchar(255) DEFAULT '',
  `createtime` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '0',
  `isdefault` tinyint(1) DEFAULT '0',
  `goodschecked` tinyint(1) DEFAULT '0',
  `commissionchecked` tinyint(1) DEFAULT '0',
  `changepricechecked` tinyint(1) DEFAULT '0',
  `finishchecked` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_merch_nav`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_merch_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `navname` varchar(255) DEFAULT '',
  `icon` varchar(255) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '0',
  `merchid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_merchid` (`merchid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_merch_notice`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_merch_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `detail` text,
  `status` tinyint(3) DEFAULT '0',
  `createtime` int(11) DEFAULT NULL,
  `merchid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_merchid` (`merchid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_merch_perm_log`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_merch_perm_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `uniacid` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT '',
  `op` text,
  `ip` varchar(255) DEFAULT '',
  `createtime` int(11) DEFAULT '0',
  `merchid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_createtime` (`createtime`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_merchid` (`merchid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=489 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_merch_perm_role`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_merch_perm_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `merchid` int(11) DEFAULT '0',
  `rolename` varchar(255) DEFAULT '',
  `status` tinyint(3) DEFAULT '0',
  `perms` text,
  `deleted` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_status` (`status`),
  KEY `idx_deleted` (`deleted`),
  KEY `merchid` (`merchid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_merch_reg`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_merch_reg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `merchname` varchar(255) DEFAULT '',
  `salecate` varchar(255) DEFAULT '',
  `desc` varchar(500) DEFAULT '',
  `realname` varchar(255) DEFAULT '',
  `mobile` varchar(255) DEFAULT '',
  `status` tinyint(3) DEFAULT '0',
  `diyformdata` text,
  `diyformfields` text,
  `applytime` int(11) DEFAULT '0',
  `reason` text,
  `uname` varchar(50) NOT NULL DEFAULT '',
  `upass` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=112 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_merch_saler`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_merch_saler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storeid` int(11) DEFAULT '0',
  `uniacid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `status` tinyint(3) DEFAULT '0',
  `salername` varchar(255) DEFAULT '',
  `merchid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_storeid` (`storeid`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_merchid` (`merchid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_merch_store`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_merch_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `storename` varchar(255) DEFAULT '',
  `address` varchar(255) DEFAULT '',
  `tel` varchar(255) DEFAULT '',
  `lat` varchar(255) DEFAULT '',
  `lng` varchar(255) DEFAULT '',
  `status` tinyint(3) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0',
  `realname` varchar(255) DEFAULT '',
  `mobile` varchar(255) DEFAULT '',
  `fetchtime` varchar(255) DEFAULT '',
  `logo` varchar(255) DEFAULT '',
  `saletime` varchar(255) DEFAULT '',
  `desc` text,
  `displayorder` int(11) DEFAULT '0',
  `commission_total` decimal(10,2) DEFAULT NULL,
  `merchid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_status` (`status`),
  KEY `idx_merchid` (`merchid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_merch_user`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_merch_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `regid` int(11) DEFAULT '0',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `groupid` int(11) DEFAULT '0',
  `merchno` varchar(255) NOT NULL DEFAULT '',
  `merchname` varchar(255) NOT NULL DEFAULT '',
  `salecate` varchar(255) NOT NULL DEFAULT '',
  `desc` varchar(500) NOT NULL DEFAULT '',
  `realname` varchar(255) NOT NULL DEFAULT '',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(3) DEFAULT '0',
  `accounttime` int(11) DEFAULT '0',
  `diyformdata` text,
  `diyformfields` text,
  `applytime` int(11) DEFAULT '0',
  `accounttotal` int(11) DEFAULT '0',
  `remark` text,
  `jointime` int(11) DEFAULT '0',
  `accountid` int(11) DEFAULT '0',
  `sets` text,
  `logo` varchar(255) NOT NULL DEFAULT '',
  `payopenid` varchar(32) NOT NULL DEFAULT '',
  `payrate` decimal(10,2) NOT NULL DEFAULT '0.00',
  `isrecommand` tinyint(1) DEFAULT '0',
  `cateid` int(11) DEFAULT '0',
  `address` varchar(255) DEFAULT '',
  `tel` varchar(255) DEFAULT '',
  `lat` varchar(255) DEFAULT '',
  `lng` varchar(255) DEFAULT '',
  `pluginset` text NOT NULL,
  `uname` varchar(50) NOT NULL DEFAULT '',
  `upass` varchar(255) NOT NULL DEFAULT '',
  `maxgoods` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_status` (`status`),
  KEY `idx_groupid` (`groupid`),
  KEY `idx_regid` (`regid`),
  KEY `idx_cateid` (`cateid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=97 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_multi_shop`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_multi_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT '',
  `company` varchar(255) DEFAULT '',
  `sales` varchar(255) DEFAULT '',
  `starttime` int(11) DEFAULT '0',
  `endtime` int(11) DEFAULT '0',
  `applytime` int(11) DEFAULT '0',
  `jointime` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '0',
  `refusecontent` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_nav`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `navname` varchar(255) DEFAULT '',
  `classname` varchar(50) NOT NULL,
  `group_id` int(5) NOT NULL DEFAULT '0' COMMENT '所属导航组',
  `data_type` varchar(50) NOT NULL COMMENT '关联数据类型',
  `icon` varchar(255) DEFAULT '',
  `active_icon` varchar(250) NOT NULL,
  `url` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `istab` int(1) NOT NULL DEFAULT '0' COMMENT '是否为tabbar页面',
  `status` tinyint(3) DEFAULT '0',
  `iswxapp` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=54 ;

--
-- 转存表中的数据 `ims_ewei_shop_nav`
--

INSERT INTO `ims_ewei_shop_nav` (`id`, `uniacid`, `navname`, `classname`, `group_id`, `data_type`, `icon`, `active_icon`, `url`, `displayorder`, `istab`, `status`, `iswxapp`) VALUES
(43, 6, '全部', 'fa fa-file-text-o ico', 8, '', 'images/6/2017/11/eXzAR5p4E5EI8z1458J8rb3sye5p4B.png', '', '/pages/order/list?status=-2', 10, 0, 1, 0),
(42, 6, '待评价', 'fa fa-commenting-o', 8, '', '', '', '/pages/order/list?status=3', 7, 0, 1, 0),
(41, 6, '待用餐', 'fa fa-glass', 8, '', '', '', '/pages/order/list?status=1', 8, 0, 1, 0),
(40, 6, '待支付', 'fa fa-credit-card', 8, '', 'images/6/2017/11/qIo5XZ1lDGxK8ilbaOibL3lTlXzGT3.png', '', '/pages/order/list?status=0', 9, 0, 1, 0),
(39, 6, '青岛海鲜锅贴', '', 6, '', 'images/6/2017/11/VbjJeOiEkUY424NwGAU7gbuG2Fzaa2.png', '', '', 7, 0, 1, 0),
(38, 6, '热卖菜', '', 6, '', 'images/6/2017/11/GjLKJZdVKN7jICS6rI7CyL0jO7iya0.png', '', '', 8, 0, 1, 0),
(37, 6, '招牌菜', '', 6, '', 'images/6/2017/11/ZZHHNOoC31Q0533n3OXCqoBFcq3hom.png', '', '', 9, 0, 1, 0),
(36, 6, '订餐享优惠', '', 6, '', 'images/6/2017/11/Yczzhc759mHu2Y399h995F9u020HUU.png', '', '', 10, 0, 1, 0),
(26, 1, '我的订单', 'fa fa-bullhorn ico', 3, '', 'images/1/2018/02/cVRykgJ7j7KrWRvzbVHUhVZVyvgV3k.png', '', '/pages/order/list', 10, 0, 1, 0),
(27, 1, '分享给Ta画', '', 3, '', 'images/1/2018/02/YpEeS7AI6j37J7X3377IZsABZIaJa9.png', '', 'share', 9, 0, 1, 0),
(28, 1, '申请画师', '', 3, '', 'images/1/2018/02/v7SxUXMPjMVAJU4m2xuBQT5Qvv2AqZ.png', '', '../article/detail?id=5', 8, 0, 1, 0),
(29, 1, '在线客服', '', 3, '', 'images/1/2018/02/Qusi0farr2isfUsjR25QjZvffiO9A2.png', '', 'service', 0, 0, 1, 0),
(30, 1, '版权说明', '', 3, '', 'images/1/2018/02/nn1wNwLZ15NfFy1Ld11Nz3dD2D5WKF.png', '', '../article/detail?id=6', 0, 0, 1, 0),
(31, 1, '上传作品', '', 3, '', 'images/1/2018/02/q90sR29Z1XAl62Rn9o9rPp2N5n9asm.png', '', 'author', 3, 0, 1, 0),
(44, 6, '我的收益', 'fa fa-jpy ico center1 big', 10, 'commission', '', '', '/pages/agent/commission', 10, 0, 1, 0),
(45, 6, '我的好友', 'fa fa-users ico smal', 10, '', '', '', '/pages/agent/team', 9, 0, 1, 0),
(46, 6, '推广二维码', 'fa fa-qrcode ico big center', 10, '', '', '', '/pages/agent/qrcode', 8, 0, 1, 0),
(47, 6, '好消息', 'fa fa-bullhorn ico', 9, '', '', '', '/pages/article/list?cid=13', 10, 0, 1, 0),
(48, 6, '充值返现', 'fa fa-sun-o ico', 9, 'credit', '', '', '/pages/user/recharge', 9, 0, 1, 0),
(49, 6, '优惠券', 'fa fa-tag ico', 9, '', '', '', '/pages/user/coupon', 8, 0, 1, 0),
(50, 6, '我的收藏', 'fa fa-life-ring  ico', 9, '', '', '', '/pages/user/favourite', 7, 0, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_nav_group`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_nav_group` (
  `gid` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 NOT NULL,
  `sort_num` int(5) NOT NULL DEFAULT '10',
  `enabled` int(1) NOT NULL DEFAULT '1',
  `is_system` int(1) NOT NULL DEFAULT '0',
  `uniacid` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `ims_ewei_shop_nav_group`
--

INSERT INTO `ims_ewei_shop_nav_group` (`gid`, `title`, `sort_num`, `enabled`, `is_system`, `uniacid`) VALUES
(6, '首页栏目导航', 10, 1, 0, 6),
(3, '会员中心按钮组', 10, 1, 0, 1),
(8, '会员中心-我的订单', 10, 1, 0, 6),
(9, '会员中心-普通按钮组', 10, 1, 0, 6),
(10, '会员中心-分销按钮组', 10, 1, 0, 6);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_notice`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `cate_id` int(5) NOT NULL DEFAULT '0',
  `thumb` varchar(255) DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `detail` text,
  `status` tinyint(3) DEFAULT '0',
  `createtime` int(11) DEFAULT NULL,
  `shopid` int(11) DEFAULT '0',
  `iswxapp` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `ims_ewei_shop_notice`
--

INSERT INTO `ims_ewei_shop_notice` (`id`, `uniacid`, `displayorder`, `title`, `cate_id`, `thumb`, `link`, `detail`, `status`, `createtime`, `shopid`, `iswxapp`) VALUES
(5, 1, 0, '申请画师', 11, '', '', '<p><img src="https://d.happyhy.com/attachment/images/1/2018/03/VoZ661bbBSCV3Ee6PD88w844J8BSzo.jpg" width="100%" alt="未标题-8.jpg"/></p>', 1, 1519991782, 0, 0),
(6, 1, 0, '关于版权', 11, '', '', '<p><img src="https://d.happyhy.com/attachment/images/1/2018/03/VoZ661bbBSCV3Ee6PD88w844J8BSzo.jpg" width="100%" alt="未标题-8.jpg"/></p>', 1, 1519991805, 0, 0),
(11, 6, 0, '好消息！青岛海鲜锅贴小程序上线了', 13, '', '', '<p>好消息！青岛海鲜锅贴小程序上线了</p>', 1, 1511544219, 0, 0),
(12, 6, 0, '代言人攻略', 13, '', '', '<p>一. 【成为代言人】</p><p><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;在小程序中订餐消费累计超过128元，或是线下充值后消费累计满128元自动成为代言人（本店之前的积分会员自动升级为代言人）。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;成为代言人之后，在会员中心会显示成为了代言人。</p><p>&nbsp; &nbsp;&nbsp;<img src="http://happyhy.com/attachment/images/6/2018/01/LgOnEv31vyXVV53o0vd3n5yG0Zx03G.png" width="270" alt="images/6/2018/01/LgOnEv31vyXVV53o0vd3n5yG0Zx03G.png" height="147" style="width: 270px; height: 147px;"/></p><p><br/></p><p>【代言人特权】 本人消费返5%佣金，一代下级消费返3%佣金，二代下级返2%佣金</p><p><br/></p><p><br/></p><p>二. 【怎么推广赚取佣金？】</p><p><br/></p><p>成为代言人后，进入小程序里的“会员中心/推广二维码”</p><p><img src="http://happyhy.com/attachment/images/6/2018/01/R0q0U6qhueQsXdH0sBudUXkeBvaZko.png" width="100%" alt="images/6/2018/01/R0q0U6qhueQsXdH0sBudUXkeBvaZko.png"/></p><p><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;点击进入之后，会生成一个代言人专属的推广海报，让其他人扫海报中“太阳状”的二维码；或者单击一下图片保存至手机上转发至朋友圈或群里，长按识别后进入“青岛海鲜锅贴小程序”，都可以自动绑定为您的下级</p><p><img src="http://happyhy.com/attachment/images/6/2018/01/x9FM08FxQ0fx8sU0Bf9B0z0CxfzW0w.png" width="100%" alt="images/6/2018/01/x9FM08FxQ0fx8sU0Bf9B0z0CxfzW0w.png"/></p><p><br/></p><p>三 &nbsp;【查看我发展的下级】</p><p><br/></p><p>小程序点击“会员中心/我的好友”进入后，就可以查看我发展的下级了，您直推的是您的一代下级，一代下级直推的就是您的二代下级。本人、一代、二代消费都可以获得佣金。</p><p><br/></p><p><img src="http://happyhy.com/attachment/images/6/2018/01/uHhHjd2hH581G86zgQ2H4h858465J6.png" width="100%" alt="images/6/2018/01/uHhHjd2hH581G86zgQ2H4h858465J6.png"/></p><p><br/></p><p>四 【查看收益并提现】</p><p><br/></p><p><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;小程序里点击“会员中心/我的收益”， 看到有“可提现收益”代表收益已经生效，可以提现到账户余额，用账户余额就可以订餐或者消费了。</p><p><br/></p><p>可提现佣金： 是可以提现到账号余额的佣金。</p><p>累计佣金： 是以往产生的佣金的总计。</p><p>未结算佣金： 是还没有用餐的订单产生的佣金，所以尚不能提现。</p><p>已申请佣金：正在提现中的佣金。</p><p>成功提现佣金：已经成功提现到账号余额中的佣金统计。</p><p><br/></p><p>线下充值消费所产生的返佣是自动生成并且提现到您账号余额内的，线上订餐产生的佣金提现之后也是无需审核自动到您的账号余额内。</p><p><br/></p><p>注意：提现之前请设置好提现密码。</p><p><img src="http://happyhy.com/attachment/images/6/2018/01/ba6HICAF9JiFH868FN8jchOpJCNRj6.png" width="100%" alt="images/6/2018/01/ba6HICAF9JiFH868FN8jchOpJCNRj6.png"/></p>', 1, 1516073213, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_notice_cate`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_notice_cate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `enabled` int(1) NOT NULL DEFAULT '1',
  `is_system` int(1) NOT NULL DEFAULT '0' COMMENT '1 为普通 2为系统',
  `uniacid` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `type` (`enabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `ims_ewei_shop_notice_cate`
--

INSERT INTO `ims_ewei_shop_notice_cate` (`id`, `title`, `displayorder`, `enabled`, `is_system`, `uniacid`) VALUES
(11, '系统文章', 0, 1, 0, 1),
(13, '好消息', 0, 1, 0, 6);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_order`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `openid` varchar(50) DEFAULT '',
  `userid` int(10) NOT NULL DEFAULT '0',
  `agentid` int(11) DEFAULT '0',
  `ordersn` varchar(30) DEFAULT '',
  `price` decimal(10,2) DEFAULT '0.00',
  `realprice` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '未支付的',
  `goodsprice` decimal(10,2) DEFAULT '0.00',
  `discountprice` decimal(10,2) DEFAULT '0.00',
  `status` tinyint(3) DEFAULT '0',
  `paytype` tinyint(1) DEFAULT '0',
  `payment` varchar(20) NOT NULL COMMENT '支付方式',
  `from` int(1) NOT NULL DEFAULT '0' COMMENT '来自端口',
  `transid` varchar(30) DEFAULT '0',
  `remark` varchar(1000) DEFAULT '',
  `addressid` int(11) DEFAULT '0',
  `dispatchprice` decimal(10,2) DEFAULT '0.00',
  `dispatch_desc` varchar(50) NOT NULL COMMENT '运费相关描述',
  `dispatchid` int(10) DEFAULT '0',
  `createtime` int(10) DEFAULT NULL,
  `dispatchtype` tinyint(3) DEFAULT '0',
  `carrier` text,
  `refundid` int(11) DEFAULT '0',
  `iscomment` tinyint(3) DEFAULT '0',
  `creditadd` tinyint(3) DEFAULT '0',
  `deleted` tinyint(3) DEFAULT '0',
  `userdeleted` tinyint(3) DEFAULT '0',
  `finishtime` int(11) DEFAULT '0',
  `paytime` int(11) DEFAULT '0',
  `expresscom` varchar(30) NOT NULL DEFAULT '',
  `expresssn` varchar(50) NOT NULL DEFAULT '',
  `express` varchar(255) DEFAULT '',
  `sendtime` int(11) DEFAULT '0',
  `fetchtime` int(11) DEFAULT '0',
  `cash` tinyint(3) DEFAULT '0',
  `canceltime` int(11) DEFAULT NULL,
  `cancelpaytime` int(11) DEFAULT '0',
  `refundtime` int(11) DEFAULT '0',
  `isverify` tinyint(3) DEFAULT '0',
  `verified` tinyint(3) DEFAULT '0',
  `verifyopenid` varchar(255) DEFAULT '',
  `verifycode` varchar(255) DEFAULT '',
  `verifytime` int(11) DEFAULT '0',
  `verifystoreid` int(11) DEFAULT '0',
  `reservetime` int(10) NOT NULL DEFAULT '0' COMMENT '预约时间',
  `customer_num` int(5) NOT NULL DEFAULT '0' COMMENT '到店人数',
  `deductprice` decimal(10,2) DEFAULT '0.00',
  `deductcredit` int(10) DEFAULT '0',
  `deductcredit2` decimal(10,2) DEFAULT '0.00',
  `deductenough` decimal(10,2) DEFAULT '0.00',
  `virtual` int(11) DEFAULT '0',
  `virtual_info` text,
  `virtual_str` text,
  `realname` varchar(20) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `address` text,
  `province` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `area` varchar(30) NOT NULL,
  `sysdeleted` tinyint(3) DEFAULT '0',
  `ordersn2` int(11) DEFAULT '0',
  `changeprice` decimal(10,2) DEFAULT '0.00',
  `changedispatchprice` decimal(10,2) DEFAULT '0.00',
  `oldprice` decimal(10,2) DEFAULT '0.00',
  `olddispatchprice` decimal(10,2) DEFAULT '0.00',
  `isvirtual` tinyint(3) DEFAULT '0',
  `couponid` int(11) DEFAULT '0',
  `couponprice` decimal(10,2) DEFAULT '0.00',
  `diyformdata` text,
  `diyformfields` text,
  `diyformid` int(11) DEFAULT '0',
  `storeid` int(11) DEFAULT '0',
  `printstate` tinyint(1) DEFAULT '0',
  `printstate2` tinyint(1) DEFAULT '0',
  `address_send` text,
  `refundstate` tinyint(3) DEFAULT '0',
  `closereason` text,
  `remarksaler` text,
  `remarkclose` text,
  `remarksend` text,
  `ismr` int(1) NOT NULL DEFAULT '0',
  `isdiscountprice` decimal(10,2) DEFAULT '0.00',
  `isvirtualsend` tinyint(1) DEFAULT '0',
  `virtualsend_info` text,
  `verifyinfo` text,
  `verifytype` tinyint(1) DEFAULT '0',
  `verifycodes` text,
  `invoicename` varchar(255) DEFAULT '',
  `merchid` int(11) DEFAULT '0',
  `ismerch` tinyint(1) DEFAULT '0',
  `parentid` int(11) DEFAULT '0',
  `isparent` tinyint(1) DEFAULT '0',
  `grprice` decimal(10,2) DEFAULT '0.00',
  `merchshow` tinyint(1) DEFAULT '0',
  `merchdeductenough` decimal(10,2) DEFAULT '0.00',
  `couponmerchid` int(11) DEFAULT '0',
  `isglobonus` tinyint(3) DEFAULT '0',
  `merchapply` tinyint(1) DEFAULT '0',
  `isabonus` tinyint(3) DEFAULT '0',
  `isborrow` tinyint(3) DEFAULT '0',
  `borrowopenid` varchar(100) DEFAULT '',
  `merchisdiscountprice` decimal(10,2) DEFAULT '0.00',
  `apppay` tinyint(3) NOT NULL DEFAULT '0',
  `coupongoodprice` decimal(10,2) DEFAULT '1.00',
  `buyagainprice` decimal(10,2) DEFAULT '0.00',
  `authorid` int(11) DEFAULT '0',
  `isauthor` tinyint(1) DEFAULT '0',
  `ispackage` tinyint(3) DEFAULT '0',
  `packageid` int(11) DEFAULT '0',
  `taskdiscountprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `seckilldiscountprice` decimal(10,2) DEFAULT '0.00',
  `verifyendtime` int(11) NOT NULL DEFAULT '0',
  `willcancelmessage` tinyint(1) DEFAULT '0',
  `sendtype` tinyint(3) NOT NULL DEFAULT '0',
  `lotterydiscountprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `contype` tinyint(1) DEFAULT '0',
  `wxid` int(11) DEFAULT '0',
  `wxcardid` varchar(50) DEFAULT '',
  `wxcode` varchar(50) DEFAULT '',
  `dispatchkey` varchar(30) NOT NULL DEFAULT '',
  `quickid` int(11) NOT NULL DEFAULT '0',
  `istrade` tinyint(3) NOT NULL DEFAULT '0',
  `isnewstore` tinyint(3) NOT NULL DEFAULT '0',
  `liveid` int(11) DEFAULT NULL,
  `person` int(3) NOT NULL COMMENT '人数',
  `pictype` int(1) NOT NULL DEFAULT '1' COMMENT '照片类型',
  `user_pic` text NOT NULL,
  `author` int(10) NOT NULL DEFAULT '0' COMMENT '画师',
  `upload_case_time` int(11) NOT NULL COMMENT '上传作品时间',
  `upload_case` text NOT NULL COMMENT '上传作品',
  `formid` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_openid` (`openid`),
  KEY `idx_shareid` (`agentid`),
  KEY `idx_status` (`status`),
  KEY `idx_createtime` (`createtime`),
  KEY `idx_refundid` (`refundid`),
  KEY `idx_paytime` (`paytime`),
  KEY `idx_finishtime` (`finishtime`),
  KEY `idx_merchid` (`merchid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `ims_ewei_shop_order`
--

INSERT INTO `ims_ewei_shop_order` (`id`, `uniacid`, `openid`, `userid`, `agentid`, `ordersn`, `price`, `realprice`, `goodsprice`, `discountprice`, `status`, `paytype`, `payment`, `from`, `transid`, `remark`, `addressid`, `dispatchprice`, `dispatch_desc`, `dispatchid`, `createtime`, `dispatchtype`, `carrier`, `refundid`, `iscomment`, `creditadd`, `deleted`, `userdeleted`, `finishtime`, `paytime`, `expresscom`, `expresssn`, `express`, `sendtime`, `fetchtime`, `cash`, `canceltime`, `cancelpaytime`, `refundtime`, `isverify`, `verified`, `verifyopenid`, `verifycode`, `verifytime`, `verifystoreid`, `reservetime`, `customer_num`, `deductprice`, `deductcredit`, `deductcredit2`, `deductenough`, `virtual`, `virtual_info`, `virtual_str`, `realname`, `mobile`, `address`, `province`, `city`, `area`, `sysdeleted`, `ordersn2`, `changeprice`, `changedispatchprice`, `oldprice`, `olddispatchprice`, `isvirtual`, `couponid`, `couponprice`, `diyformdata`, `diyformfields`, `diyformid`, `storeid`, `printstate`, `printstate2`, `address_send`, `refundstate`, `closereason`, `remarksaler`, `remarkclose`, `remarksend`, `ismr`, `isdiscountprice`, `isvirtualsend`, `virtualsend_info`, `verifyinfo`, `verifytype`, `verifycodes`, `invoicename`, `merchid`, `ismerch`, `parentid`, `isparent`, `grprice`, `merchshow`, `merchdeductenough`, `couponmerchid`, `isglobonus`, `merchapply`, `isabonus`, `isborrow`, `borrowopenid`, `merchisdiscountprice`, `apppay`, `coupongoodprice`, `buyagainprice`, `authorid`, `isauthor`, `ispackage`, `packageid`, `taskdiscountprice`, `seckilldiscountprice`, `verifyendtime`, `willcancelmessage`, `sendtype`, `lotterydiscountprice`, `contype`, `wxid`, `wxcardid`, `wxcode`, `dispatchkey`, `quickid`, `istrade`, `isnewstore`, `liveid`, `person`, `pictype`, `user_pic`, `author`, `upload_case_time`, `upload_case`, `formid`) VALUES
(1, 1, 'xcx_oUSEM5G4GIZQj1KugQlWQY3bQN9w', 1, 0, 'SH20180309161458436222', '0.01', '0.00', '0.01', '0.00', 2, 21, 'wechat', 0, '0', '', 0, '0.00', '', 0, 1520583298, 0, NULL, 0, 0, 0, 0, 0, 0, 1520583304, '', '', '', 1520583542, 0, 0, NULL, 0, 0, 0, 0, '', '', 0, 0, 0, 0, '0.00', 0, '0.00', '0.00', 0, NULL, NULL, '', '15666677699', NULL, '', '', '', 0, 0, '0.00', '0.00', '0.01', '0.00', 1, 0, '0.00', NULL, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, '0.00', 0, NULL, NULL, 0, NULL, '', 0, 0, 0, 0, '0.00', 0, '0.00', 0, 0, 0, 0, 0, '', '0.00', 0, '1.00', '0.00', 0, 0, 0, 0, '0.00', '0.00', 0, 0, 0, '0.00', 0, 0, '', '', '', 0, 0, 0, NULL, 1, 1, 'a:1:{i:0;s:51:"images/1/2018/03/fc0208N7QNV7y8LA83h33D7Dh7qqQl.jpg";}', 2, 1520583542, 'a:2:{i:0;s:51:"images/1/2018/03/dBz1H400tY8Jb4hhblZtUy84Hz4O84.png";i:1;s:51:"images/1/2018/03/uPPmcjJfzmcflLL2i8RB9ppC5RlCJl.png";}', '1520583297450'),
(2, 1, 'xcx_oUSEM5G4GIZQj1KugQlWQY3bQN9w', 1, 0, 'SH20180309162009639406', '0.01', '0.00', '0.01', '0.00', 3, 21, 'wechat', 0, '0', '', 0, '0.00', '', 0, 1520583609, 0, NULL, 0, 0, 0, 0, 0, 1520583699, 1520583615, '', '', '', 1520583664, 0, 0, NULL, 0, 0, 0, 0, '', '', 0, 0, 0, 0, '0.00', 0, '0.00', '0.00', 0, NULL, NULL, '', '15666677699', NULL, '', '', '', 0, 0, '0.00', '0.00', '0.01', '0.00', 1, 0, '0.00', NULL, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, '0.00', 0, NULL, NULL, 0, NULL, '', 0, 0, 0, 0, '0.00', 0, '0.00', 0, 0, 0, 0, 0, '', '0.00', 0, '1.00', '0.00', 0, 0, 0, 0, '0.00', '0.00', 0, 0, 0, '0.00', 0, 0, '', '', '', 0, 0, 0, NULL, 1, 1, 'a:1:{i:0;s:51:"images/1/2018/03/pSSffzS3u92052kl01d23kqsk1akFe.jpg";}', 2, 1520583664, 'a:1:{i:0;s:51:"images/1/2018/03/dBz1H400tY8Jb4hhblZtUy84Hz4O84.png";}', '1520583609107'),
(3, 1, 'xcx_oUSEM5Cwm-VyY0XLfdRScsqEL2G4', 2, 0, 'SH20180311195431662655', '0.01', '0.00', '0.01', '0.00', 3, 21, 'wechat', 0, '0', '去掉特效', 0, '0.00', '', 0, 1520769271, 0, NULL, 0, 0, 0, 0, 0, 1520769443, 1520769276, '', '', '', 1520769443, 0, 0, NULL, 0, 0, 0, 0, '', '', 0, 0, 0, 0, '0.00', 0, '0.00', '0.00', 0, NULL, NULL, '', '18600509987', NULL, '', '', '', 0, 0, '0.00', '0.00', '0.01', '0.00', 1, 0, '0.00', NULL, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, '0.00', 0, NULL, NULL, 0, NULL, '', 0, 0, 0, 0, '0.00', 0, '0.00', 0, 0, 0, 0, 0, '', '0.00', 0, '1.00', '0.00', 0, 0, 0, 0, '0.00', '0.00', 0, 0, 0, '0.00', 0, 0, '', '', '', 0, 0, 0, NULL, 1, 1, 'a:1:{i:0;s:51:"images/1/2018/03/Krd2hVrh5hz9H15d1g8P0jCDJhLZzp.jpg";}', 0, 0, '', '902fa90fac20f759648774ea77b0f4c1'),
(4, 1, 'xcx_oUSEM5Cwm-VyY0XLfdRScsqEL2G4', 2, 0, 'SH20180311195755891622', '0.01', '0.00', '0.01', '0.00', 3, 21, 'wechat', 0, '0', '', 0, '0.00', '', 0, 1520769475, 0, NULL, 0, 1, 0, 0, 0, 1520769628, 1520769480, '', '', '', 1520769564, 0, 0, NULL, 0, 0, 0, 0, '', '', 0, 0, 0, 0, '0.00', 0, '0.00', '0.00', 0, NULL, NULL, '', '18600509987', NULL, '', '', '', 0, 0, '0.00', '0.00', '0.01', '0.00', 1, 0, '0.00', NULL, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, '0.00', 0, NULL, NULL, 0, NULL, '', 0, 0, 0, 0, '0.00', 0, '0.00', 0, 0, 0, 0, 0, '', '0.00', 0, '1.00', '0.00', 0, 0, 0, 0, '0.00', '0.00', 0, 0, 0, '0.00', 0, 0, '', '', '', 0, 0, 0, NULL, 1, 1, 'a:1:{i:0;s:51:"images/1/2018/03/NpSOZoe7Gi474g11MU4PtT1Om4ToCe.jpg";}', 6, 1520769564, 'a:1:{i:0;s:51:"images/1/2018/03/CtDKDjJepRgLrTxEetEleEjzhZjJIe.jpg";}', '9ea76e0441867a0543d0fdd62bf14e05'),
(5, 1, 'xcx_oUSEM5Cwm-VyY0XLfdRScsqEL2G4', 2, 0, 'SH20180311201142882287', '20.00', '0.00', '20.00', '0.00', 0, 21, 'wechat', 0, '0', '', 0, '0.00', '', 0, 1520770302, 0, NULL, 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, 0, NULL, 0, 0, 0, 0, '', '', 0, 0, 0, 0, '0.00', 0, '0.00', '0.00', 0, NULL, NULL, '', '18600509987', NULL, '', '', '', 0, 0, '0.00', '0.00', '20.00', '0.00', 1, 0, '0.00', NULL, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, '0.00', 0, NULL, NULL, 0, NULL, '', 0, 0, 0, 0, '0.00', 0, '0.00', 0, 0, 0, 0, 0, '', '0.00', 0, '1.00', '0.00', 0, 0, 0, 0, '0.00', '0.00', 0, 0, 0, '0.00', 0, 0, '', '', '', 0, 0, 0, NULL, 2, 1, 'a:1:{i:0;s:51:"images/1/2018/03/m90P5r0H2hr0z0MoP5r42Paw2HOCfC.jpg";}', 0, 0, '', 'bd99124aabd9a1b859f9db56a9fb48b1'),
(6, 1, 'xcx_oUSEM5Cwm-VyY0XLfdRScsqEL2G4', 2, 0, 'SH20180311201408464436', '20.00', '0.00', '20.00', '0.00', 0, 21, 'wechat', 0, '0', '', 0, '0.00', '', 0, 1520770448, 0, NULL, 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, 0, NULL, 0, 0, 0, 0, '', '', 0, 0, 0, 0, '0.00', 0, '0.00', '0.00', 0, NULL, NULL, '', '18600509987', NULL, '', '', '', 0, 0, '0.00', '0.00', '20.00', '0.00', 1, 0, '0.00', NULL, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, '0.00', 0, NULL, NULL, 0, NULL, '', 0, 0, 0, 0, '0.00', 0, '0.00', 0, 0, 0, 0, 0, '', '0.00', 0, '1.00', '0.00', 0, 0, 0, 0, '0.00', '0.00', 0, 0, 0, '0.00', 0, 0, '', '', '', 0, 0, 0, NULL, 2, 2, 'a:2:{i:0;s:51:"images/1/2018/03/rI3QXLXQiXi31ZmqIms3e1Jx33m0Q4.jpg";i:1;s:51:"images/1/2018/03/iyHV64xr7ByXN6b0Wx5XZb465s8ZXS.jpg";}', 0, 0, '', '5c494933299a9b03d18ad5b467362b03'),
(7, 1, 'xcx_oUSEM5Cwm-VyY0XLfdRScsqEL2G4', 2, 0, 'SH20180311201449422694', '20.00', '0.00', '20.00', '0.00', 1, 21, 'wechat', 0, '0', '', 0, '0.00', '', 0, 1520770489, 0, NULL, 0, 0, 0, 0, 0, 0, 1520770494, '', '', '', 0, 0, 0, NULL, 0, 0, 0, 0, '', '', 0, 0, 0, 0, '0.00', 0, '0.00', '0.00', 0, NULL, NULL, '', '18600509987', NULL, '', '', '', 0, 0, '0.00', '0.00', '20.00', '0.00', 1, 0, '0.00', NULL, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, '0.00', 0, NULL, NULL, 0, NULL, '', 0, 0, 0, 0, '0.00', 0, '0.00', 0, 0, 0, 0, 0, '', '0.00', 0, '1.00', '0.00', 0, 0, 0, 0, '0.00', '0.00', 0, 0, 0, '0.00', 0, 0, '', '', '', 0, 0, 0, NULL, 2, 1, 'a:2:{i:0;s:51:"images/1/2018/03/u57Ddh8hk7w7ppktxpQAZg8gPP6t71.jpg";i:1;s:51:"images/1/2018/03/lMJM9J2jptp19B0MJh24moZf14FcF2.jpg";}', 6, 0, '', '6a45fa7b408d4ce914c987696f2125b8'),
(8, 1, 'xcx_oUSEM5Cwm-VyY0XLfdRScsqEL2G4', 2, 0, 'SH20180312150323843758', '0.10', '0.00', '0.10', '0.00', 3, 21, 'wechat', 0, '0', '', 0, '0.00', '', 0, 1520838203, 0, NULL, 0, 1, 0, 0, 0, 1520838321, 1520838207, '', '', '', 1520838285, 0, 0, NULL, 0, 0, 0, 0, '', '', 0, 0, 0, 0, '0.00', 0, '0.00', '0.00', 0, NULL, NULL, '', '', NULL, '', '', '', 0, 0, '0.00', '0.00', '0.10', '0.00', 1, 0, '0.00', NULL, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, '0.00', 0, NULL, NULL, 0, NULL, '', 0, 0, 0, 0, '0.00', 0, '0.00', 0, 0, 0, 0, 0, '', '0.00', 0, '1.00', '0.00', 0, 0, 0, 0, '0.00', '0.00', 0, 0, 0, '0.00', 0, 0, '', '', '', 0, 0, 0, NULL, 1, 1, 'a:1:{i:0;s:51:"images/1/2018/03/kEtrEGVZ4iFt24Kth4zelr5vVpb4l2.jpg";}', 6, 1520838285, 'a:1:{i:0;s:51:"images/1/2018/03/XBDdD86IEM6tNZqimbD2EUeL4lbY6n.jpg";}', 'e19d64faf6e26f66894942a98e70e3b7'),
(9, 1, 'xcx_oUSEM5Cwm-VyY0XLfdRScsqEL2G4', 2, 0, 'SH20180312175925624857', '0.01', '0.00', '0.01', '0.00', 3, 21, 'wechat', 0, '0', '', 0, '0.00', '', 0, 1520848765, 0, NULL, 0, 1, 0, 0, 0, 1520848851, 1520848769, '', '', '', 1520848837, 0, 0, NULL, 0, 0, 0, 0, '', '', 0, 0, 0, 0, '0.00', 0, '0.00', '0.00', 0, NULL, NULL, '', '', NULL, '', '', '', 0, 0, '0.00', '0.00', '0.01', '0.00', 1, 0, '0.00', NULL, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, '0.00', 0, NULL, NULL, 0, NULL, '', 0, 0, 0, 0, '0.00', 0, '0.00', 0, 0, 0, 0, 0, '', '0.00', 0, '1.00', '0.00', 0, 0, 0, 0, '0.00', '0.00', 0, 0, 0, '0.00', 0, 0, '', '', '', 0, 0, 0, NULL, 1, 1, 'a:1:{i:0;s:51:"images/1/2018/03/M0f1vx0fXbxLH4xlVEFjXVGzG1xf4x.jpg";}', 6, 1520848837, 'a:1:{i:0;s:51:"images/1/2018/03/SOT0SQqctDebdn0JltDINl0DnHANJt.jpg";}', '347358b99f9885d2c3323258a998ed17');

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_order_comment`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_order_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `orderid` int(11) DEFAULT '0',
  `goodsid` int(11) DEFAULT '0',
  `openid` varchar(50) DEFAULT '',
  `nickname` varchar(50) DEFAULT '',
  `headimgurl` varchar(255) DEFAULT '',
  `level` tinyint(3) DEFAULT '0',
  `content` varchar(255) DEFAULT '',
  `images` text,
  `createtime` int(11) DEFAULT '0',
  `deleted` tinyint(3) DEFAULT '0',
  `append_content` varchar(255) DEFAULT '',
  `append_images` text,
  `reply_content` varchar(255) DEFAULT '',
  `reply_images` text,
  `append_reply_content` varchar(255) DEFAULT '',
  `append_reply_images` text,
  `istop` tinyint(3) DEFAULT '0',
  `checked` tinyint(3) NOT NULL DEFAULT '0',
  `replychecked` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_goodsid` (`goodsid`),
  KEY `idx_openid` (`openid`),
  KEY `idx_createtime` (`createtime`),
  KEY `idx_orderid` (`orderid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `ims_ewei_shop_order_comment`
--

INSERT INTO `ims_ewei_shop_order_comment` (`id`, `uniacid`, `orderid`, `goodsid`, `openid`, `nickname`, `headimgurl`, `level`, `content`, `images`, `createtime`, `deleted`, `append_content`, `append_images`, `reply_content`, `reply_images`, `append_reply_content`, `append_reply_images`, `istop`, `checked`, `replychecked`) VALUES
(1, 1, 4, 1, 'xcx_oUSEM5Cwm-VyY0XLfdRScsqEL2G4', 'Jonny', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqvSDpezWYf8lEiaIRZ5n2yrRF3pLqHQDs9838tS0nHoIhdrrEU5iahSHYIdStOSlBe2FZlI1bEwraA/0', 5, '好看好看', 'a:1:{i:0;s:51:"images/1/2018/03/CtDKDjJepRgLrTxEetEleEjzhZjJIe.jpg";}', 1520769692, 0, '', NULL, '', NULL, '', NULL, 0, 1, 0),
(2, 1, 0, 2, '', '我滴个神啊', 'images/1/2018/03/CtDKDjJepRgLrTxEetEleEjzhZjJIe.jpg', 5, '爱你画的真好', 'a:1:{i:0;s:51:"images/1/2018/03/yRv0YIx438d8qOXm0Ivqj8x3IX770R.png";}', 1520839860, 0, '', 'a:0:{}', '', 'a:0:{}', '', 'a:0:{}', 0, 0, 0),
(3, 1, 8, 14, 'xcx_oUSEM5Cwm-VyY0XLfdRScsqEL2G4', 'Jonny', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqvSDpezWYf8lEiaIRZ5n2yrRF3pLqHQDs9838tS0nHoIhdrrEU5iahSHYIdStOSlBe2FZlI1bEwraA/0', 5, '美美哒', 'a:1:{i:0;s:51:"images/1/2018/03/XBDdD86IEM6tNZqimbD2EUeL4lbY6n.jpg";}', 1520840211, 0, '', NULL, '', NULL, '', NULL, 0, 1, 0),
(4, 1, 9, 1, 'xcx_oUSEM5Cwm-VyY0XLfdRScsqEL2G4', 'Jonny', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqvSDpezWYf8lEiaIRZ5n2yrRF3pLqHQDs9838tS0nHoIhdrrEU5iahSHYIdStOSlBe2FZlI1bEwraA/0', 5, '哈哈', 'a:1:{i:0;s:51:"images/1/2018/03/SOT0SQqctDebdn0JltDINl0DnHANJt.jpg";}', 1520848864, 0, '', NULL, '', NULL, '', NULL, 0, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_order_goods`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `orderid` int(11) DEFAULT '0',
  `userid` int(10) NOT NULL DEFAULT '0',
  `goodsid` int(11) DEFAULT '0',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '总价',
  `ismeeting` int(1) NOT NULL DEFAULT '0' COMMENT '价格是否面议',
  `total` int(11) DEFAULT '1',
  `optionid` int(10) DEFAULT '0',
  `createtime` int(11) DEFAULT '0',
  `optionname` text,
  `commission1` text,
  `applytime1` int(11) DEFAULT '0',
  `checktime1` int(10) DEFAULT '0',
  `paytime1` int(11) DEFAULT '0',
  `invalidtime1` int(11) DEFAULT '0',
  `deletetime1` int(11) DEFAULT '0',
  `status1` tinyint(3) DEFAULT '0',
  `content1` text,
  `commission2` text,
  `applytime2` int(11) DEFAULT '0',
  `checktime2` int(10) DEFAULT '0',
  `paytime2` int(11) DEFAULT '0',
  `invalidtime2` int(11) DEFAULT '0',
  `deletetime2` int(11) DEFAULT '0',
  `status2` tinyint(3) DEFAULT '0',
  `content2` text,
  `commission3` text,
  `applytime3` int(11) DEFAULT '0',
  `checktime3` int(10) DEFAULT '0',
  `paytime3` int(11) DEFAULT '0',
  `invalidtime3` int(11) DEFAULT '0',
  `deletetime3` int(11) DEFAULT '0',
  `status3` tinyint(3) DEFAULT '0',
  `content3` text,
  `realprice` decimal(10,2) DEFAULT '0.00' COMMENT '实价',
  `goodssn` varchar(255) DEFAULT '',
  `productsn` varchar(255) DEFAULT '',
  `nocommission` tinyint(3) DEFAULT '0',
  `changeprice` decimal(10,2) DEFAULT '0.00' COMMENT '管理员更改价格',
  `oldprice` decimal(10,2) DEFAULT '0.00' COMMENT '原价',
  `commissions` text,
  `diyformid` int(11) DEFAULT '0',
  `diyformdataid` int(11) DEFAULT '0',
  `diyformdata` text,
  `diyformfields` text,
  `openid` varchar(255) DEFAULT '',
  `printstate` int(11) NOT NULL DEFAULT '0',
  `printstate2` int(11) NOT NULL DEFAULT '0',
  `rstate` tinyint(3) DEFAULT '0',
  `refundtime` int(11) DEFAULT '0',
  `merchid` int(11) DEFAULT '0',
  `parentorderid` int(11) DEFAULT '0',
  `merchsale` tinyint(3) NOT NULL DEFAULT '0',
  `isdiscountprice` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠价',
  `canbuyagain` tinyint(1) DEFAULT '0',
  `seckill` tinyint(3) DEFAULT '0',
  `seckill_taskid` int(11) DEFAULT '0',
  `seckill_roomid` int(11) DEFAULT '0',
  `seckill_timeid` int(11) DEFAULT '0',
  `is_make` tinyint(1) DEFAULT '0',
  `sendtype` tinyint(3) NOT NULL DEFAULT '0',
  `expresscom` varchar(30) NOT NULL,
  `expresssn` varchar(50) NOT NULL,
  `express` varchar(255) NOT NULL,
  `sendtime` int(11) NOT NULL,
  `finishtime` int(11) NOT NULL,
  `remarksend` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_orderid` (`orderid`),
  KEY `idx_goodsid` (`goodsid`),
  KEY `idx_createtime` (`createtime`),
  KEY `idx_applytime1` (`applytime1`),
  KEY `idx_checktime1` (`checktime1`),
  KEY `idx_status1` (`status1`),
  KEY `idx_applytime2` (`applytime2`),
  KEY `idx_checktime2` (`checktime2`),
  KEY `idx_status2` (`status2`),
  KEY `idx_applytime3` (`applytime3`),
  KEY `idx_invalidtime1` (`invalidtime1`),
  KEY `idx_checktime3` (`checktime3`),
  KEY `idx_invalidtime2` (`invalidtime2`),
  KEY `idx_invalidtime3` (`invalidtime3`),
  KEY `idx_status3` (`status3`),
  KEY `idx_paytime1` (`paytime1`),
  KEY `idx_paytime2` (`paytime2`),
  KEY `idx_paytime3` (`paytime3`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `ims_ewei_shop_order_goods`
--

INSERT INTO `ims_ewei_shop_order_goods` (`id`, `uniacid`, `orderid`, `userid`, `goodsid`, `price`, `ismeeting`, `total`, `optionid`, `createtime`, `optionname`, `commission1`, `applytime1`, `checktime1`, `paytime1`, `invalidtime1`, `deletetime1`, `status1`, `content1`, `commission2`, `applytime2`, `checktime2`, `paytime2`, `invalidtime2`, `deletetime2`, `status2`, `content2`, `commission3`, `applytime3`, `checktime3`, `paytime3`, `invalidtime3`, `deletetime3`, `status3`, `content3`, `realprice`, `goodssn`, `productsn`, `nocommission`, `changeprice`, `oldprice`, `commissions`, `diyformid`, `diyformdataid`, `diyformdata`, `diyformfields`, `openid`, `printstate`, `printstate2`, `rstate`, `refundtime`, `merchid`, `parentorderid`, `merchsale`, `isdiscountprice`, `canbuyagain`, `seckill`, `seckill_taskid`, `seckill_roomid`, `seckill_timeid`, `is_make`, `sendtype`, `expresscom`, `expresssn`, `express`, `sendtime`, `finishtime`, `remarksend`) VALUES
(1, 1, 1, 1, 1, '0.01', 0, 1, 3, 1520583298, '头像', NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, '0.01', '', '', 0, '0.00', '0.00', NULL, 0, 0, NULL, NULL, '', 0, 0, 0, 0, 0, 0, 0, '0.00', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, ''),
(2, 1, 2, 1, 1, '0.01', 0, 1, 3, 1520583609, '头像', NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, '0.01', '', '', 0, '0.00', '0.00', NULL, 0, 0, NULL, NULL, '', 0, 0, 0, 0, 0, 0, 0, '0.00', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, ''),
(3, 1, 3, 2, 1, '0.01', 0, 1, 3, 1520769271, '头像', NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, '0.01', '', '', 0, '0.00', '0.00', NULL, 0, 0, NULL, NULL, '', 0, 0, 0, 0, 0, 0, 0, '0.00', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, ''),
(4, 1, 4, 2, 1, '0.01', 0, 1, 3, 1520769475, '头像', NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, '0.01', '', '', 0, '0.00', '0.00', NULL, 0, 0, NULL, NULL, '', 0, 0, 0, 0, 0, 0, 0, '0.00', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, ''),
(5, 1, 5, 2, 10, '20.00', 0, 1, 9, 1520770302, '头像', NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, '20.00', '', '', 0, '0.00', '0.00', NULL, 0, 0, NULL, NULL, '', 0, 0, 0, 0, 0, 0, 0, '0.00', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, ''),
(6, 1, 6, 2, 10, '20.00', 0, 1, 9, 1520770448, '头像', NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, '20.00', '', '', 0, '0.00', '0.00', NULL, 0, 0, NULL, NULL, '', 0, 0, 0, 0, 0, 0, 0, '0.00', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, ''),
(7, 1, 7, 2, 10, '20.00', 0, 1, 9, 1520770489, '头像', NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, '20.00', '', '', 0, '0.00', '0.00', NULL, 0, 0, NULL, NULL, '', 0, 0, 0, 0, 0, 0, 0, '0.00', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, ''),
(8, 1, 8, 2, 14, '0.10', 0, 1, 12, 1520838203, '头像', NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, '0.10', '', '', 0, '0.00', '0.00', NULL, 0, 0, NULL, NULL, '', 0, 0, 0, 0, 0, 0, 0, '0.00', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, ''),
(9, 1, 9, 2, 1, '0.01', 0, 1, 3, 1520848765, '头像', NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, '0.01', '', '', 0, '0.00', '0.00', NULL, 0, 0, NULL, NULL, '', 0, 0, 0, 0, 0, 0, 0, '0.00', 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_order_peerpay`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_order_peerpay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `orderid` int(11) NOT NULL DEFAULT '0',
  `peerpay_type` tinyint(1) NOT NULL DEFAULT '0',
  `peerpay_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `peerpay_maxprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `peerpay_realprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `peerpay_selfpay` decimal(10,2) NOT NULL DEFAULT '0.00',
  `peerpay_message` varchar(500) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`) USING BTREE,
  KEY `orderid` (`orderid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_order_peerpay_payinfo`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_order_peerpay_payinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `uname` varchar(255) NOT NULL DEFAULT '',
  `usay` varchar(500) NOT NULL DEFAULT '',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `headimg` varchar(255) DEFAULT NULL,
  `refundstatus` tinyint(1) NOT NULL DEFAULT '0',
  `refundprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tid` varchar(255) NOT NULL DEFAULT '',
  `openid` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_order_refund`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_order_refund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `orderid` int(11) DEFAULT '0',
  `refundno` varchar(255) DEFAULT '',
  `price` varchar(255) DEFAULT '',
  `reason` varchar(255) DEFAULT '',
  `images` text,
  `content` text,
  `createtime` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '0',
  `reply` text,
  `refundtype` tinyint(3) DEFAULT '0',
  `orderprice` decimal(10,2) DEFAULT '0.00',
  `applyprice` decimal(10,2) DEFAULT '0.00',
  `imgs` text,
  `rtype` tinyint(3) DEFAULT '0',
  `refundaddress` text,
  `message` text,
  `express` varchar(100) DEFAULT '',
  `expresscom` varchar(100) DEFAULT '',
  `expresssn` varchar(100) DEFAULT '',
  `operatetime` int(11) DEFAULT '0',
  `sendtime` int(11) DEFAULT '0',
  `returntime` int(11) DEFAULT '0',
  `refundtime` int(11) DEFAULT '0',
  `rexpress` varchar(100) DEFAULT '',
  `rexpresscom` varchar(100) DEFAULT '',
  `rexpresssn` varchar(100) DEFAULT '',
  `refundaddressid` int(11) DEFAULT '0',
  `endtime` int(11) DEFAULT '0',
  `realprice` decimal(10,2) DEFAULT '0.00',
  `merchid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_createtime` (`createtime`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_package`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `freight` decimal(10,2) NOT NULL DEFAULT '0.00',
  `thumb` varchar(255) NOT NULL,
  `starttime` int(11) NOT NULL DEFAULT '0',
  `endtime` int(11) NOT NULL DEFAULT '0',
  `goodsid` varchar(255) NOT NULL,
  `cash` tinyint(3) NOT NULL DEFAULT '0',
  `share_title` varchar(255) NOT NULL,
  `share_icon` varchar(255) NOT NULL,
  `share_desc` varchar(500) NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `deleted` tinyint(3) NOT NULL DEFAULT '0',
  `displayorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_package_goods`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_package_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `goodsid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `option` varchar(255) NOT NULL,
  `goodssn` varchar(255) NOT NULL,
  `productsn` varchar(255) NOT NULL,
  `hasoption` tinyint(3) NOT NULL DEFAULT '0',
  `marketprice` decimal(10,2) DEFAULT '0.00',
  `packageprice` decimal(10,2) DEFAULT '0.00',
  `commission1` decimal(10,2) DEFAULT '0.00',
  `commission2` decimal(10,2) DEFAULT '0.00',
  `commission3` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_package_goods_option`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_package_goods_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `goodsid` int(11) NOT NULL DEFAULT '0',
  `optionid` int(11) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `packageprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `marketprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `commission1` decimal(10,2) NOT NULL DEFAULT '0.00',
  `commission2` decimal(10,2) NOT NULL DEFAULT '0.00',
  `commission3` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_payment`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(2) NOT NULL DEFAULT '0',
  `appid` varchar(255) DEFAULT '',
  `mch_id` varchar(50) NOT NULL DEFAULT '',
  `apikey` varchar(50) NOT NULL DEFAULT '',
  `sub_appid` varchar(50) DEFAULT '',
  `sub_appsecret` varchar(50) DEFAULT '',
  `sub_mch_id` varchar(50) DEFAULT '',
  `cert_file` text,
  `key_file` text,
  `root_file` text,
  `is_raw` tinyint(1) DEFAULT '0',
  `createtime` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`) USING BTREE,
  KEY `idx_type` (`type`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ims_ewei_shop_payment`
--

INSERT INTO `ims_ewei_shop_payment` (`id`, `uniacid`, `title`, `type`, `appid`, `mch_id`, `apikey`, `sub_appid`, `sub_appsecret`, `sub_mch_id`, `cert_file`, `key_file`, `root_file`, `is_raw`, `createtime`) VALUES
(1, 1, '微信支付', 0, '', '', 'huagewo2018huagewo2018huagewo123', 'wx1223d08ee7dcb407', '', '1496710202', '-----BEGIN CERTIFICATE-----\nMIIEZjCCA8+gAwIBAgIEAZ7hJzANBgkqhkiG9w0BAQUFADCBijELMAkGA1UEBhMC\nQ04xEjAQBgNVBAgTCUd1YW5nZG9uZzERMA8GA1UEBxMIU2hlbnpoZW4xEDAOBgNV\nBAoTB1RlbmNlbnQxDDAKBgNVBAsTA1dYRzETMBEGA1UEAxMKTW1wYXltY2hDQTEf\nMB0GCSqGSIb3DQEJARYQbW1wYXltY2hAdGVuY2VudDAeFw0xODAxMTIxMTA3MDVa\nFw0yODAxMTAxMTA3MDVaMIGVMQswCQYDVQQGEwJDTjESMBAGA1UECBMJR3Vhbmdk\nb25nMREwDwYDVQQHEwhTaGVuemhlbjEQMA4GA1UEChMHVGVuY2VudDEOMAwGA1UE\nCxMFTU1QYXkxKjAoBgNVBAMUIeWMl+S6rOeqnei+ueiNieenkeaKgOaciemZkOWF\nrOWPuDERMA8GA1UEBBMIODg3MDEyNjYwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQC4JM0wepDUr6l4HJWH8UBrVJ3o3tv4Xw+ZiNAqpaxVF4if2PDx4mEI\nITAseV3FFhKfB6p9uO57XJMptKARMLjVS6eJHJ5cWbQW7IJK5RegwxpsOFXL0OLi\neo9gA9aTs9s4rKhFSa+TelNt1IzY4xz8P6y6/Zf1UREPEMB0Woebn1Bunrh7nrtl\n7BRrViM4rJgxrEjrQhvsqAGApDEQRL0dg7Pp3eHpFsENp0fmkXXqCIoeyfNuVm3T\nmiRUbpH0bb5Xuttfn8zGGH8/sdQoRUWvuXwvpTAMfBu4GrdcMyo737sxpgzCdnfE\nx4wiNbXNd9tdO+nvHNChL7btaue+5A6nAgMBAAGjggFGMIIBQjAJBgNVHRMEAjAA\nMCwGCWCGSAGG+EIBDQQfFh0iQ0VTLUNBIEdlbmVyYXRlIENlcnRpZmljYXRlIjAd\nBgNVHQ4EFgQUG2U2udWg+h8yQKawBeMrXzYETSgwgb8GA1UdIwSBtzCBtIAUPgUm\n9iJitBVbiM1kfrDUYqflhnShgZCkgY0wgYoxCzAJBgNVBAYTAkNOMRIwEAYDVQQI\nEwlHdWFuZ2RvbmcxETAPBgNVBAcTCFNoZW56aGVuMRAwDgYDVQQKEwdUZW5jZW50\nMQwwCgYDVQQLEwNXWEcxEzARBgNVBAMTCk1tcGF5bWNoQ0ExHzAdBgkqhkiG9w0B\nCQEWEG1tcGF5bWNoQHRlbmNlbnSCCQC7VJcrvADoVzAOBgNVHQ8BAf8EBAMCBsAw\nFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwIwDQYJKoZIhvcNAQEFBQADgYEAps5IvXV2\n53Kc1sUBBi5hDPLtL2phf6J0otA4+EmOXxxRDeugYQS97p2+MkZ6a2m50yvv5zQp\nWjLlialHPYlUtnzCTC2feUKqeLpb4ZWOSbYmMxnvNT9F1LldqqcqVASeBt9K9ny1\nBZSmNeM/S+67eRzmUlmkjlabwaiCgJ7z0jo=\n-----END CERTIFICATE-----\n', '-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC4JM0wepDUr6l4\nHJWH8UBrVJ3o3tv4Xw+ZiNAqpaxVF4if2PDx4mEIITAseV3FFhKfB6p9uO57XJMp\ntKARMLjVS6eJHJ5cWbQW7IJK5RegwxpsOFXL0OLieo9gA9aTs9s4rKhFSa+TelNt\n1IzY4xz8P6y6/Zf1UREPEMB0Woebn1Bunrh7nrtl7BRrViM4rJgxrEjrQhvsqAGA\npDEQRL0dg7Pp3eHpFsENp0fmkXXqCIoeyfNuVm3TmiRUbpH0bb5Xuttfn8zGGH8/\nsdQoRUWvuXwvpTAMfBu4GrdcMyo737sxpgzCdnfEx4wiNbXNd9tdO+nvHNChL7bt\naue+5A6nAgMBAAECggEAK1/XyTyFkuORqo4pFq1X/DAhRfIApF9X4FVemz0M+7og\nX26NSpyFOJIAs+kekkbhuf3nRdfirMIgk+lM7t+oGe3JF73a+2vRxLiO9C9EQoTS\nW31lkC2y06AE15vv1ji+QXpB5Jg3uChPMIapaokMkco52I3VVl5zAzZx7rZITPpy\ngMA8Pvj8HvFPTr2yzJpyLWZs3Zjy4e99IC29jaUrUNKlyhcwjCkkRMP91S5eZYJp\nXOy8CKtymHFkYnnkcgaQHBUb8KQaqmPiczA4L7xiNRqrxASOdkwe4kOHVx+PG9wv\nehJpjcP64mxW6EoREChXxB84sl/QDWlQJHyQUFjNIQKBgQDbBDa3If1/OSU8dVn1\nnpTkKRqQEIZfDALyEpUQUO60P/OKge68gHwD5ooadv70IC05/keO3ih+jWUJRzjx\n3QEAbUG/Nr6CvQxFdIeW4B8dRbMOP72Zkw2tOYBUDfYUCQDe2uNZAebUm0DkvnOM\nycoRWp2IvCpIcBtLofXUwW+YcQKBgQDXPRZ7DZ+od3H7RDFiv0TQaRNNKRw2fIpX\n2xCbuXhYu15Vq/oMKaRVaGHoA6jvV2I9Hd72eZnsF47kS4Jb0YZpMk8vu36Ltuq/\nCoUC7NSmlxWnwKLfzyRZl8lgKRfaU0DY4qC+yztmGE7+edkfYCiTKSi0uGt3+CR2\nebJ0AVVklwKBgQCCQL9Jqq1YPGQo0KHvsaBbERb7FtjTLhGSZfrA+WD9UgtFFIEn\nGkKnDzSTCLIX/grnspJcJUNwACdWnUUAkq9F0bSIQ8aJemUR6Xu5/xCCGDGlB8N6\n0joQC2KGmsb+o1whLYyIItllF/BAGgQeduP17i5CY6XB7upM0MWjAmecAQKBgCuK\n1iNqrCPelhZowzzgyMEIoLj5WhXDuBDx5jg6mxgIP5tBQUJ4oiAND9Fp/CD/IoaO\npm5iRzs1wNh6VhLRHknlvZNAcOc+x9qB/EqNMq/I3L6k/84bD5V4WWq0pXirYvD9\nV9uBLbEHteNRLxVj1JGAwBVfQY5xip7VG77QDkBdAoGAL1LvoOYIBCZ/RnxE8LBw\nih/dFEhndRPZwr+xNGoitcZTUKyd22C7Akt6TrJU75dtM21nFEXweeHgwj1Rinxa\nKbxcu5fYgrjDT0JD5JPb75w8Cc/Zm2l8rBaFQZJRZqeL95PoMlYQkEEa3VH/sOq1\nbTf4XKI3AWGQsZoXRd10Wbk=\n-----END PRIVATE KEY-----\n', '-----BEGIN CERTIFICATE-----\r\nMIIDIDCCAomgAwIBAgIENd70zzANBgkqhkiG9w0BAQUFADBOMQswCQYDVQQGEwJV\r\nUzEQMA4GA1UEChMHRXF1aWZheDEtMCsGA1UECxMkRXF1aWZheCBTZWN1cmUgQ2Vy\r\ndGlmaWNhdGUgQXV0aG9yaXR5MB4XDTk4MDgyMjE2NDE1MVoXDTE4MDgyMjE2NDE1\r\nMVowTjELMAkGA1UEBhMCVVMxEDAOBgNVBAoTB0VxdWlmYXgxLTArBgNVBAsTJEVx\r\ndWlmYXggU2VjdXJlIENlcnRpZmljYXRlIEF1dGhvcml0eTCBnzANBgkqhkiG9w0B\r\nAQEFAAOBjQAwgYkCgYEAwV2xWGcIYu6gmi0fCG2RFGiYCh7+2gRvE4RiIcPRfM6f\r\nBeC4AfBONOziipUEZKzxa1NfBbPLZ4C/QgKO/t0BCezhABRP/PvwDN1Dulsr4R+A\r\ncJkVV5MW8Q+XarfCaCMczE1ZMKxRHjuvK9buY0V7xdlfUNLjUA86iOe/FP3gx7kC\r\nAwEAAaOCAQkwggEFMHAGA1UdHwRpMGcwZaBjoGGkXzBdMQswCQYDVQQGEwJVUzEQ\r\nMA4GA1UEChMHRXF1aWZheDEtMCsGA1UECxMkRXF1aWZheCBTZWN1cmUgQ2VydGlm\r\naWNhdGUgQXV0aG9yaXR5MQ0wCwYDVQQDEwRDUkwxMBoGA1UdEAQTMBGBDzIwMTgw\r\nODIyMTY0MTUxWjALBgNVHQ8EBAMCAQYwHwYDVR0jBBgwFoAUSOZo+SvSspXXR9gj\r\nIBBPM5iQn9QwHQYDVR0OBBYEFEjmaPkr0rKV10fYIyAQTzOYkJ/UMAwGA1UdEwQF\r\nMAMBAf8wGgYJKoZIhvZ9B0EABA0wCxsFVjMuMGMDAgbAMA0GCSqGSIb3DQEBBQUA\r\nA4GBAFjOKer89961zgK5F7WF0bnj4JXMJTENAKaSbn+2kmOeUJXRmm/kEd5jhW6Y\r\n7qj/WsjTVbJmcVfewCHrPSqnI0kBBIZCe/zuf6IWUrVnZ9NA2zsmWLIodz2uFHdh\r\n1voqZiegDfqnc1zqcPGUIWVEX/r87yloqaKHee9570+sB3c4\r\n-----END CERTIFICATE-----', 0, 1504520936),
(2, 6, '微信小程序支付', 0, '', '', 'qingdaohaixianguotieqingdaohaixi', 'wx1faed05e0cba8892', '', '1491661782', '-----BEGIN CERTIFICATE-----\nMIIEYzCCA8ygAwIBAgIEAXX7zjANBgkqhkiG9w0BAQUFADCBijELMAkGA1UEBhMC\nQ04xEjAQBgNVBAgTCUd1YW5nZG9uZzERMA8GA1UEBxMIU2hlbnpoZW4xEDAOBgNV\nBAoTB1RlbmNlbnQxDDAKBgNVBAsTA1dYRzETMBEGA1UEAxMKTW1wYXltY2hDQTEf\nMB0GCSqGSIb3DQEJARYQbW1wYXltY2hAdGVuY2VudDAeFw0xNzExMDcwNTEwNDla\nFw0yNzExMDUwNTEwNDlaMIGSMQswCQYDVQQGEwJDTjESMBAGA1UECBMJR3Vhbmdk\nb25nMREwDwYDVQQHEwhTaGVuemhlbjEQMA4GA1UEChMHVGVuY2VudDEOMAwGA1UE\nCxMFTU1QYXkxJzAlBgNVBAMUHuS4nOiQpeWMuumdkumdkua1t+mynOmUhei0tOmT\nujERMA8GA1UEBBMINjUyODIxNzQwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEK\nAoIBAQCnTHEQ+e/8/QiTwHGsuFsYTsezOKhztGB3QCVsiaeDmpc93SkFVMRu0Ls0\n6Ab+piYFR2E/EQbdMCPfco19IUZ2NCCH3ZKuxIDzYkNkrHLuCmPJjqSpthE5hNht\nWnVdfWUwmESRHLnaU63P0De3diZCvTG0cwIqmqrGVjCJViX47+q9mIhxO9oGRsBB\ncKqk8L1xRst5wh5i+ZiCo8AWeGTvLvB0P9gLeyhi6PXJtJhtrDYZ9ayG4GSZqYlR\ns76GFtqnnhISAY1kDnCoj75xdujAj78TtllEDQ6ZxX6q8iurGRPnC97JkQ8GtKZb\nKUDn0PYjUO28lgsKDpWlZcASev/bAgMBAAGjggFGMIIBQjAJBgNVHRMEAjAAMCwG\nCWCGSAGG+EIBDQQfFh0iQ0VTLUNBIEdlbmVyYXRlIENlcnRpZmljYXRlIjAdBgNV\nHQ4EFgQUwqRrGSHZ2i6/YLrBZ9UN+3Erblswgb8GA1UdIwSBtzCBtIAUPgUm9iJi\ntBVbiM1kfrDUYqflhnShgZCkgY0wgYoxCzAJBgNVBAYTAkNOMRIwEAYDVQQIEwlH\ndWFuZ2RvbmcxETAPBgNVBAcTCFNoZW56aGVuMRAwDgYDVQQKEwdUZW5jZW50MQww\nCgYDVQQLEwNXWEcxEzARBgNVBAMTCk1tcGF5bWNoQ0ExHzAdBgkqhkiG9w0BCQEW\nEG1tcGF5bWNoQHRlbmNlbnSCCQC7VJcrvADoVzAOBgNVHQ8BAf8EBAMCBsAwFgYD\nVR0lAQH/BAwwCgYIKwYBBQUHAwIwDQYJKoZIhvcNAQEFBQADgYEAW0kwY9qcEz3B\n2h1iutHixWRyxzBtoAmJoqMMFXj1FqotSIyFOO5oMlh0OPhFaw/QpYXIFCGc6CDU\n5tGmHNkAnoElbCmy5GvyALono/nLKcPgtX1GG7DFUhNTJ61gDZZdRMNoxdU48dTM\nEElspAVDhR3C3GVF8o6v0NOWGus1TPM=\n-----END CERTIFICATE-----\n', '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCnTHEQ+e/8/QiT\nwHGsuFsYTsezOKhztGB3QCVsiaeDmpc93SkFVMRu0Ls06Ab+piYFR2E/EQbdMCPf\nco19IUZ2NCCH3ZKuxIDzYkNkrHLuCmPJjqSpthE5hNhtWnVdfWUwmESRHLnaU63P\n0De3diZCvTG0cwIqmqrGVjCJViX47+q9mIhxO9oGRsBBcKqk8L1xRst5wh5i+ZiC\no8AWeGTvLvB0P9gLeyhi6PXJtJhtrDYZ9ayG4GSZqYlRs76GFtqnnhISAY1kDnCo\nj75xdujAj78TtllEDQ6ZxX6q8iurGRPnC97JkQ8GtKZbKUDn0PYjUO28lgsKDpWl\nZcASev/bAgMBAAECggEAScDtZ6qIHmP+0ARbGOX9Yu34JA6qVLgEfw4McZkN/Hq+\nikthtjP0lVX38g8IZmMhB9q8CG2dNQ3wAqYhsjRlN98rKDqKW/nNT37Wbx+HW2HB\nNC5qcVcOqOjj8PGcJCcP4Sh/semUFagmTCNjLMItg+acbwz0u4uMFfwRUbpk6yVD\nIzPwVzCwPCRnGkWG/EcDl8IX3rxgRxb3TnWx+XhW1tVSRfW9YLqHuzavLimO8axT\n2OkmqnJ0929Pd/WDnflbbeSZiwYdRFCyX8XWbt6dyNp7GVWSzru5px4AKkZvcwE/\nhwQ0RO0a5c80EShCneuJbt7BuWaaQE5QqR4uRxZKgQKBgQDWtYLwcddXMWVSO7PX\n/CG+s8jMR3TJnzR7W/QDk+kBsdS84b5v+879Tnu0PDihqtNOOtw6mbFV9S99QPjS\nLnqjN/KdvhPXMSEWcQAeHFWQYcC4jY1aBIqMXqcDtENWOOFbQ37HVsQlo9eLFV+X\nJbzlHWNHGvVwz2LH4p7oveJSCwKBgQDHeNWo6U2MrVtSmg7lbYgBVp+iivoD0bSc\nqPawJeSx0pk+WmZw1DyOaMIVdHSVBJlqQLvzrzh9dDOrGgHh7T03+Xgjjt9Iu0Gl\nWcLSKH/B/kLsHwRZMrFTGlaFYZblGVJ1MJQdkegY9Zyey8HC8DSJk6AG5C9nGHbY\nJoWPy+z7cQKBgC3jl3u6aRLqrMQZnIOCENhIZpc6gnyBOV9QNOP63ecN0fEYsnIO\nuJutBYVtBZGQCB+FNwKTTLKZd6/mjgemBXITCBiswmLQzkiUmDjXR3ZXXjBTmK1v\noQkFRd7lzSqFd6zgzRzfr4Z38R55z/dnCmtRj6Fn4qNcv7kG932478EnAoGABknG\n4oZITZEBef8lTRJA4VnrumILM6eeu/mPnUn0ha6P6ilLZW8rYYnn5GlBa5kzhOf5\nhNsXOs04+8HcIVUrQuJ4aRaN72sHzMChpaJlNKZhUbRAnNc+Q9Jmu9mxuhMsSEl5\nwdzhpjfH8jGWMCEGZvfiaZUz8VoSFQpR15CkLeECgYBwN9WClFPfAGnN3NntL5TY\nnvyIClumJxC3gH+36D2eQW/OUZaJTIXAHNVKx064GaW9bNtqnedbvqNBjVPa/9JY\nPO7NX3nfQ/akp/FoVQHHjv4Uwpz65f1Q59vdiR2QeGq9moI5Rj4hwMOptWvJEV4H\nIBgsDIEJGNXPa3zqBGPPSw==\n-----END PRIVATE KEY-----\n', '-----BEGIN CERTIFICATE-----\r\nMIIDIDCCAomgAwIBAgIENd70zzANBgkqhkiG9w0BAQUFADBOMQswCQYDVQQGEwJV\r\nUzEQMA4GA1UEChMHRXF1aWZheDEtMCsGA1UECxMkRXF1aWZheCBTZWN1cmUgQ2Vy\r\ndGlmaWNhdGUgQXV0aG9yaXR5MB4XDTk4MDgyMjE2NDE1MVoXDTE4MDgyMjE2NDE1\r\nMVowTjELMAkGA1UEBhMCVVMxEDAOBgNVBAoTB0VxdWlmYXgxLTArBgNVBAsTJEVx\r\ndWlmYXggU2VjdXJlIENlcnRpZmljYXRlIEF1dGhvcml0eTCBnzANBgkqhkiG9w0B\r\nAQEFAAOBjQAwgYkCgYEAwV2xWGcIYu6gmi0fCG2RFGiYCh7+2gRvE4RiIcPRfM6f\r\nBeC4AfBONOziipUEZKzxa1NfBbPLZ4C/QgKO/t0BCezhABRP/PvwDN1Dulsr4R+A\r\ncJkVV5MW8Q+XarfCaCMczE1ZMKxRHjuvK9buY0V7xdlfUNLjUA86iOe/FP3gx7kC\r\nAwEAAaOCAQkwggEFMHAGA1UdHwRpMGcwZaBjoGGkXzBdMQswCQYDVQQGEwJVUzEQ\r\nMA4GA1UEChMHRXF1aWZheDEtMCsGA1UECxMkRXF1aWZheCBTZWN1cmUgQ2VydGlm\r\naWNhdGUgQXV0aG9yaXR5MQ0wCwYDVQQDEwRDUkwxMBoGA1UdEAQTMBGBDzIwMTgw\r\nODIyMTY0MTUxWjALBgNVHQ8EBAMCAQYwHwYDVR0jBBgwFoAUSOZo+SvSspXXR9gj\r\nIBBPM5iQn9QwHQYDVR0OBBYEFEjmaPkr0rKV10fYIyAQTzOYkJ/UMAwGA1UdEwQF\r\nMAMBAf8wGgYJKoZIhvZ9B0EABA0wCxsFVjMuMGMDAgbAMA0GCSqGSIb3DQEBBQUA\r\nA4GBAFjOKer89961zgK5F7WF0bnj4JXMJTENAKaSbn+2kmOeUJXRmm/kEd5jhW6Y\r\n7qj/WsjTVbJmcVfewCHrPSqnI0kBBIZCe/zuf6IWUrVnZ9NA2zsmWLIodz2uFHdh\r\n1voqZiegDfqnc1zqcPGUIWVEX/r87yloqaKHee9570+sB3c4\r\n-----END CERTIFICATE-----', 0, 1511423279);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_pc_adv`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_pc_adv` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL,
  `advname` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `src` varchar(255) NOT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `enabled` tinyint(3) unsigned NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `width` int(11) unsigned NOT NULL,
  `height` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_pc_link`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_pc_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL,
  `linkname` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `displayorder` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_pc_menu`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_pc_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned NOT NULL,
  `type` int(11) unsigned DEFAULT '0',
  `displayorder` int(11) unsigned DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `enabled` tinyint(3) unsigned DEFAULT '1',
  `createtime` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_pc_slide`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_pc_slide` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) unsigned DEFAULT '0',
  `type` int(11) unsigned DEFAULT '0',
  `advname` varchar(50) DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `backcolor` varchar(255) DEFAULT NULL,
  `displayorder` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '0',
  `shopid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_enabled` (`enabled`),
  KEY `idx_displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_perm_log`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_perm_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `uniacid` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT '',
  `op` text,
  `createtime` int(11) DEFAULT '0',
  `ip` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uid` (`uid`),
  KEY `idx_createtime` (`createtime`),
  KEY `idx_uniacid` (`uniacid`),
  FULLTEXT KEY `idx_type` (`type`),
  FULLTEXT KEY `idx_op` (`op`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=148 ;

--
-- 转存表中的数据 `ims_ewei_shop_perm_log`
--

INSERT INTO `ims_ewei_shop_perm_log` (`id`, `uid`, `uniacid`, `name`, `type`, `op`, `createtime`, `ip`) VALUES
(1, 1, 1, '设置-商城设置-修改', 'sysset.shop.edit', '修改系统设置-商城设置', 1518450684, '27.202.50.159'),
(2, 1, 1, '设置-小程序设置-修改', 'sysset.wxapp.edit', '修改系统设置-小程序设置', 1518451441, '27.202.50.159'),
(3, 1, 1, '设置-小程序设置-修改', 'sysset.wxapp.edit', '修改系统设置-小程序设置', 1518452021, '27.202.50.159'),
(4, 1, 1, '商城管理-幻灯片-修改', 'shop.adv.edit', '隐藏', 1518455775, '27.202.50.159'),
(5, 1, 1, '商城管理-幻灯片-修改', 'shop.adv.edit', '修改幻灯片 ID: 9', 1518455848, '27.202.50.159'),
(6, 1, 1, '商城管理-幻灯片-删除', 'shop.adv.delete', '删除幻灯片 ID: 14 标题: 小程序开发大师 ', 1518455870, '27.202.50.159'),
(7, 1, 1, '商城管理-配送方式-修改', 'shop.dispatch.edit', '隐藏', 1518457595, '27.202.50.159'),
(8, 1, 1, '商城管理-配送方式-修改', 'shop.dispatch.edit', '隐藏', 1518457597, '27.202.50.159'),
(9, 1, 1, '商城管理-配送方式-修改', 'shop.dispatch.edit', '隐藏', 1518457597, '27.202.50.159'),
(10, 1, 1, '', 'shop.category.edit', '修改分类 ID: 1174', 1518457667, '27.202.50.159'),
(11, 1, 1, '', 'shop.category.edit', '修改分类 ID: 1175', 1518457685, '27.202.50.159'),
(12, 1, 1, '', 'shop.category.edit', '修改分类 ID: 1176', 1518457697, '27.202.50.159'),
(13, 1, 1, '', 'shop.category.edit', '修改分类 ID: 1177', 1518457712, '27.202.50.159'),
(14, 1, 1, '', 'shop.category.delete', '删除分类 ID: 1178 分类名称: 遗失声明', 1518457723, '27.202.50.159'),
(15, 1, 1, '', 'shop.category.delete', '删除分类 ID: 1179 分类名称: 审计报告', 1518457728, '27.202.50.159'),
(16, 1, 1, '商品管理-添加', 'goods.add', '添加商品 ID: 1<br>是否参与分销 -- 是', 1518488524, '27.202.50.159'),
(17, 1, 1, '商品管理-添加', 'goods.add', '添加商品 ID: 2<br>是否参与分销 -- 是', 1518488700, '27.202.50.159'),
(18, 1, 1, '商品管理-添加', 'goods.add', '添加商品 ID: 3<br>是否参与分销 -- 是', 1518489584, '27.202.50.159'),
(19, 1, 1, '商品管理-添加', 'goods.add', '添加商品 ID: 4<br>是否参与分销 -- 是', 1518489660, '27.202.50.159'),
(20, 1, 1, '商品管理-添加', 'goods.add', '添加商品 ID: 5<br>是否参与分销 -- 是', 1518489735, '27.202.50.159'),
(21, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 5<br>是否参与分销 -- 是', 1518602693, '119.186.159.119'),
(22, 1, 1, '商品管理-添加', 'goods.add', '添加商品 ID: 6<br>是否参与分销 -- 是', 1518602755, '119.186.159.119'),
(23, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 4<br>是否参与分销 -- 是', 1518602842, '119.186.159.119'),
(24, 1, 1, '商品管理-添加', 'goods.add', '添加商品 ID: 7<br>是否参与分销 -- 是', 1518602902, '119.186.159.119'),
(25, 1, 1, '商品管理-添加', 'goods.add', '添加商品 ID: 8<br>是否参与分销 -- 是', 1518602974, '119.186.159.119'),
(26, 1, 1, '商品管理-添加', 'goods.add', '添加商品 ID: 9<br>是否参与分销 -- 是', 1518603063, '119.186.159.119'),
(27, 1, 1, '商品管理-添加', 'goods.add', '添加商品 ID: 10<br>是否参与分销 -- 是', 1518603114, '119.186.159.119'),
(28, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 9<br>是否参与分销 -- 是', 1518620552, '119.186.159.119'),
(29, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 1<br>是否参与分销 -- 是', 1518673245, '119.186.159.119'),
(30, 1, 1, '商城管理-首页导航图标-修改', 'shop.nav.edit', '修改导航 ID: 26', 1518801687, '119.186.159.119'),
(31, 1, 1, '商城管理-首页导航图标-修改', 'shop.nav.edit', '修改导航 ID: 27', 1518801937, '119.186.159.119'),
(32, 1, 1, '商城管理-首页导航图标-修改', 'shop.nav.edit', '修改导航 ID: 28', 1518802072, '119.186.159.119'),
(33, 1, 1, '商城管理-首页导航图标-修改', 'shop.nav.edit', '隐藏', 1518802078, '119.186.159.119'),
(34, 1, 1, '商城管理-首页导航图标-修改', 'shop.nav.edit', '修改导航 ID: 31', 1518802118, '119.186.159.119'),
(35, 1, 1, '商城管理-首页导航图标-修改', 'shop.nav.edit', '修改导航 ID: 29', 1518802144, '119.186.159.119'),
(36, 1, 1, '商城管理-首页导航图标-修改', 'shop.nav.edit', '修改导航 ID: 30', 1518802184, '119.186.159.119'),
(37, 1, 1, '商城管理-公告-修改', 'shop.notice.edit', '修改文章 ID: 6', 1518836395, '39.79.36.29'),
(38, 1, 1, '商城管理-公告-修改', 'shop.notice.edit', '修改文章 ID: 5', 1518836424, '39.79.36.29'),
(39, 1, 1, '商城管理-首页导航图标-修改', 'shop.nav.edit', '修改导航 ID: 28', 1518836833, '39.79.36.29'),
(40, 1, 1, '商城管理-首页导航图标-修改', 'shop.nav.edit', '修改导航 ID: 30', 1518836858, '39.79.36.29'),
(41, 1, 1, '商城管理-首页导航图标-修改', 'shop.nav.edit', '修改导航 ID: 29', 1518837882, '39.79.36.29'),
(42, 1, 1, '', 'case.product.edit', '修改作品 ID: 1', 1519183121, '39.79.35.192'),
(43, 1, 1, '', 'case.product.edit', '修改作品 ID: 2', 1519183310, '39.79.35.192'),
(44, 1, 1, '', 'case.product.edit', '修改作品 ID: 4', 1519183336, '39.79.35.192'),
(45, 1, 1, '', 'case.category.edit', '修改分类排序 ID:  标题:  排序: 2 ', 1519183348, '39.79.35.192'),
(46, 1, 1, '', 'case.category.edit', '修改分类排序 ID:  标题:  排序: 1 ', 1519183349, '39.79.35.192'),
(47, 1, 1, '', 'case.category.edit', '修改分类排序 ID:  标题:  排序: 50 ', 1519183354, '39.79.35.192'),
(48, 1, 1, '商城管理-首页导航图标-修改', 'shop.nav.edit', '修改导航 ID: 28', 1519304629, '27.202.75.160'),
(49, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 1<br>是否参与分销 -- 是', 1519529742, '27.202.160.164'),
(50, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 1<br>是否参与分销 -- 是', 1519529836, '27.202.160.164'),
(51, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 7<br>是否参与分销 -- 是', 1519647171, '39.79.37.90'),
(52, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 7<br>是否参与分销 -- 是', 1519647254, '39.79.37.90'),
(53, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 7<br>是否参与分销 -- 是', 1519651285, '39.79.37.90'),
(54, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 7<br>是否参与分销 -- 是', 1519658306, '39.79.37.90'),
(55, 1, 1, '设置-支付管理-修改', 'sysset.payment.edit', '编辑打印机模板 ID: 1 标题: 微信支付 ', 1519799427, '27.202.77.233'),
(56, 1, 1, '设置-支付方式-修改', 'sysset.payset.edit', '修改系统设置-支付设置', 1519804265, '27.202.77.233'),
(57, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 7<br>是否参与分销 -- 是', 1519818184, '39.79.39.250'),
(58, 1, 1, '商城管理-首页导航图标-修改', 'shop.nav.edit', '修改导航 ID: 31', 1519874398, '39.79.39.250'),
(59, 1, 1, '', 'case.author.delete', '删除作者 ID: 1 标题: 王宇泽 ', 1519881404, '39.79.39.250'),
(60, 1, 1, '', 'case.author.add', '添加作者 ID: 2', 1519881841, '39.79.39.250'),
(61, 1, 1, '商城管理-评价-回复', 'shop.comment.post', '商品首次评价审核通过 ID: 6 商品ID: 7 商品标题: 亲子头像一', 1519956134, '39.79.39.250'),
(62, 1, 1, '', 'shop.category.add', '添加分类 ID: 1190', 1519956198, '39.79.39.250'),
(63, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 1<br>是否参与分销 -- 是', 1519959360, '39.79.39.250'),
(64, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 1<br>是否参与分销 -- 是', 1519961065, '39.79.39.250'),
(65, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 1<br>是否参与分销 -- 是', 1519961861, '39.79.39.250'),
(66, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 1<br>是否参与分销 -- 是', 1519966125, '39.79.39.250'),
(67, 1, 1, '商品管理-修改', 'goods.edit', '修改商品热卖状态   ID: 10', 1519979044, '111.201.146.195'),
(68, 1, 1, '商品管理-修改', 'goods.edit', '修改商品热卖状态   ID: 10', 1519979045, '111.201.146.195'),
(69, 1, 1, '会员管理-会员管理-添加', 'member.list.add', '添加会员 ID: 4', 1519979470, '111.201.146.195'),
(70, 1, 1, '', 'case.author.add', '添加作者 ID: 3', 1519979504, '111.201.146.195'),
(71, 1, 1, '', 'case.author.add', '添加作者 ID: 4', 1519979553, '111.201.146.195'),
(72, 1, 1, '', 'case.author.delete', '删除作者 ID: 3 标题: 画师1 ', 1519979562, '111.201.146.195'),
(73, 1, 1, '', 'shop.category.edit', '修改分类 ID: 1177', 1519980284, '111.201.146.195'),
(74, 1, 1, '设置-商城设置-修改', 'sysset.shop.edit', '修改系统设置-商城设置', 1519980436, '111.201.146.195'),
(75, 1, 1, '商城管理-配送方式-修改', 'shop.dispatch.edit', '隐藏', 1519980583, '111.201.146.195'),
(76, 1, 1, '商城管理-配送方式-修改', 'shop.dispatch.edit', '隐藏', 1519980585, '111.201.146.195'),
(77, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 1<br>是否参与分销 -- 是', 1519985474, '111.201.146.195'),
(78, 1, 1, '订单-操作-确认取货(自提单)', 'order.op.fetch', '订单确认取货 ID: 9 订单号: SH20180302181315694666', 1519985614, '111.201.146.195'),
(79, 1, 1, '订单-操作-确认取货(自提单)', 'order.op.fetch', '订单确认取货 ID: 8 订单号: SH20180302120649406442', 1519985812, '111.201.146.195'),
(80, 1, 1, '商城管理-公告-修改', 'shop.notice.edit', '修改文章 ID: 5', 1519991782, '111.201.146.195'),
(81, 1, 1, '商城管理-公告-修改', 'shop.notice.edit', '修改文章 ID: 6', 1519991794, '111.201.146.195'),
(82, 1, 1, '商城管理-公告-修改', 'shop.notice.edit', '修改文章 ID: 6', 1519991805, '111.201.146.195'),
(83, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 2<br>是否参与分销 -- 是', 1519992027, '111.201.146.195'),
(84, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 2<br>是否参与分销 -- 是', 1519992061, '111.201.146.195'),
(85, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 2<br>是否参与分销 -- 是', 1519992195, '111.201.146.195'),
(86, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 2<br>是否参与分销 -- 是', 1519992223, '111.201.146.195'),
(87, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 2<br>是否参与分销 -- 是', 1519992301, '111.201.146.195'),
(88, 1, 1, '商城管理-评价-添加', 'shop.comment.add', '添加虚拟评价 ID: 7 商品ID: 2 商品标题: 日漫风', 1519999596, '111.201.146.195'),
(89, 1, 1, '', 'case.author.add', '添加作者 ID: 5', 1520054285, '111.201.146.195'),
(90, 1, 1, '', 'case.author.delete', '删除作者 ID: 5 标题: jonny ', 1520054292, '111.201.146.195'),
(91, 1, 1, '', 'case.author.add', '添加作者 ID: 6', 1520054316, '111.201.146.195'),
(92, 1, 1, '会员管理-会员管理-修改', 'member.list.edit', '设置黑名单 <br/>用户信息:  ID: 2 /  xcx_oUSEM5Cwm-VyY0XLfdRScsqEL2G4/Jonny//18600509987', 1520055228, '111.201.146.195'),
(93, 1, 1, '会员管理-会员管理-修改', 'member.list.edit', '取消黑名单 <br/>用户信息:  ID: 2 /  xcx_oUSEM5Cwm-VyY0XLfdRScsqEL2G4/Jonny//18600509987', 1520055229, '111.201.146.195'),
(94, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 2<br>是否参与分销 -- 是', 1520055372, '111.201.146.195'),
(95, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 2<br>是否参与分销 -- 是', 1520055528, '111.201.146.195'),
(96, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 2<br>是否参与分销 -- 是', 1520055711, '111.201.146.195'),
(97, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 2<br>是否参与分销 -- 是', 1520055799, '111.201.146.195'),
(98, 1, 1, '', 'case.product.edit', '修改作品 ID: 1', 1520391567, '39.79.101.95'),
(99, 1, 1, '商城管理-首页导航图标-添加', 'shop.nav.add', '添加导航 ID: 51', 1520486122, '39.79.101.95'),
(100, 1, 1, '商城管理-首页导航图标-添加', 'shop.nav.add', '添加导航 ID: 52', 1520486195, '39.79.101.95'),
(101, 1, 1, '商城管理-首页导航图标-修改', 'shop.nav.edit', '修改导航 ID: 52', 1520486280, '39.79.101.95'),
(102, 1, 1, '商城管理-首页导航图标-添加', 'shop.nav.add', '添加导航 ID: 53', 1520486330, '39.79.101.95'),
(103, 1, 1, '商城管理-幻灯片-修改', 'shop.adv.edit', '隐藏', 1520769095, '114.242.249.100'),
(104, 1, 1, '商城管理-幻灯片-修改', 'shop.adv.edit', '隐藏', 1520769096, '114.242.249.100'),
(105, 1, 1, '', 'order.op.export', '导出订单', 1520769204, '114.242.249.100'),
(106, 1, 1, '订单-操作-确认取货(自提单)', 'order.op.fetch', '订单确认取货 ID: 3 订单号: SH20180311195431662655', 1520769443, '114.242.249.100'),
(107, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 10<br>是否参与分销 -- 是', 1520770141, '114.242.249.100'),
(108, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 10<br>是否参与分销 -- 是', 1520770245, '114.242.249.100'),
(109, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 10<br>是否参与分销 -- 是', 1520770351, '114.242.249.100'),
(110, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 10<br>是否参与分销 -- 是', 1520770429, '114.242.249.100'),
(111, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 10<br>是否参与分销 -- 是', 1520770472, '114.242.249.100'),
(112, 1, 1, '', 'order.op.export', '导出订单', 1520770632, '114.242.249.100'),
(113, 1, 1, '', 'order.op.export', '导出订单', 1520770655, '114.242.249.100'),
(114, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 10<br>是否参与分销 -- 是', 1520771413, '114.242.249.100'),
(115, 1, 1, '商品管理-添加', 'goods.add', '添加商品 ID: 11<br>是否参与分销 -- 是', 1520771983, '114.242.249.100'),
(116, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 11<br>是否参与分销 -- 是', 1520772023, '114.242.249.100'),
(117, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 11<br>是否参与分销 -- 是', 1520772040, '114.242.249.100'),
(118, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 11<br>是否参与分销 -- 是', 1520772048, '114.242.249.100'),
(119, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 11<br>是否参与分销 -- 是', 1520772069, '114.242.249.100'),
(120, 1, 1, '商品管理-添加', 'goods.add', '添加商品 ID: 12<br>是否参与分销 -- 是', 1520772272, '114.242.249.100'),
(121, 1, 1, '', 'case.author.edit', '隐藏', 1520832877, '39.79.101.95'),
(122, 1, 1, '', 'case.author.edit', '隐藏', 1520832877, '39.79.101.95'),
(123, 1, 1, '商品管理-添加', 'goods.add', '添加商品 ID: 13<br>是否参与分销 -- 是', 1520833766, '39.79.101.95'),
(124, 1, 1, '', 'order.op.export', '导出订单', 1520836918, '111.201.144.68'),
(125, 1, 1, '', 'order.op.export', '导出订单', 1520837064, '111.201.144.68'),
(126, 1, 1, '商品管理-添加', 'goods.add', '添加商品 ID: 14<br>是否参与分销 -- 是', 1520837390, '111.201.144.68'),
(127, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 14<br>是否参与分销 -- 是', 1520837401, '111.201.144.68'),
(128, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 14<br>是否参与分销 -- 是', 1520837483, '111.201.144.68'),
(129, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 14<br>是否参与分销 -- 是', 1520837757, '111.201.144.68'),
(130, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 14<br>是否参与分销 -- 是', 1520838015, '111.201.144.68'),
(131, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 14<br>是否参与分销 -- 是', 1520838042, '111.201.144.68'),
(132, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 14<br>是否参与分销 -- 是', 1520838073, '111.201.144.68'),
(133, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 14<br>是否参与分销 -- 是', 1520838102, '111.201.144.68'),
(134, 1, 1, '商品管理-修改', 'goods.edit', '编辑商品 ID: 7<br>是否参与分销 -- 是', 1520838829, '111.201.144.68'),
(135, 1, 1, '', 'case.product.edit', '修改作品 ID: 1', 1520838932, '111.201.144.68'),
(136, 1, 1, '商城管理-评价-添加', 'shop.comment.add', '添加虚拟评价 ID: 2 商品ID: 2 商品标题: 日漫风', 1520839914, '111.201.144.68'),
(137, 1, 1, '商城管理-评价-编辑', 'shop.comment.edit', '编辑商品虚拟评价 ID: 2 商品ID: 2 商品标题: 日漫风', 1520839948, '111.201.144.68'),
(138, 1, 1, '', 'shop.category.add', '添加分类 ID: 1191', 1520840417, '111.201.144.68'),
(139, 1, 1, '', 'shop.category.delete', '删除分类 ID: 1191 分类名称: 实物', 1520840459, '111.201.144.68'),
(140, 1, 1, '商城管理-幻灯片-添加', 'shop.adv.add', '添加幻灯片 ID: 17', 1520840629, '111.201.144.68'),
(141, 1, 1, '设置-交易设置-修改', 'sysset.trade.edit', '修改系统设置-交易设置', 1520848113, '39.79.101.95'),
(142, 1, 1, '', 'order.op.export', '导出订单', 1520848163, '39.79.101.95'),
(143, 1, 1, '', 'order.op.export', '导出订单', 1520848347, '39.79.101.95'),
(144, 1, 1, '设置-交易设置-修改', 'sysset.trade.edit', '修改系统设置-交易设置', 1520848928, '111.201.145.227'),
(145, 1, 1, '设置-交易设置-修改', 'sysset.trade.edit', '修改系统设置-交易设置', 1520848952, '111.201.145.227'),
(146, 1, 1, '设置-交易设置-修改', 'sysset.trade.edit', '修改系统设置-交易设置', 1520848973, '111.201.145.227'),
(147, 1, 1, '', 'order.op.export', '导出订单', 1520848998, '111.201.145.227');

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_perm_plugin`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_perm_plugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acid` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `type` tinyint(3) DEFAULT '0',
  `plugins` text,
  `coms` text,
  `datas` text,
  PRIMARY KEY (`id`),
  KEY `idx_uid` (`uid`),
  KEY `idx_acid` (`acid`),
  KEY `idx_type` (`type`),
  KEY `idx_uniacid` (`acid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_perm_role`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_perm_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `rolename` varchar(255) DEFAULT '',
  `status` tinyint(3) DEFAULT '0',
  `perms` text,
  `deleted` tinyint(3) DEFAULT '0',
  `perms2` text,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_status` (`status`),
  KEY `idx_deleted` (`deleted`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `ims_ewei_shop_perm_role`
--

INSERT INTO `ims_ewei_shop_perm_role` (`id`, `uniacid`, `rolename`, `status`, `perms`, `deleted`, `perms2`) VALUES
(10, 1, '管理员', 1, NULL, 0, 'shop,shop.adv,shop.adv.main,shop.adv.view,shop.adv.add,shop.adv.edit,shop.adv.delete,shop.nav,shop.nav.main,shop.nav.view,shop.nav.add,shop.nav.edit,shop.nav.delete,shop.banner,shop.banner.main,shop.banner.view,shop.banner.add,shop.banner.edit,shop.banner.delete,shop.cube,shop.cube.main,shop.cube.edit,shop.recommand,shop.recommand.main,shop.recommand.setstyle,shop.sort,shop.sort.main,shop.dispatch,shop.dispatch.main,shop.dispatch.view,shop.dispatch.add,shop.dispatch.edit,shop.dispatch.delete,shop.notice,shop.notice.main,shop.notice.view,shop.notice.add,shop.notice.edit,shop.notice.delete,shop.comment,shop.comment.main,shop.comment.add,shop.comment.edit,shop.comment.post,shop.comment.delete,shop.refundaddress,shop.refundaddress.main,shop.refundaddress.view,shop.refundaddress.add,shop.refundaddress.edit,shop.refundaddress.delete,shop.verify.saler,shop.verify.saler.main,shop.verify.saler.view,shop.verify.saler.add,shop.verify.saler.edit,shop.verify.saler.delete,shop.verify.store,shop.verify.store.main,shop.verify.store.view,shop.verify.store.add,shop.verify.store.edit,shop.verify.store.delete,shop.verify.set,shop.verify.set.main,shop.verify.set.edit,goods,goods,goods.main,goods.view,goods.add,goods.edit,goods.delete,goods.delete1,goods.restore,goods.category,goods.category.add,goods.category.edit,goods.category.delete,goods.group,goods.group.view,goods.group.add,goods.group.edit,goods.group.delete,goods.label,goods.label.view,goods.label.add,goods.label.edit,goods.label.delete,goods.virtual.temp,goods.virtual.temp.view,goods.virtual.temp.add,goods.virtual.temp.edit,goods.virtual.temp.delete,goods.virtual.category,goods.virtual.category.add,goods.virtual.category.edit,goods.virtual.category.delete,goods.virtual.data,goods.virtual.data.add,goods.virtual.data.edit,goods.virtual.data.delete,goods.virtual.data.export,goods.virtual.data.temp,goods.virtual.data.import,member,member.group,member.group.main,member.group.add,member.group.edit,member.group.delete,member.level,member.level.main,member.level.add,member.level.edit,member.level.delete,member.list,member.list.view,member.list.edit,member.list.detail,member.list.delete,member.rank,member.rank.main,member.rank.edit,member.tmessage,member.tmessage.send,order,order.detail,order.detail.edit,order.export,order.export.main,order.batchsend,order.batchsend.main,order.list,order.list.main,order.list.status_1,order.list.status0,order.list.status1,order.list.status2,order.list.status3,order.list.status4,order.list.status5,order.op,order.op.delete,order.op.pay,order.op.send,order.op.sendcancel,order.op.finish,order.op.verify,order.op.fetch,order.op.close,order.op.changeprice,order.op.changeaddress,order.op.remarksaler,order.op.paycancel,order.op.fetchcancel,order.op.refund,order.op.refund.main,order.op.refund.submit,store,store,store.main,store.view,store.add,store.edit,store.delete,store.set,store.goods,store.goods.add,store.goods.edit,store.goods.delete,store.goodsgroup,store.goodsgroup.main,store.goodsgroup.add,store.goodsgroup.edit,store.goodsgroup.view,store.goodsgroup.delete,store.storegroup,store.storegroup.main,store.storegroup.add,store.storegroup.edit,store.storegroup.view,store.storegroup.delete,store.saler,store.saler.main,store.saler.add,store.saler.edit,store.saler.view,store.saler.delete,store.verifygoods,store.verifygoods.edit,store.verifygoods.view,store.verifygoods.deletelog,store.verifylog,store.verifylog.main,finance,finance.log,finance.log.recharge,finance.log.withdraw,finance.log.refund,finance.log.wechat,finance.log.manual,finance.log.refuse,finance.log.recharge.export,finance.log.withdraw.export,finance.downloadbill,finance.downloadbill.main,finance.recharge,finance.recharge.credit1,finance.recharge.credit2,finance.credit,finance.credit.credit1,finance.credit.credit1.export,finance.credit.credit2,finance.credit.credit2.export,statistics,statistics.sale,statistics.sale.main,statistics.sale.export,statistics.sale_analysis,statistics.sale_analysis.main,statistics.order,statistics.order.main,statistics.order.export,statistics.goods,statistics.goods.main,statistics.goods.export,statistics.goods_rank,statistics.goods_rank.main,statistics.goods_rank.export,statistics.goods_trans,statistics.goods_trans.main,statistics.goods_trans.export,statistics.member_cost,statistics.member_cost.main,statistics.member_cost.export,statistics.member_increase,statistics.member_increase.main,sysset,sysset.shop,sysset.shop.main,sysset.shop.edit,sysset.follow,sysset.follow.main,sysset.follow.edit,sysset.notice,sysset.notice.edit,sysset.trade,sysset.trade.main,sysset.trade.edit,sysset.payset,sysset.payset.edit,sysset.payment,sysset.payment.add,sysset.payment.edit,sysset.payment.delete,sysset.templat,sysset.templat.main,sysset.templat.edit,sysset.member,sysset.member.main,sysset.member.edit,sysset.category,sysset.category.main,sysset.category.edit,sysset.contact,sysset.contact.main,sysset.contact.edit,sysset.area,sysset.area.main,sysset.area.edit,sysset.qiniu,sysset.qiniu.main,sysset.qiniu.edit,sysset.close,sysset.close.main,sysset.close.edit,sysset.tmessage,sysset.tmessage.main,sysset.tmessage.add,sysset.tmessage.edit,sysset.tmessage.delete,sysset.wap,sysset.wap.main,sysset.wap.edit,sysset.express,sysset.express.main,sysset.express.edit,sysset.printer,sysset.printer.main,sysset.printer.printer_list,sysset.printer.printer_add,sysset.printer.printer_edit,sysset.printer.printer_delete,sysset.printer.add,sysset.printer.edit,sysset.printer.delete,sysset.printer.set,sysset.sms.set,sysset.sms.set.main,sysset.sms.temp,sysset.sms.temp.main,sysset.sms.temp.view,sysset.sms.temp.add,sysset.sms.temp.edit,sysset.sms.temp.delete,sysset.sms.temp.testsend,sysset.cover.shop,sysset.cover.shop.main,sysset.cover.shop.edit,sysset.cover.member,sysset.cover.member.main,sysset.cover.member.edit,sysset.cover.favorite,sysset.cover.favorite.main,sysset.cover.favorite.edit,sysset.cover.cart,sysset.cover.cart.main,sysset.cover.cart.edit,sysset.cover.order,sysset.cover.order.main,sysset.cover.order.edit,sysset.cover.coupon,sysset.cover.coupon.main,sysset.cover.coupon.edit,commission,commission.agent,commission.agent.main,commission.agent.edit,commission.agent.delete,commission.agent.user,commission.agent.export,commission.agent.changeagent,commission.level,commission.level.main,commission.level.add,commission.level.edit,commission.level.delete,commission.buylevel,commission.buylevel.main,commission.buylevel.add,commission.buylevel.edit,commission.buylevel.delete,commission.apply,commission.apply.view1,commission.apply.view2,commission.apply.view3,commission.apply.view_1,commission.apply.detail,commission.apply.check,commission.apply.pay,commission.apply.cancel,commission.apply.refuse,commission.apply.changecommission,commission.apply.export,commission.increase,commission.increase.main,commission.rank,commission.rank.main,commission.rank.edit,commission.notice,commission.notice.main,commission.notice.edit,commission.cover,commission.cover.main,commission.cover.edit,commission.set,commission.set.main,commission.set.edit,diyform,diyform.temp,diyform.temp.main,diyform.temp.view,diyform.temp.add,diyform.temp.edit,diyform.temp.delete,diyform.data,diyform.data.main,diyform.category,diyform.category.main,diyform.category.edit,diyform.set,diyform.set.main,diyform.set.edit,article,article,article.main,article.add,article.edit,article.delete,article.record,article.category,article.category.main,article.category.edit,article.category.delete,article.report,article.report.main,article.set,article.set.view,article.set.edit,perm,perm.log,perm.log.main,perm.role,perm.role.main,perm.role.add,perm.role.edit,perm.role.delete,perm.user,perm.user.main,perm.user.add,perm.user.edit,perm.user.delete,qa,qa.adv,qa.adv.main,qa.adv.add,qa.adv.edit,qa.adv.view,qa.adv.delete,qa.question,qa.question.main,qa.question.view,qa.question.add,qa.question.edit,qa.question.delete,qa.category,qa.category.main,qa.category.view,qa.category.add,qa.category.edit,qa.category.delete,qa.set,qa.set.main,qa.set.save,sign,sign.rule,sign.rule.main,sign.rule.edit,sign.set,sign.set.main,sign.set.edit,sign.records,sign.records.main,cashier,cashier.user,cashier.user.main,cashier.user.add,cashier.user.edit,cashier.user.view,cashier.user.delete,cashier.category,cashier.category.main,cashier.category.add,cashier.category.edit,cashier.category.view,cashier.category.delete,cashier.set,cashier.set.view,cashier.set.edit,cashier.notice,cashier.notice.view,cashier.notice.edit,cashier.clearing,cashier.clearing.main,cashier.clearing.edit,messages,messages,messages.main,messages.run,messages.add,messages.edit,messages.view,messages.delete,messages.template,messages.template.view,messages.template.add,messages.template.edit,messages.template.delete'),
(11, 4, '管理员', 1, NULL, 0, 'shop,shop.adv,shop.adv.main,shop.adv.view,shop.adv.add,shop.adv.edit,shop.adv.delete,shop.nav,shop.nav.main,shop.nav.view,shop.nav.add,shop.nav.edit,shop.nav.delete,shop.banner,shop.banner.main,shop.banner.view,shop.banner.add,shop.banner.edit,shop.banner.delete,shop.cube,shop.cube.main,shop.cube.edit,shop.recommand,shop.recommand.main,shop.recommand.setstyle,shop.sort,shop.sort.main,shop.dispatch,shop.dispatch.main,shop.dispatch.view,shop.dispatch.add,shop.dispatch.edit,shop.dispatch.delete,shop.notice,shop.notice.main,shop.notice.view,shop.notice.add,shop.notice.edit,shop.notice.delete,shop.comment,shop.comment.main,shop.comment.add,shop.comment.edit,shop.comment.post,shop.comment.delete,shop.refundaddress,shop.refundaddress.main,shop.refundaddress.view,shop.refundaddress.add,shop.refundaddress.edit,shop.refundaddress.delete,goods,goods,goods.main,goods.view,goods.add,goods.edit,goods.delete,goods.delete1,goods.restore,goods.category,goods.category.add,goods.category.edit,goods.category.delete,goods.group,goods.group.view,goods.group.add,goods.group.edit,goods.group.delete,goods.label,goods.label.view,goods.label.add,goods.label.edit,goods.label.delete,member,member.group,member.group.main,member.group.add,member.group.edit,member.group.delete,member.level,member.level.main,member.level.add,member.level.edit,member.level.delete,member.list,member.list.view,member.list.edit,member.list.detail,member.list.delete,member.rank,member.rank.main,member.rank.edit,member.tmessage,member.tmessage.send,order,order.detail,order.detail.edit,order.export,order.export.main,order.batchsend,order.batchsend.main,order.list,order.list.main,order.list.status_1,order.list.status0,order.list.status1,order.list.status2,order.list.status3,order.list.status4,order.list.status5,order.op,order.op.delete,order.op.pay,order.op.send,order.op.sendcancel,order.op.finish,order.op.verify,order.op.fetch,order.op.close,order.op.changeprice,order.op.changeaddress,order.op.remarksaler,order.op.paycancel,order.op.fetchcancel,order.op.refund,order.op.refund.main,order.op.refund.submit,store,store,store.main,store.view,store.add,store.edit,store.delete,store.set,store.goods,store.goods.add,store.goods.edit,store.goods.delete,store.goodsgroup,store.goodsgroup.main,store.goodsgroup.add,store.goodsgroup.edit,store.goodsgroup.view,store.goodsgroup.delete,store.storegroup,store.storegroup.main,store.storegroup.add,store.storegroup.edit,store.storegroup.view,store.storegroup.delete,store.saler,store.saler.main,store.saler.add,store.saler.edit,store.saler.view,store.saler.delete,store.verifygoods,store.verifygoods.edit,store.verifygoods.view,store.verifygoods.deletelog,store.verifylog,store.verifylog.main,finance,finance.log,finance.log.recharge,finance.log.withdraw,finance.log.refund,finance.log.wechat,finance.log.manual,finance.log.refuse,finance.log.recharge.export,finance.log.withdraw.export,finance.downloadbill,finance.downloadbill.main,finance.recharge,finance.recharge.credit1,finance.recharge.credit2,finance.credit,finance.credit.credit1,finance.credit.credit1.export,finance.credit.credit2,finance.credit.credit2.export,statistics,statistics.sale,statistics.sale.main,statistics.sale.export,statistics.sale_analysis,statistics.sale_analysis.main,statistics.order,statistics.order.main,statistics.order.export,statistics.goods,statistics.goods.main,statistics.goods.export,statistics.goods_rank,statistics.goods_rank.main,statistics.goods_rank.export,statistics.goods_trans,statistics.goods_trans.main,statistics.goods_trans.export,statistics.member_cost,statistics.member_cost.main,statistics.member_cost.export,statistics.member_increase,statistics.member_increase.main,sysset,sysset.shop,sysset.shop.main,sysset.shop.edit,sysset.follow,sysset.follow.main,sysset.follow.edit,sysset.notice,sysset.notice.edit,sysset.trade,sysset.trade.main,sysset.trade.edit,sysset.payset,sysset.payset.edit,sysset.payment,sysset.payment.add,sysset.payment.edit,sysset.payment.delete,sysset.templat,sysset.templat.main,sysset.templat.edit,sysset.member,sysset.member.main,sysset.member.edit,sysset.category,sysset.category.main,sysset.category.edit,sysset.contact,sysset.contact.main,sysset.contact.edit,sysset.area,sysset.area.main,sysset.area.edit,sysset.close,sysset.close.main,sysset.close.edit,sysset.tmessage,sysset.tmessage.main,sysset.tmessage.add,sysset.tmessage.edit,sysset.tmessage.delete,sysset.wap,sysset.wap.main,sysset.wap.edit,sysset.express,sysset.express.main,sysset.express.edit,sysset.printer,sysset.printer.main,sysset.printer.printer_list,sysset.printer.printer_add,sysset.printer.printer_edit,sysset.printer.printer_delete,sysset.printer.add,sysset.printer.edit,sysset.printer.delete,sysset.printer.set,sysset.cover.shop,sysset.cover.shop.main,sysset.cover.shop.edit,sysset.cover.member,sysset.cover.member.main,sysset.cover.member.edit,sysset.cover.favorite,sysset.cover.favorite.main,sysset.cover.favorite.edit,sysset.cover.cart,sysset.cover.cart.main,sysset.cover.cart.edit,sysset.cover.order,sysset.cover.order.main,sysset.cover.order.edit,sysset.cover.coupon,sysset.cover.coupon.main,sysset.cover.coupon.edit,sale,sale.wxcard,sale.wxcard.view,sale.wxcard.add,sale.wxcard.edit,sale.wxcard.stock,sale.wxcard.qrcode,sale.wxcard.delete,sale.wxcard.set,sale.virtual,sale.virtual.view,sale.virtual.edit,sale.package,sale.package.view,sale.package.add,sale.package.edit,sale.package.delete1,sale.gift,sale.gift.view,sale.gift.add,sale.gift.edit,sale.gift.delete1,sale.fullback,sale.fullback.view,sale.fullback.add,sale.fullback.edit,sale.fullback.delete1,sale.peerpay,sale.peerpay.main,sale.peerpay.edit,commission,commission.agent,commission.agent.main,commission.agent.edit,commission.agent.delete,commission.agent.user,commission.agent.export,commission.agent.changeagent,commission.level,commission.level.main,commission.level.add,commission.level.edit,commission.level.delete,commission.buylevel,commission.buylevel.main,commission.buylevel.add,commission.buylevel.edit,commission.buylevel.delete,commission.apply,commission.apply.view1,commission.apply.view2,commission.apply.view3,commission.apply.view_1,commission.apply.detail,commission.apply.check,commission.apply.pay,commission.apply.cancel,commission.apply.refuse,commission.apply.changecommission,commission.apply.export,commission.increase,commission.increase.main,commission.rank,commission.rank.main,commission.rank.edit,commission.notice,commission.notice.main,commission.notice.edit,commission.cover,commission.cover.main,commission.cover.edit,commission.set,commission.set.main,commission.set.edit,poster,poster,poster.main,poster.view,poster.add,poster.edit,poster.delete,poster.clear,poster.log,poster.log.main,poster.scan,poster.scan.main,taobao,taobao,taobao.main,taobao.jingdong,taobao.jingdong.main,taobao.one688,taobao.one688.main,taobao.taobaocsv,taobao.taobaocsv.main,article,article,article.main,article.add,article.edit,article.delete,article.record,article.category,article.category.main,article.category.edit,article.category.delete,article.report,article.report.main,article.set,article.set.view,article.set.edit,exhelper,exhelper.sender,exhelper.sender.main,exhelper.sender.view,exhelper.sender.add,exhelper.sender.edit,exhelper.sender.delete,exhelper.short,exhelper.short.main,exhelper.short.edit,exhelper.printset,exhelper.printset.main,exhelper.printset.edit,exhelper.print.single,exhelper.print.single.express,exhelper.print.single.invoice,exhelper.print.single.dosend,exhelper.print.batch,exhelper.print.batch.express,exhelper.print.batch.invoice,exhelper.print.batch.dosend,exhelper.temp.express,exhelper.temp.express.add,exhelper.temp.express.edit,exhelper.temp.express.delete,exhelper.temp.invoice,exhelper.temp.invoice.add,exhelper.temp.invoice.edit,exhelper.temp.invoice.delete,diypage,diypage.menu,diypage.menu.main,diypage.menu.add,diypage.menu.edit,diypage.menu.delete,diypage.temp,diypage.temp.main,diypage.temp.delete,diypage.page.sys,diypage.page.sys.main,diypage.page.sys.add,diypage.page.sys.edit,diypage.page.sys.delete,diypage.page.sys.savetemp,diypage.page.plu,diypage.page.plu.main,diypage.page.plu.add,diypage.page.plu.edit,diypage.page.plu.delete,diypage.page.plu.savetemp,diypage.page.diy,diypage.page.diy.main,diypage.page.diy.add,diypage.page.diy.edit,diypage.page.diy.delete,diypage.page.diy.savetemp,diypage.page.mod,diypage.page.mod.main,diypage.page.mod.add,diypage.page.mod.edit,diypage.page.mod.delete,diypage.shop.page,diypage.shop.page.main,diypage.shop.page.save,diypage.shop.menu,diypage.shop.menu.main,diypage.shop.menu.save,diypage.shop.layer,diypage.shop.layer.main,diypage.shop.followbar,diypage.shop.followbar.main,diypage.shop.danmu,diypage.shop.danmu.main,diypage.shop.adv,diypage.shop.adv.main,diypage.shop.adv.add,diypage.shop.adv.edit,diypage.shop.adv.delete,diypage.temp.category,diypage.temp.category.main,diypage.temp.category.add,diypage.temp.category.edit,diypage.temp.category.delete,merch,merch.reg,merch.reg.detail,merch.reg.delete,merch.user,merch.user.view,merch.user.add,merch.user.edit,merch.user.delete,merch.group,merch.group.view,merch.group.add,merch.group.edit,merch.group.delete,merch.category,merch.category.view,merch.category.add,merch.category.edit,merch.category.delete,merch.statistics,merch.statistics.order,merch.statistics.order.export,merch.statistics.merch,merch.statistics.merch.export,merch.check,merch.check.status1,merch.check.status2,merch.check.status3,merch.check.status_1,merch.check.confirm,merch.check.pay,merch.check.refuse,merch.check.export,merch.check.detail,merch.check.detail.export,merch.notice,merch.notice.main,merch.notice.edit,merch.cover,merch.cover.main,merch.cover.edit,merch.cover.register,merch.cover.merchlist,merch.cover.merchuser,merch.set,merch.set.main,merch.set.edit,merch.category.swipe,merch.category.swipe.view,merch.category.swipe.add,merch.category.swipe.edit,merch.category.swipe.delete,qa,qa.adv,qa.adv.main,qa.adv.add,qa.adv.edit,qa.adv.view,qa.adv.delete,qa.question,qa.question.main,qa.question.view,qa.question.add,qa.question.edit,qa.question.delete,qa.category,qa.category.main,qa.category.view,qa.category.add,qa.category.edit,qa.category.delete,qa.set,qa.set.main,qa.set.save,messages,messages,messages.main,messages.run,messages.add,messages.edit,messages.view,messages.delete,messages.template,messages.template.view,messages.template.add,messages.template.edit,messages.template.delete,mmanage,mmanage.setting,mmanage.setting.main,mmanage.setting.save'),
(12, 6, '管理员', 1, NULL, 0, 'shop,shop.adv,shop.adv.main,shop.adv.view,shop.adv.add,shop.adv.edit,shop.adv.delete,shop.nav,shop.nav.main,shop.nav.view,shop.nav.add,shop.nav.edit,shop.nav.delete,shop.section,shop.section.main,shop.section.view,shop.section.add,shop.section.edit,shop.section.delete,shop.banner,shop.banner.main,shop.banner.view,shop.banner.add,shop.banner.edit,shop.banner.delete,shop.cube,shop.cube.main,shop.cube.edit,shop.recommand,shop.recommand.main,shop.recommand.setstyle,shop.sort,shop.sort.main,shop.dispatch,shop.dispatch.main,shop.dispatch.view,shop.dispatch.add,shop.dispatch.edit,shop.dispatch.delete,shop.notice,shop.notice.main,shop.notice.view,shop.notice.add,shop.notice.edit,shop.notice.delete,shop.comment,shop.comment.main,shop.comment.add,shop.comment.edit,shop.comment.post,shop.comment.delete,shop.refundaddress,shop.refundaddress.main,shop.refundaddress.view,shop.refundaddress.add,shop.refundaddress.edit,shop.refundaddress.delete,shop.verify.saler,shop.verify.saler.main,shop.verify.saler.view,shop.verify.saler.add,shop.verify.saler.edit,shop.verify.saler.delete,shop.verify.store,shop.verify.store.main,shop.verify.store.view,shop.verify.store.add,shop.verify.store.edit,shop.verify.store.delete,shop.verify.set,shop.verify.set.main,shop.verify.set.edit,goods,goods,goods.main,goods.view,goods.add,goods.edit,goods.delete,goods.delete1,goods.restore,goods.category,goods.category.add,goods.category.edit,goods.category.delete,goods.group,goods.group.view,goods.group.add,goods.group.edit,goods.group.delete,goods.label,goods.label.view,goods.label.add,goods.label.edit,goods.label.delete,member,member.group,member.group.main,member.group.add,member.group.edit,member.group.delete,member.level,member.level.main,member.level.add,member.level.edit,member.level.delete,member.list,member.list.view,member.list.add,member.list.edit,member.list.detail,member.list.delete,member.recharge,member.recharge.main,member.pay,member.pay.main,member.offline,member.offline.main,member.rank,member.rank.main,member.rank.edit,member.tmessage,member.tmessage.send,order,order.detail,order.detail.edit,order.export,order.export.main,order.batchsend,order.batchsend.main,order.list,order.list.main,order.list.status_1,order.list.status0,order.list.status1,order.list.status2,order.list.status3,order.list.status4,order.list.status5,order.op,order.op.delete,order.op.pay,order.op.send,order.op.sendcancel,order.op.finish,order.op.verify,order.op.fetch,order.op.close,order.op.changeprice,order.op.changeaddress,order.op.remarksaler,order.op.paycancel,order.op.fetchcancel,order.op.refund,order.op.refund.main,order.op.refund.submit,store,store,store.main,store.view,store.add,store.edit,store.delete,store.set,store.goods,store.goods.add,store.goods.edit,store.goods.delete,store.goodsgroup,store.goodsgroup.main,store.goodsgroup.add,store.goodsgroup.edit,store.goodsgroup.view,store.goodsgroup.delete,store.storegroup,store.storegroup.main,store.storegroup.add,store.storegroup.edit,store.storegroup.view,store.storegroup.delete,store.saler,store.saler.main,store.saler.add,store.saler.edit,store.saler.view,store.saler.delete,store.verifygoods,store.verifygoods.edit,store.verifygoods.view,store.verifygoods.deletelog,store.verifylog,store.verifylog.main,finance,finance.log,finance.log.recharge,finance.log.withdraw,finance.log.refund,finance.log.wechat,finance.log.manual,finance.log.refuse,finance.log.recharge.export,finance.log.withdraw.export,finance.log.printer,finance.downloadbill,finance.downloadbill.main,finance.recharge,finance.recharge.credit1,finance.recharge.credit2,finance.credit,finance.credit.credit1,finance.credit.credit1.export,finance.credit.credit2,finance.credit.credit2.export,statistics,statistics.sale,statistics.sale.main,statistics.sale.export,statistics.sale_analysis,statistics.sale_analysis.main,statistics.order,statistics.order.main,statistics.order.export,statistics.goods,statistics.goods.main,statistics.goods.export,statistics.goods_rank,statistics.goods_rank.main,statistics.goods_rank.export,statistics.goods_trans,statistics.goods_trans.main,statistics.goods_trans.export,statistics.member_cost,statistics.member_cost.main,statistics.member_cost.export,statistics.member_increase,statistics.member_increase.main,sysset,sysset.shop,sysset.shop.main,sysset.shop.edit,sysset.follow,sysset.follow.main,sysset.follow.edit,sysset.notice,sysset.notice.edit,sysset.trade,sysset.trade.main,sysset.trade.edit,sysset.payset,sysset.payset.edit,sysset.payment,sysset.payment.add,sysset.payment.edit,sysset.payment.delete,sysset.templat,sysset.templat.main,sysset.templat.edit,sysset.member,sysset.member.main,sysset.member.edit,sysset.category,sysset.category.main,sysset.category.edit,sysset.contact,sysset.contact.main,sysset.contact.edit,sysset.area,sysset.area.main,sysset.area.edit,sysset.close,sysset.close.main,sysset.close.edit,sysset.tmessage,sysset.tmessage.main,sysset.tmessage.add,sysset.tmessage.edit,sysset.tmessage.delete,sysset.wap,sysset.wap.main,sysset.wap.edit,sysset.express,sysset.express.main,sysset.express.edit,sysset.printer,sysset.printer.main,sysset.printer.printer_list,sysset.printer.printer_add,sysset.printer.printer_edit,sysset.printer.printer_delete,sysset.printer.add,sysset.printer.edit,sysset.printer.delete,sysset.printer.set,sysset.cover.shop,sysset.cover.shop.main,sysset.cover.shop.edit,sysset.cover.member,sysset.cover.member.main,sysset.cover.member.edit,sysset.cover.favorite,sysset.cover.favorite.main,sysset.cover.favorite.edit,sysset.cover.cart,sysset.cover.cart.main,sysset.cover.cart.edit,sysset.cover.order,sysset.cover.order.main,sysset.cover.order.edit,sysset.cover.coupon,sysset.cover.coupon.main,sysset.cover.coupon.edit,sale,sale.virtual,sale.virtual.view,sale.virtual.edit,sale.enough,sale.enough.main,sale.enough.edit,sale.recharge,sale.recharge.main,sale.recharge.edit,commission,commission.agent,commission.agent.main,commission.agent.edit,commission.agent.delete,commission.agent.user,commission.agent.export,commission.agent.changeagent,commission.level,commission.level.main,commission.level.add,commission.level.edit,commission.level.delete,commission.buylevel,commission.buylevel.main,commission.buylevel.add,commission.buylevel.edit,commission.buylevel.delete,commission.apply,commission.apply.view1,commission.apply.view2,commission.apply.view3,commission.apply.view_1,commission.apply.detail,commission.apply.check,commission.apply.pay,commission.apply.cancel,commission.apply.refuse,commission.apply.changecommission,commission.apply.export,commission.increase,commission.increase.main,commission.rank,commission.rank.main,commission.rank.edit,commission.notice,commission.notice.main,commission.notice.edit,commission.cover,commission.cover.main,commission.cover.edit,commission.set,commission.set.main,commission.set.edit,diyform,diyform.temp,diyform.temp.main,diyform.temp.view,diyform.temp.add,diyform.temp.edit,diyform.temp.delete,diyform.data,diyform.data.main,diyform.category,diyform.category.main,diyform.category.edit,diyform.set,diyform.set.main,diyform.set.edit,poster,poster,poster.main,poster.view,poster.add,poster.edit,poster.delete,poster.clear,poster.log,poster.log.main,poster.scan,poster.scan.main,postera,postera,postera.main,postera.view,postera.add,postera.edit,postera.delete,postera.clear,postera.log,postera.log.main,taobao,taobao,taobao.main,taobao.jingdong,taobao.jingdong.main,taobao.one688,taobao.one688.main,taobao.taobaocsv,taobao.taobaocsv.main,article,article,article.main,article.add,article.edit,article.delete,article.record,article.category,article.category.main,article.category.edit,article.category.delete,article.report,article.report.main,article.set,article.set.view,article.set.edit,exhelper,exhelper.sender,exhelper.sender.main,exhelper.sender.view,exhelper.sender.add,exhelper.sender.edit,exhelper.sender.delete,exhelper.short,exhelper.short.main,exhelper.short.edit,exhelper.printset,exhelper.printset.main,exhelper.printset.edit,exhelper.print.single,exhelper.print.single.express,exhelper.print.single.invoice,exhelper.print.single.dosend,exhelper.print.batch,exhelper.print.batch.express,exhelper.print.batch.invoice,exhelper.print.batch.dosend,exhelper.temp.express,exhelper.temp.express.add,exhelper.temp.express.edit,exhelper.temp.express.delete,exhelper.temp.invoice,exhelper.temp.invoice.add,exhelper.temp.invoice.edit,exhelper.temp.invoice.delete,qa,qa.adv,qa.adv.main,qa.adv.add,qa.adv.edit,qa.adv.view,qa.adv.delete,qa.question,qa.question.main,qa.question.view,qa.question.add,qa.question.edit,qa.question.delete,qa.category,qa.category.main,qa.category.view,qa.category.add,qa.category.edit,qa.category.delete,qa.set,qa.set.main,qa.set.save,cashier,cashier.user,cashier.user.main,cashier.user.add,cashier.user.edit,cashier.user.view,cashier.user.delete,cashier.category,cashier.category.main,cashier.category.add,cashier.category.edit,cashier.category.view,cashier.category.delete,cashier.set,cashier.set.view,cashier.set.edit,cashier.notice,cashier.notice.view,cashier.notice.edit,cashier.clearing,cashier.clearing.main,cashier.clearing.edit,messages,messages,messages.main,messages.run,messages.add,messages.edit,messages.view,messages.delete,messages.template,messages.template.view,messages.template.add,messages.template.edit,messages.template.delete,mmanage,mmanage.setting,mmanage.setting.main,mmanage.setting.save'),
(13, 6, '前台', 1, NULL, 0, 'member,member.list,member.list.view,member.list.add,member.list.edit,member.list.detail,member.list.delete,member.recharge,member.recharge.main,member.pay,member.pay.main,member.offline,member.offline.main,order,order.detail,order.detail.edit,order.export,order.export.main,order.batchsend,order.batchsend.main,order.list,order.list.main,order.list.status_1,order.list.status0,order.list.status1,order.list.status2,order.list.status3,order.list.status4,order.list.status5,order.op,order.op.pay,order.op.send,order.op.sendcancel,order.op.finish,order.op.verify,order.op.fetch,order.op.close,order.op.changeprice,order.op.changeaddress,order.op.remarksaler,order.op.paycancel,order.op.fetchcancel,finance,finance.log,finance.log.recharge,finance.log.refund,finance.log.recharge.export,finance.log.printer,finance.downloadbill,finance.downloadbill.main,finance.recharge,finance.recharge.credit1,finance.recharge.credit2,finance.credit,finance.credit.credit1,finance.credit.credit1.export,finance.credit.credit2,finance.credit.credit2.export');

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_perm_user`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_perm_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `username` varchar(255) DEFAULT '',
  `password` varchar(255) DEFAULT '',
  `roleid` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `perms` text,
  `deleted` tinyint(3) DEFAULT '0',
  `realname` varchar(255) DEFAULT '',
  `mobile` varchar(255) DEFAULT '',
  `perms2` text,
  `openid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_uid` (`uid`),
  KEY `idx_roleid` (`roleid`),
  KEY `idx_status` (`status`),
  KEY `idx_deleted` (`deleted`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `ims_ewei_shop_perm_user`
--

INSERT INTO `ims_ewei_shop_perm_user` (`id`, `uniacid`, `uid`, `username`, `password`, `roleid`, `status`, `perms`, `deleted`, `realname`, `mobile`, `perms2`, `openid`) VALUES
(2, 4, 3, 'testadmin', 'df539940755fe9fea9c07e13d9ea89e9d752e80e', 11, 1, NULL, 0, '', '', '', ''),
(3, 6, 6, 'qdhxgt', '6cdb0615976685286341f2b28968181fbd9db54c', 12, 1, NULL, 0, '', '', '', ''),
(4, 6, 7, 'hxgt_qt', 'a6b3dadea5b5fccccb77c3d07ebb491ef950ca6c', 13, 1, NULL, 0, '嵩山路', '', '', ''),
(5, 6, 8, 'hxgt_qt1', '', 13, 1, NULL, 0, '西三路前台', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_plugin`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_plugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `displayorder` int(11) DEFAULT '0',
  `identity` varchar(50) DEFAULT '',
  `name` varchar(50) DEFAULT '',
  `version` varchar(10) DEFAULT '',
  `author` varchar(20) DEFAULT '',
  `status` int(11) DEFAULT '0',
  `category` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `desc` text,
  `iscom` tinyint(3) DEFAULT '0',
  `deprecated` tinyint(3) DEFAULT '0',
  `isv2` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_displayorder` (`displayorder`),
  KEY `idx_identity` (`identity`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- 转存表中的数据 `ims_ewei_shop_plugin`
--

INSERT INTO `ims_ewei_shop_plugin` (`id`, `displayorder`, `identity`, `name`, `version`, `author`, `status`, `category`, `thumb`, `desc`, `iscom`, `deprecated`, `isv2`) VALUES
(6, 6, 'tmessage', '会员群发', '1.0', '官方', 1, 'tool', '../addons/ewei_shopv2/static/images/tmessage.jpg', '', 0, 0, 0),
(12, 11, 'article', '文章营销', '1.0', '官方', 1, 'help', '../addons/ewei_shopv2/static/images/article.jpg', '', 0, 0, 0),
(15, 16, 'system', '系统工具', '1.0', '官方', 0, 'help', '../addons/ewei_shopv2/static/images/system.jpg', NULL, 0, 1, 0),
(16, 15, 'diyform', '自定表单', '1.0', '官方', 1, 'help', '../addons/ewei_shopv2/static/images/diyform.jpg', '', 0, 0, 0),
(22, 26, 'qa', '帮助中心', '1.0', '官方', 1, 'help', '../addons/ewei_shopv2/static/images/qa.jpg', '', 0, 0, 1),
(34, 37, 'messages', '消息群发', '1.0', '官方', 1, 'tool', '../addons/ewei_shopv2/static/images/messages.jpg', '', 0, 0, 1),
(43, 11, 'case', '作品案例', '1.0', 'weshop', 1, 'biz', '../addons/ewei_shopv2/static/images/case.jpg', NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_polyapi_key`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_polyapi_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `merchid` int(11) NOT NULL DEFAULT '0',
  `appkey` varchar(200) NOT NULL DEFAULT '',
  `token` varchar(200) NOT NULL DEFAULT '',
  `appsecret` varchar(200) NOT NULL DEFAULT '',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `updatetime` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`) USING BTREE,
  KEY `idx_appkey` (`appkey`) USING BTREE,
  KEY `idx_token` (`token`) USING BTREE,
  KEY `idx_appsecret` (`appsecret`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_poster`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_poster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `type` tinyint(3) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `bg` varchar(255) DEFAULT '',
  `data` text,
  `keyword` varchar(255) DEFAULT '',
  `times` int(11) DEFAULT '0',
  `follows` int(11) DEFAULT '0',
  `isdefault` tinyint(3) DEFAULT '0',
  `resptitle` varchar(255) DEFAULT '',
  `respthumb` varchar(255) DEFAULT '',
  `createtime` int(11) DEFAULT '0',
  `respdesc` varchar(255) DEFAULT '',
  `respurl` varchar(255) DEFAULT '',
  `waittext` varchar(255) DEFAULT '',
  `oktext` varchar(255) DEFAULT '',
  `subcredit` int(11) DEFAULT '0',
  `submoney` decimal(10,2) DEFAULT '0.00',
  `reccredit` int(11) DEFAULT '0',
  `recmoney` decimal(10,2) DEFAULT '0.00',
  `paytype` tinyint(1) NOT NULL DEFAULT '0',
  `scantext` varchar(255) DEFAULT '',
  `subtext` varchar(255) DEFAULT '',
  `beagent` tinyint(3) DEFAULT '0',
  `bedown` tinyint(3) DEFAULT '0',
  `isopen` tinyint(3) DEFAULT '0',
  `opentext` varchar(255) DEFAULT '',
  `openurl` varchar(255) DEFAULT '',
  `templateid` varchar(255) DEFAULT '',
  `subpaycontent` text,
  `recpaycontent` varchar(255) DEFAULT '',
  `entrytext` varchar(255) DEFAULT '',
  `reccouponid` int(11) DEFAULT '0',
  `reccouponnum` int(11) DEFAULT '0',
  `subcouponid` int(11) DEFAULT '0',
  `subcouponnum` int(11) DEFAULT '0',
  `resptype` tinyint(3) DEFAULT '0',
  `resptext` text,
  `keyword2` varchar(255) DEFAULT '',
  `resptext11` text,
  `reward_totle` varchar(500) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_type` (`type`),
  KEY `idx_times` (`times`),
  KEY `idx_isdefault` (`isdefault`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `ims_ewei_shop_poster`
--

INSERT INTO `ims_ewei_shop_poster` (`id`, `uniacid`, `type`, `title`, `bg`, `data`, `keyword`, `times`, `follows`, `isdefault`, `resptitle`, `respthumb`, `createtime`, `respdesc`, `respurl`, `waittext`, `oktext`, `subcredit`, `submoney`, `reccredit`, `recmoney`, `paytype`, `scantext`, `subtext`, `beagent`, `bedown`, `isopen`, `opentext`, `openurl`, `templateid`, `subpaycontent`, `recpaycontent`, `entrytext`, `reccouponid`, `reccouponnum`, `subcouponid`, `subcouponnum`, `resptype`, `resptext`, `keyword2`, `resptext11`, `reward_totle`) VALUES
(5, 1, 4, '分销商推广海报', 'images/1/2017/09/bMP5juvm6Nw3gM5fjB3GB4G4TPw3V4.jpg', '[{"left":"91px","top":"181px","type":"qr","width":"133px","height":"133px","size":"3"},{"left":"63px","top":"92px","type":"head","width":"48px","height":"48px"},{"left":"131px","top":"96px","type":"nickname","width":"80px","height":"40px","size":"16px","color":"#000"}]', '', 0, 0, 1, '', '', 1506246813, '', '', '您的专属海报正在拼命生成中，请等待片刻...', '', 0, '0.00', 1, '0.00', 0, '', '', 0, 1, 0, '', '', '', '', '', '', 0, 0, 0, 0, 0, '', '二维码', NULL, '{"reccredit_totle":0,"recmoney_totle":0,"reccouponnum_totle":0}'),
(6, 6, 4, '海鲜锅贴推广海报', 'images/6/2017/11/hBb65bt67T575g757cTGtlTvVVtC5y.jpg', '[{"left":"48px","top":"92px","type":"head","width":"59px","height":"59px"},{"left":"132px","top":"97px","type":"nickname","width":"80px","height":"40px","size":"14px","color":"#000"},{"left":"107px","top":"192px","type":"qr","width":"97px","height":"97px","size":"5"}]', '', 0, 0, 1, '', '', 1511599337, '', '', '', '', 0, '0.00', 0, '0.00', 0, '', '', 0, 1, 0, '', '', '', '', '', '', 0, 0, 0, 0, 0, '', '推广海报', NULL, '{"reccredit_totle":0,"recmoney_totle":0,"reccouponnum_totle":0}');

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_postera`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_postera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `type` tinyint(3) DEFAULT '0',
  `days` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `bg` varchar(255) DEFAULT '',
  `data` text,
  `keyword` varchar(255) DEFAULT '',
  `isdefault` tinyint(3) DEFAULT '0',
  `resptitle` varchar(255) DEFAULT '',
  `respthumb` varchar(255) DEFAULT '',
  `createtime` int(11) DEFAULT '0',
  `respdesc` varchar(255) DEFAULT '',
  `respurl` varchar(255) DEFAULT '',
  `waittext` varchar(255) DEFAULT '',
  `oktext` varchar(255) DEFAULT '',
  `subcredit` int(11) DEFAULT '0',
  `submoney` decimal(10,2) DEFAULT '0.00',
  `reccredit` int(11) DEFAULT '0',
  `recmoney` decimal(10,2) DEFAULT '0.00',
  `scantext` varchar(255) DEFAULT '',
  `subtext` varchar(255) DEFAULT '',
  `beagent` tinyint(3) DEFAULT '0',
  `bedown` tinyint(3) DEFAULT '0',
  `isopen` tinyint(3) DEFAULT '0',
  `opentext` varchar(255) DEFAULT '',
  `openurl` varchar(255) DEFAULT '',
  `paytype` tinyint(1) NOT NULL DEFAULT '0',
  `subpaycontent` text,
  `recpaycontent` varchar(255) DEFAULT '',
  `templateid` varchar(255) DEFAULT '',
  `entrytext` varchar(255) DEFAULT '',
  `reccouponid` int(11) DEFAULT '0',
  `reccouponnum` int(11) DEFAULT '0',
  `subcouponid` int(11) DEFAULT '0',
  `subcouponnum` int(11) DEFAULT '0',
  `timestart` int(11) DEFAULT '0',
  `timeend` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '0',
  `goodsid` int(11) DEFAULT '0',
  `starttext` varchar(255) DEFAULT '',
  `endtext` varchar(255) DEFAULT NULL,
  `resptype` tinyint(3) DEFAULT '0',
  `resptext` text,
  `testflag` tinyint(1) DEFAULT '0',
  `keyword2` varchar(255) DEFAULT '',
  `reward_totle` varchar(500) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_type` (`type`),
  KEY `idx_isdefault` (`isdefault`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_postera_log`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_postera_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `posterid` int(11) DEFAULT '0',
  `from_openid` varchar(255) DEFAULT '',
  `subcredit` int(11) DEFAULT '0',
  `submoney` decimal(10,2) DEFAULT '0.00',
  `reccredit` int(11) DEFAULT '0',
  `recmoney` decimal(10,2) DEFAULT '0.00',
  `createtime` int(11) DEFAULT '0',
  `reccouponid` int(11) DEFAULT '0',
  `reccouponnum` int(11) DEFAULT '0',
  `subcouponid` int(11) DEFAULT '0',
  `subcouponnum` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_openid` (`openid`),
  KEY `idx_createtime` (`createtime`),
  KEY `idx_posteraid` (`posterid`),
  KEY `idx_from_openid` (`from_openid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_postera_qr`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_postera_qr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acid` int(10) unsigned NOT NULL,
  `openid` varchar(100) NOT NULL DEFAULT '',
  `posterid` int(11) DEFAULT '0',
  `type` tinyint(3) DEFAULT '0',
  `sceneid` int(11) DEFAULT '0',
  `mediaid` varchar(255) DEFAULT '',
  `ticket` varchar(250) NOT NULL,
  `url` varchar(80) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `goodsid` int(11) DEFAULT '0',
  `qrimg` varchar(1000) DEFAULT '',
  `expire` int(11) DEFAULT '0',
  `endtime` int(11) DEFAULT '0',
  `qrtime` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_acid` (`acid`),
  KEY `idx_sceneid` (`sceneid`),
  KEY `idx_type` (`type`),
  KEY `idx_posterid` (`posterid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_poster_log`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_poster_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `posterid` int(11) DEFAULT '0',
  `from_openid` varchar(255) DEFAULT '',
  `subcredit` int(11) DEFAULT '0',
  `submoney` decimal(10,2) DEFAULT '0.00',
  `reccredit` int(11) DEFAULT '0',
  `recmoney` decimal(10,2) DEFAULT '0.00',
  `createtime` int(11) DEFAULT '0',
  `reccouponid` int(11) DEFAULT '0',
  `reccouponnum` int(11) DEFAULT '0',
  `subcouponid` int(11) DEFAULT '0',
  `subcouponnum` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_openid` (`openid`),
  KEY `idx_createtime` (`createtime`),
  KEY `idx_posterid` (`posterid`),
  KEY `idx_from_openid` (`from_openid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_poster_qr`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_poster_qr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acid` int(10) unsigned NOT NULL,
  `openid` varchar(100) NOT NULL DEFAULT '',
  `type` tinyint(3) DEFAULT '0',
  `sceneid` int(11) DEFAULT '0',
  `mediaid` varchar(255) DEFAULT '',
  `ticket` varchar(250) NOT NULL,
  `url` varchar(80) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `goodsid` int(11) DEFAULT '0',
  `qrimg` varchar(1000) DEFAULT '',
  `posterid` int(11) DEFAULT '0',
  `scenestr` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_acid` (`acid`),
  KEY `idx_sceneid` (`sceneid`),
  KEY `idx_type` (`type`),
  KEY `idx_openid` (`openid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_poster_scan`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_poster_scan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `posterid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `from_openid` varchar(255) DEFAULT '',
  `scantime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_posterid` (`posterid`),
  KEY `idx_scantime` (`scantime`),
  KEY `idx_openid` (`openid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_qa_adv`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_qa_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `advname` varchar(50) DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_enabled` (`enabled`),
  KEY `idx_displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_qa_category`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_qa_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `displayorder` tinyint(3) unsigned DEFAULT '0',
  `enabled` tinyint(1) DEFAULT '1',
  `isrecommand` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_displayorder` (`displayorder`),
  KEY `idx_enabled` (`enabled`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_qa_question`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_qa_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `cate` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `content` mediumtext NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `isrecommand` tinyint(3) NOT NULL DEFAULT '0',
  `displayorder` int(11) NOT NULL DEFAULT '0',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `lastedittime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_qa_set`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_qa_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `showmember` tinyint(3) NOT NULL DEFAULT '0',
  `showtype` tinyint(3) NOT NULL DEFAULT '0',
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `enter_title` varchar(255) NOT NULL DEFAULT '',
  `enter_img` varchar(255) NOT NULL DEFAULT '',
  `enter_desc` varchar(255) NOT NULL DEFAULT '',
  `share` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_unaicid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_quick`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_quick` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `datas` mediumtext,
  `cart` tinyint(3) NOT NULL DEFAULT '0',
  `createtime` int(11) DEFAULT NULL,
  `lasttime` int(11) DEFAULT NULL,
  `share_title` varchar(255) DEFAULT NULL,
  `share_desc` varchar(255) DEFAULT NULL,
  `share_icon` varchar(255) DEFAULT NULL,
  `enter_title` varchar(255) DEFAULT NULL,
  `enter_desc` varchar(255) DEFAULT NULL,
  `enter_icon` varchar(255) DEFAULT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `merchid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_quick_adv`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_quick_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `merchid` int(11) NOT NULL DEFAULT '0',
  `advname` varchar(50) DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`) USING BTREE,
  KEY `idx_enabled` (`enabled`) USING BTREE,
  KEY `idx_displayorder` (`displayorder`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_quick_cart`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_quick_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `quickid` int(11) NOT NULL DEFAULT '0',
  `openid` varchar(100) DEFAULT '',
  `goodsid` int(11) DEFAULT '0',
  `total` int(11) DEFAULT '0',
  `marketprice` decimal(10,2) DEFAULT '0.00',
  `deleted` tinyint(1) DEFAULT '0',
  `optionid` int(11) DEFAULT '0',
  `createtime` int(11) DEFAULT '0',
  `diyformdataid` int(11) DEFAULT NULL,
  `diyformdata` text,
  `diyformfields` text,
  `diyformid` int(11) DEFAULT '0',
  `selected` tinyint(1) DEFAULT '1',
  `merchid` int(11) DEFAULT '0',
  `selectedadd` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`) USING BTREE,
  KEY `idx_goodsid` (`goodsid`) USING BTREE,
  KEY `idx_openid` (`openid`) USING BTREE,
  KEY `idx_deleted` (`deleted`) USING BTREE,
  KEY `idx_merchid` (`merchid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_refund_address`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_refund_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `title` varchar(20) DEFAULT '',
  `name` varchar(20) DEFAULT '',
  `tel` varchar(20) DEFAULT '',
  `mobile` varchar(11) DEFAULT '',
  `province` varchar(30) DEFAULT '',
  `city` varchar(30) DEFAULT '',
  `area` varchar(30) DEFAULT '',
  `address` varchar(300) DEFAULT '',
  `isdefault` tinyint(1) DEFAULT '0',
  `zipcode` varchar(255) DEFAULT '',
  `content` text,
  `deleted` tinyint(1) DEFAULT '0',
  `openid` varchar(50) DEFAULT '0',
  `merchid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_openid` (`openid`),
  KEY `idx_isdefault` (`isdefault`),
  KEY `idx_deleted` (`deleted`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_saler`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_saler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storeid` int(11) DEFAULT '0',
  `uniacid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `status` tinyint(3) DEFAULT '0',
  `salername` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_storeid` (`storeid`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_sale_coupon`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_sale_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT '',
  `type` tinyint(3) DEFAULT '0',
  `ckey` decimal(10,2) DEFAULT '0.00',
  `cvalue` decimal(10,2) DEFAULT '0.00',
  `nums` int(11) DEFAULT '0',
  `createtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_sale_coupon_data`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_sale_coupon_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `couponid` int(11) DEFAULT '0',
  `gettime` int(11) DEFAULT '0',
  `gettype` tinyint(3) DEFAULT '0',
  `usedtime` int(11) DEFAULT '0',
  `orderid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_couponid` (`couponid`),
  KEY `idx_gettime` (`gettime`),
  KEY `idx_gettype` (`gettype`),
  KEY `idx_usedtime` (`usedtime`),
  KEY `idx_orderid` (`orderid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_seckill_adv`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_seckill_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `advname` varchar(50) DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_displayorder` (`displayorder`) USING BTREE,
  KEY `idx_enabled` (`enabled`) USING BTREE,
  KEY `idx_uniacid` (`uniacid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_seckill_category`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_seckill_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_seckill_task`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_seckill_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `cateid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `enabled` tinyint(3) DEFAULT '0',
  `page_title` varchar(255) DEFAULT '',
  `share_title` varchar(255) DEFAULT '',
  `share_desc` varchar(255) DEFAULT '',
  `share_icon` varchar(255) DEFAULT '',
  `tag` varchar(10) DEFAULT '',
  `closesec` int(11) DEFAULT '0',
  `oldshow` tinyint(3) DEFAULT '0',
  `times` text,
  `createtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`) USING BTREE,
  KEY `idx_status` (`enabled`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_seckill_task_goods`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_seckill_task_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  `taskid` int(11) DEFAULT '0',
  `roomid` int(11) DEFAULT '0',
  `timeid` int(11) DEFAULT '0',
  `goodsid` int(11) DEFAULT '0',
  `optionid` int(11) DEFAULT '0',
  `price` decimal(10,2) DEFAULT '0.00',
  `total` int(11) DEFAULT '0',
  `maxbuy` int(11) DEFAULT '0',
  `totalmaxbuy` int(11) DEFAULT '0',
  `commission1` decimal(10,2) DEFAULT '0.00',
  `commission2` decimal(10,2) DEFAULT '0.00',
  `commission3` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`) USING BTREE,
  KEY `idx_goodsid` (`goodsid`) USING BTREE,
  KEY `idx_optionid` (`optionid`) USING BTREE,
  KEY `idx_displayorder` (`displayorder`) USING BTREE,
  KEY `idx_taskid` (`taskid`) USING BTREE,
  KEY `idx_roomid` (`roomid`) USING BTREE,
  KEY `idx_time` (`timeid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_seckill_task_room`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_seckill_task_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  `taskid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `enabled` tinyint(3) DEFAULT '0',
  `page_title` varchar(255) DEFAULT '',
  `share_title` varchar(255) DEFAULT '',
  `share_desc` varchar(255) DEFAULT '',
  `share_icon` varchar(255) DEFAULT '',
  `oldshow` tinyint(3) DEFAULT '0',
  `tag` varchar(10) DEFAULT '',
  `createtime` int(11) DEFAULT '0',
  `diypage` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_taskid` (`taskid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_seckill_task_time`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_seckill_task_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `taskid` int(11) DEFAULT '0',
  `time` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_section`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_section` (
  `sid` int(5) NOT NULL AUTO_INCREMENT,
  `section_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `section_title` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '版块标题',
  `section_type` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT '版块类型',
  `slider_id` int(5) NOT NULL DEFAULT '0' COMMENT '关联的幻灯片',
  `classname` varchar(20) CHARACTER SET utf8 NOT NULL,
  `style` varchar(10) CHARACTER SET utf8 NOT NULL,
  `bgcolor` varchar(20) CHARACTER SET utf8 NOT NULL,
  `link` varchar(250) CHARACTER SET utf8 NOT NULL,
  `displayorder` int(5) NOT NULL DEFAULT '10',
  `enabled` int(1) NOT NULL DEFAULT '1',
  `is_system` int(1) NOT NULL DEFAULT '0',
  `uniacid` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `ims_ewei_shop_section`
--

INSERT INTO `ims_ewei_shop_section` (`sid`, `section_name`, `section_title`, `section_type`, `slider_id`, `classname`, `style`, `bgcolor`, `link`, `displayorder`, `enabled`, `is_system`, `uniacid`) VALUES
(24, '商品详情页标签', '商品详情页标签', '', 0, '', '', '', '', 0, 1, 0, 1),
(28, '招牌菜', '', 'goods', 0, '', '', '', '', 0, 1, 0, 6),
(29, '热卖菜', '', 'goods', 0, '', '', '', '', 0, 1, 0, 6),
(30, '首页-关于我们', '', 'notice', 0, '', '', '', '', 0, 1, 0, 6);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_section_item`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_section_item` (
  `item_id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 NOT NULL COMMENT '图位名称',
  `title` varchar(150) CHARACTER SET utf8 NOT NULL COMMENT '标题',
  `assistant_title` varchar(150) CHARACTER SET utf8 NOT NULL COMMENT '副标题',
  `section_id` int(5) NOT NULL DEFAULT '0' COMMENT '所属版块',
  `thumb` varchar(250) CHARACTER SET utf8 NOT NULL COMMENT '图片',
  `bgcolor` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '背景颜色',
  `width` int(4) NOT NULL DEFAULT '0' COMMENT '图位宽',
  `height` int(4) NOT NULL DEFAULT '0' COMMENT '图位高',
  `data_id` int(10) NOT NULL DEFAULT '0' COMMENT '关联的数据ID',
  `link` varchar(250) CHARACTER SET utf8 NOT NULL,
  `displayorder` int(5) NOT NULL DEFAULT '50',
  `enabled` int(1) NOT NULL DEFAULT '1',
  `uniacid` int(5) NOT NULL DEFAULT '1',
  `desc` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=135 ;

--
-- 转存表中的数据 `ims_ewei_shop_section_item`
--

INSERT INTO `ims_ewei_shop_section_item` (`item_id`, `name`, `title`, `assistant_title`, `section_id`, `thumb`, `bgcolor`, `width`, `height`, `data_id`, `link`, `displayorder`, `enabled`, `uniacid`, `desc`) VALUES
(113, '图位一', '严选画师', '灵魂画作', 24, 'images/1/2018/03/VoZ661bbBSCV3Ee6PD88w844J8BSzo.jpg', '', 120, 120, 0, '', 10, 1, 1, ''),
(114, '图位二', '个性化风', '潮流所选', 24, '', '', 120, 120, 0, '', 9, 1, 1, ''),
(115, '图位三', '与众不同', '辨识度高', 24, 'images/1/2018/02/YpEeS7AI6j37J7X3377IZsABZIaJa9.png', '', 120, 120, 0, '', 8, 1, 1, ''),
(123, '流亭猪蹄', '流亭猪蹄', '山东特色菜', 28, 'images/6/2018/01/wsZ3n0O3HoBOHR4YNtUjhz4oO6B690.jpg', '', 720, 360, 256, '/pages/goods/detail?id=256', 8, 1, 6, ''),
(124, '海鲜毛血旺', '海鲜毛血旺', '极致的美味', 28, 'images/6/2018/01/Z8AaL087S000cwXba80BoB0ZLxN8lN.jpg', '', 0, 0, 561, '/pages/goods/detail?id=561', 9, 1, 6, ''),
(125, '第一个推荐位', '蒸汽海鲜锅', '海鲜美味无法言喻', 28, 'images/6/2018/01/i62Ri3R5m3s66rE23mQe383iw633mZ.jpg', '', 0, 0, 206, '/pages/goods/detail?id=206', 10, 1, 6, ''),
(126, '麻辣海鲜汇', '麻辣海鲜汇', '麻辣味的海鲜，爱不释口', 28, 'images/6/2018/01/Qj111RKJkKLJ2bjJ6ZJKKbpaOKs1Pv.jpg', '', 0, 0, 522, '/pages/goods/detail?id=522', 6, 1, 6, ''),
(127, '第一图位', '麻辣鸭头', '', 29, '', '', 0, 0, 209, '/pages/goods/detail?id=209', 10, 1, 6, ''),
(128, '第二图位', '酱牛肉', '', 29, '', '', 0, 0, 208, '/pages/goods/detail?id=208', 9, 1, 6, ''),
(129, '第三图位', '三鲜锅贴', '', 29, '', '', 0, 0, 207, '/pages/goods/detail?id=207', 7, 1, 6, ''),
(130, '第四个图位', '黄椒鱼鳍', '', 29, '', '', 0, 0, 248, '/pages/goods/detail?id=248', 6, 1, 6, ''),
(131, '关于我们', '', '0546-8795956', 30, 'images/6/2017/12/OqTeIvbg0VN1giHhHHGziAiwIiV5Uv.jpg', '', 0, 0, 0, '', 0, 1, 6, '青岛海鲜锅贴铺成立于1996年，地处东营市商业区的黄金地段，位于西城嵩山路南首，交通便利，是一家以正宗青岛啤酒、青岛小海鲜和锅贴为特色，伴有家常炒菜的中型酒店。酒店设有零点厅和16个大小不同的房间，设施齐全，环境舒适，无论是家庭聚会，朋友聚会还是商务宴、政务宴，都是您的理想之选。'),
(132, '风干鸡', '风干鸡', '', 28, 'images/6/2018/01/lZoUzvfNfg8223gnS2FRovqKsfzz2U.jpg', '', 0, 0, 245, '../goods/detail?id=245', 0, 1, 6, ''),
(133, '一品鱼锅', '一品鱼锅', '鲜美鱼肉 流连忘返', 28, 'images/6/2018/01/ch5h3ycj7gJyaGzyGEj5G47pPoRY2h.jpg', '', 0, 0, 481, '../goods/detail?id=481', 0, 1, 6, ''),
(134, '台湾脆卤肉', '台湾脆卤肉', '来自宝岛的美味', 28, 'images/6/2018/01/u5060VJFVJ0IKS00J8H5jH55nmhojK.jpg', '', 0, 0, 347, '../goods/detail?id=347', 3, 1, 6, '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_sign_records`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_sign_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `openid` varchar(50) NOT NULL DEFAULT '',
  `credit` int(11) NOT NULL DEFAULT '0',
  `log` varchar(255) DEFAULT '',
  `type` tinyint(3) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_time` (`time`),
  KEY `idx_type` (`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=602 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_sign_set`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_sign_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `iscenter` tinyint(3) NOT NULL DEFAULT '0',
  `iscreditshop` tinyint(3) NOT NULL DEFAULT '0',
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `desc` varchar(255) NOT NULL DEFAULT '',
  `isopen` tinyint(3) NOT NULL DEFAULT '0',
  `signold` tinyint(3) NOT NULL DEFAULT '0',
  `signold_price` int(11) NOT NULL DEFAULT '0',
  `signold_type` tinyint(3) NOT NULL DEFAULT '0',
  `textsign` varchar(255) NOT NULL DEFAULT '',
  `textsignold` varchar(255) NOT NULL DEFAULT '',
  `textsigned` varchar(255) NOT NULL DEFAULT '',
  `textsignforget` varchar(255) NOT NULL DEFAULT '',
  `maincolor` varchar(20) NOT NULL DEFAULT '',
  `cycle` tinyint(3) NOT NULL DEFAULT '0',
  `reward_default_first` int(11) NOT NULL DEFAULT '0',
  `reward_default_day` int(11) NOT NULL DEFAULT '0',
  `reword_order` text NOT NULL,
  `reword_sum` text NOT NULL,
  `reword_special` text NOT NULL,
  `sign_rule` text NOT NULL,
  `share` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_sign_user`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_sign_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `order` int(11) NOT NULL DEFAULT '0',
  `orderday` int(11) NOT NULL DEFAULT '0',
  `sum` int(11) NOT NULL DEFAULT '0',
  `signdate` varchar(10) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=146 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_sms`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(10) NOT NULL DEFAULT '',
  `template` tinyint(3) NOT NULL DEFAULT '0',
  `smstplid` varchar(255) NOT NULL DEFAULT '',
  `smssign` varchar(255) NOT NULL DEFAULT '',
  `content` varchar(100) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_sms_set`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_sms_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `juhe` tinyint(3) NOT NULL DEFAULT '0',
  `juhe_key` varchar(255) NOT NULL DEFAULT '',
  `dayu` tinyint(3) NOT NULL DEFAULT '0',
  `dayu_key` varchar(255) NOT NULL DEFAULT '',
  `dayu_secret` varchar(255) NOT NULL DEFAULT '',
  `emay` tinyint(3) NOT NULL DEFAULT '0',
  `emay_url` varchar(255) NOT NULL DEFAULT '',
  `emay_sn` varchar(255) NOT NULL DEFAULT '',
  `emay_pw` varchar(255) NOT NULL DEFAULT '',
  `emay_sk` varchar(255) NOT NULL DEFAULT '',
  `emay_phost` varchar(255) NOT NULL DEFAULT '',
  `emay_pport` int(11) NOT NULL DEFAULT '0',
  `emay_puser` varchar(255) NOT NULL DEFAULT '',
  `emay_ppw` varchar(255) NOT NULL DEFAULT '',
  `emay_out` int(11) NOT NULL DEFAULT '0',
  `emay_outresp` int(11) NOT NULL DEFAULT '30',
  `emay_warn` decimal(10,2) NOT NULL DEFAULT '0.00',
  `emay_mobile` varchar(11) NOT NULL DEFAULT '',
  `emay_warn_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ims_ewei_shop_sms_set`
--

INSERT INTO `ims_ewei_shop_sms_set` (`id`, `uniacid`, `juhe`, `juhe_key`, `dayu`, `dayu_key`, `dayu_secret`, `emay`, `emay_url`, `emay_sn`, `emay_pw`, `emay_sk`, `emay_phost`, `emay_pport`, `emay_puser`, `emay_ppw`, `emay_out`, `emay_outresp`, `emay_warn`, `emay_mobile`, `emay_warn_time`) VALUES
(2, 1, 0, '', 1, '1', '1', 0, '', '', '', '', '', 0, '', '', 0, 30, '0.00', '0', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_sns_adv`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_sns_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `advname` varchar(50) DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_enabled` (`enabled`),
  KEY `idx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_sns_board`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_sns_board` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `cid` int(11) DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `logo` varchar(255) DEFAULT '',
  `desc` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '0',
  `showgroups` text,
  `showlevels` text,
  `postgroups` text,
  `postlevels` text,
  `showagentlevels` text,
  `postagentlevels` text,
  `postcredit` int(11) DEFAULT '0',
  `replycredit` int(11) DEFAULT '0',
  `bestcredit` int(11) DEFAULT '0',
  `bestboardcredit` int(11) DEFAULT '0',
  `notagent` tinyint(3) DEFAULT '0',
  `notagentpost` tinyint(3) DEFAULT '0',
  `topcredit` int(11) DEFAULT '0',
  `topboardcredit` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '0',
  `noimage` tinyint(3) DEFAULT '0',
  `novoice` tinyint(3) DEFAULT '0',
  `needfollow` tinyint(3) DEFAULT '0',
  `needpostfollow` tinyint(3) DEFAULT '0',
  `share_title` varchar(255) DEFAULT '',
  `share_icon` varchar(255) DEFAULT '',
  `share_desc` varchar(255) DEFAULT '',
  `keyword` varchar(255) DEFAULT '',
  `isrecommand` tinyint(3) DEFAULT '0',
  `banner` varchar(255) DEFAULT '',
  `needcheck` tinyint(3) DEFAULT '0',
  `needcheckmanager` tinyint(3) DEFAULT '0',
  `needcheckreply` int(11) DEFAULT '0',
  `needcheckreplymanager` int(11) DEFAULT '0',
  `showsnslevels` text,
  `postsnslevels` text,
  `showpartnerlevels` text,
  `postpartnerlevels` text,
  `notpartner` tinyint(3) DEFAULT '0',
  `notpartnerpost` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_enabled` (`enabled`),
  KEY `idx_displayorder` (`displayorder`),
  KEY `idx_cid` (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_sns_board_follow`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_sns_board_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `bid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT NULL,
  `createtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_bid` (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_sns_category`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_sns_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `displayorder` tinyint(3) unsigned DEFAULT '0',
  `enabled` tinyint(1) DEFAULT '1',
  `advimg` varchar(255) DEFAULT '',
  `advurl` varchar(500) DEFAULT '',
  `isrecommand` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_enabled` (`enabled`),
  KEY `idx_isrecommand` (`isrecommand`),
  KEY `idx_displayorder` (`displayorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_sns_complain`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_sns_complain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(3) NOT NULL,
  `postsid` int(11) NOT NULL DEFAULT '0',
  `defendant` varchar(255) NOT NULL DEFAULT '0',
  `complainant` varchar(255) NOT NULL DEFAULT '0',
  `complaint_type` int(10) NOT NULL DEFAULT '0',
  `complaint_text` text NOT NULL,
  `images` text NOT NULL,
  `createtime` int(11) NOT NULL DEFAULT '0',
  `checkedtime` int(11) NOT NULL DEFAULT '0',
  `checked` tinyint(3) NOT NULL DEFAULT '0',
  `checked_note` varchar(255) NOT NULL,
  `deleted` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_sns_complaincate`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_sns_complaincate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `displayorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_sns_level`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_sns_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `levelname` varchar(255) DEFAULT '',
  `credit` int(11) DEFAULT '0',
  `enabled` tinyint(3) DEFAULT '0',
  `post` int(11) DEFAULT '0',
  `color` varchar(255) DEFAULT '',
  `bg` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_enabled` (`enabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_sns_like`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_sns_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `pid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_sns_manage`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_sns_manage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `bid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `enabled` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_bid` (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_sns_member`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_sns_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT '0',
  `createtime` int(11) DEFAULT '0',
  `credit` int(11) DEFAULT '0',
  `sign` varchar(255) DEFAULT '',
  `isblack` tinyint(3) DEFAULT '0',
  `notupgrade` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_sns_post`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_sns_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `bid` int(11) DEFAULT '0',
  `pid` int(11) DEFAULT '0',
  `rpid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `avatar` varchar(255) DEFAULT '',
  `nickname` varchar(255) DEFAULT '',
  `title` varchar(50) DEFAULT '',
  `content` text,
  `images` text,
  `voice` varchar(255) DEFAULT NULL,
  `createtime` int(11) DEFAULT '0',
  `replytime` int(11) DEFAULT '0',
  `credit` int(11) DEFAULT '0',
  `views` int(11) DEFAULT '0',
  `islock` tinyint(1) DEFAULT '0',
  `istop` tinyint(1) DEFAULT '0',
  `isboardtop` tinyint(1) DEFAULT '0',
  `isbest` tinyint(1) DEFAULT '0',
  `isboardbest` tinyint(3) DEFAULT '0',
  `deleted` tinyint(3) DEFAULT '0',
  `deletedtime` int(11) DEFAULT '0',
  `checked` tinyint(3) DEFAULT NULL,
  `checktime` int(11) DEFAULT '0',
  `isadmin` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_bid` (`bid`),
  KEY `idx_pid` (`pid`),
  KEY `idx_createtime` (`createtime`),
  KEY `idx_islock` (`islock`),
  KEY `idx_istop` (`istop`),
  KEY `idx_isboardtop` (`isboardtop`),
  KEY `idx_isbest` (`isbest`),
  KEY `idx_deleted` (`deleted`),
  KEY `idx_deletetime` (`deletedtime`),
  KEY `idx_checked` (`checked`),
  KEY `idx_rpid` (`rpid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_store`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `storename` varchar(255) DEFAULT '',
  `address` varchar(255) DEFAULT '',
  `tel` varchar(255) DEFAULT '',
  `lat` varchar(255) DEFAULT '',
  `lng` varchar(255) DEFAULT '',
  `status` tinyint(3) DEFAULT '0',
  `realname` varchar(255) DEFAULT '',
  `mobile` varchar(255) DEFAULT '',
  `wechat` varchar(100) NOT NULL,
  `qq` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `web` varchar(100) NOT NULL,
  `fetchtime` varchar(255) DEFAULT '',
  `type` tinyint(1) DEFAULT '0',
  `logo` varchar(255) DEFAULT '',
  `logo_url` text NOT NULL,
  `saletime` varchar(255) DEFAULT '',
  `desc` text,
  `displayorder` int(11) DEFAULT '0',
  `order_printer` varchar(500) DEFAULT '',
  `order_template` int(11) DEFAULT '0',
  `ordertype` varchar(500) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `ims_ewei_shop_store`
--

INSERT INTO `ims_ewei_shop_store` (`id`, `uniacid`, `storename`, `address`, `tel`, `lat`, `lng`, `status`, `realname`, `mobile`, `wechat`, `qq`, `email`, `web`, `fetchtime`, `type`, `logo`, `logo_url`, `saletime`, `desc`, `displayorder`, `order_printer`, `order_template`, `ordertype`) VALUES
(6, 1, '山东省羽月智能科技有限公司', '山东省东营市东营区黄河路金领国际大厦A座10楼', '0546-6081566,15305466535', '37.446760', '118.537940', 1, '李经理', '', '', '80095991', '', 'http://www.yyzn.co', '', 0, 'images/1/2017/09/v6I3IyDex34P663PPe7dJ4o4PzosZE.jpg', 'a:3:{i:1;s:51:"images/1/2017/09/ENX3n5NZW37WBn7zG33g3Pacl3w5cW.jpg";i:2;s:51:"images/1/2017/09/fkXv6AQkSsoZUAxtvVaqkkyZPax9lJ.jpg";i:3;s:51:"images/1/2017/09/fY5f95i2B7QYS5u5bSi2qeSu616qre.jpg";}', '上班时间周一至周六，国家法定节假日除外', '', 0, '', 0, ''),
(11, 6, '青岛海鲜锅贴嵩山路店', '东营市东营区西城嵩山路南首（油田一中东邻）', '0546-8795956', '37.46949', '118.50818', 1, '', '', '', '', '', '', '', 2, 'images/6/2017/11/yPPFYs011sq33m11S3T0fQQ31iiKtm.jpg', 'a:3:{i:1;s:51:"images/6/2017/11/yOO9Vut966J8tJn7W72j22W2Td7jM6.jpg";i:2;s:51:"images/6/2017/11/vznnZcI5nS7nuo71INO9P45Iz1IbPC.jpg";i:3;s:51:"images/6/2017/11/pV3gxX1RL25rOGQ3LrELlVrB4c53jA.jpg";}', '上午9：00-14：00    下午16：00-21：00', '', 10, '', 0, ''),
(12, 6, '青岛海鲜锅贴西三路店', '东营市东营区西城西三路256号', '0546-8777728', '37.45549458245508', '118.51044949397136', 1, '', '', '', '', '', '', '', 2, '', '', '上午9：00-14：00    下午16：00-21：00', '', 9, '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_sysset`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_sysset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `sets` longtext,
  `plugins` longtext,
  `sec` text,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `ims_ewei_shop_sysset`
--

INSERT INTO `ims_ewei_shop_sysset` (`id`, `uniacid`, `sets`, `plugins`, `sec`) VALUES
(10, 1, 'a:7:{s:3:"wap";a:13:{s:4:"open";i:1;s:7:"inh5app";s:1:"0";s:8:"mustbind";s:1:"0";s:5:"style";s:7:"default";s:5:"color";s:0:"";s:2:"bg";s:53:"../addons/ewei_shopv2/template/account/default/bg.jpg";s:7:"sms_reg";s:1:"5";s:10:"sms_forget";s:1:"5";s:13:"sms_changepwd";s:1:"5";s:8:"sms_bind";s:1:"5";s:7:"loginbg";N;s:5:"regbg";N;s:3:"sns";a:2:{s:2:"wx";i:0;s:2:"qq";i:0;}}s:5:"wxapp";a:7:{s:4:"name";s:9:"画个我";s:4:"logo";s:0:"";s:7:"account";s:0:"";s:8:"original";s:0:"";s:5:"AppId";s:18:"wx1223d08ee7dcb407";s:9:"AppSecret";s:32:"f307cac71d3faee7578b80819583b8e0";s:7:"version";s:3:"1.0";}s:4:"shop";a:19:{s:4:"name";s:9:"画个我";s:4:"logo";s:51:"images/1/2018/03/qlsB26lkiiekW6KPlswggwWsWwWwKY.jpg";s:11:"description";s:0:"";s:3:"img";s:0:"";s:7:"signimg";s:0:"";s:7:"getinfo";s:1:"1";s:5:"uc_bg";s:51:"images/1/2017/08/kgtcC1Cz0cttTTGDaZdWtbwkcG5cT9.jpg";s:7:"saleout";s:0:"";s:7:"loading";s:0:"";s:7:"diycode";s:0:"";s:6:"funbar";s:1:"0";s:2:"qq";s:0:"";s:7:"address";s:0:"";s:5:"phone";s:12:"0546-6081566";s:10:"contact_bg";s:51:"images/1/2017/09/TkHdXDzU90xuuKVUpHT2CH2duUXxYv.jpg";s:9:"ordertype";i:2;s:11:"recharge_bg";s:0:"";s:7:"nothumb";s:0:"";s:7:"webtype";i:0;}s:5:"trade";a:32:{s:12:"set_realname";s:1:"0";s:10:"set_mobile";s:1:"0";s:10:"closeorder";s:0:"";s:14:"willcloseorder";s:0:"";s:9:"stockwarn";s:0:"";s:7:"receive";s:0:"";s:10:"refunddays";s:0:"";s:13:"refundcontent";s:0:"";s:16:"offline_pay_desc";s:43:"工行：298320390239  收款人： 2030033";s:10:"credittext";s:6:"积分";s:9:"moneytext";s:6:"余额";s:13:"closerecharge";s:1:"0";s:5:"money";s:0:"";s:6:"credit";s:0:"";s:13:"minimumcharge";d:0;s:8:"withdraw";s:1:"0";s:13:"withdrawmoney";s:0:"";s:14:"withdrawcharge";s:0:"";s:13:"withdrawbegin";d:0;s:11:"withdrawend";d:0;s:9:"maxcredit";s:1:"0";s:12:"closecomment";s:1:"0";s:16:"closecommentshow";s:1:"0";s:14:"commentchecked";s:1:"0";s:12:"shareaddress";s:1:"0";s:10:"istimetext";s:9:"限时购";s:15:"nodispatchareas";s:7:"s:0:"";";s:20:"nodispatchareas_code";s:7:"s:0:"";";s:18:"withdrawcashweixin";i:0;s:18:"withdrawcashalipay";i:0;s:16:"withdrawcashcard";i:0;s:6:"paybtn";i:1;}s:3:"pay";a:12:{s:9:"weixin_id";i:1;s:6:"weixin";i:1;s:10:"weixin_sub";i:0;s:10:"weixin_jie";i:0;s:14:"weixin_jie_sub";i:0;s:6:"alipay";i:1;s:6:"credit";i:1;s:4:"cash";i:0;s:11:"offline_pay";i:1;s:10:"app_wechat";i:1;s:10:"app_alipay";i:1;s:7:"paytype";a:3:{s:10:"commission";s:1:"0";s:8:"withdraw";s:1:"0";s:7:"redpack";s:1:"0";}}s:7:"contact";a:5:{s:5:"phone";s:12:"0546-6081566";s:8:"province";s:15:"请选择省份";s:4:"city";s:15:"请选择城市";s:7:"address";s:0:"";s:2:"qq";s:0:"";}s:6:"wxtmpl";a:1:{s:4:"send";s:43:"C_HLT0raUG5EciqQrhOz5t0-fBXWskpTZwnDGNwSEB8";}}', 'a:5:{s:5:"merch";a:13:{s:12:"is_openmerch";s:1:"0";s:17:"deduct_commission";s:1:"0";s:16:"apply_openmobile";s:1:"1";s:13:"open_protocol";s:1:"0";s:5:"regbg";s:0:"";s:13:"apply_diyform";s:1:"0";s:15:"apply_diyformid";s:1:"0";s:6:"regpic";s:0:"";s:10:"applytitle";s:0:"";s:12:"applycontent";s:0:"";s:15:"applycashweixin";i:0;s:15:"applycashalipay";i:0;s:13:"applycashcard";i:0;}s:4:"sale";a:3:{s:11:"enoughmoney";d:0;s:12:"enoughdeduct";d:0;s:7:"enoughs";a:0:{}}s:10:"commission";a:54:{s:5:"level";s:1:"2";s:7:"selfbuy";s:1:"0";s:12:"become_child";s:1:"0";s:6:"become";s:1:"0";s:17:"become_ordercount";s:0:"";s:17:"become_moneycount";s:3:"500";s:12:"become_check";s:1:"1";s:12:"become_order";s:1:"0";s:13:"open_protocol";s:1:"0";s:10:"become_reg";s:1:"1";s:17:"no_commission_url";s:0:"";s:8:"withdraw";s:2:"50";s:14:"commissiontype";s:1:"0";s:14:"withdrawcharge";s:0:"";s:13:"withdrawbegin";d:0;s:11:"withdrawend";d:0;s:10:"settledays";s:0:"";s:8:"levelurl";s:0:"";s:9:"leveltype";s:1:"0";s:11:"qrcodeshare";s:1:"0";s:9:"codeShare";s:1:"1";s:15:"openorderdetail";s:1:"0";s:14:"openorderbuyer";s:1:"0";s:13:"closed_qrcode";s:1:"0";s:6:"qrcode";s:1:"0";s:12:"qrcode_title";s:0:"";s:14:"qrcode_content";s:0:"";s:13:"qrcode_remark";s:0:"";s:15:"register_bottom";s:1:"0";s:22:"register_bottom_title1";s:0:"";s:24:"register_bottom_content1";s:0:"";s:22:"register_bottom_title2";s:0:"";s:24:"register_bottom_content2";s:0:"";s:22:"register_bottom_title3";s:0:"";s:24:"register_bottom_content3";s:0:"";s:22:"register_bottom_remark";s:0:"";s:23:"register_bottom_content";s:0:"";s:11:"closemyshop";s:1:"0";s:12:"select_goods";s:1:"0";s:5:"style";s:7:"default";s:5:"regbg";s:0:"";s:10:"applytitle";s:0:"";s:12:"applycontent";s:0:"";s:10:"cashcredit";i:0;s:10:"cashweixin";i:0;s:9:"cashother";i:1;s:10:"cashalipay";i:1;s:8:"cashcard";i:0;s:14:"become_goodsid";i:0;s:5:"texts";a:26:{s:5:"agent";s:9:"分销商";s:4:"shop";s:6:"小店";s:6:"myshop";s:12:"我的小店";s:6:"center";s:12:"分销中心";s:6:"become";s:15:"成为分销商";s:8:"withdraw";s:6:"提现";s:10:"commission";s:6:"佣金";s:11:"commission1";s:12:"分销佣金";s:16:"commission_total";s:12:"累计佣金";s:13:"commission_ok";s:15:"可提现佣金";s:16:"commission_apply";s:15:"已申请佣金";s:16:"commission_check";s:15:"待打款佣金";s:15:"commission_lock";s:15:"未结算佣金";s:15:"commission_wait";s:15:"待收货佣金";s:15:"commission_fail";s:12:"无效佣金";s:14:"commission_pay";s:18:"成功提现佣金";s:17:"commission_charge";s:21:"扣除个人所得税";s:17:"commission_detail";s:12:"佣金明细";s:5:"order";s:12:"佣金明细";s:4:"down";s:6:"下线";s:6:"mydown";s:12:"我的下线";s:2:"c1";s:6:"一级";s:2:"c2";s:6:"二级";s:2:"c3";s:6:"三级";s:4:"yuan";s:3:"元";s:5:"icode";s:9:"邀请码";}s:9:"levelname";s:12:"默认等级";s:11:"commission1";s:2:"10";s:11:"commission2";s:1:"5";s:11:"commission3";s:0:"";}s:6:"coupon";a:14:{s:14:"sendtemplateid";s:0:"";s:5:"frist";s:0:"";s:10:"fristcolor";s:7:"#000000";s:8:"keyword1";s:24:"恭喜您获得优惠卷";s:13:"keyword1color";s:7:"#000000";s:8:"keyword2";s:18:"请您点击查看";s:13:"keyword2color";s:7:"#000000";s:6:"remark";s:0:"";s:11:"remarkcolor";s:7:"#000000";s:11:"templateurl";s:0:"";s:8:"custitle";s:0:"";s:8:"custhumb";s:0:"";s:7:"cusdesc";s:0:"";s:6:"cusurl";s:0:"";}s:4:"case";a:2:{s:4:"case";s:6:"作品";s:6:"author";s:6:"画师";}}', 'a:3:{s:10:"app_wechat";a:5:{s:5:"appid";s:6:"345345";s:9:"appsecret";s:6:"345345";s:9:"merchname";s:6:"345345";s:7:"merchid";s:6:"345345";s:6:"apikey";s:6:"345345";}s:10:"alipay_pay";a:4:{s:7:"partner";s:0:"";s:12:"account_name";s:0:"";s:5:"email";s:0:"";s:3:"key";s:0:"";}s:10:"app_alipay";a:3:{s:10:"public_key";s:6:"345345";s:11:"private_key";s:6:"345345";s:5:"appid";s:5:"45435";}}'),
(11, 4, NULL, 'a:1:{s:6:"coupon";a:0:{}}', NULL),
(12, 6, 'a:6:{s:5:"wxapp";a:7:{s:4:"name";s:18:"青岛海鲜锅贴";s:4:"logo";s:0:"";s:7:"account";s:0:"";s:8:"original";s:0:"";s:5:"AppId";s:18:"wx1faed05e0cba8892";s:9:"AppSecret";s:32:"9c58e73c3f6cf18f9fc03a3266a2e180";s:7:"version";s:3:"1.0";}s:4:"shop";a:22:{s:4:"name";s:18:"青岛海鲜锅贴";s:4:"logo";s:0:"";s:11:"description";s:0:"";s:3:"img";s:0:"";s:7:"signimg";s:0:"";s:5:"uc_bg";s:51:"images/6/2017/11/bdWS3x1dmGvAVAxTrZ3z0Xd3VgNrmd.jpg";s:10:"contact_bg";s:51:"images/6/2017/11/Pb87T63zoqaEjA7CO599eOoZ3I75Ci.jpg";s:7:"getinfo";s:1:"1";s:7:"saleout";s:0:"";s:7:"loading";s:0:"";s:7:"diycode";s:0:"";s:6:"funbar";s:1:"0";s:9:"ordertype";i:0;s:7:"webtype";i:1;s:2:"qq";s:0:"";s:7:"address";s:0:"";s:5:"phone";s:12:"0546-8795956";s:7:"nothumb";s:51:"images/6/2018/01/nDNdaXni8DmDADCncSaIdAMDUx7qYZ.jpg";s:9:"levelname";s:0:"";s:8:"levelurl";s:0:"";s:9:"leveltype";i:0;s:11:"recharge_bg";s:51:"images/6/2018/01/ver3M13Uek7bl9XaaFaMB9AJu7FlB1.jpg";}s:3:"pay";a:12:{s:9:"weixin_id";i:2;s:6:"weixin";i:1;s:10:"weixin_sub";i:0;s:10:"weixin_jie";i:0;s:14:"weixin_jie_sub";i:0;s:6:"alipay";i:0;s:6:"credit";i:1;s:4:"cash";i:0;s:11:"offline_pay";i:0;s:10:"app_wechat";i:0;s:10:"app_alipay";i:0;s:7:"paytype";a:3:{s:10:"commission";s:1:"0";s:8:"withdraw";s:1:"0";s:7:"redpack";s:1:"0";}}s:7:"contact";a:5:{s:5:"phone";s:12:"0546-8795956";s:8:"province";s:15:"请选择省份";s:4:"city";s:15:"请选择城市";s:7:"address";s:0:"";s:2:"qq";s:0:"";}s:7:"printer";a:9:{s:13:"order_printer";s:1:"1";s:14:"order_template";i:1;s:13:"printer_merch";i:0;s:9:"ordertype";s:1:"2";s:11:"printer_pay";i:1;s:16:"printer_recharge";i:1;s:12:"mem_fontsize";i:16;s:9:"mem_width";i:238;s:15:"printer_offline";i:1;}s:6:"member";a:4:{s:8:"levelurl";s:0:"";s:15:"bind_old_member";i:1;s:9:"leveltype";i:0;s:9:"levelname";s:0:"";}}', 'a:3:{s:7:"diyform";a:6:{s:17:"user_diyform_open";s:1:"0";s:12:"user_diyform";s:1:"0";s:23:"commission_diyform_open";s:1:"0";s:18:"commission_diyform";s:1:"0";s:18:"order_diyform_open";s:1:"1";s:13:"order_diyform";s:1:"7";}s:10:"commission";a:59:{s:5:"level";s:1:"3";s:7:"selfbuy";s:1:"1";s:12:"become_child";s:1:"0";s:6:"become";s:1:"3";s:17:"become_ordercount";s:1:"1";s:17:"become_moneycount";s:3:"128";s:12:"become_check";s:1:"1";s:12:"become_order";s:1:"0";s:13:"open_protocol";s:1:"0";s:10:"become_reg";s:1:"1";s:17:"no_commission_url";s:0:"";s:10:"cashcredit";i:1;s:8:"withdraw";s:1:"1";s:14:"commissiontype";s:1:"2";s:14:"withdrawcharge";s:0:"";s:13:"withdrawbegin";d:0;s:11:"withdrawend";d:0;s:10:"settledays";s:0:"";s:8:"levelurl";s:0:"";s:9:"leveltype";s:1:"0";s:11:"qrcodeshare";s:1:"0";s:9:"codeShare";s:1:"1";s:15:"openorderdetail";s:1:"0";s:14:"openorderbuyer";s:1:"0";s:13:"closed_qrcode";s:1:"0";s:6:"qrcode";s:1:"0";s:12:"qrcode_title";s:0:"";s:14:"qrcode_content";s:0:"";s:13:"qrcode_remark";s:0:"";s:15:"register_bottom";s:1:"0";s:22:"register_bottom_title1";s:0:"";s:24:"register_bottom_content1";s:0:"";s:22:"register_bottom_title2";s:0:"";s:24:"register_bottom_content2";s:0:"";s:22:"register_bottom_title3";s:0:"";s:24:"register_bottom_content3";s:0:"";s:22:"register_bottom_remark";s:0:"";s:23:"register_bottom_content";s:0:"";s:11:"closemyshop";s:1:"0";s:12:"select_goods";s:1:"0";s:5:"style";s:7:"default";s:5:"regbg";s:0:"";s:10:"applytitle";s:0:"";s:12:"applycontent";s:0:"";s:10:"cashweixin";i:0;s:9:"cashother";i:0;s:10:"cashalipay";i:0;s:8:"cashcard";i:0;s:14:"become_goodsid";i:0;s:5:"texts";a:26:{s:5:"agent";s:9:"代言人";s:4:"shop";s:6:"小店";s:6:"myshop";s:12:"我的小店";s:6:"center";s:12:"分销中心";s:6:"become";s:15:"成为分销商";s:8:"withdraw";s:6:"提现";s:10:"commission";s:6:"佣金";s:11:"commission1";s:12:"分销佣金";s:16:"commission_total";s:12:"累计佣金";s:13:"commission_ok";s:15:"可提现佣金";s:16:"commission_apply";s:15:"已申请佣金";s:16:"commission_check";s:15:"待打款佣金";s:15:"commission_lock";s:15:"未结算佣金";s:15:"commission_wait";s:15:"待收货佣金";s:15:"commission_fail";s:12:"无效佣金";s:14:"commission_pay";s:18:"成功提现佣金";s:17:"commission_charge";s:21:"扣除个人所得税";s:17:"commission_detail";s:12:"佣金明细";s:5:"order";s:12:"佣金明细";s:4:"down";s:6:"下线";s:6:"mydown";s:12:"我的下线";s:2:"c1";s:12:"一代下级";s:2:"c2";s:12:"二代下级";s:2:"c3";s:12:"三代下级";s:4:"yuan";s:3:"元";s:5:"icode";s:9:"邀请码";}s:9:"levelname";s:12:"默认等级";s:11:"commission1";s:1:"5";s:11:"commission2";s:1:"3";s:11:"commission3";s:1:"2";s:6:"mempay";i:1;s:16:"check_cashcredit";i:0;s:10:"offlinePay";i:1;s:10:"mempay_com";i:0;s:14:"offlinePay_com";i:1;}s:4:"sale";a:1:{s:9:"recharges";s:224:"a:4:{i:0;a:2:{s:6:"enough";s:3:"800";s:4:"give";s:2:"80";}i:1;a:2:{s:6:"enough";s:4:"1500";s:4:"give";s:3:"180";}i:2;a:2:{s:6:"enough";s:4:"3000";s:4:"give";s:3:"420";}i:3;a:2:{s:6:"enough";s:4:"5000";s:4:"give";s:3:"800";}}";}}', 'a:3:{s:10:"app_wechat";a:5:{s:5:"appid";s:0:"";s:9:"appsecret";s:0:"";s:9:"merchname";s:0:"";s:7:"merchid";s:0:"";s:6:"apikey";s:0:"";}s:10:"alipay_pay";a:4:{s:7:"partner";s:0:"";s:12:"account_name";s:0:"";s:5:"email";s:0:"";s:3:"key";s:0:"";}s:10:"app_alipay";a:3:{s:10:"public_key";s:0:"";s:11:"private_key";s:0:"";s:5:"appid";s:0:"";}}');

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_system_adv`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_system_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `createtime` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  `module` varchar(255) DEFAULT '',
  `status` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_system_article`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_system_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT '',
  `author` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `content` text,
  `createtime` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  `cate` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_system_banner`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_system_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `createtime` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '0',
  `background` varchar(10) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_system_case`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_system_case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `qr` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '0',
  `cate` int(11) DEFAULT '0',
  `description` varchar(255) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_system_casecategory`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_system_casecategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_system_category`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_system_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_system_company_article`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_system_company_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT '',
  `author` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `content` text,
  `createtime` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  `cate` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_system_company_category`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_system_company_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_system_copyright`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_system_copyright` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `copyright` text,
  `bgcolor` varchar(255) DEFAULT '',
  `ismanage` tinyint(3) DEFAULT '0',
  `logo` varchar(255) DEFAULT '',
  `title` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_system_copyright_notice`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_system_copyright_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT '',
  `author` varchar(255) DEFAULT '',
  `content` text,
  `createtime` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_system_guestbook`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_system_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` varchar(255) NOT NULL DEFAULT '',
  `nickname` varchar(255) NOT NULL DEFAULT '',
  `createtime` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `clientip` varchar(64) NOT NULL DEFAULT '',
  `mobile` varchar(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_system_link`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_system_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `displayorder` int(11) DEFAULT NULL,
  `status` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_system_plugingrant_adv`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_system_plugingrant_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `advname` varchar(50) DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_enabled` (`enabled`) USING BTREE,
  KEY `idx_displayorder` (`displayorder`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_system_plugingrant_log`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_system_plugingrant_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logno` varchar(50) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `pluginid` int(11) NOT NULL DEFAULT '0',
  `identity` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `month` int(10) NOT NULL DEFAULT '0',
  `permendtime` int(10) NOT NULL DEFAULT '0',
  `permlasttime` int(10) NOT NULL DEFAULT '0',
  `isperm` tinyint(3) NOT NULL DEFAULT '0',
  `createtime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_system_plugingrant_order`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_system_plugingrant_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logno` varchar(50) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `pluginid` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `month` int(11) NOT NULL DEFAULT '0',
  `createtime` int(10) NOT NULL DEFAULT '0',
  `paystatus` tinyint(3) NOT NULL DEFAULT '0',
  `paytime` int(10) NOT NULL DEFAULT '0',
  `paytype` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_system_plugingrant_package`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_system_plugingrant_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginid` varchar(255) NOT NULL DEFAULT '',
  `text` varchar(255) DEFAULT NULL,
  `thumb` varchar(1000) DEFAULT NULL,
  `data` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `rec` tinyint(3) NOT NULL DEFAULT '0',
  `desc` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `displayorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_system_plugingrant_plugin`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_system_plugingrant_plugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginid` int(11) NOT NULL DEFAULT '0',
  `thumb` varchar(1000) NOT NULL,
  `data` text,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `sales` int(11) NOT NULL DEFAULT '0',
  `createtime` int(10) NOT NULL DEFAULT '0',
  `displayorder` int(11) NOT NULL DEFAULT '0',
  `plugintype` tinyint(3) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_system_plugingrant_setting`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_system_plugingrant_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `com` varchar(1000) NOT NULL DEFAULT '',
  `adv` varchar(1000) NOT NULL,
  `plugin` varchar(1000) NOT NULL,
  `customer` varchar(50) NOT NULL DEFAULT '0',
  `contact` text NOT NULL,
  `servertime` varchar(255) DEFAULT NULL,
  `weixin` tinyint(3) NOT NULL DEFAULT '0',
  `appid` varchar(255) DEFAULT NULL,
  `mchid` varchar(255) DEFAULT NULL,
  `apikey` varchar(255) DEFAULT NULL,
  `alipay` tinyint(3) NOT NULL,
  `account` varchar(255) DEFAULT NULL,
  `partner` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_system_setting`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_system_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) DEFAULT NULL,
  `background` varchar(10) DEFAULT '',
  `casebanner` varchar(255) DEFAULT '',
  `contact` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_system_site`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_system_site` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL DEFAULT '',
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_task`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL,
  `starttime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL,
  `dotime` int(11) NOT NULL DEFAULT '0',
  `donetime` int(11) NOT NULL DEFAULT '0',
  `timelimit` float(11,1) NOT NULL,
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `explain` text,
  `require_data` text NOT NULL,
  `reward_data` text NOT NULL,
  `period` int(11) NOT NULL DEFAULT '0',
  `repeat` int(11) NOT NULL DEFAULT '0',
  `maxtimes` int(11) NOT NULL DEFAULT '0',
  `everyhours` float(11,1) NOT NULL DEFAULT '0.0',
  `logo` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_task_adv`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_task_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `advname` varchar(50) DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `displayorder` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_task_default`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_task_default` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `data` text,
  `addtime` int(11) NOT NULL DEFAULT '0',
  `bgimg` varchar(255) NOT NULL DEFAULT '',
  `open` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_task_extension`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_task_extension` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskname` varchar(255) NOT NULL DEFAULT '',
  `taskclass` varchar(25) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `classify` varchar(255) NOT NULL DEFAULT '',
  `classify_name` varchar(255) NOT NULL DEFAULT '',
  `verb` varchar(255) NOT NULL DEFAULT '',
  `unit` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `ims_ewei_shop_task_extension`
--

INSERT INTO `ims_ewei_shop_task_extension` (`id`, `taskname`, `taskclass`, `status`, `classify`, `classify_name`, `verb`, `unit`) VALUES
(1, '推荐人数', 'commission_member', 1, 'number', 'number', '推荐', '人'),
(2, '分销佣金', 'commission_money', 1, 'number', 'number', '达到', '元'),
(3, '分销订单', 'commission_order', 1, 'number', 'number', '达到', '笔'),
(4, '订单满额', 'cost_enough', 1, 'number', 'number', '满', '元'),
(5, '累计金额', 'cost_total', 1, 'number', 'number', '累计', '元'),
(6, '订单数量', 'cost_count', 1, 'number', 'number', '达到', '单'),
(7, '指定商品', 'cost_goods', 1, 'select', 'select', '购买指定商品', '件'),
(8, '商品评价', 'cost_comment', 1, 'number', 'number', '评价订单', '次'),
(9, '累计充值', 'cost_rechargetotal', 1, 'number', 'number', '达到', '元'),
(10, '充值满额', 'cost_rechargeenough', 1, 'number', 'number', '满', '元'),
(11, '完善信息', 'member_info', 1, 'boole', 'boole', '填写手机号', '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_task_extension_join`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_task_extension_join` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `uid` int(11) NOT NULL,
  `taskid` int(11) NOT NULL,
  `openid` varchar(255) NOT NULL,
  `require_data` text NOT NULL,
  `progress_data` text NOT NULL,
  `reward_data` text NOT NULL,
  `completetime` int(11) NOT NULL DEFAULT '0',
  `pickuptime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL,
  `dotime` int(11) NOT NULL DEFAULT '0',
  `rewarded` text NOT NULL,
  `logo` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_task_join`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_task_join` (
  `join_id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `join_user` varchar(100) NOT NULL DEFAULT '',
  `task_id` int(11) NOT NULL DEFAULT '0',
  `task_type` tinyint(1) NOT NULL DEFAULT '0',
  `needcount` int(11) NOT NULL DEFAULT '0',
  `completecount` int(11) NOT NULL DEFAULT '0',
  `reward_data` text,
  `is_reward` tinyint(1) NOT NULL DEFAULT '0',
  `failtime` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) DEFAULT '0',
  PRIMARY KEY (`join_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_task_joiner`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_task_joiner` (
  `complete_id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `task_user` varchar(100) NOT NULL DEFAULT '',
  `joiner_id` varchar(100) NOT NULL DEFAULT '',
  `join_id` int(11) NOT NULL DEFAULT '0',
  `task_id` int(11) NOT NULL DEFAULT '0',
  `task_type` tinyint(1) NOT NULL DEFAULT '0',
  `join_status` tinyint(1) NOT NULL DEFAULT '1',
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`complete_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_task_log`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_task_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `openid` varchar(100) NOT NULL DEFAULT '',
  `from_openid` varchar(100) NOT NULL DEFAULT '',
  `join_id` int(11) NOT NULL DEFAULT '0',
  `taskid` int(11) DEFAULT '0',
  `task_type` tinyint(1) NOT NULL DEFAULT '0',
  `subdata` text,
  `recdata` text,
  `createtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_task_poster`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_task_poster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `days` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `bg` varchar(255) DEFAULT '',
  `data` text,
  `keyword` varchar(255) DEFAULT NULL,
  `resptype` tinyint(1) NOT NULL DEFAULT '0',
  `resptext` text,
  `resptitle` varchar(255) DEFAULT NULL,
  `respthumb` varchar(255) DEFAULT NULL,
  `respdesc` varchar(255) DEFAULT NULL,
  `respurl` varchar(255) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `waittext` varchar(255) DEFAULT NULL,
  `oktext` varchar(255) DEFAULT NULL,
  `scantext` varchar(255) DEFAULT NULL,
  `beagent` tinyint(1) NOT NULL DEFAULT '0',
  `bedown` tinyint(1) NOT NULL DEFAULT '0',
  `timestart` int(11) DEFAULT NULL,
  `timeend` int(11) DEFAULT NULL,
  `is_repeat` tinyint(1) DEFAULT '0',
  `getposter` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `starttext` varchar(255) DEFAULT NULL,
  `endtext` varchar(255) DEFAULT NULL,
  `reward_data` text,
  `needcount` int(11) NOT NULL DEFAULT '0',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `poster_type` tinyint(1) DEFAULT '1',
  `reward_days` int(11) DEFAULT '0',
  `titleicon` text,
  `poster_banner` text,
  `is_goods` tinyint(1) DEFAULT '0',
  `autoposter` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_task_poster_qr`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_task_poster_qr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acid` int(11) NOT NULL DEFAULT '0',
  `openid` varchar(100) NOT NULL,
  `posterid` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `sceneid` int(11) NOT NULL DEFAULT '0',
  `mediaid` varchar(255) DEFAULT NULL,
  `ticket` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `createtime` int(11) DEFAULT NULL,
  `qrimg` varchar(1000) DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `endtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_virtual_category`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_virtual_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `merchid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_virtual_data`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_virtual_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `typeid` int(11) NOT NULL DEFAULT '0',
  `pvalue` varchar(255) DEFAULT '',
  `fields` text NOT NULL,
  `openid` varchar(255) NOT NULL DEFAULT '',
  `usetime` int(11) NOT NULL DEFAULT '0',
  `orderid` int(11) DEFAULT '0',
  `ordersn` varchar(255) DEFAULT '',
  `price` decimal(10,2) DEFAULT '0.00',
  `merchid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_typeid` (`typeid`),
  KEY `idx_usetime` (`usetime`),
  KEY `idx_orderid` (`orderid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1001 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_virtual_type`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_virtual_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `cate` int(11) DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `fields` text NOT NULL,
  `usedata` int(11) NOT NULL DEFAULT '0',
  `alldata` int(11) NOT NULL DEFAULT '0',
  `merchid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_cate` (`cate`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_ewei_shop_wxcard`
--

CREATE TABLE IF NOT EXISTS `ims_ewei_shop_wxcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `card_id` varchar(255) DEFAULT '0',
  `displayorder` int(11) DEFAULT NULL,
  `catid` int(11) DEFAULT NULL,
  `card_type` varchar(50) DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `wxlogourl` varchar(255) DEFAULT NULL,
  `brand_name` varchar(255) DEFAULT NULL,
  `code_type` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `notice` varchar(50) DEFAULT NULL,
  `service_phone` varchar(50) DEFAULT NULL,
  `description` text,
  `datetype` varchar(50) DEFAULT NULL,
  `begin_timestamp` int(11) DEFAULT NULL,
  `end_timestamp` int(11) DEFAULT NULL,
  `fixed_term` int(11) DEFAULT NULL,
  `fixed_begin_term` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_quantity` varchar(255) DEFAULT NULL,
  `use_limit` int(11) DEFAULT NULL,
  `get_limit` int(11) DEFAULT NULL,
  `use_custom_code` tinyint(1) DEFAULT NULL,
  `bind_openid` tinyint(1) DEFAULT NULL,
  `can_share` tinyint(1) DEFAULT NULL,
  `can_give_friend` tinyint(1) DEFAULT NULL,
  `center_title` varchar(20) DEFAULT NULL,
  `center_sub_title` varchar(20) DEFAULT NULL,
  `center_url` varchar(255) DEFAULT NULL,
  `setcustom` tinyint(1) DEFAULT NULL,
  `custom_url_name` varchar(20) DEFAULT NULL,
  `custom_url_sub_title` varchar(20) DEFAULT NULL,
  `custom_url` varchar(255) DEFAULT NULL,
  `setpromotion` tinyint(1) DEFAULT NULL,
  `promotion_url_name` varchar(20) DEFAULT NULL,
  `promotion_url_sub_title` varchar(20) DEFAULT NULL,
  `promotion_url` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `can_use_with_other_discount` tinyint(1) DEFAULT NULL,
  `setabstract` tinyint(1) DEFAULT NULL,
  `abstract` varchar(50) DEFAULT NULL,
  `abstractimg` varchar(255) DEFAULT NULL,
  `icon_url_list` varchar(255) DEFAULT NULL,
  `accept_category` varchar(50) DEFAULT NULL,
  `reject_category` varchar(50) DEFAULT NULL,
  `least_cost` decimal(10,2) DEFAULT NULL,
  `reduce_cost` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `limitgoodtype` tinyint(1) DEFAULT '0',
  `limitgoodcatetype` tinyint(1) unsigned DEFAULT '0',
  `limitgoodcateids` varchar(255) DEFAULT NULL,
  `limitgoodids` varchar(255) DEFAULT NULL,
  `limitdiscounttype` tinyint(1) unsigned DEFAULT '0',
  `merchid` int(11) DEFAULT '0',
  `gettype` tinyint(3) DEFAULT NULL,
  `islimitlevel` tinyint(1) DEFAULT '0',
  `limitmemberlevels` varchar(500) DEFAULT '',
  `limitagentlevels` varchar(500) DEFAULT '',
  `limitpartnerlevels` varchar(500) DEFAULT '',
  `limitaagentlevels` varchar(500) DEFAULT '',
  `settitlecolor` tinyint(1) DEFAULT '0',
  `titlecolor` varchar(10) DEFAULT '',
  `tagtitle` varchar(20) DEFAULT '',
  `use_condition` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_images_reply`
--

CREATE TABLE IF NOT EXISTS `ims_images_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_card`
--

CREATE TABLE IF NOT EXISTS `ims_mc_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `color` varchar(255) NOT NULL,
  `background` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `format_type` tinyint(3) unsigned NOT NULL,
  `format` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `fields` varchar(1000) NOT NULL,
  `snpos` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `business` text NOT NULL,
  `discount_type` tinyint(3) unsigned NOT NULL,
  `discount` varchar(3000) NOT NULL,
  `grant` varchar(3000) NOT NULL,
  `grant_rate` varchar(20) NOT NULL,
  `offset_rate` int(10) unsigned NOT NULL,
  `offset_max` int(10) NOT NULL,
  `nums_status` tinyint(3) unsigned NOT NULL,
  `nums_text` varchar(15) NOT NULL,
  `nums` varchar(1000) NOT NULL,
  `times_status` tinyint(3) unsigned NOT NULL,
  `times_text` varchar(15) NOT NULL,
  `times` varchar(1000) NOT NULL,
  `params` longtext NOT NULL,
  `html` longtext NOT NULL,
  `recommend_status` tinyint(3) unsigned NOT NULL,
  `sign_status` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_card_care`
--

CREATE TABLE IF NOT EXISTS `ims_mc_card_care` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `groupid` int(10) unsigned NOT NULL,
  `credit1` int(10) unsigned NOT NULL,
  `credit2` int(10) unsigned NOT NULL,
  `couponid` int(10) unsigned NOT NULL,
  `granttime` int(10) unsigned NOT NULL,
  `days` int(10) unsigned NOT NULL,
  `time` tinyint(3) unsigned NOT NULL,
  `show_in_card` tinyint(3) unsigned NOT NULL,
  `content` varchar(1000) NOT NULL,
  `sms_notice` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_card_credit_set`
--

CREATE TABLE IF NOT EXISTS `ims_mc_card_credit_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `sign` varchar(1000) NOT NULL,
  `share` varchar(500) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_card_members`
--

CREATE TABLE IF NOT EXISTS `ims_mc_card_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) DEFAULT NULL,
  `openid` varchar(50) NOT NULL,
  `cid` int(10) NOT NULL,
  `cardsn` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `nums` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_card_notices`
--

CREATE TABLE IF NOT EXISTS `ims_mc_card_notices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `groupid` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_card_notices_unread`
--

CREATE TABLE IF NOT EXISTS `ims_mc_card_notices_unread` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `notice_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `is_new` tinyint(3) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`),
  KEY `notice_id` (`notice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_card_recommend`
--

CREATE TABLE IF NOT EXISTS `ims_mc_card_recommend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_card_record`
--

CREATE TABLE IF NOT EXISTS `ims_mc_card_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  `model` tinyint(3) unsigned NOT NULL,
  `fee` decimal(10,2) unsigned NOT NULL,
  `tag` varchar(10) NOT NULL,
  `note` varchar(255) NOT NULL,
  `remark` varchar(200) NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`),
  KEY `addtime` (`addtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_card_sign_record`
--

CREATE TABLE IF NOT EXISTS `ims_mc_card_sign_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `credit` int(10) unsigned NOT NULL,
  `is_grant` tinyint(3) unsigned NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_cash_record`
--

CREATE TABLE IF NOT EXISTS `ims_mc_cash_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL,
  `fee` decimal(10,2) unsigned NOT NULL,
  `final_fee` decimal(10,2) unsigned NOT NULL,
  `credit1` int(10) unsigned NOT NULL,
  `credit1_fee` decimal(10,2) unsigned NOT NULL,
  `credit2` decimal(10,2) unsigned NOT NULL,
  `cash` decimal(10,2) unsigned NOT NULL,
  `return_cash` decimal(10,2) unsigned NOT NULL,
  `final_cash` decimal(10,2) unsigned NOT NULL,
  `remark` varchar(255) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_chats_record`
--

CREATE TABLE IF NOT EXISTS `ims_mc_chats_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `flag` tinyint(3) unsigned NOT NULL,
  `openid` varchar(32) NOT NULL,
  `msgtype` varchar(15) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `openid` (`openid`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_credits_recharge`
--

CREATE TABLE IF NOT EXISTS `ims_mc_credits_recharge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `tid` varchar(64) NOT NULL,
  `transid` varchar(30) NOT NULL,
  `fee` varchar(10) NOT NULL,
  `type` varchar(15) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `backtype` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid_uid` (`uniacid`,`uid`),
  KEY `idx_tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_credits_record`
--

CREATE TABLE IF NOT EXISTS `ims_mc_credits_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `uniacid` int(11) NOT NULL,
  `credittype` varchar(10) NOT NULL,
  `num` decimal(10,2) NOT NULL,
  `operator` int(10) unsigned NOT NULL,
  `module` varchar(30) NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `remark` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=350 ;

--
-- 转存表中的数据 `ims_mc_credits_record`
--

INSERT INTO `ims_mc_credits_record` (`id`, `uid`, `uniacid`, `credittype`, `num`, `operator`, `module`, `clerk_id`, `store_id`, `clerk_type`, `createtime`, `remark`) VALUES
(1, 0, 1, 'credit2', '-300.00', 0, 'ewei_shopv2', 0, 0, 0, 1503755091, '余额抵扣300元，订单号SH20170826214451811462 OPENID: xcx_omn4O0Z2Jla6sXjPb5BEPk3J3RcE'),
(2, 0, 1, 'credit2', '-300.00', 0, 'ewei_shopv2', 0, 0, 0, 1503755312, '余额抵扣300元，订单号SH20170826214832267046 OPENID: xcx_omn4O0Z2Jla6sXjPb5BEPk3J3RcE'),
(3, 0, 1, 'credit2', '-100.00', 0, 'ewei_shopv2', 0, 0, 0, 1503766434, '余额抵扣100元，订单号SH20170827005354644526 OPENID: xcx_omn4O0Z2Jla6sXjPb5BEPk3J3RcE'),
(4, 0, 1, 'credit2', '-500.00', 0, 'ewei_shopv2', 0, 0, 0, 1504060425, '余额抵扣500元，订单号SH20170830103345288442 OPENID: xcx_kuajing'),
(5, 0, 1, 'credit2', '-500.00', 0, 'ewei_shopv2', 0, 0, 0, 1504060516, '余额抵扣500元，订单号SH20170830103516264965 OPENID: xcx_kuajing'),
(6, 0, 1, 'credit2', '-500.00', 0, 'ewei_shopv2', 0, 0, 0, 1504060565, '余额抵扣500元，订单号SH20170830103605696117 OPENID: xcx_kuajing'),
(7, 0, 1, 'credit2', '-1998.00', 0, 'ewei_shopv2', 0, 0, 0, 1504061265, '余额抵扣1998元，订单号SH20170830104745686626 OPENID: xcx_kuajing'),
(8, 0, 1, 'credit2', '-500.00', 0, 'ewei_shopv2', 0, 0, 0, 1504072918, '余额抵扣500元，订单号SH20170830140158506416 OPENID: xcx_omn4O0Z2Jla6sXjPb5BEPk3J3RcE'),
(9, 0, 1, 'credit2', '-500.00', 0, 'ewei_shopv2', 0, 0, 0, 1504072923, '余额抵扣500元，订单号SH20170830140203481529 OPENID: xcx_omn4O0Z2Jla6sXjPb5BEPk3J3RcE'),
(10, 0, 1, 'credit2', '-566.00', 0, 'ewei_shopv2', 0, 0, 0, 1504072949, '余额抵扣566元，订单号SH20170830140229385463 OPENID: xcx_omn4O0Z2Jla6sXjPb5BEPk3J3RcE'),
(11, 0, 1, 'credit2', '-566.00', 0, 'ewei_shopv2', 0, 0, 0, 1504073161, '余额抵扣566元，订单号SH20170830140601925236 OPENID: xcx_omn4O0Z2Jla6sXjPb5BEPk3J3RcE'),
(12, 0, 1, 'credit2', '99999.00', 1, 'ewei_shopv2', 0, 0, 0, 1504076662, '后台会员充值余额  OPENID: '),
(13, 0, 1, 'credit2', '99999.00', 1, 'ewei_shopv2', 0, 0, 0, 1504076813, '后台会员充值余额  OPENID: '),
(14, 0, 1, 'credit2', '-1200.00', 0, 'ewei_shopv2', 0, 0, 0, 1504077151, '余额抵扣1200元，订单号SH20170830151231122388 OPENID: xcx_omn4O0dEEFCYOOob9aYWy4pEFZ4g'),
(15, 0, 1, 'credit2', '-566.00', 0, 'ewei_shopv2', 0, 0, 0, 1504078221, '余额抵扣566元，订单号SH20170830153021447280 OPENID: xcx_omn4O0Z2Jla6sXjPb5BEPk3J3RcE'),
(16, 0, 1, 'credit2', '99999.00', 1, 'ewei_shopv2', 0, 0, 0, 1504256276, '后台会员充值余额  OPENID: '),
(17, 0, 1, 'credit2', '99999.00', 1, 'ewei_shopv2', 0, 0, 0, 1504258436, '后台会员充值余额  OPENID: xcx_oqh0A0YKYDgFJrFIPx9ZGUyQrDk0'),
(18, 0, 1, 'credit1', '898.00', 1, 'ewei_shopv2', 0, 0, 0, 1504258454, '后台会员充值积分  OPENID: xcx_oqh0A0YKYDgFJrFIPx9ZGUyQrDk0'),
(19, 0, 1, 'credit2', '99999.00', 1, 'ewei_shopv2', 0, 0, 0, 1504947160, '后台会员充值余额  OPENID: xcx_oqh0A0SpNJiQCXZ9myNTjz_ExhC8'),
(20, 0, 1, 'credit2', '-999.00', 0, 'ewei_shopv2', 0, 0, 0, 1504947681, '余额抵扣999元，订单号SH20170909170121242667 OPENID: xcx_oqh0A0SpNJiQCXZ9myNTjz_ExhC8'),
(21, 0, 1, 'credit2', '-500.00', 0, 'ewei_shopv2', 0, 0, 0, 1504948263, '余额抵扣500元，订单号SH20170909171103638883 OPENID: xcx_oqh0A0SpNJiQCXZ9myNTjz_ExhC8'),
(22, 0, 1, 'credit2', '99999.00', 1, 'ewei_shopv2', 0, 0, 0, 1505196131, '后台会员充值余额  OPENID: xcx_oqh0A0RkMeUCrSfeGq9BBioMpqXU'),
(23, 0, 1, 'credit2', '-1200.00', 0, 'ewei_shopv2', 0, 0, 0, 1505196874, '余额抵扣1200元，订单号SH20170912141434214183 OPENID: xcx_oqh0A0RkMeUCrSfeGq9BBioMpqXU'),
(24, 0, 1, 'credit2', '-1200.00', 0, 'ewei_shopv2', 0, 0, 0, 1505196988, '余额抵扣1200元，订单号SH20170912141628874288 OPENID: xcx_oqh0A0RkMeUCrSfeGq9BBioMpqXU'),
(25, 0, 1, 'credit2', '-979.00', 0, 'ewei_shopv2', 0, 0, 0, 1505271037, '余额抵扣979元，订单号SH20170913105037883382 OPENID: xcx_oqh0A0YKYDgFJrFIPx9ZGUyQrDk0'),
(26, 0, 1, 'credit2', '-1200.00', 0, 'ewei_shopv2', 0, 0, 0, 1505293359, '余额抵扣1200元，订单号SH20170913170239624142 OPENID: xcx_oqh0A0RkMeUCrSfeGq9BBioMpqXU'),
(27, 0, 1, 'credit2', '-500.00', 0, 'ewei_shopv2', 0, 0, 0, 1505297144, '余额抵扣500元，订单号SH20170913180544890826 OPENID: xcx_oqh0A0RkMeUCrSfeGq9BBioMpqXU'),
(28, 0, 1, 'credit2', '-500.00', 0, 'ewei_shopv2', 0, 0, 0, 1505297169, '余额抵扣500元，订单号SH20170913180609656228 OPENID: xcx_oqh0A0RkMeUCrSfeGq9BBioMpqXU'),
(29, 0, 1, 'credit2', '-500.00', 0, 'ewei_shopv2', 0, 0, 0, 1505365192, '余额抵扣500元，订单号SH20170914125952444282 OPENID: xcx_oqh0A0SpNJiQCXZ9myNTjz_ExhC8'),
(30, 0, 1, 'credit2', '-500.00', 0, 'ewei_shopv2', 0, 0, 0, 1505369710, '余额抵扣500元，订单号SH20170914141510661222 OPENID: xcx_oqh0A0SpNJiQCXZ9myNTjz_ExhC8'),
(31, 0, 6, 'credit2', '0.10', 0, 'ewei_shopv2', 0, 0, 0, 1515041287, '青岛海鲜锅贴会员充值:wechatnotify:credit2:0.10 OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(32, 0, 6, 'credit2', '3000.00', 6, 'ewei_shopv2', 0, 0, 0, 1515045382, '后台会员充值余额  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(33, 0, 6, 'credit2', '-210.00', 0, 'ewei_shopv2', 0, 0, 0, 1515045993, '余额抵扣210元，订单号SH20180104140633789028 OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(34, 0, 6, 'credit2', '-100.00', 6, 'ewei_shopv2', 0, 0, 0, 1515051225, '后台会员充值余额  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(35, 0, 6, 'credit2', '0.10', 0, 'ewei_shopv2', 0, 0, 0, 1515053057, '青岛海鲜锅贴会员充值:wechatnotify:credit2:0.10 OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(36, 0, 6, 'credit2', '-184.00', 0, 'ewei_shopv2', 0, 0, 0, 1515389976, '余额抵扣184元，订单号SH20180108133936872148 OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(37, 0, 6, 'credit2', '9999.00', 6, 'ewei_shopv2', 0, 0, 0, 1515410539, '后台会员充值余额  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(38, 0, 6, 'credit2', '-222.00', 0, 'ewei_shopv2', 0, 0, 0, 1515410909, '余额抵扣222元，订单号SH20180108192829808144 OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(39, 0, 6, 'credit2', '-38.00', 0, 'ewei_shopv2', 0, 0, 0, 1515411620, '余额抵扣38元，订单号SH20180108194021821205 OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(40, 0, 6, 'credit2', '100.00', 1, 'ewei_shopv2', 0, 0, 0, 1515476806, '会员充值余额  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(41, 0, 6, 'credit2', '-200.00', 1, 'ewei_shopv2', 0, 0, 0, 1515476862, '会员消费扣款  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(42, 0, 6, 'credit2', '100.00', 1, 'ewei_shopv2', 0, 0, 0, 1515476914, '会员充值余额  OPENID: sys_f10f2f4ee5697b18300284f2cbecbee3'),
(43, 0, 6, 'credit2', '-201.00', 0, 'ewei_shopv2', 0, 0, 0, 1515480157, '余额抵扣201元，订单号SH20180109144237221812 OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(44, 0, 6, 'credit2', '200.00', 4, 'ewei_shopv2', 0, 0, 0, 1515481276, '会员充值余额  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(45, 0, 6, 'credit2', '-700.00', 4, 'ewei_shopv2', 0, 0, 0, 1515481479, '会员消费扣款  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(46, 0, 6, 'credit2', '-75.00', 0, 'ewei_shopv2', 0, 0, 0, 1515481930, '余额抵扣75元，订单号SH20180109151210466686 OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(47, 0, 6, 'credit2', '3000.00', 4, 'ewei_shopv2', 0, 0, 0, 1515482262, '会员充值余额  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(48, 0, 6, 'credit2', '420.00', 0, 'ewei_shopv2', 0, 0, 0, 1515482262, '青岛海鲜锅贴充值满3000赠送420 OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(49, 0, 6, 'credit2', '-200.00', 4, 'ewei_shopv2', 0, 0, 0, 1515482313, '会员消费扣款  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(50, 0, 6, 'credit2', '100.00', 1, 'ewei_shopv2', 0, 0, 0, 1515653447, '会员充值余额  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(51, 0, 6, 'credit2', '100.00', 4, 'ewei_shopv2', 0, 0, 0, 1515721405, '会员充值余额  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(52, 0, 6, 'credit2', '1000.00', 4, 'ewei_shopv2', 0, 0, 0, 1515722358, '会员充值余额  OPENID: xcx_ozAoi0Vuqvw6Z8dOsqT1mE2prylA'),
(53, 0, 6, 'credit2', '80.00', 0, 'ewei_shopv2', 0, 0, 0, 1515722358, '青岛海鲜锅贴充值满800赠送80 OPENID: xcx_ozAoi0Vuqvw6Z8dOsqT1mE2prylA'),
(54, 0, 6, 'credit2', '-1080.00', 4, 'ewei_shopv2', 0, 0, 0, 1515722477, '后台会员充值余额  OPENID: xcx_ozAoi0Vuqvw6Z8dOsqT1mE2prylA'),
(55, 0, 6, 'credit2', '1000.00', 4, 'ewei_shopv2', 0, 0, 0, 1515722515, '会员充值余额  OPENID: xcx_ozAoi0Vuqvw6Z8dOsqT1mE2prylA'),
(56, 0, 6, 'credit2', '20.00', 0, 'ewei_shopv2', 0, 0, 0, 1515722515, '青岛海鲜锅贴充值满500赠送2% OPENID: xcx_ozAoi0Vuqvw6Z8dOsqT1mE2prylA'),
(57, 0, 6, 'credit2', '-130.00', 4, 'ewei_shopv2', 0, 0, 0, 1515722560, '会员消费扣款  OPENID: xcx_ozAoi0Vuqvw6Z8dOsqT1mE2prylA'),
(58, 0, 6, 'credit2', '-100.00', 4, 'ewei_shopv2', 0, 0, 0, 1515722662, '会员消费扣款  OPENID: xcx_ozAoi0Vuqvw6Z8dOsqT1mE2prylA'),
(59, 0, 6, 'credit2', '5.00', 4, 'ewei_shopv2', 0, 0, 0, 1515722662, '本人消费返佣 OPENID: xcx_ozAoi0Vuqvw6Z8dOsqT1mE2prylA'),
(60, 0, 6, 'credit2', '1000.00', 4, 'ewei_shopv2', 0, 0, 0, 1515723118, '后台会员充值余额  OPENID: xcx_ozAoi0Taz78QVpdOMuvjRcWQMnNs'),
(61, 0, 6, 'credit2', '-100.00', 4, 'ewei_shopv2', 0, 0, 0, 1515723229, '会员消费扣款  OPENID: xcx_ozAoi0Taz78QVpdOMuvjRcWQMnNs'),
(62, 0, 6, 'credit2', '5.00', 4, 'ewei_shopv2', 0, 0, 0, 1515723229, '本人消费返佣 OPENID: xcx_ozAoi0Taz78QVpdOMuvjRcWQMnNs'),
(63, 0, 6, 'credit2', '3.00', 4, 'ewei_shopv2', 0, 0, 0, 1515723229, '下级(ID:2310)陈桂芝消费返佣 OPENID: xcx_ozAoi0Vuqvw6Z8dOsqT1mE2prylA'),
(64, 0, 6, 'credit2', '2.00', 4, 'ewei_shopv2', 0, 0, 0, 1515723229, '下级(ID:2310)陈桂芝消费返佣 OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(65, 0, 6, 'credit2', '6.30', 0, 'ewei_shopv2', 0, 0, 0, 1515995648, '佣金提现 OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(66, 0, 6, 'credit2', '100.00', 6, 'ewei_shopv2', 0, 0, 0, 1516000975, '会员充值余额  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(67, 0, 6, 'credit2', '-200.00', 6, 'ewei_shopv2', 0, 0, 0, 1516000995, '会员消费扣款  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(68, 0, 6, 'credit2', '10.00', 6, 'ewei_shopv2', 0, 0, 0, 1516000995, '本人消费返佣 OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(69, 0, 6, 'credit2', '-798.00', 6, 'ewei_shopv2', 0, 0, 0, 1516068026, '后台会员充值余额  OPENID: xcx_ozAoi0Vuqvw6Z8dOsqT1mE2prylA'),
(70, 0, 6, 'credit2', '1000.00', 6, 'ewei_shopv2', 0, 0, 0, 1516068142, '会员充值余额  OPENID: xcx_ozAoi0Vuqvw6Z8dOsqT1mE2prylA'),
(71, 0, 6, 'credit2', '20.00', 0, 'ewei_shopv2', 0, 0, 0, 1516068142, '青岛海鲜锅贴充值满500赠送2% OPENID: xcx_ozAoi0Vuqvw6Z8dOsqT1mE2prylA'),
(72, 0, 6, 'credit2', '-54.00', 0, 'ewei_shopv2', 0, 0, 0, 1516068376, '余额抵扣54元，订单号SH20180116100616988573 OPENID: xcx_ozAoi0Vuqvw6Z8dOsqT1mE2prylA'),
(73, 0, 6, 'credit2', '-120.00', 0, 'ewei_shopv2', 0, 0, 0, 1516068480, '余额抵扣120元，订单号SH20180116100800882445 OPENID: xcx_ozAoi0Vuqvw6Z8dOsqT1mE2prylA'),
(74, 0, 6, 'credit2', '-212.00', 6, 'ewei_shopv2', 0, 0, 0, 1516068720, '会员消费扣款  OPENID: xcx_ozAoi0Vuqvw6Z8dOsqT1mE2prylA'),
(75, 0, 6, 'credit2', '-128.00', 6, 'ewei_shopv2', 0, 0, 0, 1516069064, '会员消费扣款  OPENID: xcx_ozAoi0Z5rZ0_pe8xb6OQtKL9Aq9s'),
(76, 0, 6, 'credit2', '-100.00', 6, 'ewei_shopv2', 0, 0, 0, 1516069111, '会员消费扣款  OPENID: xcx_ozAoi0Z5rZ0_pe8xb6OQtKL9Aq9s'),
(77, 0, 6, 'credit2', '5.00', 6, 'ewei_shopv2', 0, 0, 0, 1516069111, '本人消费返佣 OPENID: xcx_ozAoi0Z5rZ0_pe8xb6OQtKL9Aq9s'),
(78, 0, 6, 'credit2', '-634.00', 6, 'ewei_shopv2', 0, 0, 0, 1516069431, '会员消费扣款  OPENID: xcx_ozAoi0Vuqvw6Z8dOsqT1mE2prylA'),
(79, 0, 6, 'credit2', '31.70', 6, 'ewei_shopv2', 0, 0, 0, 1516069431, '本人消费返佣 OPENID: xcx_ozAoi0Vuqvw6Z8dOsqT1mE2prylA'),
(80, 0, 6, 'credit2', '-31.70', 6, 'ewei_shopv2', 0, 0, 0, 1516069484, '后台会员充值余额  OPENID: xcx_ozAoi0Vuqvw6Z8dOsqT1mE2prylA'),
(81, 0, 6, 'credit2', '-905.00', 6, 'ewei_shopv2', 0, 0, 0, 1516069560, '后台会员充值余额  OPENID: xcx_ozAoi0Taz78QVpdOMuvjRcWQMnNs'),
(82, 0, 6, 'credit2', '1000.00', 1, 'ewei_shopv2', 0, 0, 0, 1516071838, '后台会员充值余额  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(83, 0, 6, 'credit2', '-78.00', 0, 'ewei_shopv2', 0, 0, 0, 1516071880, '余额抵扣78元，订单号SH20180116110440636689 OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(84, 0, 6, 'credit2', '1000.00', 1, 'ewei_shopv2', 0, 0, 0, 1516071993, '后台会员充值余额  OPENID: xcx_ozAoi0Q30XFvi9pGju9tQqnPiiBE'),
(85, 0, 6, 'credit2', '-136.00', 0, 'ewei_shopv2', 0, 0, 0, 1516073331, '余额抵扣136元，订单号SH20180116112851285801 OPENID: xcx_ozAoi0Q30XFvi9pGju9tQqnPiiBE'),
(86, 0, 6, 'credit2', '-78.00', 0, 'ewei_shopv2', 0, 0, 0, 1516074003, '余额抵扣78元，订单号SH20180116114003888586 OPENID: xcx_ozAoi0Q30XFvi9pGju9tQqnPiiBE'),
(87, 0, 6, 'credit2', '-59.00', 0, 'ewei_shopv2', 0, 0, 0, 1516074093, '余额抵扣59元，订单号SH20180116114134882249 OPENID: xcx_ozAoi0Q30XFvi9pGju9tQqnPiiBE'),
(88, 0, 6, 'credit2', '-7.00', 6, 'ewei_shopv2', 0, 0, 0, 1516076798, '会员消费扣款  OPENID: sys_d64b15680aaaaf38425aa1ec34fdd045'),
(89, 0, 6, 'credit2', '0.35', 6, 'ewei_shopv2', 0, 0, 0, 1516076798, '本人消费返佣 OPENID: sys_d64b15680aaaaf38425aa1ec34fdd045'),
(90, 0, 6, 'credit2', '-34.00', 0, 'ewei_shopv2', 0, 0, 0, 1516078157, '余额抵扣34元，订单号SH20180116124917460226 OPENID: xcx_ozAoi0Q30XFvi9pGju9tQqnPiiBE'),
(91, 0, 6, 'credit2', '-500.00', 1, 'ewei_shopv2', 0, 0, 0, 1516083015, '会员消费扣款  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(92, 0, 6, 'credit2', '-500.00', 1, 'ewei_shopv2', 0, 0, 0, 1516083152, '会员消费扣款  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(93, 0, 6, 'credit2', '-500.00', 1, 'ewei_shopv2', 0, 0, 0, 1516083272, '会员消费扣款  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(94, 0, 6, 'credit2', '-100.00', 1, 'ewei_shopv2', 0, 0, 0, 1516083439, '会员消费扣款  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(95, 0, 6, 'credit2', '-100.00', 1, 'ewei_shopv2', 0, 0, 0, 1516083556, '会员消费扣款  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(96, 0, 6, 'credit2', '-100.00', 1, 'ewei_shopv2', 0, 0, 0, 1516083757, '会员消费扣款  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(97, 0, 6, 'credit2', '-50.00', 1, 'ewei_shopv2', 0, 0, 0, 1516083793, '会员消费扣款  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(98, 0, 6, 'credit2', '-20.00', 1, 'ewei_shopv2', 0, 0, 0, 1516083919, '会员消费扣款  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(99, 0, 6, 'credit2', '-60.00', 1, 'ewei_shopv2', 0, 0, 0, 1516084010, '会员消费扣款  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(100, 0, 6, 'credit2', '-100.00', 1, 'ewei_shopv2', 0, 0, 0, 1516084039, '会员消费扣款  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(101, 0, 6, 'credit2', '-100.00', 1, 'ewei_shopv2', 0, 0, 0, 1516084107, '会员消费扣款  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(102, 0, 6, 'credit2', '5.00', 1, 'ewei_shopv2', 0, 0, 0, 1516084107, '本人消费返佣 OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(103, 0, 6, 'credit2', '-100.00', 1, 'ewei_shopv2', 0, 0, 0, 1516084210, '会员消费扣款  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(104, 0, 6, 'credit2', '5.00', 1, 'ewei_shopv2', 0, 0, 0, 1516084210, '本人消费返佣 OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(105, 0, 6, 'credit2', '100.00', 7, 'ewei_shopv2', 0, 0, 0, 1516085695, '会员充值余额  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(106, 0, 6, 'credit2', '-100.00', 7, 'ewei_shopv2', 0, 0, 0, 1516085776, '会员消费扣款  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(107, 0, 6, 'credit2', '5.00', 7, 'ewei_shopv2', 0, 0, 0, 1516085776, '本人消费返佣 OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(108, 0, 6, 'credit2', '100.00', 7, 'ewei_shopv2', 0, 0, 0, 1516086035, '会员充值余额  OPENID: xcx_ozAoi0cnnbU3SeSVnSdg_Qq8cSic'),
(109, 0, 6, 'credit2', '-15.00', 7, 'ewei_shopv2', 0, 0, 0, 1516097063, '会员消费扣款  OPENID: xcx_ozAoi0ak8Ebp1NWdMowpLHHA6jYo'),
(110, 0, 6, 'credit2', '-28.00', 7, 'ewei_shopv2', 0, 0, 0, 1516104255, '会员消费扣款  OPENID: sys_b6bc75822b6f93348dc8deee55ce32df'),
(111, 0, 6, 'credit2', '-411.00', 7, 'ewei_shopv2', 0, 0, 0, 1516105930, '会员消费扣款  OPENID: xcx_ozAoi0fK1Wdxrsykei39pT5roBAQ'),
(112, 0, 6, 'credit2', '-248.00', 7, 'ewei_shopv2', 0, 0, 0, 1516162872, '会员消费扣款  OPENID: sys_b3fe19c7f879e57ce54c2919e2719bb7'),
(113, 0, 6, 'credit2', '-34.00', 7, 'ewei_shopv2', 0, 0, 0, 1516166066, '会员消费扣款  OPENID: sys_0d1dc67ad2ef68561e0d9a94104c0079'),
(114, 0, 6, 'credit2', '-22.00', 7, 'ewei_shopv2', 0, 0, 0, 1516166206, '会员消费扣款  OPENID: sys_6e336584ca565d0d01aa99daddb91e4a'),
(115, 0, 6, 'credit2', '5.00', 4, 'ewei_shopv2', 0, 0, 0, 1516166790, '本人消费返佣 OPENID: xcx_ozAoi0fexXDGfeQOxBE5BMGISodw'),
(116, 0, 6, 'credit2', '100.00', 4, 'ewei_shopv2', 0, 0, 0, 1516166864, '会员充值余额  OPENID: xcx_ozAoi0fexXDGfeQOxBE5BMGISodw'),
(117, 0, 6, 'credit2', '-100.00', 4, 'ewei_shopv2', 0, 0, 0, 1516166887, '储值消费扣款  OPENID: xcx_ozAoi0fexXDGfeQOxBE5BMGISodw'),
(118, 0, 6, 'credit2', '5.00', 4, 'ewei_shopv2', 0, 0, 0, 1516166887, '本人消费返佣 OPENID: xcx_ozAoi0fexXDGfeQOxBE5BMGISodw'),
(119, 0, 6, 'credit2', '5.00', 6, 'ewei_shopv2', 0, 0, 0, 1516170583, '本人消费返佣 OPENID: xcx_ozAoi0T3-us_I_F6OnYElSGTxnmQ'),
(120, 0, 6, 'credit2', '-346.00', 7, 'ewei_shopv2', 0, 0, 0, 1516195540, '储值消费扣款  OPENID: sys_51637c549e04d11fa2d184a9de130f7d'),
(121, 0, 6, 'credit2', '2.50', 7, 'ewei_shopv2', 0, 0, 0, 1516249128, '本人消费返佣 OPENID: sys_b8fa8759846c5b7708fd74d5a04ec843'),
(122, 0, 6, 'credit2', '-43.00', 7, 'ewei_shopv2', 0, 0, 0, 1516270498, '储值消费扣款  OPENID: sys_bf47b59676ddfad77134c7e0d5a14f30'),
(123, 0, 6, 'credit2', '-516.00', 7, 'ewei_shopv2', 0, 0, 0, 1516275193, '储值消费扣款  OPENID: sys_a2b8e377273514f753b2604abc9ca5c0'),
(124, 0, 6, 'credit2', '-231.00', 7, 'ewei_shopv2', 0, 0, 0, 1516285643, '储值消费扣款  OPENID: sys_0d1dc67ad2ef68561e0d9a94104c0079'),
(125, 0, 6, 'credit2', '500.00', 7, 'ewei_shopv2', 0, 0, 0, 1516335131, '会员充值余额  OPENID: sys_3ad2f6f330f50fb2acf88276d0cccd2a'),
(126, 0, 6, 'credit2', '10.00', 0, 'ewei_shopv2', 0, 0, 0, 1516335131, '青岛海鲜锅贴充值满500赠送2% OPENID: sys_3ad2f6f330f50fb2acf88276d0cccd2a'),
(127, 0, 6, 'credit2', '-52.00', 7, 'ewei_shopv2', 0, 0, 0, 1516356982, '储值消费扣款  OPENID: sys_b21d39f39cb315d0dc56f7e75bed7b0d'),
(128, 0, 6, 'credit2', '-42.00', 7, 'ewei_shopv2', 0, 0, 0, 1516358959, '储值消费扣款  OPENID: xcx_ozAoi0SFFkyPlAJoH4NU_iE6hj6Q'),
(129, 0, 6, 'credit2', '-338.00', 7, 'ewei_shopv2', 0, 0, 0, 1516361084, '储值消费扣款  OPENID: sys_372990147fc25bba0cf242903f552a0f'),
(130, 0, 6, 'credit2', '-385.00', 8, 'ewei_shopv2', 0, 0, 0, 1516361726, '储值消费扣款  OPENID: sys_c913d5f42aaeee7ae002894661929c34'),
(131, 0, 6, 'credit2', '8.65', 7, 'ewei_shopv2', 0, 0, 0, 1516363622, '本人消费返佣 OPENID: sys_f8fc1d6064e7af3f701860767a37afa7'),
(132, 0, 6, 'credit2', '-57.00', 7, 'ewei_shopv2', 0, 0, 0, 1516418013, '储值消费扣款  OPENID: xcx_ozAoi0SFFkyPlAJoH4NU_iE6hj6Q'),
(133, 0, 6, 'credit2', '31.65', 7, 'ewei_shopv2', 0, 0, 0, 1516418332, '本人消费返佣 OPENID: sys_a5daf45ed1cf609f9ed7d0b48662f00e'),
(134, 0, 6, 'credit2', '-25.00', 7, 'ewei_shopv2', 0, 0, 0, 1516422035, '储值消费扣款  OPENID: sys_6f9c8b9b5f5bbfd4a009d3e20eedf1d2'),
(135, 0, 6, 'credit2', '1.90', 7, 'ewei_shopv2', 0, 0, 0, 1516422088, '本人消费返佣 OPENID: sys_6f9c8b9b5f5bbfd4a009d3e20eedf1d2'),
(136, 0, 6, 'credit2', '14.10', 7, 'ewei_shopv2', 0, 0, 0, 1516422639, '本人消费返佣 OPENID: sys_e91d92e420c1b8615147d2c86e2c07ec'),
(137, 0, 6, 'credit2', '10.50', 7, 'ewei_shopv2', 0, 0, 0, 1516427351, '本人消费返佣 OPENID: sys_d1109aa4b5b6155738c72766adbf908f'),
(138, 0, 6, 'credit2', '8.65', 7, 'ewei_shopv2', 0, 0, 0, 1516429766, '本人消费返佣 OPENID: sys_6f9c8b9b5f5bbfd4a009d3e20eedf1d2'),
(139, 0, 6, 'credit2', '-145.00', 7, 'ewei_shopv2', 0, 0, 0, 1516439917, '储值消费扣款  OPENID: sys_df167ef93967da9e2b7c3f81e1bcaa45'),
(140, 0, 6, 'credit2', '-422.00', 7, 'ewei_shopv2', 0, 0, 0, 1516449920, '储值消费扣款  OPENID: sys_bdf299730202aef549a8456e49797e57'),
(141, 0, 6, 'credit2', '-67.00', 7, 'ewei_shopv2', 0, 0, 0, 1516454068, '储值消费扣款  OPENID: sys_81c70c957a0fe995a8a50ea56d594745'),
(142, 0, 6, 'credit2', '-36.00', 7, 'ewei_shopv2', 0, 0, 0, 1516503982, '储值消费扣款  OPENID: sys_defb1717b719fd91459ceb066028ac57'),
(143, 0, 6, 'credit2', '-61.00', 8, 'ewei_shopv2', 0, 0, 0, 1516511178, '储值消费扣款  OPENID: sys_b21d39f39cb315d0dc56f7e75bed7b0d'),
(144, 0, 6, 'credit2', '-257.00', 8, 'ewei_shopv2', 0, 0, 0, 1516512656, '储值消费扣款  OPENID: sys_4319e544befb45cb179dd900d19aa05b'),
(145, 0, 6, 'credit2', '4.50', 7, 'ewei_shopv2', 0, 0, 0, 1516526835, '后台会员充值余额  OPENID: xcx_ozAoi0biBfZKyCVgAJiYkfzLwtk4'),
(146, 0, 6, 'credit2', '-24.00', 7, 'ewei_shopv2', 0, 0, 0, 1516530588, '储值消费扣款  OPENID: sys_9379e8ff592ef4a35b755c3241d459dc'),
(147, 0, 6, 'credit2', '22.40', 8, 'ewei_shopv2', 0, 0, 0, 1516536892, '本人消费返佣 OPENID: sys_18a44ac9b185d560fc7d7ddbc0b4e1cb'),
(148, 0, 6, 'credit2', '2.80', 7, 'ewei_shopv2', 0, 0, 0, 1516591606, '本人消费返佣 OPENID: sys_241acc074a51f2d502cb3271dcbae3f4'),
(149, 0, 6, 'credit2', '-20.00', 7, 'ewei_shopv2', 0, 0, 0, 1516596627, '储值消费扣款  OPENID: sys_fbb123c34af04c6331286252727ff692'),
(150, 0, 6, 'credit2', '12.85', 7, 'ewei_shopv2', 0, 0, 0, 1516606205, '本人消费返佣 OPENID: sys_0a846eb991a259f1628bf82f259a7bc1'),
(151, 0, 6, 'credit2', '-129.00', 7, 'ewei_shopv2', 0, 0, 0, 1516618449, '储值消费扣款  OPENID: sys_92ed9f46058ae6d079ad1313a2d82e27'),
(152, 0, 6, 'credit2', '-177.00', 7, 'ewei_shopv2', 0, 0, 0, 1516620409, '储值消费扣款  OPENID: sys_4e7e7a41e681efdf94563daea5e40de0'),
(153, 0, 6, 'credit2', '18.40', 7, 'ewei_shopv2', 0, 0, 0, 1516621853, '后台会员充值余额  OPENID: xcx_ozAoi0Zu3w8Uy9xRWPn4y1XsN3hM'),
(154, 0, 6, 'credit2', '19.20', 7, 'ewei_shopv2', 0, 0, 0, 1516623380, '后台会员充值余额  OPENID: sys_fea6dfc104ce537913efcb88f7ef7129'),
(155, 0, 6, 'credit2', '-6.00', 7, 'ewei_shopv2', 0, 0, 0, 1516624189, '储值消费扣款  OPENID: sys_26781284d69f461efbe10360a418b815'),
(156, 0, 6, 'credit2', '-66.00', 7, 'ewei_shopv2', 0, 0, 0, 1516680442, '储值消费扣款  OPENID: sys_aee03e07298199593d6005305716a0b3'),
(157, 0, 6, 'credit2', '-11.00', 7, 'ewei_shopv2', 0, 0, 0, 1516680696, '储值消费扣款  OPENID: sys_6aef0a1f41cfba954177cab0f1c803aa'),
(158, 0, 6, 'credit2', '-35.00', 8, 'ewei_shopv2', 0, 0, 0, 1516680820, '储值消费扣款  OPENID: sys_3354c171c27cab66db62ffb11e29f6d0'),
(159, 0, 6, 'credit2', '-108.00', 7, 'ewei_shopv2', 0, 0, 0, 1516700980, '储值消费扣款  OPENID: sys_2aa12d9e855df175796a0d628428c200'),
(160, 0, 6, 'credit2', '-77.00', 7, 'ewei_shopv2', 0, 0, 0, 1516701797, '储值消费扣款  OPENID: sys_0d1dc67ad2ef68561e0d9a94104c0079'),
(161, 0, 6, 'credit2', '-66.00', 7, 'ewei_shopv2', 0, 0, 0, 1516706522, '储值消费扣款  OPENID: sys_292f9ed507cb9aba81dd2b211d9c809d'),
(162, 0, 6, 'credit2', '17.65', 7, 'ewei_shopv2', 0, 0, 0, 1516706605, '本人消费返佣 OPENID: sys_292f9ed507cb9aba81dd2b211d9c809d'),
(163, 0, 6, 'credit2', '-474.00', 7, 'ewei_shopv2', 0, 0, 0, 1516708976, '储值消费扣款  OPENID: sys_81f26f41d6718f4559c27d301e32bec0'),
(164, 0, 6, 'credit2', '-184.00', 7, 'ewei_shopv2', 0, 0, 0, 1516709981, '储值消费扣款  OPENID: sys_7f706099881228f943d156b413e79951'),
(165, 0, 6, 'credit2', '-235.00', 7, 'ewei_shopv2', 0, 0, 0, 1516713771, '储值消费扣款  OPENID: sys_709f54b007174fb80b012fda3e7d4e4e'),
(166, 0, 6, 'credit2', '7.20', 7, 'ewei_shopv2', 0, 0, 0, 1516713810, '本人消费返佣 OPENID: sys_709f54b007174fb80b012fda3e7d4e4e'),
(167, 0, 6, 'credit2', '581.90', 7, 'ewei_shopv2', 0, 0, 0, 1516759314, '后台会员充值余额  OPENID: xcx_ozAoi0T2Lx2nBb-OhrtnmdUAhOnk'),
(168, 0, 6, 'credit2', '9.20', 7, 'ewei_shopv2', 0, 0, 0, 1516764391, '本人消费返佣 OPENID: sys_2fdb91d026570c7dc3828cc178b9fd62'),
(169, 0, 6, 'credit2', '-8.30', 7, 'ewei_shopv2', 0, 0, 0, 1516764484, '后台会员充值余额  OPENID: sys_2fdb91d026570c7dc3828cc178b9fd62'),
(170, 0, 6, 'credit2', '-72.00', 7, 'ewei_shopv2', 0, 0, 0, 1516766056, '储值消费扣款  OPENID: sys_633fe53f42387a1601f5b9c5460cbea9'),
(171, 0, 6, 'credit2', '-72.00', 7, 'ewei_shopv2', 0, 0, 0, 1516767236, '储值消费扣款  OPENID: sys_defb1717b719fd91459ceb066028ac57'),
(172, 0, 6, 'credit2', '-50.00', 7, 'ewei_shopv2', 0, 0, 0, 1516790540, '储值消费扣款  OPENID: sys_b3b505dd287773fe094e26ad1dc80220'),
(173, 0, 6, 'credit2', '-18.00', 7, 'ewei_shopv2', 0, 0, 0, 1516791728, '储值消费扣款  OPENID: sys_463ff77dead8d0e1967c3731b0d9b127'),
(174, 0, 6, 'credit2', '-219.00', 7, 'ewei_shopv2', 0, 0, 0, 1516849416, '储值消费扣款  OPENID: sys_04e2a8b826f8c1dce5a93d5c2297dc74'),
(175, 0, 6, 'credit2', '-12.00', 7, 'ewei_shopv2', 0, 0, 0, 1516852281, '储值消费扣款  OPENID: sys_fbb123c34af04c6331286252727ff692'),
(176, 0, 6, 'credit2', '-8.00', 7, 'ewei_shopv2', 0, 0, 0, 1516853088, '储值消费扣款  OPENID: sys_d64b15680aaaaf38425aa1ec34fdd045'),
(177, 0, 6, 'credit2', '0.40', 7, 'ewei_shopv2', 0, 0, 0, 1516853088, '本人消费返佣 OPENID: sys_d64b15680aaaaf38425aa1ec34fdd045'),
(178, 0, 6, 'credit2', '-233.00', 7, 'ewei_shopv2', 0, 0, 0, 1516857325, '储值消费扣款  OPENID: sys_b261dcfd8e0816a8a6175e94ba67e54c'),
(179, 0, 6, 'credit2', '3000.00', 7, 'ewei_shopv2', 0, 0, 0, 1516878674, '会员充值余额  OPENID: sys_c42741144ee60ec41816930c5a36898e'),
(180, 0, 6, 'credit2', '120.00', 0, 'ewei_shopv2', 0, 0, 0, 1516878674, '青岛海鲜锅贴充值满3000赠送4% OPENID: sys_c42741144ee60ec41816930c5a36898e'),
(181, 0, 6, 'credit2', '-331.00', 7, 'ewei_shopv2', 0, 0, 0, 1516878741, '储值消费扣款  OPENID: sys_c42741144ee60ec41816930c5a36898e'),
(182, 0, 6, 'credit2', '16.55', 7, 'ewei_shopv2', 0, 0, 0, 1516878741, '本人消费返佣 OPENID: sys_c42741144ee60ec41816930c5a36898e'),
(183, 0, 6, 'credit2', '-820.00', 7, 'ewei_shopv2', 0, 0, 0, 1516885802, '储值消费扣款  OPENID: sys_70dfdc96840d953763c7ad5fff10a254'),
(184, 0, 6, 'credit2', '500.00', 7, 'ewei_shopv2', 0, 0, 0, 1516886050, '会员充值余额  OPENID: sys_b3fe19c7f879e57ce54c2919e2719bb7'),
(185, 0, 6, 'credit2', '10.00', 0, 'ewei_shopv2', 0, 0, 0, 1516886050, '青岛海鲜锅贴充值满500赠送2% OPENID: sys_b3fe19c7f879e57ce54c2919e2719bb7'),
(186, 0, 6, 'credit2', '-396.00', 7, 'ewei_shopv2', 0, 0, 0, 1516886126, '储值消费扣款  OPENID: sys_b3fe19c7f879e57ce54c2919e2719bb7'),
(187, 0, 6, 'credit2', '-25.00', 8, 'ewei_shopv2', 0, 0, 0, 1516937156, '储值消费扣款  OPENID: sys_1324a01392d47806d19186935794cf26'),
(188, 0, 6, 'credit2', '-151.00', 7, 'ewei_shopv2', 0, 0, 0, 1516940981, '储值消费扣款  OPENID: sys_bd50d21b3672c8c767ed6ae1511e05f2'),
(189, 0, 6, 'credit2', '-4.00', 7, 'ewei_shopv2', 0, 0, 0, 1516942254, '储值消费扣款  OPENID: sys_e2498bf355cbd7d899615a177169e658'),
(190, 0, 6, 'credit2', '-613.00', 7, 'ewei_shopv2', 0, 0, 0, 1516943921, '储值消费扣款  OPENID: sys_b261dcfd8e0816a8a6175e94ba67e54c'),
(191, 0, 6, 'credit2', '-1470.00', 8, 'ewei_shopv2', 0, 0, 0, 1516962376, '储值消费扣款  OPENID: sys_c42741144ee60ec41816930c5a36898e'),
(192, 0, 6, 'credit2', '73.50', 8, 'ewei_shopv2', 0, 0, 0, 1516962376, '本人消费返佣 OPENID: sys_c42741144ee60ec41816930c5a36898e'),
(193, 0, 6, 'credit2', '-413.00', 7, 'ewei_shopv2', 0, 0, 0, 1516968584, '储值消费扣款  OPENID: sys_4251dacfc3d3f14d8535eca153ca4369'),
(194, 0, 6, 'credit2', '19.95', 7, 'ewei_shopv2', 0, 0, 0, 1516968654, '本人消费返佣 OPENID: sys_4251dacfc3d3f14d8535eca153ca4369'),
(195, 0, 6, 'credit2', '-13.00', 7, 'ewei_shopv2', 0, 0, 0, 1516968938, '储值消费扣款  OPENID: sys_5eb1b72ae835fc128dd6b8882056d660'),
(196, 0, 6, 'credit2', '-518.00', 7, 'ewei_shopv2', 0, 0, 0, 1516976950, '储值消费扣款  OPENID: sys_81f26f41d6718f4559c27d301e32bec0'),
(197, 0, 6, 'credit2', '-3.00', 7, 'ewei_shopv2', 0, 0, 0, 1517023459, '储值消费扣款  OPENID: sys_a1973fd0e5ab3f6864e8136c87aac6b7'),
(198, 0, 6, 'credit2', '-88.00', 7, 'ewei_shopv2', 0, 0, 0, 1517029564, '储值消费扣款  OPENID: sys_31fbeedd6c6320a8958a609a89e891f8'),
(199, 0, 6, 'credit2', '-1409.00', 8, 'ewei_shopv2', 0, 0, 0, 1517047376, '储值消费扣款  OPENID: sys_c42741144ee60ec41816930c5a36898e'),
(200, 0, 6, 'credit2', '70.45', 8, 'ewei_shopv2', 0, 0, 0, 1517047376, '本人消费返佣 OPENID: sys_c42741144ee60ec41816930c5a36898e'),
(201, 0, 6, 'credit2', '-34.00', 8, 'ewei_shopv2', 0, 0, 0, 1517106497, '储值消费扣款  OPENID: sys_574b46f32252fed433fda8b000e615c2'),
(202, 0, 6, 'credit2', '-190.00', 7, 'ewei_shopv2', 0, 0, 0, 1517115384, '储值消费扣款  OPENID: sys_df167ef93967da9e2b7c3f81e1bcaa45'),
(203, 0, 6, 'credit2', '1000.00', 8, 'ewei_shopv2', 0, 0, 0, 1517119246, '会员充值余额  OPENID: sys_c42741144ee60ec41816930c5a36898e'),
(204, 0, 6, 'credit2', '20.00', 0, 'ewei_shopv2', 0, 0, 0, 1517119246, '青岛海鲜锅贴充值满500赠送2% OPENID: sys_c42741144ee60ec41816930c5a36898e'),
(205, 0, 6, 'credit2', '-835.00', 8, 'ewei_shopv2', 0, 0, 0, 1517119297, '储值消费扣款  OPENID: sys_c42741144ee60ec41816930c5a36898e'),
(206, 0, 6, 'credit2', '41.75', 8, 'ewei_shopv2', 0, 0, 0, 1517119297, '本人消费返佣 OPENID: sys_c42741144ee60ec41816930c5a36898e'),
(207, 0, 6, 'credit2', '-408.00', 7, 'ewei_shopv2', 0, 0, 0, 1517139039, '储值消费扣款  OPENID: sys_9563b8a7f32927f6fe62d337cf8310e4'),
(208, 0, 6, 'credit2', '33.65', 8, 'ewei_shopv2', 0, 0, 0, 1517196095, '本人消费返佣 OPENID: sys_224225290ceda24f6bf1e4a7429b42ed'),
(209, 0, 6, 'credit2', '0.40', 7, 'ewei_shopv2', 0, 0, 0, 1517198650, '本人消费返佣 OPENID: sys_86724f625b947e9944259b6c34ae2aba'),
(210, 0, 6, 'credit2', '-82.00', 7, 'ewei_shopv2', 0, 0, 0, 1517200086, '储值消费扣款  OPENID: sys_c697ac9cc286e48c9d3b89e0f0317cb6'),
(211, 0, 6, 'credit2', '-110.00', 8, 'ewei_shopv2', 0, 0, 0, 1517201639, '储值消费扣款  OPENID: sys_224225290ceda24f6bf1e4a7429b42ed'),
(212, 0, 6, 'credit2', '17.25', 8, 'ewei_shopv2', 0, 0, 0, 1517201674, '本人消费返佣 OPENID: sys_224225290ceda24f6bf1e4a7429b42ed'),
(213, 0, 6, 'credit2', '-39.00', 7, 'ewei_shopv2', 0, 0, 0, 1517218344, '储值消费扣款  OPENID: sys_0d1dc67ad2ef68561e0d9a94104c0079'),
(214, 0, 6, 'credit2', '-123.00', 7, 'ewei_shopv2', 0, 0, 0, 1517221401, '储值消费扣款  OPENID: xcx_ozAoi0dHxSW9QGM_TY61sTiNelqU'),
(215, 0, 6, 'credit2', '9.40', 7, 'ewei_shopv2', 0, 0, 0, 1517225887, '本人消费返佣 OPENID: sys_6796b40c7dc262799a83e6b20a75664c'),
(216, 0, 6, 'credit2', '-343.00', 7, 'ewei_shopv2', 0, 0, 0, 1517226009, '储值消费扣款  OPENID: sys_0d1dc67ad2ef68561e0d9a94104c0079'),
(217, 0, 6, 'credit2', '-271.00', 7, 'ewei_shopv2', 0, 0, 0, 1517227982, '储值消费扣款  OPENID: sys_2aa12d9e855df175796a0d628428c200'),
(218, 0, 6, 'credit2', '-175.00', 7, 'ewei_shopv2', 0, 0, 0, 1517285326, '储值消费扣款  OPENID: sys_ffe55c008682846b37538b0a37cdc9db'),
(219, 0, 6, 'credit2', '-11.00', 7, 'ewei_shopv2', 0, 0, 0, 1517285505, '储值消费扣款  OPENID: sys_6f9c8b9b5f5bbfd4a009d3e20eedf1d2'),
(220, 0, 6, 'credit2', '0.55', 7, 'ewei_shopv2', 0, 0, 0, 1517285505, '本人消费返佣 OPENID: sys_6f9c8b9b5f5bbfd4a009d3e20eedf1d2'),
(221, 0, 6, 'credit2', '-156.00', 7, 'ewei_shopv2', 0, 0, 0, 1517288121, '储值消费扣款  OPENID: sys_df167ef93967da9e2b7c3f81e1bcaa45'),
(222, 0, 6, 'credit2', '-139.00', 7, 'ewei_shopv2', 0, 0, 0, 1517292469, '储值消费扣款  OPENID: sys_83d0126d1b75d3ab0d98eff4b5dc73ed'),
(223, 0, 6, 'credit2', '25.00', 7, 'ewei_shopv2', 0, 0, 0, 1517292502, '本人消费返佣 OPENID: sys_83d0126d1b75d3ab0d98eff4b5dc73ed'),
(224, 0, 6, 'credit2', '-355.00', 7, 'ewei_shopv2', 0, 0, 0, 1517312266, '储值消费扣款  OPENID: sys_c697ac9cc286e48c9d3b89e0f0317cb6'),
(225, 0, 6, 'credit2', '-58.00', 0, 'ewei_shopv2', 0, 0, 0, 1517324071, '余额抵扣58元，订单号SH20180130225431748278 OPENID: xcx_ozAoi0Q30XFvi9pGju9tQqnPiiBE'),
(226, 0, 6, 'credit2', '-58.00', 0, 'ewei_shopv2', 0, 0, 0, 1517324537, '余额抵扣58元，订单号SH20180130230217836368 OPENID: xcx_ozAoi0Q30XFvi9pGju9tQqnPiiBE'),
(227, 0, 6, 'credit2', '-168.00', 7, 'ewei_shopv2', 0, 0, 0, 1517373388, '储值消费扣款  OPENID: sys_f3ab919cd0468de3fffcaf2925bdf67c'),
(228, 0, 6, 'credit2', '-22.00', 7, 'ewei_shopv2', 0, 0, 0, 1517373610, '储值消费扣款  OPENID: sys_b8fa8759846c5b7708fd74d5a04ec843'),
(229, 0, 6, 'credit2', '0.60', 7, 'ewei_shopv2', 0, 0, 0, 1517373637, '本人消费返佣 OPENID: sys_b8fa8759846c5b7708fd74d5a04ec843'),
(230, 0, 6, 'credit2', '-29.00', 7, 'ewei_shopv2', 0, 0, 0, 1517374020, '储值消费扣款  OPENID: sys_e55499de1a76c427951f9937d3ad4887'),
(231, 0, 6, 'credit2', '5.95', 7, 'ewei_shopv2', 0, 0, 0, 1517374070, '本人消费返佣 OPENID: sys_e55499de1a76c427951f9937d3ad4887'),
(232, 0, 6, 'credit2', '-5.00', 7, 'ewei_shopv2', 0, 0, 0, 1517375512, '储值消费扣款  OPENID: sys_84acd19eeb4cbcb23b23f4097d3633a4'),
(233, 0, 6, 'credit2', '-401.00', 7, 'ewei_shopv2', 0, 0, 0, 1517375732, '储值消费扣款  OPENID: xcx_ozAoi0Zu3w8Uy9xRWPn4y1XsN3hM'),
(234, 0, 6, 'credit2', '15.60', 7, 'ewei_shopv2', 0, 0, 0, 1517378079, '本人消费返佣 OPENID: sys_42706eeb709a965ea5e1eab9437fcec3'),
(235, 0, 6, 'credit2', '-90.00', 7, 'ewei_shopv2', 0, 0, 0, 1517389004, '储值消费扣款  OPENID: sys_8971dd461090fcd87edde9c6c302aebc'),
(236, 0, 6, 'credit2', '1.50', 7, 'ewei_shopv2', 0, 0, 0, 1517391528, '本人消费返佣 OPENID: sys_7fd1c996de1c118240849804553063a2'),
(237, 0, 6, 'credit1', '941.00', 7, 'ewei_shopv2', 0, 0, 0, 1517391699, '后台会员充值积分  OPENID: xcx_ozAoi0cWBdd3uOoKKxldkJ665Ko0'),
(238, 0, 6, 'credit2', '-941.00', 7, 'ewei_shopv2', 0, 0, 0, 1517391717, '后台会员充值余额  OPENID: xcx_ozAoi0cWBdd3uOoKKxldkJ665Ko0'),
(239, 0, 6, 'credit2', '-941.00', 7, 'ewei_shopv2', 0, 0, 0, 1517391748, '后台会员充值余额  OPENID: xcx_ozAoi0cWBdd3uOoKKxldkJ665Ko0'),
(240, 0, 6, 'credit2', '47.05', 7, 'ewei_shopv2', 0, 0, 0, 1517392373, '本人消费返佣 OPENID: xcx_ozAoi0cWBdd3uOoKKxldkJ665Ko0'),
(241, 0, 6, 'credit2', '-47.00', 7, 'ewei_shopv2', 0, 0, 0, 1517394375, '储值消费扣款  OPENID: xcx_ozAoi0cWBdd3uOoKKxldkJ665Ko0'),
(242, 0, 6, 'credit2', '3.40', 7, 'ewei_shopv2', 0, 0, 0, 1517394404, '本人消费返佣 OPENID: xcx_ozAoi0cWBdd3uOoKKxldkJ665Ko0'),
(243, 0, 6, 'credit2', '-50.00', 7, 'ewei_shopv2', 0, 0, 0, 1517396745, '储值消费扣款  OPENID: sys_9dd170694ea3e3e7364d8b933cdedc11'),
(244, 0, 6, 'credit2', '4.35', 7, 'ewei_shopv2', 0, 0, 0, 1517396772, '本人消费返佣 OPENID: sys_9dd170694ea3e3e7364d8b933cdedc11'),
(245, 0, 6, 'credit2', '-593.00', 7, 'ewei_shopv2', 0, 0, 0, 1517398285, '储值消费扣款  OPENID: sys_df167ef93967da9e2b7c3f81e1bcaa45'),
(246, 0, 6, 'credit2', '-44.00', 7, 'ewei_shopv2', 0, 0, 0, 1517398411, '储值消费扣款  OPENID: sys_8bba8a691291579b02535ec01bacbee6'),
(247, 0, 6, 'credit2', '20.15', 7, 'ewei_shopv2', 0, 0, 0, 1517398432, '本人消费返佣 OPENID: sys_8bba8a691291579b02535ec01bacbee6'),
(248, 0, 6, 'credit2', '18.25', 7, 'ewei_shopv2', 0, 0, 0, 1517399594, '本人消费返佣 OPENID: sys_1218093cffbe6c9c99495ff17104a3db'),
(249, 0, 6, 'credit2', '-58.00', 7, 'ewei_shopv2', 0, 0, 0, 1517404777, '储值消费扣款  OPENID: sys_936dacb2d050eca7db7efbf526f39f15'),
(250, 0, 6, 'credit2', '20.00', 7, 'ewei_shopv2', 0, 0, 0, 1517404822, '本人消费返佣 OPENID: sys_936dacb2d050eca7db7efbf526f39f15'),
(251, 0, 6, 'credit2', '4.00', 7, 'ewei_shopv2', 0, 0, 0, 1517460552, '本人消费返佣 OPENID: sys_dec4851c1bf1f9ccfa0d7289a00c8f3d'),
(252, 0, 6, 'credit2', '-242.00', 7, 'ewei_shopv2', 0, 0, 0, 1517461536, '储值消费扣款  OPENID: sys_280d9ce01f78309346cf6cc7003d53bf'),
(253, 0, 6, 'credit2', '14.40', 7, 'ewei_shopv2', 0, 0, 0, 1517461758, '本人消费返佣 OPENID: sys_389abbfae95ceaba33f2f655ea18f89e'),
(254, 0, 6, 'credit2', '10.60', 7, 'ewei_shopv2', 0, 0, 0, 1517463254, '本人消费返佣 OPENID: sys_547de599071c5770c4bbe994f2b0fac6'),
(255, 0, 6, 'credit2', '-683.00', 7, 'ewei_shopv2', 0, 0, 0, 1517463982, '储值消费扣款  OPENID: sys_9379e8ff592ef4a35b755c3241d459dc'),
(256, 0, 6, 'credit2', '-67.00', 7, 'ewei_shopv2', 0, 0, 0, 1517478956, '储值消费扣款  OPENID: sys_0d1dc67ad2ef68561e0d9a94104c0079'),
(257, 0, 6, 'credit2', '-19.00', 7, 'ewei_shopv2', 0, 0, 0, 1517485389, '储值消费扣款  OPENID: sys_687749503e1c1a1d97488bec30709f2c'),
(258, 0, 6, 'credit2', '16.95', 7, 'ewei_shopv2', 0, 0, 0, 1517485423, '本人消费返佣 OPENID: sys_687749503e1c1a1d97488bec30709f2c'),
(259, 0, 6, 'credit2', '-91.00', 7, 'ewei_shopv2', 0, 0, 0, 1517486450, '储值消费扣款  OPENID: sys_9379e8ff592ef4a35b755c3241d459dc'),
(260, 0, 6, 'credit2', '1.75', 7, 'ewei_shopv2', 0, 0, 0, 1517544061, '本人消费返佣 OPENID: sys_7fd1c996de1c118240849804553063a2'),
(261, 0, 6, 'credit2', '-232.00', 7, 'ewei_shopv2', 0, 0, 0, 1517546255, '储值消费扣款  OPENID: sys_49ac3af83649dcaaa995e7ddb077ddf4'),
(262, 0, 6, 'credit2', '-66.00', 7, 'ewei_shopv2', 0, 0, 0, 1517549191, '储值消费扣款  OPENID: sys_395ca315224c8c5341889bb98f981583'),
(263, 0, 6, 'credit2', '7.05', 7, 'ewei_shopv2', 0, 0, 0, 1517549233, '本人消费返佣 OPENID: sys_395ca315224c8c5341889bb98f981583'),
(264, 0, 6, 'credit2', '-67.00', 7, 'ewei_shopv2', 0, 0, 0, 1517564393, '储值消费扣款  OPENID: sys_4936df541adbe6d66aec5116fdb0c9f0'),
(265, 0, 6, 'credit2', '3.00', 7, 'ewei_shopv2', 0, 0, 0, 1517568759, '本人消费返佣 OPENID: sys_4e3cfdcb60b5b2600222a66173592ea0'),
(266, 0, 6, 'credit2', '-186.00', 7, 'ewei_shopv2', 0, 0, 0, 1517568866, '储值消费扣款  OPENID: sys_04da6d5f38ebcb978c1bd63c3e2b2c48'),
(267, 0, 6, 'credit2', '-7.00', 7, 'ewei_shopv2', 0, 0, 0, 1517574356, '储值消费扣款  OPENID: sys_9b5872f2e197fcb20c0cf96ebbc16c7a'),
(268, 0, 6, 'credit2', '-156.00', 7, 'ewei_shopv2', 0, 0, 0, 1517579892, '储值消费扣款  OPENID: sys_b3fe19c7f879e57ce54c2919e2719bb7'),
(269, 0, 6, 'credit2', '1500.00', 7, 'ewei_shopv2', 0, 0, 0, 1517579944, '会员充值余额  OPENID: sys_b3fe19c7f879e57ce54c2919e2719bb7'),
(270, 0, 6, 'credit2', '180.00', 0, 'ewei_shopv2', 0, 0, 0, 1517579944, '青岛海鲜锅贴充值满1500赠送180 OPENID: sys_b3fe19c7f879e57ce54c2919e2719bb7'),
(271, 0, 6, 'credit2', '-147.00', 7, 'ewei_shopv2', 0, 0, 0, 1517631650, '储值消费扣款  OPENID: sys_6f2f639bf83ac3d3c065d9551de69e7d'),
(272, 0, 6, 'credit2', '-10.00', 7, 'ewei_shopv2', 0, 0, 0, 1517632866, '储值消费扣款  OPENID: sys_9164a74e7aaa1395f60da17312b12778'),
(273, 0, 6, 'credit2', '-11.00', 7, 'ewei_shopv2', 0, 0, 0, 1517633415, '储值消费扣款  OPENID: sys_0abe282c5d1d0c7005e8b700773932a4'),
(274, 0, 6, 'credit2', '-10.00', 7, 'ewei_shopv2', 0, 0, 0, 1517634391, '储值消费扣款  OPENID: sys_e4875dd769bbca88288b8714f908d972'),
(275, 0, 6, 'credit2', '38.50', 7, 'ewei_shopv2', 0, 0, 0, 1517639594, '本人消费返佣 OPENID: sys_83d0126d1b75d3ab0d98eff4b5dc73ed'),
(276, 0, 6, 'credit2', '-34.00', 7, 'ewei_shopv2', 0, 0, 0, 1517654700, '储值消费扣款  OPENID: sys_3004c62023e7d829731cbdde657177c0'),
(277, 0, 6, 'credit2', '9.35', 7, 'ewei_shopv2', 0, 0, 0, 1517660086, '本人消费返佣 OPENID: sys_5c35283a4a8b9d21458c8badabdabecc'),
(278, 0, 6, 'credit2', '-25.00', 7, 'ewei_shopv2', 0, 0, 0, 1517660455, '储值消费扣款  OPENID: sys_d1109aa4b5b6155738c72766adbf908f'),
(279, 0, 6, 'credit2', '1500.00', 7, 'ewei_shopv2', 0, 0, 0, 1517716329, '会员充值余额  OPENID: sys_2c4f8bbfe09e1287d016861ddb8e714e'),
(280, 0, 6, 'credit2', '180.00', 0, 'ewei_shopv2', 0, 0, 0, 1517716329, '青岛海鲜锅贴充值满1500赠送180 OPENID: sys_2c4f8bbfe09e1287d016861ddb8e714e'),
(281, 0, 6, 'credit2', '-147.00', 7, 'ewei_shopv2', 0, 0, 0, 1517719531, '储值消费扣款  OPENID: sys_2c4f8bbfe09e1287d016861ddb8e714e'),
(282, 0, 6, 'credit2', '2000.00', 7, 'ewei_shopv2', 0, 0, 0, 1517721522, '后台会员充值余额  OPENID: sys_150d77e794d719240338d4c81d31e642'),
(283, 0, 6, 'credit2', '-37.00', 7, 'ewei_shopv2', 0, 0, 0, 1517723721, '储值消费扣款  OPENID: sys_f11ebff521764207c50c3beeda3e4813'),
(284, 0, 6, 'credit2', '-29.00', 7, 'ewei_shopv2', 0, 0, 0, 1517740860, '储值消费扣款  OPENID: sys_1c61d097ea29f9f5bc6d542f478ba9ef'),
(285, 0, 6, 'credit2', '6.20', 7, 'ewei_shopv2', 0, 0, 0, 1517744592, '本人消费返佣 OPENID: sys_defb1717b719fd91459ceb066028ac57'),
(286, 0, 6, 'credit2', '23.85', 7, 'ewei_shopv2', 0, 0, 0, 1517750789, '本人消费返佣 OPENID: sys_5cd00b70d206b236dbdd6fc69f4f31fa'),
(287, 0, 6, 'credit2', '-9.00', 7, 'ewei_shopv2', 0, 0, 0, 1517806293, '储值消费扣款  OPENID: sys_3205fa9e8e0f3882ca8361ce8c61530a'),
(288, 0, 6, 'credit2', '6.10', 7, 'ewei_shopv2', 0, 0, 0, 1517824689, '本人消费返佣 OPENID: sys_98a294e69841d41ed87e001909664e4f'),
(289, 0, 6, 'credit2', '13.20', 7, 'ewei_shopv2', 0, 0, 0, 1517831113, '本人消费返佣 OPENID: sys_a102fb69dabc438f017a5ff067b2270a'),
(290, 0, 6, 'credit2', '26.00', 7, 'ewei_shopv2', 0, 0, 0, 1517836382, '本人消费返佣 OPENID: sys_4f8501fc413b36cc7a779ec08939454e'),
(291, 0, 6, 'credit2', '-27.00', 8, 'ewei_shopv2', 0, 0, 0, 1517893840, '储值消费扣款  OPENID: sys_fa6d3146ced17027df52762b3dfa4689'),
(292, 0, 6, 'credit2', '-199.00', 7, 'ewei_shopv2', 0, 0, 0, 1517894356, '储值消费扣款  OPENID: sys_cc2ed5164ee345ba8709c31a6f6f97a5'),
(293, 0, 6, 'credit2', '-274.00', 7, 'ewei_shopv2', 0, 0, 0, 1517894745, '储值消费扣款  OPENID: sys_bd50d21b3672c8c767ed6ae1511e05f2'),
(294, 0, 6, 'credit2', '-550.00', 7, 'ewei_shopv2', 0, 0, 0, 1517901624, '储值消费扣款  OPENID: sys_86e4089f626c550eaf8ebd94f4e4fcca'),
(295, 0, 6, 'credit2', '31.80', 8, 'ewei_shopv2', 0, 0, 0, 1517914795, '本人消费返佣 OPENID: sys_0ef08ce48579049dfd0d49b57ee89a03'),
(296, 0, 6, 'credit2', '8.75', 7, 'ewei_shopv2', 0, 0, 0, 1517918380, '本人消费返佣 OPENID: sys_defb1717b719fd91459ceb066028ac57'),
(297, 0, 6, 'credit2', '-85.00', 7, 'ewei_shopv2', 0, 0, 0, 1517919721, '储值消费扣款  OPENID: sys_bd76d8009bd41de93af89081cd7d1b73'),
(298, 0, 6, 'credit2', '-169.00', 7, 'ewei_shopv2', 0, 0, 0, 1517975224, '储值消费扣款  OPENID: sys_0d269dd371ecf821ea49ac155a1c60d4'),
(299, 0, 6, 'credit2', '-177.00', 7, 'ewei_shopv2', 0, 0, 0, 1517978981, '储值消费扣款  OPENID: sys_b1748b2150305c0aad0b302089b8eb6c'),
(300, 0, 6, 'credit2', '-4.00', 7, 'ewei_shopv2', 0, 0, 0, 1517999395, '储值消费扣款  OPENID: sys_095c64c0464f90a6cd6de3440fe655e5'),
(301, 0, 6, 'credit2', '-127.00', 7, 'ewei_shopv2', 0, 0, 0, 1518000337, '储值消费扣款  OPENID: sys_d026950789541ec882cb88791fae1d2a'),
(302, 0, 6, 'credit2', '-36.00', 7, 'ewei_shopv2', 0, 0, 0, 1518002036, '储值消费扣款  OPENID: sys_336ebb671df82c64bb560fd02da2b4a1'),
(303, 0, 6, 'credit2', '-337.00', 8, 'ewei_shopv2', 0, 0, 0, 1518004865, '储值消费扣款  OPENID: sys_c913d5f42aaeee7ae002894661929c34'),
(304, 0, 6, 'credit2', '17.75', 7, 'ewei_shopv2', 0, 0, 0, 1518010881, '本人消费返佣 OPENID: sys_1e3fb8fc2df533893ba3e9fdcaa51164'),
(305, 0, 6, 'credit2', '-527.00', 7, 'ewei_shopv2', 0, 0, 0, 1518012756, '储值消费扣款  OPENID: sys_b261dcfd8e0816a8a6175e94ba67e54c'),
(306, 0, 6, 'credit2', '8.90', 7, 'ewei_shopv2', 0, 0, 0, 1518061582, '本人消费返佣 OPENID: sys_97a3b5001c94ef55dba9d719501e9d9d'),
(307, 0, 6, 'credit2', '-571.00', 7, 'ewei_shopv2', 0, 0, 0, 1518066000, '储值消费扣款  OPENID: sys_1d639f0dde45e7835855f30891be6fbd'),
(308, 0, 6, 'credit2', '-17.00', 7, 'ewei_shopv2', 0, 0, 0, 1518085474, '储值消费扣款  OPENID: sys_687749503e1c1a1d97488bec30709f2c'),
(309, 0, 6, 'credit2', '3.05', 7, 'ewei_shopv2', 0, 0, 0, 1518086505, '本人消费返佣 OPENID: sys_f7dcdf18ec8d245266bec16842f9b4d9'),
(310, 0, 6, 'credit2', '-81.00', 7, 'ewei_shopv2', 0, 0, 0, 1518086836, '储值消费扣款  OPENID: sys_4e7e7a41e681efdf94563daea5e40de0'),
(311, 0, 6, 'credit2', '9.95', 7, 'ewei_shopv2', 0, 0, 0, 1518089406, '本人消费返佣 OPENID: sys_463ff77dead8d0e1967c3731b0d9b127'),
(312, 0, 6, 'credit2', '15.95', 7, 'ewei_shopv2', 0, 0, 0, 1518091852, '本人消费返佣 OPENID: sys_ef1056e3a2a2698b0fce6a91a581ea3e'),
(313, 0, 6, 'credit2', '-17.00', 7, 'ewei_shopv2', 0, 0, 0, 1518095959, '储值消费扣款  OPENID: sys_580885171d8d3ff334e49fe87951583d'),
(314, 0, 6, 'credit2', '11.05', 7, 'ewei_shopv2', 0, 0, 0, 1518148257, '本人消费返佣 OPENID: sys_f50ca0ce71b22d65871c0957bc9d4f1d'),
(315, 0, 6, 'credit2', '-20.00', 7, 'ewei_shopv2', 0, 0, 0, 1518150703, '储值消费扣款  OPENID: sys_892a26e1b4e6b99ab19e39905a346a09'),
(316, 0, 6, 'credit2', '19.35', 7, 'ewei_shopv2', 0, 0, 0, 1518152065, '本人消费返佣 OPENID: sys_fb70f40ddd0a5febbd6440e21995d142'),
(317, 0, 6, 'credit2', '5.85', 7, 'ewei_shopv2', 0, 0, 0, 1518152113, '本人消费返佣 OPENID: sys_08e3c6fed32ed887a703098381272227'),
(318, 0, 6, 'credit2', '-1080.00', 7, 'ewei_shopv2', 0, 0, 0, 1518176953, '储值消费扣款  OPENID: sys_bd50d21b3672c8c767ed6ae1511e05f2'),
(319, 0, 6, 'credit2', '26.30', 7, 'ewei_shopv2', 0, 0, 0, 1518177754, '本人消费返佣 OPENID: sys_4251dacfc3d3f14d8535eca153ca4369'),
(320, 0, 6, 'credit2', '-389.00', 7, 'ewei_shopv2', 0, 0, 0, 1518178609, '储值消费扣款  OPENID: sys_08ecd0ab72c239e8647f948091303438'),
(321, 0, 6, 'credit2', '-277.00', 7, 'ewei_shopv2', 0, 0, 0, 1518182267, '储值消费扣款  OPENID: sys_0d1dc67ad2ef68561e0d9a94104c0079'),
(322, 0, 6, 'credit2', '-47.00', 7, 'ewei_shopv2', 0, 0, 0, 1518236198, '储值消费扣款  OPENID: sys_b21d39f39cb315d0dc56f7e75bed7b0d'),
(323, 0, 6, 'credit2', '-128.00', 7, 'ewei_shopv2', 0, 0, 0, 1518237414, '储值消费扣款  OPENID: sys_0eaea8c262510c22919ac4236488bc25'),
(324, 0, 6, 'credit2', '-35.00', 7, 'ewei_shopv2', 0, 0, 0, 1518238874, '储值消费扣款  OPENID: sys_31fbeedd6c6320a8958a609a89e891f8'),
(325, 0, 6, 'credit2', '8.80', 7, 'ewei_shopv2', 0, 0, 0, 1518240378, '本人消费返佣 OPENID: sys_defb1717b719fd91459ceb066028ac57'),
(326, 0, 6, 'credit2', '-14.00', 7, 'ewei_shopv2', 0, 0, 0, 1518240932, '储值消费扣款  OPENID: sys_4f70a42d0a3b1222ca8f02b8321454a4'),
(327, 0, 6, 'credit2', '7.10', 7, 'ewei_shopv2', 0, 0, 0, 1518240961, '本人消费返佣 OPENID: sys_4f70a42d0a3b1222ca8f02b8321454a4'),
(328, 0, 6, 'credit2', '9.00', 7, 'ewei_shopv2', 0, 0, 0, 1518258141, '本人消费返佣 OPENID: sys_687749503e1c1a1d97488bec30709f2c'),
(329, 0, 6, 'credit2', '-35.00', 7, 'ewei_shopv2', 0, 0, 0, 1518264335, '储值消费扣款  OPENID: sys_d16c62112caec56528f3f108faa093e6'),
(330, 0, 6, 'credit2', '14.75', 7, 'ewei_shopv2', 0, 0, 0, 1518264369, '本人消费返佣 OPENID: sys_d16c62112caec56528f3f108faa093e6'),
(331, 0, 6, 'credit2', '-2.00', 7, 'ewei_shopv2', 0, 0, 0, 1518320293, '储值消费扣款  OPENID: sys_22f456b853b287eefcfbedcae6d113fe'),
(332, 0, 6, 'credit2', '8.25', 7, 'ewei_shopv2', 0, 0, 0, 1518320336, '本人消费返佣 OPENID: sys_22f456b853b287eefcfbedcae6d113fe'),
(333, 0, 6, 'credit2', '-42.00', 7, 'ewei_shopv2', 0, 0, 0, 1518322740, '储值消费扣款  OPENID: sys_953e4d15d844fbbee125b0d9c529e252'),
(334, 0, 6, 'credit2', '2.50', 7, 'ewei_shopv2', 0, 0, 0, 1518322767, '本人消费返佣 OPENID: sys_953e4d15d844fbbee125b0d9c529e252'),
(335, 0, 6, 'credit2', '-17.00', 7, 'ewei_shopv2', 0, 0, 0, 1518350138, '储值消费扣款  OPENID: sys_3c0114bc8f59bf2812e1f11a7ea08df6'),
(336, 0, 6, 'credit2', '14.40', 7, 'ewei_shopv2', 0, 0, 0, 1518350206, '本人消费返佣 OPENID: sys_3c0114bc8f59bf2812e1f11a7ea08df6'),
(337, 0, 6, 'credit2', '-20.00', 7, 'ewei_shopv2', 0, 0, 0, 1518414099, '储值消费扣款  OPENID: sys_8bba8a691291579b02535ec01bacbee6'),
(338, 0, 6, 'credit2', '33.05', 7, 'ewei_shopv2', 0, 0, 0, 1518414146, '本人消费返佣 OPENID: sys_8bba8a691291579b02535ec01bacbee6'),
(339, 0, 6, 'credit2', '28.65', 7, 'ewei_shopv2', 0, 0, 0, 1518417797, '本人消费返佣 OPENID: sys_7591150d8b03fbea37624c5a8008738a'),
(340, 0, 6, 'credit2', '8.15', 7, 'ewei_shopv2', 0, 0, 0, 1518428963, '本人消费返佣 OPENID: sys_8ff9f6ac74c74f6b0e6d0c6866f5abb1'),
(341, 0, 6, 'credit2', '0.65', 7, 'ewei_shopv2', 0, 0, 0, 1518433636, '本人消费返佣 OPENID: sys_4e3cfdcb60b5b2600222a66173592ea0'),
(342, 0, 6, 'credit2', '-3.00', 7, 'ewei_shopv2', 0, 0, 0, 1518435175, '储值消费扣款  OPENID: sys_77ffb89074418bf00d3410dfded6220e'),
(343, 0, 6, 'credit2', '35.00', 7, 'ewei_shopv2', 0, 0, 0, 1518435346, '本人消费返佣 OPENID: sys_77ffb89074418bf00d3410dfded6220e'),
(344, 0, 6, 'credit2', '-252.00', 7, 'ewei_shopv2', 0, 0, 0, 1518438559, '储值消费扣款  OPENID: sys_173646e7a9ea960f7b587fb18ff22423'),
(345, 0, 6, 'credit2', '8.70', 7, 'ewei_shopv2', 0, 0, 0, 1518438584, '本人消费返佣 OPENID: sys_173646e7a9ea960f7b587fb18ff22423'),
(346, 0, 6, 'credit2', '20.05', 7, 'ewei_shopv2', 0, 0, 0, 1518439592, '本人消费返佣 OPENID: sys_8df24fdc466dd4f0fd3e852583f51437'),
(347, 0, 6, 'credit2', '-63.00', 7, 'ewei_shopv2', 0, 0, 0, 1518439628, '储值消费扣款  OPENID: sys_8df24fdc466dd4f0fd3e852583f51437'),
(348, 0, 6, 'credit2', '26.80', 7, 'ewei_shopv2', 0, 0, 0, 1518442022, '本人消费返佣 OPENID: sys_1218093cffbe6c9c99495ff17104a3db'),
(349, 0, 6, 'credit2', '10.95', 7, 'ewei_shopv2', 0, 0, 0, 1518443265, '本人消费返佣 OPENID: sys_d8508dbfa7fb2255cfc8fa009ed89444');

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_fans_groups`
--

CREATE TABLE IF NOT EXISTS `ims_mc_fans_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `groups` varchar(10000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_fans_tag_mapping`
--

CREATE TABLE IF NOT EXISTS `ims_mc_fans_tag_mapping` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fanid` int(11) unsigned NOT NULL,
  `tagid` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mapping` (`fanid`,`tagid`) USING BTREE,
  KEY `fanid_index` (`fanid`) USING BTREE,
  KEY `tagid_index` (`tagid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_groups`
--

CREATE TABLE IF NOT EXISTS `ims_mc_groups` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `credit` int(10) unsigned NOT NULL,
  `isdefault` tinyint(4) NOT NULL,
  PRIMARY KEY (`groupid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `ims_mc_groups`
--

INSERT INTO `ims_mc_groups` (`groupid`, `uniacid`, `title`, `credit`, `isdefault`) VALUES
(1, 1, '默认会员组', 0, 1),
(3, 3, '默认会员组', 0, 1),
(4, 4, '默认会员组', 0, 1),
(5, 5, '默认会员组', 0, 1),
(6, 6, '默认会员组', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_handsel`
--

CREATE TABLE IF NOT EXISTS `ims_mc_handsel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `touid` int(10) unsigned NOT NULL,
  `fromuid` varchar(32) NOT NULL,
  `module` varchar(30) NOT NULL,
  `sign` varchar(100) NOT NULL,
  `action` varchar(20) NOT NULL,
  `credit_value` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`touid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_mapping_fans`
--

CREATE TABLE IF NOT EXISTS `ims_mc_mapping_fans` (
  `fanid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `groupid` varchar(30) NOT NULL,
  `salt` char(8) NOT NULL,
  `follow` tinyint(1) unsigned NOT NULL,
  `followtime` int(10) unsigned NOT NULL,
  `unfollowtime` int(10) unsigned NOT NULL,
  `tag` varchar(1000) NOT NULL,
  `updatetime` int(10) unsigned DEFAULT NULL,
  `unionid` varchar(64) NOT NULL,
  PRIMARY KEY (`fanid`),
  UNIQUE KEY `openid` (`openid`),
  KEY `acid` (`acid`),
  KEY `uniacid` (`uniacid`),
  KEY `updatetime` (`updatetime`),
  KEY `nickname` (`nickname`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_mapping_ucenter`
--

CREATE TABLE IF NOT EXISTS `ims_mc_mapping_ucenter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `centeruid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_mass_record`
--

CREATE TABLE IF NOT EXISTS `ims_mc_mass_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `groupname` varchar(50) NOT NULL,
  `fansnum` int(10) unsigned NOT NULL,
  `msgtype` varchar(10) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `group` int(10) NOT NULL,
  `attach_id` int(10) unsigned NOT NULL,
  `media_id` varchar(100) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `cron_id` int(10) unsigned NOT NULL,
  `sendtime` int(10) unsigned NOT NULL,
  `finalsendtime` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_members`
--

CREATE TABLE IF NOT EXISTS `ims_mc_members` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `salt` varchar(8) NOT NULL,
  `groupid` int(11) NOT NULL,
  `credit1` decimal(10,2) unsigned NOT NULL,
  `credit2` decimal(10,2) unsigned NOT NULL,
  `credit3` decimal(10,2) unsigned NOT NULL,
  `credit4` decimal(10,2) unsigned NOT NULL,
  `credit5` decimal(10,2) unsigned NOT NULL,
  `credit6` decimal(10,2) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `realname` varchar(10) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `vip` tinyint(3) unsigned NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthyear` smallint(6) unsigned NOT NULL,
  `birthmonth` tinyint(3) unsigned NOT NULL,
  `birthday` tinyint(3) unsigned NOT NULL,
  `constellation` varchar(10) NOT NULL,
  `zodiac` varchar(5) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `idcard` varchar(30) NOT NULL,
  `studentid` varchar(50) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `nationality` varchar(30) NOT NULL,
  `resideprovince` varchar(30) NOT NULL,
  `residecity` varchar(30) NOT NULL,
  `residedist` varchar(30) NOT NULL,
  `graduateschool` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `education` varchar(10) NOT NULL,
  `occupation` varchar(30) NOT NULL,
  `position` varchar(30) NOT NULL,
  `revenue` varchar(10) NOT NULL,
  `affectivestatus` varchar(30) NOT NULL,
  `lookingfor` varchar(255) NOT NULL,
  `bloodtype` varchar(5) NOT NULL,
  `height` varchar(5) NOT NULL,
  `weight` varchar(5) NOT NULL,
  `alipay` varchar(30) NOT NULL,
  `msn` varchar(30) NOT NULL,
  `taobao` varchar(30) NOT NULL,
  `site` varchar(30) NOT NULL,
  `bio` text NOT NULL,
  `interest` text NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `groupid` (`groupid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_member_address`
--

CREATE TABLE IF NOT EXISTS `ims_mc_member_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(50) unsigned NOT NULL,
  `username` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `province` varchar(32) NOT NULL,
  `city` varchar(32) NOT NULL,
  `district` varchar(32) NOT NULL,
  `address` varchar(512) NOT NULL,
  `isdefault` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uinacid` (`uniacid`),
  KEY `idx_uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_member_fields`
--

CREATE TABLE IF NOT EXISTS `ims_mc_member_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `fieldid` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `displayorder` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_fieldid` (`fieldid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=181 ;

--
-- 转存表中的数据 `ims_mc_member_fields`
--

INSERT INTO `ims_mc_member_fields` (`id`, `uniacid`, `fieldid`, `title`, `available`, `displayorder`) VALUES
(37, 3, 1, '真实姓名', 1, 0),
(38, 3, 2, '昵称', 1, 1),
(39, 3, 3, '头像', 1, 1),
(40, 3, 4, 'QQ号', 1, 0),
(41, 3, 5, '手机号码', 1, 0),
(42, 3, 6, 'VIP级别', 1, 0),
(43, 3, 7, '性别', 1, 0),
(44, 3, 8, '出生生日', 1, 0),
(45, 3, 9, '星座', 1, 0),
(46, 3, 10, '生肖', 1, 0),
(47, 3, 11, '固定电话', 1, 0),
(48, 3, 12, '证件号码', 1, 0),
(49, 3, 13, '学号', 1, 0),
(50, 3, 14, '班级', 1, 0),
(51, 3, 15, '邮寄地址', 1, 0),
(52, 3, 16, '邮编', 1, 0),
(53, 3, 17, '国籍', 1, 0),
(54, 3, 18, '居住地址', 1, 0),
(55, 3, 19, '毕业学校', 1, 0),
(56, 3, 20, '公司', 1, 0),
(57, 3, 21, '学历', 1, 0),
(58, 3, 22, '职业', 1, 0),
(59, 3, 23, '职位', 1, 0),
(60, 3, 24, '年收入', 1, 0),
(61, 3, 25, '情感状态', 1, 0),
(62, 3, 26, ' 交友目的', 1, 0),
(63, 3, 27, '血型', 1, 0),
(64, 3, 28, '身高', 1, 0),
(65, 3, 29, '体重', 1, 0),
(66, 3, 30, '支付宝帐号', 1, 0),
(67, 3, 31, 'MSN', 1, 0),
(68, 3, 32, '电子邮箱', 1, 0),
(69, 3, 33, '阿里旺旺', 1, 0),
(70, 3, 34, '主页', 1, 0),
(71, 3, 35, '自我介绍', 1, 0),
(72, 3, 36, '兴趣爱好', 1, 0),
(73, 4, 1, '真实姓名', 1, 0),
(74, 4, 2, '昵称', 1, 1),
(75, 4, 3, '头像', 1, 1),
(76, 4, 4, 'QQ号', 1, 0),
(77, 4, 5, '手机号码', 1, 0),
(78, 4, 6, 'VIP级别', 1, 0),
(79, 4, 7, '性别', 1, 0),
(80, 4, 8, '出生生日', 1, 0),
(81, 4, 9, '星座', 1, 0),
(82, 4, 10, '生肖', 1, 0),
(83, 4, 11, '固定电话', 1, 0),
(84, 4, 12, '证件号码', 1, 0),
(85, 4, 13, '学号', 1, 0),
(86, 4, 14, '班级', 1, 0),
(87, 4, 15, '邮寄地址', 1, 0),
(88, 4, 16, '邮编', 1, 0),
(89, 4, 17, '国籍', 1, 0),
(90, 4, 18, '居住地址', 1, 0),
(91, 4, 19, '毕业学校', 1, 0),
(92, 4, 20, '公司', 1, 0),
(93, 4, 21, '学历', 1, 0),
(94, 4, 22, '职业', 1, 0),
(95, 4, 23, '职位', 1, 0),
(96, 4, 24, '年收入', 1, 0),
(97, 4, 25, '情感状态', 1, 0),
(98, 4, 26, ' 交友目的', 1, 0),
(99, 4, 27, '血型', 1, 0),
(100, 4, 28, '身高', 1, 0),
(101, 4, 29, '体重', 1, 0),
(102, 4, 30, '支付宝帐号', 1, 0),
(103, 4, 31, 'MSN', 1, 0),
(104, 4, 32, '电子邮箱', 1, 0),
(105, 4, 33, '阿里旺旺', 1, 0),
(106, 4, 34, '主页', 1, 0),
(107, 4, 35, '自我介绍', 1, 0),
(108, 4, 36, '兴趣爱好', 1, 0),
(109, 5, 1, '真实姓名', 1, 0),
(110, 5, 2, '昵称', 1, 1),
(111, 5, 3, '头像', 1, 1),
(112, 5, 4, 'QQ号', 1, 0),
(113, 5, 5, '手机号码', 1, 0),
(114, 5, 6, 'VIP级别', 1, 0),
(115, 5, 7, '性别', 1, 0),
(116, 5, 8, '出生生日', 1, 0),
(117, 5, 9, '星座', 1, 0),
(118, 5, 10, '生肖', 1, 0),
(119, 5, 11, '固定电话', 1, 0),
(120, 5, 12, '证件号码', 1, 0),
(121, 5, 13, '学号', 1, 0),
(122, 5, 14, '班级', 1, 0),
(123, 5, 15, '邮寄地址', 1, 0),
(124, 5, 16, '邮编', 1, 0),
(125, 5, 17, '国籍', 1, 0),
(126, 5, 18, '居住地址', 1, 0),
(127, 5, 19, '毕业学校', 1, 0),
(128, 5, 20, '公司', 1, 0),
(129, 5, 21, '学历', 1, 0),
(130, 5, 22, '职业', 1, 0),
(131, 5, 23, '职位', 1, 0),
(132, 5, 24, '年收入', 1, 0),
(133, 5, 25, '情感状态', 1, 0),
(134, 5, 26, ' 交友目的', 1, 0),
(135, 5, 27, '血型', 1, 0),
(136, 5, 28, '身高', 1, 0),
(137, 5, 29, '体重', 1, 0),
(138, 5, 30, '支付宝帐号', 1, 0),
(139, 5, 31, 'MSN', 1, 0),
(140, 5, 32, '电子邮箱', 1, 0),
(141, 5, 33, '阿里旺旺', 1, 0),
(142, 5, 34, '主页', 1, 0),
(143, 5, 35, '自我介绍', 1, 0),
(144, 5, 36, '兴趣爱好', 1, 0),
(145, 6, 1, '真实姓名', 1, 0),
(146, 6, 2, '昵称', 1, 1),
(147, 6, 3, '头像', 1, 1),
(148, 6, 4, 'QQ号', 1, 0),
(149, 6, 5, '手机号码', 1, 0),
(150, 6, 6, 'VIP级别', 1, 0),
(151, 6, 7, '性别', 1, 0),
(152, 6, 8, '出生生日', 1, 0),
(153, 6, 9, '星座', 1, 0),
(154, 6, 10, '生肖', 1, 0),
(155, 6, 11, '固定电话', 1, 0),
(156, 6, 12, '证件号码', 1, 0),
(157, 6, 13, '学号', 1, 0),
(158, 6, 14, '班级', 1, 0),
(159, 6, 15, '邮寄地址', 1, 0),
(160, 6, 16, '邮编', 1, 0),
(161, 6, 17, '国籍', 1, 0),
(162, 6, 18, '居住地址', 1, 0),
(163, 6, 19, '毕业学校', 1, 0),
(164, 6, 20, '公司', 1, 0),
(165, 6, 21, '学历', 1, 0),
(166, 6, 22, '职业', 1, 0),
(167, 6, 23, '职位', 1, 0),
(168, 6, 24, '年收入', 1, 0),
(169, 6, 25, '情感状态', 1, 0),
(170, 6, 26, ' 交友目的', 1, 0),
(171, 6, 27, '血型', 1, 0),
(172, 6, 28, '身高', 1, 0),
(173, 6, 29, '体重', 1, 0),
(174, 6, 30, '支付宝帐号', 1, 0),
(175, 6, 31, 'MSN', 1, 0),
(176, 6, 32, '电子邮箱', 1, 0),
(177, 6, 33, '阿里旺旺', 1, 0),
(178, 6, 34, '主页', 1, 0),
(179, 6, 35, '自我介绍', 1, 0),
(180, 6, 36, '兴趣爱好', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_oauth_fans`
--

CREATE TABLE IF NOT EXISTS `ims_mc_oauth_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oauth_openid` varchar(50) NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_oauthopenid_acid` (`oauth_openid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_menu_event`
--

CREATE TABLE IF NOT EXISTS `ims_menu_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `keyword` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `picmd5` varchar(32) NOT NULL,
  `openid` varchar(128) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `picmd5` (`picmd5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mobilenumber`
--

CREATE TABLE IF NOT EXISTS `ims_mobilenumber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  `dateline` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules`
--

CREATE TABLE IF NOT EXISTS `ims_modules` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `version` varchar(10) NOT NULL,
  `ability` varchar(500) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `author` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `settings` tinyint(1) NOT NULL,
  `subscribes` varchar(500) NOT NULL,
  `handles` varchar(500) NOT NULL,
  `isrulefields` tinyint(1) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL,
  `target` int(10) unsigned NOT NULL,
  `iscard` tinyint(3) unsigned NOT NULL,
  `permissions` varchar(5000) NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `idx_name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `ims_modules`
--

INSERT INTO `ims_modules` (`mid`, `name`, `type`, `title`, `version`, `ability`, `description`, `author`, `url`, `settings`, `subscribes`, `handles`, `isrulefields`, `issystem`, `target`, `iscard`, `permissions`) VALUES
(1, 'basic', 'system', '基本文字回复', '1.0', '和您进行简单对话', '一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的回复内容.', 'WeEngine Team', 'https://www.yyzn.co', 0, '', '', 1, 1, 0, 0, ''),
(2, 'news', 'system', '基本混合图文回复', '1.0', '为你提供生动的图文资讯', '一问一答得简单对话, 但是回复内容包括图片文字等更生动的媒体内容. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的图文回复内容.', 'WeEngine Team', 'https://www.yyzn.co', 0, '', '', 1, 1, 0, 0, ''),
(3, 'music', 'system', '基本音乐回复', '1.0', '提供语音、音乐等音频类回复', '在回复规则中可选择具有语音、音乐等音频类的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝，实现一问一答得简单对话。', 'WeEngine Team', 'https://www.yyzn.co', 0, '', '', 1, 1, 0, 0, ''),
(4, 'userapi', 'system', '自定义接口回复', '1.1', '更方便的第三方接口设置', '自定义接口又称第三方接口，可以让开发者更方便的接入微擎系统，高效的与微信公众平台进行对接整合。', 'WeEngine Team', 'https://www.yyzn.co', 0, '', '', 1, 1, 0, 0, ''),
(5, 'recharge', 'system', '会员中心充值模块', '1.0', '提供会员充值功能', '', 'WeEngine Team', 'https://www.yyzn.co', 0, '', '', 0, 1, 0, 0, ''),
(6, 'custom', 'system', '多客服转接', '1.0.0', '用来接入腾讯的多客服系统', '', 'WeEngine Team', 'https://www.yyzn.co', 0, 'a:0:{}', 'a:6:{i:0;s:5:"image";i:1;s:5:"voice";i:2;s:5:"video";i:3;s:8:"location";i:4;s:4:"link";i:5;s:4:"text";}', 1, 1, 0, 0, ''),
(7, 'images', 'system', '基本图片回复', '1.0', '提供图片回复', '在回复规则中可选择具有图片的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝图片。', 'WeEngine Team', 'https://www.yyzn.co', 0, '', '', 1, 1, 0, 0, ''),
(8, 'video', 'system', '基本视频回复', '1.0', '提供图片回复', '在回复规则中可选择具有视频的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝视频。', 'WeEngine Team', 'https://www.yyzn.co', 0, '', '', 1, 1, 0, 0, ''),
(9, 'voice', 'system', '基本语音回复', '1.0', '提供语音回复', '在回复规则中可选择具有语音的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝语音。', 'WeEngine Team', 'https://www.yyzn.co', 0, '', '', 1, 1, 0, 0, ''),
(10, 'chats', 'system', '发送客服消息', '1.0', '公众号可以在粉丝最后发送消息的48小时内无限制发送消息', '', 'WeEngine Team', 'https://www.yyzn.co', 0, '', '', 0, 1, 0, 0, ''),
(11, 'wxcard', 'system', '微信卡券回复', '1.0', '微信卡券回复', '微信卡券回复', 'WeEngine Team', 'https://www.yyzn.co', 0, '', '', 1, 1, 0, 0, ''),
(12, 'paycenter', 'system', '收银台', '1.0', '收银台', '收银台', 'WeEngine Team', 'https://www.yyzn.co', 0, '', '', 1, 1, 0, 0, ''),
(15, 'ewei_shopv2', 'business', '羽月weshop', '2.10.3', '羽月weshop(分销),多用户分权，淘宝商品一键转换，多种插件支持。', '羽月weshop(分销)，多项信息模板，强大的自定义规格设置', '羽月智能科技', 'https://www.yyzn.co', 0, 'a:14:{i:0;s:4:"text";i:1;s:5:"image";i:2;s:5:"voice";i:3;s:5:"video";i:4;s:10:"shortvideo";i:5;s:8:"location";i:6;s:4:"link";i:7;s:9:"subscribe";i:8;s:11:"unsubscribe";i:9;s:2:"qr";i:10;s:5:"trace";i:11;s:5:"click";i:12;s:4:"view";i:13;s:14:"merchant_order";}', 'a:12:{i:0;s:4:"text";i:1;s:5:"image";i:2;s:5:"voice";i:3;s:5:"video";i:4;s:10:"shortvideo";i:5;s:8:"location";i:6;s:4:"link";i:7;s:9:"subscribe";i:8;s:2:"qr";i:9;s:5:"trace";i:10;s:5:"click";i:11;s:14:"merchant_order";}', 0, 0, 0, 0, 'a:0:{}');

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules_bindings`
--

CREATE TABLE IF NOT EXISTS `ims_modules_bindings` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(30) NOT NULL,
  `entry` varchar(10) NOT NULL,
  `call` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `do` varchar(30) NOT NULL,
  `state` varchar(200) NOT NULL,
  `direct` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `displayorder` tinyint(255) unsigned NOT NULL,
  PRIMARY KEY (`eid`),
  KEY `idx_module` (`module`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `ims_modules_bindings`
--

INSERT INTO `ims_modules_bindings` (`eid`, `module`, `entry`, `call`, `title`, `do`, `state`, `direct`, `url`, `icon`, `displayorder`) VALUES
(9, 'ewei_shopv2', 'menu', '', '在线更新', 'download', '', 0, '', '', 0),
(8, 'ewei_shopv2', 'menu', '', '商城管理', 'shop', '', 0, '', '', 0),
(7, 'ewei_shopv2', 'cover', '', '商城入口', 'shop', '', 0, '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules_recycle`
--

CREATE TABLE IF NOT EXISTS `ims_modules_recycle` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `modulename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `modulename` (`modulename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_music_reply`
--

CREATE TABLE IF NOT EXISTS `ims_music_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `url` varchar(300) NOT NULL,
  `hqurl` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_news_reply`
--

CREATE TABLE IF NOT EXISTS `ims_news_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `parent_id` int(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `url` varchar(255) NOT NULL,
  `displayorder` int(10) NOT NULL,
  `incontent` tinyint(1) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_paycenter_order`
--

CREATE TABLE IF NOT EXISTS `ims_paycenter_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL,
  `uniontid` varchar(40) NOT NULL,
  `transaction_id` varchar(40) NOT NULL,
  `type` varchar(10) NOT NULL,
  `trade_type` varchar(10) NOT NULL,
  `body` varchar(255) NOT NULL,
  `fee` varchar(15) NOT NULL,
  `final_fee` decimal(10,2) unsigned NOT NULL,
  `credit1` int(10) unsigned NOT NULL,
  `credit1_fee` decimal(10,2) unsigned NOT NULL,
  `credit2` decimal(10,2) unsigned NOT NULL,
  `cash` decimal(10,2) unsigned NOT NULL,
  `remark` varchar(255) NOT NULL,
  `auth_code` varchar(30) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `follow` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `credit_status` tinyint(3) unsigned NOT NULL,
  `paytime` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_profile_fields`
--

CREATE TABLE IF NOT EXISTS `ims_profile_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `displayorder` smallint(6) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `unchangeable` tinyint(1) NOT NULL,
  `showinregister` tinyint(1) NOT NULL,
  `field_length` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- 转存表中的数据 `ims_profile_fields`
--

INSERT INTO `ims_profile_fields` (`id`, `field`, `available`, `title`, `description`, `displayorder`, `required`, `unchangeable`, `showinregister`, `field_length`) VALUES
(1, 'realname', 1, '真实姓名', '', 0, 1, 1, 1, 0),
(2, 'nickname', 1, '昵称', '', 1, 1, 0, 1, 0),
(3, 'avatar', 1, '头像', '', 1, 0, 0, 0, 0),
(4, 'qq', 1, 'QQ号', '', 0, 0, 0, 1, 0),
(5, 'mobile', 1, '手机号码', '', 0, 0, 0, 0, 0),
(6, 'vip', 1, 'VIP级别', '', 0, 0, 0, 0, 0),
(7, 'gender', 1, '性别', '', 0, 0, 0, 0, 0),
(8, 'birthyear', 1, '出生生日', '', 0, 0, 0, 0, 0),
(9, 'constellation', 1, '星座', '', 0, 0, 0, 0, 0),
(10, 'zodiac', 1, '生肖', '', 0, 0, 0, 0, 0),
(11, 'telephone', 1, '固定电话', '', 0, 0, 0, 0, 0),
(12, 'idcard', 1, '证件号码', '', 0, 0, 0, 0, 0),
(13, 'studentid', 1, '学号', '', 0, 0, 0, 0, 0),
(14, 'grade', 1, '班级', '', 0, 0, 0, 0, 0),
(15, 'address', 1, '邮寄地址', '', 0, 0, 0, 0, 0),
(16, 'zipcode', 1, '邮编', '', 0, 0, 0, 0, 0),
(17, 'nationality', 1, '国籍', '', 0, 0, 0, 0, 0),
(18, 'resideprovince', 1, '居住地址', '', 0, 0, 0, 0, 0),
(19, 'graduateschool', 1, '毕业学校', '', 0, 0, 0, 0, 0),
(20, 'company', 1, '公司', '', 0, 0, 0, 0, 0),
(21, 'education', 1, '学历', '', 0, 0, 0, 0, 0),
(22, 'occupation', 1, '职业', '', 0, 0, 0, 0, 0),
(23, 'position', 1, '职位', '', 0, 0, 0, 0, 0),
(24, 'revenue', 1, '年收入', '', 0, 0, 0, 0, 0),
(25, 'affectivestatus', 1, '情感状态', '', 0, 0, 0, 0, 0),
(26, 'lookingfor', 1, ' 交友目的', '', 0, 0, 0, 0, 0),
(27, 'bloodtype', 1, '血型', '', 0, 0, 0, 0, 0),
(28, 'height', 1, '身高', '', 0, 0, 0, 0, 0),
(29, 'weight', 1, '体重', '', 0, 0, 0, 0, 0),
(30, 'alipay', 1, '支付宝帐号', '', 0, 0, 0, 0, 0),
(31, 'msn', 1, 'MSN', '', 0, 0, 0, 0, 0),
(32, 'email', 1, '电子邮箱', '', 0, 0, 0, 0, 0),
(33, 'taobao', 1, '阿里旺旺', '', 0, 0, 0, 0, 0),
(34, 'site', 1, '主页', '', 0, 0, 0, 0, 0),
(35, 'bio', 1, '自我介绍', '', 0, 0, 0, 0, 0),
(36, 'interest', 1, '兴趣爱好', '', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_qrcode`
--

CREATE TABLE IF NOT EXISTS `ims_qrcode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `extra` int(10) unsigned NOT NULL,
  `qrcid` bigint(20) NOT NULL,
  `scene_str` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  `model` tinyint(1) unsigned NOT NULL,
  `ticket` varchar(250) NOT NULL,
  `url` varchar(256) NOT NULL,
  `expire` int(10) unsigned NOT NULL,
  `subnum` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_qrcid` (`qrcid`),
  KEY `uniacid` (`uniacid`),
  KEY `ticket` (`ticket`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_qrcode_stat`
--

CREATE TABLE IF NOT EXISTS `ims_qrcode_stat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `qid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `qrcid` bigint(20) unsigned NOT NULL,
  `scene_str` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_rule`
--

CREATE TABLE IF NOT EXISTS `ims_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `displayorder` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `ims_rule`
--

INSERT INTO `ims_rule` (`id`, `uniacid`, `name`, `module`, `displayorder`, `status`) VALUES
(1, 0, '城市天气', 'userapi', 255, 1),
(2, 0, '百度百科', 'userapi', 255, 1),
(3, 0, '即时翻译', 'userapi', 255, 1),
(4, 0, '今日老黄历', 'userapi', 255, 1),
(5, 0, '看新闻', 'userapi', 255, 1),
(6, 0, '快递查询', 'userapi', 255, 1),
(7, 1, '个人中心入口设置', 'cover', 0, 1),
(8, 1, '微擎团队入口设置', 'cover', 0, 1),
(9, 1, 'ewei_shopv2文章营销入口设置', 'cover', 0, 1),
(10, 1, 'ewei_shopv2签到入口设置', 'cover', 0, 1),
(11, 1, 'ewei_shopv2:poster:4', 'ewei_shopv2', 0, 1),
(12, 1, 'ewei_shopv2:poster:auto', 'ewei_shopv2', 0, 1),
(13, 6, 'ewei_shopv2:poster:4', 'ewei_shopv2', 0, 1),
(14, 6, 'ewei_shopv2:poster:auto', 'ewei_shopv2', 0, 1),
(15, 1, 'ewei_shopv2:article:15', 'ewei_shopv2', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_rule_keyword`
--

CREATE TABLE IF NOT EXISTS `ims_rule_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `content` varchar(255) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_content` (`content`),
  KEY `idx_rid` (`rid`),
  KEY `idx_uniacid_type_content` (`uniacid`,`type`,`content`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `ims_rule_keyword`
--

INSERT INTO `ims_rule_keyword` (`id`, `rid`, `uniacid`, `module`, `content`, `type`, `displayorder`, `status`) VALUES
(1, 1, 0, 'userapi', '^.+天气$', 3, 255, 1),
(2, 2, 0, 'userapi', '^百科.+$', 3, 255, 1),
(3, 2, 0, 'userapi', '^定义.+$', 3, 255, 1),
(4, 3, 0, 'userapi', '^@.+$', 3, 255, 1),
(5, 4, 0, 'userapi', '日历', 1, 255, 1),
(6, 4, 0, 'userapi', '万年历', 1, 255, 1),
(7, 4, 0, 'userapi', '黄历', 1, 255, 1),
(8, 4, 0, 'userapi', '几号', 1, 255, 1),
(9, 5, 0, 'userapi', '新闻', 1, 255, 1),
(10, 6, 0, 'userapi', '^(申通|圆通|中通|汇通|韵达|顺丰|EMS) *[a-z0-9]{1,}$', 3, 255, 1),
(11, 7, 1, 'cover', '个人中心', 1, 0, 1),
(12, 8, 1, 'cover', '首页', 1, 0, 1),
(13, 9, 1, 'cover', '1', 1, 0, 1),
(14, 10, 1, 'cover', '签到入口', 1, 0, 1),
(15, 11, 1, 'ewei_shopv2', '二维码', 1, 0, 1),
(16, 12, 1, 'ewei_shopv2', 'EWEI_SHOPV2_POSTER', 1, 0, 1),
(17, 13, 6, 'ewei_shopv2', '推广海报', 1, 0, 1),
(18, 14, 6, 'ewei_shopv2', 'EWEI_SHOPV2_POSTER', 1, 0, 1),
(19, 15, 1, 'ewei_shopv2', '赚积分', 1, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_article`
--

CREATE TABLE IF NOT EXISTS `ims_site_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `kid` int(10) unsigned NOT NULL,
  `iscommend` tinyint(1) NOT NULL,
  `ishot` tinyint(1) unsigned NOT NULL,
  `pcate` int(10) unsigned NOT NULL,
  `ccate` int(10) unsigned NOT NULL,
  `template` varchar(300) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `incontent` tinyint(1) NOT NULL,
  `source` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL,
  `displayorder` int(10) unsigned NOT NULL,
  `linkurl` varchar(500) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `credit` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_iscommend` (`iscommend`),
  KEY `idx_ishot` (`ishot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_category`
--

CREATE TABLE IF NOT EXISTS `ims_site_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `nid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `parentid` int(10) unsigned NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  `icon` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `linkurl` varchar(500) NOT NULL,
  `ishomepage` tinyint(1) NOT NULL,
  `icontype` tinyint(1) unsigned NOT NULL,
  `css` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_multi`
--

CREATE TABLE IF NOT EXISTS `ims_site_multi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `site_info` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `bindhost` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `bindhost` (`bindhost`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `ims_site_multi`
--

INSERT INTO `ims_site_multi` (`id`, `uniacid`, `title`, `styleid`, `site_info`, `status`, `bindhost`) VALUES
(1, 1, '羽月智能科技', 1, '', 1, ''),
(3, 3, '羽月智能科技测试版', 3, '', 0, ''),
(4, 4, '多店铺', 4, '', 0, ''),
(5, 5, '青岛海鲜锅贴', 5, '', 0, ''),
(6, 6, '青岛海鲜锅贴', 6, '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_nav`
--

CREATE TABLE IF NOT EXISTS `ims_site_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `section` tinyint(4) NOT NULL,
  `module` varchar(50) NOT NULL,
  `displayorder` smallint(5) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `position` tinyint(4) NOT NULL,
  `url` varchar(255) NOT NULL,
  `icon` varchar(500) NOT NULL,
  `css` varchar(1000) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `categoryid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `multiid` (`multiid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_page`
--

CREATE TABLE IF NOT EXISTS `ims_site_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `params` longtext NOT NULL,
  `html` longtext NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `goodnum` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `multiid` (`multiid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ims_site_page`
--

INSERT INTO `ims_site_page` (`id`, `uniacid`, `multiid`, `title`, `description`, `params`, `html`, `type`, `status`, `createtime`, `goodnum`) VALUES
(1, 1, 0, '快捷菜单', '', '{"navStyle":"2","bgColor":"#f4f4f4","menus":[{"title":"\\u4f1a\\u5458\\u5361","url":".\\/index.php?c=mc&a=bond&do=card&i=1","submenus":[],"icon":{"name":"fa fa-credit-card","color":"#969696"},"image":"","hoverimage":"","hovericon":[]},{"title":"\\u5151\\u6362","url":".\\/index.php?c=activity&a=coupon&do=display&&i=1","submenus":[],"icon":{"name":"fa fa-money","color":"#969696"},"image":"","hoverimage":"","hovericon":[]},{"title":"\\u4ed8\\u6b3e","url":"\\" data-target=\\"#scan\\" data-toggle=\\"modal\\" href=\\"javascript:void();","submenus":[],"icon":{"name":"fa fa-qrcode","color":"#969696"},"image":"","hoverimage":"","hovericon":""},{"title":"\\u4e2a\\u4eba\\u4e2d\\u5fc3","url":".\\/index.php?i=1&c=mc&","submenus":[],"icon":{"name":"fa fa-user","color":"#969696"},"image":"","hoverimage":"","hovericon":[]}],"extend":[],"position":{"homepage":true,"usercenter":true,"page":true,"article":true},"ignoreModules":[]}', '<div style="background-color: rgb(244, 244, 244);" class="js-quickmenu nav-menu-app has-nav-0  has-nav-4"   ><ul class="nav-group clearfix"><li class="nav-group-item " ><a href="./index.php?c=mc&a=bond&do=card&i=1" style="background-position: center 2px;" ><i style="color: rgb(150, 150, 150);"  class="fa fa-credit-card"  js-onclass-name="" js-onclass-color="" ></i><span style="color: rgb(150, 150, 150);" class=""  js-onclass-color="">会员卡</span></a></li><li class="nav-group-item " ><a href="./index.php?c=activity&a=coupon&do=display&&i=1" style="background-position: center 2px;" ><i style="color: rgb(150, 150, 150);"  class="fa fa-money"  js-onclass-name="" js-onclass-color="" ></i><span style="color: rgb(150, 150, 150);" class=""  js-onclass-color="">兑换</span></a></li><li class="nav-group-item " ><a href="" data-target="#scan" data-toggle="modal" href="javascript:void();" style="background-position: center 2px;" ><i style="color: rgb(150, 150, 150);"  class="fa fa-qrcode"  js-onclass-name="" js-onclass-color="" ></i><span style="color: rgb(150, 150, 150);" class=""  js-onclass-color="">付款</span></a></li><li class="nav-group-item " ><a href="./index.php?i=1&c=mc&" style="background-position: center 2px;" ><i style="color: rgb(150, 150, 150);"  class="fa fa-user"  js-onclass-name="" js-onclass-color="" ></i><span style="color: rgb(150, 150, 150);" class=""  js-onclass-color="">个人中心</span></a></li></ul></div>', 4, 1, 1440242655, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_slide`
--

CREATE TABLE IF NOT EXISTS `ims_site_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `displayorder` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `multiid` (`multiid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_styles`
--

CREATE TABLE IF NOT EXISTS `ims_site_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `templateid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `ims_site_styles`
--

INSERT INTO `ims_site_styles` (`id`, `uniacid`, `templateid`, `name`) VALUES
(1, 1, 1, '微站默认模板_gC5C'),
(3, 3, 1, '微站默认模板_s3G4'),
(4, 4, 1, '微站默认模板_s2D8'),
(5, 5, 1, '微站默认模板_rkP2'),
(6, 6, 1, '微站默认模板_JYWJ');

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_styles_vars`
--

CREATE TABLE IF NOT EXISTS `ims_site_styles_vars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `templateid` int(10) unsigned NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `variable` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_templates`
--

CREATE TABLE IF NOT EXISTS `ims_site_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `version` varchar(64) NOT NULL,
  `description` varchar(500) NOT NULL,
  `author` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `sections` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ims_site_templates`
--

INSERT INTO `ims_site_templates` (`id`, `name`, `title`, `version`, `description`, `author`, `url`, `type`, `sections`) VALUES
(1, 'default', '微站默认模板', '', '由微擎提供默认微站模板套系', '微擎团队', 'http://we7.cc', '1', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_stat_fans`
--

CREATE TABLE IF NOT EXISTS `ims_stat_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `new` int(10) unsigned NOT NULL,
  `cancel` int(10) unsigned NOT NULL,
  `cumulate` int(10) NOT NULL,
  `date` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`date`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=468 ;

--
-- 转存表中的数据 `ims_stat_fans`
--

INSERT INTO `ims_stat_fans` (`id`, `uniacid`, `new`, `cancel`, `cumulate`, `date`) VALUES
(1, 1, 0, 0, 0, '20160715'),
(2, 1, 0, 0, 0, '20160714'),
(3, 1, 0, 0, 0, '20160713'),
(4, 1, 0, 0, 0, '20160712'),
(5, 1, 0, 0, 0, '20160711'),
(6, 1, 0, 0, 0, '20160710'),
(7, 1, 0, 0, 0, '20160709'),
(8, 1, 0, 0, 0, '20160813'),
(9, 1, 0, 0, 0, '20160812'),
(10, 1, 0, 0, 0, '20160811'),
(11, 1, 0, 0, 0, '20160810'),
(12, 1, 0, 0, 0, '20160809'),
(13, 1, 0, 0, 0, '20160808'),
(14, 1, 0, 0, 0, '20160807'),
(15, 1, 0, 0, 0, '20160819'),
(16, 1, 0, 0, 0, '20160818'),
(17, 1, 0, 0, 0, '20160817'),
(18, 1, 0, 0, 0, '20160816'),
(19, 1, 0, 0, 0, '20160815'),
(20, 1, 0, 0, 0, '20160814'),
(21, 1, 0, 0, 0, '20160829'),
(22, 1, 0, 0, 0, '20160828'),
(23, 1, 0, 0, 0, '20160827'),
(24, 1, 0, 0, 0, '20160826'),
(25, 1, 0, 0, 0, '20160825'),
(26, 1, 0, 0, 0, '20160824'),
(27, 1, 0, 0, 0, '20160823'),
(28, 1, 0, 0, 0, '20160903'),
(29, 1, 0, 0, 0, '20160902'),
(30, 1, 0, 0, 0, '20160901'),
(31, 1, 0, 0, 0, '20160831'),
(32, 1, 0, 0, 0, '20160830'),
(33, 1, 0, 0, 0, '20160911'),
(34, 1, 0, 0, 0, '20160910'),
(35, 1, 0, 0, 0, '20160909'),
(36, 1, 0, 0, 0, '20160908'),
(37, 1, 0, 0, 0, '20160907'),
(38, 1, 0, 0, 0, '20160906'),
(39, 1, 0, 0, 0, '20160905'),
(40, 1, 0, 0, 0, '20160912'),
(41, 1, 0, 0, 0, '20160918'),
(42, 1, 0, 0, 0, '20160917'),
(43, 1, 0, 0, 0, '20160916'),
(44, 1, 0, 0, 0, '20160915'),
(45, 1, 0, 0, 0, '20160914'),
(46, 1, 0, 0, 0, '20160913'),
(47, 1, 0, 0, 0, '20160919'),
(48, 1, 0, 0, 0, '20161004'),
(49, 1, 0, 0, 0, '20161003'),
(50, 1, 0, 0, 0, '20161002'),
(51, 1, 0, 0, 0, '20161001'),
(52, 1, 0, 0, 0, '20160930'),
(53, 1, 0, 0, 0, '20160929'),
(54, 1, 0, 0, 0, '20160928'),
(55, 1, 0, 0, 0, '20161011'),
(56, 1, 0, 0, 0, '20161010'),
(57, 1, 0, 0, 0, '20161009'),
(58, 1, 0, 0, 0, '20161008'),
(59, 1, 0, 0, 0, '20161007'),
(60, 1, 0, 0, 0, '20161006'),
(61, 1, 0, 0, 0, '20161005'),
(62, 1, 0, 0, 0, '20161019'),
(63, 1, 0, 0, 0, '20161018'),
(64, 1, 0, 0, 0, '20161017'),
(65, 1, 0, 0, 0, '20161016'),
(66, 1, 0, 0, 0, '20161015'),
(67, 1, 0, 0, 0, '20161014'),
(68, 1, 0, 0, 0, '20161013'),
(69, 1, 0, 0, 0, '20161026'),
(70, 1, 0, 0, 0, '20161025'),
(71, 1, 0, 0, 0, '20161024'),
(72, 1, 0, 0, 0, '20161023'),
(73, 1, 0, 0, 0, '20161022'),
(74, 1, 0, 0, 0, '20161021'),
(75, 1, 0, 0, 0, '20161020'),
(76, 1, 0, 0, 0, '20161102'),
(77, 1, 0, 0, 0, '20161101'),
(78, 1, 0, 0, 0, '20161031'),
(79, 1, 0, 0, 0, '20161030'),
(80, 1, 0, 0, 0, '20161029'),
(81, 1, 0, 0, 0, '20161028'),
(82, 1, 0, 0, 0, '20161027'),
(83, 1, 0, 0, 0, '20161112'),
(84, 1, 0, 0, 0, '20161111'),
(85, 1, 0, 0, 0, '20161110'),
(86, 1, 0, 0, 0, '20161109'),
(87, 1, 0, 0, 0, '20161108'),
(88, 1, 0, 0, 0, '20161107'),
(89, 1, 0, 0, 0, '20161106'),
(90, 1, 0, 0, 0, '20161122'),
(91, 1, 0, 0, 0, '20161121'),
(92, 1, 0, 0, 0, '20161120'),
(93, 1, 0, 0, 0, '20161119'),
(94, 1, 0, 0, 0, '20161118'),
(95, 1, 0, 0, 0, '20161117'),
(96, 1, 0, 0, 0, '20161116'),
(97, 1, 0, 0, 0, '20161207'),
(98, 1, 0, 0, 0, '20161206'),
(99, 1, 0, 0, 0, '20161205'),
(100, 1, 0, 0, 0, '20161204'),
(101, 1, 0, 0, 0, '20161203'),
(102, 1, 0, 0, 0, '20161202'),
(103, 1, 0, 0, 0, '20161201'),
(104, 1, 0, 0, 0, '20161208'),
(105, 1, 0, 0, 0, '20161225'),
(106, 1, 0, 0, 0, '20161224'),
(107, 1, 0, 0, 0, '20161223'),
(108, 1, 0, 0, 0, '20161222'),
(109, 1, 0, 0, 0, '20161221'),
(110, 1, 0, 0, 0, '20161220'),
(111, 1, 0, 0, 0, '20161219'),
(112, 1, 0, 0, 0, '20170108'),
(113, 1, 0, 0, 0, '20170107'),
(114, 1, 0, 0, 0, '20170106'),
(115, 1, 0, 0, 0, '20170105'),
(116, 1, 0, 0, 0, '20170104'),
(117, 1, 0, 0, 0, '20170103'),
(118, 1, 0, 0, 0, '20170102'),
(119, 1, 0, 0, 0, '20170110'),
(120, 1, 0, 0, 0, '20170109'),
(121, 1, 0, 0, 0, '20170209'),
(122, 1, 0, 0, 0, '20170208'),
(123, 1, 0, 0, 0, '20170207'),
(124, 1, 0, 0, 0, '20170206'),
(125, 1, 0, 0, 0, '20170205'),
(126, 1, 0, 0, 0, '20170204'),
(127, 1, 0, 0, 0, '20170203'),
(128, 1, 0, 0, 0, '20170213'),
(129, 1, 0, 0, 0, '20170212'),
(130, 1, 0, 0, 0, '20170211'),
(131, 1, 0, 0, 0, '20170210'),
(132, 1, 0, 0, 0, '20170214'),
(133, 1, 0, 0, 0, '20170220'),
(134, 1, 0, 0, 0, '20170219'),
(135, 1, 0, 0, 0, '20170218'),
(136, 1, 0, 0, 0, '20170217'),
(137, 1, 0, 0, 0, '20170216'),
(138, 1, 0, 0, 0, '20170215'),
(139, 1, 0, 0, 0, '20170221'),
(140, 1, 0, 0, 0, '20170309'),
(141, 1, 0, 0, 0, '20170308'),
(142, 1, 0, 0, 0, '20170307'),
(143, 1, 0, 0, 0, '20170306'),
(144, 1, 0, 0, 0, '20170305'),
(145, 1, 0, 0, 0, '20170304'),
(146, 1, 0, 0, 0, '20170303'),
(147, 1, 0, 0, 0, '20170314'),
(148, 1, 0, 0, 0, '20170313'),
(149, 1, 0, 0, 0, '20170312'),
(150, 1, 0, 0, 0, '20170311'),
(151, 1, 0, 0, 0, '20170310'),
(152, 1, 0, 0, 0, '20170319'),
(153, 1, 0, 0, 0, '20170318'),
(154, 1, 0, 0, 0, '20170317'),
(155, 1, 0, 0, 0, '20170316'),
(156, 1, 0, 0, 0, '20170315'),
(157, 1, 0, 0, 0, '20170320'),
(158, 1, 0, 0, 0, '20170328'),
(159, 1, 0, 0, 0, '20170327'),
(160, 1, 0, 0, 0, '20170326'),
(161, 1, 0, 0, 0, '20170325'),
(162, 1, 0, 0, 0, '20170324'),
(163, 1, 0, 0, 0, '20170323'),
(164, 1, 0, 0, 0, '20170322'),
(165, 1, 0, 0, 0, '20170329'),
(166, 1, 0, 0, 0, '20170330'),
(167, 1, 0, 0, 0, '20170331'),
(168, 1, 0, 0, 0, '20170407'),
(169, 1, 0, 0, 0, '20170406'),
(170, 1, 0, 0, 0, '20170405'),
(171, 1, 0, 0, 0, '20170404'),
(172, 1, 0, 0, 0, '20170403'),
(173, 1, 0, 0, 0, '20170402'),
(174, 1, 0, 0, 0, '20170401'),
(175, 1, 0, 0, 0, '20170414'),
(176, 1, 0, 0, 0, '20170413'),
(177, 1, 0, 0, 0, '20170412'),
(178, 1, 0, 0, 0, '20170411'),
(179, 1, 0, 0, 0, '20170410'),
(180, 1, 0, 0, 0, '20170409'),
(181, 1, 0, 0, 0, '20170408'),
(182, 1, 0, 0, 0, '20170420'),
(183, 1, 0, 0, 0, '20170419'),
(184, 1, 0, 0, 0, '20170418'),
(185, 1, 0, 0, 0, '20170417'),
(186, 1, 0, 0, 0, '20170416'),
(187, 1, 0, 0, 0, '20170415'),
(188, 1, 0, 0, 0, '20170421'),
(189, 1, 0, 0, 0, '20170510'),
(190, 1, 0, 0, 0, '20170509'),
(191, 1, 0, 0, 0, '20170508'),
(192, 1, 0, 0, 0, '20170507'),
(193, 1, 0, 0, 0, '20170506'),
(194, 1, 0, 0, 0, '20170505'),
(195, 1, 0, 0, 0, '20170504'),
(196, 1, 0, 0, 0, '20170523'),
(197, 1, 0, 0, 0, '20170522'),
(198, 1, 0, 0, 0, '20170521'),
(199, 1, 0, 0, 0, '20170520'),
(200, 1, 0, 0, 0, '20170519'),
(201, 1, 0, 0, 0, '20170518'),
(202, 1, 0, 0, 0, '20170517'),
(203, 1, 0, 0, 0, '20170709'),
(204, 1, 0, 0, 0, '20170708'),
(205, 1, 0, 0, 0, '20170707'),
(206, 1, 0, 0, 0, '20170706'),
(207, 1, 0, 0, 0, '20170705'),
(208, 1, 0, 0, 0, '20170704'),
(209, 1, 0, 0, 0, '20170703'),
(210, 1, 0, 0, 0, '20170724'),
(211, 1, 0, 0, 0, '20170723'),
(212, 1, 0, 0, 0, '20170722'),
(213, 1, 0, 0, 0, '20170721'),
(214, 1, 0, 0, 0, '20170720'),
(215, 1, 0, 0, 0, '20170719'),
(216, 1, 0, 0, 0, '20170718'),
(217, 1, 0, 0, 0, '20170802'),
(218, 1, 0, 0, 0, '20170801'),
(219, 1, 0, 0, 0, '20170731'),
(220, 1, 0, 0, 0, '20170730'),
(221, 1, 0, 0, 0, '20170729'),
(222, 1, 0, 0, 0, '20170728'),
(223, 1, 0, 0, 0, '20170727'),
(224, 1, 0, 0, 0, '20170810'),
(225, 1, 0, 0, 0, '20170809'),
(226, 1, 0, 0, 0, '20170808'),
(227, 1, 0, 0, 0, '20170807'),
(228, 1, 0, 0, 0, '20170806'),
(229, 1, 0, 0, 0, '20170805'),
(230, 1, 0, 0, 0, '20170804'),
(231, 1, 0, 0, 0, '20170811'),
(232, 1, 0, 0, 0, '20170814'),
(233, 1, 0, 0, 0, '20170813'),
(234, 1, 0, 0, 0, '20170812'),
(235, 1, 0, 0, 0, '20170818'),
(236, 1, 0, 0, 0, '20170817'),
(237, 1, 0, 0, 0, '20170816'),
(238, 1, 0, 0, 0, '20170815'),
(239, 1, 0, 0, 0, '20170824'),
(240, 1, 0, 0, 0, '20170823'),
(241, 1, 0, 0, 0, '20170822'),
(242, 1, 0, 0, 0, '20170821'),
(243, 1, 0, 0, 0, '20170820'),
(244, 1, 0, 0, 0, '20170819'),
(245, 1, 0, 0, 0, '20170828'),
(246, 1, 0, 0, 0, '20170827'),
(247, 1, 0, 0, 0, '20170826'),
(248, 1, 0, 0, 0, '20170825'),
(249, 1, 0, 0, 0, '20170829'),
(250, 1, 0, 0, 0, '20170830'),
(251, 1, 0, 0, 0, '20170831'),
(252, 1, 0, 0, 0, '20170902'),
(253, 1, 0, 0, 0, '20170901'),
(254, 1, 0, 0, 0, '20170903'),
(255, 1, 0, 0, 0, '20170910'),
(256, 1, 0, 0, 0, '20170909'),
(257, 1, 0, 0, 0, '20170908'),
(258, 1, 0, 0, 0, '20170907'),
(259, 1, 0, 0, 0, '20170906'),
(260, 1, 0, 0, 0, '20170905'),
(261, 1, 0, 0, 0, '20170904'),
(262, 1, 0, 0, 0, '20170912'),
(263, 1, 0, 0, 0, '20170911'),
(264, 1, 0, 0, 0, '20170913'),
(265, 1, 0, 0, 0, '20170914'),
(266, 1, 0, 0, 0, '20170915'),
(267, 1, 0, 0, 0, '20170916'),
(268, 1, 0, 0, 0, '20170918'),
(269, 1, 0, 0, 0, '20170917'),
(270, 1, 0, 0, 0, '20170919'),
(271, 1, 0, 0, 0, '20170920'),
(272, 3, 0, 0, 0, '20170922'),
(273, 3, 0, 0, 0, '20170921'),
(274, 3, 0, 0, 0, '20170920'),
(275, 3, 0, 0, 0, '20170919'),
(276, 3, 0, 0, 0, '20170918'),
(277, 3, 0, 0, 0, '20170917'),
(278, 3, 0, 0, 0, '20170916'),
(279, 1, 0, 0, 0, '20170922'),
(280, 1, 0, 0, 0, '20170921'),
(281, 1, 0, 0, 0, '20170923'),
(282, 1, 0, 0, 0, '20170925'),
(283, 1, 0, 0, 0, '20170924'),
(284, 1, 0, 0, 0, '20170927'),
(285, 1, 0, 0, 0, '20170926'),
(286, 1, 0, 0, 0, '20170928'),
(287, 1, 0, 0, 0, '20171006'),
(288, 1, 0, 0, 0, '20171005'),
(289, 1, 0, 0, 0, '20171004'),
(290, 1, 0, 0, 0, '20171003'),
(291, 1, 0, 0, 0, '20171002'),
(292, 1, 0, 0, 0, '20171001'),
(293, 1, 0, 0, 0, '20170930'),
(294, 1, 0, 0, 0, '20171009'),
(295, 1, 0, 0, 0, '20171008'),
(296, 1, 0, 0, 0, '20171007'),
(297, 1, 0, 0, 0, '20171019'),
(298, 1, 0, 0, 0, '20171018'),
(299, 1, 0, 0, 0, '20171017'),
(300, 1, 0, 0, 0, '20171016'),
(301, 1, 0, 0, 0, '20171015'),
(302, 1, 0, 0, 0, '20171014'),
(303, 1, 0, 0, 0, '20171013'),
(304, 1, 0, 0, 0, '20171020'),
(305, 1, 0, 0, 0, '20171026'),
(306, 1, 0, 0, 0, '20171025'),
(307, 1, 0, 0, 0, '20171024'),
(308, 1, 0, 0, 0, '20171023'),
(309, 1, 0, 0, 0, '20171022'),
(310, 1, 0, 0, 0, '20171021'),
(311, 1, 0, 0, 0, '20171027'),
(312, 1, 0, 0, 0, '20171031'),
(313, 1, 0, 0, 0, '20171030'),
(314, 1, 0, 0, 0, '20171029'),
(315, 1, 0, 0, 0, '20171028'),
(316, 1, 0, 0, 0, '20171105'),
(317, 1, 0, 0, 0, '20171104'),
(318, 1, 0, 0, 0, '20171103'),
(319, 1, 0, 0, 0, '20171102'),
(320, 1, 0, 0, 0, '20171101'),
(321, 1, 0, 0, 0, '20171106'),
(322, 4, 0, 0, 0, '20171108'),
(323, 4, 0, 0, 0, '20171107'),
(324, 4, 0, 0, 0, '20171106'),
(325, 4, 0, 0, 0, '20171105'),
(326, 4, 0, 0, 0, '20171104'),
(327, 4, 0, 0, 0, '20171103'),
(328, 4, 0, 0, 0, '20171102'),
(329, 4, 0, 0, 0, '20171112'),
(330, 4, 0, 0, 0, '20171111'),
(331, 4, 0, 0, 0, '20171110'),
(332, 4, 0, 0, 0, '20171109'),
(333, 1, 0, 0, 0, '20171112'),
(334, 1, 0, 0, 0, '20171111'),
(335, 1, 0, 0, 0, '20171110'),
(336, 1, 0, 0, 0, '20171109'),
(337, 1, 0, 0, 0, '20171108'),
(338, 1, 0, 0, 0, '20171107'),
(339, 6, 0, 0, 0, '20171114'),
(340, 6, 0, 0, 0, '20171113'),
(341, 6, 0, 0, 0, '20171112'),
(342, 6, 0, 0, 0, '20171111'),
(343, 6, 0, 0, 0, '20171110'),
(344, 6, 0, 0, 0, '20171109'),
(345, 6, 0, 0, 0, '20171108'),
(346, 6, 0, 0, 0, '20171117'),
(347, 6, 0, 0, 0, '20171116'),
(348, 6, 0, 0, 0, '20171115'),
(349, 6, 0, 0, 0, '20171119'),
(350, 6, 0, 0, 0, '20171118'),
(351, 1, 0, 0, 0, '20171119'),
(352, 1, 0, 0, 0, '20171118'),
(353, 1, 0, 0, 0, '20171117'),
(354, 1, 0, 0, 0, '20171116'),
(355, 1, 0, 0, 0, '20171115'),
(356, 1, 0, 0, 0, '20171114'),
(357, 1, 0, 0, 0, '20171113'),
(358, 6, 0, 0, 0, '20171121'),
(359, 6, 0, 0, 0, '20171120'),
(360, 6, 0, 0, 0, '20171123'),
(361, 6, 0, 0, 0, '20171122'),
(362, 1, 0, 0, 0, '20171124'),
(363, 1, 0, 0, 0, '20171123'),
(364, 1, 0, 0, 0, '20171122'),
(365, 1, 0, 0, 0, '20171121'),
(366, 1, 0, 0, 0, '20171120'),
(367, 6, 0, 0, 0, '20171124'),
(368, 1, 0, 0, 0, '20171129'),
(369, 1, 0, 0, 0, '20171128'),
(370, 1, 0, 0, 0, '20171127'),
(371, 1, 0, 0, 0, '20171126'),
(372, 1, 0, 0, 0, '20171125'),
(373, 1, 0, 0, 0, '20171130'),
(374, 6, 0, 0, 0, '20171130'),
(375, 6, 0, 0, 0, '20171129'),
(376, 6, 0, 0, 0, '20171128'),
(377, 6, 0, 0, 0, '20171127'),
(378, 6, 0, 0, 0, '20171126'),
(379, 6, 0, 0, 0, '20171125'),
(380, 1, 0, 0, 0, '20171218'),
(381, 1, 0, 0, 0, '20171217'),
(382, 1, 0, 0, 0, '20171216'),
(383, 1, 0, 0, 0, '20171215'),
(384, 1, 0, 0, 0, '20171214'),
(385, 1, 0, 0, 0, '20171213'),
(386, 1, 0, 0, 0, '20171212'),
(387, 6, 0, 0, 0, '20171219'),
(388, 6, 0, 0, 0, '20171218'),
(389, 6, 0, 0, 0, '20171217'),
(390, 6, 0, 0, 0, '20171216'),
(391, 6, 0, 0, 0, '20171215'),
(392, 6, 0, 0, 0, '20171214'),
(393, 6, 0, 0, 0, '20171213'),
(394, 6, 0, 0, 0, '20171220'),
(395, 6, 0, 0, 0, '20171221'),
(396, 6, 0, 0, 0, '20171227'),
(397, 6, 0, 0, 0, '20171226'),
(398, 6, 0, 0, 0, '20171225'),
(399, 6, 0, 0, 0, '20171224'),
(400, 6, 0, 0, 0, '20171223'),
(401, 6, 0, 0, 0, '20171222'),
(402, 6, 0, 0, 0, '20171231'),
(403, 6, 0, 0, 0, '20171230'),
(404, 6, 0, 0, 0, '20171229'),
(405, 6, 0, 0, 0, '20171228'),
(406, 6, 0, 0, 0, '20180101'),
(407, 6, 0, 0, 0, '20180103'),
(408, 6, 0, 0, 0, '20180102'),
(409, 6, 0, 0, 0, '20180104'),
(410, 6, 0, 0, 0, '20180107'),
(411, 6, 0, 0, 0, '20180106'),
(412, 6, 0, 0, 0, '20180105'),
(413, 6, 0, 0, 0, '20180108'),
(414, 1, 0, 0, 0, '20180110'),
(415, 1, 0, 0, 0, '20180109'),
(416, 1, 0, 0, 0, '20180108'),
(417, 1, 0, 0, 0, '20180107'),
(418, 1, 0, 0, 0, '20180106'),
(419, 1, 0, 0, 0, '20180105'),
(420, 1, 0, 0, 0, '20180104'),
(421, 1, 0, 0, 0, '20180111'),
(422, 6, 0, 0, 0, '20180111'),
(423, 6, 0, 0, 0, '20180110'),
(424, 6, 0, 0, 0, '20180109'),
(425, 1, 0, 0, 0, '20180113'),
(426, 1, 0, 0, 0, '20180112'),
(427, 6, 0, 0, 0, '20180113'),
(428, 6, 0, 0, 0, '20180112'),
(429, 6, 0, 0, 0, '20180114'),
(430, 1, 0, 0, 0, '20180114'),
(431, 6, 0, 0, 0, '20180115'),
(432, 1, 0, 0, 0, '20180115'),
(433, 6, 0, 0, 0, '20180116'),
(434, 6, 0, 0, 0, '20180117'),
(435, 6, 0, 0, 0, '20180118'),
(436, 6, 0, 0, 0, '20180119'),
(437, 6, 0, 0, 0, '20180120'),
(438, 6, 0, 0, 0, '20180121'),
(439, 6, 0, 0, 0, '20180122'),
(440, 6, 0, 0, 0, '20180123'),
(441, 6, 0, 0, 0, '20180124'),
(442, 6, 0, 0, 0, '20180125'),
(443, 6, 0, 0, 0, '20180126'),
(444, 6, 0, 0, 0, '20180128'),
(445, 6, 0, 0, 0, '20180127'),
(446, 6, 0, 0, 0, '20180129'),
(447, 6, 0, 0, 0, '20180130'),
(448, 6, 0, 0, 0, '20180131'),
(449, 6, 0, 0, 0, '20180201'),
(450, 6, 0, 0, 0, '20180202'),
(451, 6, 0, 0, 0, '20180203'),
(452, 6, 0, 0, 0, '20180204'),
(453, 6, 0, 0, 0, '20180205'),
(454, 6, 0, 0, 0, '20180206'),
(455, 6, 0, 0, 0, '20180207'),
(456, 6, 0, 0, 0, '20180208'),
(457, 6, 0, 0, 0, '20180209'),
(458, 1, 0, 0, 0, '20180209'),
(459, 1, 0, 0, 0, '20180208'),
(460, 1, 0, 0, 0, '20180207'),
(461, 1, 0, 0, 0, '20180206'),
(462, 1, 0, 0, 0, '20180205'),
(463, 1, 0, 0, 0, '20180204'),
(464, 1, 0, 0, 0, '20180203'),
(465, 6, 0, 0, 0, '20180210'),
(466, 1, 0, 0, 0, '20180210'),
(467, 6, 0, 0, 0, '20180211');

-- --------------------------------------------------------

--
-- 表的结构 `ims_stat_keyword`
--

CREATE TABLE IF NOT EXISTS `ims_stat_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` varchar(10) NOT NULL,
  `kid` int(10) unsigned NOT NULL,
  `hit` int(10) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_stat_msg_history`
--

CREATE TABLE IF NOT EXISTS `ims_stat_msg_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `kid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `type` varchar(10) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_stat_rule`
--

CREATE TABLE IF NOT EXISTS `ims_stat_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `hit` int(10) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_createtime` (`createtime`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_account`
--

CREATE TABLE IF NOT EXISTS `ims_uni_account` (
  `uniacid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `default_acid` int(10) unsigned NOT NULL,
  `rank` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `ims_uni_account`
--

INSERT INTO `ims_uni_account` (`uniacid`, `groupid`, `name`, `description`, `default_acid`, `rank`) VALUES
(1, 0, '画个我', '一个朝气蓬勃的团队', 1, 5),
(3, 0, '羽月智能科技测试版', '', 3, NULL),
(4, 0, '多店铺', '', 4, NULL),
(5, 0, '青岛海鲜锅贴', '', 5, NULL),
(6, 0, '青岛海鲜锅贴', '', 6, 4);

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_account_group`
--

CREATE TABLE IF NOT EXISTS `ims_uni_account_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `groupid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ims_uni_account_group`
--

INSERT INTO `ims_uni_account_group` (`id`, `uniacid`, `groupid`) VALUES
(1, 3, -1),
(2, 6, -1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_account_menus`
--

CREATE TABLE IF NOT EXISTS `ims_uni_account_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `menuid` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `sex` tinyint(3) unsigned NOT NULL,
  `group_id` int(10) NOT NULL,
  `client_platform_type` tinyint(3) unsigned NOT NULL,
  `area` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `isdeleted` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `menuid` (`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_account_modules`
--

CREATE TABLE IF NOT EXISTS `ims_uni_account_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  `settings` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_module` (`module`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `ims_uni_account_modules`
--

INSERT INTO `ims_uni_account_modules` (`id`, `uniacid`, `module`, `enabled`, `settings`) VALUES
(1, 1, 'basic', 1, ''),
(2, 1, 'news', 1, ''),
(3, 1, 'music', 1, ''),
(4, 1, 'userapi', 1, ''),
(5, 1, 'recharge', 1, ''),
(8, 1, 'ewei_shopv2', 1, ''),
(10, 3, 'ewei_shopv2', 1, ''),
(11, 4, 'ewei_shopv2', 1, ''),
(12, 5, 'ewei_shopv2', 1, ''),
(13, 6, 'ewei_shopv2', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_account_users`
--

CREATE TABLE IF NOT EXISTS `ims_uni_account_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `role` varchar(255) NOT NULL,
  `rank` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_memberid` (`uid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `ims_uni_account_users`
--

INSERT INTO `ims_uni_account_users` (`id`, `uniacid`, `uid`, `role`, `rank`) VALUES
(1, 4, 2, 'owner', 5),
(2, 4, 3, 'operator', 0),
(4, 6, 4, 'owner', 5),
(5, 6, 6, 'operator', 0),
(6, 6, 7, 'operator', 0),
(7, 6, 8, 'operator', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_group`
--

CREATE TABLE IF NOT EXISTS `ims_uni_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `modules` varchar(15000) NOT NULL,
  `templates` varchar(5000) NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ims_uni_group`
--

INSERT INTO `ims_uni_group` (`id`, `name`, `modules`, `templates`, `uniacid`) VALUES
(1, '体验套餐服务', 'a:1:{i:0;s:11:"ewei_shopv2";}', 'N;', 0),
(2, '', 'a:1:{i:0;s:11:"ewei_shopv2";}', 'N;', 6);

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_settings`
--

CREATE TABLE IF NOT EXISTS `ims_uni_settings` (
  `uniacid` int(10) unsigned NOT NULL,
  `passport` varchar(200) NOT NULL,
  `oauth` varchar(100) NOT NULL,
  `jsauth_acid` int(10) unsigned NOT NULL,
  `uc` varchar(500) NOT NULL,
  `notify` varchar(2000) NOT NULL,
  `creditnames` varchar(500) NOT NULL,
  `creditbehaviors` varchar(500) NOT NULL,
  `welcome` varchar(60) NOT NULL,
  `default` varchar(60) NOT NULL,
  `default_message` varchar(2000) NOT NULL,
  `shortcuts` varchar(5000) NOT NULL,
  `payment` varchar(2000) NOT NULL,
  `stat` varchar(300) NOT NULL,
  `default_site` int(10) unsigned DEFAULT NULL,
  `sync` tinyint(3) unsigned NOT NULL,
  `recharge` varchar(500) NOT NULL,
  `tplnotice` varchar(1000) NOT NULL,
  `grouplevel` tinyint(3) unsigned NOT NULL,
  `mcplugin` varchar(500) NOT NULL,
  `exchange_enable` tinyint(3) unsigned NOT NULL,
  `coupon_type` tinyint(3) unsigned NOT NULL,
  `menuset` text NOT NULL,
  PRIMARY KEY (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_uni_settings`
--

INSERT INTO `ims_uni_settings` (`uniacid`, `passport`, `oauth`, `jsauth_acid`, `uc`, `notify`, `creditnames`, `creditbehaviors`, `welcome`, `default`, `default_message`, `shortcuts`, `payment`, `stat`, `default_site`, `sync`, `recharge`, `tplnotice`, `grouplevel`, `mcplugin`, `exchange_enable`, `coupon_type`, `menuset`) VALUES
(1, 'a:3:{s:8:"focusreg";i:0;s:4:"item";s:5:"email";s:4:"type";s:8:"password";}', 'a:2:{s:7:"account";i:1;s:4:"host";N;}', 0, 'a:1:{s:6:"status";i:0;}', 'a:1:{s:3:"sms";a:2:{s:7:"balance";i:0;s:9:"signature";s:0:"";}}', 'a:5:{s:7:"credit1";a:2:{s:5:"title";s:6:"积分";s:7:"enabled";i:1;}s:7:"credit2";a:2:{s:5:"title";s:6:"余额";s:7:"enabled";i:1;}s:7:"credit3";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}s:7:"credit4";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}s:7:"credit5";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}}', 'a:2:{s:8:"activity";s:7:"credit1";s:8:"currency";s:7:"credit2";}', '', '', '', 'a:1:{s:11:"ewei_shopv2";a:2:{s:4:"name";s:11:"ewei_shopv2";s:4:"link";s:49:"./index.php?c=home&a=welcome&do=ext&m=ewei_shopv2";}}', 'a:7:{s:6:"credit";a:1:{s:6:"switch";b:0;}s:6:"alipay";a:4:{s:6:"switch";b:1;s:7:"account";s:3:"fef";s:7:"partner";s:3:"wef";s:6:"secret";s:4:"fwef";}s:6:"wechat";a:10:{s:6:"switch";b:0;s:7:"account";s:1:"1";s:7:"signkey";s:32:"JzpAUlxGX4w4yGhkUA9Uaw4RXgOFhz0x";s:7:"partner";s:0:"";s:3:"key";s:0:"";s:7:"version";s:1:"2";s:5:"mchid";s:0:"";s:6:"apikey";s:32:"JzpAUlxGX4w4yGhkUA9Uaw4RXgOFhz0x";s:6:"borrow";s:1:"0";s:10:"sub_mch_id";s:0:"";}s:8:"delivery";a:1:{s:6:"switch";b:0;}s:8:"unionpay";a:3:{s:6:"switch";b:0;s:11:"signcertpwd";s:0:"";s:5:"merid";s:0:"";}s:8:"baifubao";a:3:{s:6:"switch";b:0;s:7:"signkey";s:0:"";s:5:"mchid";s:0:"";}s:4:"line";a:2:{s:6:"switch";b:1;s:7:"message";s:0:"";}}', '', 1, 0, '', '', 0, '', 0, 0, ''),
(3, '', '', 0, '', '', 'a:2:{s:7:"credit1";a:2:{s:5:"title";s:6:"积分";s:7:"enabled";i:1;}s:7:"credit2";a:2:{s:5:"title";s:6:"余额";s:7:"enabled";i:1;}}', 'a:2:{s:8:"activity";s:7:"credit1";s:8:"currency";s:7:"credit2";}', '', '', '', 'a:1:{s:11:"ewei_shopv2";a:2:{s:4:"name";s:11:"ewei_shopv2";s:4:"link";s:49:"./index.php?c=home&a=welcome&do=ext&m=ewei_shopv2";}}', '', '', 3, 0, '', '', 0, '', 0, 0, ''),
(4, '', '', 0, '', '', 'a:2:{s:7:"credit1";a:2:{s:5:"title";s:6:"积分";s:7:"enabled";i:1;}s:7:"credit2";a:2:{s:5:"title";s:6:"余额";s:7:"enabled";i:1;}}', 'a:2:{s:8:"activity";s:7:"credit1";s:8:"currency";s:7:"credit2";}', '', '', '', 'a:1:{s:11:"ewei_shopv2";a:2:{s:4:"name";s:11:"ewei_shopv2";s:4:"link";s:49:"./index.php?c=home&a=welcome&do=ext&m=ewei_shopv2";}}', '', '', 4, 0, '', '', 0, '', 0, 0, ''),
(5, '', '', 0, '', '', 'a:2:{s:7:"credit1";a:2:{s:5:"title";s:6:"积分";s:7:"enabled";i:1;}s:7:"credit2";a:2:{s:5:"title";s:6:"余额";s:7:"enabled";i:1;}}', 'a:2:{s:8:"activity";s:7:"credit1";s:8:"currency";s:7:"credit2";}', '', '', '', '', '', '', 5, 0, '', '', 0, '', 0, 0, ''),
(6, '', '', 0, '', '', 'a:2:{s:7:"credit1";a:2:{s:5:"title";s:6:"积分";s:7:"enabled";i:1;}s:7:"credit2";a:2:{s:5:"title";s:6:"余额";s:7:"enabled";i:1;}}', 'a:2:{s:8:"activity";s:7:"credit1";s:8:"currency";s:7:"credit2";}', '', '', '', 'a:1:{s:11:"ewei_shopv2";a:2:{s:4:"name";s:11:"ewei_shopv2";s:4:"link";s:49:"./index.php?c=home&a=welcome&do=ext&m=ewei_shopv2";}}', '', '', 6, 0, '', '', 0, '', 0, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_verifycode`
--

CREATE TABLE IF NOT EXISTS `ims_uni_verifycode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `receiver` varchar(50) NOT NULL,
  `verifycode` varchar(6) NOT NULL,
  `total` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_userapi_cache`
--

CREATE TABLE IF NOT EXISTS `ims_userapi_cache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(32) NOT NULL,
  `content` text NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_userapi_reply`
--

CREATE TABLE IF NOT EXISTS `ims_userapi_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `description` varchar(300) NOT NULL,
  `apiurl` varchar(300) NOT NULL,
  `token` varchar(32) NOT NULL,
  `default_text` varchar(100) NOT NULL,
  `cachetime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `ims_userapi_reply`
--

INSERT INTO `ims_userapi_reply` (`id`, `rid`, `description`, `apiurl`, `token`, `default_text`, `cachetime`) VALUES
(1, 1, '"城市名+天气", 如: "北京天气"', 'weather.php', '', '', 0),
(2, 2, '"百科+查询内容" 或 "定义+查询内容", 如: "百科姚明", "定义自行车"', 'baike.php', '', '', 0),
(3, 3, '"@查询内容(中文或英文)"', 'translate.php', '', '', 0),
(4, 4, '"日历", "万年历", "黄历"或"几号"', 'calendar.php', '', '', 0),
(5, 5, '"新闻"', 'news.php', '', '', 0),
(6, 6, '"快递+单号", 如: "申通1200041125"', 'express.php', '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_users`
--

CREATE TABLE IF NOT EXISTS `ims_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` int(10) unsigned NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(200) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `joindate` int(10) unsigned NOT NULL,
  `joinip` varchar(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL,
  `lastip` varchar(15) NOT NULL,
  `remark` varchar(500) NOT NULL,
  `starttime` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `ims_users`
--

INSERT INTO `ims_users` (`uid`, `groupid`, `username`, `password`, `salt`, `type`, `status`, `joindate`, `joinip`, `lastvisit`, `lastip`, `remark`, `starttime`, `endtime`) VALUES
(1, 0, 'admin', '3469c3563836126bf6de2a8fea66e52bbfd3d73d', '316b6c24', 0, 0, 1468650810, '', 1520835671, '111.201.144.68', '', 0, 0),
(2, 1, 'test', 'cfcdc23f3be37a4f9019eaf57da7b16c129e2ad9', 'AF4m6Bfl', 0, 2, 1510192538, '119.187.160.174', 1510194310, '119.187.160.174', '', 1510192538, 0),
(3, 0, 'testadmin', 'df539940755fe9fea9c07e13d9ea89e9d752e80e', 'KA0X16rr', 0, 2, 1510194061, '27.202.80.11', 1510208185, '113.250.253.25', '', 0, 0),
(4, 1, 'haixianguotie', '9a263184241a43ea4d34aa6749d7cba3fc7272a7', 'wI909db7', 0, 2, 1510678437, '27.202.76.192', 1516593278, '27.202.132.244', '', 1510678437, 0),
(5, 1, '慢炖食客', 'd9b611c6c66e62f0e6872bc9dbf380b882073938', 'x0wOmd55', 0, 2, 1513838615, '111.14.232.180', 1513841217, '111.14.232.180', '', 1513838615, 0),
(6, 0, 'qdhxgt', 'bd42b91eb6be99c6405a3494143f0863ddf19a8d', 'YIr5J5jI', 0, 2, 1515044954, '123.134.9.192', 1517219161, '60.214.183.247', '', 0, 0),
(7, 0, 'hxgt_qt', 'a6b3dadea5b5fccccb77c3d07ebb491ef950ca6c', 'v286WTik', 0, 2, 1516000718, '123.134.2.181', 1518405867, '39.79.68.53', '', 0, 0),
(8, 0, 'hxgt_qt1', '4e1639b38c30e267f5318d34dc5544fc03910ded', 'Qp0TfXF9', 0, 2, 1516084325, '39.79.68.53', 1517970242, '222.134.231.84', '', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_failed_login`
--

CREATE TABLE IF NOT EXISTS `ims_users_failed_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) NOT NULL,
  `username` varchar(32) NOT NULL,
  `count` tinyint(1) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip_username` (`ip`,`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=47 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_group`
--

CREATE TABLE IF NOT EXISTS `ims_users_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `package` varchar(5000) NOT NULL,
  `maxaccount` int(10) unsigned NOT NULL,
  `maxsubaccount` int(10) unsigned NOT NULL,
  `timelimit` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ims_users_group`
--

INSERT INTO `ims_users_group` (`id`, `name`, `package`, `maxaccount`, `maxsubaccount`, `timelimit`) VALUES
(1, '体验用户组', 'a:1:{i:0;i:1;}', 1, 1, 0),
(2, '白金用户组', 'a:1:{i:0;i:1;}', 2, 2, 0),
(3, '黄金用户组', 'a:1:{i:0;i:1;}', 3, 3, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_invitation`
--

CREATE TABLE IF NOT EXISTS `ims_users_invitation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `fromuid` int(10) unsigned NOT NULL,
  `inviteuid` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_permission`
--

CREATE TABLE IF NOT EXISTS `ims_users_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `type` varchar(30) NOT NULL,
  `permission` varchar(10000) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_profile`
--

CREATE TABLE IF NOT EXISTS `ims_users_profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `realname` varchar(10) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `fakeid` varchar(30) NOT NULL,
  `vip` tinyint(3) unsigned NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthyear` smallint(6) unsigned NOT NULL,
  `birthmonth` tinyint(3) unsigned NOT NULL,
  `birthday` tinyint(3) unsigned NOT NULL,
  `constellation` varchar(10) NOT NULL,
  `zodiac` varchar(5) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `idcard` varchar(30) NOT NULL,
  `studentid` varchar(50) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `nationality` varchar(30) NOT NULL,
  `resideprovince` varchar(30) NOT NULL,
  `residecity` varchar(30) NOT NULL,
  `residedist` varchar(30) NOT NULL,
  `graduateschool` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `education` varchar(10) NOT NULL,
  `occupation` varchar(30) NOT NULL,
  `position` varchar(30) NOT NULL,
  `revenue` varchar(10) NOT NULL,
  `affectivestatus` varchar(30) NOT NULL,
  `lookingfor` varchar(255) NOT NULL,
  `bloodtype` varchar(5) NOT NULL,
  `height` varchar(5) NOT NULL,
  `weight` varchar(5) NOT NULL,
  `alipay` varchar(30) NOT NULL,
  `msn` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `taobao` varchar(30) NOT NULL,
  `site` varchar(30) NOT NULL,
  `bio` text NOT NULL,
  `interest` text NOT NULL,
  `workerid` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ims_users_profile`
--

INSERT INTO `ims_users_profile` (`id`, `uid`, `createtime`, `realname`, `nickname`, `avatar`, `qq`, `mobile`, `fakeid`, `vip`, `gender`, `birthyear`, `birthmonth`, `birthday`, `constellation`, `zodiac`, `telephone`, `idcard`, `studentid`, `grade`, `address`, `zipcode`, `nationality`, `resideprovince`, `residecity`, `residedist`, `graduateschool`, `company`, `education`, `occupation`, `position`, `revenue`, `affectivestatus`, `lookingfor`, `bloodtype`, `height`, `weight`, `alipay`, `msn`, `email`, `taobao`, `site`, `bio`, `interest`, `workerid`) VALUES
(1, 2, 1510192538, '李先生', '多店铺', '', '', '', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(2, 4, 1510678437, '李', '海鲜锅贴', '', '', '', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(3, 5, 1513838615, '张存斌', '慢炖食客', '', '540618149', '', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_video_reply`
--

CREATE TABLE IF NOT EXISTS `ims_video_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_voice_reply`
--

CREATE TABLE IF NOT EXISTS `ims_voice_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wechat_attachment`
--

CREATE TABLE IF NOT EXISTS `ims_wechat_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `media_id` varchar(255) NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  `model` varchar(25) NOT NULL,
  `tag` varchar(5000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `media_id` (`media_id`),
  KEY `acid` (`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wechat_news`
--

CREATE TABLE IF NOT EXISTS `ims_wechat_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned DEFAULT NULL,
  `attach_id` int(10) unsigned NOT NULL,
  `thumb_media_id` varchar(60) NOT NULL,
  `thumb_url` varchar(255) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(30) NOT NULL,
  `digest` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `content_source_url` varchar(200) NOT NULL,
  `show_cover_pic` tinyint(3) unsigned NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `attach_id` (`attach_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wxapp_qr`
--

CREATE TABLE IF NOT EXISTS `ims_wxapp_qr` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `scene` int(11) NOT NULL COMMENT '场景值',
  `uniacid` int(5) NOT NULL DEFAULT '0',
  `userid` int(10) NOT NULL DEFAULT '0',
  `goodsid` int(10) NOT NULL DEFAULT '0',
  `type` int(1) NOT NULL DEFAULT '1',
  `qrtype` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '类型',
  `page` varchar(200) CHARACTER SET utf8 NOT NULL COMMENT '定位的页面',
  `url` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '地址',
  `qrcode` varchar(250) CHARACTER SET utf8 NOT NULL COMMENT '二维码',
  `updatetime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `ims_wxapp_qr`
--

INSERT INTO `ims_wxapp_qr` (`id`, `scene`, `uniacid`, `userid`, `goodsid`, `type`, `qrtype`, `page`, `url`, `qrcode`, `updatetime`) VALUES
(1, 2189, 1, 2189, 0, 4, 'wxacodeunlimit', 'index', 'poster/1/fc0fbc25e34a10256869b22708859d6e.png', 'qrcode/1/150625707125971.png', 1506257071),
(2, 2214, 1, 2214, 0, 4, 'wxacodeunlimit', 'index', 'poster/1/39bd8e033289f6ab2d5d8ccd8f5fc8be.png', 'qrcode/1/150625711754928.png', 1506257117),
(3, 2236, 1, 2236, 0, 4, 'wxacodeunlimit', 'index', 'poster/1/06e5388e570b4090387cef64407fe15a.png', 'qrcode/1/150630646560597.png', 1506306465),
(4, 2207, 1, 2207, 0, 4, 'wxacodeunlimit', 'index', 'poster/1/8b069203aca8d207a0570eb5e1651e93.png', 'qrcode/1/150632838365777.png', 1506328383),
(5, 2210, 1, 2210, 0, 4, 'wxacodeunlimit', 'index', 'poster/1/bcad704db6b68151a07828bd23d1e876.png', 'qrcode/1/150638621345565.png', 1506386213),
(6, 2215, 1, 2215, 0, 4, 'wxacodeunlimit', 'index', 'poster/1/6014d2571026d5c072717f38c0c42909.png', 'qrcode/1/150648471216369.png', 1506484712),
(7, 2225, 1, 2225, 0, 4, 'wxacodeunlimit', 'index', 'poster/1/30b4bf5bf7814bc4f785333b87efb6ed.png', 'qrcode/1/150649233786349.png', 1506492337),
(8, 2244, 1, 2244, 0, 4, 'wxacodeunlimit', 'index', 'poster/1/df4fc94e34a913918e71eeccb10d15d0.png', 'qrcode/1/150649874883259.png', 1506498748),
(9, 2213, 1, 2213, 0, 4, 'wxacodeunlimit', 'index', 'poster/1/1db291d0797bce7dd25080696a5fe757.png', 'qrcode/1/150657817542917.png', 1506578175),
(10, 2251, 1, 2251, 0, 4, 'wxacodeunlimit', 'index', 'poster/1/a269f9135db377005cc8e6354ba60fab.png', 'qrcode/1/150720190441110.png', 1507201904),
(11, 2260, 1, 2260, 0, 4, 'wxacodeunlimit', 'index', 'poster/1/f2c1779a3e22dbfdc898b70fd368e6e3.png', 'qrcode/1/150747109268664.png', 1507471092),
(12, 2300, 6, 2300, 0, 4, 'wxacodeunlimit', 'index', 'poster/6/f67ca30a92c4424f31d590406bf68208.png', 'qrcode/6/151159743074898.png', 1511597430),
(13, 2310, 6, 2310, 0, 4, 'wxacodeunlimit', 'index', 'poster/6/52b972d5cce5e0d2b0c88eff5867670d.png', 'qrcode/6/151185559531044.png', 1511855595),
(14, 2272, 1, 2272, 0, 4, 'wxacodeunlimit', 'index', 'poster/1/761a570eb63f59ddecd7f4090d92eafd.png', 'qrcode/1/151281157032733.png', 1512811570),
(15, 2268, 1, 2268, 0, 4, 'wxacodeunlimit', 'index', 'poster/1/5b619b4ec2f3693a4a2375a064449dcb.png', 'qrcode/1/151324377050031.png', 1513243770),
(16, 2303, 6, 2303, 0, 4, 'wxacodeunlimit', 'index', 'poster/6/562f684e176122a5bdbe3bde58b13665.png', 'qrcode/6/151503511949712.png', 1515035119),
(17, 2430, 1, 2430, 0, 4, 'wxacodeunlimit', 'index', 'poster/1/b74ffbe8cce74e707ceb65b4e9196531.png', 'qrcode/1/151503670022908.png', 1515036700),
(18, 2493, 6, 2493, 0, 4, 'wxacodeunlimit', 'index', 'poster/6/3ff713f6b8f62584a9187623a7b385d4.png', 'qrcode/6/151564426522466.png', 1515644265),
(25, 2333, 6, 2333, 0, 4, 'wxacodeunlimit', 'index', 'poster/6/9c087a44f816feac9aaa7f0cfd99186a.png', 'qrcode/6/151572285667686.png', 1515722856),
(24, 0, 6, 0, 0, 3, 'wxacodepath', 'pages/article/detail?id=12', 'qrcode/6/151564887211678.png', 'qrcode/6/151564887211678.png', 1515648872),
(26, 2582, 6, 2582, 0, 4, 'wxacodeunlimit', 'index', 'poster/6/ec7ae9a283688627e65bf9a6a252ab75.png', 'qrcode/6/151619901099101.png', 1516199010),
(27, 2423, 6, 2423, 0, 4, 'wxacodeunlimit', 'index', 'poster/6/b02513cdb6d4a66a5c7124f05e953327.png', 'qrcode/6/151636258749674.png', 1516362587);

-- --------------------------------------------------------

--
-- 表的结构 `ims_wxapp_versions`
--

CREATE TABLE IF NOT EXISTS `ims_wxapp_versions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `version` varchar(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `modules` varchar(1000) NOT NULL,
  `design_method` tinyint(1) NOT NULL,
  `template` int(10) NOT NULL,
  `quickmenu` varchar(2500) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `version` (`version`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wxcard_reply`
--

CREATE TABLE IF NOT EXISTS `ims_wxcard_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `cid` int(10) unsigned NOT NULL,
  `brand_name` varchar(30) NOT NULL,
  `logo_url` varchar(255) NOT NULL,
  `success` varchar(255) NOT NULL,
  `error` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

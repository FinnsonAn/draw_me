//app.js
App({
	onLaunch: function () {
		//调用API从本地缓存中获取数据
	},
	onShow: function () {
	},
	onHide: function () {
	},
	onError: function (msg) {
		console.log(msg)
	},
  util: require('resource/js/util.js'),
	globalData:{
		userInfo : null,
    keys: {
      'order': '订单',
      'buy': '订单',
      'goods': '宝贝',
      'orderReceive': '完结',
      'webname': '画个我',
      'shareTitle': '画个我',
    },
	},
	siteInfo: {
		'uniacid' : '1',
		'acid'    : '1',
		'version' : '1.3',
    'module'  : 'ewei_shopv2',
    'siteroot': 'https://www.shouhuizhaopian.com/app/index.php',
	},
});
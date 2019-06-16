var app = getApp();
var Common = require("../../resource/js/common.js");
var result;
Page({
  /**
   * 页面的初始数据
   */
  data: {
    newsData: [],
    user: [],
    userNavs: [],
  },

  onLoad: function () {
    var that = this;
    app.util.getUserInfo(function(response) {
      // 会员中心数据
      app.util.request({
        url: 'entry/wxapp/user',
        data: {
          pn: 'index',
          navGid: '3',
        },
        cachetime: '30',
        success: function (res) {
          var result = res.data;
          console.log(result);
          if (!result.errno) {
            that.setData({
              userNavs: result.data.g3.navs,
              user: result.data.member,
            });
          }
        },
        fail: function (res) {
          app.util.message(res.data.message, '', 'error');
        }
      });
    });

  },

  onShareAppMessage: function (res) {
    console.log('分享');
    return {
      title: '有画师帮我画了个头像，快来看',
      imageUrl: '/resource/images/fengmian.jpg',
      success: function (res) {
        Common.showToast('转发成功');
      },
      fail: function (res) {
        Common.showToast('转发失败');
      }
    }
  },
  
  toNext: function (e) {
    Common.toPage(e);

  }
})
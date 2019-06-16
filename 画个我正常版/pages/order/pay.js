var app = getApp();
var Common = require("../../resource/js/common.js");
var id;
Page({
  /**
   * 页面的初始数据
   */
  data: {
    order: [],
    ordername: app.globalData.keys.order
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    id = options.id ? options.id : 0;
    if (!id)
    {
      util.message('参数错误', '', 'error');
      return;
    }

    wx.setNavigationBarTitle({
      title: app.globalData.keys.order + '支付'
    });

    app.util.getUserInfo(function (response) {
      if (response.sessionid) {
        app.util.request({
          url: 'entry/wxapp/order',
          data: {
            pn: 'pay',
            op: 'display',
            id: id
          },
          success: function (res) {
            var result = res.data;
            console.log(result);
            if (!result.errno) {
              that.setData({
                order: result.data.order
              });
            }
            else {
              console.log(res);
              app.util.message(res.data.message, '', 'error');
            }
          },
          fail: function (res) {
            console.log(res);
            app.util.message(res.data.message, '', 'error');
          }
        });
      }
      else {
        Common.toback(1);
      }
    });
  },

  pay: function(){
    var that = this;
    app.util.request({
      url: 'entry/wxapp/order',
      data: {
        pn: 'pay',
        op: 'pay',
        payment: 'wechat',
        id: id
      },
      method: 'POST',
      cachetime: '0',
      success: function (res) {
        var result = res.data;
        console.log(result);
        if (!result.errno) {
          var payinfo = result.data.payinfo;
          if (payinfo)
          {
            wx.requestPayment({
              'timeStamp': payinfo.timeStamp,
              'nonceStr': payinfo.nonceStr,
              'package': payinfo.package,
              'signType': payinfo.signType,
              'paySign': payinfo.paySign,
              'success': function (res) {
                app.util.message('支付成功', 'redirect:detail?id='+id, 'success');
              },
              'fail': function (res) {
                console.log(res);
              }
            })
          }
          else
          {
            app.util.message('微信支付参数不正确', '', 'error');
          }

        }
        else {
          app.util.message(res.data.message, '', 'error');
        }
      },
      fail: function (res) {
        console.log(res);
        app.util.message(res.data.message, '', 'error')
      }
    });
  }
})
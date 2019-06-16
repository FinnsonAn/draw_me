var app = getApp();
var Common = require("../../resource/js/common.js");
var id = 0;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    order:[],
    author: {},
    ordername: app.globalData.keys.order,
    goodsname: app.globalData.keys.goods
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    id = options.id > 0 ? options.id : 0;
    if (!id)
    {
      Common.toBack(1);
    }
    
    wx.setNavigationBarTitle({
      title: '订单详情'
    });

    app.util.getUserInfo(function (response) {
      if (response.sessionid) {
        app.util.request({
          url: 'entry/wxapp/order',
          data: {
            pn: 'detail',
            op: 'main',
            id: id
          },
          cachetime: '0',
          success: function (res) {
            var result = res.data;
            console.log(result);
            if (!result.errno) {
              that.setData({
                order: result.data.order,
                author: result.data.author
              });
            }
          },
          fail: function (res) {
            console.log(res.data);
          }
        });
      }
      else {
        Common.toBack(1);
      }
    });  
  },

  /* 预览图片 */
  showPic: function (e) {
    var goodsUrl = e.currentTarget.dataset.url;
    var index = e.currentTarget.dataset.index;
    var pics = this.data.order.upics;
    wx.previewImage({
      current: goodsUrl, // 当前显示图片的http链接
      urls: pics,
    });
  },

  /* 预览图片 */
  showPic1: function (e) {
    var goodsUrl = e.currentTarget.dataset.url;
    var index = e.currentTarget.dataset.index;
    var pics = this.data.order.uploads;
    wx.previewImage({
      current: goodsUrl, // 当前显示图片的http链接
      urls: pics,
    });
  },

  /* 取消订单 */
  cancel: function (e) {
    var that = this;
    if (id) {
      wx.showModal({
        title: '确认操作',
        content: '确定要取消该订单吗？',
        success: function (res) {
          if (res.confirm) {
            app.util.request({
              url: 'entry/wxapp/order',
              data: {
                pn: 'op',
                op: 'cancel',
                id: id
              },
              success: function (res) {
                var result = res.data;
                if (!result.errno) {
                  Common.showToast('取消成功');
                }
                else {
                  app.util.message(res.data.message, '', 'error');
                }
              },
              fail: function (res) {
                Common.toBack(1);
              }
            });
          } else if (res.cancel) {

          }
        }
      });
    }
  },

  /* 删除订单 */
  remove: function (e) {
    var that = this;
    if (id) {
      wx.showModal({
        title: '确认操作',
        content: '确定要删除该订单吗？',
        success: function (res) {
          if (res.confirm) {
            app.util.request({
              url: 'entry/wxapp/order',
              data: {
                pn: 'op',
                op: 'remove',
                id: id
              },
              success: function (res) {
                var result = res.data;
                if (!result.errno) {
                  Common.showToast('删除成功');
                }
                else {
                  app.util.message(res.data.message, '', 'error');
                }

              },
              fail: function (res) {
                Common.toBack(1);
              }
            });
          } else if (res.cancel) {

          }
        }
      });
    }
  },

  /* 收货 */
  receive: function (e) {
    var that = this;
    if (id) {
      wx.showModal({
        title: '收货操作',
        content: '确定订单收到货了吗？',
        success: function (res) {
          if (res.confirm) {
            app.util.request({
              url: 'entry/wxapp/order',
              data: {
                pn: 'op',
                op: 'receive',
                id: id
              },
              success: function (res) {
                var result = res.data;
                if (!result.errno) {
                  app.util.message('操作成功', 'redirect:comment?id='+id, 'success');
                }
                else {
                  app.util.message(res.data.message, '', 'error');
                }

              },
              fail: function (res) {
                Common.toBack(1);
              }
            });
          } else if (res.cancel) {

          }
        }
      });
    }
  },

  /* 支付订单 */
  pay: function (e) {
    if (id) {
      wx.navigateTo({
        url: 'pay?id=' + id,
      })
    }
  },

  comment: function (e) {
    if (id) {
      wx.navigateTo({
        url: 'comment?id=' + id,
      })
    }
  },

  /* 返回首页 */
  toHome: function (e) {
    Common.gotoHome();
  }
})
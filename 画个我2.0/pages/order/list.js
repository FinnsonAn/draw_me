var app = getApp();
var Common = require("../../resource/js/common.js");
var status;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    list: [],
    listLength: 1,
    emptyMsg: '没有相关' + app.globalData.keys.order +'数据',
    status: '',
    ismore: 0,
    page: 0,
    ordername: app.globalData.keys.order,
    goodsname: app.globalData.keys.goods,
    orderReceive: app.globalData.keys.orderReceive,
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    options.cid = options.cid > 0 ? options.cid : -1;
    status = options.status ? options.status : -2;

    wx.setNavigationBarTitle({
      title: '我的' + app.globalData.keys.order
    });
    
    app.util.getUserInfo(function (response) {
      if (response.sessionid) {
        that.loadMoreData();
      }
      else {
        Common.toBack(1);
      }
    }); 
  },

  pullDownRefresh: function(e){
    if (this.data.ismore)
    {
      this.loadMoreData();
    }
  },

  loadMoreData: function(){
    var that = this;
    var page = that.data.page + 1;
    that.setData({
      page: page
    });
    app.util.request({
      url: 'entry/wxapp/order',
      data: {
        pn: 'list',
        op: 'main',
        status: status,
        page: page
      },
      cachetime: '0',
      success: function (res) {
        var result = res.data;
        console.log(result);
        if (!result.errno) {
          if (result.data.list.length == 0)
          {
              that.setData({
                ismore: 0,
                status: status,
              });
              if (page == 1) {
                that.setData({
                  listLength: 0,
                });
              }
              if (page > 1) {
                Common.showToast('数据已全部显示');
              }
          }
          else
          {
            var newlist = that.data.list.concat(result.data.list);
            that.setData({
              list: newlist,
              page: result.data.page,
              listLength: newlist.length,
              status: status,
              ismore: 1,
            });
          } 
        }
        else {
          that.setData({
            ismore: 0,
          });
          app.util.message(res.data.message, '', 'error');
        }
      },
      fail: function (res) {
        that.setData({
          ismore: 0,
        });
        app.util.message(res.data.message, '', 'error');
      }
    });
  },

  /* 订单详情 */
  toOrderView: function(e){
    var id = e.currentTarget.dataset.id;
    if (id)
    {
      wx.navigateTo({
        url: 'detail?id=' + id,
      })
    }
  },

  /* 订单列表 */
  toOrderlist: function (e) {
    var that = this;
    status = e.currentTarget.dataset.status;
    that.setData({
      status: status,
      page: 0,
      ismore: 0,
      list: [],
      listLength: 1,

    });
    that.loadMoreData();
  },


  /* 取消订单 */
  cancel: function(e){
    var that = this;
    var id = e.currentTarget.dataset.id;
    var index = e.currentTarget.dataset.index;
    if (id)
    {
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
                  that.data.list.splice(index, 1);
                  that.setData({
                    list: that.data.list
                  });
                }
                else {
                  app.util.message(res.data.message, '', 'error');
                }

              },
              fail: function (res) {
                app.util.message(res.data.message, '', 'error');
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
    var id = e.currentTarget.dataset.id;
    var index = e.currentTarget.dataset.index;
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
                  that.data.list.splice(index, 1);
                  that.setData({
                    list: that.data.list
                  });
                }
                else {
                  app.util.message(res.data.message, '', 'error');
                }

              },
              fail: function (res) {
                app.util.message(res.data.message, '', 'error');
                app.util.navigateBack();
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
    var id = e.currentTarget.dataset.id;
    var index = e.currentTarget.dataset.index;
    if (id) {
      wx.showModal({
        title: '收图',
        content: '确定收到图了吗？',
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
                  that.data.list.splice(index, 1);
                  that.setData({
                    list: that.data.list
                  });
                  Common.showToast('操作成功');
                }
                else {
                  app.util.message(res.data.message, '', 'error');
                }

              },
              fail: function (res) {
                app.util.message(res.data.message, '', 'error');
                app.util.navigateBack();
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
    var id = e.currentTarget.dataset.id;
    if (id) {
      wx.navigateTo({
        url: 'pay?id=' + id,
      })
    }
  },

  /* 售后 */
  refund: function(e){
    var id = e.currentTarget.dataset.id;
    var refundstate = parseInt(e.currentTarget.dataset.refundstate);
    if (id) {
      if (refundstate > 0)
      {
        var url = 'refundDetail?id=' + id;
      }
      else{
        var url = 'refund?id=' + id;
      }
      wx.navigateTo({
        url: url,
      })
    }
  },

  comment: function(e){
    var id = e.currentTarget.dataset.id;
    if (id) {
      wx.navigateTo({
        url: 'comment?id=' + id,
      })
    }
  },

  express: function(e)
  {
    var id = e.currentTarget.dataset.id;
    if (id) {
      wx.navigateTo({
        url: 'express?id=' + id,
      })
    }
  }
})
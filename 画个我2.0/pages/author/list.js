var app = getApp();
var Common = require("../../resource/js/common.js");
var status = 1;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    list: [],
    listLength: 1,
    emptyMsg: '没有相关' + app.globalData.keys.order +'数据',
    status: 1,
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
    status = options.status ? options.status : 1;
    
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
      url: 'entry/wxapp/author',
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

})
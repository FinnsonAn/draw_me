var app = getApp();
var Common = require("../../resource/js/common.js");
var cid = 0;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    list: [],
    catename: '',
    listLength: 1,
    page: 0,
    ismore: 0,
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    cid = options.cid ? options.cid : 0;
    
    // 列表
    this.loadMoreData();
     
  },
  
  onShareAppMessage: function (res) {
  	console.log('分享');	
  },

  /* 下拉更新数据 */
  pullDownRefresh: function (e) {
    if (this.data.ismore) {
      this.loadMoreData();
    }
  },

  loadMoreData: function () {
    var that = this;
    var page = that.data.page + 1;
    that.setData({
      page: page
    });
    app.util.request({
      url: 'entry/wxapp/main',
      data: {
        pn: 'notice',
        op: 'list',
        page: page,
        cid: cid,
      },
      cachetime: '30',
      success: function (res) {
        var result = res.data;
        if (!result.errno) {
          if (result.data.list.length == 0) {
            that.setData({
              ismore: 0,
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
          else {
            var newlist = that.data.list.concat(result.data.list);
            that.setData({
              list: newlist,
              catename: result.data.catename,
              page: result.data.page,
              listLength: newlist.length,
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

  gotoDetail: function (event) {
    var id = event.currentTarget.dataset.id;
    wx.navigateTo({
      url: 'detail?id=' + id,
    })
  }
  
})
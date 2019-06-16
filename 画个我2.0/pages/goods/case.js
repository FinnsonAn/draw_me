// list.js
var Common = require("../../resource/js/common.js");
var app = getApp();
var curId = 0;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    cates: [],
    list: [],
    ismore: 0,
    listLength: 1,
    curId: 0,
    page: 0,
    total: 0,
    emptyMsg: '暂无作品',
    setinfo: {}
  },

  onLoad: function (option) {
    var that = this;
    that.getData();
  },


  onShareAppMessage: function (res) {
    console.log('分享');
  },

  /* 加载数据 */
  getData: function () {
    var that = this;
    var page = that.data.page + 1;
    that.setData({
      page: page
    });
    app.util.request({
      url: 'entry/wxapp/case',
      data: {
        pn: 'list',
        cid: curId,
        page: page
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
              page: result.data.page,
              total: result.data.total,
              listLength: newlist.length,
              ismore: 1,
              cates: result.data.cates,
              curId: result.data.cid,
              setinfo: result.data.setinfo
            });
          }
        }
        else {
          app.util.message(res.data.message, 'ok', 'error');
        }
      },
      fail: function (res) {
        app.util.message(res.data.message, 'ok', 'error');
      }
    });
  },

  // 切换分类
  changeCate: function (e) {
    var that = this;
    curId = e.currentTarget.dataset.id;
    that.setData({
      curId: curId,
      page: 0,
      ismore: 0,
      list: [],
      listLength: 1,

    });
    that.getData();
  },

  /* 下拉更新数据 */
  pullDownRefresh: function (e) {
    if (this.data.ismore==1 && this.data.listLength > 0) {
      this.getData();
    }
  },

  showPic: function(e){
    var url = e.currentTarget.dataset.url;
    var urls = new Array();
    urls[0] = url;
    wx.previewImage({
      current: url, // 当前显示图片的http链接
      urls: urls
    });
  }
  
})
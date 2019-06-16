var Common = require("../../resource/js/common.js");
var R_htmlToWxml = require('../../resource/js/htmlToWxml.js');//引入公共方法
var app = getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    article: [],
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    var id = options.id;
    if (!id){
      return;
    }
    app.util.request({
      url: 'entry/wxapp/main',
      data: {
        pn: 'notice',
        op: 'detail',
        id: id,
      },
      cachetime: '30',
      success: function (res) {
        var result = res.data;
        console.log(result);
        if (!result.errno) {
          var article = result.data.article;
          if (typeof (result.data.article.detail) == 'string') {
            article.content = R_htmlToWxml.html2json(result.data.article.detail);
          }
          that.setData({
            article: result.data.article,
          });
          wx.setNavigationBarTitle({
            title: result.data.article.title
          });
        }
        else {
          util.message(res.data.message, '', 'error');
        }
      },
      fail: function (res) {
        console.log('请求失败');
      }
    });
  },
  
  onShareAppMessage: function (res) {
  	console.log('分享');	
  },

})
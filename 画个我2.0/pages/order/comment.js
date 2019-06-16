var app = getApp();
var Common = require("../../resource/js/common.js");
var id = 0;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    order: [],
    stars: [
      { i: 1, desc: '很不满意' },
      { i: 2, desc: '不满意' },
      { i: 3, desc: '一般' },
      { i: 4, desc: '还可以' },
      { i: 5, desc: '非常满意' }
    ],
    goodsid: 0,
    level: 0,
    leveldesc: '',
    avatar: ''
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    id = options.id ? options.id :0;
    if (!id) {
      Common.toBack(1);
    }

    app.util.getUserInfo(function (response) {
      if (response.sessionid) {
        app.util.request({
          url: 'entry/wxapp/order',
          data: {
            pn: 'comment',
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
                goodsid: result.data.goodsid,
              });
              if (result.data.order.uploads.length > 0)
              {
                that.setData({
                  avatar: result.data.order.uploads[0],
                });
              }
            }
            else {
              wx.switchTab({
                url: '../index/index',
              });
              console.log(res.data);
            }
          },
          fail: function (res) {
            wx.switchTab({
              url: '../index/index',
            });
            //app.util.message(res.data.message, '', 'error');
            //Common.toBack(1);
            console.log(res.data);
          }
        });
      }
      else {
        wx.switchTab({
          url: '../index/index',
        });
      }
    });
  },

  // 下载到本地
  download: function(e){
    var that = this;
    wx.downloadFile({
      url: that.data.avatar, 
      success: function (res) {
        if (res.statusCode == 200 && res.tempFilePath)
        {
          var filepath = res.tempFilePath;
          wx.saveImageToPhotosAlbum({
            filePath: filepath,
            success(res) 
            {
              console.log(res);
              app.util.message('保存成功', '', 'success');
            }
          })
        }
        console.log(res);
      }
    })
  },

  level: function (e) {
    var that = this;
    var desc = e.target.dataset.desc;
    var level = e.target.dataset.level;
    that.setData({
      leveldesc: desc,
      level: level,
    });
  },

  formSubmit: function (event) {
    var that = this;
    var form = event.detail.value;
    form.id = id;
    form.pn = 'comment';
    form.op = 'submit';
    form.level = that.data.level;
    form.goodsid = that.data.goodsid;
    console.log(form);
    if (Common.isEmpty(form.comment)) {
      app.util.message('请输入评价内容', '', 'error');
      return;
    }
    if (parseInt(form.level) == 0) {
      app.util.message('请评分', '', 'error');
      return;
    }
   
    app.util.request({
      url: 'entry/wxapp/order',
      data: form,
      method: 'post',
      success: function (response) {
        var result = response.data;
        if (!result.errno) {
          that.opSuccess();
        }
        else {
          app.util.message(result.message, '', 'error');
          console.log(response);
        }

      },
      fail: function (res) {
        app.util.message(res.data.message, '', 'error');
        console.log(res);
        //Common.toBack();
      }
    });
  },

  opSuccess: function () {
    app.util.message('评价成功', 'redirect:list?status=3', 'success');
  },

})
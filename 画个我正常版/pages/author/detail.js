var app = getApp();
var Common = require("../../resource/js/common.js");
var id = 0;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    order:[],
    pics: [],
    author: {},
    ordername: app.globalData.keys.order,
    goodsname: app.globalData.keys.goods
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    id = options.id > 0 ? options.id : 3;
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
          url: 'entry/wxapp/author',
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
                author: result.data.author,
                pics: result.data.order.uploads
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
    var pics = this.data.pics;
    wx.previewImage({
      current: goodsUrl, // 当前显示图片的http链接
      urls: pics,
    });
  },

  // 选择图片
  choosePic: function (e) {
    var index = e.target.dataset.index;
    var that = this;
    var pics = that.data.pics ? that.data.pics : new Array();
    wx.chooseImage({
      count: 5, // 默认9
      sizeType: ['compressed'], // 可以指定是原图还是压缩图，默认二者都有
      sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
      success: function (res) {
        // 返回选定照片的本地文件路径列表，tempFilePath可以作为img标签的src属性显示图片
        var imgsrc = res.tempFilePaths
        pics = pics.concat(imgsrc);
        that.setData({
          pics: pics
        });
      }
    });
  },

  /* 提交 */
  formSubmit: function (e) {
    var that = this;

    if (that.data.pics.length == 0) {
      app.util.message('请上传作品', '', 'error');
      return;
    }

    app.util.request({
      url: 'entry/wxapp/author',
      data: {
        pn: 'op',
        op: 'send',
        id: id
      },
      method: 'post',
      success: function (response) {
        var result = response.data;
        if (!result.errno) {
          var pics = that.data.pics;
          if (typeof pics == 'object' && id > 0) {
            if (pics.length > 0) {
              app.util.upload({
                url: "entry/wxapp/main",
                filePath: pics,
                name: 'pic',
                formData: {
                  pn: 'upload',
                  op: 'author',
                  orderid: id
                },
              });
            }
          }
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
    app.util.message('提交成功', 'redirect:list?status=1', 'success');
  },

  remove: function(){
    var that = this;
    if (id) {
      wx.showModal({
        title: '确认操作',
        content: '确定要清空上传的图片吗？订单将变为未发货状态',
        success: function (res) {
          if (res.confirm) {
            app.util.request({
              url: 'entry/wxapp/author',
              data: {
                pn: 'op',
                op: 'cancel',
                id: id
              },
              success: function (res) {
                var result = res.data;
                if (!result.errno) {
                  that.setData({
                    pics: []
                  });
                  app.util.message('操作成功', '', 'success');
                  
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

  /* 返回首页 */
  toHome: function (e) {
    Common.gotoHome();
  }

})
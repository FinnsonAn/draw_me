var app = getApp();
var Common = require("../../resource/js/common.js");
var id;
Page({
  /**
   * 页面的初始数据
   */
  data: {
    price: 0,
    person: 1,
    pictype: 1,
    optionid: 0,
    upfiles: [],
    goods: {},
    pics: [],
    member: {}
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    id = options.id ? options.id : 0;
    app.util.getUserInfo(function (response) {
      if (response.sessionid) {
        app.util.request({
          url: 'entry/wxapp/order',
          data: {
            pn: 'confirm',
            op: 'display',
            id: id,
          },
          success: function (res) {
            var result = res.data;
            if (!result.errno) {
              var options = result.data.goods.options;
              that.setData({
                goods: result.data.goods,
                member: result.data.member,
                price: result.data.price,
                person: parseInt(result.data.goods.min_person),
              });
              if (options)
              {
                if (options.length > 0)
                {
                  that.setData({
                    optionid: parseInt(options[0].id)
                  });
                }
              }
            }
            else {
              app.util.message(res.data.message, '', 'error');
            }
          },
          fail: function (res) {
            app.util.message(res.data.message, '', 'error');
          }
        });
      }
      else {
        Common.toBack(1);
      }
    });
  },

  /* 照片类型 */
  changePictype: function(e)
  {
    var val = parseInt(e.currentTarget.dataset.val);
    this.setData({
      pictype: val
    });
  },

  /* 增加数量 */
  plus: function (e) {
    var person = this.data.person;
    var max = parseInt(e.currentTarget.dataset.max);
    if (person+1 > max)
    {
      Common.showToast('亲~不能再多了', 'none');
      return;
    }
    person += 1;
    this.setData({
      person: person
    });
    this.changeprice();
  },

  /* 减少数量 */
  mins: function (e) {
    var person = this.data.person;
    var min = parseInt(e.currentTarget.dataset.min);
    if (person - 1 < min) {
      Common.showToast('亲~不能再少了', 'none');
      return;
    }
    person -= 1;
    this.setData({
      person: person
    });
    this.changeprice();
  },

  // 选择规格
  seloption: function (e) {
    var opid = e.currentTarget.dataset.id;
    var that = this;
    that.setData({
      optionid: opid
    });
    that.changeprice();
  },

  /* 修改价格 */
  changeprice: function()
  {
    var that = this;
    app.util.request({
      url: 'entry/wxapp/order',
      data: {
        pn: 'confirm',
        op: 'changeprice',
        id: id,
        optionid: that.data.optionid,
        person: that.data.person,
        pictype: that.data.pictype,
      },
      success: function (res) {
        var result = res.data;
        console.log(result);
        if (!result.errno) {
          that.setData({
            price: result.data.price
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

  },

  /* 预览图片 */
  showPic: function (e) {
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
    var person = that.data.person;
    if (pics.length >= person)
    {
      app.util.message('最多只能上传'+ person + '照片', '', 'error');
      return;
    }
    wx.chooseImage({
      count: 1, // 默认9
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

  remove: function(e){
    this.setData({
      pics: []
    });
  },

  /* 提交表单 */
  formSubmit: function (event) {
    var form = event.detail.value;
    var payinfo = new Array();
    var that = this;

    if (that.data.pics.length == 0) {
      app.util.message('请上传要画的照片', '', 'error');
      return;
    }

    form.pn = 'confirm';
    form.op = 'create';
    form.id = id;
    form.formid = event.detail.formId;
    form.person = that.data.person;   // 人数
    form.pictype = that.data.pictype; // 照片类型
    form.optionid = that.data.optionid;   // 规格
    app.util.request({
      url: 'entry/wxapp/order',
      data: form,
      method: 'post',
      success: function (res) {
        var result = res.data;
        if (!result.errno) {
          var orderid = result.data.order.id;
          payinfo = result.data.payinfo;
          var pics = that.data.pics;
          if (typeof pics == 'object' && orderid > 0) {
            if (pics.length > 0) {
              app.util.upload({
                url: "entry/wxapp/main",
                filePath: pics,
                name: 'pic',
                formData: {
                  pn: 'upload',
                  op: 'order',
                  orderid: orderid
                },
              });
            }
          }
          that.opSuccess(payinfo, orderid);
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

  opSuccess: function (payinfo, orderid) {
    if (payinfo) {
      wx.requestPayment({
        'timeStamp': payinfo.timeStamp,
        'nonceStr': payinfo.nonceStr,
        'package': payinfo.package,
        'signType': payinfo.signType,
        'paySign': payinfo.paySign,
        'success': function (res) {
          app.util.message('支付成功', 'redirect:/pages/order/detail?id=' + orderid, 'success');
        },
        'fail': function (res) {
          console.log(res);
        }
      })
    }
  },

})
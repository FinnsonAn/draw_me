// detail.js
var Common = require("../../resource/js/common.js");
var R_htmlToWxml = require('../../resource/js/htmlToWxml.js');//引入公共方法
var app = getApp();
var result;
var id = 0;
var buytype = 1; // 1为直接购买 2 为加入购物车
var detailImg = new Array();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    num: 1,
    indicatorDots: false,
    goods: {},
    product: {},
    thumbs: [],
    params: [],
    labels: [],
    comments: [],
    comment_total: 0,
    page: 0,
    ismore: 0,
    listLength: 1,
    paybtn: 0,
    tabtype: 1,
    isFavourite: 0,
    isBuyboxHide: true,
    goodsname: app.globalData.keys.goods
  },

  onLoad: function (option) {
    var that = this;
    var userid = option.userid ? option.userid : 0;

    wx.setNavigationBarTitle({
      title: app.globalData.keys.goods + '详情'
    });

    id = option.id ? option.id : 1;
    if (!id) {
      wx.showLoading({
        title: '参数错误',
      });
      setTimeout(function () {
        wx.navigateBack({
          delta: 1
        })
      }, 1000);

    }
    else {

      // 商品详情
      app.util.request({
        url: 'entry/wxapp/main',
        data: {
          pn: 'goods',
          op: 'detail',
          id: id,
          pid: userid,
        },
        cachetime: '30',
        success: function (res) {
          result = res.data;
          console.log(result.data);
          if (!result.errno) {
            var goodsData = result.data.goods;
            if (typeof (result.data.goods.content) == 'string') {
              goodsData.content = R_htmlToWxml.html2json(result.data.goods.content);
            }
            that.setData({
              goods: goodsData,
              product: goodsData,
              params: result.data.goods.params,
              labels: result.data.labels,
              comment_total: result.data.comment_total,
              thumbs: result.data.thumbs,
              isFavourite: result.data.goods.isFavourite,
              paybtn: result.data.paybtn_show
            });
            if (result.data.thumbs.length > 1) {
              that.setData({
                indicatorDots: true
              });
            }
            // 提取图片
            var goodsContent = goodsData.content;
            for (var index in goodsContent) {
              if (goodsContent[index].type == 'img') {
                detailImg[index] = goodsContent[index].attr.src;
              }
            }
          }
          else {
            wx.showToast({
              title: result.message,
            });
          }
        },
        fail: function (res) {
          wx.showToast({
            title: res.data.message,
          });
        }
      });
      that.loadMoreComments();
    }
        

  },

  onShareAppMessage: function (res) {
    if (res.from === 'button') {
      // 来自页面内转发按钮
      console.log(res.target)
    }
    return {
      title: result.data.share.title,
      path: result.data.share.url,
      imageUrl: result.data.share.img,
      success: function (res) {
        Common.showToast('转发成功');
      },
      fail: function (res) {
        Common.showToast('转发失败');
      }
    }
  },

  changeTab: function(e){
    var t = parseInt(e.currentTarget.dataset.t);
    this.setData({
      tabtype: t
    });
  },

  /* 下拉更新数据 */
  pullDownRefresh: function (e) {
    console.log('loading');
    if (this.data.ismore) {
      this.loadMoreComments();
    }
  },

  /* 加载评论 */
  loadMoreComments: function () {
    
    var that = this;
    var page = that.data.page + 1;
    console.log('jiazai评论' + page);
    that.setData({
      page: page
    });
    app.util.request({
      url: 'entry/wxapp/main',
      data: {
        pn: 'comment',
        op: 'list',
        id: id,
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
            var newlist = that.data.comments.concat(result.data.list);
            that.setData({
              comments: newlist,
              page: result.data.page,
              listLength: newlist.length,
              ismore: 1,
            });
            console.log(that.data.comments);
          }
        }
        else{
          app.util.message(result.data.message, '', 'error');
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

  // 预览图片
  showPic: function (e) {
    var goodsUrl = e.currentTarget.dataset.url;
    wx.previewImage({
      current: goodsUrl, // 当前显示图片的http链接
      urls: detailImg
    });
  },

  /* 预览评价图片 */
  showCommentPic: function (e) {
    var goodsUrl = e.currentTarget.dataset.url;
    var index = e.currentTarget.dataset.index;
    var dataList = this.data.comments;
    console.log(dataList[index].images);
    if (!goodsUrl) return;
    wx.previewImage({
      current: goodsUrl, // 当前显示图片的http链接
      urls: dataList[index].images,
    });
    console.log(goodsUrl);
  },

  // 提交表单
  buy: function (e) {
    var that = this;
    var num = this.data.num;
    console.log('id' + id);
    console.log('num' + num);
    if (!id || !num) {
      return;
    }
    console.log('buy');
    // 直接购买
    wx.navigateTo({
      url: '../order/confirm?id=' + id + '&total=' + num 
    })

  },

  // 查看评论
  toCommentsList: function () {
    wx.navigateTo({
      url: 'comments?id=' + id,
    })
  },


})
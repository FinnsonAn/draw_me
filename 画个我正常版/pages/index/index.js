//获取应用实例
var app = getApp();
var Common = require("../../resource/js/common.js");
var curCid = 0;
var page = 0;
var isfix = 0;
Page({
  data: {
    slides: [],
    cates: [],
    curCid: 0,
    page: 0,
    rmd: {},
    ismore: 0,
    goodslist: [],
    classname: 'cates',
    emptyMsg: '暂无画像套餐',
    indicatorDots: false,
  },
  onLoad: function (options) {
    var that = this;
      // 首页数据
      app.util.request({
        url: 'entry/wxapp/main',
        data: {
          pn: 'index',
          slide: 13,
          nav: 6,
        },
        cachetime: '30',
        success: function (res) {
          var result = res.data;
          if (!result.errno) {
            if (result.data.cates)
            {
              curCid = result.data.cates[0]['id'];
            }
            that.setData({
              slides: result.data.slides,
              cates: result.data.cates,
              curCid: curCid
            });
            if (result.data.slides.length > 1) {
              that.setData({
                indicatorDots: true,
              });
            }
            // 商品列表
            if (curCid > 0)
            {
              that.loadMoreData();
            }
          }
        },
        fail: function (res) {
          console.log(res.data);
        }
      });
  },

  /* 下拉更新数据 */
  pullDownRefresh: function (e) {
    if (this.data.ismore) {
      this.loadMoreData();
    }
  },

  /* 加载数据 */
  loadMoreData: function () {
    var that = this;
    var page = that.data.page + 1;
    that.setData({
      page: page
    });

    app.util.request({
      url: 'entry/wxapp/main',
      data: {
        pn: 'index',
        op: 'goods',
        cid: curCid,
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
              //Common.showToast('数据已全部显示');
            }
          }
          else {
            var newlist = that.data.goodslist.concat(result.data.list);
            that.setData({
              goodslist: newlist,
              page: result.data.page,
              listLength: newlist.length,
              ismore: 1,
            });
            if (result.data.page == 1)
            {
              that.setData({
                rmd: result.data.rmd_goods
              
              });
            }
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

  // 分类置顶
  scrollTo: function(e){
    if (e.detail.scrollTop > 140 && !isfix)
    {
      isfix = 1;
      this.setData({
        classname: 'cates fixed'
      });
    }
    else if (e.detail.scrollTop < 140 && isfix){
      isfix = 0;
      this.setData({
        classname: 'cates'
      });
    }
  },
  
  // 切换分类
  changeCate: function (e) {
    var that = this;
    curCid = e.currentTarget.dataset.id;
    that.setData({
      curCid: curCid,
      page: 0,
      ismore: 0,
      goodslist: [],
      listLength: 1,
      rmd: []

    });
    that.loadMoreData();
  },

  toPage: function (e) {
    var link = e.currentTarget.dataset.link;
    if (link) {
      wx.navigateTo({
        url: link,
      })
    }
  },

  onShareAppMessage: function (res) {
    console.log('分享');
    return {
      title: app.globalData.keys.shareTitle,
      success: function (res) {
        Common.showToast('转发成功');
      },
      fail: function (res) {
        Common.showToast('转发失败');
      }
    }
  },

  toDetail: function (e) {
    Common.toGoodsDetail(e);
  },

})

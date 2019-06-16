// 返回首页
function gotoHome()
{
  wx.switchTab({
    url: '/pages/index/index',
  })
}
// 商品详情页
function toGoodsDetail(e)
{
  var id = e.currentTarget.dataset.id;
  wx.navigateTo({
    url: '/pages/goods/detail?id=' + id,
  });
}
// 链接
function toPage(e) 
{
  var url = e.currentTarget.dataset.url;
  var istab = e.currentTarget.dataset.istab;
  if (!url || url == '')
  {
    return;
  }
  if (istab == '1')
  {
    wx.switchTab({
      url: url,
    });
  }
  else{
    wx.navigateTo({
      url: url,
    });
  }
  
}

// 商品列表
function toGoodsList(e)
{
  var cid = 0;
  var url = '/pages/goods/list?';
  if (e.currentTarget.dataset.cid)
  {
    cid = e.currentTarget.dataset.cid;
  }
  if (cid)
  {
    url += 'cid=' + cid;
  }
  wx.navigateTo({
    url: url,
  });
}

// 一维数组变成二维数组
function secondArrs(arr, n = 10){
  var newArr = new Array();
  var rows = 0;
  if (arr.length > 0) {
    rows = parseInt(arr.length / n);
    for (var i = 0; i <= rows; i++) {
      var rowArr = new Array();
      for (var j = 0; j < n; j++) {
        if (arr[i * n + j]) {
          rowArr[j] = arr[i * n + j];
        }
      }
      if (rowArr.length > 0)
      {
        newArr[i] = rowArr;
      }
      
    }
  }
  return newArr;
}

// 返回上页
function toBack(pagenum = 1)
{
  wx.navigateBack({
    delta: pagenum
  });
}

// 返回首页
function toIndex(pagenum = 1) {
  wx.switchTab({
    url: '/pages/index/index'
  });
}

function showToast(msg, icon = 'success')
{
  if (!msg || msg == '')
  {
    return false;
  }
  wx.showToast({
    title: msg,
    icon: icon,
    duration: 2000
  });
}

// json字符串转为json对象格式
function strToJson(str) {
  var json = eval('(' + str + ')');
  return json; 
}
// 检测手机号
function isMobile(val) {
  var bool = true;
  var myreg = /^(((1(3|5|7|8)[0-9]{1}))+\d{8})$/;
  if (val == '' || !val) {
    bool = false;
  }
  if (!myreg.test(val)) {
    bool = false;
  }
  return bool;

}
// 检测身份证号
function isIdcard(val) {
  var bool = true;
  var myreg = /^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/;
  if (val == '' || !val) {
    bool = false;
  }
  if (!myreg.test(val)) {
    bool = false;
  }
  return bool;

}
// 是否为空
function isEmpty(val) {
  var bool = false;
  if (val == '' || !val) {
    bool = true;
  }
  return bool;
}

// 是否为数字
function isNumber() {
  var bool = true;
  var val = parseFloat(val);
  if (!val) {
    bool = false;
  }
  return bool;
}

module.exports.gotoHome = gotoHome
module.exports.toGoodsDetail = toGoodsDetail
module.exports.toPage = toPage
module.exports.toGoodsList = toGoodsList
module.exports.strToJson = strToJson
module.exports.showToast = showToast
module.exports.toBack = toBack
module.exports.toIndex = toIndex
module.exports.secondArrs = secondArrs
module.exports.isMobile = isMobile
module.exports.isIdcard = isIdcard
module.exports.isNumber = isNumber
module.exports.isEmpty = isEmpty
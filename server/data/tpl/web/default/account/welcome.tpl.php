<?php defined('IN_IA') or exit('Access Denied');?>

<html xmlns="http://www.w3.org/1999/xhtml">
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=7">
        <title>
            <?php  echo $_W['page']['copyright']['sitename'];?>
        </title>
        <meta name="keywords" content="<?php  echo $_W['page']['copyright']['keywords'];?>">
        <meta name="description" content="<?php  echo $_W['page']['copyright']['description'];?>">
        <link href="./index/style.css" rel="stylesheet" type="text/css">
        <link href="./index/common.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="./index/style(1).css">
        <link rel="stylesheet" type="text/css" href="./index/public.css">
        <script charset="utf-8" src="./index/v.js">
        </script>
        <script src="./index/hm.js">
        </script>
        <script type="text/javascript" src="./index/jquery.min.js">
        </script>
        <script type="text/javascript" src="./index/functions.js">
        </script>
        <script type="text/javascript" src="./index/focusslide.js">
        </script>
        <script type="text/javascript" src="./index/ScrollPic.js">
        </script>
        <script type="text/javascript" src="./index/iepngfix_tilebg.js">
        </script>
        <script type="text/javascript">
            window.onerror = function() {
                return true;
            }
        </script>
    </head>
    
    <body>
        <!--head start-->
        <div id="head" style="top: 0px; position: fixed;">
            <div class="TopBG">
                <div class="clearfix">
                </div>
            </div>
            <!--top start -->
            <div class="top">
                <div class="TopLogo">
                    <div class="logo">
                        <a href="#">
                            <img src="<?php  echo tomedia($copyright['flogo']);?>" alt="专业微信分销系统">
                        </a>
                    </div>
                    <div class="tel">
                        <!--nav start-->
                        <div id="NavLink">
                            <div class="NavBG">
                                <!--Head Menu Start-->
                                <ul id="sddm">
                                    <li>
                                        <a href="index.php?c=user&a=login">
                                            <font size="4px">登录</font>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="index.php?c=user&a=register">
                                            <font size="4px">注册</font>
                                        </a>
                                    </li>
                                </ul>
                                <!--Head Menu End-->
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                        <!--nav end-->
                    </div>
                </div>
            </div>
            <!--top end-->
            <div class="clearfix">
            </div>
        </div>
        <!--head end-->
        <div id="wrapper">
            <!--focus start-->
            <div id="FocusBG">
                <div class="fullSlide">
                    <div class="bd">
                        <ul style="position: relative; width: 1903px; height: 400px;">
                            <li style="position: absolute; width: 1903px; left: 0px; top: 0px; display: list-item; background: url(&quot;./index/img/1.jpg&quot;) 50% 0px no-repeat rgb(255, 127, 0);">
                                <a href="#" target="_blank">
                                </a>
                            </li>
                          
                        </ul>
                    </div>
                    <div class="hd">
                        <ul>
                            <li class="on">
                                1
                            </li>
                            <li class="">
                                2
                            </li>
                            <li class="">
                                3
                            </li>
                        </ul>
                    </div>
                    <span class="prev" style="opacity: 0.136622; display: inline;">
                    </span>
                    <span class="next" style="opacity: 0.136622; display: inline;">
                    </span>
                </div>
                <script type="text/javascript">
                    jQuery(".fullSlide").hover(function() {
                        jQuery(this).find(".prev,.next").stop(true, true).fadeTo("show", 0.5)
                    },
                    function() {
                        jQuery(this).find(".prev,.next").fadeOut()
                    });
                    jQuery(".fullSlide").slide({
                        titCell: ".hd ul",
                        mainCell: ".bd ul",
                        effect: "fold",
                        autoPlay: true,
                        autoPage: true,
                        trigger: "click",
                        startFun: function(i) {
                            var curLi = jQuery(".fullSlide .bd li").eq(i);
                            if ( !! curLi.attr("_src")) {
                                curLi.css("background-image", curLi.attr("_src")).removeAttr("_src")
                            }
                        }
                    });
                </script>
            </div>
            <!--focus end-->
            <div class="HeightTab clearfix">
            </div>
            <!--body start-->
            <div id="body">
                <!--cent start-->
                <div class="List_Bg_Grey">
                    <div class="List_Box">
                        <div class="TitStyle_01">
                            <div class="TitStyle_Letter">
                                W
                            </div>
                            <div class="TitStyle_English">
                                Our Advantage
                            </div>
                            <div class="TitStyle_Name">
                                为什么要做微信分销？
                            </div>
                        </div>
                    </div>
                    <div class="LD_list01">
                        <div class="mainCon01">
                            <ul>
                                <li>
                                    <div class="item">
                                        <div class="head head_b2b">
                                        </div>
                                        <div>
                                            <div class="title">
                                                开启全新的微商模式
                                            </div>
                                            <p class="content">
                                                打造以分销商为中心的全新微信分销体验让粉丝实时有效的获取朋友圈流量并快速分享购买分佣。
                                            </p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="item">
                                        <div class="head head_cus">
                                        </div>
                                        <div>
                                            <div class="title">
                                                360度全方位运营朋友圈
                                            </div>
                                            <p class="content">
                                                通过合理有效的分销商管理方式和粉丝行为微信分享，帮您显著提升销售效率。
                                            </p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="item">
                                        <div class="head head_mail">
                                        </div>
                                        <div>
                                            <div class="title">
                                                全方位消息提醒
                                            </div>
                                            <p class="content">
                                                精准的分佣提醒，下线粉丝提醒，丰富的提醒模式和强大的追踪功能，智能的提醒方式是分销系统必不可缺的制胜利器。
                                            </p>
                                        </div>
                                    </div>
                                </li>
                                <li class="second_line">
                                    <div class="item">
                                        <div class="head head_mobile">
                                        </div>
                                        <div>
                                            <div class="title">
                                                多种能营销插件 制胜法宝
                                            </div>
                                            <p class="content">
                                                系统集成多种营销插件，拼团商城，积分商城，砍价，多商户，人人商城助你狠狠的黏住您的客户。
                                            </p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="item">
                                        <div class="head head_bus">
                                        </div>
                                        <div>
                                            <div class="title">
                                                分销分佣，拥有更广阔的业务前景
                                            </div>
                                            <p class="content">
                                                强大的数据管理功能，帮您获得更多营销机会，系统拥有国内最领先的触发机制，让您真正实现精准营销。
                                            </p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="item">
                                        <div class="head head_manager">
                                        </div>
                                        <div>
                                            <div class="title">
                                                前所未有的多渠道运营，一马当先
                                            </div>
                                            <p class="content">
                                                科学直观的呈现运营数据，瞬间掌握业务运作情况，洞察分销效率。最终，前所未有的管理方式，帮助企业走向成功的巅峰。
                                            </p>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="List_Bg_White">
                    <div class="cent_box">
                        <div class="clearfix btbor">
                        </div>
                        <div class="clearfix">
                            <div class="big_tt">
                                <h1>
                                    微信分销价值体现
                                </h1>
                            </div>
                            <div class="fx_cent fx_cent01">
                                <img src="./index/wimg2.jpg">
                                <div class="jiazhi-01">
                                    开店成本低
                                </div>
                                <div class="jiazhi-02">
                                    开店速度快
                                </div>
                                <div class="jiazhi-03">
                                    管理更便捷
                                </div>
                                <div class="jiazhi-04">
                                    传播力度大
                                </div>
                                <div class="jiazhi-05">
                                    销售效率高
                                </div>
                                <div class="jiazhi-06">
                                    可控制性强
                                </div>
                                <div class="jiazhi-07">
                                    专为微信打造
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="List_Bg_Grey">
                        <div class="List_Box">
                            <div class="TitStyle_01">
                                <div class="TitStyle_Letter">
                                    C
                                </div>
                                <div class="TitStyle_English">
                                    Core Value
                                </div>
                                <div class="TitStyle_Name">
                                    微信分销为企业带来四大核心价值
                                </div>
                            </div>
                        </div>
                        <div class="cent_box cent_box_none">
                            <div class="kps">
                                <div class="ksp">
                                    <div class="clearfix btbor">
                                        <div class="fx_cent">
                                            <div class="jz_img1">
                                                <img src="./index/wimg_lt1.jpg">
                                            </div>
                                            <div class="jz_cent1">
                                                <p class="jzcent_tt" style="margin-top:70px;">
                                                    <i class="img1">
                                                    </i>
                                                    全员分销，更多人帮您卖产品
                                                </p>
                                                <p class="jzcent_tt1">
                                                    微信多级分销，三级分佣模式
                                                </p>
                                                <p class="ite">
                                                    <i class="blue">
                                                        ●
                                                    </i>
                                                    多级分销模式，每个分销商都可以发展下级分销商
                                                </p>
                                                <p class="ite">
                                                    <i class="blue">
                                                        ●
                                                    </i>
                                                    演绎圈子裂变理论，覆盖更多人群
                                                </p>
                                                <p class="ite">
                                                    <i class="blue">
                                                        ●
                                                    </i>
                                                    每个分销商佣金来自两个部分：
                                                </p>
                                                <p class="ite">
                                                    &nbsp; &nbsp; &nbsp;1、销售产品佣金 &nbsp; 2、发展下级分销商
                                                </p>
                                            </div>
                                            <div class="clear">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix btbor">
                                <div class="fx_cent">
                                    <div class="jz_cent2">
                                        <p class="jzcent_tt">
                                            <i class="img2">
                                            </i>
                                            万店同源，轻松管理成千上万的微店
                                        </p>
                                        <p class="jzcent_tt2">
                                            基于云端模式，一个总部微信商城
                                            <br>
                                            可以演变出成千上万个分销子店
                                        </p>
                                    </div>
                                    <div class="jz_img2">
                                        <img src="./index/wimg_lt2.jpg">
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix btbor">
                                <div class="fx_cent">
                                    <div class="jz_img3">
                                        <img src="./index/wimg_lt3.jpg">
                                    </div>
                                    <div class="jz_cent3">
                                        <p class="jzcent_tt" style="margin-top:115px;">
                                            <i class="img3">
                                            </i>
                                            万客合一，迅速积累百万粉丝
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix" style="padding-bottom:50px;">
                                <div class="fx_cent">
                                    <div class="jz_cent4">
                                        <p class="jzcent_tt" style="text-align:center;">
                                            <i class="img4">
                                            </i>
                                            投入少，见效快
                                        </p>
                                    </div>
                                    <div class="jz_img4">
                                        <img src="./index/wimg_lt4.jpg">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--cent end-->
                    <div class="HeightTab clearfix">
                    </div>
                    <!--MainBlock start-->
                    <div class="MainBlockBG">
                        <div class="MainBlock">
                            <!--left start-->
                            
                            <!--left end-->
                            <div class="WidthTab2">
                            </div>
                            
                            <!--right end-->
                            <div class="HeightTab clearfix">
                            </div>
                            
                        </div>
                    </div>
                    <!--MainBlock end-->
                    <div class="clearfix">
                    </div>
                </div>
                <!--body end-->
                <div class="clearfix">
                </div>
                <!--footer start-->
                <div id="footer"  style="height:100px;">
                    <div class="inner">
                        <div class="InnerLeft">
                            <p>
                                <a href="#">
                                    网站首页
                                </a>
                                |
                                <a href="index.php?c=user&a=login">
                                    登录
                                </a>
                                |
                                <a href="index.php?c=user&a=register">
                                    注册
                                </a>
                                
                            </p>
                            <p>
                               <?php  echo $copyright['footerleft'];?>
                                <a href="#" >
                                    <?php  echo $copyright['company'];?> 版权所有 <?php  echo $copyright['footerright'];?>
                                </a>
                            </p>
                           
                                <p>
                                    QQ：<?php  echo $copyright['qq'];?>  联系电话：<?php  echo $copyright['phone'];?> 公司地址：<?php  echo $copyright['address'];?>
                                </p>
								
                            
                           
                         
                        </div>
                        <div class="InnerRight">
                            <div class="tel">
                                24小时咨询热线：<?php  echo $copyright['phone'];?>
                            </div>
                            <div class="SearchTop">
                                
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
                <!--footer end -->
            </div>
            <!-- Powered By HituxCMS ASP V2.1 -->
        </div>
        <div class="sogoutip" style="z-index: 2147483645; visibility: hidden; display: none;">
        </div>
        <div class="sogoubottom" id="sougou_bottom" style="display: none;">
        </div>
        <div id="ext_stophi" style="z-index: 2147483647;">
            <div class="extnoticebg">
            </div>
            <div class="extnotice">
                <p id="sogouconfirmtxt">
                </p>
               
            </div>
        </div>
        <div id="ext_overlay" class="ext_overlayBG" style="display: none; z-index: 2147483646;">
        </div>
        <iframe class="sogou_sugg_feedbackquan" frameborder="0" scrolling="no"
        src="./index/yun6.html" style="border: none; display: none; height: 84px; width: 100%; z-index: 2147483645; background: transparent;">
        </iframe>
    </body>

</html>
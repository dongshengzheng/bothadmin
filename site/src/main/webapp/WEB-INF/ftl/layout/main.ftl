<!DOCTYPE html PUBLIC “-//W3C//DTD XHTML 1.0 Transitional//EN” “http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd“>
<!-- TODO在生产环境时改成CDN配置 -->
<#import "/spring.ftl" as spring />

<#setting url_escaping_charset='utf-8'>
<#macro htmlHead
title="金石典当"
keywords="金石典当"
description="金石典当"
>
<!--[if IE 7]> <html class="ie ie7"> <![endif]-->
<!--[if IE 8]> <html class="ie ie8"> <![endif]-->
<!--[if IE 9]> <html class="ie ie9"> <![endif]-->
<!--[if !IE]><!-->
<html> <!--<![endif]-->
<head>
    <title>${title}</title>
    <!-- Meta -->
    <meta charset="utf-8">
<#--<meta http-equiv="X-UA-Compatible" content="IE=edge">-->
    <meta name="google-site-verification" content="cxKH1Vbdr20SBnMXhiWbRKo1b0TbsdfDmTc2UkdibMQ"/>
    <meta name="baidu-site-verification" content="H4TrQkGdEQ"/>
    <meta property="csaiapi" content="8e296a067a375633"/>
    <meta http-equiv="X-UA-Compatible" content="IE=10; IE=9; IE=8">
    <meta http-equiv="Content-Language" content="zh-CN">
    <meta name="keywords" content="${keywords}">
    <meta name="description" content="${description}">
    <meta name="author" content="金石典当">
    <meta name="Owner" content="金石典当">
    <meta name="renderer" content="webkit">
    <meta name="360-site-verification" content="31d01ce20ae90f9c2b20f572bdb494d0"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- 全局CSS-->
    <link rel="shortcut icon" href="${staticPath}/assets/img/favicon.ico.png">
    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="${staticPath}/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${staticPath}/assets/css/style.css">

    <!-- CSS Header and Footer -->
    <link rel="stylesheet" href="${staticPath}/assets/css/headers/header-v5.css">
    <link rel="stylesheet" href="${staticPath}/assets/css/footers/footer-v4.css">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="${staticPath}/assets/plugins/animate.css">
    <link rel="stylesheet" href="${staticPath}/assets/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="${staticPath}/assets/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${staticPath}/assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="${staticPath}/assets/plugins/owl-carousel/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="${staticPath}/assets/plugins/revolution-slider/rs-plugin/css/settings.css">
    <!-- CSS Theme -->
    <link rel="stylesheet" href="http://htmlstream.com/preview/unify-v1.9/Shop-UI/assets/css/theme-colors/teal.css"
          id="style_color">
    <!-- CSS Customization -->
    <link rel="stylesheet" href="${staticPath}/assets/css/custom.css">
    <link rel="stylesheet" href="${staticPath}/assets/css/jsdd/main.css">
    <#nested/>

    <#--<script type="text/javascript">-->
        <#--var _contextPath = "${rc.contextPath}";-->
        <#--var _staticPath = "${staticPath}";-->
        <#--var current_url = window.location.href;-->

        <#--// 获取文档模式-->
        <#--engine = null;-->
        <#--if (window.navigator.appName == "Microsoft Internet Explorer") {-->
            <#--if (document.documentMode) // IE8-->
                <#--engine = document.documentMode;-->
            <#--else // IE 5-7-->
            <#--{-->
                <#--engine = 5; // Assume quirks mode unless proven otherwise-->
                <#--if (document.compatMode) {-->
                    <#--if (document.compatMode == "CSS1Compat")-->
                        <#--engine = 7; // standards mode-->
                <#--}-->
            <#--}-->
        <#--}-->

        <#--if ((navigator.userAgent.indexOf("MSIE 7.") > 0-->
                <#--|| navigator.userAgent.indexOf("MSIE 6.") > 0 || (engine != null && engine <= 7)) && current_url.indexOf("obsolete.html") <= 0) {-->
            <#--location.href = _contextPath + '/obsolete.html';-->
        <#--}-->
        <#--params.autoSaveAdvertisementFrom();-->
    <#--</script>-->
</head>
</#macro>

<#macro htmlBody>
<spring:htmlEscape defaultHtmlEscape="true"/>
<body>
<!--=== top信息 ===-->
<div class="wrapper">
    <!--=== header信息 ===-->
    <div class="header-v5 header-static" style="height: 70px;">
        <div class="container">
            <div class="row" style="">
                <!--log-->
                <div class="col-md-3">
                    <a class="" href="index1.html">
                        <img id="" style="margin: 12px 0px 6px 0px;display: block"
                             src="http://localhost:8080/assets/img/index/logo.png"
                             alt="Logo">
                    </a>
                </div>
                <!--/log-->

                <!--shouye-->
                <div class="col-md-1 text-center" style="height: 100%;">
                    <div  style="" class="header_tab_active index_head_tab">
                        <a style="text-decoration:none " href="${staticPath}">
                            <h3 id="sy" style="margin-top: 20px">首页</h3></a></div>
                </div>
                <!--/shouye-->

                <!--zuopingdengji-->
                <div  class="col-md-2 text-center index_head_tab" style="height: 100%;">
                    <div style="width: 120px;">
                        <a style="text-decoration:none;" href="${staticPath}/works/register">
                            <h3 id="zpdj" style="margin-top: 20px">作品登记</h3></a>
                    </div>
                </div>
                <!--/zuopingdengji-->

                <!--search-->
                <div class="col-md-4">
                    <div class="input-group" style="margin-top: 18px">
                        <input type="text" class="form-control" placeholder="输入要搜索的作品或用户">
                        <span class="input-group-btn">
							<button class="btn" type="button" style="color: white;background: #D70016">搜作品</button>
							<button class="btn" type="button" style="color: white;background: #FB591D;margin-left: 3px">搜用户</button>
						</span>
                    </div>
                </div>
                <!--/search-->
                <!---login-->


                <!--/login-->
            </div>
        </div>
    </div>
    <!--/header-->
    <!--=== header信息结束 ===-->

    <!--=== body信息 === -->
    <#nested/>
    <!--=== body信息结束 === -->

    <!--=== Footer信息 ===-->

    <!--=== Footer信息结束 ===-->
    <div class="footer-v4">
        <div class="copyright">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 ">
                        <p>
                            2016 &copy; 金石典当. ALL Rights Reserved.
                            <!--<a target="_blank" href="">Htmlstream</a> | <a href="register_work.html#">Privacy Policy</a> | <a-->
                            <!--href="register_work.html#">Terms of Service</a>-->
                        </p>
                    </div>
                    <div class="col-md-6">
                        <ul class="list-inline sponsors-icons pull-right">
                            <!--<li><i class="fa fa-cc-paypal"></i></li>-->
                            <!--<li><i class="fa fa-cc-visa"></i></li>-->
                            <!--<li><i class="fa fa-cc-mastercard"></i></li>-->
                            <!--<li><i class="fa fa-cc-discover"></i></li>-->
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</#macro>
<#macro footerJS>
<!-- 全局JS -->
<!-- JS Global Compulsory -->
<script src="${staticPath}/assets/plugins/jquery/jquery.min.js"></script>
<script src="${staticPath}/assets/plugins/jquery/jquery-migrate.min.js"></script>
<script src="${staticPath}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script src="${staticPath}/assets/plugins/back-to-top.js"></script>
<script src="${staticPath}/assets/plugins/smoothScroll.js"></script>
<script src="${staticPath}/assets/plugins/jquery.parallax.js"></script>
<script src="${staticPath}/assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
<script src="${staticPath}/assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="${staticPath}/assets/plugins/revolution-slider/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
<script src="${staticPath}/assets/plugins/revolution-slider/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
<!-- JS Customization -->
<script src="${staticPath}/assets/js/custom.js"></script>
<!-- JS Page Level -->
<script src="${staticPath}/assets/js/shop.app.js"></script>
<script src="${staticPath}/assets/js/plugins/owl-carousel.js"></script>
<script src="${staticPath}/assets/js/plugins/revolution-slider.js"></script>
<script src="${staticPath}/assets/js/plugins/style-switcher.js"></script>
<#--模板-->
<script src="${staticPath}/assets/js/mustache.js"></script>
<!-- 全局JS结束 -->
    <#nested/>
</body>
<script>
    jQuery(document).ready(function () {
        App.init();
        App.initScrollBar();
        App.initParallaxBg();
        OwlCarousel.initOwlCarousel();
        RevolutionSlider.initRSfullWidth();
        StyleSwitcher.initStyleSwitcher();

//        $("#sy").bind("click",function (e) {
//            $("#zpdj").removeClass("header_tab_active");
//            $(this).addClass("header_tab_active");
//        });
//
//        $("#zpdj").bind("click",function (e) {
//            $("#sy").removeClass("header_tab_active");
//            $(this).addClass("header_tab_active");
//        });
    });
</script>
</html>
</#macro>

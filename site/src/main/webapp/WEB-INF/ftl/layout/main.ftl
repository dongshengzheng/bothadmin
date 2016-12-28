<!DOCTYPE html>
<#import "/spring.ftl" as spring />

<#setting url_escaping_charset='utf-8'>
<#macro htmlHead
title="金石典当"
keywords="金石典当"
description="金石典当"
>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en"> <!--<![endif]-->
<head>
    <title>${title}</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Web Fonts -->
    <link rel='stylesheet' type='text/css'
          href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,800&subset=cyrillic,latin'>

    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="${staticPath}/static/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${staticPath}/static/css/shop.style.css">

    <!-- CSS Header and Footer -->
    <link rel="stylesheet" href="${staticPath}/static/css/headers/header-v5.css">
    <link rel="stylesheet" href="${staticPath}/static/css/footers/footer-v4.css">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="${staticPath}/static/plugins/animate.css">
    <link rel="stylesheet" href="${staticPath}/static/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="${staticPath}/static/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${staticPath}/static/plugins/scrollbar/css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="${staticPath}/static/plugins/owl-carousel/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="${staticPath}/static/plugins/revolution-slider/rs-plugin/css/settings.css">
    <link rel="stylesheet" href="${staticPath}/assets/css/blocks.css">
    <link rel="stylesheet" href="${staticPath}/static/css/custom.css">
    <script src="${staticPath}/assets/plugins/jquery/jquery.min.js"></script>
    <script src="${staticPath}/assets/plugins/jquery/jquery-migrate.min.js"></script>
    <script type="text/javascript">
        function nofind(type){
            var img=event.srcElement;
            //1 作品 2 用户头像
            if(type == '1'){
                img.src="http://windyeel.oss-cn-shanghai.aliyuncs.com/global/img/default.png";
            }
            img.onerror=null;
        }
    </script>
    <#nested/>
</head>
</#macro>
<#macro htmlBody>
<spring:htmlEscape defaultHtmlEscape="true"/>
<body>
<div class="wrapper">
    <div class="header-v5 header-static">
        <div class="topbar-v3">
            <div class="container">
                <div class="row">
                    <div class="col-sm-offset-6 col-sm-6">
                        <ul class="list-inline right-topbar pull-right">
                            <li id="login">

                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="navbar navbar-default mega-menu" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse"
                            data-target=".navbar-responsive-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/">
                        <img id="logo-header" src="${staticPath}/static/img/logo.png" alt="Logo">
                    </a>
                </div>
                <div class="collapse navbar-collapse navbar-responsive-collapse">
                    <ul class="nav navbar-nav">
                        <li id="headerHome"><a href="/">首页</a></li>
                        <li id="headerWorks"><a href="/works/add">作品登记</a></li>
                        <li>
                            <form id="search_form" action="" method="get" style="padding: 25px 18px 22px;">
                                <div class="input-group">
                                    <input id="keywords" name="keywords" type="text" class="form-control"
                                           placeholder="搜索作品/用户">
                                    <span class="input-group-btn">
                                        <button id="searchworksbtn" class="btn" type="button"
                                                style="color: white;background: #D70016">搜作品</button>
                                        <button class="btn" type="button"
                                                style="color: white;background: #FB591D;margin-left: 3px">
                                            搜用户
                                        </button>
                                    </span>
                                </div>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <#nested/>
    <div class="footer-v4">
        <div class="copyright">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 ">
                        <p>
                            2016 &copy; 金石典当. ALL Rights Reserved.
                        </p>
                    </div>
                    <div class="col-sm-6">
                        <ul class="list-inline sponsors-icons pull-right">
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</#macro>
<#macro footerJS>

<script src="${staticPath}/assets/plugins/jquery/jquery.validate.min.js"></script>
<script src="${staticPath}/assets/plugins/jquery/jquery.form.min.js"></script>
<script src="${staticPath}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${staticPath}/assets/plugins/back-to-top.js"></script>
<script src="${staticPath}/assets/plugins/smoothScroll.js"></script>
<script src="${staticPath}/assets/plugins/jquery.parallax.js"></script>
<script src="${staticPath}/assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
<script src="${staticPath}/assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="${staticPath}/assets/plugins/revolution-slider/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
<script src="${staticPath}/assets/plugins/revolution-slider/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
<script src="${staticPath}/assets/plugins/jquery/jquery.validate.min.js"></script>
<script src="${staticPath}/assets/js/app.js"></script>
<script src="${staticPath}/assets/js/custom.js"></script>
<script src="${staticPath}/assets/js/plugins/owl-carousel.js"></script>
<script src="${staticPath}/assets/js/plugins/revolution-slider.js"></script>
<script src="${staticPath}/assets/js/plugins/style-switcher.js"></script>

<script src="${staticPath}/assets/js/mustache.js"></script>

    <#nested/>
</body>
<script>

    $.ajaxSetup({
        complete:function(XMLHttpRequest,textStatus){
            if(textStatus=="parsererror"){

            } else if(textStatus=="error"){

            }
        }
    });

    jQuery(document).ready(function () {
        App.init();
        App.initScrollBar();
        App.initParallaxBg();
        OwlCarousel.initOwlCarousel();
        RevolutionSlider.initRSfullWidth();
        StyleSwitcher.initStyleSwitcher();

        var search_form = $("#search_form");

        $("#searchworksbtn").bind("click", function () {
            var key = $("#keywords").val();
            if (!key) {
                alert("请输入搜索作品关键字");
            } else {
                search_form.attr("action", "${staticPath}/works/search?keywords=" + key);
                search_form.submit();
            }
        });
        $.ajax({
            type: "GET",
            url: '${staticPath}/loginStatus',
            dataType: 'json',
            success: function (result) {
                if (result.suc) {
                    $("#login")[0].innerHTML = '<a href="${staticPath}/user">'+result.loginName+'</a>';
                } else {
                    $("#login")[0].innerHTML = '<a href="${staticPath}/login">登录</a> | <a href="${staticPath}/register">注册</a>';
                }
            }
        });
    });
</script>
</html>
</#macro>

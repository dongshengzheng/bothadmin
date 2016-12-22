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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="shortcut icon" href="${staticPath}/assets/img/favicon.ico.png">
    <link rel="stylesheet" href="${staticPath}/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${staticPath}/assets/css/style.css">

    <link rel="stylesheet" href="${staticPath}/assets/css/headers/header-v5.css">
    <link rel="stylesheet" href="${staticPath}/assets/css/footers/footer-v4.css">

    <link rel="stylesheet" href="${staticPath}/assets/plugins/animate.css">
    <link rel="stylesheet" href="${staticPath}/assets/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="${staticPath}/assets/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${staticPath}/assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="${staticPath}/assets/plugins/owl-carousel/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="${staticPath}/assets/plugins/revolution-slider/rs-plugin/css/settings.css">
    <link rel="stylesheet" href="${staticPath}/assets/css/custom.css">
    <link rel="stylesheet" href="${staticPath}/assets/css/jsdd/main.css">
    <#nested/>
</head>
</#macro>
<#macro htmlBody>
<spring:htmlEscape defaultHtmlEscape="true"/>
<body>
<div class="wrapper">
    <div class="header-v5 header-static" style="height: 70px;">
        <div class="container">
            <div class="row" style="">
                <div class="col-sm-3">
                    <a class="" href="/">
                        <img id="" style="margin: 12px 0px 6px 0px;display: block"
                             src="${staticPath}/assets/img/index/logo.png">
                    </a>
                </div>
                <div class="col-sm-1 text-center">
                    <div id="headerHome" class="index_head_tab">
                        <a style="text-decoration:none" href="/">
                            <h3 style="margin-top: 20px">首页</h3>
                        </a>
                    </div>
                </div>
                <div class="col-sm-2 text-center">
                    <div id="headerWorks" style="width: 120px;" class="index_head_tab">
                        <a style="text-decoration:none;" href="${staticPath}/works/add">
                            <h3 style="margin-top: 20px">作品登记</h3>
                        </a>
                    </div>
                </div>
                <div class="col-sm-4">
                    <form id="search_form" action="" method="get">
                        <div class="input-group" style="margin-top: 18px">
                            <input id="keywords" name="keywords" type="text" class="form-control"
                                   placeholder="输入要搜索的作品或用户">
                            <span class="input-group-btn">
							<button id="searchworksbtn" class="btn" type="button"
                                    style="color: white;background: #D70016">搜作品</button>
							<button class="btn" type="button" style="color: white;background: #FB591D;margin-left: 3px">搜用户</button>
						</span>
                        </div>
                    </form>
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
<script src="${staticPath}/assets/plugins/jquery/jquery.min.js"></script>
<script src="${staticPath}/assets/plugins/jquery/jquery-migrate.min.js"></script>
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
    });
</script>
</html>
</#macro>

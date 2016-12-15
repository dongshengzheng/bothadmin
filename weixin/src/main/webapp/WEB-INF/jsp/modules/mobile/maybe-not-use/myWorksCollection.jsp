<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../pawn2/include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>收藏作品</title>
    <link rel="stylesheet" href="${ctxStatic}/css/custom.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/weui.min.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/jquery-weui.min.css"/>

    <script src="${ctxStatic}/js/jquery-2.1.4.js"></script>
    <script src="${ctxStatic}/js/jquery-weui.js"></script>
    <script src="${ctxStatic}/js/swiper.js"></script>
    <style>
        .weui-tabbar__item.weui-bar__item_on .weui-tabbar__label {
            color: #9F504D;
        }

        .weui-navbar {
            width: 96%;
            margin: 1%;
            border: 1px solid #2698DE;
            border-radius: 5px;
        }

        .weui-navbar__item.weui-bar__item_on {
            background-color: #2698DE;
            color: white;
        }

        .weui-navbar__item {
            border: 1px solid #2698DE;
            background-color: white;
            color: #2698DE;
        }

        .weui-media-box__thumb {
            border-radius: 50%;
        }

        .works-floor-btn-all {
            background-color: white;
            border: none;
        }


    </style>

</head>
<body>
<div class="weui-tab">
    <div class="weui-navbar">
        <div class="weui-navbar__item" id="transfer-title">
            转让作品
        </div>
        <div class="weui-navbar__item weui-bar__item_on" id="collection-title">
            收藏作品
        </div>
        <div class="weui-navbar__item" id="foucs-title">
            关注用户
        </div>
    </div>
</div>

<div class="fixed-footer-blank">

</div>


<div id="collection-works" class="div-outer">
    <div class="works-all-outer">
        <div class="works-all">
            <img src="${ctxStatic}/img/swiper/swiper-2.jpg" alt="" class="works-img-all"/>
            <textarea class="works-intro-all">新疆和田玉籽料,原皮原色,可玩可做,底部带一块僵,宽33毫米,厚15毫米,高53毫米,重41克.</textarea>
        </div>
        <div class="works-floor-all">
            <span class="works-floor-name-all">冰阳绿树叶吊坠</span>
            <span class="works-floor-btn-all">&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <span class="works-floor-img-all">田黄鸡血石</span>
            <span class="works-floor-date-all">2016-12-4</span>
        </div>
    </div>
    <div class="works-all-outer">
        <div class="works-all">
            <img src="${ctxStatic}/img/swiper/swiper-2.jpg" alt="" class="works-img-all"/>
            <textarea class="works-intro-all">新疆和田玉籽料,原皮原色,可玩可做,底部带一块僵,宽33毫米,厚15毫米,高53毫米,重41克.</textarea>
        </div>
        <div class="works-floor-all">
            <span class="works-floor-name-all">冰阳绿树叶吊坠</span>
            <span class="works-floor-btn-all">&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <span class="works-floor-img-all">田黄鸡血石</span>
            <span class="works-floor-date-all">2016-12-4</span>
        </div>
    </div>
    <div class="works-all-outer">
        <div class="works-all">
            <img src="${ctxStatic}/img/swiper/swiper-2.jpg" alt="" class="works-img-all"/>
            <textarea class="works-intro-all">新疆和田玉籽料,原皮原色,可玩可做,底部带一块僵,宽33毫米,厚15毫米,高53毫米,重41克.</textarea>
        </div>
        <div class="works-floor-all">
            <span class="works-floor-name-all">冰阳绿树叶吊坠</span>
            <span class="works-floor-btn-all">&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <span class="works-floor-img-all">田黄鸡血石</span>
            <span class="works-floor-date-all">2016-12-4</span>
        </div>
    </div>
    <div class="works-all-outer">
        <div class="works-all">
            <img src="${ctxStatic}/img/swiper/swiper-2.jpg" alt="" class="works-img-all"/>
            <textarea class="works-intro-all">新疆和田玉籽料,原皮原色,可玩可做,底部带一块僵,宽33毫米,厚15毫米,高53毫米,重41克.</textarea>
        </div>
        <div class="works-floor-all">
            <span class="works-floor-name-all">冰阳绿树叶吊坠</span>
            <span class="works-floor-btn-all">&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <span class="works-floor-img-all">田黄鸡血石</span>
            <span class="works-floor-date-all">2016-12-4</span>
        </div>
    </div>
    <div class="hr-text ">
        <center>
            <hr>
            <span>&nbsp;&nbsp;到底啦&nbsp;&nbsp;</span></center>
    </div>
</div>


<div class="fixed-footer">
    <div class="weui-tabbar">
        <a href="indexWorks.html" class="weui-tabbar__item ">
            <div class="weui-tabbar__icon">
                <img src="${ctxStatic}/img/cut/首页.png" alt="">
            </div>
            <p class="weui-tabbar__label">首页</p>
        </a>
        <a href="../pawn2/worksRegister1.jsp" class="weui-tabbar__item">
            <div class="weui-tabbar__icon">
                <img src="${ctxStatic}/img/cut/登记申请.png" alt="">
            </div>
            <p class="weui-tabbar__label">登记申请</p>
        </a>
        <a href="../pawn2/my.jsp" class="weui-tabbar__item weui-bar__item_on">
            <div class="weui-tabbar__icon">
                <img src="${ctxStatic}/img/cut/我的_ed.png" alt="">
            </div>
            <p class="weui-tabbar__label">我的</p>
        </a>
    </div>
</div>
<div class="bottom-blank">
</div>


<script>
    $(function () {
        $("#transfer-title").click(function () {
            $('#tranfer-works').addClass('div-on').siblings('.div-hide').removeClass('div-on');
        })
        $("#collection-title").click(function () {
            $('#collection-works').addClass('div-on').siblings('.div-hide').removeClass('div-on');
        })
        $("#foucs-title").click(function () {
            $('#focus-people').addClass('div-on').siblings('.div-hide').removeClass('div-on');
        })
    })

    $(function () {
        $('.weui-tabbar__item').on('click', function () {
            $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
        });

        $('.weui-navbar__item').on('click', function () {
            $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
        });
    });


</script>
</body>
</html>
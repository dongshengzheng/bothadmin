<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>转让-收藏-关注</title>
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

        .weui-navbar__item.weui-bar__item_on {
            color: #74B8E7;
            background-color: white;
            border-bottom: 3px solid #74B8E7;
        }

        .weui-media-box__thumb {
            border-radius: 50%;
        }

        .works-floor-btn-all {
            background-color: white;
            border: none;
        }

        .transfer-img {
            position: absolute;
            transform: rotate(40deg);
            top: 50px;
            left: 100px;
            width: 70px;
            height: 70px;
            background-color: white;
            z-index: 100;

        }

    </style>


</head>
<body>
<div class="weui-tab">
    <div class="weui-navbar">
        <div class="weui-navbar__item weui-bar__item_on" id="transfer-title">
            转让作品
        </div>
        <div class="weui-navbar__item" id="collection-title">
            收藏作品
        </div>
        <div class="weui-navbar__item" id="foucs-title">
            关注用户
        </div>
    </div>
</div>

<div class="fixed-footer-blank">

</div>


<div id="tranfer-works" class="div-hide div-on div-outer">
    <div class="works-all-outer">
        <div class="works-all">
            <img src="img/cut/已转出.png" class="transfer-img">
            <img src="img/swiper/swiper-1.jpg" alt="" class="works-img-all"/>
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
            <img src="img/cut/已转入.png" class="transfer-img">
            <img src="img/swiper/swiper-1.jpg" alt="" class="works-img-all"/>
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
            <img src="img/cut/待确认.png" class="transfer-img">
            <img src="img/swiper/swiper-1.jpg" alt="" class="works-img-all"/>
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
            <img src="img/cut/待对方确认.png" class="transfer-img">
            <img src="img/swiper/swiper-1.jpg" alt="" class="works-img-all"/>
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

<div id="collection-works" class="div-hide div-outer">
    <div class="works-all-outer">
        <div class="works-all">
            <img src="img/swiper/swiper-2.jpg" alt="" class="works-img-all"/>
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
            <img src="img/swiper/swiper-2.jpg" alt="" class="works-img-all"/>
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
            <img src="img/swiper/swiper-2.jpg" alt="" class="works-img-all"/>
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
            <img src="img/swiper/swiper-2.jpg" alt="" class="works-img-all"/>
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

<div id="focus-people" class="div-hide div-outer">
    <div class="weui-panel weui-panel_access">
        <div class="weui-panel__bd">
            <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
                <div class="weui-media-box__hd">
                    <img class="weui-media-box__thumb"
                         src="img/headImg/3.jpg"
                         alt="">
                </div>
                <div class="weui-media-box__bd">
                    <h4 class="weui-media-box__title">老特福德永恒</h4>
                    <p class="weui-media-box__desc search-results-one-info-location">长沙</p>
                    <p class="weui-media-box__desc">作品:36 &nbsp;粉丝:6</p>
                    <div class="search-results-one-care ">
                        <img src="img/cut/to-focus.png" class="search-results-one-care-img"/>
                        <p class="search-results-one-care-text-not ">
                            加关注
                        </p>
                    </div>
                </div>
            </a>
        </div>
    </div>
    <div class="weui-panel weui-panel_access">
        <div class="weui-panel__bd">
            <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
                <div class="weui-media-box__hd">
                    <img class="weui-media-box__thumb"
                         src="img/headImg/3.jpg"
                         alt="">
                </div>
                <div class="weui-media-box__bd">
                    <h4 class="weui-media-box__title">老特福德永恒</h4>
                    <p class="weui-media-box__desc search-results-one-info-location">长沙</p>
                    <p class="weui-media-box__desc">作品:36 &nbsp;粉丝:6</p>
                    <div class="search-results-one-care ">
                        <img src="img/cut/have-focus.png" class="search-results-one-care-img"/>
                        <p class="search-results-one-care-text-have ">
                            已关注
                        </p>
                    </div>
                </div>
            </a>
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
                <img src="img/cut/首页.png" alt="">
            </div>
            <p class="weui-tabbar__label">首页</p>
        </a>
        <a href="worksRegister1.jsp" class="weui-tabbar__item">
            <div class="weui-tabbar__icon">
                <img src="img/cut/登记申请.png" alt="">
            </div>
            <p class="weui-tabbar__label">登记申请</p>
        </a>
        <a href="my.jsp" class="weui-tabbar__item weui-bar__item_on">
            <div class="weui-tabbar__icon">
                <img src="img/cut/我的_ed.png" alt="">
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
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>金石典当</title>
    <link rel="stylesheet" href="${ctxStatic}/css/custom.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/weui.min.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/jquery-weui.min.css"/>

    <script src="${ctxStatic}/js/jquery-2.1.4.js"></script>
    <script src="${ctxStatic}/js/jquery-weui.js"></script>
    <script src="${ctxStatic}/js/swiper.js"></script>
    <style type="text/css">
        .weui-tabbar__item.weui-bar__item_on .weui-tabbar__label {
            color: #9F504D;
        }

        .header-info-care {
            color: white;
            background-color: #169AD8;
            border-radius: 3px;
            border: none;
            position: relative;
        }

        .weui-cells {
            color: gray;
        }

        .weui-media-box__thumb {
            border-radius: 50%;
        }

    </style>
</head>

<body>
<div class="weui-panel weui-panel_access">
    <div class="weui-panel__bd">
        <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
            <div class="weui-media-box__hd">
                <img class="weui-media-box__thumb"
                     src="${ctxStatic}/img/headImg/3.jpg"
                     alt="">
            </div>
            <div class="weui-media-box__bd">
                <h4 class="weui-media-box__title">老特福德永恒</h4>
                <p class="weui-media-box__desc">作品:36 &nbsp;粉丝:6</p>
                <input type="button" value=" + 关注 " class="header-info-care"/>
            </div>
        </a>
    </div>
</div>

<hr/>

<div class="weui-tab">
    <div class="weui-navbar">
        <div class="weui-navbar__item weui-bar__item_on" id="detail-title-info">
            个人资料
        </div>
        <div class="weui-navbar__item" id="detail-title-works">
            Ta的作品
        </div>
        <div class="weui-navbar__item" id="detail-title-fans">
            Ta的粉丝
        </div>
    </div>
</div>

<div class="div-outer">
    <div id="info" class="div-on">
        <div class="weui-cells">
            <div class="weui-cell">
                <div class="weui-cell_bd weui-cell_primary">
                    <p>姓名:</p>
                </div>
                <div class="weui-cell_ft">
                    我是谁
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell_bd weui-cell_primary">
                    <p>住址:</p>
                </div>
                <div class="weui-cell_ft">
                    无锡滨湖区xxxx街道xxxx小区
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell_bd weui-cell_primary">
                    <p>身份证:</p>
                </div>
                <div class="weui-cell_ft">
                    320503201612221992
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell_bd weui-cell_primary">
                    <p>手机号:</p>
                </div>
                <div class="weui-cell_ft">
                    15151999000
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell_bd weui-cell_primary">
                    <p>Email:</p>
                </div>
                <div class="weui-cell_ft">
                    111@qq.com
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell_bd weui-cell_primary">
                    <p>收藏偏好:</p>
                </div>
                <div class="weui-cell_ft">
                    玉器
                </div>
            </div>
        </div>
    </div>

    <div id="works" class="div-hide ">
        <div class="fixed-footer-blank">

        </div>
        <div class="works-all-outer">
            <div class="works-all">
                <img src="${ctxStatic}/img/swiper/swiper-1.jpg" alt="" class="works-img-all"/>
                <textarea class="works-intro-all">新疆和田玉籽料,原皮原色,可玩可做,底部带一块僵,宽33毫米,厚15毫米,高53毫米,重41克.</textarea>
            </div>
            <div class="works-floor-all">
                <span class="works-floor-name-all">冰阳绿树叶吊坠</span>
                <span class="works-floor-btn-all">&nbsp;+&nbsp;收藏&nbsp;</span>
                <span class="works-floor-img-all">田黄鸡血石</span>
                <span class="works-floor-date-all">2016-12-4</span>
            </div>
        </div>
        <div class="works-all-outer">
            <div class="works-all">
                <img src="${ctxStatic}/img/swiper/swiper-1.jpg" alt="" class="works-img-all"/>
                <textarea class="works-intro-all">新疆和田玉籽料,原皮原色,可玩可做,底部带一块僵,宽33毫米,厚15毫米,高53毫米,重41克.</textarea>
            </div>
            <div class="works-floor-all">
                <span class="works-floor-name-all">冰阳绿树叶吊坠</span>
                <span class="works-floor-btn-all">&nbsp;+&nbsp;收藏&nbsp;</span>
                <span class="works-floor-img-all">田黄鸡血石</span>
                <span class="works-floor-date-all">2016-12-4</span>
            </div>
        </div>
        <div class="works-all-outer">
            <div class="works-all">
                <img src="${ctxStatic}/img/swiper/swiper-1.jpg" alt="" class="works-img-all"/>
                <textarea class="works-intro-all">新疆和田玉籽料,原皮原色,可玩可做,底部带一块僵,宽33毫米,厚15毫米,高53毫米,重41克.</textarea>
            </div>
            <div class="works-floor-all">
                <span class="works-floor-name-all">冰阳绿树叶吊坠</span>
                <span class="works-floor-btn-all">&nbsp;+&nbsp;收藏&nbsp;</span>
                <span class="works-floor-img-all">田黄鸡血石</span>
                <span class="works-floor-date-all">2016-12-4</span>
            </div>
        </div>
        <div class="works-all-outer">
            <div class="works-all">
                <img src="${ctxStatic}/img/swiper/swiper-1.jpg" alt="" class="works-img-all"/>
                <textarea class="works-intro-all">新疆和田玉籽料,原皮原色,可玩可做,底部带一块僵,宽33毫米,厚15毫米,高53毫米,重41克.</textarea>
            </div>
            <div class="works-floor-all">
                <span class="works-floor-name-all">冰阳绿树叶吊坠</span>
                <span class="works-floor-btn-all">&nbsp;+&nbsp;收藏&nbsp;</span>
                <span class="works-floor-img-all">田黄鸡血石</span>
                <span class="works-floor-date-all">2016-12-4</span>
            </div>
        </div>
    </div>

    <div id="fans" class="div-hide">
        <div class="fixed-footer-blank">

        </div>
        <div class="search-results">
            <div id="not-care-people" class="div-outer">
                <div class="weui-panel__bd" id="test1">
                    <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
                        <div class="weui-media-box__hd">
                            <img class="weui-media-box__thumb"
                                 src="${ctxStatic}/img/headImg/3.jpg"
                                 alt="">
                        </div>
                        <div class="weui-media-box__bd">
                            <h4 class="weui-media-box__title">老特福德永恒</h4>
                            <p class="weui-media-box__desc search-results-one-info-location">长沙</p>
                            <p class="weui-media-box__desc">作品:36 &nbsp;粉丝:6</p>
                            <div class="search-results-one-care not-care div-hide div-on">
                                <img src="${ctxStatic}/img/cut/to-focus.png" class="search-results-one-care-img "/>
                                <p class="search-results-one-care-text-not ">
                                    加关注
                                </p>
                            </div>
                            <div class="search-results-one-care have-care div-hide">
                                <img src="${ctxStatic}/img/cut/have-focus.png" class="search-results-one-care-img "/>
                                <p class="search-results-one-care-text-have ">
                                    已关注
                                </p>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div id="have-care-people" class="div-outer">
                <div class="weui-panel__bd" id="test2">
                    <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
                        <div class="weui-media-box__hd">
                            <img class="weui-media-box__thumb"
                                 src="${ctxStatic}/img/headImg/4.jpg"
                                 alt="">
                        </div>
                        <div class="weui-media-box__bd">
                            <h4 class="weui-media-box__title">致明日的信</h4>
                            <p class="weui-media-box__desc search-results-one-info-location">长沙</p>
                            <p class="weui-media-box__desc">作品:36 &nbsp;粉丝:6</p>
                            <div class="search-results-one-care have-care div-hide div-on">
                                <img src="${ctxStatic}/img/cut/have-focus.png" class="search-results-one-care-img "/>
                                <p class="search-results-one-care-text-have ">
                                    已关注
                                </p>
                            </div>
                            <div class="search-results-one-care not-care div-hide">
                                <img src="${ctxStatic}/img/cut/to-focus.png" class="search-results-one-care-img "/>
                                <p class="search-results-one-care-text-not ">
                                    加关注
                                </p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="weui-panel__bd" id="test3">
                    <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
                        <div class="weui-media-box__hd">
                            <img class="weui-media-box__thumb"
                                 src="${ctxStatic}/img/headImg/5.jpg"
                                 alt="">
                        </div>
                        <div class="weui-media-box__bd">
                            <h4 class="weui-media-box__title">我心永恒</h4>
                            <p class="weui-media-box__desc search-results-one-info-location">长沙</p>
                            <p class="weui-media-box__desc">作品:36 &nbsp;粉丝:6</p>
                            <div class="search-results-one-care have-care div-hide div-on">
                                <img src="${ctxStatic}/img/cut/have-focus.png" class="search-results-one-care-img "/>
                                <p class="search-results-one-care-text-have ">
                                    已关注
                                </p>
                            </div>
                            <div class="search-results-one-care not-care div-hide">
                                <img src="${ctxStatic}/img/cut/to-focus.png" class="search-results-one-care-img "/>
                                <p class="search-results-one-care-text-not ">
                                    加关注
                                </p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="weui-panel__bd" id="test4">
                    <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
                        <div class="weui-media-box__hd">
                            <img class="weui-media-box__thumb"
                                 src="${ctxStatic}/img/headImg/15.jpg"
                                 alt="">
                        </div>
                        <div class="weui-media-box__bd">
                            <h4 class="weui-media-box__title">遇见</h4>
                            <p class="weui-media-box__desc search-results-one-info-location">长沙</p>
                            <p class="weui-media-box__desc">作品:36 &nbsp;粉丝:6</p>
                            <div class="search-results-one-care have-care div-hide div-on">
                                <img src="${ctxStatic}/img/cut/have-focus.png" class="search-results-one-care-img "/>
                                <p class="search-results-one-care-text-have ">
                                    已关注
                                </p>
                            </div>
                            <div class="search-results-one-care not-care div-hide">
                                <img src="${ctxStatic}/img/cut/to-focus.png" class="search-results-one-care-img "/>
                                <p class="search-results-one-care-text-not ">
                                    加关注
                                </p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="weui-panel__bd" id="test5">
                    <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
                        <div class="weui-media-box__hd">
                            <img class="weui-media-box__thumb"
                                 src="${ctxStatic}/img/headImg/11.jpg"
                                 alt="">
                        </div>
                        <div class="weui-media-box__bd">
                            <h4 class="weui-media-box__title">我怀念的</h4>
                            <p class="weui-media-box__desc search-results-one-info-location">长沙</p>
                            <p class="weui-media-box__desc">作品:36 &nbsp;粉丝:6</p>
                            <div class="search-results-one-care have-care div-hide div-on">
                                <img src="${ctxStatic}/img/cut/have-focus.png" class="search-results-one-care-img "/>
                                <p class="search-results-one-care-text-have ">
                                    已关注
                                </p>
                            </div>
                            <div class="search-results-one-care not-care div-hide">
                                <img src="${ctxStatic}/img/cut/to-focus.png" class="search-results-one-care-img "/>
                                <p class="search-results-one-care-text-not ">
                                    加关注
                                </p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="weui-panel__bd" id="test6">
                    <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
                        <div class="weui-media-box__hd">
                            <img class="weui-media-box__thumb"
                                 src="${ctxStatic}/img/headImg/18.jpg"
                                 alt="">
                        </div>
                        <div class="weui-media-box__bd">
                            <h4 class="weui-media-box__title">小禁区之王</h4>
                            <p class="weui-media-box__desc search-results-one-info-location">长沙</p>
                            <p class="weui-media-box__desc">作品:36 &nbsp;粉丝:6</p>
                            <div class="search-results-one-care have-care div-hide div-on">
                                <img src="${ctxStatic}/img/cut/have-focus.png" class="search-results-one-care-img "/>
                                <p class="search-results-one-care-text-have ">
                                    已关注
                                </p>
                            </div>
                            <div class="search-results-one-care not-care div-hide">
                                <img src="${ctxStatic}/img/cut/to-focus.png" class="search-results-one-care-img "/>
                                <p class="search-results-one-care-text-not ">
                                    加关注
                                </p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="hr-text ">
                    <center>
                        <hr>
                        <span>&nbsp;&nbsp;到底啦&nbsp;&nbsp;</span></center>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="include/tab-2.jsp" %>

<div class="js_dialog" id="haveCareDialog" style="display: none;" date-id="">
    <div class="weui-mask"></div>
    <div class="weui-dialog">
        <div class="weui-dialog__hd"><strong class="weui-dialog__title">取消关注</strong></div>
        <div class="weui-dialog__bd">取消关注后将无法看到该用户的相关信息</div>
        <div class="weui-dialog__ft">
            <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_default">取消</a>
            <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary">确定</a>
        </div>
    </div>
</div>

<div class="js_dialog" id="notCareDialog" style="display: none;">
    <div class="weui-mask"></div>
    <div class="weui-dialog">
        <div class="weui-dialog__hd"><strong class="weui-dialog__title">成功关注!</strong></div>
        <div class="weui-dialog__ft">
            <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary">确定</a>
        </div>
    </div>
</div>

</body>
<script src="js/jquery-2.1.4.js"></script>
<script>
    $(function () {
        $("#detail-title-info").click(function () {
            $("#info").attr("class", "div-on");
            $("#works").attr("class", "div-hide");
            $("#fans").attr("class", "div-hide");
        })
    })
    $(function () {
        $("#detail-title-works").click(function () {
            $("#works").attr("class", "div-on");
            $("#info").attr("class", "div-hide");
            $("#fans").attr("class", "div-hide");
        })
    })
    $(function () {
        $("#detail-title-fans").click(function () {
            $("#fans").attr("class", "div-on");
            $("#works").attr("class", "div-hide");
            $("#info").attr("class", "div-hide");
        })
    })

    $(function () {
        $('.weui-tabbar__item').on('click', function () {
            $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
        });
    });

    $(function () {
        $('.weui-navbar__item').on('click', function () {
            $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
        });
    });


    //    关注与取消关注
    var $haveCareDialog = $('#haveCareDialog');
    var $notCareDialog = $('#notCareDialog');
    $('#dialogs').on('click', '.weui-dialog__btn', function () {
        $(this).parents('.js_dialog').fadeOut(200);
    });
    $('.have-care').on('click', function () {
        $haveCareDialog.fadeIn(200);
        $haveCareDialog.attr('data-id', $(this).parent().parent().parent().attr('id'));
    });
    $('.not-care').on('click', function () {
        $notCareDialog.fadeIn(200);
        $(this).removeClass('div-on').siblings('.search-results-one-care').addClass('div-on');
    });
    $('.weui-dialog__btn').on('click', function () {
        $('.js_dialog').fadeOut(200);
    })
    $('#haveCareDialog .weui-dialog__btn_primary').on('click', function () {
        $('#' + ($('#haveCareDialog').attr('data-id')) + ' .have-care').removeClass('div-on').siblings('.search-results-one-care').addClass('div-on');
    })
    $('.weui-media-box__thumb').on('click', function () {
        location.href = 'userInfo.jsp';
    })

</script>

</html>
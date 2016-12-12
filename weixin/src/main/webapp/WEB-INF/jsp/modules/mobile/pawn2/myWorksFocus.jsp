<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>关注用户</title>
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

    </style>


</head>
<body>
<div class="weui-tab">
    <div class="weui-navbar">
        <div class="weui-navbar__item " id="transfer-title">
            转让作品
        </div>
        <div class="weui-navbar__item" id="collection-title">
            收藏作品
        </div>
        <div class="weui-navbar__item weui-bar__item_on" id="foucs-title">
            关注用户
        </div>
    </div>
</div>

<div class="fixed-footer-blank">

</div>


<div id="focus-people" class="div-outer">
    <div class="weui-panel weui-panel_access">
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
    </div>
    <div class="weui-panel weui-panel_access">
        <div class="weui-panel__bd" id="test2">
            <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
                <div class="weui-media-box__hd">
                    <img class="weui-media-box__thumb"
                         src="${ctxStatic}/img/headImg/9.jpg"
                         alt="">
                </div>
                <div class="weui-media-box__bd">
                    <h4 class="weui-media-box__title">梦剧场18号</h4>
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
        <a href="worksRegister1.jsp" class="weui-tabbar__item">
            <div class="weui-tabbar__icon">
                <img src="${ctxStatic}/img/cut/登记申请.png" alt="">
            </div>
            <p class="weui-tabbar__label">登记申请</p>
        </a>
        <a href="my.jsp" class="weui-tabbar__item weui-bar__item_on">
            <div class="weui-tabbar__icon">
                <img src="${ctxStatic}/img/cut/我的_ed.png" alt="">
            </div>
            <p class="weui-tabbar__label">我的</p>
        </a>
    </div>
</div>
<div class="bottom-blank">
</div>

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


    $(function () {
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
    })
</script>
</body>
</html>
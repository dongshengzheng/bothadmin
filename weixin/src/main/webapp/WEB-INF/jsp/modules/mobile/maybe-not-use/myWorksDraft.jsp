<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../pawn2/include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>草稿箱</title>
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

        .relation-btn {
            padding: 3px;
            border-radius: 3px;
            background-color: white;
            color: gray;
            width: 20%;
            margin: 1%;
        }

        .relation-btn-on {
            background-color: #2698DE;
            border: none;
            color: white;
        }

        #reason {
            resize: none;

        }

        .works-floor-btn-all {
            border: 1px dashed;
        }
    </style>


</head>
<body>
<div class="weui-tab">
    <div class="weui-navbar">
        <div class="weui-navbar__item" id="check-title-success">
            审核通过
        </div>
        <div class="weui-navbar__item" id="check-title-now">
            审核中
        </div>
        <div class="weui-navbar__item" id="check-title-failure">
            审核失败
        </div>
        <div class="weui-navbar__item weui-bar__item_on" id="check-title-draft">
            草稿箱
        </div>
    </div>
</div>
<div class="fixed-footer-blank">

</div>


<div id="check-draft-works" class="div-outer">
    <div class="works-all-outer">
        <div class="works-all">
            <img src="${ctxStatic}/img/cut/index-all.png" alt="" class="works-img-all"/>
            <textarea class="works-intro-all">新疆和田玉籽料,原皮原色,可玩可做,底部带一块僵,宽33毫米,厚15毫米,高53毫米,重41克.</textarea>
        </div>
        <div class="works-floor-all">
            <span class="works-floor-name-all">冰阳绿树叶吊坠</span>
            <span class="works-floor-btn-all">&nbsp;&nbsp;操作&nbsp;&nbsp;</span>
            <span class="works-floor-img-all">田黄鸡血石</span>
            <span class="works-floor-date-all">2016-12-4</span>
        </div>
    </div>
    <div class="works-all-outer">
        <div class="works-all">
            <img src="${ctxStatic}/img/headImg/10.jpg" alt="" class="works-img-all"/>
            <textarea class="works-intro-all">新疆和田玉籽料,原皮原色,可玩可做,底部带一块僵,宽33毫米,厚15毫米,高53毫米,重41克.</textarea>
        </div>
        <div class="works-floor-all">
            <span class="works-floor-name-all">冰阳绿树叶吊坠</span>
            <span class="works-floor-btn-all">&nbsp;&nbsp;操作&nbsp;&nbsp;</span>
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
            <span class="works-floor-btn-all">&nbsp;&nbsp;操作&nbsp;&nbsp;</span>
            <span class="works-floor-img-all">田黄鸡血石</span>
            <span class="works-floor-date-all">2016-12-4</span>
        </div>
    </div>
    <div class="works-all-outer">
        <div class="works-all">
            <img src="${ctxStatic}/img/headImg/11.jpg" alt="" class="works-img-all"/>
            <textarea class="works-intro-all">新疆和田玉籽料,原皮原色,可玩可做,底部带一块僵,宽33毫米,厚15毫米,高53毫米,重41克.</textarea>
        </div>
        <div class="works-floor-all">
            <span class="works-floor-name-all">冰阳绿树叶吊坠</span>
            <span class="works-floor-btn-all">&nbsp;&nbsp;操作&nbsp;&nbsp;</span>
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

<%@include file="../pawn2/include/tab-3.jsp" %>

<div>
    <div class="weui-mask" id="iosMask" style="display: none"></div>
    <div class="weui-actionsheet" id="iosActionsheet">
        <div class="weui-actionsheet__menu">
            <div class="weui-actionsheet__cell">编辑</div>
            <div class="weui-actionsheet__cell" id="transfer">转让</div>
            <div class="weui-actionsheet__cell">删除</div>
        </div>
        <div class="weui-actionsheet__action">
            <div class="weui-actionsheet__cell" id="iosActionsheetCancel">取消</div>
        </div>
    </div>
</div>

<div id="dialogs">
    <!--BEGIN dialog1-->
    <div class="js_dialog" id="iosDialog1" style="display: none;">
        <div class="weui-mask"></div>
        <div class="weui-dialog">
            <div class="weui-dialog__hd"><strong class="weui-dialog__title">作品转让</strong></div>
            <div class="weui-cell ">目标用户昵称:<input style="width: 150px"></div>

            <div class="weui-cell ">转让原因:<textarea id="reason" rows="5" cols="24"></textarea></div>

            <div class="weui-cell ">与用户关系:</div>
            <input type="button" value="爱人" class="relation-btn relation-btn-on"><input type="button" value="朋友"
                                                                                        class="relation-btn"><input
                type="button"
                value="亲人"
                class="relation-btn"><input
                type="button" value="亲戚" class="relation-btn">
            <div>
                售卖<input type="radio" name="transfer-way">赠送<input type="radio" name="transfer-way">
            </div>
            <div class="weui-cell ">
                售卖价格(&yen;):
                <div class="weui-cell__bd">
                    <input placeholder="请输入">
                </div>
            </div>
            <div class="weui-dialog__ft">
                <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_default">取消</a>
                <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary"
                   style="color:#2698DE ">确定转让</a>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        $("#check-title-success").click(function () {
            $('#check-success-works').addClass('div-on').siblings('.div-hide').removeClass('div-on');
        })
        $("#check-title-now").click(function () {
            $('#check-now-works').addClass('div-on').siblings('.div-hide').removeClass('div-on');
        })
        $("#check-title-failure").click(function () {
            $('#check-failure-works').addClass('div-on').siblings('.div-hide').removeClass('div-on');
        })
        $("#check-title-draft").click(function () {
            $('#check-draft-works').addClass('div-on').siblings('.div-hide').removeClass('div-on');
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
        var $iosActionsheet = $('#iosActionsheet');
        var $iosMask = $('#iosMask');
        var $iosDialog1 = $('#iosDialog1');

        function hideActionSheet() {
            $iosActionsheet.removeClass('weui-actionsheet_toggle');
            $iosMask.fadeOut(200);
        }

        $iosMask.on('click', hideActionSheet);
        $('#iosActionsheetCancel').on('click', hideActionSheet);
        $(".works-floor-btn-all").on("click", function () {
            $iosActionsheet.addClass('weui-actionsheet_toggle');
            $iosMask.fadeIn(200);
        });

        $('#dialogs').on('click', '.weui-dialog__btn', function () {
            $(this).parents('.js_dialog').fadeOut(200);
        });

        $('#transfer').on('click', function () {
            $iosDialog1.fadeIn(200);
            hideActionSheet();
        });
    });

    $(function () {
        $('.relation-btn').on('click', function () {
            $(this).addClass('relation-btn-on').siblings('.relation-btn').removeClass('relation-btn-on');
        })
    })


</script>
</body>
</html>
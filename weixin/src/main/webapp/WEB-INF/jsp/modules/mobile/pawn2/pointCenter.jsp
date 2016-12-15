<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>积分中心</title>
    <link rel="stylesheet" href="${ctxStatic}/css/custom.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/weui.min.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/jquery-weui.min.css"/>

    <script src="${ctxStatic}/js/jquery-2.1.4.js"></script>
    <script src="${ctxStatic}/js/jquery-weui.js"></script>
    <script src="${ctxStatic}/js/swiper.js"></script>
    <style>
        body {
            background-color: white;
        }

        .hr-text {
            margin-top: 20%;
        }

        #point-total {
            width: 30%;
            margin-top: 5%;
            margin-left: 35%;
            margin-right: 35%;
            height: 100px;
            background-image: url("${ctxStatic}/img/cut/积分中心_积分.png");
            background-repeat: no-repeat;
            background-size: 100px 100px;
            background-position: center center;
            text-align: center;
            color: white;
        }

        #point-total h3 {
            line-height: 60px;
        }

        #point-total h2 {
            line-height: 10px;
        }

        .point-btn {
            background-size: 20px 20px;
            background-repeat: no-repeat;
            background-position: 10px 4px;
            padding-left: 25px;
            font-size: 15px;
            color: gray;
        }

        #point-rule {
            padding-top: 5px;
            padding-bottom: 5px;
            padding-left: 25px;
            width: 100px;
            border: none;
            background-image: url(${ctxStatic}/img/cut/积分中心_积分规则.png);
            position: absolute;
            top: 0px;
            right: 0px;
        }

        #point-save {
            padding-top: 5px;
            padding-bottom: 5px;
            padding-left: 35px;
            border: 1px solid lightgray;
            border-radius: 3px;
            width: 75px;
            background-image: url(${ctxStatic}/img/cut/积分中心_充值.png);
            position: absolute;
            left: 20px;

        }

        #point-withdraw {
            padding-top: 5px;
            padding-bottom: 5px;
            padding-left: 35px;
            border: 1px solid lightgray;
            border-radius: 3px;
            width: 75px;
            background-image: url(${ctxStatic}/img/cut/积分中心_提现.png);
            position: absolute;
            right: 20px;
        }

        .weui-navbar__item {
            font-size: 10px;
        }

        .weui-navbar__item.weui-bar__item_on {
            background-color: #F76301;
            color: white;
        }

        .point-one {
            border-bottom: 1px solid #F0EFF5;;
        }

        .point-one table {
            font-size: 10px;
            width: 80%;
            margin: auto;
        }

        .point-one-time {
            color: gray;
        }

        .point-one-detail {
            color: #F76301;
            text-align: right;
        }

    </style>
</head>
<body>
<div id="header">
    <div id="point-total">
        <h3>积分</h3>
        <h2>${user.score}</h2>
    </div>
    <input type="button" id="point-rule" class="point-btn" value="积分规则"/>
    <a id="point-save" class="point-btn" href="${ctx}/mobile/my/pointSave">积分充值</a>
    <a id="point-withdraw" class="point-btn" href="${ctx}/mobile/my/pointWithdraw">积分提现</a>
</div>

<div class="hr-text">
    <center>
        <hr>
        <span>&nbsp;&nbsp;积分明细&nbsp;&nbsp;</span></center>
</div>

<div class="weui-tab">
    <div class="weui-navbar">
        <div class="weui-navbar__item weui-bar__item_on" id="tab-all">
            全部
        </div>
        <div class="weui-navbar__item" id="tab-save">
            充值
        </div>
        <div class="weui-navbar__item" id="tab-withdraw">
            提现
        </div>
        <div class="weui-navbar__item" id="tab-other">
            其他
        </div>
    </div>
</div>
<br><br>
<div id="div-hide-all" class="div-hide div-on">
    <div class="point-one">
        <table>
            <tr>
                <td>作品被浏览</td>
                <td rowspan="2" class="point-one-detail"> + 1</td>
            </tr>
            <tr>
                <td class="point-one-time">2016-12-07 11:50:01</td>
            </tr>
        </table>
    </div>
    <div class="point-one">
        <table>
            <tr>
                <td>作品被浏览</td>
                <td rowspan="2" class="point-one-detail"> + 1</td>
            </tr>
            <tr>
                <td class="point-one-time">2016-12-07 11:50:01</td>
            </tr>
        </table>
    </div>
    <div class="point-one">
        <table>
            <tr>
                <td>新增粉丝</td>
                <td rowspan="2" class="point-one-detail"> + 6</td>
            </tr>
            <tr>
                <td class="point-one-time">2016-12-07 11:52:01</td>
            </tr>
        </table>
    </div>
    <div class="point-one">
        <table>
            <tr>
                <td>作品被分享</td>
                <td rowspan="2" class="point-one-detail"> + 2</td>
            </tr>
            <tr>
                <td class="point-one-time">2016-12-07 11:55:01</td>
            </tr>
        </table>
    </div>
</div>

<div id="div-hide-save" class="div-hide">
    <div class="point-one">
        <table>
            <tr>
                <td>充值</td>
                <td rowspan="2" class="point-one-detail"> + 100</td>
            </tr>
            <tr>
                <td class="point-one-time">2016-12-07 11:50:01</td>
            </tr>
        </table>
    </div>
    <div class="point-one">
        <table>
            <tr>
                <td>充值</td>
                <td rowspan="2" class="point-one-detail"> + 100</td>
            </tr>
            <tr>
                <td class="point-one-time">2016-12-07 11:50:01</td>
            </tr>
        </table>
    </div>
</div>

<div id="div-hide-withdraw" class="div-hide">
    <div class="point-one">
        <table>
            <tr>
                <td>提现</td>
                <td rowspan="2" class="point-one-detail"> - 50</td>
            </tr>
            <tr>
                <td class="point-one-time">2016-12-07 11:50:01</td>
            </tr>
        </table>
    </div>
    <div class="point-one">
        <table>
            <tr>
                <td>提现</td>
                <td rowspan="2" class="point-one-detail"> - 100</td>
            </tr>
            <tr>
                <td class="point-one-time">2016-12-07 11:50:01</td>
            </tr>
        </table>
    </div>
    <div class="point-one">
        <table>
            <tr>
                <td>提现</td>
                <td rowspan="2" class="point-one-detail"> - 100</td>
            </tr>
            <tr>
                <td class="point-one-time">2016-12-07 11:52:01</td>
            </tr>
        </table>
    </div>
</div>

<div id="div-hide-other" class="div-hide">
    <div class="point-one">
        <table>
            <tr>
                <td>其他...</td>
                <td rowspan="2" class="point-one-detail"> + 1</td>
            </tr>
            <tr>
                <td class="point-one-time">2016-12-07 11:50:01</td>
            </tr>
        </table>
    </div>
</div>

<div class="js_dialog" style="display: none;">
    <div class="weui-mask"></div>
    <div class="weui-dialog">
        <div class="weui-dialog__hd"><strong class="weui-dialog__title">积分规则</strong></div>
        <div class="weui-dialog__bd">积分规则.....</div>
        <div class="weui-dialog__ft">
            <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary">确定</a>
        </div>
    </div>
</div>

<script>
    $(function () {
        $('.weui-navbar__item').on('click', function () {
            $(this).addClass('weui-bar__item_on').siblings('.weui-navbar__item').removeClass('weui-bar__item_on');
        });
        $('#tab-all').on('click', function () {
            $('#div-hide-all').addClass('div-on').siblings('.div-hide').removeClass('div-on');
        });
        $('#tab-withdraw').on('click', function () {
            $('#div-hide-withdraw').addClass('div-on').siblings('.div-hide').removeClass('div-on');
        });
        $('#tab-save').on('click', function () {
            $('#div-hide-save').addClass('div-on').siblings('.div-hide').removeClass('div-on');
        });
        $('#tab-other').on('click', function () {
            $('#div-hide-other').addClass('div-on').siblings('.div-hide').removeClass('div-on');
        });


        $('#point-rule').on('click', function () {
            $(".js_dialog").fadeIn(200);
        })
        $('.weui-dialog__btn_primary').on('click', function () {
            $(".js_dialog").fadeOut(200);
        })
    });

</script>
</body>
</html>
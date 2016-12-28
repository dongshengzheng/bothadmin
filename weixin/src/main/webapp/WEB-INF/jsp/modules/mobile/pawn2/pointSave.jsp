<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>积分充值</title>
    <link rel="stylesheet" href="${ctxStatic}/css/custom.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/weui.min.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/jquery-weui.min.css"/>

    <script src="${ctxStatic}/js/jquery-2.1.4.js"></script>
    <script src="${ctxStatic}/js/jquery-weui.js"></script>
    <script src="${ctxStatic}/js/swiper.js"></script>
    <style>
        .point-money {
            color: #F76301;
        }

        span {
            font-size: 10px;
            color: gray;
        }

        .go-to-save {
            width: 60px;
            color: #51CF50;
            border: 1px solid #51CF50;
            text-align: center;
        }

        .blank {
            background-color: #F6F6F5;
            height: 30px;
        }

        #saveScore {
            width: 120px;
            border: none;
        }

    </style>
</head>
<body>
<div class="weui-cell div-outer">
    <div class="weui-cell__hd"><label class="weui-label">当前积分余额</label></div>
    <div class="weui-cell__bd">
    </div>
    <div class="weui-cell__hd"><label class="weui-label">200</label></div>
</div>
<div class="weui-cell " style="background-color: #F0EFF5">
    <div class="weui-cell__hd"><label class="weui-label" style="font-size: 10px;color: gray">充值积分</label></div>
</div>
<div class="div-outer">
    <div class="weui-cell ">
        <div class="weui-cell__hd"><label class="weui-label">10积分</label></div>
        <div class="weui-cell__bd">
        </div>
        <div class="weui-cell__hd"><label class="weui-label point-money">&yen;10</label></div>
    </div>
    <div class="weui-cell ">
        <div class="weui-cell__hd"><label class="weui-label">20积分</label></div>
        <div class="weui-cell__bd">
        </div>
        <div class="weui-cell__hd"><label class="weui-label point-money">&yen;20</label></div>
    </div>
    <div class="weui-cell ">
        <div class="weui-cell__hd"><label class="weui-label">50积分</label></div>
        <div class="weui-cell__bd">
            <span>优惠2%</span>
        </div>
        <div class="weui-cell__hd"><label class="weui-label point-money">&yen;49</label></div>
    </div>
    <div class="weui-cell ">
        <div class="weui-cell__hd"><label class="weui-label">100积分</label></div>
        <div class="weui-cell__bd">
            <span>优惠5%</span>
        </div>
        <div class="weui-cell__hd"><label class="weui-label point-money">&yen;95</label></div>
    </div>
    <div class="weui-cell ">
        <div class="weui-cell__hd"><label class="weui-label">200积分</label></div>
        <div class="weui-cell__bd">
            <span>优惠10%</span>
        </div>
        <div class="weui-cell__hd"><label class="weui-label point-money">&yen;190</label></div>
    </div>
</div>
<div class="blank"></div>
<div class="weui-cell div-outer">
    <div class="weui-cell__hd"><label class="weui-label">其他积分</label></div>
    <div class="weui-cell__bd">
        <input id="saveScore" name="saveScore" placeholder="请填写需要的积分">
    </div>
    <div class="weui-cell__hd"><label class="weui-label go-to-save">充值</label></div>
</div>
</body>
</html>
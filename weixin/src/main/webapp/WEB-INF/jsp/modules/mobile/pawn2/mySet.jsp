<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>个人信息编辑</title>
    <link rel="stylesheet" href="${ctxStatic}/css/custom.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/weui.min.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/jquery-weui.min.css"/>

    <script src="${ctxStatic}/js/jquery-2.1.4.js"></script>
    <script src="${ctxStatic}/js/jquery-weui.js"></script>
    <script src="${ctxStatic}/js/swiper.js"></script>

    <style>
        .weui-media-box__thumb {
            border-radius: 5px;
        }

        #update {
            background-image: url("${ctxStatic}/img/cut/设置_更新.png");
            background-size: 15px 15px;
            background-repeat: no-repeat;
            background-position-x: 3px;
            margin-right: 20px;
            margin-top: 10px;
            padding-top: 15px;
            font-size: 10px;
            color: #7081A6;
        }


    </style>
</head>
<body>

<div class="weui-panel weui-panel_access">
    <div class="weui-panel__bd">
        <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
            <div class="weui-media-box__hd">
                <img class="weui-media-box__thumb"
                     src="${ctxStatic}/img/headImg/5.jpg"
                     alt="">
            </div>
            <div class="weui-media-box__bd">
                <h4 class="weui-media-box__title">老特福德永恒</h4>
                <p class="weui-media-box__desc">(头像、昵称将同步微信)</p>
            </div>
            <span id="update">更新</span>
        </a>
    </div>
</div>
<form action="my.jsp">
    <div class="weui-cells weui-cells_form">
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">姓名</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input class="weui-input" type="tel" placeholder="必填">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">地址</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input class="weui-input" type="tel" placeholder="可不填">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">联系方式</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input class="weui-input" type="tel" placeholder="必填">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">Email</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input class="weui-input" type="tel" placeholder="可不填">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">身份证</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input class="weui-input" type="tel" placeholder="可不填">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">收藏偏好</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input class="weui-input" type="tel" placeholder="请选择您的收藏编号">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">信息公开</label></div>
            <input class="weui-switch" type="checkbox"/>
        </div>
    </div>

    <div class="fixed-footer">
        <!--<p>下一步即表示同意<a href="#">《金石典当登记申请记录》</a></p>-->
        <hr>
        <div class="weui-form-preview__ft">
            <a class="weui-form-preview__btn weui-form-preview__btn_default" href="javascript:">取消</a>
            <button type="submit" class="weui-form-preview__btn weui-form-preview__btn_primary" href="javascript:">
                保存
            </button>
        </div>
    </div>
    <div class="fixed-footer-blank">

    </div>
</form>


</body>
</html>
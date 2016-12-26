<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>个人中心</title>
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

        #go-to-set {
            font-size: 14px;
            color: gray;
        }

        #go-to-set:after {
            content: " ";
            display: inline-block;
            height: 6px;
            width: 6px;
            border-width: 2px 2px 0 0;
            border-color: #C8C8CD;
            border-style: solid;
            -webkit-transform: matrix(0.71, 0.71, -0.71, 0.71, 0, 0);
            transform: matrix(0.71, 0.71, -0.71, 0.71, 0, 0);
        }

        .weui-tabbar__item.weui-bar__item_on .weui-tabbar__label {
            color: #9F504D;
        }

        .first-row {
            width: 25%;
        }

        #title {
            padding-top: 10px;
        }


    </style>
</head>
<body>
<div class="weui-panel weui-panel_access div-outer">
    <div class="weui-panel__bd">
        <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
            <div class="weui-media-box__hd">
                <img class="weui-media-box__thumb"
                     src="${appUser.headImgUrl}"
                     alt="">
            </div>
            <div class="weui-media-box__bd" id="my-info">
                <h4 class="weui-media-box__title">${appUser.loginName}</h4>
                <p class="weui-media-box__desc">
                    积分:${appUser.score}&nbsp;关注:${appUser.focusOtherCount}&nbsp;收藏:${appUser.collectionCount}</p>
            </div>
            <span id="go-to-set">设置</span>
        </a>
    </div>
</div>

<div class="weui-grids div-outer">
    <center id="title">我的作品</center>
    <a href="${ctx}/mobile/my/myWorks?showwhich=success" class="weui-grid first-row">
        <div class="weui-grid__icon">
            <img src="${ctxStatic}/img/cut/个人中心_审核通过.png" alt="">
        </div>
        <p class="weui-grid__label">审核通过</p>
    </a>
    <a href="${ctx}/mobile/my/myWorks?showwhich=failure" class="weui-grid first-row">
        <div class="weui-grid__icon">
            <img src="${ctxStatic}/img/cut/个人中心_审核失败.png" alt="">
        </div>
        <p class="weui-grid__label">审核失败</p>
    </a>
    <a href="${ctx}/mobile/my/myWorks?showwhich=now" class="weui-grid first-row">
        <div class="weui-grid__icon">
            <img src="${ctxStatic}/img/cut/个人中心_审核中.png" alt="">
        </div>
        <p class="weui-grid__label">审核中</p>
    </a>
    <a href="${ctx}/mobile/my/myWorks?showwhich=draft" class="weui-grid first-row">
        <div class="weui-grid__icon">
            <img src="${ctxStatic}/img/cut/个人中心_草稿箱.png" alt="">
        </div>
        <p class="weui-grid__label">草稿箱</p>
    </a>
</div>
<div class="weui-grids div-outer">
    <a href="${ctx}/mobile/my/transferCollectionFocus?showwhich=transfer" class="weui-grid">
        <div class="weui-grid__icon">
            <img src="${ctxStatic}/img/cut/个人中心_转让作品.png" alt="">
        </div>
        <p class="weui-grid__label">转让作品</p>
    </a>
    <a href="${ctx}/mobile/my/transferCollectionFocus?showwhich=collection" class="weui-grid">
        <div class="weui-grid__icon">
            <img src="${ctxStatic}/img/cut/个人中心_收藏作品.png" alt="">
        </div>
        <p class="weui-grid__label">收藏作品</p>
    </a>
    <a href="${ctx}/mobile/my/transferCollectionFocus?showwhich=focus" class="weui-grid">
        <div class="weui-grid__icon">
            <img src="${ctxStatic}/img/cut/个人中心_关注用户.png" alt="">
        </div>
        <p class="weui-grid__label">关注用户</p>
    </a>
    <a href="${ctx}/mobile/my/pointCenter" class="weui-grid">
        <div class="weui-grid__icon">
            <img src="${ctxStatic}/img/cut/个人中心_积分中心.png" alt="">
        </div>
        <p class="weui-grid__label">积分中心</p>
        <p class="weui-grid__label" style="color: gray">${appUser.score}</p>
    </a>
    <a href="javascript:;" class="weui-grid">
        <div class="weui-grid__icon">
            <img src="${ctxStatic}/img/cut/个人中心_敬请期待.png" alt="">
        </div>
        <p class="weui-grid__label" style="color: gray">敬请期待</p>
    </a>
</div>

<%@include file="include/tab-3.jsp" %>

<script>
    $(function () {
        $("#go-to-set").on("click", function () {
            location.href = "${ctx}/mobile/my/mySet";
        })
    })
</script>

</body>
</html>
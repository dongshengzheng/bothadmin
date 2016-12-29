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
                     src="${appUser.headImgUrl}"
                     alt="">
            </div>
            <div class="weui-media-box__bd">
                <h4 class="weui-media-box__title">${appUser.loginName}</h4>
                <p class="weui-media-box__desc">(头像、昵称将同步微信)</p>
            </div>
            <span id="update">更新</span>
        </a>
    </div>
</div>
<form action="${ctx}/mobile/my/mySetComplete" method="post">
    <div class="weui-cells weui-cells_form">
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">姓名</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input name="name" class="weui-input" value="${appUser.name}" type="tel" placeholder="必填">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">地址</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input name="address" class="weui-input" value="${appUser.address}" type="tel" placeholder="可不填">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">联系方式</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input name="phone" class="weui-input" value="${appUser.phone}" type="tel" placeholder="必填">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">Email</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input name="email" class="weui-input" value="${appUser.email}" type="tel" placeholder="可不填">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">身份证</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input name="identification" class="weui-input" value="${appUser.identification}" type="tel"
                       placeholder="可不填">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">收藏偏好</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input id="prefer" name="prefer" class="weui-input" value="${appUser.prefer}" type="tel"
                       placeholder="请选择您的收藏偏好">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">信息公开</label></div>
            <input name="ifpublic" class="weui-switch"
                   <c:if test="${appUser.pub}">checked</c:if> type="checkbox"/>
        </div>
    </div>

    <div class="fixed-footer">
        <div class="weui-form-preview__ft">
            <a class="weui-form-preview__btn weui-form-preview__btn_default" onClick="javascript:history.go(-1);">取消</a>
            <button type="submit" class="weui-form-preview__btn weui-form-preview__btn_primary" href="javascript:">
                保存
            </button>
        </div>
    </div>
    <div class="fixed-footer-blank">

    </div>
</form>
<div id="dialogs">
    <div class="js_dialog" id="iosDialog2" style="display: none;">
        <div class="weui-mask"></div>
        <div class="weui-dialog">
            <div class="weui-dialog__bd">收藏成功!</div>
            <div class="weui-dialog__ft">
                <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary">我知道了</a>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(function () {
        $('#prefer').picker({
            title: "请选择偏好",
            cols: [
                {
                    textAlign: 'center',
                    values: ['雕刻', '玉石', '小玩件']
                }
            ]
        });

        $('.weui-dialog__btn').on('click', function () {
            $('#iosDialog2').fadeOut(200);
        })
        $('#update').on('click', function () {
            $.ajax({
                type: "POST",
                url: "${ctx}/mobile/updateHeadImgLoginName",
                success: function (data) {
                    $('#iosDialog2 .weui-dialog__bd').html(data);
                    $('#iosDialog2').fadeIn(200);
                }
            })
        })
    })


</script>
</html>
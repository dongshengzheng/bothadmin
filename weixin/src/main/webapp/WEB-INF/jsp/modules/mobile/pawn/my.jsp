<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>

<html lang="en">
<head>
    <title>个人中心</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <link rel="stylesheet" href="${ctxStatic}/jquery-weui/lib/weui.css"/>
    <link rel="stylesheet" href="${ctxStatic}/jquery-weui/css/jquery-weui.css"/>
    <link rel="stylesheet" href="${ctxStatic}/modules/pawn/css/custom.css"/>
</head>
<style>
    .weui_media_box{
        padding: 25px 15px;
    }
    .items .item {

        background-color: #FEFFFF;
    }

    .items .item div {
        border-top: 1px solid #eeeeee;
    }

    .items .item .stone {
        width: 100%;
        height: 200px;
    }

    .item {
        position: relative;
    }

    .items .item .status {
        position: absolute;
        top: 0px;
        right: 0px;
    }

    .weui-row .weui-col-50 {
        width: calc((100% - 8px * 1) / 2) !important;
        margin-bottom: 15px;
    }

    .weui_search_inner .weui_icon_search, .weui_search_inner .weui_icon_clear {
        top: 8px;
    }

    .weui_search_inner {
        height: inherit;
    }
    .weui_panel:after {
        border-bottom: none;
    }
    .weui_panel:before {
        border-top: none;
    }
    .weui_media_box.weui_media_appmsg .weui_media_bd {
        flex: 0.5;
    }

</style>
<body>
<div class="weui_tab">
    <div class="weui_tab_bd" style="background-image: url('/static/modules/pawn/img/wo_bg.png');
    background-repeat: no-repeat;
    background-size: 100% 230px;
    background-position: top;">
        <div class="weui_panel weui_panel_access" style="    background-color: #C91D1A;
    border: none;
    height: 110px;
    border-bottom: 1px solid #690e0d;
}">
            <div class="weui_panel_bd">
                <a href="${ctx}/pawn/mobile/myinfo" class="weui_media_box weui_media_appmsg">
                    <div class="weui_media_hd">
                        <img class="weui_media_appmsg_thumb" src="${wxMpUser.headImgUrl}" alt=""
                             style="    border-radius: 50px;">
                    </div>
                    <div class="weui_media_bd" style="color:#FFFFFF;">
                        <h4 class="weui_media_title">${user.name}</h4>
                    </div>
                    <div style="flex: 1px;">
                        <img src="${ctxStatic}/modules/pawn/img/access.png" alt="" style="float: right;">
                    </div>
                </a>

            </div>
        </div>

        <div class="weui-row" style="color:#FFFFFF;margin-top:25px;">
            <a class="weui-col-50" style="text-align: center ;border-right:1px solid #690e0d;color:#FFFFFF;" href="${ctx}/pawn/mobile/my/works">
                <p style=font-size:1.4em;">${s_all}</p>
                我的作品
            </a>
            <a class="weui-col-50" style="text-align: center;border-right:1px solid #690e0d;" >
                <p style=font-size:1.4em;">5</p>
                我的消息
            </a>
        </div>
        <div style="text-align:center;margin-top:35%">
            <img src="${ctxStatic}/modules/pawn/img/logo.png" alt="" style="width: 60%;">
        </div>
    </div>

    <%@include file="include/tab-3.jsp" %>
</div>

<a class="weui-col-50 item" id="tmp" style="display: none;">
    <img class="stone" src="${ctxStatic}/modules/pawn/img/name.png" style="" alt="">
    <div style="width: 100%;text-align: center;">
        <span class="name">鸡血石</span>
    </div>
    <img class="status" src="${ctxStatic}/modules/pawn/img/status-3.png" style="" alt="">
</a>
<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js" type="text/javascript"></script>
<script src="${ctxStatic}/jquery-weui/js/jquery-weui.js" type="text/javascript"></script>
</body>
<script type="text/javascript">
    function search() {
        window.location.href = location.protocol + '//' + location.host + location.pathname + "?name=" + $("#name").val();
    }

</script>
</html>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>

<html lang="en">
<head>
    <title>用户信息</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">

    <link rel="stylesheet" href="${ctxStatic}/jquery-weui/lib/weui.css"/>
    <link rel="stylesheet" href="${ctxStatic}/jquery-weui/css/jquery-weui.css"/>
    <link rel="stylesheet" href="${ctxStatic}/modules/pawn/css/custom.css"/>
</head>
<style>
    .weui_input {
        text-align: right;
    }
    .weui_media_box{
        padding: 25px 15px;
    }
</style>
<body>
<div class="weui_tab">
    <div class="weui_tab_bd">

        <div class="weui_cells_title"></div>
        <div class="weui_cells weui_cells_form">
            <div class="weui_cell">
                <div class="weui_cell_hd"><label class="weui_label">头像</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <img src="${ctxStatic}/modules/pawn/img/password.png" style="width: 60px;float: right;" alt="">
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd"><label class="weui_label">昵称</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" type="tel" placeholder="请输入qq号">
                </div>
            </div>
        </div>

        <div class="weui_cells weui_cells_form">
            <div class="weui_cell">
                <div class="weui_cell_hd"><label class="weui_label">姓名</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input id="username" name="username" class="weui_input" type="text" placeholder="请输入姓名">
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd"><label class="weui_label">地址</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input id="address" name="address" class="weui_input" type="text" placeholder="请输入地址">
                </div>
            </div>

            <div class="weui_cell">
                <div class="weui_cell_hd"><label class="weui_label">电话</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input id="phone" name="phone" class="weui_input" type="tel" placeholder="请输入电话">
                </div>
            </div>

            <div class="weui_cell">
                <div class="weui_cell_hd"><label class="weui_label">手机号码</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input id="mobile" name="mobile" class="weui_input" type="tel" placeholder="请输入手机号码">
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd"><label class="weui_label">邮箱</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input id="email" name="email" class="weui_input" type="text" placeholder="请输入邮箱">
                </div>
            </div>

            <div class="weui_cell">
                <div class="weui_cell_hd"><label for="preference" class="weui_label">收藏偏好</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" id="preference" name="preference" type="text" value="" readonly=""
                           placeholder="选择收藏偏好">
                </div>
            </div>
        </div>
        <div class="weui_cells weui_cells_form">
            <div class="weui_cell weui_cell_switch">
                <div class="weui_cell_hd weui_cell_primary">个人信息公开</div>
                <div class="weui_cell_ft">
                    <input class="weui_switch" type="checkbox">
                </div>
            </div>
        </div>

        <div style="padding:30px 10%;">
            <a href="javascript:;" class="weui_btn weui_btn_warn" onclick="">注册</a>
        </div>
    </div>
    <%@include file="include/tab-3.jsp"%>
</div>

<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js" type="text/javascript"></script>
<script src="${ctxStatic}/jquery-weui/js/jquery-weui.js" type="text/javascript"></script>
</body>
<script type="text/javascript">
</script>


</html>

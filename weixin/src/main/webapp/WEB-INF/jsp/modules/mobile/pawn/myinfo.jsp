<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>

<html lang="en">
<head>
    <title>我的个人信息</title>
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
                    <img src="${wxMpUser.headImgUrl}" style="width: 60px;float: right;" alt="">
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd"><label class="weui_label">昵称</label></div>
                <div class="weui_cell_bd weui_cell_primary" style="    text-align: right;">
                    <span>${wxMpUser.nickname}</span>
                </div>
            </div>
        </div>

        <div class="weui_cells weui_cells_form">
            <div class="weui_cell">
                <div class="weui_cell_hd"><label class="weui_label">姓名</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input id="username" name="username" value="${user.name}" class="weui_input" type="text"
                           placeholder="请输入姓名">
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd"><label class="weui_label">地址</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input id="address" name="address" class="weui_input" type="text" placeholder="请输入地址"
                           value="${user.address}">
                </div>
            </div>

            <div class="weui_cell">
                <div class="weui_cell_hd"><label class="weui_label">身份证号码</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input id="identify" name="identify" class="weui_input" type="text" placeholder="请输入身份证号码"
                           value="${user.identify}">
                </div>
            </div>

            <div class="weui_cell">
                <div class="weui_cell_hd"><label class="weui_label">手机号码</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input id="mobile" name="mobile" class="weui_input" type="tel" placeholder="请输入手机号码"
                           value="${user.mobile}">
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd"><label class="weui_label">邮箱</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input id="email" name="email" class="weui_input" type="text" placeholder="请输入邮箱"
                           value="${user.email}">
                </div>
            </div>

            <div class="weui_cell">
                <div class="weui_cell_hd"><label for="preference" class="weui_label">收藏偏好</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" id="preference" name="preference" type="text"
                           value="${preferenceLabel}" readonly=""
                           placeholder="选择收藏偏好" data-values="${user.preference}">
                </div>
            </div>
        </div>
        <div class="weui_cells weui_cells_form">
            <div class="weui_cell weui_cell_switch">
                <div class="weui_cell_hd weui_cell_primary">个人信息公开</div>
                <div class="weui_cell_ft">
                    <input class="weui_switch" type="checkbox" <c:if test="${user.pub ==1 }"> checked</c:if>>
                </div>
            </div>
        </div>

        <div style="padding:30px 10%;">
            <a href="javascript:;" class="weui_btn weui_btn_warn" onclick="saveUser();">保存</a>
        </div>
    </div>
    <%@include file="include/tab-3.jsp" %>
</div>

<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js" type="text/javascript"></script>
<script src="${ctxStatic}/jquery-weui/js/jquery-weui.js" type="text/javascript"></script>
</body>
<script type="text/javascript">

    $("#preference").select({
        title: "收藏偏好",
        multi: true,
        items: [
            {
                title: "玉石",
                value: "1",
            },
            {
                title: "古玩",
                value: "2",
            },
            {
                title: "古家具",
                value: "3",
            }]
    });
    function saveUser() {
        if ($("#username").val().length == "") {
            top.layer.alert("姓名不能为空");
            return false;
        }
        $.ajax({
            type: "POST",
            url: "${ctx}/pawn/mobile/updateUser",
            data: {
                name: $("#username").val(),
                address: $("#address").val(),
                identify: $("#identify").val(),
                mobile: $("#mobile").val(),
                no: $("#no").val(),
                email: $("#email").val(),
                preference: $("#preference").attr("data-values"),
                pub:$(".weui_switch").is(':checked')
            },

            success: function (data) {
                if (data.suc) {
                    $.alert("更新用户信息成功", function () {
                        window.location.href = "${ctx}/pawn/mobile/myinfo";
                    });
                } else {
                    $.alert(data.msg);
                }
            }
        });

    }
</script>


</html>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>

<html lang="en">
<head>
    <title>登录</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">

    <link rel="stylesheet" href="${ctxStatic}/jquery-weui/lib/weui.css"/>
    <link rel="stylesheet" href="${ctxStatic}/jquery-weui/css/jquery-weui.css"/>
    <link rel="stylesheet" href="${ctxStatic}/modules/pawn/css/custom.css"/>
</head>
<style>
    body {
        background-color: #F7F7F7;
    }

    .weui_cells {
        background-color: #F7F7F7;
    }

    .weui_cell_primary {
        padding-left: 10%;
    }

    .weui_panel:after {
        border-bottom: none;
    }

    .weui_cell_hd img {
        width: 35px;
    }
</style>
<body>

<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js" type="text/javascript"></script>
<script src="${ctxStatic}/jquery-weui/js/jquery-weui.js" type="text/javascript"></script>
<div style="text-align:center;background-color: #F7F7F7;padding: 10%;">
    <img src="${ctxStatic}/modules/pawn/img/logo.png" alt="" style="width: 60%;">
</div>

<div class="weui_panel_bd">


    <div class="weui_media_box weui_media_small_appmsg">
        <div class="weui_cells">
            <div class="weui_cell" href="javascript:;">
                <div class="weui_cell_hd"><img src="${ctxStatic}/modules/pawn/img/name.png" alt=""></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input id="name" style="color:#333;" name="name" class="weui_input" type="text"
                           placeholder="请输入用户名">
                </div>
                <span class="weui_cell_ft"></span>
            </div>
            <div class="weui_cell" href="javascript:;">
                <div class="weui_cell_hd"><img src="${ctxStatic}/modules/pawn/img/password.png" alt=""></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input id="password" style="color:#333;" name="password" class="weui_input" type="password"
                           placeholder="请输入密码">
                </div>
                <span class="weui_cell_ft"></span>
            </div>

        </div>
    </div>
</div>
<div style="padding:15px 10%;background-color: #F7F7F7;">
    <a href="javascript:;" class="weui_btn weui_btn_warn" onclick="login()">登录</a>
    <a href="${ctx}/pawn/mobile/register" style="float:right;font-size: 14px;color:#BF9A68;">返回注册</a>
</div>
<script>

    function login() {

        if ($("#name").val().length == "") {
            $.alert("用户名不能为空");
            return false;
        }
        if ($("#password").val().length == "") {
            $.alert("密码不能为空");
            return false;
        }


        $.ajax({
            type: "POST",
            url: "${ctx}/pawn/mobile/login",
            data: {
                name: $("#name").val(),
                password: $("#password").val()
            },

            success: function (data) {
                if (data.suc) {
                    $.alert("登录成功", function () {
                        window.location.href = "${ctx}/pawn/mobile/works";
                    });
                } else {
                    $.alert(data.msg);
                }
            }
        });

    }

</script>
</body>
</html>

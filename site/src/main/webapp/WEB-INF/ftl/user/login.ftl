<!DOCTYPE html>
<#import "/spring.ftl" as spring />

<#setting url_escaping_charset='utf-8'>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en"> <!--<![endif]-->
<head>
    <title>用户登录</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="${staticPath}/static/img/favicon.ico" type="image/png">
    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="${staticPath}/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${staticPath}/assets/css/style.css">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="${staticPath}/assets/plugins/animate.css">
    <link rel="stylesheet" href="${staticPath}/assets/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="${staticPath}/assets/plugins/font-awesome/css/font-awesome.min.css">

    <!-- CSS Page Style -->
    <link rel="stylesheet" href="${staticPath}/assets/css/pages/page_log_reg_v2.css">

    <!-- CSS Theme -->
    <link rel="stylesheet" href="${staticPath}/assets/css/theme-colors/default.css" id="style_color">
    <link rel="stylesheet" href="${staticPath}/assets/css/theme-skins/dark.css">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="${staticPath}/static/css/custom.css">
</head>

<body>
<div class="container">
    <form id="loginForm" class="reg-block" action="/login" method="post">
        <div class="reg-block-header" style="margin-bottom: 5px;">
            <h2>登录</h2>

            <p>没有账户？去<a class="color-green" href="register">注册</a>吧。</p>
        </div>
        <div id="errInfo" class="form-info error">&nbsp;</div>
        <div class="input-group">
            <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
            <input id="loginName" name="loginName" type="text" class="form-control" placeholder="用户名">
        </div>
        <div class="form-info error">&nbsp;</div>
        <div class="input-group ">
            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
            <input id="password" name="password" type="password" class="form-control" placeholder="密码">
        </div>
        <hr>
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <button type="submit" class="btn-u btn-block">登录</button>
            </div>
        </div>
    </form>
    <div id="login_container">
        微信登录
    </div>
</div>
<!-- JS Global Compulsory -->
<script type="text/javascript" src="${staticPath}/assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${staticPath}/assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="${staticPath}/assets/plugins/jquery/jquery.validate.min.js"></script>
<script type="text/javascript" src="${staticPath}/assets/plugins/jquery/jquery.form.min.js"></script>
<script type="text/javascript" src="${staticPath}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="${staticPath}/assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="${staticPath}/assets/plugins/backstretch/jquery.backstretch.min.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="${staticPath}/assets/js/custom.js"></script>
<!-- JS Page Level -->
<script type="text/javascript" src="${staticPath}/assets/js/app.js"></script>
<script src="http://res.wx.qq.com/connect/zh_CN/htmledition/js/wxLogin.js"></script>
<script type="text/javascript">
    var obj = new WxLogin({
        id: "login_container",
        appid: "wx91ad0b554aceca98",
        scope: "snsapi_login",
        redirect_uri: "https%3A%2F%2F${staticPath}/wx_login",
        state: "111",
        style: "",
        href: ""
    });


    $("#loginForm").validate({
        errorPlacement: function (error, element) {
            element.parent().prev().html(error.html());
        },
        rules: {
            loginName: "required",
            password: "required"
        },
        messages: {
            loginName: {required: "用户名必填"},
            password: {required: "密码必填"}
        },
        submitHandler: function (form) {
            $(form).ajaxSubmit({
                success: function (data) {
                    if (data.result == '') {
                        window.location.href = "/"
                    } else {
                        $("#errInfo").html(data.result);
                    }
                },
                error: function () {
                    alert("error");
                    return;
                }
            });
        }
    });

    jQuery(document).ready(function () {
        App.init();
    });
    $.backstretch([
        "${staticPath}/static/img/login.jpeg"
    ], {
        fade: 1000,
        duration: 7000
    });


</script>
<!--[if lt IE 9]>
<script src="${staticPath}/assets/plugins/respond.js"></script>
<script src="${staticPath}/assets/plugins/html5shiv.js"></script>
<script src="${staticPath}/assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html> 
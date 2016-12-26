<!DOCTYPE html>
<#import "/spring.ftl" as spring />

<#setting url_escaping_charset='utf-8'>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->  
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->  
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->  
<head>
    <title>注册</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Favicon -->


    <!-- Web Fonts -->
    <link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600&subset=cyrillic,latin'>

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
    <form id="registerForm" class="reg-block" action="/register" method="post">
        <div class="reg-block-header">
            <h2>注册</h2>
            <p>已经注册过？赶紧去<a class="color-green" href="login">登录</a></p>
        </div>
        <div class="form-info red">&nbsp;</div>
        <div class="input-group ">
            <span class="input-group-addon"><i class="fa fa-user"></i></span>
            <input id="loginName" name="loginName" type="text" class="form-control" placeholder="用户名">
        </div>
        <div class="form-info red">&nbsp;</div>
        <div class="input-group ">
            <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
            <input id="email" name="email" type="email" class="form-control" placeholder="邮箱">
        </div>
        <div class="form-info red">&nbsp;</div>

        <div class="input-group">
            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
            <input id="password" name="password" type="password" class="form-control" placeholder="密码">
        </div>

        <div class="form-info red">&nbsp;</div>
        <div class="input-group margin-bottom-30">
            <span class="input-group-addon"><i class="fa fa-key"></i></span>
            <input id="confirmPassword" name="confirmPassword" type="password" class="form-control" placeholder="确认密码">
        </div>
        <hr>
        <#--<div class="checkbox">-->
            <#--<label>-->
                <#--<input type="checkbox"> -->
                <#--我已经读过<a target="_blank" href="/terms">注册协议</a>-->
            <#--</label>-->
        <#--</div>-->

        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <button type="submit" class="btn-u btn-block">注册</button>
            </div>
        </div>
    </form>
    <!--End Reg Block-->
</div><!--/container-->
<!--=== End Content Part ===-->

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
<script type="text/javascript">
    $("#registerForm").validate({
        rules: {
            password: "required",
            confirmPassword: {
                equalTo: "#password"
            }
        },
        message:{
            password:{required:"密码必填"} ,
            confirmPassword: {
                equalTo: "两次输入密码不一致"
            }
        },
        errorPlacement: function (error, element) {
            element.parent().prev().html(error.html());
        },
        submitHandler: function (form) {
            $(form).ajaxSubmit({
                success: function (data) {
                    if(data.suc){
                        alert("注册成功，跳转页面")
                    }else {}
                    $("#errInfo").html(data.message);
                },
                error:function () {
                    alert("error");
                    return;
                }
            });
        },

    });
    jQuery(document).ready(function() {
        App.init();
    });
    $.backstretch([
      "assets/img/bg/19.jpg",
      "assets/img/bg/18.jpg",
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
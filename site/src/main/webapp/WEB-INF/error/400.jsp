<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%
    String path = request.getContextPath();
%>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en"> <!--<![endif]-->
<head>
    <title>400 Bad Request</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Favicon -->


    <!-- Web Fonts -->
    <link rel='stylesheet' type='text/css'
          href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600&subset=cyrillic,latin'>

    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="${path}/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/assets/css/style.css">

    <!-- CSS Page Style -->
    <link rel="stylesheet" href="${path}/assets/css/pages/page_404_error1.css">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="${path}/assets/css/custom.css">
</head>

<body>

<!--=== Content Part ===-->
<div class="container">
    <!--Error Block-->
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="error-v2">
                <span class="error-v2-title">400</span>
                <span>出现错误了!</span>
                <p>服务器无法获取您请求的地址 <br> 您在看看别的?</p>
            </div>
        </div>
    </div>
    <!--End Error Block-->
</div><!--/container-->
<!--=== End Content Part ===-->

<!-- JS Global Compulsory -->
<script type="text/javascript" src="${path}/assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${path}/assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="${path}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="${path}/assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="${path}/assets/plugins/backstretch/jquery.backstretch.min.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="${path}/assets/js/custom.js"></script>
<!-- JS Page Level -->
<script type="text/javascript" src="${path}/assets/js/app.js"></script>
<script type="text/javascript" src="${path}/assets/js/plugins/style-switcher.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function () {
        App.init();
        StyleSwitcher.initStyleSwitcher();
    });
</script>
<script type="text/javascript">
    $.backstretch([
        "assets/img/bg/2.jpg",
        "assets/img/bg/8.jpg",
    ], {
        fade: 1000,
        duration: 7000
    });
</script>
<!--[if lt IE 9]>
<script src="${path}/assets/plugins/respond.js"></script>
<script src="${path}/assets/plugins/html5shiv.js"></script>
<script src="${path}/assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html> 
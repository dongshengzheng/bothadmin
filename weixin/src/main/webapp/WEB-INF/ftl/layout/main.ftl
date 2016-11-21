<!DOCTYPE html PUBLIC
        "-//W3C//DTD XHTML 1.0 Transitional//EN” “http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#import "/spring.ftl" as spring />
<#setting url_escaping_charset='utf-8'>
<#macro htmlHead
title= "金石典当"
>
<html xmlns="http://www.w3.org/1999/html"> <!--<![endif]-->
<head>
    <title>${title}</title>
    <!-- Meta -->
    <meta charset="utf-8">

    <meta http-equiv="Content-Language" content="zh-CN">
    <meta name="keywords"
          content="<@block name="htmlKeywords">金石典当</@block>">
    <meta name="description"
          content="<@block name="htmlDescription">金石典当</@block>">
    <meta name="author" content="QQ:44674416">
    <meta name="Owner" content="sunhan">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <link rel="stylesheet" href="${staticPath}/static/css/weui.css">
    <link rel="stylesheet" href="${staticPath}/static/css/jquery-weui.css">
    <link rel="stylesheet" href="${staticPath}/static/css/custom.css">
    <script type="text/javascript">
        // 服务器端请求路径前缀
        var _contextPath = "${request.contextPath}";

        // 静态文件请求路径前缀
        var _staticPath = "${staticPath}";
    </script>
    <#nested/>
</head>
</#macro>
<#macro htmlBody>
<spring:htmlEscape defaultHtmlEscape="true"/>
<body>
<div class="modal-backdrop fade"></div>

<div class="loadingUI">
    <div style="font-size: 20px;  margin:auto">
        <img style="width: 20px;margin-bottom: -1px;" src="${staticPath}/static/img/logo.png"> 正在加载，请稍后...
    </div>
</div>
    <#nested/>
</#macro>
<#macro footJs>
<script type="text/javascript" src="${staticPath}/static/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${staticPath}/static/js/jquery-weui.js"></script>
<script type="text/javascript" src="${staticPath}/static/js/swiper.js"></script>
<script type="text/javascript" src="${staticPath}/static/js/fastclick.js"></script>
<script type="text/javascript" src="${staticPath}/static/js/zepto.js"></script>
    <#nested/>
</body>
</html>
</#macro>
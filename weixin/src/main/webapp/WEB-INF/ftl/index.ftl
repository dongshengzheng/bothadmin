<!DOCTYPE html>
<#--公共顶部-->
<#import "/spring.ftl" as spring />
<#setting url_escaping_charset='utf-8'>
<#macro header title="默认文字" keywords="默认文字" description="默认文字">

<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;"/>
    <meta name="format-detection" content="telephone=no"/>
    <title>${title}</title>
    <meta name="keywords" content="${keywords}"/>
    <meta name="description" content="${description}"/>
    <link rel="stylesheet" type='text/css' href="/static/style/common.css"/>

    <#nested>

</head>
<body>
</#macro>

<#--公共底部-->
<#macro footer>

<script type="text/javascript" src="/static/js/common.js"></script>
<script type="text/javascript">
    var _contextPath = "${rc.contextPath}";
    var _staticPath = "${staticPath}";
</script>
    <#nested>

</body>
</html>
</#macro>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>诠释详情</title>
    <link rel="stylesheet" href="${ctxStatic}/css/custom.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/weui.min.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/jquery-weui.min.css"/>

    <script src="${ctxStatic}/js/jquery-2.1.4.js"></script>
    <script src="${ctxStatic}/js/jquery-weui.js"></script>
    <script src="${ctxStatic}/js/swiper.js"></script>
    <style>

        .explain-img {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            vertical-align: bottom;
        }

        .explains-one {
            margin: 4%;
        }

        .explains-one-title-name {
            border: none;
            height: 26px;
            line-height: 26px;
            width: 80px;
            padding-left: 2px;
            padding-right: 2px;
            vertical-align: bottom;
            background-color: white;
        }

        .explains-one-title-date {
            border: none;
            height: 26px;
            line-height: 26px;
            width: 80px;
            margin-left: 120px;
            padding-right: 2px;
            vertical-align: bottom;
            background-color: white;
        }

        .explains-one-imgs-one {
            width: 100%;
            margin-top: 1%;
        }

        body {
            background-color: white;
        }
    </style>
</head>
<body>
<div class="explains-one div-outer">
    <div class="explains-one-title">
        <img src="${interpretation.appUser.headImgUrl}" class="explain-img"
             onerror="javascript:this.src='${ctxStatic}/modules/pawn/img/default.png'">
        <input disabled type="text" class="explains-one-title-name" value="${interpretation.appUser.loginName}"/>
        <input disabled type="text" value="<fmt:formatDate value='${interpretation.createDate}' pattern="yyyy-MM-dd"/>"
               class="explains-one-title-date"/>
    </div>
    <br>
    <div class="explains-one-text">
        ${interpretation.description}
    </div>
    <div class="explains-one-imgs">
        <c:forEach items="${interpretation.imagesList}" var="image">
            <img class="explains-one-imgs-one"
                 src="http://windyeel.img-cn-shanghai.aliyuncs.com/${image.url}?x-oss-process=image/resize,m_fill,h_100,w_100">
        </c:forEach>
        <c:if test="${fn:length(interpretation.imagesList) == 0}">
            <div style="text-align:center;margin-top:35%">
                <img src="${ctxStatic}/modules/pawn/img/empty.png" alt="" style="width: 50%;">
                <p style="color:#CCCCCC">尚无图片</p>
            </div>
        </c:if>
    </div>
</div>
</body>
</html>
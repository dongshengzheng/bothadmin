<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta name="generator"
          content="HTML Tidy for HTML5 (experimental) for Windows https://github.com/w3c/tidy-html5/tree/c63cc39"/>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>转让历史</title>
    <link rel="stylesheet" href="${ctxStatic}/css/custom.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/weui.min.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/jquery-weui.min.css"/>

    <script src="${ctxStatic}/js/jquery-2.1.4.js"></script>
    <script src="${ctxStatic}/js/jquery-weui.js"></script>
    <style>
        .user {
            height: 100%;
            width: 25%;
            text-align: center;
            display: inline-block;
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .user img {
            width: 30px;
            height: 30px;
            margin: auto;
            display: block;
            border-radius: 50%;
        }

        .middle {
            width: 40%;
        }

        .middle p {
            font-size: 10px;
            padding: 0;
        }


    </style>
</head>
<body>

<c:forEach items="${transferHistoryList}" var="history">
    <div class="div-outer">
        <div class="user left">
            <img src="${ctxStatic}/img/headImg/4.jpg" alt="">
            <span>${history.fromUserName}</span>
        </div>
        <div class="user middle">
            <p><c:if test="${history.transferType==1}">售卖&yen;${history.score}</c:if>
                <c:if test="${history.transferType==2}">赠送</c:if>
            </p>
            <img src="${ctxStatic}/img/cut/转让历史_箭头.png" style="width: 140px;height: 10px">
            <p><fmt:formatDate value="${history.createDate}" pattern="yyyy-MM-dd hh:mm:ss"/></p>
        </div>
        <div class="user right">
            <img src="${ctxStatic}/img/headImg/4.jpg" alt="">
            <span>${history.toUserName}</span>
        </div>
    </div>
</c:forEach>
<c:if test="${fn:length(transferHistoryList) == 0}">
    <div style="text-align:center;margin-top:35%">
        <img src="${ctxStatic}/modules/pawn/img/empty.png" alt="" style="width: 50%;">
        <p style="color:#CCCCCC">尚无转让历史</p>
    </div>
</c:if>
<c:if test="${fn:length(transferHistoryList) > 0}">
    <div class="hr-text ">
        <center>
            <hr>
            <span>&nbsp;&nbsp;到底啦&nbsp;&nbsp;</span></center>
    </div>
</c:if>

</body>
</html>
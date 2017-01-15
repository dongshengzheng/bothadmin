<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>作品等级</title>
    <link rel="stylesheet" href="${ctxStatic}/css/custom.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/weui.min.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/jquery-weui.min.css"/>
    <script src="${ctxStatic}/js/jquery-2.1.4.js"></script>
    <script src="${ctxStatic}/js/jquery-weui.js"></script>
    <script src="${ctxStatic}/js/swiper.js"></script>
    <style>
        .title {
            height: 40px;
            text-align: center;
            background-color: white;
        }

        .title hr {
            top: 25px;
            position: relative;
            width: 80%;
            border-top: 1px solid red;
            color: red;
        }

        .title span {
            top: 10px;
            position: relative;
            background-color: white;
            color: red;
        }

        .fixed-footer p {
            font-size: 10px;
            padding-left: 30%;
        }

        .fixed-footer a {
            color: #A2D2EF;
        }

    </style>
</head>
<body>
<div class="title div-outer">
    <center>
        <hr>
        <span>&nbsp;◇&nbsp;JS-A20161205001A&nbsp;◇&nbsp;</span></center>
</div>
<div>
    <form action="${ctx}/mobile/worksRegister4" method="post">
        <c:if test="${breed==1}">
            <%@include file="worksLevel1.jsp" %>
        </c:if>
        <c:if test="${breed==2}">
            <%@include file="worksLevel2.jsp" %>
        </c:if>
        <c:if test="${breed==3}">
            <%@include file="worksLevel3.jsp" %>
        </c:if>
        <c:if test="${breed==4||breed==5}">
            <%@include file="worksLevel4.jsp" %>
        </c:if>

        <div class="fixed-footer">
            <div class="weui-form-preview__ft">
                <input id="draftYN" name="draftYN" type="hidden" value="NO">
                <br/>
                <button type="submit" style="color: #333" class="weui-form-preview__btn weui-form-preview__btn_primary"
                        id="draftSubmit">
                    存为草稿
                </button>
                <button type="submit" class="weui-form-preview__btn weui-form-preview__btn_primary">
                    下一步
                </button>
            </div>
        </div>
        <div class="fixed-footer-blank">
        </div>
    </form>
</div>


<script>
    $(function () {

        $('#draftSubmit').on('click', function () {
            $('#draftYN').val('yes');
        })

    })
</script>
</body>
</html>
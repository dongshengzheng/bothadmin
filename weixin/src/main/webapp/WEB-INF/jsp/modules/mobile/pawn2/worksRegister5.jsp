<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>收藏者信息</title>
    <link rel="stylesheet" href="${ctxStatic}/css/custom.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/weui.min.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/jquery-weui.min.css"/>

    <script src="${ctxStatic}/js/jquery-2.1.4.js"></script>
    <script src="${ctxStatic}/js/jquery-weui.js"></script>
    <script src="${ctxStatic}/js/swiper.js"></script>
    <style>
        body {
            background-color: white;
        }

        .title {
            margin-top: 10%;
            text-align: center;
        }

        .title hr {
            width: 80%;
            border-top: 1px solid red;
            color: red;
        }

        .title span {
            position: relative;
            top: -15px;
            background-color: white;
            color: red;
        }

        .fixed-footer a {
            color: #A2D2EF;
        }

        .fixed-footer-blank {
            height: 40%;
            background-color: #F0EFF5;
        }


    </style>
</head>
<body>
<div class="title">
    <center>
        <hr>
        <span>&nbsp;◇&nbsp;JS-A20161205001A&nbsp;◇&nbsp;</span></center>
</div>
<div>
    <form action="${ctx}/mobile/worksRegisterComplete" method="post">
        <div class="weui-cells weui-cells_form">
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">作品名称</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input class="weui-input" value="${sessionScope.registerWorksName}"
                           disabled>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">收藏者</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input name="name" class="weui-input" placeholder="请输入姓名">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">身份证</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input name="no" class="weui-input" type="tel" placeholder="可不填写">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">联系地址</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input name="address" class="weui-input" placeholder="请输入详细地址">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">联系方式</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input name="phone" class="weui-input" type="tel" placeholder="请输入联系方式">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">收藏时间</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input id="showDatePicker" name="collecterDatetimeString" class="weui-input" type="tel"
                           placeholder="请选择时间">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">是否公开</label></div>
                <input name="collecterPub" class="weui-switch" type="checkbox"/>
            </div>
        </div>

        <div class="fixed-footer">
            <div class="weui-form-preview__ft">
                <br>
                <input id="draftYN" name="draftYN" type="hidden" value="NO">
                <button type="submit" class="weui-form-preview__btn weui-form-preview__btn_primary" id="draftSubmit">
                    存为草稿
                </button>
                <button type="submit" class="weui-form-preview__btn weui-form-preview__btn_primary" href="javascript:">
                    确认提交
                </button>
                <button onclick="window.history.back(-1);" type="button"
                        class="weui-form-preview__btn weui-form-preview__btn_primary" id="trueSubmit">
                    上一步
                </button>
            </div>
        </div>
        <div class="fixed-footer-blank">
        </div>
    </form>
</div>
</body>
<script>
    $(function () {
        $('#draftSubmit').on('click', function () {
            $('#draftYN').val('yes');
        })

        $("#showDatePicker").calendar();
    })
</script>
</html>
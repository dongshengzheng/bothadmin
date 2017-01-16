<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>昌化鸡血石鉴定评估报告</title>
    <link rel="stylesheet" href="${ctxStatic}/css/custom.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/weui.min.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/jquery-weui.min.css"/>

    <script src="${ctxStatic}/js/jquery-2.1.4.js"></script>
    <script src="${ctxStatic}/js/jquery-weui.js"></script>
    <script src="${ctxStatic}/js/upload.js"></script>
    <script src="${ctxStatic}/js/plupload-2.1.2/js/moxie.js"></script>
    <script src="${ctxStatic}/js/plupload-2.1.2/js/plupload.dev.js"></script>
    <style>
        .title {
            height: 60px;
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

        .fixed-footer {
            height: 12%;
            z-index: 100;
        }

        .fixed-footer-blank {
            background-color: #F0EFF5;
        }

        .fixed-footer p {
            font-size: 10px;
            text-align: right;
        }

        #confirmSubmit {
            color: #54AAE2;
        }

        .report {
            padding-top: 5px;
            padding-bottom: 5px;
            text-align: center;
            color: gray;
            font-size: 15px;
        }

        .report:before {
            content: url("${ctxStatic}/img/cut/评估报告_icon.png");
            vertical-align: middle;
            display: inline-block;
        }

        .report:after {
            content: url("${ctxStatic}/img/cut/评估报告_icon.png");
            vertical-align: middle;
            display: inline-block;
        }

        .certificate-text {
            height: 8%;
        }

        .certificate-text1 {
            float: left;
            margin-top: 10px;
        }

        .certificate-text2 {
            position: absolute;
            right: 30px;
            margin-top: 10px;
            background-image: url("${ctxStatic}/img/cut/certificate-icon.png");
            background-repeat: no-repeat;
            background-size: 30px;
            background-position-x: right;
            background-position-y: center;
            padding-right: 35px;
        }

        #valueTime {
            position: absolute;
            right: 30px;
            margin-top: 10px;
            background-image: url("${ctxStatic}/img/cut/时间选择_icon.png");
            background-repeat: no-repeat;
            background-size: 15px;
            background-position-x: right;
            background-position-y: center;
            padding-right: 25px;
            width: 100px;
            height: 20px;
            border: none;
        }

        .set-border.weui-cell:before {
            border-top: none;
        }
    </style>
</head>
<body>
<div class="title div-outer">
    <center>
        <hr class="title-hr">
        <span>&nbsp;◇&nbsp;JS-A20161205001A&nbsp;◇&nbsp;</span></center>
    <center><span>${sessionScope.registerWorksName}
    </span></center>
</div>
<form action="${ctx}/mobile/worksRegister5" enctype="multipart/form-data" method="post">
    <div class="div-outer">
        <p class="report">&nbsp;昌化鸡血石鉴定评估报告&nbsp;</p>
        <div class="weui-cell">
            <div class="weui-cell__bd weui-cell_primary">
                <textarea name="des" class="weui-textarea" placeholder="详细鉴定报告..." rows="5"></textarea>
            </div>
        </div>
        <c:if test="${sessionScope.currentUser.type==1||sessionScope.currentUser.type==2}">
            <input id="certImge" name="certImge" type="hidden" value="">
            <div id="removeMoxie" class="weui-cell certificate-text">
                <span class="certificate-text1">鉴定证书</span>
                <a id="uploaderInput2" class="certificate-text2">未上传</a>
            </div>
        </c:if>
    </div>
    <c:if test="${sessionScope.currentUser.type==2}">
        <div class="div-outer">
            <p class="report">&nbsp;金石典当认证价值报告&nbsp;</p>
            <div class="weui-cell">
                <div class="weui-cell__bd weui-cell_primary">
                    <textarea name="certify" class="weui-textarea" placeholder="详细价值报告" rows="5"></textarea>
                </div>
            </div>
            <div class="weui-cell set-border">
                <div class="weui-uploader__bd">
                    <ul class="weui-uploader__files" id="uploaderFiles">
                        <a id="uploaderInput" class="weui-uploader__input-box">
                        </a>
                    </ul>
                </div>
            </div>
            <div class="weui-cell certificate-text">
                <span class="certificate-text1">价值有效时间</span>
                <input name="valueTimeString" id="valueTime" class="showDatePicker" placeholder="选择有效时间">
            </div>
        </div>
    </c:if>
    <br/>
    <div class="fixed-footer">
        <p style="background-color: #F0EFF5">下一步即表示同意为收藏者信息,可不填写直接提交</p>
        <div class="weui-form-preview__ft">
            <br/>
            <input id="draftYN" name="draftYN" type="hidden" value="NO">
            <button type="submit" style="color: #333" class="weui-form-preview__btn weui-form-preview__btn_primary"
                    id="draftSubmit">
                存为草稿
            </button>
            <button id="confirmSubmit" type="submit" class="weui-form-preview__btn weui-form-preview__btn_primary"
                    href="javascript:">
                确认提交
            </button>
            <button id="nextSubmit" type="submit" class="weui-form-preview__btn weui-form-preview__btn_primary"
                    href="javascript:">
                下一步
            </button>
        </div>
    </div>
    <div class="fixed-footer-blank">
    </div>
</form>
</div>

<div>
    <div class="weui-mask" id="iosMask" style="display: none"></div>
    <div class="weui-actionsheet" id="iosActionsheet">
        <div class="weui-actionsheet__menu">
            <div class="weui-actionsheet__cell" id="del">删除</div>
            <div class="weui-actionsheet__cell" id="prelook">预览</div>
        </div>
        <div class="weui-actionsheet__action">
            <div class="weui-actionsheet__cell" id="iosActionsheetCancel">取消</div>
        </div>
    </div>
</div>


<div id="dialogs">
    <div class="js_dialog" id="iosDialog2" style="display: none;">
        <div class="weui-mask"></div>
        <div class="weui-dialog">
            <div class="weui-dialog__bd">作品登记申请提交成功,请耐心等待工作人员审核!</div>
            <div class="weui-dialog__ft">
                <a href="indexWorks.html" class="weui-dialog__btn weui-dialog__btn_primary">我知道了</a>
            </div>
        </div>
    </div>
</div>

<div class="weui-gallery" id="gallery">
    <span class="weui-gallery__img" id="galleryImg"></span>
</div>
<input id="bucket" type="hidden" value="${bucket}">
<input id="redirectUrl" type="hidden" value="${redirectUrl}">
<script type="text/javascript">
    $(function () {

        var $iosActionsheet = $('#iosActionsheet');
        var $iosMask = $('#iosMask');

        function hideActionSheet() {
            $iosActionsheet.removeClass('weui-actionsheet_toggle');
            $iosMask.fadeOut(200);
        }

        $iosMask.on('click', hideActionSheet);
        $('#iosActionsheetCancel').on('click', hideActionSheet);
        function haveUpload() {
            $iosActionsheet.addClass('weui-actionsheet_toggle');
            $iosMask.fadeIn(200);
        }


        $('#dialogs').on('click', '.weui-dialog__btn', function () {
            $(this).parents('.js_dialog').fadeOut(200);
        });

        var $iosDialog2 = $('#iosDialog2');

        $('#dialogs').on('click', '.weui-dialog__btn', function () {
            $(this).parents('.js_dialog').fadeOut(200);
        });

        $('#confirmSubmit').on('click', function () {
            $iosDialog2.fadeIn(200);
        });


        $('#prelook').on('click', function () {
            hideActionSheet();
            $('#galleryImg').css('background-image', $('li').css('background-image'))
            $("#gallery").fadeIn(100);
        });

        $("#gallery").on("click", function () {
            $("#gallery").fadeOut(100);
        });


        $('#del').on('click', function () {
            $('.certImageUpload').remove();
            $('.certificate-text2').html("未上传").attr('id', 'uploaderInput2');
            initUploaders2($('#bucket').val(), $('#redirectUrl').val());
            hideActionSheet();
        })

        $('#confirmSubmit').on('click', function () {
            $('#draftYN').val('confirm');
        })


        $('#draftSubmit').on('click', function () {
            $('#draftYN').val('yes');
        })

        $(".showDatePicker").on('click', function () {
            $('input').blur();
            $('textarea').blur();
            $(this).calendar();
        })

        initUploaders2($('#bucket').val(), $('#redirectUrl').val() + "/");
        initUploaders($('#bucket').val(), $('#redirectUrl').val() + "/", "valueImages");

    });
</script>
</body>
</html>
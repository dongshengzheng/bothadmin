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

        .fixed-footer {
            height: 12%;
        }

        .fixed-footer p {
            font-size: 10px;
            padding-left: 25%;
        }

        .fixed-footer a {
            color: #A2D2EF;
        }

        .fixed-footer-blank {
            background-color: white;
        }

        #confirmSubmit {
            color: #54AAE2;
        }

        .report {
            text-align: center;
            color: gray;
            font-size: 10px;
        }

        .report:before {
            content: url("${ctxStatic}/img//cut/评估报告_icon.png");
            vertical-align: middle;
            display: inline-block;
        }

        .report:after {
            content: url("${ctxStatic}/img//cut/评估报告_icon.png");
            vertical-align: middle;
            display: inline-block;
        }

        #certificate-text1 {
            float: left;
            margin-top: 10px;
        }

        #certificate-text2 {
            float: right;
            margin-top: 10px;
            background-image: url("${ctxStatic}/img//cut/证书icon.png");
            background-repeat: no-repeat;
            background-size: 30px;
            background-position-x: right;
            background-position-y: center;
            padding-right: 35px;
        }


    </style>
</head>
<body>
<div class="title">
    <center>
        <hr>
        <span>&nbsp;◇&nbsp;JS-A20161205001A&nbsp;◇&nbsp;</span></center>
    <center><span>田黄鸡血石精品吊坠</span></center>
</div>
<form action="worksRegister5.jsp" enctype="multipart/form-data" method="post">
    <div class="div-outer">

        <p class="report">昌化鸡血石鉴定评估报告</p>
        <div class="weui-cell__bd weui-cell_primary">
            <textarea class="weui-textarea" placeholder="详细鉴定报告..." rows="13"></textarea>
            <!--<div class="weui-textarea-counter">-->
            <!--<span>0</span>/200-->
            <!--</div>-->
        </div>
        <div>
            <span id="certificate-text1">鉴定证书</span>
            <span id="certificate-text2">已上传</span>
        </div>
    </div>

    <div class="fixed-footer">
        <p>下一步即表示同意为收藏者信息,可不填写直接提交</p>
        <hr>
        <div class="weui-form-preview__ft">
            <a class="weui-form-preview__btn weui-form-preview__btn_default" href="javascript:">存为草稿</a>
            <button id="confirmSubmit" type="button" class="weui-form-preview__btn weui-form-preview__btn_primary"
                    href="javascript:">
                确认提交
            </button>
            <button type="submit" class="weui-form-preview__btn weui-form-preview__btn_primary" href="javascript:">
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
            <div class="weui-actionsheet__cell">删除</div>
            <div class="weui-actionsheet__cell" id="transfer">预览</div>
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

<script type="text/javascript">
    $(function () {
        var tmpl = '<li class="weui-uploader__file" style="background-image:url(#url#)"></li>',
                $gallery = $("#gallery"), $galleryImg = $("#galleryImg"),
                $uploaderInput = $("#uploaderInput"),
                $uploaderFiles = $("#uploaderFiles")
                ;

        $uploaderInput.on("change", function (e) {
            var src, url = window.URL || window.webkitURL || window.mozURL, files = e.target.files;
            for (var i = 0, len = files.length; i < len; ++i) {
                var file = files[i];

                if (url) {
                    src = url.createObjectURL(file);
                } else {
                    src = e.target.result;
                }

                $uploaderFiles.append($(tmpl.replace('#url#', src)));
            }
        });
        $uploaderFiles.on("click", "li", function () {
            $galleryImg.attr("style", this.getAttribute("style"));
            $gallery.fadeIn(100);
        });
        $gallery.on("click", function () {
            $gallery.fadeOut(100);
        });


        var $iosActionsheet = $('#iosActionsheet');
        var $iosMask = $('#iosMask');
        var $iosDialog1 = $('#iosDialog1');

        function hideActionSheet() {
            $iosActionsheet.removeClass('weui-actionsheet_toggle');
            $iosMask.fadeOut(200);
        }

        $iosMask.on('click', hideActionSheet);
        $('#iosActionsheetCancel').on('click', hideActionSheet);
        $("#certificate-text2").on("click", function () {
            $iosActionsheet.addClass('weui-actionsheet_toggle');
            $iosMask.fadeIn(200);
        });

        $('#dialogs').on('click', '.weui-dialog__btn', function () {
            $(this).parents('.js_dialog').fadeOut(200);
        });

        $('#transfer').on('click', function () {
            $iosDialog1.fadeIn(200);
            hideActionSheet();
        });

        var $iosDialog2 = $('#iosDialog2');

        $('#dialogs').on('click', '.weui-dialog__btn', function () {
            $(this).parents('.js_dialog').fadeOut(200);
        });

        $('#confirmSubmit').on('click', function () {
            $iosDialog2.fadeIn(200);
        });


    });
</script>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>作品编辑</title>
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

        .weui-navbar {
            width: 97%;
            margin: 1%;
            border: 1px solid #2698DE;
            border-radius: 5px;
        }

        .weui-navbar__item.weui-bar__item_on {
            background-color: #2698DE;
            color: white;
        }

        .weui-navbar__item {
            border: 1px solid #2698DE;
            background-color: white;
            color: #2698DE;
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
            content: url("${ctxStatic}/img/cut/评估报告_icon.png");
            vertical-align: middle;
            display: inline-block;
        }

        .report:after {
            content: url("${ctxStatic}/img/cut/评估报告_icon.png");
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
            background-image: url("${ctxStatic}/img/cut/证书icon.png");
            background-repeat: no-repeat;
            background-size: 30px;
            background-position-x: right;
            background-position-y: center;
            padding-right: 35px;
        }


    </style>
</head>
<body>
<div class="weui-tab">
    <div class="weui-navbar">
        <div class="weui-navbar__item " id="check-title-success">
            物品信息
        </div>
        <div class="weui-navbar__item " id="check-title-now">
            作品信息
        </div>
        <div class="weui-navbar__item " id="check-title-failure">
            作品等级
        </div>
        <div class="weui-navbar__item weui-bar__item_on" id="check-title-draft">
            评估报告
        </div>
        <div class="weui-navbar__item" id="check-title-">
            收藏信息
        </div>
    </div>
</div>
<div class="fixed-footer-blank">

</div>
<div class="title">
    <center>
        <hr>
        <span>&nbsp;◇&nbsp;JS-A20161205001A&nbsp;◇&nbsp;</span></center>
    <center><span>田黄鸡血石精品吊坠</span></center>
</div>
<form action="worksRegister5.jsp" enctype="multipart/form-data">
    <div class="div-outer">
        <p class="report">昌化鸡血石鉴定评估报告</p>
        <div class="weui-cell__bd weui-cell_primary">
            <textarea class="weui-textarea" placeholder="详细鉴定报告..." rows="17">    测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字</textarea>
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
        <hr>
        <div class="weui-form-preview__ft">
            <a class="weui-form-preview__btn weui-form-preview__btn_default" href="javascript:">放弃修改</a>
            <button type="submit" class="weui-form-preview__btn weui-form-preview__btn_primary" href="javascript:">
                提交审核
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

        $(function () {
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
        });
    });
</script>
</body>
</html>
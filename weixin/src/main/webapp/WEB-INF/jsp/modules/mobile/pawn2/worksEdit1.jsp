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

        body {
            background-color: white;
        }

        .title {
            margin-top: 4%;
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
            padding-left: 30%;
        }

        .fixed-footer a {
            color: #A2D2EF;
        }


    </style>
</head>
<body>
<div class="weui-tab">
    <div class="weui-navbar">
        <div class="weui-navbar__item weui-bar__item_on" id="check-title-success">
            物品信息
        </div>
        <div class="weui-navbar__item" id="check-title-now">
            作品信息
        </div>
        <div class="weui-navbar__item" id="check-title-failure">
            作品等级
        </div>
        <div class="weui-navbar__item" id="check-title-draft">
            评估报告
        </div>
        <div class="weui-navbar__item" id="check-title-">
            收藏信息
        </div>
    </div>
</div>
<div class="fixed-footer-blank">

</div>

<div class="title div-outer">
    <center>
        <hr>
        <span>&nbsp;◇&nbsp;JS-A20161205001A&nbsp;◇&nbsp;</span></center>
</div>
<div>
    <form action="${ctx}/mobile/worksEdit2" enctype="multipart/form-data">
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">作品名称</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input class="weui-input" type="tel" placeholder="请输入作品名称">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">提供者</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input class="weui-input" type="tel" placeholder="请输入姓名">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">身份证</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input class="weui-input" type="tel" placeholder="可不填写">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">联系地址</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input class="weui-input" type="tel" placeholder="请输入详细地址">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">联系方式</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input class="weui-input" type="tel" placeholder="请输入联系方式">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">登记时间</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input class="weui-input" id="showDatePicker" type="tel" placeholder="请选择时间">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__bd weui-cell_primary">
                <textarea class="weui-textarea" placeholder="我的作品描述" rows="3"></textarea>
                <!--<div class="weui-textarea-counter">-->
                <!--<span>0</span>/200-->
                <!--</div>-->
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__bd">
                <div class="weui-uploader">
                    <!--<div class="weui-uploader__hd">-->
                    <!--<p class="weui-uploader__title">图片上传</p>-->
                    <!--<div class="weui-uploader__info">0/2</div>-->
                    <!--</div>-->
                    <div class="weui-uploader__bd">
                        <ul class="weui-uploader__files" id="uploaderFiles">
                            <li class="weui-uploader__file"
                                style="background-image:url(${ctxStatic}/img/headImg/2.jpg)"></li>
                            <li class="weui-uploader__file weui-uploader__file_status"
                                style="background-image:url(${ctxStatic}/img/headImg/2.jpg)">
                                <div class="weui-uploader__file-content">
                                    <i class="weui-icon-warn"></i>
                                </div>
                            </li>
                            <li class="weui-uploader__file weui-uploader__file_status"
                                style="background-image:url(${ctxStatic}/img/headImg/2.jpg)">
                                <div class="weui-uploader__file-content">50%</div>
                            </li>
                        </ul>
                        <div class="weui-uploader__input-box">
                            <input id="uploaderInput" class="weui-uploader__input" type="file" accept="image/*"
                                   multiple/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="fixed-footer">
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
<script>``
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

//        $('#showDatePicker').on('click', function () {
//            weui.datePicker({
//                start: 1990,
//                end: new Date().getFullYear(),
//                onChange: function (result) {
//                    console.log(result);
//                },
//                onConfirm: function (result) {
//                    console.log(result);
//                }
//            });
//        });

    $(function () {
        $('.weui-navbar__item').on('click', function () {
            $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
        });
    });
});

</script>
</body>
</html>
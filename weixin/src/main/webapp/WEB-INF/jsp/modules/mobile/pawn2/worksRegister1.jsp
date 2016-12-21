<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>物品信息</title>
    <link rel="stylesheet" href="${ctxStatic}/css/custom.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/weui.min.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/jquery-weui.min.css"/>
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
    <form action="${ctx}/mobile/worksRegister2" enctype="multipart/form-data" method="post">
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">作品名称</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input name="worksName" class="weui-input" type="tel" placeholder="请输入作品名称">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">提供者</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input name="provideBy" class="weui-input" type="tel" placeholder="请输入姓名">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">身份证</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input name="consumerNo" class="weui-input" type="tel" placeholder="可不填写">
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
            <div class="weui-cell__hd"><label class="weui-label">登记时间</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input name="createDateString" class="weui-input" id="showDatePicker" type="text" placeholder="请选择时间">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__bd weui-cell_primary">
                <textarea name="worksRemarks" class="weui-textarea" placeholder="我的作品描述" rows="3"></textarea>
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
                            <a id="uploaderInput" class="weui-uploader__input-box">
                            </a>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" name="imgUrls" id="imgUrls"/>
        <div class="fixed-footer">
            <p>下一步即表示同意<a href="javascript:;" id="register-rule">《金石典当登记申请记录》</a></p>
            <hr>
            <div class="weui-form-preview__ft">
                <input id="draftYN" name="draftYN" type="hidden" value="NO">
                <button type="submit" class="weui-form-preview__btn weui-form-preview__btn_primary" id="draftSubmit">
                    存为草稿
                </button>
                <button type="submit" class="weui-form-preview__btn weui-form-preview__btn_primary" id="trueSubmit">
                    下一步
                </button>
            </div>
        </div>
        <div class="fixed-footer-blank">
        </div>
    </form>
</div>

<div class="js_dialog" style="display: none;">
    <div class="weui-mask"></div>
    <div class="weui-dialog">
        <div class="weui-dialog__hd"><strong class="weui-dialog__title">登记申请须知</strong></div>
        <div class="weui-dialog__bd">登记申请须知.....</div>
        <div class="weui-dialog__ft">
            <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary">我知道了</a>
        </div>
    </div>
</div>

<div class="weui-gallery" id="gallery">
    <span class="weui-gallery__img" id="galleryImg"></span>
    <div class="weui-gallery__opr">
        <a href="javascript:" class="weui-gallery__del">
            <i class="weui-icon-delete weui-icon_gallery-delete"></i>
        </a>
    </div>
</div>
<script src="${ctxStatic}/js/jquery-2.1.4.js"></script>
<script src="${ctxStatic}/js/jquery-weui.js"></script>
<script src="${ctxStatic}/js/upload.js"></script>
<script src="${ctxStatic}/js/plupload-2.1.2/js/moxie.js"></script>
<script src="${ctxStatic}/js/plupload-2.1.2/js/plupload.dev.js"></script>
<script>
    $(function () {

        $('#register-rule').on('click', function () {
            $(".js_dialog").fadeIn(200);
        })
        $('.weui-dialog__btn_primary').on('click', function () {
            $(".js_dialog").fadeOut(200);
        })

        $("#showDatePicker").calendar();

        initUploaders("windyeel", "http://steins00gate.s1.758kongbao.com/");


        $('#trueSubmit').on('click', function () {
            var lis = $('li');
            var imgUrls = "";
            var len = lis.length;
            if (len > 0) {
                lis.each(function () {
                    var li = $(this);
                    var str = li.css("background-image");
                    var length = str.length;
                    var url = str.substring(5, length - 2);
                    imgUrls += url + '|';
                })
                imgUrls = imgUrls.substring(0, imgUrls.length - 1);
            }
            $('#imgUrls').val(imgUrls);
        })

        $('#draftSubmit').on('click', function () {
            var lis = $('li');
            var imgUrls = "";
            var len = lis.length;
            if (len > 0) {
                lis.each(function () {
                    var li = $(this);
                    var str = li.css("background-image");
                    var length = str.length;
                    var url = str.substring(5, length - 2);
                    imgUrls += url + '|';
                })
                imgUrls = imgUrls.substring(0, imgUrls.length - 1);
            }
            $('#imgUrls').val(imgUrls);
            $('#draftYN').val('yes');
        })

    });

</script>
</body>
</html>
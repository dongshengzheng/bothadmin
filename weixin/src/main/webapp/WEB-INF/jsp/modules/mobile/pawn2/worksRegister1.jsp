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

        .fixed-footer {
            height: 12%;
            z-index: 100;
        }

        .fixed-footer p {
            font-size: 10px;
            text-align: right;
            background-color: #F0EFF5;
        }

        .fixed-footer a {
            color: #3A9FDE;
        }

        .set-border.weui-cell:before {
            border-top: none;
        }

    </style>
</head>
<body>
<div class="title div-outer">
    <center>
        <hr>
        <span>&nbsp;◇&nbsp;JS-A20161205001A&nbsp;◇&nbsp;</span></center>
</div>
<div class="div-outer">
    <form id="works-info" action="${ctx}/mobile/worksRegister2" enctype="multipart/form-data" method="post">
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">作品名称</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input name="worksName" class="weui-input form-control" placeholder="请输入作品名称">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">提供者</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input name="providerName" class="weui-input" value="<c:if test='${appUser.name!=null}'>${appUser.name}</c:if>" placeholder="请输入姓名">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">身份证</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input name="providerNo" class="weui-input" type="tel" value="<c:if test='${appUser.identification!=null}'>${appUser.identification}</c:if>" placeholder="可不填写">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">联系地址</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input name="address" class="weui-input" value="<c:if test='${appUser.address!=null}'>${appUser.address}</c:if>" placeholder="请输入详细地址">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">联系方式</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input name="phone" class="weui-input" type="tel" value="<c:if test='${appUser.phone!=null}'>${appUser.phone}</c:if>" placeholder="请输入联系方式">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">登记时间</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input name="createDateString" class="weui-input showDatePicker" placeholder="请选择时间">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__bd weui-cell_primary">
                <textarea name="worksRemarks" class="weui-textarea" placeholder="我的作品描述" rows="3"></textarea>
            </div>
        </div>
        <div class="weui-cell set-border">
            <div class="weui-cell__bd">
                <div class="weui-uploader">
                    <div class="weui-uploader__bd">
                        <ul class="weui-uploader__files" id="uploaderFiles">
                            <a id="uploaderInput" class="weui-uploader__input-box">
                            </a>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="fixed-footer">
            <p>下一步即表示同意<a href="javascript:;" id="register-rule">《金石典当登记申请记录》</a></p>
            <div class="weui-form-preview__ft">
                <input id="draftYN" name="draftYN" type="hidden" value="NO">
                <br/>
                <button type="submit" style="color: #333" class="weui-form-preview__btn weui-form-preview__btn_primary"
                        id="draftSubmit">
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
<input id="bucket" type="hidden" value="${bucket}">
<input id="redirectUrl" type="hidden" value="${redirectUrl}">
<script src="${ctxStatic}/js/jquery-2.1.4.js"></script>
<script src="${ctxStatic}/js/jquery-weui.js"></script>
<script src="${ctxStatic}/js/jquery.validate.min.js"></script>
<script src="${ctxStatic}/js/upload.js"></script>
<script src="${ctxStatic}/js/plupload-2.1.2/js/moxie.js"></script>
<script src="${ctxStatic}/js/plupload-2.1.2/js/plupload.dev.js"></script>
<script>
    $(function () {
        initUploaders($('#bucket').val(), $('#redirectUrl').val() + "/");
        $('#register-rule').on('click', function () {
            $(".js_dialog").fadeIn(200);
        })
        $('.weui-dialog__btn_primary').on('click', function () {
            $(".js_dialog").fadeOut(200);
        })

        $(".showDatePicker").on('click', function () {
            $('input').blur();
            $('textarea').blur();
            $(this).calendar();
        })


        $('#draftSubmit').on('click', function () {
            $('#draftYN').val('yes');
        })

        $.validator.addMethod("checkPhone",
            function (value,element,params) {
                var retu = value.match(params);
                if(retu){
                    return true;
                }
                return false;
            });

        var $from = $("#works-info");
        $from.validate({
            rules: {
                worksName: "required",
                providerName: "required",
                providerNo:{
                    required:true,
//                    checkNo:"(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)"
                },
                address:"required",
                phone:{
                    required:true,
                    checkPhone:"^1(3[0-9]|4[57]|5[0-35-9]|7[01678]|8[0-9])\\d{8}$"
                },
                createDateString:"required",
                worksRemarks:"required"
            },
            messages: {
                worksName: {required: "作品名称必填"},
                providerName: {required: "提供者必填"},
                providerNo: {
                    required: "身份证必填",
//                    checkNo:"请填写正确格式的身份证号码"
                },
                address: {required: "联系地址必填"},
                phone: {
                    required: "手机号码必填",
                    checkPhone:"请填写正确的手机号码"
                },
                createDateString: {required: "登记时间必填"},
                worksRemarks: {required: "作品描述必填"}
            }
        });
    });

</script>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<style>
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
        height: 12%;
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
        background-size: 18px;
        background-position-x: right;
        background-position-y: center;
        padding-right: 25px;
        width: 100px;
        border: none;
    }
</style>
<div class="div-outer">
    <p class="report">&nbsp;昌化鸡血石鉴定评估报告&nbsp;</p>
    <div class="div-outer">
        <div class="weui-cell">
            <div class="weui-cell__bd weui-cell_primary">
            <textarea name="des" class="weui-textarea" placeholder="详细鉴定报告..."
                      rows="5">${report.des}</textarea>
            </div>
        </div>
        <div id="removeMoxie" class="weui-cell certificate-text">
            <span class="certificate-text1">鉴定证书</span>
            <c:if test="${(!empty certImage.url)&&(fn:length(certImage.url)>0)}">
                <li class="weui-uploader__file certImageUpload"
                    style="display:none;background-image:url(http://windyeel.img-cn-shanghai.aliyuncs.com/${certImage.url}?x-oss-process=image/resize,m_fill,h_100,w_100)">
                    <input name="certImage" type="hidden" value="${certImage.url}">
                </li>
                <a id="haveUpload" class="certificate-text2">已上传</a>
            </c:if>
            <c:if test="${(empty certImage.url)||(fn:length(certImage.url)==0)}">
                <a id="uploaderInput2" class="certificate-text2">未上传</a>
            </c:if>
        </div>
    </div>
</div>
<div class="div-outer">
    <p class="report">&nbsp;金石典当认证价值报告&nbsp;</p>
    <div class="weui-cell">
        <div class="weui-cell__bd weui-cell_primary">
            <textarea name="certify" class="weui-textarea" placeholder="详细价值报告"
                      rows="5">${report.certify}</textarea>
        </div>
    </div>
    <div class="weui-uploader">
        <div class="weui-uploader__bd">
            <ul class="weui-uploader__files" id="uploaderFiles">
                <c:forEach items="${valueImages}" var="image">
                    <li class="weui-uploader__file valueImages"
                        style="background-image:url(
                                http://windyeel.img-cn-shanghai.aliyuncs.com/${image.url}?x-oss-process=image/resize,m_fill,h_100,w_100)">
                        <input name="valueImages" type="hidden" value="${image.url}">
                    </li>
                </c:forEach>
                <a id="uploaderInput3" class="weui-uploader__input-box">
                </a>
            </ul>
        </div>
    </div>

    <div class="weui-cell certificate-text">
        <span class="certificate-text1">价值有效时间</span>
        <input name="valueTimeString" id="valueTime"
               value="<fmt:formatDate value='${report.validTime}' pattern="yyyy-MM-dd"/>"
               placeholder="选择有效时间">
    </div>
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

<div class="weui-gallery" id="gallery">
    <span class="weui-gallery__img" id="galleryImg"></span>
</div>

<script>
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


        $('#prelook').on('click', function () {
            hideActionSheet();
            $('#galleryImg').css('background-image', $('li').css('background-image'))
            $("#gallery").fadeIn(100);
        });

        $("#gallery").on("click", function () {
            $("#gallery").fadeOut(100);
        });

        $('#del').on('click', function () {
            $('#removeMoxie .weui-uploader__file').remove();
            $('.certificate-text2').html("未上传").attr('id', 'uploaderInput2');
            initUploaders2($('#bucket').val(), $('#redirectUrl').val());
            hideActionSheet();
        })

        $('#haveUpload').on('click', function () {
            $('#iosActionsheet').addClass('weui-actionsheet_toggle');
            $('#iosMask').fadeIn(200);
        })

    });
</script>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<style>

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

    .certificate-text1 {
        float: left;
        margin-top: 10px;
    }

    .certificate-text2 {
        float: right;
        margin-top: 10px;
        background-image: url("${ctxStatic}/img/cut/certificate-icon.png");
        background-repeat: no-repeat;
        background-size: 30px;
        background-position-x: right;
        background-position-y: center;
        padding-right: 35px;
    }


</style>
<div class="div-outer">
    <p class="report">昌化鸡血石鉴定评估报告</p>
    <div class="weui-cell">
        <div class="weui-cell__bd weui-cell_primary">
            <textarea class="weui-textarea" placeholder="详细鉴定报告..." rows="15">    测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字</textarea>
            <!--<div class="weui-textarea-counter">-->
            <!--<span>0</span>/200-->
            <!--</div>-->
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell certificate-text">
            <span class="certificate-text1">鉴定证书</span>
            <c:if test="${!empty certificateImg}">
                <a id="haveUpload" class="certificate-text2">已上传</a>
            </c:if>
            <c:if test="${empty certificateImg}">
                <a id="uploaderInput2" class="certificate-text2">未上传</a>
            </c:if>
        </div>
    </div>
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

        initUploaders2("windyeel", "http://steins00gate.s1.natapp.cc/");

        $('#del').on('click', function () {
            $('.weui-uploader__file').remove();
            $('.certificate-text2').html("未上传").attr('id', 'uploaderInput2');
            hideActionSheet();
        })
    });
</script>
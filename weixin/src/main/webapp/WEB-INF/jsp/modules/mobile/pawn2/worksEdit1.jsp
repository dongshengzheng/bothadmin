<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">作品名称</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="worksName" class="weui-input" type="tel" value="${works.name}" placeholder="请输入作品名称">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">提供者</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="provideBy" class="weui-input" type="tel" value="${works.provideBy}" placeholder="请输入姓名">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">身份证</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="consumerNo" class="weui-input" type="tel" value="${consumer.no}" placeholder="可不填写">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">联系地址</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="address" class="weui-input" type="tel" value="${consumer.address}" placeholder="请输入详细地址">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">联系方式</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="phone" class="weui-input" type="tel" value="${consumer.phone}" placeholder="请输入联系方式">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">登记时间</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="createDateString" class="weui-input" id="showDatePicker" type="tel"
               value="<fmt:formatDate value='${works.createDate}'
                        pattern="yyyy-MM-dd"/>" placeholder="请选择时间">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__bd weui-cell_primary">
        <textarea name="worksRemarks" class="weui-textarea" placeholder="我的作品描述" rows="3">${works.remarks}</textarea>
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
<script>
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
            $('.weui-navbar__item').on('click', function () {
                $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
            });
        });

        $("#showDatePicker").calendar();
    });
</script>
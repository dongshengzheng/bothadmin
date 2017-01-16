<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">作品名称</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input id="worksName" name="works.name" class="weui-input" type="tel" value="${works.name}"
               placeholder="请输入作品名称">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">提供者</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="provider.name" class="weui-input" type="tel" value="${provider.name}" placeholder="请输入姓名">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">身份证</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="provider.no" class="weui-input" value="${provider.no}" placeholder="可不填写">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">联系地址</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="provider.address" class="weui-input" type="tel" value="${provider.address}" placeholder="请输入详细地址">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">联系方式</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="provider.phone" class="weui-input" type="tel" value="${provider.phone}" placeholder="请输入联系方式">
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
        <textarea name="works.remarks" class="weui-textarea" placeholder="我的作品描述" rows="3">${works.remarks}</textarea>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__bd">
        <div class="weui-uploader">
            <div class="weui-uploader__bd">
                <ul class="weui-uploader__files">
                    <c:forEach items="${worksImagesList}" var="image">
                        <li class="weui-uploader__file worksImages"
                            style="background-image:url(
                                    http://windyeel.img-cn-shanghai.aliyuncs.com/${image.url}?x-oss-process=image/resize,m_fill,h_100,w_100)">
                            <input name="worksImages" type="hidden" value="${image.url}">
                        </li>
                    </c:forEach>
                    <a id="uploaderInput" class="weui-uploader__input-box">
                    </a>
                </ul>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        initUploaders($('#bucket').val(), $('#redirectUrl').val() + "/", "worksImages");
        initUploaders2($('#bucket').val(), $('#redirectUrl').val() + "/");
        initUploaders3($('#bucket').val(), $('#redirectUrl').val() + "/", "valueImages");
    })
</script>
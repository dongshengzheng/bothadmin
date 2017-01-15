<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">作品名称</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="worksShowName" class="weui-input worksShowName" type="tel" value="${works.name}"
               placeholder="作品名称" disabled>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">收藏者</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="collecter.name" class="weui-input" type="tel" value="${collecter.name}" placeholder="请输入姓名">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">身份证</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="collecter.no" class="weui-input" type="tel" value="${collecter.no}" placeholder="可不填写">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">联系地址</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="collecter.address" class="weui-input" type="tel" value="${collecter.address}"
               placeholder="请输入详细地址">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">联系方式</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="collecter.phone" class="weui-input" type="tel" value="${collecter.phone}" placeholder="请输入联系方式">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">收藏时间</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="collecterDateTimeString" id="collecterDatePicker" class="weui-input" type="tel"
               value="<fmt:formatDate value='${collecter.datetime}' pattern="yyyy-MM-dd"/>" placeholder="请选择时间">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">是否公开</label></div>
    <input name="collecterPub" class="weui-switch" type="checkbox" <c:if test="${collecter.pub==1}">checked</c:if>/>
</div>
<script>
    $(function () {
        $('#collecterDatePicker').calendar();
    })
</script>


<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">作品名称</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="worksShowName" class="weui-input" type="tel" value="${works.name}" placeholder="田黄鸡血石精品吊坠">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">收藏者</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="collecterName" class="weui-input" type="tel" value="${collecter.name}" placeholder="请输入姓名">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">身份证</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="collecterNo" class="weui-input" type="tel" value="${collecter.no}" placeholder="可不填写">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">联系地址</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="collecterAddress" class="weui-input" type="tel" value="${collecter.address}" placeholder="请输入详细地址">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">联系方式</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="collecterPhone" class="weui-input" type="tel" value="${collecter.phone}" placeholder="请输入联系方式">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">收藏时间</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="collecterDatetimeString" id="collecterDatePicker" class="weui-input" type="tel"
               value="${collecter.datetime}" placeholder="请选择时间">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">是否公开</label></div>
    <input name="collecterPub" class="weui-switch" type="checkbox"/>
</div>
<script>
    $(function () {
        $('#collecterDatePicker').calendar();
    })
</script>


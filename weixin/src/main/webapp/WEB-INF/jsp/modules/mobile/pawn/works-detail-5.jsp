<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>

<div class="weui_cells_title">收藏者信息</div>
<div class="weui_cells weui_cells_form">
    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">收藏者</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <span>${collect.customer}</span>
        </div>
    </div>
    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">姓名</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <span>${collect.name}</span>
        </div>
    </div>

    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">身份证</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <span>${collect.no}</span>
        </div>
    </div>

    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">地址</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <span>${collect.address}</span>
        </div>
    </div>
    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">联系方式</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <span>${collect.phone}</span>
        </div>
    </div>
    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">收藏时间</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <span><fmt:formatDate value="${collect.datetime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
        </div>
    </div>
</div>
<div class="weui_cells_title">备注</div>
<div class="weui_cells weui_cells_form" style="margin-bottom: 15px;">
    <div class="weui_cell">
        <div class="weui_cell_bd weui_cell_primary">
            <textarea class="weui_textarea" rows="3" readonly>${collect.remark}</textarea>
        </div>
    </div>
</div>
<c:if test="${user.office.name != '普通用户' && works.status == 1}">
<div style="padding:0px 10%;">
    <a href="javascript:;" class="weui_btn weui_btn_warn" onclick="toPage(2)">下一页</a>
</div></c:if>
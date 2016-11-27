<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>

<div class="weui_cells_title">基本信息</div>
<div class="weui_cells weui_cells_form">
    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">提供作品名称</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="collect_customer" name="collect_collect_customer" type="text" value="${collect.customer}"
                   placeholder="请输入提供作品名称(选填)">
        </div>
    </div>
    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">姓名</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="collect_name" name="collect_name" type="text" value="${collect.name}"
                   placeholder="请输入姓名">
        </div>
    </div>

    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">身份证</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="collect_no" name="collect_no" type="number" value="${collect.no}"
                   placeholder="请输入身份证">
        </div>
    </div>

    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">地址</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="collect_address" name="collect_address" type="text" value="${collect.address}"
                   placeholder="请输入地址">
        </div>
    </div>
    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">联系方式</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="collect_phone" name="collect_phone" type="text" value="${collect.phone}"
                   placeholder="请输入联系方式">
        </div>
    </div>
    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">收藏时间</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="collect_datetime" name="collect_datetime" type="datetime"  value="<fmt:formatDate value="${collect.datetime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   placeholder="请输入收藏时间">
        </div>
    </div>
</div>
<div class="weui_cells weui_cells_form">
    <div class="weui_cell weui_cell_switch">
        <div class="weui_cell_hd weui_cell_primary">是否公开</div>
        <div class="weui_cell_ft">
            <input class="weui_switch" type="checkbox"  <c:if test="${collect.pub == '1' }"> checked</c:if>>
        </div>
    </div>
</div>
<div class="weui_cells_title">备注</div>
<div class="weui_cells weui_cells_form" style="margin-bottom: 15px;">
    <div class="weui_cell">
        <div class="weui_cell_bd weui_cell_primary">
            <textarea class="weui_textarea" rows="3"  id="collect_remark" name="collect_remark" placeholder="请输入备注信息">${collect.remark}</textarea>
        </div>
    </div>
</div>
<div style="padding:10px 10%;">
    <a href="javascript:;" class="weui_btn weui_btn_primary" onclick="editCollect(0)"
       style="width: 45%;display: inline-block">保存草稿</a>
    <a href="javascript:;" class="weui_btn weui_btn_warn" onclick="editCollect(1)"
       style="width: 45%;display: inline-block">提交审核</a>
</div>
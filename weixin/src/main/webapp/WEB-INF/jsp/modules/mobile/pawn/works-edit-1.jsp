<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>

<style>
    .weui_cell:before {
        left: 0px;
    }
</style>
<div class="weui_cells_title">基本信息</div>
<div class="weui_cells weui_cells_form">
    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">提供作品名称</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="provider_customer" name="provider_provider_customer" type="text" value="${provider.customer}"
                   placeholder="请输入提供作品名称(选填)">
        </div>
    </div>
    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">姓名</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="provider_name" name="provider_name" type="text" value="${provider.name}"
                   placeholder="请输入姓名">
        </div>
    </div>

    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">身份证</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="provider_no" name="provider_no" type="number" value="${provider.no}"
                   placeholder="请输入身份证">
        </div>
    </div>

    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">地址</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="provider_address" name="provider_address" type="text" value="${provider.address}"
                   placeholder="请输入地址">
        </div>
    </div>
    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">联系方式</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="provider_phone" name="provider_phone" type="text" value="${provider.phone}"
                   placeholder="请输入联系方式">
        </div>
    </div>
    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">登记时间</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="provider_datetime" name="provider_datetime" type="datetime" value="<fmt:formatDate value="${provider.datetime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   placeholder="请输入登记时间">
        </div>
    </div>
</div>
<div class="weui_cells_title">备注</div>
<div class="weui_cells weui_cells_form" style="margin-bottom: 15px;">
    <div class="weui_cell">
        <div class="weui_cell_bd weui_cell_primary">
            <textarea class="weui_textarea" rows="3"  id="provider_remark" name="provider_remark" placeholder="请输入备注信息">${provider.remark}</textarea>
        </div>
    </div>
</div>
<div class="weui_cell weui_cell_warn" style="padding: 0px;">
    <div class="weui_cell">
        <div class="weui_cell_bd weui_cell_primary">
            <div class="weui_uploader">
                <div class="weui_uploader_hd weui_cell">
                    <div class="weui_cell_bd weui_cell_primary">图片上传</div>
                </div>
                <div class="weui_uploader_bd">
                    <ul class="weui_uploader_files">
                        <c:forEach items="${images}" var="img">
                            <li class="weui_uploader_file" onclick="removeExistImg(this,'${img}')" style="background-image:url('${img}')"></li>
                        </c:forEach>
                    </ul>
                    <div class="weui_uploader_input_wrp">
                        <a class="weui_uploader_input js_file" href="javascript:;"></a></div>
                </div>
            </div>
        </div>
    </div>
</div>
<input type="hidden" name="images" id="images">

<div style="padding:0px 10%;">
    <a href="javascript:;" class="weui_btn weui_btn_warn" onclick="editProvider()">修改</a>
</div>

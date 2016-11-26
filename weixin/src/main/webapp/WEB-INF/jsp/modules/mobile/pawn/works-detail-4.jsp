<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>


<div class="weui_cells weui_cells_form" style="margin-top: 0px;position: relative;">
    <img src="${ctxStatic}/modules/pawn/img/bg_pinggubaogao.png" alt="" style="width: 100%;height: 400px;">

    <div style="position: absolute; padding: 18px 5%;top:0px;width: 90%;">
        <h3 style="color:#B60001">昌化石鉴定评估报告</h3>
        <textarea name="" id="" readonly
                  style=" outline:none;resize:none;width:100%;background: transparent;border: none;padding: 10px 1%;font-size: 1.0em;margin-top: 5px;height: 291px;color:#414140">${report.des}</textarea>
    </div>
</div>
<c:if test="${user.office.name != '普通用户'&& works.status == 1}">
<div style="padding:15px 10%;background-color: #F7F7FA">
    <div class="weui-row ">
        <div class="weui-col-50"><a href="javascript:;" class="weui_btn weui_btn_primary" onclick="check(3)">通过</a></div>
        <div class="weui-col-50"><a href="javascript:;" class="weui_btn weui_btn_warn" onclick="check(2)">拒绝</a></div>
    </div>
</div>
</c:if>
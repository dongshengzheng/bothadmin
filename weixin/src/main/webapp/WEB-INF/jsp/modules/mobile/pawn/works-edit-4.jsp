<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>


<div class="weui_cells weui_cells_form" style="margin-top: 0px;position: relative;">
    <img src="${ctxStatic}/modules/pawn/img/bg_pinggubaogao.png" alt="" style="width: 100%;height: 400px;">

    <div style="position: absolute; padding: 18px 5%;top:0px;width: 90%;">
        <h3 style="color:#B60001">昌化石鉴定评估报告</h3>
        <textarea name="des" id="des"
                  style=" outline:none;resize:none;width:100%;background: transparent;border: none;padding: 10px 1%;font-size: 1.0em;margin-top: 5px;height: 291px;color:#414140">${report.des}</textarea>
    </div>


    <div style="padding:10px 10%; position: absolute;bottom: 0px;width: 80%;">
        <a href="javascript:;" class="weui_btn weui_btn_warn" onclick="reportEdit()">修改</a>
    </div>
</div>

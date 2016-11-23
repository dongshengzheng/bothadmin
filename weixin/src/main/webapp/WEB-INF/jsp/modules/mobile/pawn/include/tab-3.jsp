<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="taglib.jsp" %>
<div class="weui_tabbar">
    <a href="${ctx}/pawn/mobile/works" class="weui_tabbar_item">
        <div class="weui_tabbar_icon">
            <img src="${ctxStatic}/modules/pawn/img/shouye.png" alt="">
        </div>
        <p class="weui_tabbar_label">首页</p>
    </a>
    <a href="${ctx}/pawn/mobile/add" class="weui_tabbar_item">
        <div class="weui_tabbar_icon">
            <img src="${ctxStatic}/modules/pawn/img/dengji.png" alt="">
        </div>
        <p class="weui_tabbar_label">登记申请</p>
    </a>
    <a href="${ctx}/pawn/mobile/my" class="weui_tabbar_item">
        <div class="weui_tabbar_icon">
            <img src="${ctxStatic}/modules/pawn/img/wode_ed.png" alt="">
        </div>
        <p class="weui_tabbar_label" style="color: #C52124">我</p>
    </a>
</div>
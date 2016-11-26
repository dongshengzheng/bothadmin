<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>

<div class="weui_cells_title">基本信息</div>
<div class="weui_cells weui_cells_form">
    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">作品名称</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <span>${works.name}</span>
        </div>
    </div>
    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">品种</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <span>${fns:getDictLabel(works.breed, 'dd_pinzhong', '')}</span>
        </div>
    </div>

    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">作品类型</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <span>${fns:getDictLabel(works.type, 'dd_zuopinleixing', '')}</span>
        </div>
    </div>

    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">尺寸重量</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <span>${works.size}</span>
        </div>
    </div>
    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">工艺制作</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <span>${fns:getDictLabel(works.gyType, 'dd_level', '')}</span>
        </div>
    </div>
    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">篆刻级别</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <span>${fns:getDictLabel(works.levelZk, 'dd_level', '')}</span>
        </div>
    </div>
    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">矿区地域</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <span>${fns:getDictLabel(works.kqdy, 'dd_kqdy', '')}</span>
        </div>
    </div>
    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">作品制作人</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <span>${works.maker}</span>
        </div>
    </div>
    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">作品制作时间</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <span><fmt:formatDate value="${works.makeTime}" pattern="yyyy-MM-dd"/></span>
        </div>
    </div>
</div>
<div class="weui_cells_title">作品诠释</div>
<div class="weui_cells weui_cells_form" style="margin-bottom: 15px;">
    <div class="weui_cell">
        <div class="weui_cell_bd weui_cell_primary">
            <textarea class="weui_textarea" rows="3" readonly>${works.worksMeanning}</textarea>
        </div>
    </div>
</div>
<c:if test="${user.office.name != '普通用户'&& works.status == 1}">
<div style="padding:0px 10%;">
    <a href="javascript:;" class="weui_btn weui_btn_warn" onclick="toPage(3)">下一页</a>
</div></c:if>
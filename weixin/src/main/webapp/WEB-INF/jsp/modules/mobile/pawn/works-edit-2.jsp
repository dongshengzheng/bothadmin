<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>

<div class="weui_cells_title">基本信息</div>
<div class="weui_cells weui_cells_form">
    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">作品名称</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" type="text" id="name" name="name" placeholder="请输入作品名称" value="${works.name}">
        </div>
    </div>
    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">品种</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" type="text" id="breed" name="breed" placeholder="请选择品种" readonly  value="${fns:getDictLabel(works.breed, 'dd_pinzhong', '')}" data-values="${works.breed}">
        </div>
    </div>

    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">作品类型</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" type="text" id="type" name="type" placeholder="请选择类型" readonly value="${fns:getDictLabel(works.type, 'dd_zuopinleixing', '')}" data-values="${works.type}">
        </div>
    </div>

    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">尺寸重量</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" type="text" id="size" name="size" placeholder="长(cm)/宽(cm)/高(cm)/重量(g)" value="${works.size}">
        </div>
    </div>

    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">工艺制作</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" type="text" id="gyType" name="gyType" placeholder="请选择工艺制作"  readonly value="${fns:getDictLabel(works.gyType, 'dd_level', '')}" data-values="${works.gyType}">
        </div>
    </div>
    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">篆刻级别</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" type="text" id="levelZk" name="levelZk" placeholder="请选择篆刻级别" readonly value="${fns:getDictLabel(works.levelZk, 'dd_level', '')}" data-values="${works.levelZk}">
        </div>
    </div>
    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">矿区地域</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" type="text" id="kqdy" name="kqdy" readonly placeholder="请选择矿区地域" value="${fns:getDictLabel(works.kqdy, 'dd_kqdy', '')}" data-values="${works.kqdy}">
        </div>
    </div>

    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">作品制作人</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" type="text" id="maker" name="maker" placeholder="作品制作人">
        </div>
    </div>

    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">作品制作时间</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" data-toggle='date' id="makeTime" name="makeTime" type="text"
                   value="<fmt:formatDate value="${works.makeTime}" pattern="yyyy-MM-dd"/>"
                   placeholder="请输入作品制作时间">
        </div>
    </div>
</div>
<div class="weui_cells_title">作品诠释</div>
<div class="weui_cells weui_cells_form" style="margin-bottom: 15px;">
    <div class="weui_cell">
        <div class="weui_cell_bd weui_cell_primary">
            <textarea class="weui_textarea" rows="3" id="worksMeanning" name="worksMeanning" placeholder="请输入详细内容">${works.worksMeanning}</textarea>
        </div>
    </div>
</div>

<div style="padding:0px 10%;">
    <a href="javascript:;" class="weui_btn weui_btn_warn" onclick="editWorks()">修改</a>
</div>
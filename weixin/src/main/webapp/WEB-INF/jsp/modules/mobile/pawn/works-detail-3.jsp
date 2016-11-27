<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>

<div class="weui_cells_title">作品等级</div>
<div class="weui_cells weui_cells_form">
    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">质地</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <span>${fns:getDictLabel(worksLevel.zhidi, 'dd_zhidi', '')}</span>
        </div>
    </div>


    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">质地二</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <span>${fns:getDictLabel(worksLevel.zhidi2, 'dd_zhidi2', '')}</span>
        </div>
    </div>

    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">感观</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <span>${fns:getDictLabel(worksLevel.ganguan, 'dd_ganguan', '')}</span>
        </div>
    </div>


    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">磨氏度</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <span>${fns:getDictLabel(worksLevel.moshidu, 'dd_moshidu', '')}</span>
        </div>
    </div>


    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">血量</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <span>${fns:getDictLabel(worksLevel.xueliang, 'dd_xueliang', '')}</span>
        </div>
    </div>

    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">血色</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <span> ${fns:getDictLabel(worksLevel.xuese, 'dd_xuese', '')}</span>
        </div>
    </div>
    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">血形</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <span>${fns:getDictLabel(worksLevel.xuexing, 'dd_xuexing', '')}</span>
        </div>
    </div>
    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">浓艳度</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <span>${fns:getDictLabel(worksLevel.nongyandu, 'dd_nongyandu', '')}</span>
        </div>
    </div>

    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">纯净度</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <span>${fns:getDictLabel(worksLevel.jingdu, 'dd_jingdu', '')} </span>
        </div>
    </div>

    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">地色</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <span>${fns:getDictLabel(worksLevel.dise, 'dd_dise', '')}</span>
        </div>
    </div>

    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">绺(活筋)</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <span>${fns:getDictLabel(worksLevel.liu, 'dd_liu', '')}</span>
        </div>
    </div>

    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">裂</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <span>${fns:getDictLabel(worksLevel.lie, 'dd_lie', '')}</span>
        </div>
    </div>

    <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">印章含血面</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <span>${fns:getDictLabel(worksLevel.hanxuemian, 'dd_mian', '')}</span>
        </div>
    </div>

</div>
<c:if test="${user.office.name != '普通用户'&& works.status == 1}">
<div style="padding:0px 10%;">
    <a href="javascript:;" class="weui_btn weui_btn_warn" onclick="toPage(4)">下一页</a>
</div></c:if>
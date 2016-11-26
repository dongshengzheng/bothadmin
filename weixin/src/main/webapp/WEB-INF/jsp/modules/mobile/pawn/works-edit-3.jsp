<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>

<div class="weui_cells_title">作品等级</div>
<div class="weui_cells weui_cells_form">
    <div class="weui_cell">
        <div class="weui_cell_hd"><label for="zhidi" class="weui_label">质地</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="zhidi" name="zhidi" type="text" value="${fns:getDictLabel(worksLevel.zhidi, 'dd_zhidi', '')}" data-values="${worksLevel.zhidi}"  readonly=""
                   placeholder="请选择质地">
        </div>
    </div>


    <div class="weui_cell">
        <div class="weui_cell_hd"><label for="zhidi2" class="weui_label">质地二</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="zhidi2" name="zhidi2" type="text" value="${fns:getDictLabel(worksLevel.zhidi2, 'dd_zhidi2', '')}" data-values="${worksLevel.zhidi2}"  readonly=""
                   placeholder="请选择质地二">
        </div>
    </div>

    <div class="weui_cell">
        <div class="weui_cell_hd"><label for="ganguan" class="weui_label">感观</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="ganguan" name="ganguan" type="text" value="${fns:getDictLabel(worksLevel.ganguan, 'dd_ganguan', '')}" data-values="${worksLevel.ganguan}"  readonly=""
                   placeholder="请选择感观">
        </div>
    </div>


    <div class="weui_cell">
        <div class="weui_cell_hd"><label for="moshidu" class="weui_label">磨氏度</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="moshidu" name="moshidu" type="text" value="${fns:getDictLabel(worksLevel.moshidu, 'dd_moshidu', '')}" data-values="${worksLevel.moshidu}"  readonly=""
                   placeholder="请选择磨氏度">
        </div>
    </div>


    <div class="weui_cell">
        <div class="weui_cell_hd"><label for="xueliang" class="weui_label">血量</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="xueliang" name="xueliang" type="text" value="${fns:getDictLabel(worksLevel.xueliang, 'dd_xueliang', '')}" data-values="${worksLevel.xueliang}"  readonly=""
                   placeholder="请选择血量">
        </div>
    </div>

    <div class="weui_cell">
        <div class="weui_cell_hd"><label for="xuese" class="weui_label">血色</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="xuese" name="xuese" type="text" value="${fns:getDictLabel(worksLevel.xuese, 'dd_xuese', '')}" data-values="${worksLevel.xuese}"  readonly=""
                   placeholder="请选择血色">
        </div>
    </div>
    <div class="weui_cell">
        <div class="weui_cell_hd"><label for="xuexing" class="weui_label">血形</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="xuexing" name="xuexing" type="text" value="${fns:getDictLabel(worksLevel.xuexing, 'dd_xuexing', '')}" data-values="${worksLevel.xuexing}"  readonly=""
                   placeholder="请选择血形">
        </div>
    </div>
    <div class="weui_cell">
        <div class="weui_cell_hd"><label for="nongyandu" class="weui_label">浓艳度</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="nongyandu" name="nongyandu" type="text" value="${fns:getDictLabel(worksLevel.nongyandu, 'dd_nongyandu', '')}" data-values="${worksLevel.nongyandu}"  readonly=""
                   placeholder="请选择浓艳度">
        </div>
    </div>

    <div class="weui_cell">
        <div class="weui_cell_hd"><label for="jingdu" class="weui_label">纯净度</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="jingdu" name="jingdu" type="text" value="${fns:getDictLabel(worksLevel.jingdu, 'dd_jingdu', '')}" data-values="${worksLevel.jingdu}"  readonly=""
                   placeholder="请选择纯净度">
        </div>
    </div>

    <div class="weui_cell">
        <div class="weui_cell_hd"><label for="dise" class="weui_label">地色</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="dise" name="dise" type="text" value="${fns:getDictLabel(worksLevel.jingdu, 'dd_jingdu', '')}" data-values="${worksLevel.jingdu}"  readonly=""
                   placeholder="请选择纯净度">
        </div>
    </div>

    <div class="weui_cell">
        <div class="weui_cell_hd"><label for="liu" class="weui_label">绺(活筋)</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="liu" name="liu" type="text" value="${fns:getDictLabel(worksLevel.liu, 'dd_liu', '')}" data-values="${worksLevel.liu}"  readonly=""
                   placeholder="请选择绺">
        </div>
    </div>

    <div class="weui_cell">
        <div class="weui_cell_hd"><label for="lie" class="weui_label">裂</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="lie" name="lie" type="text" value="${fns:getDictLabel(worksLevel.lie, 'dd_lie', '')}" data-values="${worksLevel.lie}" readonly=""
                   placeholder="请选择裂">
        </div>
    </div>

    <div class="weui_cell">
        <div class="weui_cell_hd"><label for="hanxuemian" class="weui_label">印章含血面</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="hanxuemian" name="hanxuemian" type="text" value="${fns:getDictLabel(worksLevel.hanxuemian, 'dd_mian', '')}" data-values="${worksLevel.hanxuemian}" readonly=""
                   placeholder="请选择印章含血面">
        </div>
    </div>
    <div class="weui_cell">
        <div class="weui_cell_hd"><label for="hanxuefangshi" class="weui_label">含血方式</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" id="hanxuefangshi" name="hanxuefangshi" type="text" value="${fns:getDictLabel(worksLevel.hanxuefangshi, 'dd_hanxuefangshi', '')}" data-values="${worksLevel.hanxuefangshi}" readonly=""
                   placeholder="请选择含血方式">
        </div>
    </div>


</div>
<div style="padding:15px 10%;">
    <a href="javascript:;" class="weui_btn weui_btn_warn" onclick="levelEdit()">修改</a>
</div>
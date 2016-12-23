<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">作品名称</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="worksShowName" class="weui-input worksShowName" type="tel" value="${works.name}" disabled>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">质地一</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="zhidi" id="works-zhidiyi" class="weui-input " value="${worksLevel.zhidi}" placeholder="请选择质地一">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">质地二</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="zhidi2" id="works-zhidier" class="weui-input " value="${worksLevel.zhidi2}"
               placeholder="请选择质地二">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">感观</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="ganguan" id="works-ganguan" class="weui-input " value="${worksLevel.ganguan}"
               placeholder="请选择感观">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">磨氏度</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="moshidu" id="works-moshidu" class="weui-input " value="${worksLevel.moshidu}"
               placeholder="请选择磨氏度">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">血量</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="xueliang" id="works-xueliang" class="weui-input " value="${worksLevel.xueliang}"
               placeholder="请选择血量">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">血色</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="xuese" id="works-xuese" class="weui-input " value="${worksLevel.xuese}" placeholder="请选择血色">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">血形</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="xuexing" id="works-xuexing" class="weui-input " value="${worksLevel.xuexing}"
               placeholder="请选择血形">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">浓艳度</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="nongyandu" id="works-nongyandu" class="weui-input " value="${worksLevel.nongyandu}"
               placeholder="请选择浓艳度">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">纯净度</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="chunjingdu" id="works-chunjingdu" class="weui-input " value="${worksLevel.chunjingdu}"
               placeholder="请选择纯净度">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">地色</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="dise" id="works-dise" class="weui-input " value="${worksLevel.dise}" placeholder="请选择地色">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">活筋</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="liu" id="works-huojin" class="weui-input " value="${worksLevel.liu}" placeholder="请选择活筋">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">裂</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="lie" id="works-lie" class="weui-input " value="${worksLevel.lie}" placeholder="请选择裂">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">印章</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="hanxuemian" id="works-yinzhang" class="weui-input " value="${worksLevel.hanxuemian}"
               placeholder="请选择印章">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">含血方式</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="hanxuefangshi" id="works-hanxuefangshi" class="weui-input " value="${worksLevel.hanxuefangshi}"
               placeholder="请选择含血方式">
    </div>
</div>


<script>
    $(function () {
        $('#works-zhidiyi').picker({
            title: "请选择质地一",
            cols: [
                {
                    textAlign: 'center',
                    values: ['冻', '软', '刚', '硬']
                }
            ]
        });
        $('#works-zhidier').picker({
            title: "请选择质地二",
            cols: [
                {
                    textAlign: 'center',
                    values: ['冻地', '冻软地', '软地', '冻软刚地', '冻软硬地', '灰刚板地', '活刚板地', '刚硬地', '硬地']
                }
            ]
        });

        $('#works-ganguan').picker({
            title: "请选择感观",
            cols: [
                {
                    textAlign: 'center',
                    values: ['透、细腻、温润', '微透、细腻、温润', '透、细腻、干', '不透、细腻、温润', '不透、细腻、干', '不透、粗糙、干']
                }
            ]
        });

        $('#works-moshidu').picker({
            title: "请选择磨氏度",
            cols: [
                {
                    textAlign: 'center',
                    values: ['2-2.5', '2-4', '2-6', '4-5', '4-6', '5-6']
                }
            ]
        });

        $('#works-xueliang').picker({
            title: "请选择血量",
            cols: [
                {
                    textAlign: 'center',
                    values: ['>50%', '>30%', '>15%', '>5%', '>0%']
                }
            ]
        });

        $('#works-xuese').picker({
            title: "请选择血色",
            cols: [
                {
                    textAlign: 'center',
                    values: ['鲜红', '红', '淡红', '暗红']
                }
            ]
        });

        $('#works-xuexing').picker({
            title: "请选择血形",
            cols: [
                {
                    textAlign: 'center',
                    values: ['团块状', '片状', '条状', '云雾状', '网脉状', '细脉状', '星点状', '其他']
                }
            ]
        });

        $('#works-nongyandu').picker({
            title: "请选择浓艳度",
            cols: [
                {
                    textAlign: 'center',
                    values: ['浓艳', '艳', '淡', '稀']
                }
            ]
        });

        $('#works-chunjingdu').picker({
            title: "请选择纯净度",
            cols: [
                {
                    textAlign: 'center',
                    values: ['净', '略净', '花', '杂']
                }
            ]
        });

        $('#works-dise').picker({
            title: "请选择地色",
            cols: [
                {
                    textAlign: 'center',
                    values: ['黄', '白', '黑', '灰', '褐', '青', '混合', '其他']
                }
            ]
        });

        $('#works-huojin').picker({
            title: "请选择活筋",
            cols: [
                {
                    textAlign: 'center',
                    values: ['无', '绺', '绺、裂', '绺、格、裂', '绺、格、裂、复位粘结']
                }
            ]
        });

        $('#works-lie').picker({
            title: "请选择裂",
            cols: [
                {
                    textAlign: 'center',
                    values: ['无', '微裂', '裂', '裂缝（裂隙注胶）', '复位粘结']
                }
            ]
        });

        $('#works-yinzhang').picker({
            title: "请选择印章",
            cols: [
                {
                    textAlign: 'center',
                    values: ['6面', '5面', '4面', '3面', '2面', '1面']
                }
            ]
        });

        $('#works-hanxuefangshi').picker({
            title: "请选择含血方式",
            cols: [
                {
                    textAlign: 'center',
                    values: ['表面含血', '内在含血', '表面及内在含血']
                }
            ]
        });

    })
</script>
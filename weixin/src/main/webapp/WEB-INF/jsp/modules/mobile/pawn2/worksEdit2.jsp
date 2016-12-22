<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">作品名称</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="worksShowName" class="weui-input" type="tel" value="${works.name}" disabled>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">品种</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="breed" id="works-pinzhong" class="weui-input " type="tel" value="${works.breed}">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">作品类型</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="worksType" id="works-zuopinleixing" class="weui-input " type="tel" value="${works.type}"
               placeholder="请选择作品类型">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">尺寸(长-宽-高)</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="length" class="weui-input" type="tel" value="${works.length}" placeholder="长">
    </div>
    <div class="weui-cell__bd weui-cell_primary">
        <input class="weui-input" type="tel" value="cm" disabled>
    </div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="width" class="weui-input" type="tel" value="${works.width}" placeholder="宽">
    </div>
    <div class="weui-cell__bd weui-cell_primary">
        <input class="weui-input" type="tel" value="cm" disabled>
    </div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="height" class="weui-input" type="tel" value="${works.height}" placeholder="高">
    </div>
    <div class="weui-cell__bd weui-cell_primary">
        <input class="weui-input" type="tel" value="cm" disabled>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">重量</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="weight" class="weui-input" type="tel" value="${works.weight}" placeholder="请输入重量">
    </div>
    <div class="weui-cell__bd weui-cell_primary">
        <input class="weui-input" type="tel" value="g" disabled>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">工艺制作</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="gyType" id="works-gongyizhizuo" class="weui-input" value="${works.gyType}"
               placeholder="请选择工艺制作">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">篆刻级别</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="levelZk" id="works-zhuankejibie" class="weui-input" value="${works.levelZk}"
               placeholder="请选择篆刻级别">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">矿区地域</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="kqdy" id="works-kuangqudiyu" class="weui-input" value="${works.kqdy}" placeholder="请选择矿区地域">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">制作人</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="maker" id="works-zhizuoren" class="weui-input" value="${works.maker}" placeholder="请输入制作人">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">制作时间</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="makeTimeString" id="works-zhizuoshijian" class="weui-input"
               value="<fmt:formatDate value='${works.makeTime}' pattern="yyyy-MM-dd"/>"
               type="tel" placeholder="请选择制作时间">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__bd weui-cell_primary">
                    <textarea name="worksMeanning" id="works-zuopinquanshi" class="weui-textarea" placeholder="作品诠释..."
                              rows="3">${works.worksMeanning}</textarea>
        <!--<div class="weui-textarea-counter">-->
        <!--<span>0</span>/200-->
        <!--</div>-->
    </div>
</div>


<script>
    $(function () {
        $('.weui-navbar__item').on('click', function () {
            $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
        });
        $('#works-pinzhong').picker({
            title: "请选择品种",
            cols: [
                {
                    textAlign: 'center',
                    values: ['昌化田黄鸡血石', '昌化田黄石', '昌化鸡血石', '昌化冻石', '昌化彩石', '昌化奇石']
                }
            ]
        });


        $('#works-zuopinleixing').picker({
            title: "请选择作品类型",
            cols: [
                {
                    textAlign: 'center',
                    values: ['原石', '印章', '雕件', '小玩件', '组合套件', '其他']
                }
            ]
        });

        $('#works-gongyizhizuo').picker({
            title: "请选择工艺制作",
            cols: [
                {
                    textAlign: 'center',
                    values: ['一级', '二级', '三级', '四级']
                }
            ]
        });

        $('#works-zhuankejibie').picker({
            title: "请选择篆刻级别",
            cols: [
                {
                    textAlign: 'center',
                    values: ['一级', '二级', '三级', '四级']
                }
            ]
        });

        $('#works-kuangqudiyu').picker({
            title: "请选择矿区地域",
            cols: [
                {
                    textAlign: 'center',
                    values: ['纤岭', '核桃岭', '粗糠坞', '老鹰岩', '红硐岩', '红硐湾',
                        '康山岭', '冷水湾', '仰天荡', '蚱蜢脚盘', '笔架石', '灰石岭', '鸡冠岩']
                }
            ]
        });

        $('#works-zhizuoshijian').calendar();
    });
</script>
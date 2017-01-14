<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">作品名称</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="name" class="weui-input" type="tel" value="${sessionScope.registerWorksName}"
               disabled>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">质地一</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="zhidi">
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">质地二</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="zhidi2">
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">感观</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="ganguan">
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">磨氏度</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="moshidu">
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">血量</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="xueliang">
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">血色</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="xuese">
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">血形</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="xuexing">
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">浓艳度</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="nongyandu">
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">净度</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="jingdu">
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">地色</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="dise">
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">活筋</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="liu">
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">裂</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="lie">
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">印章含血面</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="hanxuemian">
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">含血方式</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="hanxuefangshi">
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">自然石皮</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="ziranshipi">
        </select>
    </div>
</div>
<script>
    $.ajax({
        type: "GET",
        url: "${ctx}/mobile/getWorksLevel?breed=1",
        success: function (data) {
            var zhidi1 = '<option value="" selected>请选择质地一</option>'
            $.each(data.zhidi1, function () {
                zhidi1 += '<option value="' + this.value + '">' + this.label + '</option>'
            });
            $('select[name="zhidi"]').html(zhidi1);

            var zhidi2 = '<option value="" selected>请选择质地二</option>'
            $.each(data.zhidi2, function () {
                zhidi2 += '<option value="' + this.value + '">' + this.label + '</option>'
            });
            $('select[name="zhidi2"]').html(zhidi2);

            var ganguan = '<option value="" selected>请选择感观</option>'
            $.each(data.ganguan, function () {
                ganguan += '<option value="' + this.value + '">' + this.label + '</option>'
            });
            $('select[name="ganguan"]').html(ganguan);

            var moshidu = '<option value="" selected>请选择磨氏度</option>'
            $.each(data.moshidu, function () {
                moshidu += '<option value="' + this.value + '">' + this.label + '</option>'
            });
            $('select[name="moshidu"]').html(moshidu);

            var xueliang = '<option value="" selected>请选择血量</option>'
            $.each(data.xueliang, function () {
                xueliang += '<option value="' + this.value + '">' + this.label + '</option>'
            });
            $('select[name="xueliang"]').html(xueliang);

            var xuese = '<option value="" selected>请选择血色</option>'
            $.each(data.xuese, function () {
                xuese += '<option value="' + this.value + '">' + this.label + '</option>'
            });
            $('select[name="xuese"]').html(xuese);

            var xuexing = '<option value="" selected>请选择血形</option>'
            $.each(data.xuexing, function () {
                xuexing += '<option value="' + this.value + '">' + this.label + '</option>'
            });
            $('select[name="xuexing"]').html(xuexing);

            var nongyandu = '<option value="" selected>请选择浓艳度</option>'
            $.each(data.nongyandu, function () {
                nongyandu += '<option value="' + this.value + '">' + this.label + '</option>'
            });
            $('select[name="nongyandu"]').html(nongyandu);


            var jingdu = '<option value="" selected>请选择净度</option>'
            $.each(data.jingdu, function () {
                jingdu += '<option value="' + this.value + '">' + this.label + '</option>'
            });
            $('select[name="jingdu"]').html(jingdu);

            var dise = '<option value="" selected>请选择地色</option>'
            $.each(data.dise, function () {
                dise += '<option value="' + this.value + '">' + this.label + '</option>'
            });
            $('select[name="dise"]').html(dise);


            var liu = '<option value="" selected>请选择活筋</option>'
            $.each(data.liu, function () {
                liu += '<option value="' + this.value + '">' + this.label + '</option>'
            });
            $('select[name="liu"]').html(liu);

            var lie = '<option value="" selected>请选择裂</option>'
            $.each(data.lie, function () {
                lie += '<option value="' + this.value + '">' + this.label + '</option>'
            });
            $('select[name="lie"]').html(lie);

            var mian = '<option value="" selected>请选择印章含血面</option>'
            $.each(data.mian, function () {
                mian += '<option value="' + this.value + '">' + this.label + '</option>'
            });
            $('select[name="hanxuemian"]').html(mian);

            var hanxuefangshi = '<option value="" selected>请选择含血方式</option>'
            $.each(data.hanxuefangshi, function () {
                hanxuefangshi += '<option value="' + this.value + '">' + this.label + '</option>'
            });
            $('select[name="hanxuefangshi"]').html(hanxuefangshi);


            var ziranshipi = '<option value="" selected>请选择自然石皮</option>'
            $.each(data.ziranshipi, function () {
                ziranshipi += '<option value="' + this.value + '">' + this.label + '</option>'
            });
            $('select[name="ziranshipi"]').html(ziranshipi);
        }
    })
</script>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<div id="load-worksLevel2" class="div-outer">
    <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">作品名称</label></div>
        <div class="weui-cell__bd weui-cell_primary">
            <input class="weui-input worksShowName" type="tel" value="${sessionScope.registerWorksName}"
                   disabled>
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">质地</label></div>
        <div class="weui-cell__bd weui-cell_primary">
            <select name="zhidi2">
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
    <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">感观</label></div>
        <div class="weui-cell__bd weui-cell_primary">
            <select name="ganguan">
            </select>
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">净度</label></div>
        <div class="weui-cell__bd weui-cell_primary">
            <select name="chunjingdu">
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
</div>
<script>
    $.ajax({
        type: "GET",
        url: "${ctx}/mobile/getWorksLevel?breed=2",
        success: function (data) {

            var zhidi2 = '<option value="" selected>请选择质地</option>'
            $.each(data.zhidi2, function () {
                zhidi2 += '<option value="' + this.value + '">' + this.label + '</option>'
            });
            $('#load-worksLevel2 select[name="zhidi2"]').html(zhidi2);

            var ziranshipi = '<option value="" selected>请选择自然石皮</option>'
            $.each(data.ziranshipi, function () {
                ziranshipi += '<option value="' + this.value + '">' + this.label + '</option>'
            });
            $('#load-worksLevel2 select[name="ziranshipi"]').html(ziranshipi);

            var ganguan = '<option value="" selected>请选择感观</option>'
            $.each(data.ganguan, function () {
                ganguan += '<option value="' + this.value + '">' + this.label + '</option>'
            });
            $('#load-worksLevel2 select[name="ganguan"]').html(ganguan);

            var jingdu = '<option value="" selected>请选择净度</option>'
            $.each(data.jingdu, function () {
                jingdu += '<option value="' + this.value + '">' + this.label + '</option>'
            });
            $('#load-worksLevel2 select[name="chunjingdu"]').html(jingdu);

            var moshidu = '<option value="" selected>请选择磨氏度</option>'
            $.each(data.moshidu, function () {
                moshidu += '<option value="' + this.value + '">' + this.label + '</option>'
            });
            $('#load-worksLevel2 select[name="moshidu"]').html(moshidu);

            var dise = '<option value="" selected>请选择地色</option>'
            $.each(data.dise, function () {
                dise += '<option value="' + this.value + '">' + this.label + '</option>'
            });
            $('#load-worksLevel2 select[name="dise"]').html(dise);


            var liu = '<option value="" selected>请选择活筋</option>'
            $.each(data.liu, function () {
                liu += '<option value="' + this.value + '">' + this.label + '</option>'
            });
            $('#load-worksLevel2 select[name="liu"]').html(liu);

            var lie = '<option value="" selected>请选择裂</option>'
            $.each(data.lie, function () {
                lie += '<option value="' + this.value + '">' + this.label + '</option>'
            });
            $('#load-worksLevel2 select[name="lie"]').html(lie);
        }
    })
</script>

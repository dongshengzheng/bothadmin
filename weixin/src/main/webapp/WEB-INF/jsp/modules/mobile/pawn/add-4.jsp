<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>

<html lang="en">
<head>
    <title>评估报告</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <link rel="stylesheet" href="${ctxStatic}/jquery-weui/lib/weui.css"/>
    <link rel="stylesheet" href="${ctxStatic}/jquery-weui/css/jquery-weui.css"/>
    <link rel="stylesheet" href="${ctxStatic}/modules/pawn/css/custom.css"/>
    <link rel="stylesheet" href="${ctxStatic}/swiper/css/swiper.css"/>
</head>
<style>

    .swiper-container {
        height: 200px;
    }

    .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;
        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
    }

    .swiper-container {
        width: 100%;
    }

    .swiper-container img {
        display: block;
        width: 100%;
    }

    .weui_navbar_item {
        padding: 8px 0;
    }

    .item-detail {
        height: calc(100% - 200px) !important;
    }

    .weui_navbar + .weui_tab_bd {
        padding-top: 40px;
    }

    .weui_navbar_item {
        border: none;
    }

    .weui_navbar_item:after {
        content: none;
    }

    .weui_navbar_item.weui_bar_item_on {
        background-color: inherit !important;
        color: #C31E1F;
        border-bottom: 2px solid #C31E1F;
    }

    .weui_cell:before {
        left: 0px;
    }

    textarea {
        outline: none;
        resize: none;
        width: 100%;
        background: transparent;
        border: none;
        padding: 7% 1%;
        font-size: 1.0em;
        margin-top: 5px;
        /* height: 100%; */
        color: #414140;
        height: calc(100% - 80px) !important;
    }

    input::-webkit-input-placeholder, textarea::-webkit-input-placeholder {
        color: #62676A;
    }

    input:-moz-placeholder, textarea:-moz-placeholder {
        color: #62676A;
    }
</style>
<body>
<div class="weui_tab">
    <div class="weui_tab_bd">
        <div style="background-color: #FEFFFF;width: 100%;text-align: center; padding:10px 0 5px;">
            <img src="${ctxStatic}/modules/pawn/img/s-4.png" alt="" style="width: 83%;">
            <div class="weui-row weui-no-gutter" style="font-size: 12px;color: #5C5D5F;">
                <div class="weui-col-20" style="color: #C91D1B">物品登记</div>
                <div class="weui-col-20" style="color: #C91D1B">作品登记</div>
                <div class="weui-col-20" style="color: #C91D1B">作品等级</div>
                <div class="weui-col-20" style="color: #C91D1B">评估报告</div>
                <div class="weui-col-20">物品收藏</div>
            </div>
        </div>
        <div class="weui_cells weui_cells_form"
             style="margin-top: 0px;position: relative;height: calc(100% - 49px) !important;">
            <img src="${ctxStatic}/modules/pawn/img/bg_pinggubaogao.png" alt="" style="width: 100%;height:100%;">

            <div style="position: absolute; padding: 6% 5% 5%;top:0px;width: 90%;height: calc(100% - 49px) !important;">
                <h3 style="color:#B60001">昌化石鉴定评估报告</h3>
                <textarea name="des" id="des" placeholder="请输入详细的评估报告"></textarea>
            </div>
            <div style="padding: 10px 10%;position: absolute;bottom: 0px;width: 80%;text-align: center;">
                <a href="javascript:;" class="weui_btn weui_btn_warn" onclick="report()">下一步</a>
            </div>
        </div>

    </div>

    <%@include file="include/tab-2.jsp" %>
</div>
<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js" type="text/javascript"></script>
<script src="${ctxStatic}/jquery-weui/js/jquery-weui.js" type="text/javascript"></script>
<script type='text/javascript' src='${ctxStatic}/swiper/js/swiper.js' charset='utf-8'></script>
</body>
<script type="text/javascript">
    function report() {
        if ($("#des").val().length == "") {
            $.alert("评估报告不能为空");
            return false;
        }
        $.ajax({
            type: "POST",
            url: "${ctx}/pawn/mobile/report",
            data: {
                worksId: '${works.id}',
                des: $("#des").val()
            },
            success: function (data) {
                if (data.suc) {
                    window.location.href = "${ctx}/pawn/mobile/add/${works.id}/5";
                } else {
                    $.alert(data.msg);
                }
            }
        });
    }






</script>
</html>

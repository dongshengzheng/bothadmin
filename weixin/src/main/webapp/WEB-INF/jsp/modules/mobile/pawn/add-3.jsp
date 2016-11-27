<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>

<html lang="en">
<head>
    <title>作品等级</title>
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
    .weui_cell:before{
        left: 0px;
    }
</style>
<body>
<div class="weui_tab">
    <div class="weui_tab_bd">
        <div style="background-color: #FEFFFF;width: 100%;text-align: center; padding: 5px 0;">
            <img src="${ctxStatic}/modules/pawn/img/s-3.png" alt="" style="width: 83%;">
            <div class="weui-row weui-no-gutter" style="font-size: 12px;color: #5C5D5F;">
                <div class="weui-col-20" style="color: #C91D1B">物品登记</div>
                <div class="weui-col-20" style="color: #C91D1B">作品登记</div>
                <div class="weui-col-20" style="color: #C91D1B">作品等级</div>
                <div class="weui-col-20">评估报告</div>
                <div class="weui-col-20">物品收藏</div>
            </div>
        </div>
        <div class="weui_cells_title">等级选择</div>
        <div class="weui_cells weui_cells_form">
            <div class="weui_cell">
                <div class="weui_cell_hd"><label for="zhidi" class="weui_label">质地</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" id="zhidi" name="zhidi" type="text" value="" readonly=""
                           placeholder="请选择质地">
                </div>
            </div>


            <div class="weui_cell">
                <div class="weui_cell_hd"><label for="zhidi2" class="weui_label">质地二</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" id="zhidi2" name="zhidi2" type="text" value="" readonly=""
                           placeholder="请选择质地二">
                </div>
            </div>

            <div class="weui_cell">
                <div class="weui_cell_hd"><label for="ganguan" class="weui_label">感观</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" id="ganguan" name="ganguan" type="text" value="" readonly=""
                           placeholder="请选择感观">
                </div>
            </div>


            <div class="weui_cell">
                <div class="weui_cell_hd"><label for="moshidu" class="weui_label">磨氏度</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" id="moshidu" name="moshidu" type="text" value="" readonly=""
                           placeholder="请选择磨氏度">
                </div>
            </div>


            <div class="weui_cell">
                <div class="weui_cell_hd"><label for="xueliang" class="weui_label">血量</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" id="xueliang" name="xueliang" type="text" value="" readonly=""
                           placeholder="请选择血量">
                </div>
            </div>

            <div class="weui_cell">
                <div class="weui_cell_hd"><label for="xuese" class="weui_label">血色</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" id="xuese" name="xuese" type="text" value="" readonly=""
                           placeholder="请选择血色">
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd"><label for="xuexing" class="weui_label">血形</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" id="xuexing" name="xuexing" type="text" value="" readonly=""
                           placeholder="请选择血形">
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd"><label for="nongyandu" class="weui_label">浓艳度</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" id="nongyandu" name="nongyandu" type="text" value="" readonly=""
                           placeholder="请选择浓艳度">
                </div>
            </div>

            <div class="weui_cell">
                <div class="weui_cell_hd"><label for="jingdu" class="weui_label">纯净度</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" id="jingdu" name="jingdu" type="text" value="" readonly=""
                           placeholder="请选择纯净度">
                </div>
            </div>

            <div class="weui_cell">
                <div class="weui_cell_hd"><label for="dise" class="weui_label">地色</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" id="dise" name="dise" type="text" value="" readonly=""
                           placeholder="请选择纯净度">
                </div>
            </div>

            <div class="weui_cell">
                <div class="weui_cell_hd"><label for="liu" class="weui_label">绺(活筋)</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" id="liu" name="liu" type="text" value="" readonly=""
                           placeholder="请选择绺">
                </div>
            </div>

            <div class="weui_cell">
                <div class="weui_cell_hd"><label for="lie" class="weui_label">裂</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" id="lie" name="lie" type="text" value="" readonly=""
                           placeholder="请选择裂">
                </div>
            </div>

            <div class="weui_cell">
                <div class="weui_cell_hd"><label for="hanxuemian" class="weui_label">印章含血面</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" id="hanxuemian" name="hanxuemian" type="text" value="" readonly=""
                           placeholder="请选择印章含血面">
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd"><label for="hanxuefangshi" class="weui_label">含血方式</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" id="hanxuefangshi" name="hanxuefangshi" type="text" value="" readonly=""
                           placeholder="请选择含血方式">
                </div>
            </div>




        </div>
        <div style="padding:15px 10%;">
            <a href="javascript:;" class="weui_btn weui_btn_warn" onclick="level()">下一步</a>
        </div>
    </div>
    <%@include file="include/tab-2.jsp"%>
</div>
<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js" type="text/javascript"></script>
<script src="${ctxStatic}/jquery-weui/js/jquery-weui.js" type="text/javascript"></script>
<script type='text/javascript' src='${ctxStatic}/swiper/js/swiper.js' charset='utf-8'></script>
</body>
<script type="text/javascript">

    function level() {
//        if ($("#zhidi").attr("data-values").length == "") {
//            $.alert("质地不能为空");
//            return false;
//        }
//        if ($("#zhidi2").attr("data-values").length == "") {
//            $.alert("质地二不能为空");
//            return false;
//        }
//
//        if ($("#ganguan").attr("data-values").length == "") {
//            $.alert("感观不能为空");
//            return false;
//        }
//        if ($("#moshidu").attr("data-values").length == "") {
//            $.alert("磨氏度不能为空");
//            return false;
//        }
//        if ($("#xueliang").attr("data-values").length == "") {
//            $.alert("血量不能为空");
//            return false;
//        }
//        if ($("#xuese").attr("data-values").length == "") {
//            $.alert("血色不能为空");
//            return false;
//        }
//        if ($("#xuexing").attr("data-values").length == "") {
//            $.alert("血形不能为空");
//            return false;
//        }
//
//        if ($("#nongyandu").attr("data-values").length == "") {
//            $.alert("浓艳度不能为空");
//            return false;
//        }
//        if ($("#jingdu").attr("data-values").length == "") {
//            $.alert("纯净度不能为空");
//            return false;
//        }
//
//        if ($("#dise").attr("data-values").length == "") {
//            $.alert("地色不能为空");
//            return false;
//        }
//
//        if ($("#liu").attr("data-values").length == "") {
//            $.alert("绺不能为空");
//            return false;
//        }
//        if ($("#lie").attr("data-values").length == "") {
//            $.alert("裂不能为空");
//            return false;
//        }
//        if ($("#hanxuemian").attr("data-values").length == "") {
//            $.alert("印章含血面不能为空");
//            return false;
//        }

        $.ajax({
            type: "POST",
            url: "${ctx}/pawn/mobile/worksLevel",
            data: {
                worksId: '${works.id}',
                zhidi: $("#zhidi").attr("data-values"),
                zhidi2: $("#zhidi2").attr("data-values"),
                ganguan: $("#ganguan").attr("data-values"),
                moshidu: $("#moshidu").attr("data-values"),
                xueliang: $("#xueliang").attr("data-values"),
                xuese: $("#xuese").attr("data-values"),
                xuexing: $("#xuexing").attr("data-values"),
                nongyandu: $("#nongyandu").attr("data-values"),
                jingdu: $("#jingdu").attr("data-values"),
                dise: $("#dise").attr("data-values"),
                liu: $("#liu").attr("data-values"),
                lie: $("#lie").attr("data-values"),
                hanxuemian: $("#hanxuemian").attr("data-values"),
                hanxuefangshi: $("#hanxuefangshi").attr("data-values")
            },

            success: function (data) {
                if (data.suc) {
                        window.location.href = "${ctx}/pawn/mobile/add/${works.id}/4";
                } else {
                    $.alert(data.msg);
                }
            }
        });
    }

    $("#zhidi").select({
        title: "质地",
        items: JSON.parse('${fns:getDictKVList('dd_zhidi')}')
    });

    $("#zhidi2").select({
        title: "质地二",
        items: JSON.parse('${fns:getDictKVList('dd_zhidi')}')
    });
    $("#ganguan").select({
        title: "感观",
        items: JSON.parse('${fns:getDictKVList('dd_ganguan')}')
    });
    $("#moshidu").select({
        title: "磨氏度",
        items: JSON.parse('${fns:getDictKVList('dd_moshidu')}')
    });
    $("#xueliang").select({
        title: "血量",
        items: JSON.parse('${fns:getDictKVList('dd_xueliang')}')
    });
    $("#xuese").select({
        title: "血色",
        items: JSON.parse('${fns:getDictKVList('dd_xuese')}')
    });

    $("#xuexing").select({
        title: "血形",
        items: JSON.parse('${fns:getDictKVList('dd_xuexing')}')
    });

    $("#nongyandu").select({
        title: "浓艳度",
        items: JSON.parse('${fns:getDictKVList('dd_nongyandu')}')
    });

    $("#jingdu").select({
        title: "纯净度",
        items: JSON.parse('${fns:getDictKVList('dd_jingdu')}')
    });

    $("#dise").select({
        title: "地色",
        items: JSON.parse('${fns:getDictKVList('dd_dise')}')
    });
    $("#liu").select({
        title: "绺(活筋)",
        items: JSON.parse('${fns:getDictKVList('dd_liu')}')
    });
    $("#lie").select({
        title: "裂",
        items: JSON.parse('${fns:getDictKVList('dd_lie')}')
    });
    $("#hanxuemian").select({
        title: "印章含血面",
        items: JSON.parse('${fns:getDictKVList('dd_mian')}')
    });
    $("#hanxuefangshi").select({
        title: "含血方式",
        items: JSON.parse('${fns:getDictKVList('dd_hanxuefangshi')}')
    });

</script>
</html>

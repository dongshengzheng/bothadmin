<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>

<html lang="en">
<head>
    <title>作品编辑</title>
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
    .weui_uploader_file{
        background-color: #BBBBBB;
    }
</style>
<body>
<div class="weui_tab">
    <div class="weui_tab_bd">
        <div class="swiper-container" data-space-between='10' data-pagination='.swiper-pagination' data-autoplay="1000">
            <div class="swiper-wrapper">
                <c:forEach items="${images}" var="img">
                    <div class="swiper-slide"><img style="max-height: 100%;max-width:100%"
                                                   src="${img}"
                                                   alt=""></div>
                </c:forEach>
            </div>
            <div class="swiper-pagination"></div>
        </div>

        <div class="weui_tab item-detail">
            <div class="weui_navbar">
                <a href="#tab1" class="weui_navbar_item ">
                    物品登记
                </a>
                <a href="#tab2" class="weui_navbar_item">
                    作品登记
                </a>
                <a href="#tab3" class="weui_navbar_item">
                    作品等级
                </a>
                <a href="#tab4" class="weui_navbar_item">
                    评估报告
                </a>
                <a href="#tab5" class="weui_navbar_item">
                    物品收藏
                </a>
            </div>
            <div class="weui_tab_bd">
                <div id="tab1" class="weui_tab_bd_item ">
                    <%@include file="works-edit-1.jsp" %>
                </div>
                <div id="tab2" class="weui_tab_bd_item">
                    <%@include file="works-edit-2.jsp" %>
                </div>
                <div id="tab3" class="weui_tab_bd_item">
                    <%@include file="works-edit-3.jsp" %>
                </div>
                <div id="tab4" class="weui_tab_bd_item">
                    <%@include file="works-edit-4.jsp" %>
                </div>
                <div id="tab5" class="weui_tab_bd_item">
                    <%@include file="works-edit-5.jsp" %>
                </div>
            </div>
        </div>
    </div>

    <%@include file="include/tab-1.jsp" %>
</div>
<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js" type="text/javascript"></script>
<script src="${ctxStatic}/jquery-weui/js/jquery-weui.js" type="text/javascript"></script>
<script type='text/javascript' src='${ctxStatic}/swiper/js/swiper.js' charset='utf-8'></script>
</body>
<script type="text/javascript">

    $(function () {
        var tab = '${param.tab}';
        if (tab == '') {
            $(".item-detail").find(".weui_navbar").find(".weui_navbar_item:eq(0)").addClass("weui_bar_item_on").siblings().removeClass("weui_bar_item_on");
            $(".item-detail").find(".weui_tab_bd").find(".weui_tab_bd_item:eq(0)").addClass("weui_tab_bd_item_active").siblings().removeClass("weui_tab_bd_item_active");
        } else {
            $(".item-detail").find(".weui_navbar").find(".weui_navbar_item:eq(" + tab + ")").addClass("weui_bar_item_on").siblings().removeClass("weui_bar_item_on");
            $(".item-detail").find(".weui_tab_bd").find(".weui_tab_bd_item:eq(" + tab + ")").addClass("weui_tab_bd_item_active").siblings().removeClass("weui_tab_bd_item_active");
        }
    });
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        paginationClickable: true,
        spaceBetween: 30,
    });
    $("#breed").select({
        title: "品种",
        items: JSON.parse('${fns:getDictKVList('dd_pinzhong')}')
    });
    $("#type").select({
        title: "作品类型",
        items: JSON.parse('${fns:getDictKVList('dd_zuopinleixing')}')
    });
    $("#gyType").select({
        title: "工艺制作",
        items: JSON.parse('${fns:getDictKVList('dd_level')}')
    });
    $("#levelZk").select({
        title: "篆刻级别",
        items: JSON.parse('${fns:getDictKVList('dd_level')}')
    });
    $("#kqdy").select({
        title: "矿区地域",
        items: JSON.parse('${fns:getDictKVList('dd_kqdy')}')
    });

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
        title: "hanxuefangshi",
        items: JSON.parse('${fns:getDictKVList('dd_hanxuefangshi')}')
    });


    function editProvider() {
        if ($("#provider_name").val().length == "") {
            $.alert("姓名不能为空");
            return false;
        }
        var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
        if ($("#provider_no").val().length != '' && reg.test($("#provider_no").val()) === false) {
            layer.alert("身份证输入不合法");
            return false;
        }
        $.ajax({
            type: "POST",
            url: "${ctx}/pawn/mobile/add",
            data: {
                id: '${provider.id}',
                type: 1,
                customer: $("#provider_customer").val(),
                name: $("#provider_name").val(),
                address: $("#provider_address").val(),
                phone: $("#provider_phone").val(),
                no: $("#provider_no").val(),
                remark: $("#provider_remark").val(),
                datetime: $("#provider_datetime").val(),
                worksId: '${works.id}',
                images: $("#images").val()
            },
            success: function (data) {
                if (data.suc) {
                    window.location.href = location.protocol + '//' + location.host + location.pathname + "?tab=0";
                } else {
                    $.alert(data.msg);
                }
            }
        });

    }
    function removeImg(node) {
        if (confirm("确定要删除该图片吗？")) {
            node.remove();
        }
    }


    function editWorks() {
        if ($("#name").val().length == "") {
            $.alert("作品名称不能为空");
            return false;
        }
        $.ajax({
            type: "POST",
            url: "${ctx}/pawn/mobile/update",
            data: {
                id: '${works.id}',
                name: $("#name").val(),
                breed: $("#breed").attr("data-values"),
                type: $("#type").attr("data-values"),
                size: $("#size").val(),
                gyType: $("#gyType").attr("data-values"),
                levelZk: $("#levelZk").attr("data-values"),
                kqdy: $("#kqdy").attr("data-values"),
                worksMeanning: $("#worksMeanning").val(),
                makeTime: $("#makeTime").val(),
                maker: $("#maker").val()

            },

            success: function (data) {
                if (data.suc) {
                    window.location.href = location.protocol + '//' + location.host + location.pathname + "?tab=1";
                } else {
                    $.alert(data.msg);
                }
            }
        });
    }


    function levelEdit() {
        $.ajax({
            type: "POST",
            url: "${ctx}/pawn/mobile/worksLevel",
            data: {
                id: '${worksLevel.id}',
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
                    window.location.href = location.protocol + '//' + location.host + location.pathname + "?tab=2";
                } else {
                    $.alert(data.msg);
                }
            }
        });
    }

    function reportEdit() {
        if ($("#des").val().length == "") {
            $.alert("评估报告不能为空");
            return false;
        }

        $.ajax({
            type: "POST",
            url: "${ctx}/pawn/mobile/report",
            data: {
                id: '${report.id}',
                worksId: '${works.id}',
                des: $("#des").val()
            },
            success: function (data) {
                if (data.suc) {
                    window.location.href = location.protocol + '//' + location.host + location.pathname + "?tab=3";
                } else {
                    $.alert(data.msg);
                }
            }
        });
    }


    function editCollect(status) {
        if ($("#collect_name").val().length == "") {
            $.alert("姓名不能为空");
            return false;
        }
        var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
        if ($("#collect_no").val().length != '' && reg.test($("#collect_no").val()) === false) {
            layer.alert("身份证输入不合法");
            return false;
        }
        $.ajax({
            type: "POST",
            url: "${ctx}/pawn/mobile/add",
            data: {
                id: '${collect.id}',
                worksId: '${works.id}',
                type: 2,
                customer: $("#collect_customer").val(),
                name: $("#collect_name").val(),
                address: $("#collect_address").val(),
                phone: $("#collect_phone").val(),
                no: $("#collect_no").val(),
                remark: $("#collect_remark").val(),
                datetime: $("#collect_datetime").val(),
                status: status,
                pub:$(".weui_switch").is(':checked')?"1":"0"
            },
            success: function (data) {
                if (data.suc) {
                    window.location.href = location.protocol + '//' + location.host + location.pathname + "?tab=4";
                } else {
                    $.alert(data.msg);
                }
            }
        });

    }
    function removeExistImg(node, img) {
        if (confirm("确定要删除该图片吗？")) {
            node.remove();
            // 删除服务器上的图片
            $.ajax({
                type: "POST",
                url: "${ctx}/pawn/mobile/delImage",
                data: {
                    worksId: '${works.id}',
                    image: img
                }
            });
        }
    }


    $.ajax({
        url: "http://" + location.host + "/ticket",
        success: function () {
            $.get("http://" + location.host + "/sign",
                    {
                        url: location.href.split('#')[0]
                    },
                    function (sign) {
                        wx.config({
                            debug: false,
                            appId: sign.appid,
                            timestamp: sign.timestamp,
                            nonceStr: sign.noncestr,
                            signature: sign.signature,
                            jsApiList: [
                                'scanQRCode',
                                'onMenuShareTimeline',
                                'onMenuShareAppMessage',
                                'onMenuShareQQ',
                                'onMenuShareWeibo',
                                'chooseImage',
                                'previewImage',
                                'uploadImage',
                                'downloadImage'
                            ]
                        });
                    },
                    'json'
            );
        }
    });

    $(".js_file").on("click", function () {
        wx.chooseImage({
            success: function (res) {
                var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
                if (localIds == null || localIds == "") {
                    alert("请选择图片！");
                    return null;
                }
                for (var i = 0; i < localIds.length; i++) {
                    var $preview = $('<li class="weui_uploader_file weui_uploader_status" onclick="removeImg(this)" style="background-image:url(' + localIds[i] + ')"></li>');
                    $('.weui_uploader_files').append($preview);
                }
                syncUpload(localIds);

            }
        })
    });
    var syncUpload = function (localIds) {
        var localId = localIds.pop();
        wx.uploadImage({
            localId: localId,
            isShowProgressTips: 1,
            success: function (res) {
                var serverId = res.serverId; // 返回图片的服务器端ID
                $("#images").val($("#images").val() + serverId + ",");
                //其他对serverId做处理的代码
                if (localIds.length > 0) {
                    syncUpload(localIds);
                }
            }
        });
    };

    var str = '${urls}';
    var arr = str.split(',');
    var urls = new Array();
    for (var i = 0; i < arr.length; i++) {
        urls.push("http://" + location.host +arr[i]);
    }
    $(".swiper-wrapper").on("click", function () {
        if (urls.length > 0) {
            wx.previewImage({
                current: urls[0],
                urls: urls
            });
        }
    })
</script>
</html>

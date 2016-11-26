<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>

<html lang="en">
<head>
    <title>${works.name}</title>
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
</style>
<body>
<div class="weui_tab">
    <div class="weui_tab_bd">
        <div class="swiper-container" data-space-between='10' data-pagination='.swiper-pagination' data-autoplay="1000">
            <div class="swiper-wrapper">
                <c:forEach items="${imgList}" var="img">
                    <div class="swiper-slide"><img style="max-height: 100%;max-width:100%"
                            src="${img}"
                            alt=""></div>
                </c:forEach>
            </div>
            <div class="swiper-pagination"></div>
        </div>

        <div class="weui_tab item-detail">
            <div class="weui_navbar">
                <a href="#tab1" class="weui_navbar_item">
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
                <c:if test="${collect.pub == '1'}">
                    <a href="#tab5" class="weui_navbar_item">
                        物品收藏
                    </a>
                </c:if>

            </div>
            <div class="weui_tab_bd">
                <div id="tab1" class="weui_tab_bd_item">
                    <%@include file="works-detail-1.jsp" %>
                </div>
                <div id="tab2" class="weui_tab_bd_item">
                    <%@include file="works-detail-2.jsp" %>
                </div>
                <div id="tab3" class="weui_tab_bd_item">
                    <%@include file="works-detail-3.jsp" %>
                </div>
                <div id="tab4" class="weui_tab_bd_item"
                     style="background: url('${ctxStatic}/modules/pawn/img/bg_pinggubaogao.png') no-repeat ;background-size: cover;">
                    <%@include file="works-detail-4.jsp" %>
                </div>
                <c:if test="${collect.pub == '1'}">
                    <div id="tab5" class="weui_tab_bd_item">
                        <%@include file="works-detail-5.jsp" %>
                    </div>
                </c:if>
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

    function toPage(n) {
        window.location.href = location.protocol + '//' + location.host + location.pathname + "?tab=" + n;
    }

    function check(status) {
        $.ajax({
            type: "POST",
            url: "${ctx}/pawn/mobile/check/${works.id}/" + status,
            success: function (data) {
                if (data.suc) {
                    $.alert("审核成功", function () {
                        window.location.href = window.location.href;
                    });
                } else {
                    $.alert(data.msg);
                }
            }
        });

    }

    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        paginationClickable: true,
        spaceBetween: 30,
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
                                'onMenuShareWeibo'
                            ]
                        });
                    },
                    'json'
            );
        }
    });
    wx.ready(function () {
        wx.onMenuShareAppMessage({
            title: '${works.name}',
            desc: '鸡血石，石之美者。藏在深山，隐于旷野，在命运时空中得天地之化育，浑然天成，历久弥珍，堪比宝玉。',
            link: window.location.href,
            imgUrl: "http://" + location.host + '${ctxStatic}/modules/pawn/img/jsddwx.jpeg',
            trigger: function (res) {
            },
            success: function (res) {
            },
            cancel: function (res) {
            },
            fail: function (res) {
            }
        });
        wx.onMenuShareTimeline({
            title: '${works.name}',
            link: window.location.href,
            imgUrl: "http://" + location.host + '${ctxStatic}/modules/pawn/img/jsddwx.jpeg',
            trigger: function (res) {
            },
            success: function (res) {
            },
            cancel: function (res) {
            },
            fail: function (res) {
            }
        });
        wx.onMenuShareQQ({
            title: '${works.name}',
            desc: '鸡血石，石之美者。藏在深山，隐于旷野，在命运时空中得天地之化育，浑然天成，历久弥珍，堪比宝玉。',
            link: window.location.href,
            imgUrl: "http://" + location.host + '${ctxStatic}/modules/pawn/img/jsddwx.jpeg',
            trigger: function (res) {
            },
            complete: function (res) {
            },
            success: function (res) {
            },
            cancel: function (res) {
            },
            fail: function (res) {
            }
        });

    });
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

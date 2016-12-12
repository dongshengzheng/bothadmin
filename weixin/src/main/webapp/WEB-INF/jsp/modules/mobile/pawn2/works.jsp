<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>金石典当</title>
    <link rel="stylesheet" href="${ctxStatic}/css/custom.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/weui.min.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/jquery-weui.min.css"/>

    <script src="${ctxStatic}/js/jquery-2.1.4.js"></script>
    <script src="${ctxStatic}/js/jquery-weui.js"></script>
    <script src="${ctxStatic}/js/swiper.js"></script>
</head>
<style>


    .weui-tabbar__item.weui-bar__item_on .weui-tabbar__label {
        color: #9F504D;
    }

    .works-img {
        width: 100%;
        height: 100%;
    }

    .works {
        align-content: center;
        display: block;
        width: 100%;
        position: relative;
        overflow: hidden;
    }

    .works-search {
        left: 10%;
        right: 10%;
        width: 80%;
        position: absolute;
        border-radius: 8px;
        top: 10px;
        color: gray;
        background-color: white;
    }

    .works-intro {
        width: 100%;
        position: absolute;
        border: white;
        color: white;
        background-color: black;
        opacity: 0.8;
        left: 0px;
        bottom: 0px;
        resize: none;
        font-size: 20px;
        padding-left: 6px;
    }

    .works-floor {
        position: relative;
        border-left: 10px solid white;
        width: 100%;
        height: 60px;
        margin-bottom: 20px;
    }

    .works-floor-name {
        position: absolute;
        top: 0;
        left: 0;
        font-size: 10px;
    }

    .works-floor-btn {
        position: absolute;
        top: 0;
        right: 15px;
        border: 1px solid gray;
        font-size: 10px;
        color: gray;
        background-color: lightgray;
    }

    .works-floor-img {
        position: absolute;
        bottom: 20px;
        left: 0;
        font-size: 10px;
        background-image: url(${ctxStatic}/img/cut/index-icon.png);
        background-position-y: center;
        background-position-x: 2px;
        background-size: 12px 12px;
        background-color: #A15451;
        color: white;
        background-repeat: no-repeat;
        border: none;
        padding-left: 17px;
    }

    .works-floor-date {
        position: absolute;
        bottom: 20px;
        right: 15px;
        font-size: 10px;
    }

    .all-title {
        margin: 1%;
    }

    .all-title input {
        height: 20px;
        font-size: 18px;
        background-image: url(${ctxStatic}/img/cut/index-all.png);
        background-size: 18px 18px;
        background-repeat: no-repeat;
        border: none;
        bottom: 10px;
    }

    .works-floor {
        border-left: 10px solid white;
        width: 100%;
        margin-bottom: 10px;
    }

    .swiper-container {
        width: 100%;
        height: 100%;
    }

    .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;
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
</style>

<body>
<div class="swiper-container div-outer">
    <div class="swiper-wrapper">
        <div class="swiper-slide">
            <div class="header">
                <div class="works">
                    <a href="${ctx}/mobile/search" class="works-search">
                        输入你正在找的作品/用户</a>
                    <img src="${ctxStatic}/img/swiper/swiper-1.jpg" alt="" class="works-img"/>
                    <textarea disabled class="works-intro">新疆和田玉籽料,原皮原色,可玩可做,底部带一块僵,宽33毫米,厚15毫米,高53毫米,重41克.</textarea>
                </div>
                <div class="works-floor">
                    <span class="works-floor-name">冰阳绿树叶吊坠</span>
                    <span class="works-floor-btn">&nbsp;+&nbsp;收藏&nbsp;</span>
                    <span class="works-floor-img">田黄鸡血石</span>
                    <span class="works-floor-date">2016-12-4</span>
                </div>
            </div>
        </div>

        <div class="swiper-slide">
            <div class="header">
                <div class="works">
                    <a href="search.jsp" class="works-search">输入你正在找的作品/用户</a>
                    <img src="${ctxStatic}/img/swiper/swiper-2.jpg" alt="" class="works-img"/>
                    <textarea disabled class="works-intro">新疆和田玉籽料,原皮原色,可玩可做,底部带一块僵,宽33毫米,厚15毫米,高53毫米,重41克.</textarea>
                </div>
                <div class="works-floor">
                    <span class="works-floor-name">冰阳绿树叶吊坠</span>
                    <span class="works-floor-btn">&nbsp;+&nbsp;收藏&nbsp;</span>
                    <span class="works-floor-img">田黄鸡血石</span>
                    <span class="works-floor-date">2016-12-4</span>
                </div>
            </div>
        </div>
        <div class="swiper-slide">
            <div class="header">
                <div class="works">
                    <a href="search.jsp" class="works-search">输入你正在找的作品/用户</a>
                    <img src="${ctxStatic}/img/swiper/swiper-3.jpg" alt="" class="works-img"/>
                    <textarea disabled class="works-intro">新疆和田玉籽料,原皮原色,可玩可做,底部带一块僵,宽33毫米,厚15毫米,高53毫米,重41克.</textarea>
                </div>
                <div class="works-floor">
                    <span class="works-floor-name">冰阳绿树叶吊坠</span>
                    <span class="works-floor-btn">&nbsp;+&nbsp;收藏&nbsp;</span>
                    <span class="works-floor-img">田黄鸡血石</span>
                    <span class="works-floor-date">2016-12-4</span>
                </div>
            </div>
        </div>
    </div>
    <!--小圆点-->
    <div class="swiper-pagination"></div>
</div>

<div class="all div-outer">
    <div class="all-title">
        <input value="     全部作品"/>
    </div>

    <c:forEach items="${page.records}" var="works">
        <div class="works-all-outer">
            <div class="works-all">
                    <%--<img src="${ctxStatic}/img/swiper/swiper-2.jpg" alt="" class="works-img-all"/>--%>
                <img class="works-img-all" src="${works.images}"
                     onerror="javascript:this.src='${ctxStatic}/modules/pawn/img/default.png';this.className='error-img'"
                     alt="">
                <textarea disabled class="works-intro-all">${works.remarks}</textarea>
            </div>
            <div class="works-floor-all">
                <span class="works-floor-name-all">${works.name}</span>
                <span class="works-floor-btn-all">&nbsp;+&nbsp;收藏&nbsp;</span>
                <span class="works-floor-img-all">${works.type}</span>
                <span class="works-floor-date-all"><fmt:formatDate value="${works.createDate}"
                                                                   pattern="yyyy-MM-dd"/></span>
            </div>
        </div>
    </c:forEach>
    <c:if test="${fn:length(page.records) == 0}">
        <div style="text-align:center;margin-top:35%">
            <img src="${ctxStatic}/modules/pawn/img/empty.png" alt="" style="width: 50%;">
            <p style="color:#CCCCCC">尚无作品</p>
        </div>
    </c:if>
    <c:if test="${page.current < page.pages}">
        <div class="weui-infinite-scroll" id="scroll">
            <div class="infinite-preloader"></div>
            正在加载...
        </div>
    </c:if>
    <input type="hidden" value="${page.offsetCurrent}" id="pageNo">
</div>

<%@include file="include/tab-1.jsp" %>

<div id="dialogs">
    <div class="js_dialog" id="iosDialog2" style="display: none;">
        <div class="weui-mask"></div>
        <div class="weui-dialog">
            <div class="weui-dialog__bd">收藏成功!</div>
            <div class="weui-dialog__ft">
                <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary">我知道了</a>
            </div>
        </div>
    </div>
</div>

<a class="weui-col-50 item" id="tmp" style="display: none;">
    <img class="stone" src="${ctxStatic}/modules/pawn/img/name.png"
         onerror="this.src='${ctxStatic}/modules/pawn/img/default.png'" style="" alt="">
    <div style="width: 100%;text-align: center;">
        <span class="name">鸡血石</span>
    </div>
    <img class="status" src="${ctxStatic}/modules/pawn/img/status-3.png" style="" alt="">
</a>

<script>
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        paginationClickable: true
    });
    $(function () {
        $('.weui-tabbar__item').on('click', function () {
            $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
        });

        $('.works-img,.works-img-all').on('click', function () {
            location.href = '${ctx}/mobile/worksDetail';
        })

        $('.works-floor-btn-all,.works-floor-btn').on('click', function () {
            $('#iosDialog2').fadeIn(200);
        })

        $('#dialogs').on('click', '.weui-dialog__btn', function () {
            $(this).parents('.js_dialog').fadeOut(200);
        });


        <c:if test="${page.current < page.pages}">
        var lastPage = false;
        var loading = false;
        $(".all").infinite().on("infinite", function () {
            if (loading) return;
            if (lastPage) return;
            loading = true;
            $.ajax({
                type: "GET",
                url: "${ctx}/pawn/mobile/worksPage",
                data: {
                    pageNo: Number($("#pageNo").val()) + 1,
                    name: '${param.name}'
                },
                success: function (data) {
                    loading = false;
                    if (data.list.length == 0) {
                        return;
                    }
                    for (var i = 0; i < data.list.length; i++) {
                        $tmp = $("#tmp").clone();
                        $tmp.css('display', "block");
                        $tmp.find(".name").html(data.list[i].name);
                        $tmp.find(".breed").html(data.list[i].breedStr);
                        if (typeof data.list[i].breedStr == 'undefined' || data.list[i].breedStr == '') {
                            $tmp.find(".breed").css("display", "none");
                        }
                        $tmp.find(".createDate").html(data.list[i].createDateStr);
                        $tmp.find(".stone").attr("src", data.lastImage)
                        $(".items").append($tmp);
                    }
                    if (data.pageNo * data.pageSize >= data.count) {
                        $("#scroll").css("display", "none");
                        lastPage = true;
                    } else {

                        $("#pageNo").val(Number($("#pageNo").val()) + 1);
                    }
                }
            });
        });
        </c:if>
    });


</script>
</body>

</html>
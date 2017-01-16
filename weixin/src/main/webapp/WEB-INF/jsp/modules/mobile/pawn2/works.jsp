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
        height: 300px;
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
        border-radius: 6px;
        top: 10px;
        color: gray;
        background-color: white;
    }

    .works-intro {
        padding-left: 6px;
        padding-right: 6px;
        width: calc(100% - 12px);
        position: absolute;
        border: white;
        border: none;
        color: white;
        background-color: black;
        opacity: 0.8;
        left: 0px;
        bottom: 0px;
        resize: none;
        font-size: 20px;
    }

    .works-floor {
        position: relative;
        border-left: 10px solid white;
        width: 100%;
        height: 60px;
        margin-bottom: 20px;
    }

    .works-floor-name {
        text-align: left;
        position: absolute;
        top: 3px;
        left: 0;
        font-size: 12px;
        width: 150px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    .works-floor-btn {
        position: absolute;
        top: 3px;
        right: 15px;
        border: 1px solid gray;
        font-size: 12px;
        color: gray;
        background-color: white;
    }

    .works-floor-img {
        position: absolute;
        bottom: 20px;
        left: 0;
        font-size: 12px;
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
        font-size: 12px;
    }

    .all-title {
        width: 100%;
    }

    .all-title input {
        width: calc(100% - 25px);
        height: 45px;
        padding-left: 25px;
        font-size: 20px;
        background-image: url(${ctxStatic}/img/cut/index-all.png);
        background-size: 20px 20px;
        background-repeat: no-repeat;
        background-position-x: 3px;
        background-position-y: center;
        border: none;
        bottom: 10px;
        background-color: white;
    }

    .works-outer {
        width: 100%;
        height: 100%;
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
        <c:forEach items="${slideList}" var="works">
            <div class="swiper-slide">
                <div class="works-outer">
                    <input class="worksId" style="display:none" value="${works.id}">
                    <div class="works">
                        <a href="${ctx}/mobile/search" class="works-search">
                            输入你正在找的作品/用户</a>
                        <img class="works-img"
                             src="http://windyeel.img-cn-shanghai.aliyuncs.com/${works.images}?x-oss-process=image/resize,m_fill,h_100,w_100"
                             onerror="javascript:this.src='${ctxStatic}/modules/pawn/img/default.png'"
                             alt="">
                        <textarea disabled class="works-intro">${works.remarks}</textarea>
                    </div>
                    <div class="works-floor">
                        <span class="works-floor-name">${works.name}</span>
                        <span class="works-floor-btn">&nbsp;+&nbsp;收藏&nbsp;</span>
                        <span class="works-floor-img">${works.breed}</span>
                        <span class="works-floor-date"><fmt:formatDate value="${works.createDate}"
                                                                       pattern="yyyy-MM-dd"/></span>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <!--小圆点-->
    <div class="swiper-pagination"></div>
</div>
<div class="all">
    <div class="all-title">
        <input value="全部作品" disabled/>
    </div>

    <c:forEach items="${page.records}" var="works">
        <div class="works-all-outer">
            <input class="worksId" style="display:none" value="${works.id}">
            <div class="works-all">
                <img class="works-img-all"
                     src="http://windyeel.img-cn-shanghai.aliyuncs.com/${works.images}?x-oss-process=image/resize,m_fill,h_100,w_100"
                     onerror="javascript:this.src='${ctxStatic}/modules/pawn/img/default.png'"
                     alt="">
                <textarea disabled class="works-intro-all">${works.remarks}</textarea>
            </div>
            <div class="works-floor-all">
                <span class="works-floor-name-all">${works.name}</span>
                <span class="works-floor-btn-all">&nbsp;+&nbsp;收藏&nbsp;</span>
                <span class="works-floor-img-all">${works.breed}</span>
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

</div>

<c:if test="${page.current < page.pages}">
    <div class="weui-infinite-scroll" id="scroll">
        <div class="infinite-preloader"></div>
        正在加载...
    </div>
</c:if>
<input type="hidden" value="${page.current}" id="pageNo">

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


<div id="tmp" class="works-all-outer div-hide">
    <input class="worksId" style="display:none" value="value">
    <div class="works-all">
        <input type="hidden" class="nothing">
        <textarea disabled class="works-intro-all">${works.remarks}</textarea>
    </div>
    <div class="works-floor-all">
        <span class="works-floor-name-all">${works.name}</span>
        <span class="works-floor-btn-all">&nbsp;+&nbsp;收藏&nbsp;</span>
        <span class="works-floor-img-all">${works.breed}</span>
        <span class="works-floor-date-all"><fmt:formatDate value="${works.createDate}"
                                                           pattern="yyyy-MM-dd"/></span>
    </div>
</div>


<script>
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        paginationClickable: true
    });

    $(function () {
        $('.works-floor-btn-all,.works-floor-btn').on('click', fun1);
        function fun1() {
            var thisone = $(this);
            var worksid = thisone.parent().siblings('.worksId').val();
            $.ajax({
                type: "POST",
                url: "${ctx}/mobile/collectWorks",
                data: {
                    worksId: worksid
                },
                success: function (data) {
                    $('#iosDialog2 .weui-dialog__bd').html(data);
                    $('#iosDialog2').fadeIn(200);
                    thisone.html("&nbsp;&nbsp;已收藏&nbsp;");
                }
            })
        }

        $('.works-all,.works').on('click', fun2)
        function fun2() {
            var worksid = $(this).siblings('.worksId').val();
            location.href = '${ctx}/mobile/worksDetail?worksId=' + worksid;
        }


        $('#dialogs .weui-dialog__btn').click(function () {
            $(this).parents('.js_dialog').fadeOut(200);
        });


        <c:if test="${page.current < page.pages}">
        $(document.body).infinite(100);
        var lastPage = false;
        var loading = false;
        $(document.body).infinite().on("infinite", function () {
            if (loading) return;
            if (lastPage) return;
            loading = true;
            $.ajax({
                type: "GET",
                url: "${ctx}/mobile/worksPage",
                data: {
                    pageNo: Number($("#pageNo").val()) + 1,
                },
                success: function (data) {
                    loading = false;
                    if (data.records.length == 0) {
                        return;
                    }

                    for (var i = 0; i < data.records.length; i++) {
                        $tmp = $("#tmp").clone();
                        $tmp.removeAttr('id');
                        $tmp.find(".worksId").val(data.records[i].id);
                        $tmp.find(".works-floor-name-all").html(data.records[i].name);
                        $tmp.find(".works-floor-img-all").html(data.records[i].breed);

                        var t = data.records[i].createDate;
                        var d = new Date(parseInt(t)).Format("yyyy-MM-dd");
                        $tmp.find(".works-floor-date-all").html(d);

                        $tmp.find(".works-intro-all").html(data.records[i].remarks)
                        $tmp.children('.works-img-all').attr('src', 'http://windyeel.img-cn-shanghai.aliyuncs.com/' + data.records[i].images + '?x-oss-process=image/resize,m_fill,h_100,w_100');
                        var img = document.createElement('img');
                        var $img = $(img);
                        $img.addClass('works-img-all');
                        $img.on('error', function () {
                            this.src = '${ctxStatic}/modules/pawn/img/default.png';
                        })
                        $img.attr('src', 'http://windyeel.img-cn-shanghai.aliyuncs.com/' + data.records[i].images + '?x-oss-process=image/resize,m_fill,h_100,w_100');

                        $tmp.find('.works-all').append(img);
                        $tmp.find(".works-floor-btn-all").on('click', fun1);
                        $tmp.find(".works-all").on('click', fun2);
                        $tmp.removeClass('div-hide');
                        $(".all").append($tmp);
                    }

                    if (data.current >= data.pages) {
                        $("#scroll").css("display", "none");
                        lastPage = true;
                    } else {
                        $("#pageNo").val(Number($("#pageNo").val()) + 1);
                    }
                }
            })
        });
        </c:if>
    });


    Date.prototype.Format = function (fmt) { //author: meizz
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "h+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }

</script>
</body>

</html>
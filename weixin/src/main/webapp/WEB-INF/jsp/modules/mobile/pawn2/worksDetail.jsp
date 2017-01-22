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
    <style>
        #header-left {
            width: 15%;
            float: left;
            overflow: hidden;
            display: inline-block;
        }

        #header-left-img {
            height: 50px;
            width: 50px;
            margin-left: 5px;
        }

        #header-left-like {
            font-size: 8px;
            width: 50px;
            margin-left: 5px;
            margin-top: 5px;
        }

        #header-right {
            display: inline-block;
            margin-left: 3%;
            width: 80%;
        }

        #header-right-tab {
            font-size: 15px;
            height: 55px;
            position: relative;
        }

        .header-right-appUserName {
            position: absolute;
            color: #98CCEB;
            top: 0;
            left: 0;
            width: 120px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .header-right-workId {
            color: #C27B77;
            position: absolute;
            top: 0;
            right: 5px;

        }

        .header-right-workName {
            border: none;
            position: absolute;
            bottom: 0px;
            left: 0;
            resize: none;
            vertical-align: bottom;

        }

        .header-right-btn {
            font-size: 12px;
            position: absolute;
            bottom: 15px;
            right: 10px;
            border: 1px solid gray;
            color: gray;
        }

        #header-right-intro {
            margin-top: 4%;
            line-height: 20px;
            margin-bottom: 4%;

        }

        #header-right-footer {
            font-size: 10px;
        }

        #like {
            margin-bottom: 10px;
        }

        #like-icon {
            margin-left: 5%;
            width: 10%;
            display: inline-block;
            float: left;
        }

        #like-icon img {
            margin-top: 10px;
            width: 20px;
            height: 20px;
        }

        #like-people {
            width: 85%;
            display: inline-block;
        }

        .like-people-one {
            float: left;
            width: 32px;
            height: 32px;
            margin: 3px;

        }

        #look-icon {
            margin-left: 5%;
            width: 10%;
            display: inline-block;
            float: left;
        }

        #look-people {
            margin-left: 1%;
            width: 75%;
            display: inline-block;
        }

        .look-people-one {
            margin-bottom: 5%;
        }

        .look-people-one-img {
            width: 40px;
            height: 40px;
            margin-right: 1%;
        }

        .look-people-one-info {
            display: inline-block;
            font-size: 10px;
        }

        .look-people-one-info-name {
            position: relative;
            top: -5px;
        }

        .look-people-one-info-date {
            position: relative;
            top: -5px;
        }

        .look-people-one-care {
            text-align: center;
            display: inline-block;
            float: right;
            margin-top: 2%;
        }

        .look-people-one-care-text-not {
            font-size: 15px;
            background-color: #189AD8;
            color: white;
            border-radius: 3px;
            padding-left: 12px;
            padding-right: 12px;
        }

        .look-people-one-care-text-have {
            font-size: 15px;
            background-color: #C3C3C3;
            color: white;
            border-radius: 3px;
            padding-left: 8px;
            padding-right: 8px;

        }

        #look-people-more {
            font-size: 10px;
            color: #A8A8A8;
            margin-bottom: 5%;
        }

        .info-register-left {
            float: left;
            margin-left: 10%;
            margin-right: 3%;
            width: 20%;
        }

        .info-register-left-icon {
            background-image: url("${ctxStatic}/img/cut/worksDetail-register-or-like.png");
            background-repeat: no-repeat;
            background-position-x: center;
            background-size: 30px 30px;
            padding-top: 30px;
            text-align: center;
            font-size: 13px;
        }

        .info-register-right {
            display: inline-block;
            font-size: 15px;
        }

        .info-work {
            font-size: 15px;
            margin-left: 5%;
            margin-bottom: 5%;
        }

        .info-work span {
            color: gray;
        }

        .each-row-two {
            display: inline-block;
            width: 46%;
        }

        .explain-img {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            vertical-align: bottom;
        }

        .explain-text {
            border: none;
            height: 26px;
            line-height: 26px;
            width: 160px;
            padding-left: 2px;
            padding-right: 2px;
            vertical-align: bottom;
        }

        .explain-btn {
            background-color: #2598DB;
            color: white;
            border: 2px solid white;
            height: 32px;
            width: 110px;
            text-align: center;
            font-size: 14px;
            font-weight: bold;
            margin-left: 30px;
        }

        .explains-one {
            margin-bottom: 2%;
        }

        .explains-one-title-name {
            border: none;
            height: 26px;
            line-height: 26px;
            width: 80px;
            padding-left: 2px;
            padding-right: 2px;
            vertical-align: bottom;
        }

        .explains-one-title-date {
            border: none;
            height: 26px;
            line-height: 26px;
            width: 80px;
            margin-left: 120px;
            padding-right: 2px;
            vertical-align: bottom;
        }

        .explains-one-imgs-one {
            width: 23%;
            height: 70px;
        }

        .weui-grid__icon {
            width: 90px;
            height: 90px;
            margin: 0 auto;
        }

        .weui-grid {
            padding: 3px 3px;
        }

        .weui-grids:before, .weui-grids:after, .weui-grid:after, .weui-grid:before {
            border: none;
        }

        .explains-one-text:after {
            content: '全文';
            color: blue;

        }

        .div-outer {
            padding-top: 10px;
            padding-bottom: 5px;
        }

        .certImage {
            width: 100px;
        }

    </style>

</head>
<body>
<div id="header" class="div-outer">
    <div id="header-left" data-id="${appUser.id}">
        <img src="${appUser.headImgUrl}"
             onerror="javascript:this.src='${ctxStatic}/modules/pawn/img/default-man.jpg'" id="header-left-img">
        <input type="button" value=" + 关注 " id="header-left-like">
    </div>
    <div id="header-right">
        <div id="header-right-tab">
            <span class="header-right-appUserName">${appUser.loginName}</span>
            <span class="header-right-workId">${works.no}</span>
            <%--<span class="header-right-workName">[${works.name}]</span>--%>
            <textarea
                    <c:if test="${fn:length(works.name) > 15}">rows="2"</c:if>
                    <c:if test="${fn:length(works.name) < 14}">rows="1"</c:if>
                    cols="30" class="header-right-workName">[${works.name}]</textarea>
            <span class="header-right-btn">&nbsp;+&nbsp;收藏&nbsp;</span>
        </div>
        <div id="header-right-intro">
            ${works.remarks}
        </div>
        <div class="weui-grids">
            <c:forEach items="${imagesList}" var="image">
                <a href="javascript:;" class="weui-grid">
                    <div class="weui-grid__icon">
                        <img src="http://windyeel.img-cn-shanghai.aliyuncs.com/${image.url}?x-oss-process=image/resize,m_fill,h_100,w_100"
                             onerror="javascript:this.src='${ctxStatic}/modules/pawn/img/default.jpg'"
                             alt="">
                    </div>
                </a>
            </c:forEach>
            <c:if test="${fn:length(imagesList) == 0}">
                <a href="javascript:;" class="weui-grid">
                    <div class="weui-grid__icon">
                        <img src="${ctxStatic}/modules/pawn/img/empty.png" alt="">
                    </div>
                </a>
            </c:if>
        </div>
        <div id="header-right-footer">
            <span>浏览次数 ${works.browserCount}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span>2016-11-06&nbsp;12:06:18</span>
        </div>
    </div>
</div>

<div class="like-and-look div-outer">
    <div id="like">
        <div id="like-icon">
            <img src="${ctxStatic}/img/cut/worksDetail-likepeople.png">
        </div>

        <div id="like-people">
            <c:forEach items="${collecterList}" var="person">
                <img class="like-people-one" src="${person.headImgUrl}"
                     onerror="javascript:this.src='${ctxStatic}/modules/pawn/img/default-man.jpg'"
                     alt="">
            </c:forEach>
            <img src="${ctxStatic}/img/cut/worksDetail-morelikepeople.png" class="like-people-one">
        </div>
    </div>


    <div id="look">
        <div id="look-icon">
            <img src="${ctxStatic}/img/cut/worksDetail-lookpeople.png">
        </div>
        <div id="look-people">
            <c:forEach items="${browserPeopleList}" var="browse">
                <div class="look-people-one" data-id="${browse.appUser.id}">
                    <img src="${browse.appUser.headImgUrl}" class="look-people-one-img"
                         onerror="javascript:this.src='${ctxStatic}/modules/pawn/img/default-man.jpg'"
                         alt="">
                    <div class="look-people-one-info">
                        <p class="look-people-one-info-name">${browse.appUser.name}</p>
                        <p class="look-people-one-info-date"><fmt:formatDate value="${browse.updateDate}"
                                            pattern="yyyy-MM-dd HH:mm:ss"/></p>
                    </div>
                    <div class="look-people-one-care">
                        <p class="look-people-one-care-text-not">
                            +关注
                        </p>
                    </div>
                </div>
            </c:forEach>

            <%--<center id="look-people-more">加载更多</center>--%>
        </div>
    </div>
</div>


<div class="div-outer">
    <div class="info-register">
        <div class="info-register-left">
            <p class="info-register-left-icon">登记者信息</p>
        </div>
        <div class="info-register-right">
            <p>姓名:${provider.name}</p>
            <p>联系方式:${provider.phone}</p>
            <p>地址:${provider.address}</p>
            <p>身份证:${provider.no}</p>
        </div>
    </div>
</div>
<div class="div-outer">
    <div class="info-work">
        <center>作品信息</center>
        <div class="each-row-two">
            <span>品种:</span>${works.breed}
        </div>
        <div class="each-row-two">
            <span>作品类型: </span>${works.type}
        </div>
        <div class="each-row-two">
            <span>尺寸: </span>${works.length}cm*${works.width}cm*${works.height}cm
        </div>
        <div class="each-row-two">
            <span>重量:</span>${works.weight}g
        </div>
        <div class="each-row-two">
            <span>工艺制作: </span>${works.gyType}
        </div>
        <div class="each-row-two">
            <span>篆刻级别:</span>${works.levelZk}
        </div>
        <div class="each-row-two">
            <span>矿区地域:</span>${works.kqdy}
        </div>
        <div class="each-row-two">
            <span>制作人:</span>${works.maker}
        </div>
        <div>
            <span>制作时间:</span><fmt:formatDate value="${works.makeTime}"
                                              pattern="yyyy-MM-dd"/>
        </div>
        <div>
            <span>作品诠释:</span>${works.worksMeaning}
        </div>
    </div>

    <div class="info-work">
        <center>作品等级</center>
        <div class="each-row-two">
            <span>质地一:</span>${worksLevel.zhidi}
        </div>
        <div class="each-row-two">
            <span>质地二: </span>${worksLevel.zhidi2}
        </div>
        <div class="each-row-two">
            <span>感观: </span>${worksLevel.ganguan}
        </div>
        <div class="each-row-two">
            <span>磨氏度: </span>${worksLevel.moshidu}
        </div>
        <div class="each-row-two">
            <span>血量:</span>${worksLevel.xueliang}
        </div>
        <div class="each-row-two">
            <span>血色: </span>${worksLevel.xuese}
        </div>
        <div class="each-row-two">
            <span>血形:</span>${worksLevel.xuexing}
        </div>
        <div class="each-row-two">
            <span>浓艳度:</span>${worksLevel.nongyandu}
        </div>
        <div class="each-row-two">
            <span>纯净度:</span>${worksLevel.chunjingdu}
        </div>
        <div class="each-row-two">
            <span>地色:</span>${worksLevel.dise}
        </div>
        <div class="each-row-two">
            <span>活筋:</span>${worksLevel.liu}
        </div>
        <div class="each-row-two">
            <span>裂:</span>${worksLevel.lie}
        </div>
        <div class="each-row-two">
            <span>印章:</span>${worksLevel.hanxuemian}
        </div>
        <div class="each-row-two">
            <span>含血方式:</span>${worksLevel.hanxuefangshi}
        </div>
    </div>
</div>
<c:if test="${!empty report}">
    <div class="div-outer">
        <div class="info-work">
            <center>评估报告</center>
            <div>
                <c:choose>
                    <c:when test="${report.des != ''}">
                        ${report.des}
                    </c:when>
                    <c:otherwise>
                        <span>暂无评论报告...</span>
                    </c:otherwise>
                </c:choose>
            </div>
            <c:if test="${(!empty certImage.url)&&(fn:length(certImage.url)>0)}">
                <img src="http://windyeel.img-cn-shanghai.aliyuncs.com/${certImage.url}?x-oss-process=image/resize,m_fill,h_100,w_100"
                     alt="" class="certImage">
            </c:if>
        </div>
    </div>
</c:if>
<c:if test="${empty collecter}">
    <div class="div-outer">
        <div class="info-register">
            <div class="info-register-left">
                <p class="info-register-left-icon">收藏者信息</p>
            </div>
            <div class="info-register-right">
                <p>姓名:${collecter.name}</p>
                <p>联系方式:${collecter.phone}</p>
                <p>地址:${collecter.address}</p>
                <p>身份证:${collecter.no}</p>
            </div>
        </div>
    </div>
</c:if>
<div class="div-outer">
    <div class="info-work">
        <center>作品诠释</center>
        <br>
        <img src="${ctxStatic}/img/headImg/3.jpg" class="explain-img">
        <input type="button" value="点击进行诠释" class="explain-btn"
               onclick="location.href='${ctx}/mobile/interpretationPre?worksId=${works.id}'"/>
    </div>
    <c:forEach items="${interpretationList}" var="inter">
        <div class="info-work">
            <div class="explains-one">
                <div class="explains-one-title">
                    <img class="explain-img" src="${inter.appUser.headImgUrl}"
                         onerror="javascript:this.src='${ctxStatic}/modules/pawn/img/default.png'">
                    <input disabled type="text" class="explains-one-title-name" value="${inter.appUser.loginName}"/>
                    <input disabled type="text" value="2016-12-05" class="explains-one-title-date"/>
                </div>
                <div class="explains-one-text" data-id="${inter.id}">
                    <c:if test="${fn:length(inter.description) >50}">${fn:substring(inter.description,0,50)}</c:if>
                    <c:if test="${fn:length(inter.description) <=30}">${inter.description}</c:if>
                </div>
                <div class="explains-one-imgs">
                    <c:forEach items="${inter.imagesList}" var="image">
                        <img src="http://windyeel.img-cn-shanghai.aliyuncs.com/${image.url}?x-oss-process=image/resize,m_fill,h_100,w_100"
                             class="explains-one-imgs-one">
                    </c:forEach>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<div class="js_dialog" id="notCareDialog" style="display: none;">
    <div class="weui-mask"></div>
    <div class="weui-dialog">
        <div class="weui-dialog__hd"><strong class="weui-dialog__title">成功关注!</strong></div>
        <div class="weui-dialog__ft">
            <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary">确定</a>
        </div>
    </div>
</div>

<script>
    $(function () {
        $('.explains-one-text').on('click', function () {
            location.href = "${ctx}/mobile/interpretationDetail?interId=" + $(this).attr('data-id');
        })

        $('.weui-dialog__btn').on('click', function () {
            $('.js_dialog').fadeOut(200);
        })

        $('.look-people-one-care-text-not').on('click', function () {
            var thisone = $(this);
            var targetId = thisone.parent().parent().attr('data-id');
            $.ajax({
                type: "POST",
                url: "${ctx}/mobile/notToHave",
                data: {
                    targetId: targetId
                },
                success: function (data) {
                    if (data == '关注成功!') {
                        $('#notCareDialog').find('.weui-dialog__title').html(data);
                        $('#notCareDialog').fadeIn(200);
                        thisone.html("已关注");
                    }
                }
            })
        })

        $('#header-left-like').on('click', function () {
            var thisone = $(this);
            var targetId = thisone.parent().attr('data-id');
            $.ajax({
                type: "POST",
                url: "${ctx}/mobile/notToHave",
                data: {
                    targetId: targetId
                },
                success: function (data) {
                    if (data == '关注成功!') {
                        $('#notCareDialog').find('.weui-dialog__title').html(data);
                        $('#notCareDialog').fadeIn(200);
                        $('#header-left-like').val("已关注");
                    }
                }
            })
        })


        $('.header-right-btn').on('click', function () {
            var worksid = ${works.id};
            $.ajax({
                type: "POST",
                url: "${ctx}/mobile/collectWorks",
                data: {
                    worksId: worksid
                },
                success: function (data) {
                    $('#notCareDialog').find('.weui-dialog__title').html(data);
                    $('#notCareDialog').fadeIn(200);
                }
            })
        })

        $('#header-left-img').on('click', function () {
            var appUserId = $('#header-left').attr('data-id');
            location.href = '${ctx}/mobile/appUserInfo?appUserId=' + appUserId;
        })
        checkAttented();
        checkAttented1();
        checkColleced();
    })

    function checkColleced() {
        var elements = $('.header-right-btn');
        var worksid = ${works.id};
        $.ajax({
            type: "POST",
            url: "${ctx}/mobile/checkColleced",
            data: {
                worksId: worksid
            },
            success: function (data) {
                if(data != ""){
                    elements.html("&nbsp;&nbsp;已收藏&nbsp;");
                }
            }
        })
    }

    function checkAttented() {
        var thisone = $('#header-left-like');
        var targetId = thisone.parent().attr('data-id');
        $.ajax({
            type: "POST",
            url: "${ctx}/mobile/checkAttented",
            data: {
                targetId: targetId
            },
            success: function (data) {
                if (data != "") {
                    $('#header-left-like').val(data);
                }
            }
        })
    }

    function checkAttented1() {
        var thisone = $('.look-people-one-care-text-not');
        $.each(thisone,function () {
            var targetId = $(this).parent().parent().attr('data-id');
            $.ajax({
                type: "POST",
                url: "${ctx}/mobile/checkAttented",
                data: {
                    targetId: targetId
                },
                success: function (data) {
                    if (data != "") {
                        $(this).html("已关注");
                    }
                }
            })
        })
    }
</script>

</body>
</html>
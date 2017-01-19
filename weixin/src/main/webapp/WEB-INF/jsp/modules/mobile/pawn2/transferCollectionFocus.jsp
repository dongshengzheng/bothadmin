<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>转让-收藏-关注</title>
    <link rel="stylesheet" href="${ctxStatic}/css/custom.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/weui.min.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/jquery-weui.min.css"/>

    <script src="${ctxStatic}/js/jquery-2.1.4.js"></script>
    <script src="${ctxStatic}/js/jquery-weui.js"></script>
    <script src="${ctxStatic}/js/swiper.js"></script>
    <style>
        .weui-tabbar__item.weui-bar__item_on .weui-tabbar__label {
            color: #9F504D;
        }

        .weui-navbar__item.weui-bar__item_on {
            color: #2698DE;
            border-bottom: 3px solid #2698DE;
            background-color: white;
        }

        .weui-navbar__item {
            background-color: white;
        }

        .weui-navbar__item:after {
            border: none;
        }

        .weui-media-box__thumb {
            border-radius: 50%;
        }

        .works-floor-btn-all,.works-floor-date-all{
            background-color: white;
            right: 10px;
        }

        .transfer-img {
            position: absolute;
            transform: rotate(40deg);
            top: 50px;
            left: 100px;
            width: 70px;
            height: 70px;
            background-color: white;
            z-index: 100;
        }

    </style>


</head>
<body>
<div class="weui-tab">
    <div class="weui-navbar">
        <div class="weui-navbar__item <c:if test="${showwhich=='transfer'}">weui-bar__item_on</c:if>"
             id="transfer-title">
            转让作品
        </div>
        <div class="weui-navbar__item <c:if test="${showwhich=='collection'}">weui-bar__item_on</c:if>"
             id="collection-title">
            收藏作品
        </div>
        <div class="weui-navbar__item <c:if test="${showwhich=='focus'}">weui-bar__item_on</c:if>" id="foucs-title">
            关注用户
        </div>
    </div>
</div>

<div class="fixed-footer-blank">

</div>


<div id="tranfer-works" class="all div-hide <c:if test="${showwhich=='transfer'}">div-on</c:if>">
    <c:forEach items="${transferHistoryList}" var="th">
        <div class="works-all-outer" data-id="${th.id}">
            <div class="works-all">
                <c:if test="${th.status==2}">
                    <c:if test="${th.toUserId==appUserId}">
                        <img src="${ctxStatic}/img/cut/waitin.png" class="transfer-img confirmTransfer">
                    </c:if>
                    <c:if test="${th.fromUserId==appUserId}">
                        <img src="${ctxStatic}/img/cut/waitout.png" class="transfer-img">
                    </c:if>
                </c:if>
                <c:if test="${th.status==1}">
                    <c:if test="${th.toUserId==appUserId}">
                        <img src="${ctxStatic}/img/cut/havein.png" class="transfer-img">
                    </c:if>
                    <c:if test="${th.fromUserId==appUserId}">
                        <img src="${ctxStatic}/img/cut/haveout.png" class="transfer-img">
                    </c:if>
                </c:if>
                <img class="works-img-all"
                     src="http://windyeel.img-cn-shanghai.aliyuncs.com/${th.works.images}?x-oss-process=image/resize,m_fill,h_100,w_100"
                     onerror="javascript:this.src='${ctxStatic}/modules/pawn/img/default.png'"
                     alt="">
                <textarea class="works-intro-all" disabled>${th.works.remarks}</textarea>
            </div>
            <div class="works-floor-all">
                <span class="works-floor-name-all">${th.works.name}</span>
                <span class="works-floor-btn-all go-to-history">&nbsp;转让历史&nbsp;</span>
                <span class="works-floor-img-all">${th.works.breed}</span>
                <span class="works-floor-date-all"><fmt:formatDate value="${th.works.createDate}"
                                                                   pattern="yyyy-MM-dd"/></span>
            </div>
        </div>
    </c:forEach>

    <c:if test="${fn:length(transferHistoryList) == 0}">
        <div class="no-works">
            <img src="${ctxStatic}/modules/pawn/img/empty.png" alt="">
            <p style="color:#CCCCCC">尚无作品</p>
        </div>
    </c:if>
    <c:if test="${fn:length(transferWorksList) > 0}">
        <div class="hr-text ">
            <center>
                <hr>
                <span>&nbsp;&nbsp;到底啦&nbsp;&nbsp;</span></center>
        </div>
    </c:if>
</div>

<div id="collection-works" class="all div-hide <c:if test="${showwhich=='collection'}">div-on</c:if>">
    <c:forEach items="${fhWorksList}" var="works">
        <div class="works-all-outer" data-id="${works.id}">
            <div class="works-all">
                <img class="works-img-all"
                     src="http://windyeel.img-cn-shanghai.aliyuncs.com/${works.images}?x-oss-process=image/resize,m_fill,h_100,w_100"
                     onerror="javascript:this.src='${ctxStatic}/modules/pawn/img/default.png'"
                     alt="">
                <textarea class="works-intro-all" disabled>${works.remarks}</textarea>
            </div>
            <div class="works-floor-all">
                <span class="works-floor-name-all">${works.name}</span>
                <span class="works-floor-btn-all">&nbsp;取消收藏&nbsp;</span>
                <span class="works-floor-img-all">${works.breed}</span>
                <span class="works-floor-date-all"><fmt:formatDate value="${works.createDate}"
                                                                   pattern="yyyy-MM-dd"/></span>
            </div>
        </div>
    </c:forEach>

    <c:if test="${fn:length(fhWorksList) == 0}">
        <div class="no-works">
            <img src="${ctxStatic}/modules/pawn/img/empty.png" alt="">
            <p style="color:#CCCCCC">尚无作品</p>
        </div>
    </c:if>
    <c:if test="${fn:length(fhWorksList) > 0}">
        <div class="hr-text ">
            <center>
                <hr>
                <span>&nbsp;&nbsp;到底啦&nbsp;&nbsp;</span></center>
        </div>
    </c:if>

</div>

<div id="focus-people" class="div-hide <c:if test="${showwhich=='focus'}">div-on</c:if>">
    <c:forEach items="${fhPeopleList}" var="person">
        <div class="weui-panel__bd" id="${person.id}">
            <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
                <div class="weui-media-box__hd">
                    <img class="weui-media-box__thumb"
                         src="${person.headImgUrl}"
                         alt="">
                </div>
                <div class="weui-media-box__bd">
                    <h4 class="weui-media-box__title">${person.loginName}</h4>
                    <p class="weui-media-box__desc search-results-one-info-location">长沙</p>
                    <p class="weui-media-box__desc">作品:${person.worksCount} &nbsp;粉丝:${person.followCount}</p>
                    <div class="search-results-one-care have-care div-on">
                        <img src="${ctxStatic}/img/cut/have-focus.png" class="search-results-one-care-img "/>
                        <p class="search-results-one-care-text-have ">
                            已关注
                        </p>
                    </div>
                    <div class="search-results-one-care not-care div-hide">
                        <img src="${ctxStatic}/img/cut/to-focus.png" class="search-results-one-care-img "/>
                        <p class="search-results-one-care-text-not ">
                            加关注
                        </p>
                    </div>
                </div>
            </a>
        </div>
    </c:forEach>
    <c:if test="${fn:length(fhPeopleList) == 0}">
        <div class="no-works">
            <img src="${ctxStatic}/modules/pawn/img/empty.png" alt="">
            <p style="color:#CCCCCC">尚无关注用户</p>
        </div>
    </c:if>
    <c:if test="${fn:length(fhPeopleList) > 0}">
        <div class="hr-text">
            <center>
                <hr>
                <span>&nbsp;&nbsp;到底啦&nbsp;&nbsp;</span></center>
        </div>
    </c:if>
</div>

<%@include file="include/tab-3.jsp" %>

<div class="js_dialog" id="haveCareDialog" style="display: none;" date-id="">
    <div class="weui-mask"></div>
    <div class="weui-dialog">
        <div class="weui-dialog__hd"><strong class="weui-dialog__title">取消关注</strong></div>
        <div class="weui-dialog__bd">取消关注后将无法看到该用户的相关信息</div>
        <div class="weui-dialog__ft">
            <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_default">取消</a>
            <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary">确定</a>
        </div>
    </div>
</div>

<div class="js_dialog" id="notCareDialog" style="display: none;">
    <div class="weui-mask"></div>
    <div class="weui-dialog">
        <div class="weui-dialog__hd"><strong class="weui-dialog__title">替换内容</strong></div>
        <div class="weui-dialog__ft">
            <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary">确定</a>
        </div>
    </div>
</div>

<div class="js_dialog" id="confirmTransfer" style="display: none;" data-id="">
    <div class="weui-mask"></div>
    <div class="weui-dialog">
        <div class="weui-dialog__hd"><strong class="weui-dialog__title">确定转入该作品吗</strong></div>
        <div class="weui-dialog__ft">
            <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_default">取消</a>
            <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary">确定</a>
        </div>
    </div>
</div>
<input type="hidden" id="ctxStatic" value="${ctxStatic}">
<script>
    $(function () {
        $('.weui-navbar__item').on('click', function () {
            $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
        });

        $("#transfer-title").click(function () {
            $('#tranfer-works').addClass('div-on').siblings('.div-hide').removeClass('div-on');
        })
        $("#collection-title").click(function () {
            $('#collection-works').addClass('div-on').siblings('.div-hide').removeClass('div-on');
        })
        $("#foucs-title").click(function () {
            $('#focus-people').addClass('div-on').siblings('.div-hide').removeClass('div-on');
        })
    })

    //取消关注
    $(function () {
        var $haveCareDialog = $('#haveCareDialog');
        var $notCareDialog = $('#notCareDialog');

        $('#dialogs').on('click', '.weui-dialog__btn', function () {
            $(this).parents('.js_dialog').fadeOut(200);
        });

        $('.weui-dialog__btn').on('click', function () {
            $('.js_dialog').fadeOut(200);
        })

        $('.have-care').on('click', function () {
            $haveCareDialog.fadeIn(200);
            $haveCareDialog.attr('data-id', $(this).parent().parent().parent().attr('id'));
        });

        $('#haveCareDialog .weui-dialog__btn_primary').on('click', function () {
            var targetId = $('#haveCareDialog').attr('data-id');
            var thisOne = $('#' + ($('#haveCareDialog').attr('data-id')) + ' .have-care');

            $.ajax({
                type: "POST",
                url: "${ctx}/mobile/haveToNot",
                data: {
                    targetId: targetId
                },
                success: function (data) {
                    $notCareDialog.find('.weui-dialog__title').html(data);
                    if (data == '取关成功!') {
                        thisOne.removeClass('div-on').siblings('.search-results-one-care').addClass('div-on');
                        thisOne.removeClass('div-on').siblings('.search-results-one-care').addClass('div-on');
                        var outer = $(thisOne).parent().parent().parent();
                        var haveCareOuter = outer.parent();
                        outer.remove();
                    }
                    $notCareDialog.fadeIn(200);
                }
            })
        })
    })

    //    跳往历史转让页面
    $(function () {
        $('.go-to-history').on('click', function () {
            var worksId = $(this).parent().parent().attr('data-id');
            location.href = "${ctx}/mobile/transferHistory?worksId=" + worksId;
        })
    })

    //取消作品收藏
    $(function () {
        $('#collection-works .works-floor-btn-all').on('click', function () {
            var $notCareDialog = $('#notCareDialog');
            var thisone = $(this).parent().parent();
            var targetId = thisone.attr('data-id');
            $.ajax({
                type: "POST",
                url: "${ctx}/mobile/cancelCollect",
                data: {
                    targetId: targetId
                },
                success: function (data) {
                    $notCareDialog.find('.weui-dialog__title').html(data);
                    if (data == '取消收藏成功!') {
                        thisone.remove()
                    }
                    $notCareDialog.fadeIn(200);
                }
            })
        })
    })


    //确认转入作品
    $('.confirmTransfer').on('click', function () {
        $('#confirmTransfer').attr('data-id', $(this).parent().parent().attr('data-id'));
        $('#confirmTransfer').fadeIn(200);
    })

    $('#confirmTransfer .weui-dialog__btn_primary').on('click', function () {
        var $notCareDialog = $('#notCareDialog');
        var thId = $('#confirmTransfer').attr('data-id');
        $.ajax({
            type: "POST",
            url: "${ctx}/mobile/confirmTransfer",
            data: {
                thId: thId
            },
            success: function (data) {
                $notCareDialog.find('.weui-dialog__title').html(data);
                if (data == '已转入!') {
                    $notCareDialog.find('.weui-dialog__title').html(data + "作品详情可到审核通过作品中查看!");
                    var works = $('.works-all-outer[data-id=' + thId + ']').find('.confirmTransfer')
                    works.attr('src', $('#ctxStatic').val() + '/img/cut/havein.png');
                    works.removeClass('confirmTransfer');
                    works.unbind('click');
                }
                $notCareDialog.fadeIn(200);
            }
        })
    })

    //跳往作品详情
    $('.works-all').on('click', function () {
        var worksid = $(this).parent().attr('data-id')
        location.href = '${ctx}/mobile/worksDetail?worksId=' + worksid;
    })

</script>
</body>
</html>
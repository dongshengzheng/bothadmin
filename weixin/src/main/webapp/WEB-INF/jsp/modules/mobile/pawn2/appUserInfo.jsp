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
    <style type="text/css">
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

        .header-info-care {
            color: white;
            background-color: #169AD8;
            border-radius: 3px;
            border: none;
            position: relative;
            margin-top: 5px;
            height: 25px;
            width: 65px;
        }

        .weui-cells {
            color: gray;
        }

        .weui-media-box__thumb {
            border-radius: 50%;
        }

    </style>
</head>

<body>
<div class="weui-panel weui-panel_access">
    <div class="weui-panel__bd">
        <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
            <div class="weui-media-box__hd">
                <img class="weui-media-box__thumb"
                     src="${appUser.headImgUrl}"
                     alt="">
            </div>
            <div class="weui-media-box__bd">
                <h4 class="weui-media-box__title">${appUser.loginName}</h4>
                <p class="weui-media-box__desc">作品:${appUser.worksCount} &nbsp;粉丝:${appUser.followCount}</p>
                <input data-id="${appUser.id}" type="button" value=" + 关注 " class="header-info-care"/>
            </div>
        </a>
    </div>
</div>

<div class="weui-tab">
    <div class="weui-navbar">
        <div class="weui-navbar__item weui-bar__item_on" id="detail-title-info">
            个人资料
        </div>
        <div class="weui-navbar__item" id="detail-title-works">
            Ta的作品
        </div>
        <div class="weui-navbar__item" id="detail-title-fans">
            Ta的粉丝
        </div>
    </div>
</div>
<div class="fixed-footer-blank">
</div>

<div>
    <div id="info" class="div-on">
        <div class="weui-cells">
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">姓名</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input disabled name="name" class="weui-input" value="${appUser.name}" type="tel"
                           placeholder="暂无姓名信息">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">地址</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input disabled name="address" class="weui-input" value="${appUser.address}" type="tel"
                           placeholder="暂无地址信息">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">联系方式</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input disabled name="phone" class="weui-input" value="${appUser.phone}" type="tel"
                           placeholder="暂无联系方式">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">Email</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input disabled name="email" class="weui-input" value="${appUser.email}" type="tel"
                           placeholder="暂无Email信息">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">身份证</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input disabled name="identification" class="weui-input" value="${appUser.identification}"
                           type="tel"
                           placeholder="暂无身份证信息">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">收藏偏好</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <c:forEach items="${preference}" var="pre">
                        <input disabled type="checkbox" name="prefer" value="${pre.value}"
                        <c:forEach items="${prefer}" var="myPre">
                               <c:if test="${myPre==pre.value}">checked</c:if>
                        </c:forEach>
                        >${pre.label}
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <div id="works" class="div-hide ">
        <c:forEach items="${worksList}" var="works">
            <div class="works-all-outer">
                <input class="worksId" style="display:none" value="${works.id}">
                <div class="works-all">
                    <img class="works-img-all" src="${works.images}"
                         onerror="javascript:this.src='${ctxStatic}/modules/pawn/img/default.png';this.className='error-img'"
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
        <c:if test="${fn:length(worksList) == 0}">
            <div class="no-works">
                <img src="${ctxStatic}/modules/pawn/img/empty.png" alt="">
                <p style="color:#CCCCCC">尚无作品</p>
            </div>
        </c:if>
        <c:if test="${fn:length(worksList) > 0}">
            <div class="hr-text ">
                <center>
                    <hr>
                    <span>&nbsp;&nbsp;到底啦&nbsp;&nbsp;</span></center>
            </div>
        </c:if>
    </div>

    <div id="fans" class="div-hide">
        <div class="search-results ">
            <div id="have-care-people">
                <c:forEach items="${haveFocusList}" var="person">
                    <div class="weui-panel__bd" id="${person.id}">
                        <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
                            <div class="weui-media-box__hd">
                                <img class="weui-media-box__thumb"
                                     src="${person.headImgUrl}"
                                     alt="">
                            </div>
                            <div class="weui-media-box__bd">
                                <h4 class="weui-media-box__title">${person.name}</h4>
                                <p class="weui-media-box__desc search-results-one-info-location">长沙</p>
                                <p class="weui-media-box__desc">作品:${person.worksCount}
                                    &nbsp;粉丝:${person.followCount}</p>
                                <div class="search-results-one-care have-care div-hide div-on">
                                    <img src="${ctxStatic}/img/cut/have-focus.png"
                                         class="search-results-one-care-img "/>
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
            </div>

            <div id="not-care-people">
                <c:forEach items="${notFocusList}" var="person">
                    <div class="weui-panel__bd" id="${person.id}">
                        <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
                            <div class="weui-media-box__hd">
                                <img class="weui-media-box__thumb"
                                     src="${person.headImgUrl}"
                                     alt="">
                            </div>
                            <div class="weui-media-box__bd">
                                <h4 class="weui-media-box__title">${person.name}</h4>
                                <p class="weui-media-box__desc search-results-one-info-location">长沙</p>
                                <p class="weui-media-box__desc">作品:${person.worksCount}
                                    &nbsp;粉丝:${person.followCount}</p>
                                <div class="search-results-one-care have-care div-hide">
                                    <img src="${ctxStatic}/img/cut/have-focus.png"
                                         class="search-results-one-care-img "/>
                                    <p class="search-results-one-care-text-have ">
                                        已关注
                                    </p>
                                </div>
                                <div class="search-results-one-care not-care div-hide div-on">
                                    <img src="${ctxStatic}/img/cut/to-focus.png" class="search-results-one-care-img "/>
                                    <p class="search-results-one-care-text-not ">
                                        加关注
                                    </p>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>

        <c:if test="${fn:length(notFocusList) == 0&&fn:length(haveFocusList) == 0}">
            <div class="no-works">
                <img src="${ctxStatic}/modules/pawn/img/empty.png" alt="">
                <p style="color:#CCCCCC">尚无粉丝</p>
            </div>
        </c:if>
        <c:if test="${fn:length(notFocusList) > 0||fn:length(haveFocusList) > 0}">
            <div class="hr-text ">
                <center>
                    <hr>
                    <span>&nbsp;&nbsp;到底啦&nbsp;&nbsp;</span></center>
            </div>
        </c:if>
    </div>
</div>

<%@include file="include/tab-2.jsp" %>

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
        <div class="weui-dialog__hd"><strong class="weui-dialog__title">成功关注!</strong></div>
        <div class="weui-dialog__ft">
            <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary">确定</a>
        </div>
    </div>
</div>

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

</body>
<script>
    $(function () {
        $('.weui-navbar__item').on('click', function () {
            $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
        });

        $("#detail-title-info").click(function () {
            $("#info").attr("class", "div-on");
            $("#works").attr("class", "div-hide");
            $("#fans").attr("class", "div-hide");
        })

        $("#detail-title-works").click(function () {
            $("#works").attr("class", "div-on");
            $("#info").attr("class", "div-hide");
            $("#fans").attr("class", "div-hide");
        })

        $("#detail-title-fans").click(function () {
            $("#fans").attr("class", "div-on");
            $("#works").attr("class", "div-hide");
            $("#info").attr("class", "div-hide");
        })
    })

    $(function () {
        // 关注与取消关注
        var $haveCareDialog = $('#haveCareDialog');
        var $notCareDialog = $('#notCareDialog');
        $('#dialogs').on('click', '.weui-dialog__btn', function () {
            $(this).parents('.js_dialog').fadeOut(200);
        });

        $('.header-info-care').on('click', function () {
            var thisone = $(this);
            var targetId = thisone.attr('data-id');
            $.ajax({
                type: "POST",
                url: "${ctx}/mobile/notToHave",
                data: {
                    targetId: targetId
                },
                success: function (data) {
                    if (data == '关注成功!') {
                        thisone.val(" 已关注");
                    }
                }
            })
        })

        $('.not-care').on('click', function () {
            var thisone = $(this);
            var targetId = thisone.parent().parent().parent().attr('id');
            $.ajax({
                type: "POST",
                url: "${ctx}/mobile/notToHave",
                data: {
                    targetId: targetId
                },
                success: function (data) {
                    $notCareDialog.find('.weui-dialog__title').html(data);
                    $notCareDialog.fadeIn(200);
                    if (data == '关注成功!') {
                        thisone.removeClass('div-on').siblings('.search-results-one-care').addClass('div-on');
                        var outer = thisone.parent().parent().parent();
                        var notCareOuter = outer.parent();
                        var haveCareOuter = notCareOuter.siblings('#have-care-people');
                        haveCareOuter.append(outer);
                    }
                }
            })
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
                        var notCareOuter = haveCareOuter.siblings('#not-care-people');
                        notCareOuter.append(outer);
                    }
                    $notCareDialog.fadeIn(200);
                }
            })
        })


        $('#fan .weui-media-box__thumb').on('click', function () {
            location.href = '${ctx}/mobile/appUserInfo?appUserId=' + $(this).parent().parent().parent().attr('id');
        })


        $('.works-floor-btn-all,.works-floor-btn').on('click', fun1);
        function fun1() {
            var worksid = $(this).parent().siblings('.worksId').val();
            $.ajax({
                type: "POST",
                url: "${ctx}/mobile/collectWorks",
                data: {
                    worksId: worksid
                },
                success: function (data) {
                    $('#iosDialog2 .weui-dialog__bd').html(data);
                    $('#iosDialog2').fadeIn(200);
                }
            })
        }
    });

</script>

</html>
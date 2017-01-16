<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>我的作品</title>
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

        .works-floor-btn-all {
            border: 1px solid gray;
        }
    </style>


</head>
<body>
<div class="weui-tab">
    <div class="weui-navbar">
        <div class="weui-navbar__item <c:if test="${showwhich=='success'}">weui-bar__item_on</c:if>"
             id="check-title-success">
            审核通过
        </div>
        <div class="weui-navbar__item <c:if test="${showwhich=='now'}">weui-bar__item_on</c:if>" id="check-title-now">
            审核中
        </div>
        <div class="weui-navbar__item <c:if test="${showwhich=='failure'}">weui-bar__item_on</c:if>"
             id="check-title-failure">
            审核失败
        </div>
        <div class="weui-navbar__item <c:if test="${showwhich=='draft'}">weui-bar__item_on</c:if>"
             id="check-title-draft">
            草稿箱
        </div>
    </div>
</div>
<div class="fixed-footer-blank">

</div>


<div id="check-success-works" class="div-hide div-outer <c:if test="${showwhich=='success'}">div-on</c:if>">
    <c:forEach items="${worksSuccessList}" var="works">
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
                <span class="works-floor-btn-all success-do">&nbsp;&nbsp;操作&nbsp;&nbsp;</span>
                <span class="works-floor-img-all">${works.type}</span>
                <span class="works-floor-date-all"><fmt:formatDate value="${works.createDate}"
                                                                   pattern="yyyy-MM-dd"/></span>
            </div>
        </div>
    </c:forEach>
    <c:if test="${fn:length(worksSuccessList) == 0}">
        <div class="no-works">
            <img src="${ctxStatic}/modules/pawn/img/empty.png" alt="">
            <p style="color:#CCCCCC">尚无作品</p>
        </div>
    </c:if>
    <c:if test="${fn:length(worksSuccessList) > 0}">
        <div class="hr-text ">
            <center>
                <hr>
                <span>&nbsp;&nbsp;到底啦&nbsp;&nbsp;</span></center>
        </div>
    </c:if>
</div>

<div id="check-now-works" class="div-hide div-outer <c:if test="${showwhich=='now'}">div-on</c:if>">
    <c:forEach items="${worksNowList}" var="works">
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
                <span class="works-floor-btn-all">&nbsp;审核中&nbsp;</span>
                <span class="works-floor-img-all">${works.breed}</span>
                <span class="works-floor-date-all"><fmt:formatDate value="${works.createDate}"
                                                                   pattern="yyyy-MM-dd"/></span>
            </div>
        </div>
    </c:forEach>
    <c:if test="${fn:length(worksNowList) == 0}">
        <div class="no-works">
            <img src="${ctxStatic}/modules/pawn/img/empty.png" alt="">
            <p style="color:#CCCCCC">尚无作品</p>
        </div>
    </c:if>
    <c:if test="${fn:length(worksNowList) > 0}">
        <div class="hr-text ">
            <center>
                <hr>
                <span>&nbsp;&nbsp;到底啦&nbsp;&nbsp;</span></center>
        </div>
    </c:if>
</div>

<div id="check-failure-works" class="div-hide div-outer <c:if test="${showwhich=='failure'}">div-on</c:if>">
    <c:forEach items="${worksFailureList}" var="works">
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
                <span class="works-floor-btn-all failure-do">&nbsp;&nbsp;操作&nbsp;&nbsp;</span>
                <span class="works-floor-img-all">${works.type}</span>
                <span class="works-floor-date-all"><fmt:formatDate value="${works.createDate}"
                                                                   pattern="yyyy-MM-dd"/></span>
            </div>
        </div>
    </c:forEach>
    <c:if test="${fn:length(worksFailureList) == 0}">
        <div class="no-works">
            <img src="${ctxStatic}/modules/pawn/img/empty.png" alt="">
            <p style="color:#CCCCCC">尚无作品</p>
        </div>
    </c:if>

    <c:if test="${fn:length(worksFailureList) > 0}">
        <div class="hr-text ">
            <center>
                <hr>
                <span>&nbsp;&nbsp;到底啦&nbsp;&nbsp;</span></center>
        </div>
    </c:if>
</div>

<div id="check-draft-works" class="div-hide div-outer <c:if test="${showwhich=='draft'}">div-on</c:if>">
    <c:forEach items="${worksDraftList}" var="works">
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
                <span class="works-floor-btn-all draft-do">&nbsp;&nbsp;操作&nbsp;&nbsp;</span>
                <span class="works-floor-img-all">${works.type}</span>
                <span class="works-floor-date-all"><fmt:formatDate value="${works.createDate}"
                                                                   pattern="yyyy-MM-dd"/></span>
            </div>
        </div>
    </c:forEach>
    <c:if test="${fn:length(worksDraftList) == 0}">
        <div class="no-works">
            <img src="${ctxStatic}/modules/pawn/img/empty.png" alt="">
            <p style="color:#CCCCCC">尚无作品</p>
        </div>
    </c:if>
    <c:if test="${fn:length(worksDraftList) > 0}">
        <div class="hr-text ">
            <center>
                <hr>
                <span>&nbsp;&nbsp;到底啦&nbsp;&nbsp;</span></center>
        </div>
    </c:if>

</div>

<%@include file="include/tab-3.jsp" %>

<div>
    <div class="weui-mask" id="iosMask" style="display: none"></div>
    <div class="weui-actionsheet" id="iosActionsheet" data-id="">
        <div class="weui-actionsheet__menu">
            <input id="nowWorksId" value="value" type="hidden">
            <div class="weui-actionsheet__cell" id="edit">编辑</div>
            <div class="weui-actionsheet__cell" id="transfer">转让</div>
            <div class="weui-actionsheet__cell" id="delete">删除</div>
        </div>
        <div class="weui-actionsheet__action">
            <div class="weui-actionsheet__cell" id="iosActionsheetCancel">取消</div>
        </div>
    </div>
</div>

<div class="js_dialog" id="confirmDelWorks" style="display: none;" date-id="">
    <div class="weui-mask"></div>
    <div class="weui-dialog">
        <div class="weui-dialog__hd"><strong class="weui-dialog__title">确认删除?</strong></div>
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

<script>
    $(function () {
        $("#check-title-success").click(function () {
            $('#check-success-works').addClass('div-on').siblings('.div-hide').removeClass('div-on');
        })
        $("#check-title-now").click(function () {
            $('#check-now-works').addClass('div-on').siblings('.div-hide').removeClass('div-on');
        })
        $("#check-title-failure").click(function () {
            $('#check-failure-works').addClass('div-on').siblings('.div-hide').removeClass('div-on');
        })
        $("#check-title-draft").click(function () {
            $('#check-draft-works').addClass('div-on').siblings('.div-hide').removeClass('div-on');
        })
    })

    $(function () {
        $('.weui-tabbar__item').on('click', function () {
            $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
        });

        $('.weui-navbar__item').on('click', function () {
            $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
        });
    });

    $(function () {
        var $iosActionsheet = $('#iosActionsheet');
        var $iosMask = $('#iosMask');

        function hideActionSheet() {
            $iosActionsheet.removeClass('weui-actionsheet_toggle');
            $iosMask.fadeOut(200);
        }

        $iosMask.on('click', hideActionSheet);
        $('#iosActionsheetCancel').on('click', hideActionSheet);

        //跳往转让页面
        $('#transfer').on('click', function () {
            var worksId = $('#nowWorksId').val();
            location.href = "${ctx}/mobile/transfer?worksId=" + worksId;
        });

        $('#dialogs').on('click', '.weui-dialog__btn', function () {
            $(this).parents('.js_dialog').fadeOut(200);
        });

        //弹出操作菜单
        $(".success-do").on("click", function () {
            $iosActionsheet.addClass('weui-actionsheet_toggle');
            $('#transfer').removeClass('div-hide');
            var thisId = $(this).parent().siblings('.worksId').val();
            $('#nowWorksId').val(thisId);
            $iosMask.fadeIn(200);
//            $(this).parent().parent().addClass('be-marked').siblings();
        });

        $(".failure-do,.draft-do").on("click", function () {
            $iosActionsheet.addClass('weui-actionsheet_toggle');
            $('#transfer').addClass('div-hide');
            var thisId = $(this).parent().siblings('.worksId').val();
            $('#nowWorksId').val(thisId);
            $iosMask.fadeIn(200);
        });

        //跳往编辑页面
        $('#edit').on('click', function () {
            var worksId = $('#nowWorksId').val();
            location.href = "${ctx}/mobile/worksEdit?worksId=" + worksId;
        });

        $('#delete').on('click', function () {
            $iosActionsheet.removeClass('weui-actionsheet_toggle');
            $iosMask.fadeOut(200);
            $('#confirmDelWorks').fadeIn(200);
        })

        $('#confirmDelWorks .weui-dialog__btn_primary').on('click', function () {
            var worksId = $('#nowWorksId').val();
            $.ajax({
                type: "POST",
                url: "${ctx}/mobile/delWorks",
                data: {
                    worksId: worksId
                },
                success: function (data) {
                    $('#notCareDialog').find('.weui-dialog__title').html(data);
                    $('#notCareDialog').fadeIn(200);
                    if (data == '删除成功!') {
                        $('input[value=' + worksId + ']').parent().remove();
                    }
                }
            })
        })

        $('.weui-dialog__btn').on('click', function () {
            $('.js_dialog').fadeOut(200);
        })


    });


</script>
</body>
</html>
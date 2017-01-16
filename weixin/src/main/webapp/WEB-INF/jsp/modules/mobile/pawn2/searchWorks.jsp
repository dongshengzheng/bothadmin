<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>作品搜索结果</title>
    <link rel="stylesheet" href="${ctxStatic}/css/custom.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/weui.min.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/jquery-weui.min.css"/>

    <script src="${ctxStatic}/js/jquery-2.1.4.js"></script>
    <script src="${ctxStatic}/js/jquery-weui.js"></script>
    <script src="${ctxStatic}/js/swiper.js"></script>

    <style>
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

    </style>
</head>
<body>
<div class="weui-search-bar div-outer" id="searchBar">
    <form class="weui-search-bar__form">
        <div class="weui-search-bar__box">
            <i class="weui-icon-search"></i>
            <input type="search" class="weui-search-bar__input" id="searchInput" placeholder="搜索" required/>
            <a href="javascript:" class="weui-icon-clear" id="searchClear"></a>
        </div>
        <label class="weui-search-bar__label" id="searchText">
            <i class="weui-icon-search"></i>
            <span>搜索</span>
        </label>
    </form>
    <a href="javascript:" class="weui-search-bar__cancel-btn" id="searchCancel">取消</a>
</div>

<div class="weui-tab">
    <div class="weui-navbar">
        <div id="defaultTitle" class="weui-navbar__item weui-bar__item_on" id="check-title-success">
            默认排序
        </div>
        <div id="timeTitle" class="weui-navbar__item" id="check-title-now">
            最新上架
        </div>
        <div id="distanceTitle" class="weui-navbar__item" id="check-title-failure">
            离我最近
        </div>
    </div>
</div>
<div class="fixed-footer-blank">

</div>

<div id="defaultList" class="all div-hide div-on">
    <c:forEach items="${defaultList}" var="works">
        <div class="works-all-outer" data-id="${works.id}">
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
    <c:if test="${fn:length(defaultList) == 0}">
        <div class="no-works">
            <img src="${ctxStatic}/modules/pawn/img/empty.png" alt="">
            <p style="color:#CCCCCC">尚无作品</p>
        </div>
    </c:if>
    <c:if test="${fn:length(defaultList) > 0}">
        <div class="hr-text ">
            <center>
                <hr>
                <span>&nbsp;&nbsp;到底啦&nbsp;&nbsp;</span></center>
        </div>
    </c:if>
</div>
<div id="timeList" class="all div-hide">
    <c:forEach items="${timeList}" var="works">
        <div class="works-all-outer" data-id="${works.id}">
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
    <c:if test="${fn:length(timeList) == 0}">
        <div class="no-works">
            <img src="${ctxStatic}/modules/pawn/img/empty.png" alt="">
            <p style="color:#CCCCCC">尚无作品</p>
        </div>
    </c:if>
    <c:if test="${fn:length(timeList) > 0}">
        <div class="hr-text ">
            <center>
                <hr>
                <span>&nbsp;&nbsp;到底啦&nbsp;&nbsp;</span></center>
        </div>
    </c:if>
</div>
<div id="distanceList" class="all div-hide">
    <c:forEach items="${distanceList}" var="works">
        <div class="works-all-outer" data-id="${works.id}">
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
    <c:if test="${fn:length(distanceList) == 0}">
        <div class="no-works">
            <img src="${ctxStatic}/modules/pawn/img/empty.png" alt="">
            <p style="color:#CCCCCC">尚无作品</p>
        </div>
    </c:if>
    <c:if test="${fn:length(distanceList) > 0}">
        <div class="hr-text ">
            <center>
                <hr>
                <span>&nbsp;&nbsp;到底啦&nbsp;&nbsp;</span></center>
        </div>
    </c:if>
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
        var $searchBar = $('#searchBar'),
                $searchResult = $('#searchResult'),
                $searchText = $('#searchText'),
                $searchInput = $('#searchInput'),
                $searchClear = $('#searchClear'),
                $searchCancel = $('#searchCancel');

        function hideSearchResult() {
            $searchResult.hide();
            $searchInput.val('');
        }

        function cancelSearch() {
            hideSearchResult();
            $searchBar.removeClass('weui-search-bar_focusing');
            $searchText.show();
        }

        $searchText.on('click', function () {
            $searchBar.addClass('weui-search-bar_focusing');
            $searchInput.focus();
        });
        $searchInput
                .on('blur', function () {
                    if (!this.value.length) cancelSearch();
                })
                .on('input', function () {
                    if (this.value.length) {
                        $searchResult.show();
                    } else {
                        $searchResult.hide();
                    }
                })
                .on('keyup', function () {
                    if (event.keyCode == 13) {
                        location.href = "${ctx}/mobile/searchWorks?name=" + $('#searchInput').val();
                    }
                });
        $searchClear.on('click', function () {
            hideSearchResult();
            $searchInput.focus();
        });
        $searchCancel.on('click', function () {
            cancelSearch();
            $searchInput.blur();
        });

        $(function () {
            $('.weui-navbar__item').on('click', function () {
                $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
            });

            $('#defaultTitle').on('click', function () {
                $('#defaultList').addClass('div-on').siblings('.all').removeClass('div-on');
            });

            $('#timeTitle').on('click', function () {
                $('#timeList').addClass('div-on').siblings('.all').removeClass('div-on');
            });

            $('#distanceTitle').on('click', function () {
                $('#distanceList').addClass('div-on').siblings('.all').removeClass('div-on');
            });


            $('.weui-dialog__btn').on('click', function () {
                $('#iosDialog2').fadeOut(200);
            })

            $('.works-floor-btn-all').on('click', function () {

                var worksid = $(this).parent().parent().attr('data-id')
                $.ajax({
                    type: "POST",
                    url: "${ctx}/mobile/collectWorks",
                    data: {
                        worksId: worksid
                    },
                    success: function (data) {
                        $('#iosDialog2 .weui-dialog__bd').html(data);
                        $('#iosDialog2').fadeIn(200);
                        var thisone = $(this);
                        thisone.html("&nbsp;&nbsp;已收藏&nbsp;");
                    }
                })
            })

            $('.works-all').on('click', function () {
                var worksid = $(this).parent().attr('data-id')
                location.href = '${ctx}/mobile/worksDetail?worksId=' + worksid;
            })


        });
    });

</script>
</html>
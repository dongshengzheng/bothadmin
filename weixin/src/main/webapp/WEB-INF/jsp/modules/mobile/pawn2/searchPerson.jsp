<%@ taglib prefix="for" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>用户搜索结果</title>
    <link rel="stylesheet" href="${ctxStatic}/css/custom.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/weui.min.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/jquery-weui.min.css"/>

    <script src="${ctxStatic}/js/jquery-2.1.4.js"></script>
    <script src="${ctxStatic}/js/jquery-weui.js"></script>
    <script src="${ctxStatic}/js/swiper.js"></script>
</head>
<style type="text/css">

    .weui-media-box__thumb {
        border-radius: 50%;
    }


</style>

<body>

<div class="weui-search-bar" id="searchBar">
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


<div class="search-results div-outer">
    <div id="have-care-people" class="div-outer">
        <div class="weui-panel__bd" id="test1">
            <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
                <div class="weui-media-box__hd">
                    <img class="weui-media-box__thumb"
                         src="${ctxStatic}/img/headImg/3.jpg"
                         alt="">
                </div>
                <div class="weui-media-box__bd">
                    <h4 class="weui-media-box__title">老特福德永恒</h4>
                    <p class="weui-media-box__desc search-results-one-info-location">长沙</p>
                    <p class="weui-media-box__desc">作品:36 &nbsp;粉丝:6</p>
                    <div class="search-results-one-care not-care div-hide">
                        <img src="${ctxStatic}/img/cut/to-focus.png" class="search-results-one-care-img "/>
                        <p class="search-results-one-care-text-not ">
                            加关注
                        </p>
                    </div>
                    <div class="search-results-one-care have-care div-hide div-on">
                        <img src="${ctxStatic}/img/cut/have-focus.png" class="search-results-one-care-img "/>
                        <p class="search-results-one-care-text-have ">
                            已关注
                        </p>
                    </div>
                </div>
            </a>
        </div>
    </div>

    <div id="not-care-people">
        <c:forEach items="${page.records}" var="person">
            <div class="weui-panel__bd" id="${person.id}">
                <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
                    <div class="weui-media-box__hd">
                        <img class="weui-media-box__thumb"
                             src="${ctxStatic}/img/headImg/4.jpg"
                             alt="">
                    </div>
                    <div class="weui-media-box__bd">
                        <h4 class="weui-media-box__title">${person.name}</h4>
                        <p class="weui-media-box__desc search-results-one-info-location">长沙</p>
                        <p class="weui-media-box__desc">作品:36 &nbsp;粉丝:6</p>
                        <div class="search-results-one-care have-care div-hide">
                            <img src="${ctxStatic}/img/cut/have-focus.png" class="search-results-one-care-img "/>
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


    <div class="hr-text div-outer">
        <center>
            <hr>
            <span>&nbsp;&nbsp;到底啦&nbsp;&nbsp;</span></center>
    </div>
</div>

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
                        location.href = "userInfo.jsp";
                    }
                })
        ;
        $searchClear.on('click', function () {
            hideSearchResult();
            $searchInput.focus();
        });
        $searchCancel.on('click', function () {
            cancelSearch();
            $searchInput.blur();
        });


//        关注与取消关注
        var $haveCareDialog = $('#haveCareDialog');
        var $notCareDialog = $('#notCareDialog');
        $('#dialogs').on('click', '.weui-dialog__btn', function () {
            $(this).parents('.js_dialog').fadeOut(200);
        });

        $('.have-care').on('click', function () {
            $haveCareDialog.fadeIn(200);
            $haveCareDialog.attr('data-id', $(this).parent().parent().parent().attr('id'));
        });

        $('.not-care').on('click', function () {
            $notCareDialog.fadeIn(200);
            $(this).removeClass('div-on').siblings('.search-results-one-care').addClass('div-on');
            var outer = $(this).parent().parent().parent();
            var notCareOuter = outer.parent();
            var haveCareOuter = notCareOuter.siblings('#have-care-people');
            haveCareOuter.append(outer);

        });

        $('.weui-dialog__btn').on('click', function () {
            $('.js_dialog').fadeOut(200);
        })

        $('#haveCareDialog .weui-dialog__btn_primary').on('click', function () {
            var thisOne = $('#' + ($('#haveCareDialog').attr('data-id')) + ' .have-care');
            thisOne.removeClass('div-on').siblings('.search-results-one-care').addClass('div-on');
            $(thisOne).removeClass('div-on').siblings('.search-results-one-care').addClass('div-on');
            var outer = $(thisOne).parent().parent().parent();
            var haveCareOuter = outer.parent();
            var notCareOuter = haveCareOuter.siblings('#not-care-people');
            notCareOuter.append(outer);

        })


        $('.weui-media-box__thumb').on('click', function () {
            location.href = '${ctx}/mobile/userInfo';
        })


    });
</script>


</body>

</html>
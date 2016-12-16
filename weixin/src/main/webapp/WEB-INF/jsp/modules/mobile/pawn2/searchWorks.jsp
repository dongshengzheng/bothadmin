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
        .weui-tabbar__item.weui-bar__item_on .weui-tabbar__label {
            color: #9F504D;
        }

        .weui-navbar {
            width: 96%;
            margin: 1%;
            border: 1px solid #2698DE;
            border-radius: 5px;
        }

        .weui-navbar__item.weui-bar__item_on {
            background-color: #2698DE;
            color: white;
        }

        .weui-navbar__item {
            border: 1px solid #2698DE;
            background-color: white;
            color: #2698DE;
        }

        #sort {
            height: 30px;
            line-height: 30px;
        }

        .sort-li {
            margin-left: 10%;
        }

        .sort-li-selected {
            color: blue;
            margin-left: 10%;
        }

        #sort-btn-outer {
            margin-left: 6%;
            /*height: 25px;*/
            display: inline-block;
            /*border-left: 1px solid gray;*/
            /*vertical-align: middle;*/
        }

        #sort-btn {
            width: 20px;
            height: 20px;
            vertical-align: middle;
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
        <div class="weui-navbar__item weui-bar__item_on" id="check-title-success">
            默认排序
        </div>
        <div class="weui-navbar__item" id="check-title-now">
            最新上架
        </div>
        <div class="weui-navbar__item" id="check-title-failure">
            离我最近
        </div>
    </div>
</div>
<div class="fixed-footer-blank">

</div>


<!--<div id="sort" class="div-outer">-->
<!--<span id="default" class="sort-li-selected">默认排序</span>-->
<!--<span id="new" class="sort-li">最新上架</span>-->
<!--<span id="distance" class="sort-li">离我最近</span>-->
<!--<div id="sort-btn-outer">-->
<!--<img src="img/cut/搜索作品_筛选2.png" id="sort-btn"/>-->
<!--</div>-->
<!--</div>-->

<div class="all div-outer">
    <c:forEach items="${page.records}" var="works">
        <div class="works-all-outer">
            <div class="works-all">
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

    <div class="hr-text ">
        <center>
            <hr>
            <span>&nbsp;&nbsp;到底啦&nbsp;&nbsp;</span></center>
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

        $(function () {
            $('.weui-tabbar__item').on('click', function () {
                $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
            });

            $('.weui-navbar__item').on('click', function () {
                $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
            });
        });
    });

</script>
</html>
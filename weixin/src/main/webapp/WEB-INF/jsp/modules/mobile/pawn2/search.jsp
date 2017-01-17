<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta name="generator"
          content="HTML Tidy for HTML5 (experimental) for Windows https://github.com/w3c/tidy-html5/tree/c63cc39"/>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>搜索</title>
    <link rel="stylesheet" href="${ctxStatic}/css/custom.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/weui.min.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/jquery-weui.min.css"/>

    <script src="${ctxStatic}/js/jquery-2.1.4.js"></script>
    <script src="${ctxStatic}/js/jquery-weui.js"></script>
</head>

<style>
    #first-text {
        padding-left: 5%;
    }

    #searchwhich {
        border-radius: 3px;
        width: 50px;
        background-image: none;
        padding-left: 10px;
    }


    #history-serach-delete {
        width: 5%;
        margin-left: 65%;
    }

    .history-serach-value {
        margin-left: 5%;
        border: none;
        font-size: 15px;
        display: inline-block;
        background-color: white;
        padding-left: 5px;
        padding-right: 5px;
        margin-bottom: 5px;
    }

    .history-search-value-works {
    }

    .history-search-value-person {
        background-image: url(${ctxStatic}/img/cut/search-person.png);
        background-size: 15px 15px;
        background-repeat: no-repeat;
        background-position-y: center;
        background-position-x: 3px;
        padding-left: 19px;
    }
</style>


<body>
<div class="weui-search-bar div-outer" id="searchBar">
    <select id="searchwhich">
        <option value="searchworks">作品</option>
        <option value="searchperson">用户</option>
    </select>
    <form class="weui-search-bar__form">
        <div class="weui-search-bar__box">
            <i class="weui-icon-search"></i>
            <input name="name" type="search" class="weui-search-bar__input" id="searchInput" style="border: 0px ;"
                   placeholder="搜索" required/>
            <a href="javascript:" class="weui-icon-clear" id="searchClear"></a>
        </div>
        <label class="weui-search-bar__label" id="searchText">
            <i class="weui-icon-search"></i>
            <span>搜索</span>
        </label>
    </form>
    <a href="javascript:" class="weui-search-bar__cancel-btn" id="searchCancel">取消</a>
</div>

<div class="history-serach">
    <span id="first-text">历史搜索</span>
    <img src="${ctxStatic}/img/cut/search-delete.png" id="history-serach-delete"/>
    <c:forEach items="${searchPerson}" var="person">
        <span class="history-serach-value history-search-value-person">${person}</span>
    </c:forEach>
    <c:forEach items="${searchWorks}" var="works">
        <span class="history-serach-value history-search-value-works">${works}</span>
    </c:forEach>
</div>

<div class="js_dialog" id="androidDialog2" style="display: none;">
    <div class="weui-mask"></div>
    <div class="weui-dialog weui-skin_android">
        <div class="weui-dialog__bd">
            确认删除历史搜寻记录?
        </div>
        <div class="weui-dialog__ft">
            <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_default" id="delete-no">取消</a>
            <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary" id="delete-yes">确定</a>
        </div>
    </div>
</div>

</body>
<script type="text/javascript">
    $(function () {
        var $searchBar = $('#searchBar'),
                $searchResult = $('#searchResult'),
                $searchText = $('#searchText'),
                $searchInput = $('#searchInput'),
                $searchClear = $('#searchClear'),
                $searchCancel = $('#searchCancel'),
                $androidDialog2 = $('#androidDialog2');

        $("#history-serach-delete").on('click', function () {
            $androidDialog2.fadeIn(200);
        });

        $("#delete-no").on('click', function () {
            $androidDialog2.fadeOut(200);
        });

        $("#delete-yes").on('click', function () {
            $androidDialog2.fadeOut(200);
            $.ajax({
                type: "POST",
                url: "${ctx}/mobile/delSearch",
                success: function (data) {
                }
            })
            $("span.history-serach-value").remove()
        });

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
                        if ($("#searchwhich").val() == "searchperson") {
                            location.href = "${ctx}/mobile/searchPerson?name=" + $('#searchInput').val();
                            <%--location.href = "${ctx}/mobile/searchPerson";--%>
                        } else {
                            location.href = "${ctx}/mobile/searchWorks?name=" + $('#searchInput').val();
                            <%--location.href = "${ctx}/mobile/searchWorks";--%>
                        }
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


        $('.history-search-value-person').on('click', function () {
            $searchBar.addClass('weui-search-bar_focusing');
            $searchInput.focus();
            $searchInput.val($(this).html());
            $('#searchwhich').val('searchperson');
        })

        $('.history-search-value-works').on('click', function () {
            $searchBar.addClass('weui-search-bar_focusing');
            $searchInput.focus();
            $searchInput.val($(this).html());
            $('#searchwhich').val('searchworks');
        })

        $searchText.click();
    });
</script>
</html>
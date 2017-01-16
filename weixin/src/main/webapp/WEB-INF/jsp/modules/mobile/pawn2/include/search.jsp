<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="taglib.jsp" %>

<style>
    .weui_search_bar:after {
        border-bottom: none !important;
    }

    .weui_search_bar {
        background-color: #eeeeee;
    }
</style>
<div class="weui_search_bar" id="search_bar">
    <form class="weui_search_outer" action="#">
        <div class="weui_search_inner">
            <i class="weui_icon_search"></i>
            <input type="search" class="weui_search_input" id="name" onsearch="javascript:search();"
                   placeholder="输入你要查找的物品" value="${param.name}" required/>
            <a href="javascript:" class="weui_icon_clear" id="search_clear"></a>
        </div>
        <label for="name" class="weui_search_text" id="search_text">
            <i class="weui_icon_search"></i>
            <span>${param.name}</span>
        </label>
    </form>
    <a href="javascript:" class="weui_search_cancel" id="search_cancel">取消</a>
</div>

<script type="text/javascript">
    function search() {
        window.location.href = location.protocol + '//' + location.host + location.pathname + "?name=" + $("#name").val();
    }
</script>
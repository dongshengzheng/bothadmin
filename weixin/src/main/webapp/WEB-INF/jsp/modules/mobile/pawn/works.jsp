<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>

<html lang="en">
<head>
    <title>首页</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <link rel="stylesheet" href="${ctxStatic}/jquery-weui/lib/weui.css"/>
    <link rel="stylesheet" href="${ctxStatic}/jquery-weui/css/jquery-weui.css"/>
    <link rel="stylesheet" href="${ctxStatic}/modules/pawn/css/custom.css"/>
</head>
<style>

    .weui_tab_bd{
        overflow-x:inherit;
    }
    .items .item {
        background-color: #FEFFFF;
    }

    .items .item div {
        border-top: 1px solid #eeeeee;
    }

    .items .item .stone {
        width: 100%;
        height: 200px;
    }

    .item {
        position: relative;
    }

    .items .item .status {
        position: absolute;
        top: 0px;
        right: 0px;
    }

    .weui-row .weui-col-50 {
        width: calc((100% - 8px * 1) / 2) !important;
        margin-bottom: 15px;
    }

    .weui_search_inner .weui_icon_search, .weui_search_inner .weui_icon_clear {
        top: 8px;
    }

    .weui_search_inner {
        height: inherit;
    }

    .weui_tab {
        height: calc(100% - 44px) !important;
    }
    .error-img{
        width:auto;
        height: auto;
        margin-top: 32px;
    }
</style>
<body>
<%@ include file="include/search.jsp" %>

<div class="weui_tab">
    <div class="weui_tab_bd">
        <div style="width: 100%;text-align: center">
            <img src="${ctxStatic}/modules/pawn/img/zuopintuijian.png" style="margin:5px;width: 100%;" alt="">
        </div>

        <div class="weui-row items">
            <c:forEach items="${page.list}" var="works">
                <a class="weui-col-50 item" href="${ctx}/pawn/mobile/worksDetail/${works.id}">
                    <div style="text-align: center; height: 200px;background-color: #E0E0E0">
                        <img class="stone" src="${works.lastImage}" onerror="javascript:this.src='${ctxStatic}/modules/pawn/img/default.png';this.className='error-img'"  alt="">
                    </div>
                    <div style="width: 100%;padding: 5px;">
                        <span style="color: #444;font-size: 0.9em;">${works.name}</span><br>
                        <c:if test="${fns:getDictLabel(works.breed, 'dd_pinzhong', '') != ''}"><span style="padding: 3px;background-color: #9E4F4D;color: black;font-size: 0.8em;">${fns:getDictLabel(works.breed, 'dd_pinzhong', '')}</span></c:if> <br>
                        <span style="color: #444;font-size: 0.7em;"><fmt:formatDate value="${works.createDate}" pattern="yyyy-MM-dd"/></span><br>
                    </div>
                </a>
            </c:forEach>
        </div>
        <c:if test="${fn:length(page.list) == 0}">
            <div style="text-align:center;margin-top:35%">
                <img src="${ctxStatic}/modules/pawn/img/empty.png" alt="" style="width: 50%;">
                <p style="color:#CCCCCC">尚无作品</p>
            </div>
        </c:if>
        <c:if test="${!page.lastPage}">
            <div class="weui-infinite-scroll" id="scroll">
                <div class="infinite-preloader"></div>
                正在加载...
            </div>
        </c:if>
        <input type="hidden" value="${page.pageNo}" id="pageNo">
    </div>
    <%@include file="include/tab-1.jsp"%>
</div>

<a class="weui-col-50 item" id="tmp" style="display: none;">
    <img class="stone" src="${ctxStatic}/modules/pawn/img/name.png" onerror="this.src='${ctxStatic}/modules/pawn/img/default.png'" style="" alt="">
    <div style="width: 100%;text-align: center;">
        <span class="name">鸡血石</span>
    </div>
    <img class="status" src="${ctxStatic}/modules/pawn/img/status-3.png" style="" alt="">
</a>
<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js" type="text/javascript"></script>
<script src="${ctxStatic}/jquery-weui/js/jquery-weui.js" type="text/javascript"></script>
</body>
<script type="text/javascript">
    $('.weui_search_outer').on('submit', function(e){
        return false;
    });

    <c:if test="${!page.lastPage}">
    var lastPage = false;
    var loading = false;
    $(".weui_tab_bd").infinite().on("infinite", function () {
        if (loading) return;
        if (lastPage) return;
        loading = true;
        $.ajax({
            type: "GET",
            url: "${ctx}/pawn/mobile/worksPage",
            data: {
                pageNo: Number($("#pageNo").val()) + 1,
                name:'${param.name}'
            },
            success: function (data) {
                loading = false;
                if (data.list.length == 0) {
                    return;
                }
                for (var i = 0; i < data.list.length; i++) {
                    $tmp = $("#tmp").clone();
                    $tmp.css('display', "block");
                    $tmp.find(".name").html(data.list[i].name);
                    $tmp.find(".breed").html(data.list[i].breedStr);
                    if (typeof data.list[i].breedStr == 'undefined' || data.list[i].breedStr == ''){
                        $tmp.find(".breed").css("display","none");
                    }
                    $tmp.find(".createDate").html(data.list[i].createDateStr);
                    $tmp.find(".stone").attr("src", data.lastImage)
                    $(".items").append($tmp);
                }
                if (data.pageNo * data.pageSize >= data.count) {
                    $("#scroll").css("display", "none");
                    lastPage = true;
                } else {

                    $("#pageNo").val(Number($("#pageNo").val()) + 1);
                }
            }
        });
    });
    </c:if>
</script>
</html>

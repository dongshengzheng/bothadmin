<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>

<html lang="en">
<head>
    <title>我的作品</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <link rel="stylesheet" href="${ctxStatic}/jquery-weui/lib/weui.css"/>
    <link rel="stylesheet" href="${ctxStatic}/jquery-weui/css/jquery-weui.css"/>
    <link rel="stylesheet" href="${ctxStatic}/modules/pawn/css/custom.css"/>
</head>
<style>
    .weui_navbar_item:after{
        border:none;
    }
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

    .weui_bar_item_on {
        background: none !important;
        border-bottom: 2px solid #F23236;
    }

    /*//E63020*/
    .weui_tabbar_item.weui_bar_item_on .weui_tabbar_label {
        color: #F23236;
    }
    .weui_navbar_item.weui_bar_item_on{
        color: #F23236;
    }
    .weui_navbar_item{
        padding: 8px 0 !important;
    }
    .error-img{
        width:auto;
        height: auto;
        margin-top: 32px;
    }
</style>
<body>
<div class="weui_tab">
    <div class="weui_navbar">
        <a class="weui_navbar_item" href="${ctx}/pawn/mobile/my/works?status=3">
            审核通过
        </a>

        <a class="weui_navbar_item" href="${ctx}/pawn/mobile/my/works?status=2">
            审核失败
        </a>
        <a class="weui_navbar_item" href="${ctx}/pawn/mobile/my/works?status=1">
            审核中
        </a>
        <a class="weui_navbar_item" href="${ctx}/pawn/mobile/my/works?status=0">
            草稿
        </a>
    </div>
    <div class="weui_tab_bd">
        <div class="weui-row items">
            <c:forEach items="${page.list}" var="works">
                <a class="weui-col-50 item" href="javascript:;" onclick="optionWorks('${works.id}')">
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
</div>

<%@include file="include/tab-3.jsp" %>
</div>

<a class="weui-col-50 item" id="tmp" style="display: none;">
    <div style="text-align: center; height: 200px;background-color: #E0E0E0">
        <img class="stone" src="" onerror="javascript:this.src='${ctxStatic}/modules/pawn/img/default.png';this.className='error-img'"  alt="">
    </div>
    <div style="width: 100%;padding: 5px;">
        <span class="name" style="color: #444;font-size: 0.9em;">${works.name}</span><br>
        <span class="breed" style="padding: 3px;background-color: #9E4F4D;color: black;font-size: 0.8em;"></span> <br>
        <span class="createDate" style="color: #444;font-size: 0.7em;"></span><br>
    </div>
</a>
<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js" type="text/javascript"></script>
<script src="${ctxStatic}/jquery-weui/js/jquery-weui.js" type="text/javascript"></script>
</body>
<script type="text/javascript">
    var status = '${status}';
    var index = 3-Number(status);
    $(".weui_navbar a:eq("+index+")").addClass("weui_bar_item_on");

    function optionWorks(id) {
        $.actions({
            actions: [{
                text: "编辑",
                onClick: function () {
                    window.location.href = "${ctx}/pawn/mobile/worksEdit/"+id;
                }
            }, {
                text: "删除",
                onClick: function () {
                    $.alert("确定要删除此作品吗?", function() {
                        $.ajax({
                            type: "DELETE",
                            url: "${ctx}/pawn/mobile/works",
                            data:{
                                id:id
                            },
                            success: function (data) {
                                if (data.suc){
                                    window.location.href = window.location.href;
                                }else {
                                    $.alert(data.msg);
                                }
                            }
                        });
                    });
                }
            }]
        });
    }


    $('.weui_search_outer').on('submit', function (e) {
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
            url: "${ctx}/pawn/mobile/myWorksPage",
            data: {
                pageNo: Number($("#pageNo").val()) + 1,
                name: '${param.name}',
                status:status
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

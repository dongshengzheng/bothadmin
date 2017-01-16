<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>作品编辑</title>
    <link rel="stylesheet" href="${ctxStatic}/css/custom.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/weui.min.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/jquery-weui.min.css"/>
    <script src="${ctxStatic}/js/jquery-2.1.4.js"></script>
    <script src="${ctxStatic}/js/jquery-weui.js"></script>
    <script src="${ctxStatic}/js/swiper.js"></script>
    <script src="${ctxStatic}/js/upload.js"></script>
    <script src="${ctxStatic}/js/plupload-2.1.2/js/moxie.js"></script>
    <script src="${ctxStatic}/js/plupload-2.1.2/js/plupload.dev.js"></script>
    <style>
        .weui-navbar {
            width: 97%;
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

        body {
            background-color: white;
        }

        .title {
            margin-top: 4%;
            text-align: center;
        }

        .title hr {
            width: 80%;
            border-top: 1px solid red;
            color: red;
        }

        .title span {
            position: relative;
            top: -15px;
            background-color: white;
            color: red;
        }

        .fixed-footer {
            height: 8%;
            z-index: 100;
        }

        .fixed-footer p {
            font-size: 10px;
            padding-left: 30%;
        }

        .fixed-footer a {
            color: #A2D2EF;
        }

        .set-border.weui-cell:before {
            border-top: none;
        }

    </style>
</head>
<body>
<div class="weui-tab">
    <div class="weui-navbar">
        <div id="goto1" class="weui-navbar__item weui-bar__item_on">
            物品信息
        </div>
        <div id="goto2" class="weui-navbar__item">
            作品信息
        </div>
        <div id="goto3" class="weui-navbar__item">
            作品等级
        </div>
        <div id="goto4" class="weui-navbar__item">
            评估报告
        </div>
        <div id="goto5" class="weui-navbar__item">
            收藏信息
        </div>
    </div>
</div>
<div class="fixed-footer-blank">

</div>

<div class="title div-outer">
    <center>
        <hr>
        <span>&nbsp;◇&nbsp;${works.no}&nbsp;◇&nbsp;</span></center>
</div>
<form action="${ctx}/mobile/worksEditComplete" enctype="multipart/form-data" method="post">
    <input name="works.id" type="hidden" value="${works.id}">
    <input name="provider.id" type="hidden" value="${provider.id}">
    <input name="provider.worksId" type="hidden" value="${works.id}">
    <input name="worksLevelId" type="hidden" value="${worksLevel.id}">
    <input name="report.id" type="hidden" value="${report.id}">
    <input name="report.worksId" type="hidden" value="${works.id}">
    <input name="collecter.id" type="hidden" value="${collecter.id}">
    <input name="collecter.worksId" type="hidden" value="${works.id}">
    <div class="weui_tab_bd">
        <div id="tab1" class="weui_tab_bd_item weui_tab_bd_item_active ">
            <%@include file="worksEdit1.jsp" %>
        </div>
        <div id="tab2" class="weui_tab_bd_item div-hide">
            <%@include file="worksEdit2.jsp" %>
        </div>
        <div id="tab3" class="weui_tab_bd_item div-hide">
            <c:if test="${works.breed==1}">
                <%@include file="worksLevel1Edit.jsp" %>
            </c:if>
            <c:if test="${works.breed==2}">
                <%@include file="worksLevel2Edit.jsp" %>
            </c:if>
            <c:if test="${works.breed==3}">
                <%@include file="worksLevel3Edit.jsp" %>
            </c:if>
            <c:if test="${works.breed==4||works.breed==5}">
                <%@include file="worksLevel4Edit.jsp" %>
            </c:if>
        </div>
        <div id="tab4" class="weui_tab_bd_item div-hide">
            <%@include file="worksEdit4.jsp" %>
        </div>
        <div id="tab5" class="weui_tab_bd_item div-hide">
            <%@include file="worksEdit5.jsp" %>
        </div>
    </div>

    <div class="fixed-footer">
        <div class="weui-form-preview__ft">
            <a class="weui-form-preview__btn weui-form-preview__btn_default"
               href="${ctx}/mobile/my">放弃修改</a>
            <button id="submit" type="submit" class="weui-form-preview__btn weui-form-preview__btn_primary"
                    href="javascript:">
                提交审核
            </button>
        </div>
    </div>
    <div class="fixed-footer-blank">
    </div>
</form>

<div id="worksLevel1Hide" class="div-hide">
    <%@include file="worksLevel1.jsp" %>
</div>
<div id="worksLevel2Hide" class="div-hide">
    <%@include file="worksLevel2.jsp" %>
</div>
<div id="worksLevel3Hide" class="div-hide">
    <%@include file="worksLevel3.jsp" %>
</div>
<div id="worksLevel4Hide" class="div-hide">
    <%@include file="worksLevel4.jsp" %>
</div>

<input id="bucket" type="hidden" value="${bucket}">
<input id="redirectUrl" type="hidden" value="${redirectUrl}">
<script>
    $(function () {

        $('.weui-navbar__item').on('click', function () {
            $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
            var tab = $(this).attr('id').charAt(4);
            $('#tab' + tab).addClass('weui_tab_bd_item_active').siblings('.weui_tab_bd_item_active').removeClass('weui_tab_bd_item_active');
        });

        $('#tab4').on('click', function () {
            initUploaders2($('#bucket').val(), $('#redirectUrl').val() + "/");
            initUploaders3($('#bucket').val(), $('#redirectUrl').val() + "/", "valueImages");
        })

        $('.weui-navbar__item').on('click', function () {
            $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
        });

        $(".showDatePicker").on('click', function () {
            $('input').blur();
            $('textarea').blur();
            $(this).calendar();
        })

        $('#goto3').on('click', function () {
            $('.worksShowName').val($('#worksName').val());
        })

        $('#worksName').on('change', function () {
            $('.worksShowName').val($(this).val());
        })

        $('#breed').on('change', function () {
            var value = $(this).val();
            var $tab3 = $('#tab3');
            if (value == 1) {
                var html = $('#worksLevel1Hide #load-worksLevel1').html();
                $tab3.html(html);
            } else if (value == 2) {
                var html = $('#worksLevel2Hide #load-worksLevel2').html();
                $tab3.html(html);
            } else if (value == 3) {
                var html = $('#worksLevel3Hide #load-worksLevel3').html();
                $tab3.html(html);
            } else if (value == 4 || value == 5) {
                var html = $('#worksLevel4Hide #load-worksLevel4').html();
                $tab3.html(html);
            }
        })

    });
</script>
</body>
</html>
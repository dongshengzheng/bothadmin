<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>作品等级</title>
    <link rel="stylesheet" href="${ctxStatic}/css/custom.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/weui.min.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/jquery-weui.min.css"/>
    <script src="${ctxStatic}/js/jquery-2.1.4.js"></script>
    <script src="${ctxStatic}/js/jquery-weui.js"></script>
    <script src="${ctxStatic}/js/swiper.js"></script>
    <style>
        body {
            background-color: white;
        }

        .title {
            margin-top: 10%;
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

        .fixed-footer p {
            font-size: 10px;
            padding-left: 30%;
        }

        .fixed-footer a {
            color: #A2D2EF;
        }

    </style>
</head>
<body>
<div class="title">
    <center>
        <hr>
        <span>&nbsp;◇&nbsp;JS-A20161205001A&nbsp;◇&nbsp;</span></center>
</div>
<div>
    <form action="${ctx}/mobile/worksRegister4" method="post">
        <div class="weui-cells weui-cells_form">
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">作品名称</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input name="name" class="weui-input" type="tel" value="${sessionScope.registerWorksName}"
                           disabled>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">质地一</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <select name="zhidi">
                        <option value="" selected>请选择质地一</option>
                        <c:forEach items="${zhidi1}" var="item">
                            <option value="${item.value}">${item.label}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">质地二</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <select name="zhidi2">
                        <option value="" selected>请选择质地二</option>
                        <c:forEach items="${zhidi2}" var="item">
                            <option value="${item.value}">${item.label}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">感观</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <select name="ganguan">
                        <option value="" selected>请选择感观</option>
                        <c:forEach items="${ganguan}" var="item">
                            <option value="${item.value}">${item.label}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">磨氏度</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <select name="moshidu">
                        <option value="" selected>请选择磨氏度</option>
                        <c:forEach items="${moshidu}" var="item">
                            <option value="${item.value}">${item.label}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">血量</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <select name="xueliang">
                        <option value="" selected>请选择血量</option>
                        <c:forEach items="${xueliang}" var="item">
                            <option value="${item.value}">${item.label}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">血色</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <select name="xuese">
                        <option value="" selected>请选择血色</option>
                        <c:forEach items="${xuese}" var="item">
                            <option value="${item.value}">${item.label}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">血形</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <select name="xuexing">
                        <option value="" selected>请选择血形</option>
                        <c:forEach items="${xuexing}" var="item">
                            <option value="${item.value}">${item.label}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">浓艳度</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <select name="nongyandu">
                        <option value="" selected>请选择浓艳度</option>
                        <c:forEach items="${nongyandu}" var="item">
                            <option value="${item.value}">${item.label}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">纯净度</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <select name="chunjingdu">
                        <option value="" selected>请选择纯净度</option>
                        <c:forEach items="${chunjingdu}" var="item">
                            <option value="${item.value}">${item.label}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">地色</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <select name="dise">
                        <option value="" selected>请选择地色</option>
                        <c:forEach items="${dise}" var="item">
                            <option value="${item.value}">${item.label}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">活筋</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <select name="liu">
                        <option value="" selected>请选择活筋</option>
                        <c:forEach items="${liu}" var="item">
                            <option value="${item.value}">${item.label}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">裂</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <select name="lie">
                        <option value="" selected>请选择裂</option>
                        <c:forEach items="${lie}" var="item">
                            <option value="${item.value}">${item.label}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">印章</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <select name="hanxuemian">
                        <option value="" selected>请选择印章</option>
                        <c:forEach items="${mian}" var="item">
                            <option value="${item.value}">${item.label}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">含血方式</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <select name="hanxuefangshi">
                        <option value="" selected>请选择含血方式</option>
                        <c:forEach items="${hanxuefangshi}" var="item">
                            <option value="${item.value}">${item.label}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>

        <div class="fixed-footer">
            <div class="weui-form-preview__ft">
                <input id="draftYN" name="draftYN" type="hidden" value="NO">
                <br/>
                <button type="submit" class="weui-form-preview__btn weui-form-preview__btn_primary" id="draftSubmit">
                    存为草稿
                </button>
                <button onclick="window.history.back(-1);" type="button"
                        class="weui-form-preview__btn weui-form-preview__btn_primary" id="trueSubmit">
                    上一步
                </button>
                <button type="submit" class="weui-form-preview__btn weui-form-preview__btn_primary">
                    下一步
                </button>
            </div>
        </div>
        <div class="fixed-footer-blank">
        </div>
    </form>
</div>


<script>
    $(function () {

        $('#draftSubmit').on('click', function () {
            $('#draftYN').val('yes');
        })

    })
</script>
</body>
</html>
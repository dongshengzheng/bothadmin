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
    <form action="${ctx}/mobile/worksRegister4">
        <div class="weui-cells weui-cells_form">
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">作品名称</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input class="weui-input" type="tel" placeholder="田黄鸡血石精品吊坠">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">质地一</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input id="works-zhidiyi" class="weui-input " type="tel" placeholder="请选择质地一">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">质地二</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input id="works-zhidier" class="weui-input " type="tel" placeholder="请选择质地二">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">感观</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input id="works-ganguan" class="weui-input " type="tel" placeholder="请选择感观">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">磨氏度</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input id="works-moshidu" class="weui-input " type="tel" placeholder="请选择磨氏度">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">血量</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input id="works-xueliang" class="weui-input " type="tel" placeholder="请选择血量">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">血色</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input id="works-xuese" class="weui-input " type="tel" placeholder="请选择血色">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">血形</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input id="works-xuexing" class="weui-input " type="tel" placeholder="请选择血形">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">浓艳度</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input id="works-nongyandu" class="weui-input " type="tel" placeholder="请选择浓艳度">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">纯净度</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input id="works-chunjingdu" class="weui-input " type="tel" placeholder="请选择纯净度">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">地色</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input id="works-dise" class="weui-input " type="tel" placeholder="请选择地色">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">活筋</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input id="works-huojin" class="weui-input " type="tel" placeholder="请选择活筋">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">裂</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input id="works-lie" class="weui-input " type="tel" placeholder="请选择裂">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">印章</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input id="works-yinzhang" class="weui-input " type="tel" placeholder="请选择印章">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">含血方式</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input id="works-hanxuefangshi" class="weui-input " type="tel" placeholder="请选择含血方式">
                </div>
            </div>
        </div>

        <div class="fixed-footer">
            <!--<p>下一步即表示同意<a href="#">《金石典当登记申请记录》</a></p>-->
            <hr>
            <div class="weui-form-preview__ft">
                <a class="weui-form-preview__btn weui-form-preview__btn_default" href="javascript:">存为草稿</a>
                <button type="submit" class="weui-form-preview__btn weui-form-preview__btn_primary" href="javascript:">
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
        $('#works-zhidiyi').picker({
            title: "请选择质地一",
            cols: [
                {
                    textAlign: 'center',
                    values: ['质地一(1)', '质地一(2)']
                }
            ]
        });
        $('#works-zhidier').picker({
            title: "请选择质地二",
            cols: [
                {
                    textAlign: 'center',
                    values: ['质地二(1)', '质地二(2)']
                }
            ]
        });

        $('#works-ganguan').picker({
            title: "请选择感观",
            cols: [
                {
                    textAlign: 'center',
                    values: ['感观一', '感观二']
                }
            ]
        });

        $('#works-moshidu').picker({
            title: "请选择磨氏度",
            cols: [
                {
                    textAlign: 'center',
                    values: ['磨氏度一', '磨氏度二']
                }
            ]
        });

        $('#works-xueliang').picker({
            title: "请选择血量",
            cols: [
                {
                    textAlign: 'center',
                    values: ['血量一', '血量二']
                }
            ]
        });

        $('#works-xuese').picker({
            title: "请选择血色",
            cols: [
                {
                    textAlign: 'center',
                    values: ['血色一', '血色二']
                }
            ]
        });

        $('#works-xuexing').picker({
            title: "请选择血形",
            cols: [
                {
                    textAlign: 'center',
                    values: ['血形一', '血形二']
                }
            ]
        });

        $('#works-nongyandu').picker({
            title: "请选择浓艳度",
            cols: [
                {
                    textAlign: 'center',
                    values: ['浓艳度一', '浓艳度二']
                }
            ]
        });

        $('#works-chunjingdu').picker({
            title: "请选择纯净度",
            cols: [
                {
                    textAlign: 'center',
                    values: ['纯净度一', '纯净度二']
                }
            ]
        });

        $('#works-dise').picker({
            title: "请选择地色",
            cols: [
                {
                    textAlign: 'center',
                    values: ['地色一', '地色二']
                }
            ]
        });

        $('#works-huojin').picker({
            title: "请选择活筋",
            cols: [
                {
                    textAlign: 'center',
                    values: ['活筋一', '活筋二']
                }
            ]
        });

        $('#works-lie').picker({
            title: "请选择裂",
            cols: [
                {
                    textAlign: 'center',
                    values: ['裂一', '裂二']
                }
            ]
        });

        $('#works-yinzhang').picker({
            title: "请选择印章",
            cols: [
                {
                    textAlign: 'center',
                    values: ['印章一', '印章二']
                }
            ]
        });

        $('#works-hanxuefangshi').picker({
            title: "请选择含血方式",
            cols: [
                {
                    textAlign: 'center',
                    values: ['含血方式一', '含血方式二']
                }
            ]
        });

    })
</script>
</body>
</html>
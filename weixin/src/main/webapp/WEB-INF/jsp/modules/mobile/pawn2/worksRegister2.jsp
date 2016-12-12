<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>作品信息</title>
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
    <form action="${ctx}/mobile/worksRegister3">
        <div class="weui-cells weui-cells_form">
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">作品名称</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input class="weui-input" type="tel" placeholder="田黄鸡血石精品吊坠">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">品种</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input id="works-pinzhong" class="weui-input " type="tel" placeholder="请选择品种">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">作品类型</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input id="works-zuopinleixing" class="weui-input " type="tel" placeholder="请选择作品类型">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">尺寸</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input class="weui-input" type="tel" placeholder="长">
                </div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input class="weui-input" type="tel" value="cm" disabled>
                </div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input class="weui-input" type="tel" placeholder="宽">
                </div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input class="weui-input" type="tel" value="cm" disabled>
                </div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input class="weui-input" type="tel" placeholder="高">
                </div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input class="weui-input" type="tel" value="cm" disabled>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">重量</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input class="weui-input" type="tel" placeholder="请输入重量">
                </div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input class="weui-input" type="tel" value="g" disabled>
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">工艺制作</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input id="works-gongyizhizuo" class="weui-input  " type="tel" placeholder="请选择工艺制作">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">篆刻级别</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input id="works-zhuankejibie" class="weui-input  " type="tel" placeholder="请选择篆刻级别">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">矿区地域</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input id="works-kuangqudiyu" class="weui-input  " type="tel" placeholder="请选择矿区地域">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">制作人</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input id="works-zhizuoren" class="weui-input" type="tel" placeholder="请输入制作人">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">制作时间</label></div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input id="works-zhizuoshijian" class="weui-input" type="tel" placeholder="请选择制作时间">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-cell__bd weui-cell_primary">
                    <textarea id="works-zuopinquanshi" class="weui-textarea" placeholder="作品诠释..." rows="3"></textarea>
                    <!--<div class="weui-textarea-counter">-->
                    <!--<span>0</span>/200-->
                    <!--</div>-->
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


</body>

<script>
    $(function () {
        $('#works-pinzhong').picker({
            title: "请选择品种",
            cols: [
                {
                    textAlign: 'center',
                    values: ['品种一', '品种二']
                }
            ]
        });

        $('#works-pinzhong').picker({
            title: "请选择品种",
            cols: [
                {
                    textAlign: 'center',
                    values: ['品种一', '品种二']
                }
            ]
        });

        $('#works-pinzhong').picker({
            title: "请选择品种",
            cols: [
                {
                    textAlign: 'center',
                    values: ['品种一', '品种二']
                }
            ]
        });

        $('#works-pinzhong').picker({
            title: "请选择品种",
            cols: [
                {
                    textAlign: 'center',
                    values: ['品种一', '品种二']
                }
            ]
        });

        $('#works-zuopinleixing').picker({
            title: "请选择作品类型",
            cols: [
                {
                    textAlign: 'center',
                    values: ['作品类型一', '作品类型二']
                }
            ]
        });

        $('#works-gongyizhizuo').picker({
            title: "请选择工艺制作",
            cols: [
                {
                    textAlign: 'center',
                    values: ['工艺制作一', '工艺制作二']
                }
            ]
        });

        $('#works-zhuankejibie').picker({
            title: "请选择篆刻级别",
            cols: [
                {
                    textAlign: 'center',
                    values: ['篆刻级别一', '篆刻级别二']
                }
            ]
        });

        $('#works-kuangqudiyu').picker({
            title: "请选择矿区地域",
            cols: [
                {
                    textAlign: 'center',
                    values: ['矿区地域一', '矿区地域二']
                }
            ]
        });

        $('#works-zhizuoshijian').datetimePicker();
    })
</script>

</html>
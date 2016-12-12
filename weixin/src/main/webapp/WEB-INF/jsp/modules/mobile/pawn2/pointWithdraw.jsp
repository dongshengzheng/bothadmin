<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>积分提现</title>
    <link rel="stylesheet" href="${ctxStatic}/css/custom.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/weui.min.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/jquery-weui.min.css"/>

    <script src="${ctxStatic}/js/jquery-2.1.4.js"></script>
    <script src="${ctxStatic}/js/jquery-weui.js"></script>
    <script src="${ctxStatic}/js/swiper.js"></script>
    <style>
        #header {
            height: 60px;
            text-align: center;
            padding-top: 30px;
        }

        #header-p1 {
            font-size: 10px;
            color: gray;
        }

        #header-p2 {
            line-height: 15px;
            font-size: 30px;
            color: #F76301;
        }

        #cost-point {
            color: #F76301;
            text-align: right;
            margin-right: 10px;
        }

        .weui-media-box__thumb {
            height: 100px;
        }

        #go-to-withdraw {
            width: 80%;
        }

        .search-results-one-info-location {
            background-image: url(img/cut/积分中心_积分icon.png);
            color: #F76301;
        }

    </style>
</head>
<body>
<div id="header" class="div-outer">
    <p id="header-p1">可用积分</p>
    <p id="header-p2">3600</p>
</div>
<div class="weui-panel weui-panel_access">
    <div class="weui-panel__bd">
        <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
            <div class="weui-media-box__hd">
                <img class="weui-media-box__thumb"
                     src="${ctxStatic}/img/cut/积分中心_10元现金券.png"
                     alt="">
            </div>
            <div class="weui-media-box__bd">
                <h4 class="weui-media-box__title">10元现金券</h4>
                <p class="weui-media-box__desc search-results-one-info-location">10</p>
                <p class="weui-media-box__desc">库存: &nbsp;5件</p>
                <div class="search-results-one-care ">
                    <div class="search-results-one-care-text-have ">
                        <input class="min changeblue" name="" type="button" value=" - "/>
                        <input class="text-box" type="text" value="1" style="width:25px;"/>
                        <input class="add changeblue" name="" type="button" value=" + "/>
                    </div>
                </div>
            </div>
        </a>
    </div>
    <div class="weui-panel__bd">
        <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
            <div class="weui-media-box__hd">
                <img class="weui-media-box__thumb"
                     src="${ctxStatic}/img/cut/积分中心_100元现金券.png"
                     alt="">
            </div>
            <div class="weui-media-box__bd">
                <h4 class="weui-media-box__title">100元现金券</h4>
                <p class="weui-media-box__desc search-results-one-info-location">100</p>
                <p class="weui-media-box__desc">库存: &nbsp;5件</p>
                <div class="search-results-one-care ">
                    <div class="search-results-one-care-text-have ">
                        <input class="min changeblue" name="" type="button" value=" - "/>
                        <input class="text-box" type="text" value="1" style="width:25px;"/>
                        <input class="add changeblue" name="" type="button" value=" + "/>
                    </div>
                </div>
            </div>
        </a>
    </div>

    <p id="cost-point">需要 0 积分</p>
    <br>
    <br>
    <a href="javascript:;" class="weui-btn weui-btn_primary" id="go-to-withdraw">提现</a>
    <br>
</div>


<div class="js_dialog" id="androidDialog2" style="display: none;">
    <div class="weui-mask"></div>
    <div class="weui-dialog weui-skin_android">
        <div class="weui-dialog__bd">
            提现成功!提现的金额将以红包方式发送给你,请留意《每日文化》公众号号的红包消息!
        </div>
        <div class="weui-dialog__ft">
            <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary" id="confirm">我知道了</a>
        </div>
    </div>
</div>

<script>
    $(function () {
        var $androidDialog2 = $('#androidDialog2');
        $('#go-to-withdraw').on('click', function () {
            $androidDialog2.fadeIn(200);
        });
        $('#confirm').on('click', function () {
            location.href = "pointCenter.jsp";
        });

        $(".add").click(function () {
// $(this).prev() 就是当前元素的前一个元素，即 text_box
            $(this).prev().val(parseInt($(this).prev().val()) + 1);
        });

        $(".min").click(function () {
// $(this).next() 就是当前元素的下一个元素，即 text_box
            $(this).next().val(parseInt($(this).next().val()) - 1);
        });

        $(".changeblue").on('click', function () {
            $(this).attr('style', 'color:red');
        })

        $(".changeblue").on('blur', function () {
            $(this).attr('style', 'color:black');
        })


    });


</script>
</body>
</html>
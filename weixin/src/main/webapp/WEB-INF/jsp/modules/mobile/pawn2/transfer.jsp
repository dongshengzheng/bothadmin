<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>转让作品</title>
    <link rel="stylesheet" href="css/custom.css"/>
    <link rel="stylesheet" href="css/weui.min.css"/>
    <link rel="stylesheet" href="css/jquery-weui.min.css"/>
    <link rel="stylesheet" href="jquery-ui-1.12.1/jquery-ui.min.css">
    <script src="js/jquery-2.1.4.js"></script>
    <script src="js/jquery-weui.js"></script>
    <script src="jquery-ui-1.12.1/jquery-ui.min.js"></script>
    <script src="js/swiper.js"></script>
    <style>
        .fixed-footer {
            height: 10%;
        }
    </style>
</head>
<body>


<div class="div-outer">
    <form action="worksRegister2.html" enctype="multipart/form-data">
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">目标用户</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input id="tags" class="weui-input" type="tel" placeholder="请输入目标用户名称或微信号">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">与用户关系</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input id="relation" class="weui-input" type="tel" placeholder="请选择与用户的关系">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">转让方式</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input id="transferType" class="weui-input" type="tel" placeholder="请选择转让方式">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">售卖价格</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input class="weui-input" id="showDatePicker" type="tel" placeholder="请输入价格">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__bd weui-cell_primary">
                <textarea class="weui-textarea" placeholder="转让原因" rows="10"></textarea>
                <!--<div class="weui-textarea-counter">-->
                <!--<span>0</span>/200-->
                <!--</div>-->
            </div>
        </div>


        <div class="fixed-footer">
            <hr>
            <div class="weui-form-preview__ft">
                <a class="weui-form-preview__btn weui-form-preview__btn_default" href="javascript:">取消</a>
                <button type="submit" class="weui-form-preview__btn weui-form-preview__btn_primary" href="javascript:">
                    确认转让
                </button>
            </div>
        </div>
        <div class="fixed-footer-blank">
        </div>
    </form>
</div>

<div class="weui-media-box__bd">
    <h4 class="weui-media-box__title">老特福德永恒</h4>
    <p class="weui-media-box__desc search-results-one-info-location">长沙</p>
    <p class="weui-media-box__desc">作品:36 &nbsp;粉丝:6</p>
    <div class="search-results-one-care not-care div-hide div-on">
        <img src="img/cut/to-focus.png" class="search-results-one-care-img "/>
        <p class="search-results-one-care-text-not ">
            加关注
        </p>
    </div>
    <div class="search-results-one-care have-care div-hide">
        <img src="img/cut/have-focus.png" class="search-results-one-care-img "/>
        <p class="search-results-one-care-text-have ">
            已关注
        </p>
    </div>
</div>
<div class="weui-media-box__bd">
    <h4 class="weui-media-box__title">老特福德永恒222</h4>
    <p class="weui-media-box__desc search-results-one-info-location">长沙</p>
    <p class="weui-media-box__desc">作品:36 &nbsp;粉丝:6</p>
    <div class="search-results-one-care not-care div-hide div-on">
        <img src="img/cut/to-focus.png" class="search-results-one-care-img "/>
        <p class="search-results-one-care-text-not ">
            加关注
        </p>
    </div>
    <div class="search-results-one-care have-care div-hide">
        <img src="img/cut/have-focus.png" class="search-results-one-care-img "/>
        <p class="search-results-one-care-text-have ">
            已关注
        </p>
    </div>
</div>
</body>
<script>
    $(function () {
        $('#transferType').picker({
            title: "请选择转让方式",
            cols: [
                {
                    textAlign: 'center',
                    values: ['售卖', '赠送']
                }
            ]
        })
        $('#relation').picker({
            title: "请选择与转让用户的关系",
            cols: [
                {
                    textAlign: 'center',
                    values: ['亲人', '爱人', '朋友', '亲戚']
                }
            ]
        })

        $(function () {
            var availableTags = [
                $('.weui-media-box__bd')
            ];
            $("#tags").autocomplete({
                source: availableTags
            });
        });

    })

</script>
</html>
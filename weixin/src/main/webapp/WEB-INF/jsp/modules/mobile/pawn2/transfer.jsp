<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta name="generator"
          content="HTML Tidy for HTML5 (experimental) for Windows https://github.com/w3c/tidy-html5/tree/c63cc39"/>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>转让作品</title>
    <link rel="stylesheet" href="${ctxStatic}/css/custom.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/weui.min.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/jquery-weui.min.css"/>

    <script src="${ctxStatic}/js/jquery-2.1.4.js"></script>
    <script src="${ctxStatic}/js/jquery-weui.js"></script>
    <style>
        .fixed-footer {
            height: 10%;
        }

        .elements {
            z-index: 100;
            position: fixed;
            height: 70%;
            width: 100%;
            top: 20%;
            opacity: 1;
            background-color: #F0EFF5;
            overflow: scroll;
        }

        #tags {
            background-image: url("");
            background-repeat: no-repeat;
            background-size: 25px 25px;
            background-position-y: center;
            padding-left: 30px;
        }


    </style>
</head>
<body>


<div class="div-outer">
    <form action="${ctx}/mobile/transferComplete" method="post">
        <input type="hidden" value="${worksId}" name="worksId"/>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">作品名称</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input name="worksName" class="weui-input" type="tel" value="${works.name}"
                       disabled>
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">目标用户</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input name="toUserId" id="tags" class="weui-input" type="tel" value=""
                       placeholder="请输入目标用户名称或微信号">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">与用户关系</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input name="relation" id="relation" class="weui-input" type="tel" placeholder="请选择与用户的关系">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">转让方式</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input name="transferTypeString" id="transferType" class="weui-input" type="tel" placeholder="请选择转让方式">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">售卖价格</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input id="score" name="score" class="weui-input" type="tel" placeholder="请输入价格">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__bd weui-cell_primary">
                <textarea name="reason" class="weui-textarea" placeholder="转让原因" rows="10"></textarea>
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

<div class="elements div-hide">
    无更多匹配用户
</div>

<div id="tmp" class="weui-panel__bd div-hide" data-id="1111111">
    <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg">
        <div class="weui-media-box__hd">
            <img class="weui-media-box__thumb"
                 src="${ctxStatic}/img/headImg/3.jpg"
                 alt="">
        </div>
        <div class="weui-media-box__bd">
            <h4 class="weui-media-box__title userName">老特福德永恒1</h4>
            <p class="weui-media-box__desc "><span>微信号:</span><span class="userId"></span></p>
        </div>
    </a>
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

        $('#tags').on('keyup', function () {
            $('.elements').html("");
            var str = $(this).val();
            if (str != null && str.trim().length > 0) {
                $.ajax({
                    type: "GET",
                    url: "${ctx}/mobile/selectTransferPerson",
                    data: {
                        info: $(this).val()
                    },
                    success: function (data) {
                        if (data.length == 0) {
                            return;
                        }
                        for (var i = 0; i < data.length; i++) {
                            $tmp = $("#tmp").clone();
                            $tmp.attr('data-id', data[i].id);
                            $tmp.find(".userName").html(data[i].name);
                            $tmp.find(".userId").html(data[i].id);
                            $tmp.removeClass('div-hide');

                            $('.weui-panel__bd').on('click', function () {
                                $('#tags').css('background-image', 'url("' + $(this).find('.weui-media-box__thumb').attr('src') + '")');
                                $('#tags').val($(this).attr('data-id'));
                                $('.elements').addClass('div-hide')
                            })

                            $('.elements').append($tmp);
                        }
                        $('.elements').append("<center>暂无更多匹配用户</center>");
                        $('.elements').removeClass('div-hide');
                    }
                })
                ;
            }
        })

        $('#transferType').on('change', function () {
            if ($(this).val() == '赠送') {
                $('#score').attr('disabled', true);
                $('#score').val(0);
                $('#score').css('color', 'lightgray');
            }
            if ($(this).val() == '售卖') {
                $('#score').attr('disabled', false);
                $('#score').val(0);
                $('#score').css('color', 'black');
            }
        })
    })
</script>
</html>
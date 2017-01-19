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
    <script src="${ctxStatic}/js/jquery.validate.min.js"></script>
    <style>
        .title {
            height: 40px;
            text-align: center;
            background-color: white;
        }

        .title hr {
            top: 25px;
            position: relative;
            width: 80%;
            border-top: 1px solid red;
            color: red;
        }

        .title span {
            top: 10px;
            position: relative;
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
<div class="title div-outer">
    <center>
        <hr>
        <span>&nbsp;◇&nbsp;JS-A20161205001A&nbsp;◇&nbsp;</span></center>
</div>
<div class="div-outer">
    <form action="${ctx}/mobile/worksRegister3" method="post" id="works_info">
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">作品名称</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input name="name" class="weui-input" type="tel" value="${sessionScope.registerWorksName}"
                       disabled>
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">品种</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <select name="breed">
                    <option value="" selected>请选择品种</option>
                    <c:forEach items="${pinzhong}" var="item">
                        <option value="${item.value}">${item.label}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">作品类型</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <select name="type">
                    <option value="" selected>请选择作品类型</option>
                    <c:forEach items="${zuopinleixing}" var="item">
                        <option value="${item.value}">${item.label}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">尺寸</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input name="length" class="weui-input" type="tel" placeholder="长">
            </div>
            <div class="weui-cell__bd weui-cell_primary">
                <input class="weui-input" type="tel" value="cm" disabled>
            </div>
            <div class="weui-cell__bd weui-cell_primary">
                <input name="width" class="weui-input" type="tel" placeholder="宽">
            </div>
            <div class="weui-cell__bd weui-cell_primary">
                <input class="weui-input" type="tel" value="cm" disabled>
            </div>
            <div class="weui-cell__bd weui-cell_primary">
                <input name="height" class="weui-input" type="tel" placeholder="高">
            </div>
            <div class="weui-cell__bd weui-cell_primary">
                <input class="weui-input" type="tel" value="cm" disabled>
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">重量</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input name="weight" class="weui-input" type="tel" placeholder="请输入重量">
            </div>
            <div class="weui-cell__bd weui-cell_primary">
                <input class="weui-input" type="tel" value="g" disabled>
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">工艺制作</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <select name="gyType">
                    <option value="" selected>请选择工艺制作</option>
                    <c:forEach items="${gyType}" var="item">
                        <option value="${item.value}">${item.label}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">篆刻级别</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <select name="levelZk">
                    <option value="" selected>请选择篆刻级别</option>
                    <c:forEach items="${level}" var="item">
                        <option value="${item.value}">${item.label}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">矿区地域</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <select name="kqdy">
                    <option value="" selected>请选择矿区地域</option>
                    <c:forEach items="${kqdy}" var="item">
                        <option value="${item.value}">${item.label}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">制作人</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input name="maker" id="works-zhizuoren" class="weui-input" placeholder="请输入制作人">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">制作时间</label></div>
            <div class="weui-cell__bd weui-cell_primary">
                <input name="makeTimeString" id="works-zhizuoshijian" class="weui-input showDatePicker"
                       placeholder="请选择制作时间">
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__bd weui-cell_primary">
                    <textarea name="worksMeanning" id="works-zuopinquanshi" class="weui-textarea" placeholder="作品诠释..."
                              rows="3"></textarea>
                <!--<div class="weui-textarea-counter">-->
                <!--<span>0</span>/200-->
                <!--</div>-->
            </div>
        </div>

        <div class="fixed-footer">
            <div class="weui-form-preview__ft">
                <br>
                <input id="draftYN" name="draftYN" type="hidden" value="NO">
                <button type="submit" style="color: #333" class="weui-form-preview__btn weui-form-preview__btn_primary"
                        id="draftSubmit">
                    存为草稿
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


</body>

<script>
    $(function () {
        $(".showDatePicker").on('click', function () {
            $('input').blur();
            $('textarea').blur();
            $(this).calendar();
        })

        $('#draftSubmit').on('click', function () {
            $('#draftYN').val('yes');
        })

        $.validator.addMethod("isSelected",
            function(value, element, param) {
                if(value == param){
                    return false;
                }
                return true;
            })

        var $form = $("#works_info");
        $form.validate({
            rules: {
                breed: {
                    isSelected: ""
                },
                type: {
                    isSelected: ""
                },
                length: {
                    required: true,
                    number: true
                },
                width: {
                    required: true,
                    number: true
                },
                height: {
                    required: true,
                    number: true
                },
                weight: {
                    required: true,
                    number: true
                },
                gytType: {
                    isSelected: ""
                },
                levelZk: {
                    isSelected: ""
                },
                kqdy: {
                    isSelected: ""
                },
                worksMeanning: "required"
            },
            messages: {
                breed: {isSelected: "品种必选"},
                type: {isSelected: "作品类型必选"},
                length: {
                    required: "长必填",
                    number: "长是数字类型"
                },
                width: {
                    required: "宽必填",
                    number: "宽是数字类型"
                },
                height: {
                    required: "高必填",
                    number: "高是数字类型"
                },
                weight: {
                    required: "重量必填",
                    number: "重量是数字类型"
                },
                gyType: {isSelected: "作品描述必选"},
                levelZk: {isSelected: "工艺制作必选"},
                kqdy: {isSelected: "矿区地域必选"},
                worksMeanning: {required: "作品诠释必填"}
            }
        })
    })
</script>

</html>
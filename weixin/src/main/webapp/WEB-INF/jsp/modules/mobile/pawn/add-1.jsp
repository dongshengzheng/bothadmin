<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>

<html lang="en">
<head>
    <title>登记者信息</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <link rel="stylesheet" href="${ctxStatic}/jquery-weui/lib/weui.css"/>
    <link rel="stylesheet" href="${ctxStatic}/jquery-weui/css/jquery-weui.css"/>
    <link rel="stylesheet" href="${ctxStatic}/modules/pawn/css/custom.css"/>
    <link rel="stylesheet" href="${ctxStatic}/swiper/css/swiper.css"/>
</head>
<style>

    .swiper-container {
        height: 200px;
    }

    .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;
        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
    }

    .swiper-container {
        width: 100%;
    }

    .swiper-container img {
        display: block;
        width: 100%;
    }

    .weui_navbar_item {
        padding: 8px 0;
    }

    .item-detail {
        height: calc(100% - 200px) !important;
    }

    .weui_navbar + .weui_tab_bd {
        padding-top: 40px;
    }

    .weui_navbar_item {
        border: none;
    }

    .weui_navbar_item:after {
        content: none;
    }

    .weui_navbar_item.weui_bar_item_on {
        background-color: inherit !important;
        color: #C31E1F;
        border-bottom: 2px solid #C31E1F;
    }

    .weui_cell:before {
        left: 0px;
    }
</style>
<body>
<div class="weui_tab">
    <div class="weui_tab_bd">
        <div style="background-color: #FEFFFF;width: 100%;text-align: center; padding: 5px 0;">
            <img src="${ctxStatic}/modules/pawn/img/s-1.png" alt="" style="width: 83%;">
            <div class="weui-row weui-no-gutter" style="font-size: 12px;color: #5C5D5F;">
                <div class="weui-col-20" style="color: #C91D1B">物品登记</div>
                <div class="weui-col-20">作品登记</div>
                <div class="weui-col-20">作品等级</div>
                <div class="weui-col-20">评估报告</div>
                <div class="weui-col-20">物品收藏</div>
            </div>
        </div>
        <div class="weui_cells_title">基本信息</div>
        <div class="weui_cells weui_cells_form">
            <div class="weui_cell">
                <div class="weui_cell_hd"><label class="weui_label">提供作品名称</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" id="customer" name="customer" type="text" value="${user.name}"
                           placeholder="请输入提供作品名称(选填)">
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd"><label class="weui_label">姓名</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" id="name" name="name" type="text" value="${user.name}"
                           placeholder="请输入提供作品名称">
                </div>
            </div>

            <div class="weui_cell">
                <div class="weui_cell_hd"><label class="weui_label">身份证</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" id="no" name="no" type="number" value="${user.identify}"
                           placeholder="请输入身份证">
                </div>
            </div>

            <div class="weui_cell">
                <div class="weui_cell_hd"><label class="weui_label">地址</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" id="address" name="address" type="text" value="${user.address}"
                           placeholder="请输入地址">
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd"><label class="weui_label">联系方式</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" id="phone" name="phone" type="tel" value="${user.phone}"
                           placeholder="请输入联系方式">
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd"><label class="weui_label">登记时间</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" data-toggle='date' id="datetime" name="datetime" type="text"
                           value="<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd"/>"
                           placeholder="请输入登记时间">
                </div>
            </div>
        </div>
        <div class="weui_cells_title">备注</div>
        <div class="weui_cells weui_cells_form" style="margin-bottom: 15px;">
            <div class="weui_cell">
                <div class="weui_cell_bd weui_cell_primary">
                    <textarea class="weui_textarea" rows="3" id="remark" name="remark"
                              placeholder="请输入备注信息">${user.remarks}</textarea>
                </div>
            </div>
        </div>

        <div class="weui_cell weui_cell_warn" style="padding: 0px;">
            <div class="weui_cell">
                <div class="weui_cell_bd weui_cell_primary">
                    <div class="weui_uploader">
                        <div class="weui_uploader_hd weui_cell">
                            <div class="weui_cell_bd weui_cell_primary">图片上传</div>
                        </div>
                        <div class="weui_uploader_bd">
                            <ul class="weui_uploader_files">
                                <!-- 预览图插入到这 --> </ul>
                            <div class="weui_uploader_input_wrp">
                                <a class="weui_uploader_input js_file" href="javascript:;"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" name="images" id="images">
        <div style="padding:10px 10%;">
            <a href="javascript:;" class="weui_btn weui_btn_warn" onclick="provider()">下一步</a>
        </div>
    </div>

    <%@include file="include/tab-2.jsp" %>
</div>
<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js" type="text/javascript"></script>
<script src="${ctxStatic}/jquery-weui/js/jquery-weui.js" type="text/javascript"></script>
<script type='text/javascript' src='${ctxStatic}/swiper/js/swiper.js' charset='utf-8'></script>
<script src="https://cdn.bootcss.com/zepto/1.1.6/zepto.min.js"></script>
</body>
<script type="text/javascript">
    $("#datetime").calendar();
    $.weui = {};
    $.weui.alert = function (options) {
        options = $.extend({title: '警告', text: '警告内容'}, options);
        var $alert = $('.weui_dialog_alert');
        $alert.find('.weui_dialog_title').text(options.title);
        $alert.find('.weui_dialog_bd').text(options.text);
        $alert.on('touchend click', '.weui_btn_dialog', function () {
            $alert.hide();
        });
        $alert.show();
    };

    $.ajax({
        url: "http://" + location.host + "/ticket",
        success: function () {
            $.get("http://" + location.host + "/sign",
                    {
                        url: location.href.split('#')[0]
                    },
                    function (sign) {
                        wx.config({
                            debug: false,
                            appId: sign.appid,
                            timestamp: sign.timestamp,
                            nonceStr: sign.noncestr,
                            signature: sign.signature,
                            jsApiList: [
                                'scanQRCode',
                                'onMenuShareTimeline',
                                'onMenuShareAppMessage',
                                'onMenuShareQQ',
                                'onMenuShareWeibo',
                                'chooseImage',
                                'previewImage',
                                'uploadImage',
                                'downloadImage'
                            ]
                        });
                    },
                    'json'
            );
        }
    });

    $(".js_file").on("click", function () {
        wx.chooseImage({
            success: function (res) {
                var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
                if (localIds == null || localIds == "") {
                    alert("请选择图片！");
                    return null;
                }
                for(var i = 0;i<localIds.length;i++){
                    var $preview = $('<li class="weui_uploader_file weui_uploader_status" onclick="removeImg(this)" style="background-image:url(' + localIds[i] + ')"></li>');
                    $('.weui_uploader_files').append($preview);
                }
                syncUpload(localIds);

            }
        })
    });
    var syncUpload = function(localIds){
        var localId = localIds.pop();
        wx.uploadImage({
            localId: localId,
            isShowProgressTips: 1,
            success: function (res) {
                var serverId = res.serverId; // 返回图片的服务器端ID
                $("#images").val($("#images").val() + serverId + ",");
                //其他对serverId做处理的代码
                if(localIds.length > 0){
                    syncUpload(localIds);
                }
            }
        });
    };


    function removeImg(node) {
        if (confirm("确定删除图片？")) {
            node.remove();
        }
    }

    function provider() {
        if ($("#name").val().length == "") {
            $.alert("姓名不能为空");
            return false;
        }
//        if ($("#address").val().length == "") {
//            $.alert("地址不能为空");
//            return false;
//        }
//
//        if ($("#phone").val().length == "") {
//            $.alert("联系方式不能为空");
//            return false;
//        }
//        if ($("#no").val().length == "") {
//            $.alert("身份证不能为空");
//            return false;
//        }

        var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
        if ($("#no").val().length != '' && reg.test($("#no").val()) === false) {
            layer.alert("身份证输入不合法");
            return false;
        }

//        if ($("#datetime").val().length == "") {
//            $.alert("登记时间不能为空");
//            return false;
//        }
        $.ajax({
            type: "POST",
            url: "${ctx}/pawn/mobile/add",
            data: {
                type: 1,
                customer: $("#customer").val(),
                name: $("#name").val(),
                address: $("#address").val(),
                phone: $("#phone").val(),
                no: $("#no").val(),
                remark: $("#remark").val(),
                datetime: $("#datetime").val(),
                images: $("#images").val()
            },
            success: function (data) {
                if (data.suc) {
                    window.location.href = "${ctx}/pawn/mobile/add/" + data.id + "/2";
                } else {
                    $.alert(data.msg);
                }
            }
        });
    }
</script>
</html>

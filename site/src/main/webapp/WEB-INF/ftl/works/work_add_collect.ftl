<#include "../layout/main.ftl"/>

<@htmlHead title="作品登记_收藏者信息">
<link rel="stylesheet" href="${staticPath}/assets/css/pages/profile.css">
<link rel="stylesheet" href="${staticPath}/assets/css/pages/shortcode_timeline2.css">
<link rel="stylesheet" href="${staticPath}/assets/css/datepicker.css">
<link rel="stylesheet" href="${staticPath}/static/css/plugins.css">
<link rel="stylesheet" href="${staticPath}/static/css/shop.style.css">
<style>
    .form-wizard .steps > li.active > a.step .desc {
        color: #18ba9b;
    }

    .form-wizard .steps > li > a.step {
        color: gray;
    }
</style>
</@htmlHead>
<@htmlBody>
<div class="breadcrumbs">
    <div class="container">
        <h1 class="pull-left">作品登记</h1>
        <ul class="pull-right breadcrumb">
            <li><a href="/">首页</a></li>
            <li class="active">收藏者信息</li>
        </ul>
    </div>
</div>

<div class="wrapper">
    <!--物品信息-->
    <div class="container margin-bottom-40">

        <div class="form-wizard">
            <ul class="nav nav-pills nav-justified steps">
                <li class="active">
                    <a href="javascript:;" class="step" id="providerDetails">
                        <span class="number">1</span>
                        <span class="desc">
                            <i class="fa fa-check"></i>物品信息
                        </span>
                    </a>
                </li>
                <li class="active">
                    <a href="javascript:;" class="step" id="infoDetails">
                        <span class="number">2</span>
                        <span class="desc">
                            <i class="fa fa-check"></i>作品信息
                        </span>
                    </a>
                </li>
                <li class="active">
                    <a href="javascript:;" class="step active levelDetails" id="levelDetails">
                        <span class="number">3</span>
                        <span class="desc">
                            <i class="fa fa-check"></i>作品等级
                        </span>
                    </a>
                </li>
                <li class="active">
                    <a href="javascript:;" class="step" id="reportDetails">
                        <span class="number">4</span>
                        <span class="desc">
                            <i class="fa fa-check"></i>评估报告
                        </span>
                    </a>
                </li>
                <li class="active">
                    <a href="javascript:;" class="step">
                        <span class="number">5</span>
                        <span class="desc">
                            <i class="fa fa-check"></i>收藏者信息
                        </span>
                    </a>
                </li>
            </ul>
            <div id="bar" class="progress progress-u progress-lg rounded" role="progressbar">
                <div class="progress-bar progress-bar-light-green" style="width: 100%;"></div>
            </div>
        </div>
        <div class="row shopping-cart">
            <div class="col-sm-offset-2 col-sm-8">
                <h2 class="title-type">收藏者信息</h2>
                <div class="billing-info-inputs checkbox-list">
                    <form id="works_info" action="${staticPath}/works/add/collect" method="post"
                          class="form-horizontal">
                        <input type="hidden" name="worksId" id="worksId" value="${(works.id)!}">
                        <input type="hidden" id="status" name="status"/>
                        <input type="hidden" id="type" name="type" value="2"/>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="name">作品名称</label>
                            <div class=" col-sm-10">
                                <input class="form-control" type="text" value="${(works.name)!}" disabled="disabled"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="provideBy">收藏者</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="name" id="name" type="text"
                                       placeholder="收藏者"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="cardNo">身份证</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="no" id="no" type="text"
                                       placeholder="请输入身份证"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="address">联系地址</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="address" id="address" type="text"
                                       placeholder="请输入联系地址"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="contact">手机号码</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="phone" id="phone" type="text"
                                       placeholder="请输入手机号码"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="datetime">收藏时间</label>
                            <div class="col-sm-10">
                                <input class="form-control date-picker" name="datetime" id="datetime"
                                       type="text"
                                       placeholder="请选择收藏时间" readonly/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" >是否公开</label>
                            <div class="col-sm-10">
                                <label class="checkbox text-left col-sm-2" style="padding-top:0px;">
                                    <input type="radio" checked name="pub"/>
                                    <i></i>公&nbsp;&nbsp;&nbsp;&nbsp;开&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </label>
                                <label class="checkbox text-left col-sm-2" style="padding-top:0px;">
                                    <input type="radio" name="pub"/>
                                    <i></i>不公开
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2" for=""></label>
                            <div class="col-sm-10">
                                <button data-type="1" type="submit" class="btn btn-u btn-u-red info_btn">提交审核</button>
                                <button data-type="4 type="submit" class="btn btn-u btn-u-default info_btn"
                                        style="margin-left: 20px">存为草稿
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</@htmlBody>
<@footerJS>
<script src="${staticPath}/assets/js/upload/upload.js"></script>
<script src="${staticPath}/assets/js/plugins/plupload-2.1.2/js/moxie.js"></script>
<script src="${staticPath}/assets/js/plugins/plupload-2.1.2/js/plupload.dev.js"></script>
<script src="${staticPath}/assets/js/plugins/date-time/bootstrap-datepicker.js"></script>
</@footerJS>
<script>

    $("#headerWorks").addClass("active");
    $(document).ready(function () {

        removeId();
        function removeId() {
            if(${works.type}=="5"||${works.type}=="6"){
                $("#levelDetails").removeClass("levelDetails");
            }
        }

        $('.date-picker').datepicker({autoclose: true, todayHighlight: true, format: 'yyyy-mm-dd'});
        initUploaders("upload_works_info", "windyeel", '${staticPath}/');
        var $form = $("#works_info");

        $.validator.addMethod(
                "isSelected", //验证方法名称
                function(value, element, param) {//验证规则
                    if(value == param){
                        return false;
                    }
                    return true;
                },
                ''//验证提示信息
        );

        $form.validate({
//            errorPlacement: function (error, element) {
//                element.next().prev().html(error.html());
//            },
            rules: {
                name: "required",
                no: "required",
                address: "required",
                phone:{
                    required:true,
                    checkPhone:"^1(3[0-9]|4[57]|5[0-35-9]|7[01678]|8[0-9])\\d{8}$"
                },
                datetime: "required",
                pub: {
                    isSelected:""
                }
            },
            messages: {
                name: {required: "收藏者必填"},
                no: {required: "身份证必填"},
                address: {required: "联系地址必填"},
                phone: {
                    required: "手机号码必填",
                    checkPhone:"请填写正确的手机号码"
                },
                datetime: {required: "收藏时间必填"},
                pub: {required: "是否公开必选"}
            },
            submitHandler: function (form) {
                $(form).ajaxSubmit({
                    success: function (data) {
                        if (data.suc) {
                            if ($("#status").val() == 1) {
                                // 跳转到下一步
                                window.location.href = "/user/works";
                            } else {
                                // 跳转到个人中心-> 我的作品->草稿里面
                                window.location.href = "/user/works/"+$("#status").val();
                            }
                        } else {
                            alert(data.msg);
                        }

                    },
                    error: function () {
                        alert("error");
                        return;
                    }
                });
            }
        });

        //存为草稿info_btn
        $(".info_btn").bind("click", function () {
            $("#status").val($(this).attr("data-type"));
        });

        $("#providerDetails").on("click", function () {
            window.location.href = "/works/providerDetails/${works.id}";
        })

        $("#infoDetails").on("click", function () {
            window.location.href = "/works/infoDetails/${works.id}";
        })

        $(".levelDetails").on("click", function () {
            window.location.href = "/works/levelDetails/${works.id}";
        })

        $("#reportDetails").on("click", function () {
            window.location.href = "/works/reportDetails/${works.id}";
        })
    });
</script>

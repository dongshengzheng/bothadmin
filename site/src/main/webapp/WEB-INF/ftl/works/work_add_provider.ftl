<#include "../layout/main.ftl"/>

<@htmlHead title="作品登记_物品信息">
<link rel="stylesheet" href="${staticPath}/assets/css/jsdd/work/work_detail.css">
<link rel="stylesheet" href="${staticPath}/assets/css/pages/profile.css">
<link rel="stylesheet" href="${staticPath}/assets/css/pages/shortcode_timeline2.css">
<link rel="stylesheet" href="${staticPath}/assets/css/datepicker.css">
<link rel="stylesheet" href="${staticPath}/assets/js/chosen/chosen.min.css">
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
            <li class="active">作品登记</li>
        </ul>
    </div>
</div>

<div class="wrapper">
    <!--物品信息-->
    <div class="container margin-bottom-40">

        <div class="form-wizard">
            <ul class="nav nav-pills nav-justified steps">
                <li class="active">
                    <a href="#tab1" class="step">
                        <span class="number">1</span>
                        <span class="desc">
                                <i class="fa fa-check"></i>物品信息
                            </span>
                    </a>
                </li>
                <li>
                    <a href="javascript:;" class="step">
                        <span class="number">2</span>
                        <span class="desc">
                                <i class="fa fa-check"></i>作品信息
                            </span>
                    </a>
                </li>
                <li>
                    <a href="javascript:;" class="step active">
                        <span class="number">3</span>
                        <span class="desc">
                                <i class="fa fa-check"></i>作品等级
                            </span>
                    </a>
                </li>
                <li>
                    <a href="javascript:;" class="step">
                        <span class="number">4</span>
                        <span class="desc">
                                <i class="fa fa-check"></i>评估报告
                            </span>
                    </a>
                </li>
                <li>
                    <a href="javascript:;" class="step">
                        <span class="number">5</span>
                        <span class="desc">
                                <i class="fa fa-check"></i>收藏者信息
                            </span>
                    </a>
                </li>
            </ul>
            <div id="bar" class="progress progress-u progress-lg rounded" role="progressbar">
                <div class="progress-bar progress-bar-light-green" style="width: 20%;"></div>
            </div>
        </div>
        <div class="row shopping-cart">
            <div class="col-sm-offset-2 col-sm-8">
                <h2 class="title-type">物品信息</h2>
                <div class="billing-info-inputs checkbox-list">
                    <form id="works_info" action="${staticPath}/works/add/provider" method="post"
                          class="form-horizontal">
                        <input type="hidden" id="type" name="consumerType" value="1"/>
                        <input type="hidden" name="id" value="<#if (provider.id)??>${provider.id}</#if>"/>
                        <input type="hidden" name="worksId" value="<#if (works.id)??>${works.id}</#if>"/>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="name">作品名称</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="name" id="name" type="text"
                                       value="<#if (works.name)??>${works.name}</#if>"
                                       placeholder="请输入作品名称"/>
                                <span style="color: #cc0000" class="col-sm-10"></span>
                            </div>

                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="provideBy">提供者</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="provider" id="provider" type="text"
                                       value="<#if (provider.name)??>${provider.name}<#elseif (current.name)??>${current.name}</#if>"
                                       placeholder="请输入提供者"/>
                                <span style="color: #cc0000" class="col-sm-10"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="cardNo">身份证</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="no" id="no" type="text"
                                       value="<#if (provider.no)??>${provider.no}
                                                    <#elseif (current.identification)??>${current.identification}</#if>"
                                       placeholder="请输入身份证"/>
                                <span style="color: #cc0000" class="col-sm-10"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="address">联系地址</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="address" id="address" type="text"
                                       value="<#if (provider.address)??>${provider.address}
                                                    <#elseif (current.address)??>${current.address}</#if>"
                                       placeholder="请输入联系地址"/>
                                <span style="color: #cc0000" class="col-sm-10"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="contact">手机号码</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="phone" id="phone" type="text"
                                       value="<#if (provider.phone)??>${provider.phone}
                                                    <#elseif (current.phone)??>${current.phone}</#if>"
                                       placeholder="请输入手机号码"/>
                                <span style="color: #cc0000" class="col-sm-10"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="datetime">登记时间</label>
                            <div class="col-sm-10">
                                <input class="form-control date-picker" name="datetime" id="datetime"
                                       value="<#if (provider.datetime)??>${(provider.datetime?string("yyyy-MM-dd"))!""} </#if>"
                                       type="text"
                                       placeholder="请选择登记时间" readonly/>
                                <span style="color: #cc0000" class="col-sm-10"></span>
                            </div>

                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="description">作品描述</label>
                            <div class="col-sm-10">
                                    <textarea class="form-control" style="resize: none;height: 150px"
                                              name="worksRemarks"
                                              id="worksRemarks" type="text"
                                              placeholder="请输入作品描述"><#if (works.remarks)??>${works.remarks}</#if></textarea>
                                <span style="color: #cc0000" class="col-sm-10"></span>
                                <input type="hidden" id="status" name="status"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2" for=""></label>
                            <div class="col-sm-10">
                                <div id="upload_works_info" class=""
                                     style="border: dotted 1px #bbb;height: 100px;width: 100px;overflow: hidden">
                                    <img src="${staticPath}/static/img/upload.png" style="width: 100%;" alt=""/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2" for=""></label>
                            <div class="col-sm-10">
                                <button data-type="0" type="submit" class="btn btn-u btn-u-red info_btn">下一步</button>
                                <button data-type="10" type="submit" class="btn btn-u btn-u-default info_btn"
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
        $('.date-picker').datepicker({autoclose: true, todayHighlight: true, format: 'yyyy-mm-dd'});
        initUploaders("upload_works_info", "windyeel", '${staticPath}/');
        var $form = $("#works_info");

        $.validator.addMethod("checkPhone",
                function (value,element,params) {
                    var retu = value.match(params);
                    if(retu){
                        return true;
                    }
                    return false;
                });
        $.validator.addMethod("checkNo",
                function (value,element,params) {
                    var retu = value.match(params);
                    if(retu){
                        return true;
                    }
                    return false;
                })
        
        $form.validate({
//            errorPlacement: function (error, element) {
//                error.appendTo( element.next() );
//            },
            rules: {
                name: "required",
                provider: "required",
                no:{
                    required:true,
//                    checkNo:"(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)"
                },
                address:"required",
                phone:{
                    required:true,
                    checkPhone:"^1(3[0-9]|4[57]|5[0-35-9]|7[01678]|8[0-9])\\d{8}$"
                },
                datetime:"required",
                worksRemarks:"required"
            },
            messages: {
                name: {required: "作品名称必填"},
                provider: {required: "提供者必填"},
                no: {
                    required: "身份证必填",
//                    checkNo:"请填写正确格式的身份证号码"
                },
                address: {required: "联系地址必填"},
                phone: {
                    required: "手机号码必填",
                    checkPhone:"请填写正确的手机号码"
                },
                datetime: {required: "登记时间必填"},
                worksRemarks: {required: "作品描述必填"}
            },
            debug:true,
            submitHandler: function (form) {
                $(form).ajaxSubmit({
                    success: function (data) {
                        if (data.suc) {
                            if ($("#status").val() == 0) {
                                // 跳转到下一步
                                window.location.href = "/works/add/" + data.id + "/info";
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


    });
</script>

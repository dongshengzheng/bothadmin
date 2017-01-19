<#include "../layout/main.ftl"/>

<@htmlHead title="作品详情">
<link rel="stylesheet" href="${staticPath}/assets/css/datepicker.css">
<link rel="stylesheet" href="${staticPath}/static/css/plugins.css">
<link rel="stylesheet" href="${staticPath}/assets/plugins/bootstrap-select/css/bootstrap-select.css">
<link rel="stylesheet" href="${staticPath}/static/css/shop.style.css">
<style>
    .form-wizard .steps > li.active > a.step .desc {
        color: #18ba9b;
    }

    .form-wizard .steps > li > a.step {
        color: gray;
    }
    .form-group .col-sm-10{
        width:60%;
    }

</style>
</@htmlHead>
<@htmlBody>
<div class="breadcrumbs">
    <div class="container">
        <h1 class="pull-left">作品登记</h1>
        <ul class="pull-right breadcrumb">
            <li><a href="/">首页</a></li>
            <li class="active">作品信息</li>
        </ul>
    </div>
</div>

<div class="wrapper">

    <!--作品信息-->
    <div class="container margin-bottom-40">

        <div class="form-wizard ">
            <ul class="nav nav-pills nav-justified steps">
                <li class="active">
                    <a href="javascript:;" class="step" id="providerDetails">
                        <span class="number">1</span>
                        <span class="desc"><i class="fa fa-check"></i>物品信息</span>
                    </a>
                </li>
                <li class="active">
                    <a href="javascript:;" class="step">
                        <span class="number">2</span>
                        <span class="desc"><i class="fa fa-check"></i>作品信息</span>
                    </a>
                </li>
                <li>
                    <a href="javascript:;" class="step active">
                        <span class="number">3</span>
                        <span class="desc"><i class="fa fa-check"></i>作品等级</span>
                    </a>
                </li>
                <li>
                    <a href="javascript:;" class="step">
                        <span class="number">4</span>
                        <span class="desc"><i class="fa fa-check"></i>评估报告</span>
                    </a>
                </li>
                <li>
                    <a href="javascript:;" class="step">
                        <span class="number">5</span>
                        <span class="desc"> <i class="fa fa-check"></i>收藏者信息</span>
                    </a>
                </li>
            </ul>
            <div id="bar" class="progress progress-u progress-lg rounded" role="progressbar">
                <div class="progress-bar progress-bar-light-green" style="width: 40%;"></div>
            </div>
        </div>

        <div class="row shopping-cart">
            <div class="col-sm-offset-2 col-sm-8">
                <h2 class="title-type">作品信息</h2>
                <div class="billing-info-inputs checkbox-list">
                    <form id="works_info" action="${staticPath}/works/add/info" method="post" class="form-horizontal">
                        <input type="hidden" name="id" id="id" value="${works.id}">
                        <input type="hidden" id="status" name="status"/>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="name">作品名称</label>
                            <div class="col-sm-10">
                                <input class="form-control" type="text" value="${works.name}" disabled="disabled"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="breed">品种</label>
                            <div class="col-sm-10"  data-test="div">
                                <select id="breed" name="breed" class="form-control selectpicker" data-test="select">
                                    <option value=""  data-test="option">请选择</option>
                                    <#list pinzhong as pz>
                                        <#if ((works.breed)??)&&("${pz.value}"==(works.breed))>
                                            <option value="${pz.value}" selected="selected">${pz.label}</option>
                                        <#else >
                                            <option value="${pz.value}">${pz.label}</option>
                                        </#if>
                                    </#list>
                                </select>
                            </div>
                            <span style="color: red;" class="error"  data-test="span"></span>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="name">作品类型</label>
                            <div class="col-sm-10">
                                <select id="type" class="form-control selectpicker" name="worksType">
                                    <option value="">请选择</option>
                                    <#list zuopinleixing as zplx>
                                        <#if ((works.type)??)&& ("${zplx.value}"==(works.type))>
                                            <option value="${zplx.value}" selected="selected">${zplx.label}</option>
                                        <#else>
                                            <option value="${zplx.value}">${zplx.label}</option>
                                        </#if>
                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="">尺寸(cm)</label>
                            <div class="col-sm-10">
                                <div class="row">
                                    <div class="col-sm-4"><input class="form-control" id="length" name="length" value="<#if (works.length)??>${works.length}</#if>"
                                                                 type="text"
                                                                 placeholder="长"/></div>
                                    <div class="col-sm-4"><input class="form-control" name="width" id="width" value="<#if (works.width)??>${works.width}</#if>"
                                                                 type="text"
                                                                 placeholder="宽"/></div>
                                    <div class="col-sm-4"><input class="form-control" name="height" id="height" value="<#if (works.height)??>${works.height}</#if>"
                                                                 type="text"
                                                                 placeholder="高"/></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="weight">重量(g)</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="weight" id="weight" type="text" value="<#if (works.weight)??>${works.weight}</#if>"
                                       placeholder="请输入重量"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="gyType">工艺制作</label>
                            <div class="col-sm-10">
                                <select class="form-control selectpicker"
                                        id="gyType" name="gyType">
                                    <option value="">请选择</option>
                                    <#list gyType as gy>
                                        <#if ((works.gyType)??)&&("${gy.value}"=(works.gyType))>
                                            <option value="${gy.value}" selected="selected">${gy.label}</option>
                                        <#else>
                                            <option value="${gy.value}">${gy.label}</option>
                                        </#if>
                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="levelZk">篆刻级别</label>
                            <div class="col-sm-10">
                                <select class="form-control selectpicker"
                                        id="levelZk" name="levelZk">
                                    <option value="">请选择</option>
                                    <#list level as lvl>
                                        <#if ((works.levelZk)??)&&("${lvl.value}"=(works.levelZk))>
                                            <option value="${lvl.value}" selected="selected">${lvl.label}</option>
                                        <#else>
                                            <option value="${lvl.value}">${lvl.label}</option>
                                        </#if>
                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="kqdy">矿区地域</label>
                            <div class="col-sm-10">
                                <select class="form-control selectpicker" id="kqdy"
                                        name="kqdy">
                                    <option value="">请选择</option>
                                    <#list kqdy as kq>
                                        <#if (works.kqdy)??&&("${kq.value}"=(works.kqdy))>
                                            <option value="${kq.value}" selected="selected">${kq.label}</option>
                                        <#else>
                                            <option value="${kq.value}">${kq.label}</option>
                                        </#if>
                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="maker">制作人</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="maker" id="maker" value="<#if (works.maker)??>${works.maker}</#if>"
                                       placeholder="请输入制作人">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="makeTime">制作时间</label>
                            <div class="col-sm-10">
                                <input readonly type="text" class="form-control date-picker" id="makeTime"
                                       name="makeTime" value="<#if (works.makeTime)??>${(works.makeTime?string("yyyy-MM-dd"))!""}</#if>"
                                       placeholder="请输入制作时间">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="worksMeaning">作品诠释</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" style="resize: none;height: 150px"
                                          name="worksMeaning"
                                          id="worksMeaning" type="text" placeholder="请输入作品诠释"><#if (works.worksMeaning)??>${works.worksMeaning}</#if></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                                <button data-type="0" class="btn btn-u btn-u-red info_btn">下一步</button>
                                <button data-type="10" class="btn btn-u btn-u-default info_btn"
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
<script src="${staticPath}/assets/js/plugins/date-time/bootstrap-datepicker.js"></script>
<script src="${staticPath}/assets/plugins/bootstrap-select/js/bootstrap-select.js"></script>
</@footerJS>

<script>

    $("#headerWorks").addClass("active");
    $(document).ready(function () {

        $('.date-picker').datepicker({autoclose: true, todayHighlight: true, format: 'yyyy-mm-dd'});
        $(".info_btn").bind("click", function () {
            $("#status").val($(this).attr("data-type"));
        });

        $.validator.addMethod(
                "isSelected", //验证方法名称
                function(value, element, param) {//验证规则
                    if(value == param){
                        return false;
                    }
                    return true;
        });

        var $form = $("#works_info");
        $form.validate({
//            errorPlacement: function (error, element) {
//                console.log(element.attr("data-test"));
//                console.log(element.parent().prev().attr("data-test"));
//                console.log(element.parent().prev().find("#error").attr("data-test"));
//                element.parent().find("#error").html(error);
//            },
            rules: {
                breed: {
                    isSelected:""
                },
                worksType: {
                    isSelected:""
                },
                length:{
                    required:true,
                    number:true
                },
                width:{
                    required:true,
                    number:true
                },
                height:{
                    required:true,
                    number:true
                },
                weight:{
                    required:true,
                    number:true
                },
                gytType:{
                    isSelected:""
                },
                levelZk:{
                    isSelected:""
                },
                kqdy:{
                    isSelected:""
                },
                worksMeaning:"required"
            },
            messages: {
                breed: {isSelected: "品种必选"},
                worksType: {isSelected: "作品类型必选"},
                length: {
                    required: "长必填",
                    number:"长是数字类型"
                },
                width: {
                    required: "宽必填",
                    number:"宽是数字类型"
                },
                height: {
                    required: "高必填",
                    number:"高是数字类型"
                },
                weight: {
                    required: "重量必填",
                    number:"重量是数字类型"
                },
                gyType: {isSelected: "作品描述必选"},
                levelZk: {isSelected: "工艺制作必选"},
                kqdy: {isSelected: "矿区地域必选"},
                worksMeaning: {required: "作品诠释必填"}
            },
            submitHandler: function (form) {
                $(form).ajaxSubmit({
                    success: function (data) {
                        if (data.suc) {
                            if ($("#status").val() == 0) {
                                var type = $("#type").val();
                                if(type=="5"||type=="6"){
                                    window.location.href ="/works/add/${works.id}/report";
                                } else {
                                    // 跳转到下一步
                                    window.location.href = "/works/add/${works.id}/"+$("#breed").val()+"/level/";
                                }
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
        })

        $("#providerDetails").on("click",function(){
            window.location.href = "/works/providerDetails/${works.id}";
        })
    });

</script>



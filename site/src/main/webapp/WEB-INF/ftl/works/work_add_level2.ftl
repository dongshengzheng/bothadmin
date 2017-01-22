<#include "../layout/main.ftl"/>

<@htmlHead title="作品登记_作品等级">
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
</style>
</@htmlHead>
<@htmlBody>
<div class="breadcrumbs">
    <div class="container">
        <h1 class="pull-left">作品登记</h1>
        <ul class="pull-right breadcrumb">
            <li><a href="/">首页</a></li>
            <li class="active">作品等级</li>
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
                    <a href="javascript:;" class="step" id ="infoDetails">
                        <span class="number">2</span>
                        <span class="desc"><i class="fa fa-check"></i>作品信息</span>
                    </a>
                </li>
                <li  class="active">
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
                <div class="progress-bar progress-bar-light-green" style="width: 60%;"></div>
            </div>
        </div>

        <div class="row shopping-cart">
            <div class="col-sm-offset-2 col-sm-8">
                <h2 class="title-type">作品等级</h2>
                <div class="billing-info-inputs checkbox-list">
                    <form id="works_level" action="${staticPath}/works/add/level" method="post" class="form-horizontal">
                        <input type="hidden" name="id" id="id" value="<#if (worksLevel.id)??>${worksLevel.id}</#if>">
                        <input type="hidden" name="worksId" id="worksId" value="${works.id}">
                        <input type="hidden" id="status" name="status"/>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="name">作品名称</label>
                            <div class=" col-sm-10">
                                <input class="form-control" type="text" value="${works.name}" disabled="disabled"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="zhidi2">质地</label>
                            <div class="col-sm-4">
                                <select class="form-control selectpicker" name="zhidi2">
                                    <option value="">请选择</option>
                                    <#list zhidi2 as zd2>
                                        <#if ((worksLevel.zhidi2)??)&&("${zd2.value}"=(worksLevel.zhidi2))>
                                            <option value="${zd2.value}" selected="selected">${zd2.label}</option>
                                        <#else>
                                            <option value="${zd2.value}">${zd2.label}</option>
                                        </#if>
                                    </#list>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label dscsqs" for="ziranshipi">自然石皮</label>
                            <div class="col-sm-4">
                                <select class="form-control selectpicker" name="zrsp">
                                    <option value="">请选择</option>
                                    <#list ziranshipi as zr>
                                        <#if ((worksLevel.ziranshipi)??)&&("${zd1.value}"=(worksLevel.ziranshipi))>
                                            <option value="${zr.value}" selected="selected">${zr.label}</option>
                                        <#else>
                                            <option value="${zr.value}">${zr.label}</option>
                                        </#if>
                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="ganguan">感官</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="ganguan">
                                    <option value="">请选择</option>
                                    <#list ganguan as gg>
                                        <#if ((worksLevel.ganguan)??)&&("${gg.value}"=(worksLevel.ganguan))>
                                            <option value="${gg.value}" selected="selected">${gg.label}</option>
                                        <#else>
                                            <option value="${gg.value}">${gg.label}</option>
                                        </#if>
                                    </#list>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label" for="chunjingdu">净度</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="chunjingdu">
                                    <option value="">请选择</option>
                                    <#list jingdu as jd>
                                        <#if ((worksLevel.chunjingdu)??)&&("${jd.value}"==(worksLevel.chunjingdu))>
                                            <option value="${jd.value}" selected="selected">${jd.label}</option>
                                        <#else>
                                            <option value="${jd.value}">${jd.label}</option>
                                        </#if>
                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="moshidu">磨氏度</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="moshidu">
                                    <option value="">请选择</option>
                                    <#list moshidu as msd>
                                        <#if ((worksLevel.moshidu)??)&&("${msd.value}"=(worksLevel.moshidu))>
                                            <option value="${msd.value}" selected="selected">${msd.label}</option>
                                        <#else>
                                            <option value="${msd.value}">${msd.label}</option>
                                        </#if>
                                    </#list>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label" for="dise">地色</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="dise">
                                    <option value="">请选择</option>
                                    <#list dise as ds>
                                        <#if ((worksLevel.dise)??)&&("${ds.value}"==(worksLevel.dise))>
                                            <option value="${ds.value}" selected="selected">${ds.label}</option>
                                        <#else>
                                            <option value="${ds.value}">${ds.label}</option>
                                        </#if>
                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="liu">绺(活筋)</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="liu">
                                    <option value="">请选择</option>
                                    <#list liu as lu>
                                        <#if ((worksLevel.liu)??)&&("${lu.value}"==(worksLevel.liu))>
                                            <option value="${lu.value}" selected="selected">${lu.label}</option>
                                        <#else>
                                            <option value="${lu.value}">${lu.label}</option>
                                        </#if>
                                    </#list>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label" for="lie">裂</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="lie">
                                    <option value="">请选择</option>
                                    <#list lie as le>
                                        <#if ((worksLevel.lie)??)&&("${le.value}"==(worksLevel.lie))>
                                            <option value="${le.value}" selected="selected">${le.label}</option>
                                        <#else>
                                            <option value="${le.value}">${le.label}</option>
                                        </#if>
                                    </#list>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"></label>
                            <div class=" col-sm-4">
                                <button data-type="0" class="btn btn-u btn-u-red info_btn">下一步</button>
                                <button data-type="4" class="btn btn-u btn-u-default info_btn" style="margin-left: 20px">存为草稿
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
<script src="${staticPath}/assets/plugins/bootstrap-select/js/bootstrap-select.js"></script>
</@footerJS>

<script>

    $("#headerWorks").addClass("active");
    $(document).ready(function () {

        $(".info_btn").bind("click", function () {
            $("#status").val($(this).attr("data-type"));
        });

        $.validator.addMethod(
                "isSelected", //验证方法名称
                function(value, element, param) {//验证规则
                    if(value == param){
                        element.parentNode.style.marginBottom="12px";
                        return false;
                    }
                    element.parentNode.style.marginBottom="0px";
                    return true;
                },
                ''//验证提示信息
        );

        var $form = $("#works_level");
        $form.validate({
//            errorPlacement: function (error, element) {
//                element.next().html(error.html());
//            },
            rules: {
                zhidi2: {isSelected:""},
                ganguan: {isSelected:""},
                moshidu: {isSelected:""},
                chunjingdu:{isSelected:""},
                dise:{isSelected:""},
                liu:{isSelected:""},
                lie:{isSelected:""},
                zrsp:{isSelected:""}
            },
            messages: {
                zhidi2: {isSelected: "质地必选"},
                ganguan: {isSelected: "感官必选"},
                moshidu: {isSelected: "磨氏度必选"},
                chunjingdu: {isSelected: "净度必选"},
                dise: {isSelected: "地色必选"},
                liu: {isSelected: "绺（活筋）必选"},
                lie: {isSelected: "裂必选"},
                zrsp: {isSelected: "自然石皮必选"}
            },
            submitHandler: function (form) {
                $(form).ajaxSubmit({
                    success: function (data) {
                        if (data.suc) {
                            if ($("#status").val() == 0) {
                                // 跳转到下一步
                                window.location.href = "/works/add/${works.id}/report";
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

        $("#infoDetails").on("click",function(){
            window.location.href = "/works/infoDetails/${works.id}";
        })
    });
</script>

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
            <li><a href="/l">首页</a></li>
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
                    <a href="javascript:;" class="step">
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
                        <input type="hidden" name="id" id="worksId" value="${works.id}">
                        <input type="hidden" id="status" name="status"/>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="name">作品名称</label>
                            <div class=" col-sm-10">
                                <input class="form-control" type="text" value="${works.name}" disabled="disabled"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="zhidi">质地一</label>
                            <div class="col-sm-4">
                                <select class="form-control selectpicker" name="zhidi" value="<#if (worksLevel.zhidi)??>${worksLevel.zhidi}</#if>">
                                    <option value="">请选择</option>
                                    <#list zhidi1 as zd1>
                                        <option value="${zd1.value}">${zd1.label}</option>
                                    </#list>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label" for="zhidi2">质地二</label>
                            <div class="col-sm-4">
                                <select class="form-control selectpicker" name="zhidi2" value="<#if (worksLevel.zhidi2)??>${worksLevel.zhidi2}</#if>">
                                    <option value="">请选择</option>
                                    <#list zhidi2 as zd2>
                                        <option value="${zd2.value}">${zd2.label}</option>
                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="ganguan">感官</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="ganguan" value="<#if (worksLevel.ganguan)??>${worksLevel.ganguan}</#if>">
                                    <option value="">请选择</option>
                                    <#list ganguan as gg>
                                        <option value="${gg.value}">${gg.label}</option>
                                    </#list>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label" for="moshidu">磨氏度</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="moshidu" value="<#if (worksLevel.moshidu)??>${worksLevel.moshidu}</#if>">
                                    <option value="">请选择</option>
                                    <#list moshidu as msd>
                                        <option value="${msd.value}">${msd.label}</option>
                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="xueliang">血量</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="xueliang" value="<#if (worksLevel.xueliang)??>${worksLevel.xueliang}</#if>">
                                    <option value="">请选择</option>
                                    <#list xueliang as xl>
                                        <option value="${xl.value}">${xl.label}</option>
                                    </#list>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label" for="xuese">血色</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="xuese" value="<#if (worksLevel.xuese)??>${worksLevel.xuese}</#if>">
                                    <option value="">请选择</option>
                                    <#list xuese as xs>
                                        <option value="${xs.value}">${xs.label}</option>
                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="xuexing">血形</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="xuexing" value="<#if (worksLevel.xuexing)??>${worksLevel.xuexing}</#if>">
                                    <option value="">请选择</option>
                                    <#list xuexing as xx>
                                        <option value="${xx.value}">${xx.label}</option>
                                    </#list>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label" for="nongyandu">浓艳度</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="nongyandu" value="<#if (worksLevel.nongyandu)??>${worksLevel.nongyandu}</#if>">
                                    <option value="">请选择</option>
                                    <#list nongyandu as nyd>
                                        <option value="${nyd.value}">${nyd.label}</option>
                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="chunjingdu">纯净度</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="chunjingdu" value="<#if (worksLevel.chunjingdu)??>${worksLevel.chunjingdu}</#if>">
                                    <option value="">请选择</option>
                                    <#list jingdu as jd>
                                        <option value="${jd.value}">${jd.label}</option>
                                    </#list>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label" for="dise">地色</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="dise" value="<#if (worksLevel.dise)??>${worksLevel.dise}</#if>">
                                    <option value="">请选择</option>
                                    <#list dise as ds>
                                        <option value="${ds.value}">${ds.label}</option>
                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="liu">活筋</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="liu" value="<#if (worksLevel.liu)??>${worksLevel.liu}</#if>">
                                    <option value="">请选择</option>
                                    <#list liu as lu>
                                        <option value="${lu.value}">${lu.label}</option>
                                    </#list>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label" for="lie">裂</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="lie" value="<#if (worksLevel.lie)??>${worksLevel.lie}</#if>">
                                    <option value="">请选择</option>
                                    <#list lie as le>
                                        <option value="${le.value}">${le.label}</option>
                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="inithanxueliang">印章含血面</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" value="<#if (worksLevel.inithanxueliang)??>${worksLevel.inithanxueliang}</#if>"
                                        name="inithanxueliang">
                                    <option value="">请选择</option>
                                    <#list mian as ma>
                                        <option value="${ma.value}">${ma.label}</option>
                                    </#list>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label" for="hanxuefangshi">含血方式</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" value="<#if (worksLevel.hanxuefangshi)??>${worksLevel.hanxuefangshi}</#if>"
                                        name="hanxuefangshi">
                                    <option value="">请选择</option>
                                    <#list hanxuefangshi as hxfs>
                                        <option value="${hxfs.value}">${hxfs.label}</option>
                                    </#list>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"></label>
                            <div class=" col-sm-4">
                                <button data-type="0" class="btn btn-u btn-u-red info_btn">下一步</button>
                                <button data-type="0" class="btn btn-u btn-u-default info_btn" style="margin-left: 20px">存为草稿
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
            $("#status").val($(this).attr("data-type"))
        });

        var $form = $("#works_level");
        $form.validate({
            submitHandler: function (form) {
                $(form).ajaxSubmit({
                    success: function (data) {
                        if (data.suc) {
                            if ($("#status").val() == 0) {
                                // 跳转到下一步
                                window.location.href = "/works/add/${works.id}/report";
                            } else {
                                // 跳转到个人中心-> 我的作品->草稿里面
                                window.location.href = "/user";
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
    });
</script>

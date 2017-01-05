<#include "../layout/main.ftl"/>

<@htmlHead title="作品详情">
<link rel="stylesheet" href="${staticPath}/assets/css/datepicker.css">
<link rel="stylesheet" href="${staticPath}/static/css/plugins.css">
<link rel="stylesheet" href="${staticPath}/assets/plugins/bootstrap-select/css/bootstrap-select.css">
<link rel="stylesheet" href="${staticPath}/static/css/shop.style.css">

</@htmlHead>
<@htmlBody>
<div class="breadcrumbs">
    <div class="container">
        <h1 class="pull-left">作品登记</h1>
        <ul class="pull-right breadcrumb">
            <li><a href="/l">首页</a></li>
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
                    <a href="javascript:;" class="step">
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
                            <div class="col-sm-10">
                                <select id="breed" name="breed" class="form-control selectpicker">
                                    <option value="">请选择</option>
                                    <#list pinzhong as pz>
                                        <option value="${pz.value}">${pz.label}</option>
                                    </#list>

                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="name">作品类型</label>
                            <div class="col-sm-10">
                                <select id="type" class="form-control selectpicker"
                                        name="type">
                                    <option value="">请选择</option>
                                    <#list zuopinleixing as zplx>
                                        <option value="${zplx.value}">${zplx.label}</option>
                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="">尺寸(cm)</label>
                            <div class="col-sm-10">
                                <div class="row">
                                    <div class="col-sm-4"><input class="form-control" id="length" name="length"
                                                                 type="text"
                                                                 placeholder="长"/></div>
                                    <div class="col-sm-4"><input class="form-control" name="width" id="width"
                                                                 type="text"
                                                                 placeholder="宽"/></div>
                                    <div class="col-sm-4"><input class="form-control" name="height" id="height"
                                                                 type="text"
                                                                 placeholder="高"/></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="weight">重量(g)</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="weight" id="weight" type="text"
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
                                        <option value="${gy.value}">${gy.label}</option>
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
                                        <option value="${lvl.value}">${lvl.label}</option>
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
                                        <option value="${kq.value}">${kq.label}</option>
                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="maker">制作人</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="maker" id="maker"
                                       placeholder="请输入制作人">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="makeTime">制作时间</label>
                            <div class="col-sm-10">
                                <input readonly type="text" class="form-control date-picker" id="makeTime"
                                       name="makeTime"
                                       placeholder="请输入制作时间">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="worksMeaning">作品诠释</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" style="resize: none;height: 150px"
                                          name="worksMeaning"
                                          id="worksMeaning" type="text" placeholder="请输入作品诠释"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
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
<script src="${staticPath}/assets/js/plugins/date-time/bootstrap-datepicker.js"></script>
<script src="${staticPath}/assets/plugins/bootstrap-select/js/bootstrap-select.js"></script>
</@footerJS>

<script>

    $("#headerWorks").addClass("active");
    $(document).ready(function () {

        $('.date-picker').datepicker({autoclose: true, todayHighlight: true, format: 'yyyy-mm-dd'});
        $(".info_btn").bind("click", function () {
            $("#status").val($(this).attr("data-type"))
        });

        var $form = $("#works_info");
        $form.validate({
            submitHandler: function (form) {
                $(form).ajaxSubmit({
                    success: function (data) {
                        if (data.suc) {
                            if ($("#status").val() == 0) {
                                // 跳转到下一步
                                window.location.href = "/works/add/${works.id}/level";
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

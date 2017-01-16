<#include "../layout/main.ftl"/>

<@htmlHead title="作品登记_评估报告">
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
</style>
</@htmlHead>
<@htmlBody>
<div class="breadcrumbs">
    <div class="container">
        <h1 class="pull-left">作品登记</h1>
        <ul class="pull-right breadcrumb">
            <li><a href="/">首页</a></li>
            <li class="active">评估报告</li>
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
                    <a href="javascript:;" class="step" id="infoDetails">
                        <span class="number">2</span>
                        <span class="desc"><i class="fa fa-check"></i>作品信息</span>
                    </a>
                </li>
                <li class="active">
                    <a href="javascript:;" class="step levelDetails" id ="levelDetails">
                        <span class="number">3</span>
                        <span class="desc"><i class="fa fa-check"></i>作品等级</span>
                    </a>
                </li>
                <li class="active">
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
                <div class="progress-bar progress-bar-light-green" style="width: 80%;"></div>
            </div>
        </div>

        <div class="row shopping-cart">
            <div class="col-sm-offset-2 col-sm-8">
                <h2 class="title-type">评估报告</h2>
                <div class="billing-info-inputs checkbox-list">
                    <form id="works_info" action="${staticPath}/works/add/report" method="post" class="form-horizontal">
                        <input type="hidden" name="id" id="id" value="<#if (report.id)??>${report.id}</#if>">
                        <input type="hidden" name="worksId" id="worksId" value="${works.id}">
                        <input type="hidden" id="status" name="status"/>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="name">作品名称</label>
                            <div class="col-sm-10">
                                <input class="form-control" type="text" value="${works.name}" disabled="disabled"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="description">作品详细评估报告</label>
                            <div class="col-sm-10">
                                    <textarea class="form-control" style="resize: none;height: 150px" name="des"
                                              id="des" type="text" placeholder="作品详细评估报告"><#if (report.des)??>${report.des}</#if></textarea>
                            </div>
                        </div>
                        <!--上传图片-->
                        <div class="form-group">
                            <label class="col-sm-2" for=""></label>
                            <div class="col-sm-10">
                                <div id="upload_des" class=""
                                     style="border: dotted 1px #bbb;height: 100px;width: 100px;overflow: hidden">
                                    <img src="${staticPath}/static/img/upload.png" style="width: 100%;" alt=""/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="description">作品价值认证报告</label>
                            <div class="col-sm-10">
                                    <textarea class="form-control" style="resize: none;height: 150px" name="certify"
                                              id="certify" type="text" placeholder="作品价值认证报告"><#if (report.certify)??>${report.certify}</#if></textarea>
                            </div>
                        </div>
                        <!--上传图片-->
                        <div class="form-group">
                            <label class="col-sm-2" for=""></label>
                            <div class="col-sm-10">
                                <div id="upload_certify" class=""
                                     style="border: dotted 1px #bbb;height: 100px;width: 100px;overflow: hidden">
                                    <img src="${staticPath}/static/img/upload.png" style="width: 100%;" alt=""/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="datetime">价值有效时间</label>
                            <div class="col-sm-10">
                                <input class="form-control date-picker" name="validTime" id="validTime"
                                       type="text" value="<#if (report.validTime)??>${(report.validTime?string("yyyy-MM-dd"))!""}</#if>"
                                       placeholder="请选择价值有效时间" readonly/>
                            </div>

                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                                <button data-type="0" class="btn btn-u btn-u-red info_btn">下一步</button>
                                <button data-type="10" class="btn btn-u btn-u-default info_btn"
                                        style="margin-left: 20px">存为草稿</button>
                                <button data-type="1" submit-type="3" class="btn btn-u btn-u btn-u-orange info_btn"
                                            style="margin-left: 20px">提交审核
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
        initUploaders_inner("upload_certify", "windyeel", '${staticPath}/', "certifyImage");
        initUploaders_inner("upload_des", "windyeel", '${staticPath}/', "desImage");


        $('.date-picker').datepicker({autoclose: true, todayHighlight: true, format: 'yyyy-mm-dd'});
        $(".info_btn").bind("click", function () {
            $("#status").val($(this).attr("data-type"));
        });

        var $form = $("#works_info");
        $form.validate({
            errorPlacement: function (error, element) {
                element.next().prev().html(error.html());
            },
            rules: {
                des: "required",
                certify: "required",
                datetime: "required"
            },
            messages: {
                des: {required: "作品详细评估报告必填"},
                certify: {required: "作品价值认证报告必填"},
                datetime: {required: "价值有效时间必填"}
            },
            submitHandler: function (form) {
                $(form).ajaxSubmit({
                    success: function (data) {
                        if (data.suc) {
                            if ($("#status").val() == 0) {
                                // 跳转到下一步
                                window.location.href = "/works/add/${works.id}/collect";
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

        $(".levelDetails").on("click",function(){
            window.location.href = "/works/levelDetails/${works.id}/${works.breed}";
        })
    });
</script>

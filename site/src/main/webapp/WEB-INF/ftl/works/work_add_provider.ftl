<#include "../layout/main.ftl"/>

<@htmlHead title="作品详情">
<link rel="stylesheet" href="${staticPath}/assets/css/jsdd/work/work_detail.css">
<link rel="stylesheet" href="${staticPath}/assets/css/pages/profile.css">
<link rel="stylesheet" href="${staticPath}/assets/css/pages/shortcode_timeline2.css">
<link rel="stylesheet" href="${staticPath}/assets/css/datepicker.css">
<link rel="stylesheet" href="${staticPath}/assets/js/chosen/chosen.min.css">
<link rel="stylesheet" href="${staticPath}/static/css/plugins.css">
<link rel="stylesheet" href="${staticPath}/static/css/shop.style.css">

</@htmlHead>
<@htmlBody>
<div class="breadcrumbs">
    <div class="container">
        <h1 class="pull-left">作品登记</h1>
        <ul class="pull-right breadcrumb">
            <li><a href="index.html">首页</a></li>
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
                        <input type="hidden" id="type" name="type" value="1"/>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="name">作品名称</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="name" id="name" type="text"
                                       placeholder="请输入作品名称"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="provideBy">提供者</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="provider" id="provider" type="text"
                                       placeholder="请输入提供者"/>
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
                            <label class="col-sm-2 control-label" for="datetime">登记时间</label>
                            <div class="col-sm-10">
                                <input class="form-control date-picker" name="datetime" id="datetime"
                                       type="text"
                                       placeholder="请选择登记时间" readonly/>
                            </div>

                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="description">作品描述</label>
                            <div class="col-sm-10">
                                    <textarea class="form-control" style="resize: none;height: 150px"
                                              name="worksRemarks"
                                              id="worksRemarks" type="text" placeholder="请输入作品描述">${works.remarks!}</textarea>
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
                                <button data-type="1" type="submit" class="btn btn-u btn-u-default info_btn"
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

        $form.validate({
            submitHandler: function (form) {
                $(form).ajaxSubmit({
                    success: function (data) {
                        if (data.suc) {
                            if ($("#status").val() == 0) {
                                // 跳转到下一步
                                window.location.href = "/works/add/" + data.id + "/info";
                            } else {
                                // 跳转到个人中心-> 我的作品->草稿里面
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
            $("#status").val($(this).attr("data-type"))
        });


    });
</script>

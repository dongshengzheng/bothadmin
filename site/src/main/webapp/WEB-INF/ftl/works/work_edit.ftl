<#include "../layout/main.ftl"/>

<@htmlHead title="作品详情">
<link rel="stylesheet" href="${staticPath}/assets/css/jsdd/work/work_detail.css">
<!-- CSS Page Style -->
<link rel="stylesheet" href="${staticPath}/assets/css/pages/profile.css">
<link rel="stylesheet" href="${staticPath}/assets/css/pages/shortcode_timeline2.css">
<link rel="stylesheet" href="${staticPath}/assets/css/style_img.css">
<link rel="stylesheet" href="${staticPath}/static/css/plugins.css">
<link rel="stylesheet" href="${staticPath}/static/css/shop.style.css">
</@htmlHead>
<@htmlBody>


<div class="breadcrumbs">
    <div class="container">
        <h1 class="pull-left">作品登记</h1>
        <ul class="pull-right breadcrumb">
            <li><a href="index.html">首页</a></li>
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
                    <a href="#step1" class="step" data-toggle="tab">
                        <span class="number">1</span>
                        <span class="desc">
                            <i class="fa fa-check"></i>物品信息
                        </span>
                    </a>
                </li>
                <li>
                    <a href="#step2" class="step" data-toggle="tab">
                        <span class="number">2</span>
                        <span class="desc">
                            <i class="fa fa-check"></i>作品信息
                        </span>
                    </a>
                </li>
                <li>
                    <a href="#step3" class="step" data-toggle="tab">
                        <span class="number">3</span>
                        <span class="desc">
                            <i class="fa fa-check"></i>作品等级
                        </span>
                    </a>
                </li>
                <li>
                    <a href="#step4" class="step" data-toggle="tab">
                        <span class="number">4</span>
                        <span class="desc">
                                <i class="fa fa-check"></i>评估报告
                            </span>
                    </a>
                </li>
                <li>
                    <a href="#step5" class="step" data-toggle="tab">
                        <span class="number">5</span>
                        <span class="desc">
                                <i class="fa fa-check"></i>收藏者信息
                            </span>
                    </a>
                </li>
            </ul>
            <hr class="devider devider-dotted">
        </div>
        <div class="tab-content margin-bottom-30 shopping-cart" style="background: rgb(254,255,255)">

            <div class="tab-pane fade in active" id="step1">
                <div class="col-sm-offset-2 col-sm-8">
                    <h2 class="title-type">物品信息</h2>
                    <div class="form-horizontal billing-info-inputs">
                        <input type="hidden" id="type" name="type" value="1"/>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="name">作品名称</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="name" id="name" type="text" value="${works.name!}"
                                       placeholder="请输入作品名称"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="provideBy">提供者</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="provider" id="provider" type="text"
                                       value="${(provider.name)!}"
                                       placeholder="请输入提供者"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="cardNo">身份证</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="no" id="no" type="text"
                                       value="${provider.no!}" placeholder="请输入身份证"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="address">联系地址</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="address" id="address" type="text"
                                       value="${provider.address!}" placeholder="请输入联系地址"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="contact">手机号码</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="phone" id="phone" type="text"
                                       value="${provider.phone!}" placeholder="请输入手机号码"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="datetime">登记时间</label>
                            <div class="col-sm-10">
                                <input class="form-control date-picker" name="datetime" id="datetime"
                                       value="${provider.datetime?string("yyyy-MM-dd")!}" type="text"
                                       placeholder="请选择登记时间" readonly/>
                            </div>

                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="description">作品描述</label>
                            <div class="col-sm-10">
                                    <textarea class="form-control" style="resize: none;height: 150px"
                                              name="worksRemarks"
                                              id="worksRemarks" type="text"
                                              placeholder="请输入作品描述">${works.remarks!}</textarea>
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
                    </div>
                </div>
            </div>
            <div class="tab-pane fade in" id="step2">
                <div class="col-sm-offset-2 col-sm-8">
                    <h2 class="title-type">作品信息</h2>
                    <div class="form-horizontal billing-info-inputs">

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
                    </div>
                </div>
            </div>
            <div class="tab-pane fade in" id="step3">
                <div class="col-sm-offset-2 col-sm-8">
                    <h2 class="title-type">物品信息</h2>
                    <div class="form-horizontal billing-info-inputs">
                        <input type="hidden" name="worksId" id="worksId" value="${works.id}">
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
                                <select class="form-control selectpicker" name="zhidi">
                                    <option value="">请选择</option>
                                    <#list zhidi1 as zd1>
                                        <option value="${zd1.value}">${zd1.label}</option>
                                    </#list>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label" for="zhidi2">质地二</label>
                            <div class="col-sm-4">
                                <select class="form-control selectpicker" name="zhidi2">
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
                                <select class="form-control selectpicker" name="ganguan">
                                    <option value="">请选择</option>
                                    <#list ganguan as gg>
                                        <option value="${gg.value}">${gg.label}</option>
                                    </#list>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label" for="moshidu">磨氏度</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="moshidu">
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
                                <select class="form-control selectpicker" name="xueliang">
                                    <option value="">请选择</option>
                                    <#list xueliang as xl>
                                        <option value="${xl.value}">${xl.label}</option>
                                    </#list>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label" for="xuese">血色</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="xuese">
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
                                <select class="form-control selectpicker" name="xuexing">
                                    <option value="">请选择</option>
                                    <#list xuexing as xx>
                                        <option value="${xx.value}">${xx.label}</option>
                                    </#list>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label" for="nongyandu">浓艳度</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="nongyandu">
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
                                <select class="form-control selectpicker" name="chunjingdu">
                                    <option value="">请选择</option>
                                    <#list jingdu as jd>
                                        <option value="${jd.value}">${jd.label}</option>
                                    </#list>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label" for="dise">地色</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="dise">
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
                                <select class="form-control selectpicker" name="liu">
                                    <option value="">请选择</option>
                                    <#list liu as lu>
                                        <option value="${lu.value}">${lu.label}</option>
                                    </#list>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label" for="lie">裂</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="lie">
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
                                <select class="form-control selectpicker"
                                        name="inithanxueliang">
                                    <option value="">请选择</option>
                                    <#list mian as ma>
                                        <option value="${ma.value}">${ma.label}</option>
                                    </#list>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label" for="hanxuefangshi">含血方式</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker"
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
                                <button data-type="1" class="btn btn-u btn-u-default info_btn" style="margin-left: 20px">存为草稿
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade in" id="step4">
                <div class="col-sm-offset-2 col-sm-8">
                    <h2 class="title-type">物品信息</h2>
                    <div class="form-horizontal billing-info-inputs">
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
                                              id="des" type="text" placeholder="作品详细评估报告"></textarea>
                            </div>
                        </div>
                        <!--上传图片-->
                        <div class="form-group">
                            <label class="col-sm-2" for=""></label>
                            <div class="col-sm-10">
                                <div id="upload_des" class=""
                                     style="border: dotted 1px #bbb;height: 100px;width: 100px;overflow: hidden">
                                    <img src="${staticPath}/static/img/upload.png" style="width: 100%;" alt="" />
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="description">作品价值认证报告</label>
                            <div class="col-sm-10">
                                    <textarea class="form-control" style="resize: none;height: 150px" name="certify"
                                              id="certify" type="text" placeholder="作品价值认证报告"></textarea>
                            </div>
                        </div>
                        <!--上传图片-->
                        <div class="form-group">
                            <label class="col-sm-2" for=""></label>
                            <div class="col-sm-10">
                                <div id="upload_certify" class=""
                                     style="border: dotted 1px #bbb;height: 100px;width: 100px;overflow: hidden">
                                    <img src="${staticPath}/static/img/upload.png" style="width: 100%;" alt="" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="datetime">价值有效时间</label>
                            <div class="col-sm-10">
                                <input class="form-control date-picker" name="validTime" id="validTime"
                                       type="text"
                                       placeholder="请选择价值有效时间" readonly/>
                            </div>

                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                                <button data-type="0" class="btn btn-u btn-u-red info_btn">下一步</button>
                                <button data-type="1" class="btn btn-u btn-u-default info_btn" style="margin-left: 20px">存为草稿
                                    <button data-type="1" class="btn btn-u btn-u btn-u-orange info_btn" style="margin-left: 20px">提交审核
                                    </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade in" id="step5">
                <div class="col-sm-offset-2 col-sm-8">
                    <h2 class="title-type">物品信息</h2>
                    <div class="form-horizontal billing-info-inputs">
                        <input type="hidden" name="worksId" id="worksId" value="${works.id}">
                        <input type="hidden" id="status" name="status"/>
                        <input type="hidden" id="type" name="type" value="2"/>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="name">作品名称</label>
                            <div class=" col-sm-10">
                                <input class="form-control" type="text" value="${works.name}" disabled="disabled"/>
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
                            <label class="col-sm-2 control-label" for="pub"></label>
                            <div class="col-sm-10">
                                <label class="checkbox text-left" style="padding-top:0px;">
                                    <input type="checkbox" name="pub"/>
                                    <i></i>是否公开
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</@htmlBody>
<@footerJS>
</@footerJS>
<script src="${staticPath}/assets/js/upload/upload.js"></script>
<script src="${staticPath}/assets/js/plugins/plupload-2.1.2/js/moxie.js"></script>
<script src="${staticPath}/assets/js/plugins/plupload-2.1.2/js/plupload.dev.js"></script>

<script>
    $(document).ready(function () {
        initUploaders("upload_pgbg", "windyeel", "http://hv64l.free.natapp.cc/");
        initUploaders("upload_rzbg", "windyeel", "http://hv64l.free.natapp.cc/");
        initUploaders("selectfiles", "windyeel", "http://hv64l.free.natapp.cc/");


    });
</script>

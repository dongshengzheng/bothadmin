<#include "../layout/main.ftl"/>

<@htmlHead title="作品详情">
<link rel="stylesheet" href="${staticPath}/assets/css/jsdd/work/work_detail.css">
<!-- CSS Page Style -->
<link rel="stylesheet" href="${staticPath}/assets/css/pages/profile.css">
<link rel="stylesheet" href="${staticPath}/assets/css/pages/shortcode_timeline2.css">
<link rel="stylesheet" href="${staticPath}/assets/plugins/bootstrap-select/css/bootstrap-select.css">
<link rel="stylesheet" href="${staticPath}/assets/css/style_img.css">
<link rel="stylesheet" href="${staticPath}/static/css/plugins.css">
<link rel="stylesheet" href="${staticPath}/static/css/shop.style.css">
</@htmlHead>
<@htmlBody>
<div class="breadcrumbs">
    <div class="container">
        <h1 class="pull-left">作品编辑</h1>
        <ul class="pull-right breadcrumb">
            <li><a href="index.html">首页</a></li>
            <li class="active">作品编辑</li>
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
        <form id="works_info" class="tab-content margin-bottom-30 shopping-cart" style="background: rgb(254,255,255)"
              action="/works/edit" method="post">
            <input type="hidden" name="worksId" id="worksId" value="${(works.id)!}">
            <input type="hidden" id="status" name="works.status"/>
            <input type="hidden" name="works.id" value="${(works.id)!}"/>
            <input type="hidden" name="report.id" value="${(report.id)!}"/>
            <input type="hidden" name="collect.id" value="${(collect.id)!}"/>
            <input type="hidden" name="provider.id" value="${(provider.id)!}"/>
            <input type="hidden" name="level.id" value="${(workLevel.id)!}"/>
            <div class="tab-pane fade in active" id="step1">
                <div class="col-sm-offset-2 col-sm-8">
                    <h2 class="title-type">物品信息</h2>
                    <div class="form-horizontal billing-info-inputs">
                        <input type="hidden" id="provider.type" name="provider.type" value="1"/>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="workName">作品名称</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="works.name" id="workName" type="text"
                                       value="${(works.name)!}"
                                       placeholder="请输入作品名称"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="providerName">提供者</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="provider.name" id="providerName" type="text"
                                       value="${(provider.name)!}"
                                       placeholder="请输入提供者"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="providerNo">身份证</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="provider.no" id="providerNo" type="text"
                                       value="${(provider.no)!}" placeholder="请输入身份证"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="providerAddress">联系地址</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="provider.address" id="providerAddress" type="text"
                                       value="${(provider.address)!}" placeholder="请输入联系地址"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="providerPhone">手机号码</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="provider.phone" id="provider.phone" type="text"
                                       value="${(provider.phone)!}" placeholder="请输入手机号码"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="providerDatetime">登记时间</label>
                            <div class="col-sm-10">
                                <input class="form-control date-picker" name="provider.datetime" id="providerDatetime"
                                       value="${(provider.datetime?string("yyyy-MM-dd"))!}" type="text"
                                       placeholder="请选择登记时间" readonly/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="worksRemarks">作品描述</label>
                            <div class="col-sm-10">
                                    <textarea class="form-control" style="resize: none;height: 150px"
                                              name="works.remarks" id="worksRemarks"
                                              placeholder="请输入作品描述">${(works.remarks)!}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2" for=""></label>
                            <div class="col-sm-10">
                                <#list worksImage as image>
                                    <div class="upload-container" data="${image.id}">
                                        <span class="glyphicon glyphicon-remove"></span>
                                        <img src="http://windyeel.img-cn-shanghai.aliyuncs.com/${image.url}?x-oss-process=image/resize,m_fill,h_100,w_100"
                                             class="min-img">
                                    </div>
                                </#list>
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
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="name">作品名称</label>
                            <div class="col-sm-10">
                                <input class="form-control" type="text" value="${(works.name)!}" disabled="disabled"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="breed">品种</label>
                            <div class="col-sm-10">
                                <select id="breed" name="works.breed" class="form-control selectpicker">
                                    <option value="">请选择</option>
                                    <#list pinzhong as pz>
                                        <option value="${pz.value}"
                                                <#if works.breed == pz.value>selected</#if>>${pz.label}</option>
                                    </#list>

                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="name">作品类型</label>
                            <div class="col-sm-10">
                                <select id="type" class="form-control selectpicker"
                                        name="works.type">
                                    <option value="">请选择</option>
                                    <#list zuopinleixing as zplx>
                                        <option value="${zplx.value}"
                                                <#if works.type == zplx.value>selected</#if>>${zplx.label}</option>
                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="">尺寸(cm)</label>
                            <div class="col-sm-10">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <input class="form-control" id="length" name="works.length"
                                               value="${(works.length)!}" type="text" placeholder="长"/></div>
                                    <div class="col-sm-4">
                                        <input class="form-control" name="works.width" id="width"
                                               value="${(works.width)!}" type="text" placeholder="宽"/></div>
                                    <div class="col-sm-4">
                                        <input class="form-control" name="works.height" id="height"
                                               value="${(works.height)!}" type="text" placeholder="高"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="weight">重量(g)</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="works.weight" id="weight" type="text"
                                       placeholder="请输入重量" value="${(works.weight)!}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="gyType">工艺制作</label>
                            <div class="col-sm-10">
                                <select class="form-control selectpicker"
                                        id="gyType" name="works.gyType">
                                    <option value="">请选择</option>
                                    <#list gyType as gy>
                                        <option value="${gy.value}"
                                                <#if works.gyType == gy.value>selected</#if>>${gy.label}</option>
                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="levelZk">篆刻级别</label>
                            <div class="col-sm-10">
                                <select class="form-control selectpicker"
                                        id="levelZk" name="works.levelZk">
                                    <option value="">请选择</option>
                                    <#list level as lvl>
                                        <option value="${lvl.value}"
                                                <#if works.levelZk == lvl.value>selected</#if>>${lvl.label}</option>
                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="kqdy">矿区地域</label>
                            <div class="col-sm-10">
                                <select class="form-control selectpicker" id="kqdy"
                                        name="works.kqdy">
                                    <option value="">请选择</option>
                                    <#list kqdy as kq>
                                        <option value="${kq.value}"
                                                <#if works.kqdy == kq.value>selected</#if>>${kq.label}</option>
                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="maker">制作人</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="works.maker" id="maker"
                                       placeholder="请输入制作人" value="${(works.maker)!}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="makeTime">制作时间</label>
                            <div class="col-sm-10">
                                <input readonly type="text" class="form-control date-picker" id="makeTime"
                                       name="works.makeTime" value="${(works.makeTime?string("yyyy-MM-dd"))!}"
                                       placeholder="请输入制作时间">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="worksMeaning">作品诠释</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" style="resize: none;height: 150px"
                                          name="works.worksMeaning"
                                          id="worksMeaning" type="text"
                                          placeholder="请输入作品诠释">${(works.worksMeaning)!}</textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade in" id="step3">
                <div class="col-sm-offset-2 col-sm-8">
                    <h2 class="title-type">作品等级</h2>
                    <div class="form-horizontal billing-info-inputs">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="name">作品名称</label>
                            <div class=" col-sm-10">
                                <input class="form-control" type="text" value="${(works.name)!}" disabled="disabled"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">质地一</label>
                            <div class="col-sm-4">
                                <select class="form-control selectpicker" name="level.zhidi">
                                    <option value="">请选择</option>
                                    <#list zhidi1 as zd1>
                                        <option value="${zd1.value}"
                                                <#if worksLevel.zhidi == zd1.value>selected</#if>>${zd1.label}</option>
                                    </#list>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label" for="zhidi2">质地二</label>
                            <div class="col-sm-4">
                                <select class="form-control selectpicker" name="level.zhidi2">
                                    <option value="">请选择</option>
                                    <#list zhidi2 as zd2>
                                        <option value="${zd2.value}"
                                                <#if worksLevel.zhidi2 == zd2.value>selected</#if>>${zd2.label}</option>
                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="ganguan">感官</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="level.ganguan">
                                    <option value="">请选择</option>
                                    <#list ganguan as gg>
                                        <option value="${gg.value}"
                                                <#if worksLevel.ganguan == gg.value>selected</#if>>${gg.label}</option>
                                    </#list>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label" for="moshidu">磨氏度</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="level.moshidu">
                                    <option value="">请选择</option>
                                    <#list moshidu as msd>
                                        <option value="${msd.value}"
                                                <#if worksLevel.moshidu == msd.value>selected</#if>>${msd.label}</option>
                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="xueliang">血量</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="level.xueliang">
                                    <option value="">请选择</option>
                                    <#list xueliang as xl>
                                        <option value="${xl.value}"
                                                <#if worksLevel.xueliang == xl.value>selected</#if>>${xl.label}</option>
                                    </#list>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label" for="xuese">血色</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="level.xuese">
                                    <option value="">请选择</option>
                                    <#list xuese as xs>
                                        <option value="${xs.value}"
                                                <#if worksLevel.xuese == xs.value>selected</#if>>${xs.label}</option>
                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="xuexing">血形</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="level.xuexing">
                                    <option value="">请选择</option>
                                    <#list xuexing as xx>
                                        <option value="${xx.value}"
                                                <#if worksLevel.xuexing == xx.value>selected</#if>>${xx.label}</option>
                                    </#list>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label" for="nongyandu">浓艳度</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="level.nongyandu">
                                    <option value="">请选择</option>
                                    <#list nongyandu as nyd>
                                        <option value="${nyd.value}"
                                                <#if worksLevel.nongyandu == nyd.value>selected</#if>>${nyd.label}</option>
                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="chunjingdu">纯净度</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="level.chunjingdu">
                                    <option value="">请选择</option>
                                    <#list jingdu as jd>
                                        <option value="${jd.value}"
                                                <#if worksLevel.chunjingdu == jd.value>selected</#if>>${jd.label}</option>
                                    </#list>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label" for="dise">地色</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="level.dise">
                                    <option value="">请选择</option>
                                    <#list dise as ds>
                                        <option value="${ds.value}"
                                                <#if worksLevel.dise == ds.value>selected</#if>>${ds.label}</option>
                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="liu">活筋</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="level.liu">
                                    <option value="">请选择</option>
                                    <#list liu as lu>
                                        <option value="${lu.value}"
                                                <#if worksLevel.liu == lu.value>selected</#if>>${lu.label}</option>
                                    </#list>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label" for="lie">裂</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker" name="level.lie">
                                    <option value="">请选择</option>
                                    <#list lie as le>
                                        <option value="${le.value}"
                                                <#if worksLevel.lie == le.value>selected</#if>>${le.label}</option>
                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="inithanxueliang">印章含血面</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker"
                                        name="level.inithanxueliang">
                                    <option value="">请选择</option>
                                    <#list mian as ma>
                                        <option value="${ma.value}"
                                                <#if worksLevel.inithanxueliang == ma.value>selected</#if>>${ma.label}</option>
                                    </#list>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label" for="hanxuefangshi">含血方式</label>
                            <div class=" col-sm-4">
                                <select class="form-control selectpicker"
                                        name="level.hanxuefangshi">
                                    <option value="">请选择</option>
                                    <#list hanxuefangshi as hxfs>
                                        <option value="${hxfs.value}"
                                                <#if worksLevel.hanxuefangshi == hxfs.value>selected</#if>>${hxfs.label}</option>
                                    </#list>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade in" id="step4">
                <div class="col-sm-offset-2 col-sm-8">
                    <h2 class="title-type">评估报告</h2>
                    <div class="form-horizontal billing-info-inputs">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="name">作品名称</label>
                            <div class="col-sm-10">
                                <input class="form-control" type="text" value="${(works.name)!}" disabled="disabled"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="description">作品详细评估报告</label>
                            <div class="col-sm-10">
                                    <textarea class="form-control" style="resize: none;height: 150px" name="report.des"
                                              id="des" type="text" placeholder="作品详细评估报告">${(report.des)!}</textarea>
                            </div>
                        </div>
                        <!--上传图片-->
                        <div class="form-group">
                            <label class="col-sm-2" for=""></label>
                            <div class="col-sm-10">
                                <#list reportImage as image>
                                    <div class="upload-container" data='${image.id}'>
                                        <spanclass
                                        ="glyphicon glyphicon-remove"></span>
                                        <img src="http://windyeel.img-cn-shanghai.aliyuncs.com/${image.url}?x-oss-process=image/resize,m_fill,h_100,w_100"
                                             class="min-img">
                                    </div>
                                </#list>
                                <div id="upload_des" class=""
                                     style="border: dotted 1px #bbb;height: 100px;width: 100px;overflow: hidden">
                                    <img src="${staticPath}/static/img/upload.png" style="width: 100%;" alt=""/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="description">作品价值认证报告</label>
                            <div class="col-sm-10">
                                    <textarea class="form-control" style="resize: none;height: 150px"
                                              name="report.certify"
                                              id="certify" type="text"
                                              placeholder="作品价值认证报告">${(report.certify)!}</textarea>
                            </div>
                        </div>
                        <!--上传图片-->
                        <div class="form-group">
                            <label class="col-sm-2" for=""></label>
                            <div class="col-sm-10">
                                <#list certifyImage as image>
                                    <div class="upload-container" data='${image.id}'>
                                        <span class="glyphicon glyphicon-remove"></span>
                                        <img src="http://windyeel.img-cn-shanghai.aliyuncs.com/${image.url}?x-oss-process=image/resize,m_fill,h_100,w_100"
                                             class="min-img">
                                    </div>
                                </#list>

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
                                       type="text" value="${(report.validTime?string("yyyy-MM-dd"))!}"
                                       placeholder="请选择价值有效时间" readonly/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade in" id="step5">
                <div class="col-sm-offset-2 col-sm-8">
                    <h2 class="title-type">收藏者信息</h2>
                    <div class="form-horizontal billing-info-inputs checkbox-list">
                        <input type="hidden" id="collect.type" name="collect.type" value="2"/>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="name">作品名称</label>
                            <div class=" col-sm-10">
                                <input class="form-control" type="text" value="${(works.name)!}" disabled="disabled"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="provideBy">收藏者</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="provider.name" id="provider.name" type="text"
                                       placeholder="收藏者" value="${(provider.name)!}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="cardNo">身份证</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="provider.no" id="no" type="text"
                                       placeholder="请输入身份证" value="${(provider.no)!}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="address">联系地址</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="provider.address" id="address" type="text"
                                       placeholder="请输入联系地址" value="${(provider.address)!}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="contact">手机号码</label>
                            <div class="col-sm-10">
                                <input class="form-control" name="provider.phone" id="phone" type="text"
                                       placeholder="请输入手机号码" value="${(provider.phone)!}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="datetime">收藏时间</label>
                            <div class="col-sm-10">
                                <input class="form-control date-picker" name="provider.datetime" id="datetime"
                                       type="text" value="${(provider.datetime?string("yyyy-MM-dd"))!}"
                                       placeholder="请选择收藏时间" readonly/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="pub"></label>
                            <div class="col-sm-10">
                                <label class="checkbox text-left" style="padding-top:0px;">
                                    <input type="checkbox" name="provider.pub" <#if provider.pub == "1">checked</#if>/>
                                    <i></i>是否公开
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-offset-2 col-sm-8" style="margin-top:15px;">
                <div class="form-horizontal billing-info-inputs">
                    <div class="form-group">
                        <label class="col-sm-2" for=""></label>
                        <div class="col-sm-10">
                            <button data-type="1" type="submit" class="btn btn-u btn-u-red info_btn">提交审核</button>
                            <button data-type="0" type="submit" class="btn btn-u btn-u-default info_btn"
                                    style="margin-left: 20px">存为草稿
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

</@htmlBody>
<@footerJS>
</@footerJS>
<script src="${staticPath}/assets/js/upload/upload.js"></script>
<script src="${staticPath}/assets/js/plugins/plupload-2.1.2/js/moxie.js"></script>
<script src="${staticPath}/assets/js/plugins/plupload-2.1.2/js/plupload.dev.js"></script>
<script src="${staticPath}/assets/plugins/bootstrap-select/js/bootstrap-select.js"></script>
<script src="${staticPath}/assets/js/plugins/date-time/bootstrap-datepicker.js"></script>

<script>
    $(document).ready(function () {

        $('.date-picker').datepicker({autoclose: true, todayHighlight: true, format: 'yyyy-mm-dd'});

        //存为草稿info_btn
        $(".info_btn").bind("click", function () {
            $("#status").val($(this).attr("data-type"))
        });
        $(".upload-container").bind("click", function () {
            var _this = $(this)
            if (confirm("你确认要删除当前图片?")) {
                $.post("/works/image/delete/" + $(this).attr("data"), function (data) {
                    if (data.suc) {
                        _this.remove();
                    } else {
                        alert("图片不存在");
                    }
                });

            }

        });
        var $form = $("#works_info");
        $form.validate({
            submitHandler: function (form) {
                $(form).ajaxSubmit({
                    success: function (data) {
                        if (data.suc) {
                            if ($("#status").val() == 0) {
                                // 跳转到下一步
                                window.location.href =  window.location.href;
                            } else {
                                // 跳转到个人中心-> 我的作品->草稿里面
                                window.location.href =  window.location.href;
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

        initUploaders_inner("upload_works_info", "windyeel", '${staticPath}/', "worksImages");

        initUploaders_inner("upload_certify", "windyeel", '${staticPath}/', "certifyImage");
        initUploaders_inner("upload_des", "windyeel", '${staticPath}/', "desImage");
    });
</script>

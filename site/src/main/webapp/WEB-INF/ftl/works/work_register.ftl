<#include "../layout/main.ftl"/>

<@htmlHead title="作品详情">
<link rel="stylesheet" href="${staticPath}/assets/css/jsdd/work/work_detail.css">
<!-- CSS Page Style -->
<link rel="stylesheet" href="${staticPath}/assets/css/pages/profile.css">
<link rel="stylesheet" href="${staticPath}/assets/css/pages/shortcode_timeline2.css">
<link rel="stylesheet" href="${staticPath}/assets/css/datepicker.css">
<link rel="stylesheet" href="${staticPath}/assets/js/chosen/chosen.min.css">
</@htmlHead>
<@htmlBody>
<hr/>

<div class="wrapper">
    <#if step == 1>
        <!--物品信息-->
        <div class="container margin-bottom-40">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class="row">
                        <form id="works_info" action="${staticPath}/works/addGoodsInfo/0" method="post"
                              class="form-horizontal">
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
                                    <input class="form-control" name="provideBy" id="provideBy" type="text"
                                           placeholder="请输入提供者"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="cardNo">身份证</label>
                                <div class="col-sm-10">
                                    <input class="form-control" name="cardNo" id="cardNo" type="text"
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
                                <label class="col-sm-2 control-label" for="contact">联系方式</label>
                                <div class="col-sm-10">
                                    <input class="form-control" name="contact" id="contact" type="text"
                                           placeholder="请输入联系方式"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="registerTime">登记时间</label>
                                <div class="col-sm-10">
                                    <input class="form-control date-picker" name="registerTime" id="registerTime" type="text"
                                           placeholder="请选择登记时间" readonly/>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="description">作品描述</label>
                                <div class="col-sm-10">
                                    <textarea class="form-control" style="resize: none;height: 150px" name="description"
                                              id="description" type="text" placeholder="请输入作品描述"></textarea>
                                </div>
                            </div>
                            <!--上传图片-->
                            <div class="form-group">
                                <label class="col-sm-2" for=""></label>
                                <div class="col-sm-10">
                                    <div id="upload_works_info" class=""
                                         style="border: dotted 1px #bbb;height: 100px;width: 100px;overflow: hidden">

                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <button data-type="0" type="submit" class="btn btn-u btn-u-red info_btn">下一步</button>
                            </div>

                            <div class="col-sm-10">
                                <button data-type="1" type="submit" class="btn btn-u btn-u-default info_btn"
                                        style="margin-left: 20px">存为草稿
                                </button>
                            </div>
                        </form>
                    </div>

                </div>

                <div class="col-md-3"></div>
            </div>
        </div>
    </#if >

    <#if step ==2>
        <!--作品信息-->
        <div class="container margin-bottom-40">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class="row">
                        <form action="${staticPath}/works/addWorksInfo/0" method="post" class="form-horizontal">
                            <input type="hidden" name="goodsId" id="goodsId" value="${goodsId}">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">作品名称</label>
                                <div class="col-sm-10">
                                    <input class="form-control" type="text" value="${goodsName}" disabled="disabled"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="breed">品种</label>
                                <div class="col-sm-10">
                                    <select data-placeholder="请选择" id="breed" class="form-control chzn-chosen" name="breed">
                                        <option value=""></option>
                                        <#list pinzhong as pz>
                                            <option value="${pz.label}">${pz.label}</option>
                                        </#list>

                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">作品类型</label>
                                <div class="col-sm-10">
                                    <select data-placeholder="请选择"  id="type" class="form-control chzn-chosen" name="type">
                                        <option value=""></option>
                                        <#list zuopinleixing as zplx>
                                            <option value="${zplx.label}">${zplx.label}</option>
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
                                <label class="col-sm-2 control-label" for="productionProcess">工艺制作</label>
                                <div class="col-sm-10">
                                    <select data-placeholder="请选择" class="form-control chzn-chosen" id="productionProcess" name="productionProcess">
                                        <option value=""></option>
                                        <option value="工艺制作">工艺制作</option>
                                        <option value="工艺制作">工艺制作</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="sealCuttingLevel">篆刻级别</label>
                                <div class="col-sm-10">
                                    <select data-placeholder="请选择" class="form-control chzn-chosen" id="sealCuttingLevel" name="sealCuttingLevel">
                                        <option value=""></option>
                                        <#list level as lvl>
                                            <option value="${lvl.label}">${lvl.label}</option>
                                        </#list>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="mineArea">矿区地域</label>
                                <div class="col-sm-10">
                                    <select data-placeholder="请选择" class="form-control chzn-chosen" id="mineArea" name="mineArea">
                                        <option value=""></option>
                                        <#list kqdy as kq>
                                            <option value="${kq.label}">${kq.label}</option>
                                        </#list>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="producer">制作人</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="producer" id="producer"
                                           placeholder="请输入制作人">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="produceTime">制作时间</label>
                                <div class="col-sm-10">
                                    <input readonly type="text" class="form-control date-picker" id="produceTime" name="produceTime"
                                           placeholder="请输入制作时间">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="worksExplanation">作品诠释</label>
                                <div class="col-sm-10">
                                <textarea class="form-control" style="resize: none;height: 150px"
                                          name="worksExplanation"
                                          id="worksExplanation" type="text" placeholder="请输入作品诠释"></textarea>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <button class="btn btn-u btn-u-red">下一步</button>
                            </div>

                            <div class="col-sm-10">
                                <button class="btn btn-u btn-u-default" style="margin-left: 20px">存为草稿</button>
                            </div>
                        </form>
                    </div>

                </div>

                <div class="col-md-3"></div>
            </div>
        </div>
    </#if >

    <#if step ==3>
        <!--作品等级-->
        <div class="container margin-bottom-40">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class="row">
                        <form action="${staticPath}/works/addWorksLevel/0" method="post" class="form-horizontal">
                            <input type="hidden" name="worksId" id="worksId" value="${goodsId}">

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">作品名称</label>
                                <div class="col-sm-10">
                                    <input data-placehoder="" class="form-control" type="text" value="${goodsName}" disabled="disabled"/>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="zhidi">质地一</label>
                                <div class="col-sm-10">
                                    <select data-placeholder="请选择" class="form-control chzn-chosen" name="zhidi">
                                        <option value=""></option>
                                        <#list zhidi1 as zd1>
                                            <option value="${zd1.label}">${zd1.label}</option>
                                        </#list>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="zhidi2">质地二</label>
                                <div class="col-sm-10">
                                    <select data-placeholder="请选择" class="form-control chzn-chosen" name="zhidi2">
                                        <option value=""></option>
                                        <#list zhidi2 as zd2>
                                            <option value="${zd2.label}">${zd2.label}</option>
                                        </#list>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="ganguan">感官</label>
                                <div class="col-sm-10">
                                    <select data-placeholder="请选择" class="form-control chzn-chosen" name="ganguan">
                                        <option value=""></option>
                                        <#list ganguan as gg>
                                            <option value="${gg.label}">${gg.label}</option>
                                        </#list>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="moshidu">磨氏度</label>
                                <div class="col-sm-10">
                                    <select data-placeholder="请选择" class="form-control chzn-chosen" name="moshidu">
                                        <option value=""></option>
                                        <#list moshidu as msd>
                                            <option value="${msd.label}">${msd.label}</option>
                                        </#list>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="xueliang">血量</label>
                                <div class="col-sm-10">
                                    <select data-placeholder="请选择" class="form-control chzn-chosen" name="xueliang">
                                        <option value=""></option>
                                        <#list xueliang as xl>
                                            <option value="${xl.label}">${xl.label}</option>
                                        </#list>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="xuese">血色</label>
                                <div class="col-sm-10">
                                    <select data-placeholder="请选择" class="form-control chzn-chosen" name="xuese">
                                        <option value=""></option>
                                        <#list xuese as xs>
                                            <option value="${xs.label}">${xs.label}</option>
                                        </#list>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="xuexing">血形</label>
                                <div class="col-sm-10">
                                    <select data-placeholder="请选择" class="form-control chzn-chosen" name="xuexing">
                                        <option value=""></option>
                                        <#list xuexing as xx>
                                            <option value="${xx.label}">${xx.label}</option>
                                        </#list>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="nongyandu">浓艳度</label>
                                <div class="col-sm-10">
                                    <select data-placeholder="请选择" class="form-control chzn-chosen" name="nongyandu">
                                        <option value=""></option>
                                        <#list nongyandu as nyd>
                                            <option value="${nyd.label}">${nyd.label}</option>
                                        </#list>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="jingdu">纯净度</label>
                                <div class="col-sm-10">
                                    <select data-placeholder="请选择" class="form-control chzn-chosen" name="jingdu">
                                        <option value=""></option>
                                        <#list jingdu as jd>
                                            <option value="${jd.label}">${jd.label}</option>
                                        </#list>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="dise">地色</label>
                                <div class="col-sm-10">
                                    <select data-placeholder="请选择" class="form-control chzn-chosen" name="dise">
                                        <option value=""></option>
                                        <#list dise as ds>
                                            <option value="${ds.label}">${ds.label}</option>
                                        </#list>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="liu">活筋</label>
                                <div class="col-sm-10">
                                    <select data-placeholder="请选择" class="form-control chzn-chosen" name="liu">
                                        <option value=""></option>
                                        <#list liu as lu>
                                            <option value="${lu.label}">${lu.label}</option>
                                        </#list>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="lie">裂</label>
                                <div class="col-sm-10">
                                    <select data-placeholder="请选择" class="form-control chzn-chosen" name="lie">
                                        <option value=""></option>
                                        <#list lie as le>
                                            <option value="${le.label}">${le.label}</option>
                                        </#list>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="inithanxueliang">印章含血面</label>
                                <div class="col-sm-10">
                                    <select data-placeholder="请选择" class="form-control chzn-chosen" name="inithanxueliang">
                                        <option value=""></option>
                                        <#list mian as ma>
                                            <option value="${ma.label}">${ma.label}</option>
                                        </#list>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="hanxuefangshi">含血方式</label>
                                <div class="col-sm-10">
                                    <select data-placeholder="请选择" class="form-control chzn-chosen" name="hanxuefangshi">
                                        <option value=""></option>
                                        <#list hanxuefangshi as hxfs>
                                            <option value="${hxfs.label}">${hxfs.label}</option>
                                        </#list>
                                    </select>
                                </div>
                            </div>

                            <div class="col-sm-2">
                                <button class="btn btn-u btn-u-red">下一步</button>
                            </div>

                            <div class="col-sm-10">
                                <button class="btn btn-u btn-u-default" style="margin-left: 20px">存为草稿</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
    </#if>

    <#if step ==4>
        <!--评估报告-->
        <div class="container margin-bottom-40">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class="row">
                        <form action="${staticPath}/works/addValueReport/0" method="post" class="form-horizontal">
                            <input type="hidden" name="worksId" id="worksId" value="${goodsId}">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">作品名称</label>
                                <div class="col-sm-10">
                                    <input class="form-control" value="${goodsName}" type="text" disabled="disabled"/>
                                </div>
                            </div>

                            <div class="form-control" style="height: 300px;border: dotted #bbb 1px">

                                <div id="zpxx_container" style="height: 200px;">
                                    <p style="padding: 0px;margin: 0px;color: #bbb">请上传详细评估报告</p>

                                </div>
                                <a id="zpxx_img"
                                   style="text-decoration:none;display:block;height: 80px; width: 80px;border: dotted 1px #bbb;">
                                    <p style="color: #bbb;font-size: 10px;margin-bottom: 2px;margin-top: 50px">
                                        上传评估报告</p>
                                    <p style="color: #bbb;font-size: 10px">(只能一张)</p>
                                </a>
                            </div>

                            <div class="form-control" style="margin-top: 50px;height: 300px;border: dotted #bbb 1px">
                                <div id="jzrz_container" style="height: 200px;">
                                    <p style="padding: 0px;margin: 0px;color: #bbb">请上传价值认证报告</p>

                                </div>
                                <a id="jzrz_img" style="text-decoration:none;display:block;height: 80px; width: 80px;border: dotted 1px #bbb;">
                                    <p style="color: #bbb;font-size: 10px;margin-bottom: 2px;margin-top: 50px">
                                        上传价值认证报告</p>
                                    <p style="color: #bbb;font-size: 10px">(最多8张)</p>
                                </a>
                            </div>
                            <div class="form-group" style="margin-top: 10px">
                                <label class="col-sm-3 control-label" for="jzyxsjs">价值有效时间</label>
                                <div class="col-sm-9">
                                    <input class="form-control date-picker" readonly name="jzyxsj" value="" type="text"/>
                                </div>
                            </div>

                            <div class="col-sm-2">
                                <button class="btn btn-u btn-u-red">下一步</button>
                            </div>

                            <div class="col-sm-10">
                                <button class="btn btn-u btn-u-default" style="margin-left: 20px">存为草稿</button>
                            </div>
                        </form>
                    </div>

                </div>

                <div class="col-md-3"></div>
            </div>
        </div>
    </#if >

    <#if step ==5>
        <!--收藏者信息-->
        <div class="container margin-bottom-40">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class="row">
                        <form action="${staticPath}/works/addCollect/0" method="post" class="form-horizontal">
                            <input type="hidden" name="goodsId" id="goodsId" value="${goodsId}">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">作品名称</label>
                                <div class="col-sm-10">
                                    <input class="form-control" name="name" id="name" value="${goodsName}" type="text" disabled="disabled"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">收藏者</label>
                                <div class="col-sm-10">
                                    <input class="form-control" name="name" id="name" type="text"
                                           placeholder="请输入提供者姓名"/>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="collectCardNo">身份证</label>
                                <div class="col-sm-10">
                                    <input class="form-control" name="collectCardNo" id="collectCardNo" type="text"
                                           placeholder="请输入身份证(可不输)"/>
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
                                <label class="col-sm-2 control-label" for="phone">联系方式</label>
                                <div class="col-sm-10">
                                    <input class="form-control" name="phone" id="phone" type="text"
                                           placeholder="请输入联系方式"/>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="datetime">收藏时间</label>
                                <div class="col-sm-10 ">
                                    <input class="form-control date-picker" name="datetime" id="datetime" type="text"
                                           placeholder="请输入收藏时间"/>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">是否公开：</label>
                                <div class="col-sm-4 radio">
                                    <label><input name="pub" value="1" type="radio">是</label>
                                    <label><input name="pub" value="0" type="radio">否</label>
                                </div>
                            </div>


                            <div class="col-sm-2">
                                <button class="btn btn-u btn-u-red">提交审核</button>
                            </div>

                            <div class="col-sm-10">
                                <button class="btn btn-u btn-u-default" style="margin-left: 20px">存为草稿</button>
                            </div>
                        </form>
                    </div>

                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
    </#if >


</div>

</@htmlBody>
<@footerJS>
<script src="${staticPath}/assets/js/upload/upload.js"></script>
<script src="${staticPath}/assets/js/plugins/plupload-2.1.2/js/moxie.js"></script>
<script src="${staticPath}/assets/js/plugins/plupload-2.1.2/js/plupload.dev.js"></script>
<script src="${staticPath}/assets/js/plugins/date-time/bootstrap-datepicker.js"></script>
<script src="${staticPath}/assets/plugins/jquery/jquery.validate.min.js"></script>
<script src="${staticPath}/assets/js/chosen/chosen.jquery.min.js"></script>
</@footerJS>

<script>
    $(document).ready(function () {
        $(".chzn-chosen").chosen();

        $('.date-picker').datepicker({autoclose: true, todayHighlight: true,format:'yyyy-mm-dd'});

        initUploaders("upload_works_info", "windyeel", '${staticPath}/');
        initUploaders_inner("zpxx_img", "windyeel", '${staticPath}/', "zpxx_container", "zpxxImge");
        initUploaders_inner("jzrz_img", "windyeel", '${staticPath}/', "jzrz_container", "jzrzImge");

        var $form = $("#works_info");

        //存为草稿info_btn
        $(".info_btn").bind("click", function () {
            var type = $(this).attr("data-type");
            if (type == 1) {
                $form.attr("action", "${staticPath}/works/addGoodsInfo/1");
            }
            $form.submit();
        });


        $form.validate({
            rules: {
                name: {
                    required: true,
                    maxlength: 30
                },
                provideBy: {
                    required: true,
                    maxlength: 30
                },

                cardNo: {
                    required: true,
                    maxlength: 30
                },
                address: {
                    required: true,
                    maxlength: 30
                },

                contact: {
                    required: true,
                    maxlength: 30
                },

                registerTime: {
                    required: true,
                    maxlength: 30
                },
                description: {
                    required: true,
                    maxlength: 256
                }
            }
//            ,
        <#--submitHandler: function () {-->
        <#--var successUrl = "${staticPath}/works/add";-->
        <#--$.ajax({-->
        <#--url: $form.attr("action"),-->
        <#--type: "post",-->
        <#--data: $form.serialize()+"&isDraft=0",-->
        <#--contentType : "application/x-www-form-urlencoded; charset=utf-8",-->
        <#--dataType: "JSON",-->
        <#--success: function (data) {-->
        <#--if (data.success) {-->
        <#--alert("success");-->
        <#--location.href = successUrl;-->
        <#--} else {-->
        <#--alert(data.msg)-->
        <#--}-->
        <#--}-->
        <#--});-->
        <#--}-->
        })
    });
</script>

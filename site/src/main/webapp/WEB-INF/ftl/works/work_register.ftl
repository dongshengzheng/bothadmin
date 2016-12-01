<#include "../layout/main.ftl"/>

<@htmlHead title="作品详情">
    <link rel="stylesheet" href="${staticPath}/assets/css/jsdd/work/work_detail.css">
    <!-- CSS Page Style -->
    <link rel="stylesheet" href="${staticPath}/assets/css/pages/profile.css">
    <link rel="stylesheet" href="${staticPath}/assets/css/pages/shortcode_timeline2.css">
</@htmlHead>
<@htmlBody>

<div class="wrapper">
    <#if step == 1>
        <!--物品信息-->
        <div class="container margin-bottom-40">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class="row">
                        <form action="#" method="get" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">作品名称</label>
                                <div class="col-sm-10">
                                    <input class="form-control" name="name" id="name" type="text"
                                           placeholder="请输入作品名称"/>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">提供者</label>
                                <div class="col-sm-10">
                                    <input class="form-control" name="provider" id="provider" type="text"
                                           placeholder="请输入提供者"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">身份证</label>
                                <div class="col-sm-10">
                                    <input class="form-control" name="cardNo" id="cardNo" type="text"
                                           placeholder="请输入身份证"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">联系地址</label>
                                <div class="col-sm-10">
                                    <input class="form-control" name="address" id="address" type="text"
                                           placeholder="请输入联系地址"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">联系方式</label>
                                <div class="col-sm-10">
                                    <input class="form-control" name="contact" id="contact" type="text"
                                           placeholder="请输入联系方式"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">登记时间</label>
                                <div class="col-sm-10">
                                    <input class="form-control" name="time" id="time" type="text"
                                           placeholder="请选择登记时间"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">作品描述</label>
                                <div class="col-sm-10">
        <textarea class="form-control" style="resize: none;height: 150px" name="description"
                  id="description" type="text" placeholder="请输入作品描述"></textarea>
                                </div>
                            </div>
                            <!--上传图片-->
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

    <#if step ==2>
        <!--作品信息-->
        <div class="container margin-bottom-40">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class="row">
                        <form action="#" method="get" class="form-horizontal">

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">作品名称</label>
                                <div class="col-sm-10">
                                    <input class="form-control" name="name" id="name" type="text" disabled="disabled"/>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">品种</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="">
                                        <option value="0">请选择品种</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">作品类型</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="">
                                        <option value="0">请选择作品类型</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">尺寸(cm)</label>
                                <div class="col-sm-10">
                                    <div class="row">
                                        <div class="col-sm-4"><input class="form-control" name="" type="text"
                                                                     placeholder="长"/></div>
                                        <div class="col-sm-4"><input class="form-control" name="" type="text"
                                                                     placeholder="宽"/></div>
                                        <div class="col-sm-4"><input class="form-control" name="" type="text"
                                                                     placeholder="高"/></div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">重量(g)</label>
                                <div class="col-sm-10">
                                    <input class="form-control" name="" type="text" placeholder="请输入重量"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">工艺制作</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="">
                                        <option value="0">请选择工艺制作</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">篆刻级别</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="">
                                        <option value="0">请选择篆刻级别</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">矿区地域</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="">
                                        <option value="0">请选择矿区地域</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">制作人</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="请输入制作人">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">制作时间</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="请输入制作时间">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">作品诠释</label>
                                <div class="col-sm-10">
                                <textarea class="form-control" style="resize: none;height: 150px" name="description"
                                          id="description" type="text" placeholder="请输入作品诠释"></textarea>
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
                        <form action="#" method="get" class="form-horizontal">

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">作品名称</label>
                                <div class="col-sm-10">
                                    <input class="form-control" name="name" id="name" type="text" disabled="disabled"/>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">质地一</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="">
                                        <option value="0">请选择</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">质地二</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="">
                                        <option value="0">请选择</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">感官</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="">
                                        <option value="0">请选择</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">磨氏度</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="">
                                        <option value="0">请选择</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">血量</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="">
                                        <option value="0">请选择</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">血色</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="">
                                        <option value="0">请选择</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">血形</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="">
                                        <option value="0">请选择</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">浓艳度</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="">
                                        <option value="0">请选择</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">纯净度</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="">
                                        <option value="0">请选择</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">地色</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="">
                                        <option value="0">请选择</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">活筋</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="">
                                        <option value="0">请选择</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">裂</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="">
                                        <option value="0">请选择</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">印章</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="">
                                        <option value="0">请选择</option>
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
                        <form action="#" method="get" class="form-horizontal">

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">作品名称</label>
                                <div class="col-sm-10">
                                    <input class="form-control" name="name" id="name" type="text" disabled="disabled"/>
                                </div>

                            </div>

                            <div class="form-control" style="height: 100px ;border: solid red 1px">
                                <input type="file" class="form-control" placeholder="请上传评估报告">
                            </div>

                            <div class="form-control" style="height: 100px ;border: solid red 1px">
                                <input type="file" class="form-control" placeholder="请上传价值认证报告">
                            </div>

                            <div class="form-control" style="height: 100px ;border: solid red 1px">
                                <input type="text" class="form-control" placeholder="请选择价值有效时间">
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
                        <form action="#" method="get" class="form-horizontal">

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">作品名称</label>
                                <div class="col-sm-10">
                                    <input class="form-control" name="name" id="name" type="text" disabled="disabled"/>
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
                                <label class="col-sm-2 control-label" for="name">身份证</label>
                                <div class="col-sm-10">
                                    <input class="form-control" name="name" id="name" type="text"
                                           placeholder="请输入身份证(可不输)"/>
                                </div>

                            </div>


                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">联系地址</label>
                                <div class="col-sm-10">
                                    <input class="form-control" name="name" id="name" type="text"
                                           placeholder="请输入联系地址"/>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">联系方式</label>
                                <div class="col-sm-10">
                                    <input class="form-control" name="name" id="name" type="text"
                                           placeholder="请输入联系方式"/>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">收藏时间</label>
                                <div class="col-sm-10">
                                    <input class="form-control" name="name" id="name" type="text"
                                           placeholder="请输入收藏时间"/>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">是否公开：</label>
                                <div class="col-sm-4 radio">
                                    <label><input name="isPublic" type="radio">是</label>
                                    <label><input name="isPublic" type="radio">否</label>
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


</div>

</@htmlBody>
<@footerJS>
</@footerJS>

<script>
    $(document).ready(function () {

    });
</script>

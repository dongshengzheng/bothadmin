<#include "../layout/main.ftl"/>

<@htmlHead title="用户中心">
<link rel="stylesheet" href="${staticPath}/assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">
<link rel="stylesheet" href="${staticPath}/assets/css/jsdd/user/usercenter.css">
</@htmlHead>
<@htmlBody>


<hr/>
<!--content start-->
<div class="row tab-v3">
    <div class="col-sm-3">
        <div class="margin-bottom-40 margin-top-20"
             style="text-align:center;display: table;width: auto;margin-left: auto;margin-right: auto;">
            <img style="height: 140px ;width: 140px;" src="${staticPath}/assets/img/main/img10.jpg">
            <p id="editAvatr"
               style=" background:rgba(0,0,0,.5); position:relative; top:-19px; color:whitesmoke; font-size:12px;">
                点击修头像</p>
        </div>
        <div style="display: table;margin-left: auto ;margin-right: auto;margin-top: -25px;">

            <ul class="nav nav-pills nav-stacked margin-bottom-40" style="">
                <li class="active text-center"><a href="#my-work"
                                                  data-toggle="tab">我的作品</a></li>
                <li class="text-center"><a href="#transfer-work"
                                           data-toggle="tab">转让作品</a>
                </li>
                <li class="text-center"><a href="#colercting-work"
                                           data-toggle="tab">收藏作品</a></li>
                <li class="text-center"><a href="#see-user" data-toggle="tab">
                    关注用户</a>
                </li>
                <li class="text-center"><a href="#integrel"
                                           data-toggle="tab">积分中心</a>
                </li>
                <li class="text-center"><a href="#user-info"
                                           data-toggle="tab">个人资料</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="col-sm-9 margin-top-20">
        <div class="tab-content margin-bottom-40">
            <!--START  我的作品-->
            <div class="tab-pane fade in active" id="my-work">
                <div class="tab-v1" style="">
                    <ul class="nav nav-tabs">
                        <li class="active" style="">
                            <a href="#check-success" data-toggle="tab">审核通过</a>
                        </li>
                        <li>
                            <a href="#check-fail" data-toggle="tab">审核失败</a>
                        </li>
                        <li>
                            <a href="#checking" data-toggle="tab">审核中</a>
                        </li>
                        <li>
                            <a href="#trash" data-toggle="tab">草稿箱</a>
                        </li>
                    </ul>
                    <div class="tab-content" style="background: rgb(254,255,255)">
                        <!--审核通过-->
                        <div class="tab-pane fade in active" id="check-success">
                            <div class="row">

                            </div>
                        </div>
                        <!--审核通过-->
                        <!--审核失败-->
                        <div class="tab-pane fade in" id="check-fail">

                        </div>
                        <!--审核失败-->
                        <!--审核中-->
                        <div class="tab-pane fade in" id="checking">

                        </div>
                        <!--审核中-->
                        <!--草稿箱-->
                        <div class="tab-pane fade in" id="trash">

                        </div>
                        <!--草稿箱-->
                    </div>
                </div>

            </div>
            <!--END  我的作品-->
            <div class="tab-pane fade in" id="transfer-work">
                <img alt="" class="pull-left lft-img-margin img-width-200"
                     src="${staticPath}/assets/img/main/img22.jpg">
                <h4>transfer-work</h4>
                <p>Vivamus imperdiet condimentum diam, eget placerat felis consectetur id. Donec eget orci metus, ac
                    adipiscing nunc. Pellentesque fermentum, ante ac interdum ullamcorper. Donec eget orci metus,
                    <strong>ac adipiscing nunc.</strong> Vivamus imperdiet condimentum diam, eget placerat felis
                    consectetur id. Donec eget orci metus, ac adipiscing nunc. Pellentesque fermentum, ante ac
                    interdum id. Donec eget orci metus, ac adipiscing nunc. Pellentesque fermentum, ante ac interdum
                    ullamcorper. Donec eget orci metus, ac adipiscing nunc. Pellentesque fermentum, ante ac <strong>interdum
                        ullamcorper.</strong></p>
            </div>
            <div class="tab-pane fade in" id="colercting-work">
                <h4>colercting-work</h4>
                <p><img alt="" class="pull-right rgt-img-margin img-width-200"
                        src="${staticPath}/assets/img/main/img13.jpg">
                    <strong>Vivamus imperdiet condimentum diam, eget placerat felis consectetur id.</strong> Donec
                    eget orci metus, Vivamus imperdiet condimentum diam, eget placerat felis consectetur id. Donec
                    eget orci metus, ac adipiscing nunc. Pellentesque fermentum, ante ac interdum ullamcorper. Donec
                    eget orci metus, ac adipiscing nunc. Pellentesque fermentum, consectetur id. Donec eget orci
                    metus, ac adipiscing nunc. <strong>Pellentesque fermentum</strong>, ante ac interdum
                    ullamcorper. Donec eget orci metus, ac adipiscing nunc. Pellentesque fermentum, ante ac interdum
                    ullamcorper.</p>
            </div>
            <div class="tab-pane fade in" id="see-user">
                <div class="row">
                    <div class="col-md-9 " style="margin-top: 20px">
                        <div class="media">
                            <div class="pull-left">
                                <div style="height: 60px;width: 60px;border-radius: 50px;overflow:hidden">
                                    <img class="" src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
                                </div>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">M小路痴M_7132</h4>
                                <p>作品
                                    <span style="margin-left: 10px;color: #FB591D">1509</span>
                                    <span style="margin-left: 10px">|</span>
                                    <span style="margin-left: 10px;">粉丝</span>
                                    <span style="color: #FB591D;margin-left: 10px">126</span>
                                    <span style="float:  right;"><button class="btn btn-default">
                                <i class="glyphicon glyphicon-ok" style="margin-right: 3px"></i>已经关注</button></span>
                                </p>
                                <p>地址
                                    <span style="margin-left: 5px;">江苏</span>
                                    <span style="margin-left: 5px">连云港</span>
                                </p>
                            </div>
                        </div>

                        <hr>

                        <div class="media">
                            <div class="pull-left">
                                <div style="height: 60px;width: 60px;border-radius: 50px;overflow:hidden">
                                    <img class="" src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
                                </div>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">M小路痴M_7132</h4>
                                <p>作品
                                    <span style="margin-left: 10px;color: #FB591D">1509</span>
                                    <span style="margin-left: 10px">|</span>
                                    <span style="margin-left: 10px;">粉丝</span>
                                    <span style="color: #FB591D;margin-left: 10px">126</span>
                                    <span style="float:  right;"><button class="btn btn-default">
                                <i class="glyphicon glyphicon-plus" style="margin-right: 3px"></i>添加关注</button>
                            </span>
                                </p>
                                <p>地址
                                    <span style="margin-left: 5px;">江苏</span>
                                    <span style="margin-left: 5px">连云港</span>
                                </p>
                            </div>
                        </div>

                        <hr>

                        <div class="media">
                            <div class="pull-left">
                                <div style="height: 60px;width: 60px;border-radius: 50px;overflow:hidden">
                                    <img class="" src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
                                </div>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">M小路痴M_7132</h4>
                                <p>作品
                                    <span style="margin-left: 10px;color: #FB591D">1509</span>
                                    <span style="margin-left: 10px">|</span>
                                    <span style="margin-left: 10px;">粉丝</span>
                                    <span style="color: #FB591D;margin-left: 10px">126</span>
                                    <span style="float:  right;"><button class="btn btn-default">
                                <i class="glyphicon glyphicon-plus" style="margin-right: 3px"></i>添加关注</button>
                            </span>
                                </p>
                                <p>地址
                                    <span style="margin-left: 5px;">江苏</span>
                                    <span style="margin-left: 5px">连云港</span>
                                </p>
                            </div>
                        </div>

                        <hr>

                        <div class="media">
                            <div class="pull-left">
                                <div style="height: 60px;width: 60px;border-radius: 50px;overflow:hidden">
                                    <img class="" src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
                                </div>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">M小路痴M_7132</h4>
                                <p>作品
                                    <span style="margin-left: 10px;color: #FB591D">1509</span>
                                    <span style="margin-left: 10px">|</span>
                                    <span style="margin-left: 10px;">粉丝</span>
                                    <span style="color: #FB591D;margin-left: 10px">126</span>
                                    <span style="float:  right;"><button class="btn btn-default">
                                <i class="glyphicon glyphicon-plus" style="margin-right: 3px"></i>添加关注</button>
                            </span>
                                </p>
                                <p>地址
                                    <span style="margin-left: 5px;">江苏</span>
                                    <span style="margin-left: 5px">连云港</span>
                                </p>
                            </div>
                        </div>

                        <hr>

                        <div class="media">
                            <div class="pull-left">
                                <div style="height: 60px;width: 60px;border-radius: 50px;overflow:hidden">
                                    <img class="" src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
                                </div>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">M小路痴M_7132</h4>
                                <p>作品
                                    <span style="margin-left: 10px;color: #FB591D">1509</span>
                                    <span style="margin-left: 10px">|</span>
                                    <span style="margin-left: 10px;">粉丝</span>
                                    <span style="color: #FB591D;margin-left: 10px">126</span>
                                    <span style="float:  right;"><button class="btn btn-default">
                                <i class="glyphicon glyphicon-plus" style="margin-right: 3px"></i>添加关注</button>
                            </span>
                                </p>
                                <p>地址
                                    <span style="margin-left: 5px;">江苏</span>
                                    <span style="margin-left: 5px">连云港</span>
                                </p>
                            </div>
                        </div>

                        <hr>

                        <div class="media">
                            <div class="pull-left">
                                <div style="height: 60px;width: 60px;border-radius: 50px;overflow:hidden">
                                    <img class="" src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
                                </div>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">M小路痴M_7132</h4>
                                <p>作品
                                    <span style="margin-left: 10px;color: #FB591D">1509</span>
                                    <span style="margin-left: 10px">|</span>
                                    <span style="margin-left: 10px;">粉丝</span>
                                    <span style="color: #FB591D;margin-left: 10px">126</span>
                                    <span style="float:  right;"><button class="btn btn-default">
                                <i class="glyphicon glyphicon-plus" style="margin-right: 3px"></i>添加关注</button>
                            </span>
                                </p>
                                <p>地址
                                    <span style="margin-left: 5px;">江苏</span>
                                    <span style="margin-left: 5px">连云港</span>
                                </p>
                            </div>
                        </div>

                        <hr>

                        <div class="media">
                            <div class="pull-left">
                                <div style="height: 60px;width: 60px;border-radius: 50px;overflow:hidden">
                                    <img class="" src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
                                </div>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">M小路痴M_7132</h4>
                                <p>作品
                                    <span style="margin-left: 10px;color: #FB591D">1509</span>
                                    <span style="margin-left: 10px">|</span>
                                    <span style="margin-left: 10px;">粉丝</span>
                                    <span style="color: #FB591D;margin-left: 10px">126</span>
                                    <span style="float:  right;"><button class="btn btn-default">
                                <i class="glyphicon glyphicon-plus" style="margin-right: 3px"></i>添加关注</button>
                            </span>
                                </p>
                                <p>地址
                                    <span style="margin-left: 5px;">江苏</span>
                                    <span style="margin-left: 5px">连云港</span>
                                </p>
                            </div>
                        </div>
                        <hr>
                    </div>
                </div>

            </div>

        <#--积分中心-->
            <div class="tab-pane fade in" id="integrel">
                <div class="heading">
                    <h2 style="margin-bottom: 0px;padding-bottom: 0px">可用积分</h2>
                    <h3 style="color: orangered">0</h3>
                </div>

                <div class="row text-center margin-bottom-40">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <div class="col-md-5">
                            <button class="btn btn-u btn-u-default" data-toggle="modal" data-target=".withdrawModel" style="width: 150px;">提现</button>
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-5">
                            <button class="btn btn-u btn-u-default" data-toggle="modal" data-target=".chargeModel" style="width: 150px;">充值</button>
                        </div>
                    </div>
                    <div class="col-md-2"></div>
                </div>

                <div class="heading heading-v1 margin-bottom-20">
                    <h4 style="color:  #bbb;">积分明细</h4>
                </div>

                <div class="row table">
                    <div class="col-md-3"></div>
                    <div class="col-md-6">
                        <ul class="">
                            <li style="" class="jf_active user_jf_li" data-type="qb">
                                <a href="#quanbu" data-toggle="tab">全部</a>
                            </li>
                            <li class="user_jf_li" data-type="cz">
                                <a href="#chongzhi" data-toggle="tab">充值</a>
                            </li>
                            <li class="user_jf_li" data-type="tx">
                                <a href="#tixian" data-toggle="tab">提现</a>
                            </li>
                            <li class="user_jf_li" data-type="qt">
                                <a href="#qita" data-toggle="tab">其他</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-3"></div>

                </div>
                <#--积分列表-->
                <div id="jf_content">


                </div>
            </div>

        <#--个人资料-->
            <div class="tab-pane fade in" id="user-info">

                <form action="" method="post" class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="name">姓名：</label>
                        <div class="col-sm-4">
                            <input class="form-control" name="name" id="name" type="text" placeholder="请输入姓名"/>
                        </div>

                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">所在城市：</label>
                        <div class="col-sm-4">
                            <div class="row">
                                <div class="col-sm-6">
                                    <select data-placeholder="省份" data-rel="chosen" id="provinceId" name="province"
                                            class="form-control" name="">
                                        <option value="0">请选择</option>
                                        <#if provinceList?? && (provinceList?size >0)>

                                            <#list provinceList as item>
                                                <option value="${item.provinceid}">${item.province}</option>
                                            </#list>


                                        </#if>
                                    </select>

                                </div>
                                <div class="col-sm-6">
                                    <select data-placeholder="城市" data-rel="chosen" name="city" id="cityId"
                                            class="form-control" name="">
                                        <option value="0">请选择</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="contact">联系方式：</label>
                        <div class="col-sm-4">
                            <input class="form-control" name="contact" id="contact" type="text"
                                   placeholder="请输入联系方式"/>
                        </div>

                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="email">Email：</label>
                        <div class="col-sm-4">
                            <input class="form-control" name="email" id="email" type="email"
                                   placeholder="请输入Email"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="cardNo">身份证：</label>
                        <div class="col-sm-4">
                            <input class="form-control" name="cardNo" id="cardNo" type="text" placeholder="请输入身份证"/>
                        </div>
                    </div>

                <#--收藏偏好-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">偏好：</label>
                        <div class="col-sm-4 checkbox">
                            <label><input name="preferences" type="checkbox">玉器</label>
                            <label><input name="preferences" type="checkbox">古玩</label>
                            <label><input name="preferences" type="checkbox">古家具</label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">是否公开：</label>
                        <div class="col-sm-4 radio">
                            <label><input name="isPublic" type="radio">是</label>
                            <label><input name="isPublic" type="radio">否</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-2"></div>
                        <div class="col-sm-4">
                            <button class="btn btn-u btn-u-green" type="submit" style="font-size: 14px;
                                        width: 100%">保存
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Tab v3 -->

</@htmlBody>
<@footerJS>

<script id="qb_jf" type="mustache">
    <div class="container" style="margin-top: 50px">
                            <div class="row margin-bottom-10">
                                <div class="col-md-2 col-md-offset-1">2016-11-29 12:00:00</div>
                                <div class="col-md-5">作品被浏览</div>
                                <div class="col-md-2" style="color: orangered">+1</div>
                            </div>
                            <hr style="height: 0px ;margin: 0px;"/>
                        </div>
                        <div class="container" style="margin-top: 30px">
                            <div class="row margin-bottom-10">
                                <div class="col-md-2 col-md-offset-1">2016-11-29 12:00:00</div>
                                <div class="col-md-5">作品被浏览</div>
                                <div class="col-md-2" style="color: orangered">+1</div>
                            </div>
                            <hr style="height: 0px ;margin: 0px;"/>
                        </div>
                        <div class="container" style="margin-top: 30px">
                            <div class="row margin-bottom-10">
                                <div class="col-md-2 col-md-offset-1">2016-11-29 12:00:00</div>
                                <div class="col-md-5">作品被浏览</div>
                                <div class="col-md-2" style="color: orangered">+1</div>
                            </div>
                            <hr style="height: 0px ;margin: 0px;"/>
                        </div>
                        <div class="container" style="margin-top: 30px">
                            <div class="row margin-bottom-10">
                                <div class="col-md-2 col-md-offset-1">2016-11-29 12:00:00</div>
                                <div class="col-md-5">作品被浏览</div>
                                <div class="col-md-2" style="color: orangered">+1</div>
                            </div>
                            <hr style="height: 0px ;margin: 0px;"/>
                        </div>
                        <div class="container" style="margin-top: 30px">
                            <div class="row margin-bottom-10">
                                <div class="col-md-2 col-md-offset-1">2016-11-29 12:00:00</div>
                                <div class="col-md-5">作品被浏览</div>
                                <div class="col-md-2" style="color: orangered">+1</div>
                            </div>
                            <hr style="height: 0px ;margin: 0px;"/>
                        </div>
</script>

<script id="cz_jf" type="mustache">
    <div class="container" style="margin-top: 50px">
                            <div class="row margin-bottom-10">
                                <div class="col-md-2 col-md-offset-1">2016-11-29 12:00:00</div>
                                <div class="col-md-5">充值送积分</div>
                                <div class="col-md-2" style="color: orangered">+1</div>
                            </div>
                            <hr style="height: 0px ;margin: 0px;"/>
                        </div>
                        <div class="container" style="margin-top: 30px">
                            <div class="row margin-bottom-10">
                                <div class="col-md-2 col-md-offset-1">2016-11-29 12:00:00</div>
                                <div class="col-md-5">充值送积分</div>
                                <div class="col-md-2" style="color: orangered">+1</div>
                            </div>
                            <hr style="height: 0px ;margin: 0px;"/>
                        </div>
                        <div class="container" style="margin-top: 30px">
                            <div class="row margin-bottom-10">
                                <div class="col-md-2 col-md-offset-1">2016-11-29 12:00:00</div>
                                <div class="col-md-5">充值送积分</div>
                                <div class="col-md-2" style="color: orangered">+1</div>
                            </div>
                            <hr style="height: 0px ;margin: 0px;"/>
                        </div>
                        <div class="container" style="margin-top: 30px">
                            <div class="row margin-bottom-10">
                                <div class="col-md-2 col-md-offset-1">2016-11-29 12:00:00</div>
                                <div class="col-md-5">充值送积分</div>
                                <div class="col-md-2" style="color: orangered">+1</div>
                            </div>
                            <hr style="height: 0px ;margin: 0px;"/>
                        </div>
                        <div class="container" style="margin-top: 30px">
                            <div class="row margin-bottom-10">
                                <div class="col-md-2 col-md-offset-1">2016-11-29 12:00:00</div>
                                <div class="col-md-5">充值送积分</div>
                                <div class="col-md-2" style="color: orangered">+1</div>
                            </div>
                            <hr style="height: 0px ;margin: 0px;"/>
                        </div>
</script>

<script id="tx_jf" type="mustache">
    <div class="container" style="margin-top: 50px">
                            <div class="row margin-bottom-10">
                                <div class="col-md-2 col-md-offset-1">2016-11-29 12:00:00</div>
                                <div class="col-md-5">提现送积分</div>
                                <div class="col-md-2" style="color: orangered">+1</div>
                            </div>
                            <hr style="height: 0px ;margin: 0px;"/>
                        </div>
                        <div class="container" style="margin-top: 30px">
                            <div class="row margin-bottom-10">
                                <div class="col-md-2 col-md-offset-1">2016-11-29 12:00:00</div>
                                <div class="col-md-5">提现送积分</div>
                                <div class="col-md-2" style="color: orangered">+1</div>
                            </div>
                            <hr style="height: 0px ;margin: 0px;"/>
                        </div>
</script>

<script id="qt_jf" type="mustache">
    <div class="container" style="margin-top: 50px">
                            <div class="row margin-bottom-10">
                                <div class="col-md-2 col-md-offset-1">2016-11-29 12:00:00</div>
                                <div class="col-md-5">其他送积分</div>
                                <div class="col-md-2" style="color: orangered">+1</div>
                            </div>
                            <hr style="height: 0px ;margin: 0px;"/>
                        </div>
                        <div class="container" style="margin-top: 30px">
                            <div class="row margin-bottom-10">
                                <div class="col-md-2 col-md-offset-1">2016-11-29 12:00:00</div>
                                <div class="col-md-5">其他送积分</div>
                                <div class="col-md-2" style="color: orangered">+1</div>
                            </div>
                            <hr style="height: 0px ;margin: 0px;"/>
                        </div>
</script>
<!-- JS Customization -->

<!--提现积分model-->
<div class="modal fade withdrawModel" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                <h4 id="myLargeModalLabel2" class="modal-title">积分提现</h4>
            </div>
            <div class="modal-body margin-top-20 margin-bottom-50">
                <div class="container">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-2 text-right">
                            <p>请输入提现积分：</p>
                        </div>
                        <div class="col-md-4">
                            <input type="text" id="jifen" class="form-control">
                            <p style="margin-bottom: 0px">预计一个工作日内以红包的形式发放到你的微信账户</p>
                            <p style="color: darkred">请输入0~280提现积分</p>
                            <button class="btn btn-lg" id="withdraw_qr" onclick="aler()" type="button" style="color: white;background: darkred">确认提现</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<!--充值model-->
<div class="modal fade chargeModel" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                <h4 id="myLargeModalLabel2" class="modal-title">积分充值</h4>
            </div>
            <div class="modal-body margin-top-20 margin-bottom-50">
                <div class="container">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-2 text-right">
                            <p>请输入提现积分：</p>
                        </div>
                        <div class="col-md-4">
                            <input type="text" id="jifen" class="form-control">
                            <p style="margin-bottom: 0px">预计一个工作日内以红包的形式发放到你的微信账户</p>
                            <p style="color: darkred">请输入0~280提现积分</p>
                            <button class="btn btn-lg" id="recharge_qr" onclick="aler()" type="button" style="color: white;background: darkred">确认提现</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${staticPath}/assets/js/custom.js"></script>


<script>

    jQuery(document).ready(function () {


        $("#editAvatr").bind("click", function () {
            alert("上传图片")
        });

        /*积分4个tab使用模板绑定*/
        $(".user_jf_li").bind("click", function () {
            $(".user_jf_li").removeClass("jf_active");
            $(this).addClass("jf_active");
            var type = $(this)[0].getAttribute("data-type");
            /*ajax 根据 type 请求相应的积分列表*/
            //4中type模板公用
            if(type == "qb"){
                var qbtpl = $("#qb_jf")[0].innerHTML;
                var html = Mustache.render(qbtpl, {});
                $("#jf_content")[0].innerHTML = "";
                $("#jf_content")[0].innerHTML = html;
            }
            if(type == "cz"){
                var cztpl = $("#cz_jf")[0].innerHTML;
                var html = Mustache.render(cztpl, {});
                $("#jf_content")[0].innerHTML = "";
                $("#jf_content")[0].innerHTML = html;
            }
            if(type == "tx"){
                var txtpl = $("#tx_jf")[0].innerHTML;
                var html = Mustache.render(txtpl, {});
                $("#jf_content")[0].innerHTML = "";
                $("#jf_content")[0].innerHTML = html;
            }

            if(type == "qt"){
                var qttpl = $("#qt_jf")[0].innerHTML;
                var html = Mustache.render(qttpl, {});
                $("#jf_content")[0].innerHTML = "";
                $("#jf_content")[0].innerHTML = html;
            }

        });
//        页面加载时主动触发加载全部积分列表
        $('.jf_active').trigger("click");

        $("#provinceId").change(function () {
            $.get("getCityByProvinceId/" + $("#provinceId").val(), function (data) {
                if (data.status) {
                    var result = "<option>选择城市</option>";
                    $.each(data.cityList, function (n, value) {
                        result += "<option value='" + value.cityid + "'>" + value.city + "</option>";
                    });
                    $("#cityId").html('');
                    $("#cityId").append(result);
                }
            }, "json");
        });

        //积分提现
        $("#withdraw_qr").bind("click",function () {
            alert("提现成功");
        });

        //积分充值
        $("#recharge_qr").bind("click",function () {
            alert("充值成功");
        });

    });
</script>
</@footerJS>

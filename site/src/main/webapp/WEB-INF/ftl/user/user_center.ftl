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
        <div class="tab-content">
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
                <img alt="" class="pull-left lft-img-margin img-width-200"
                     src="${staticPath}/assets/img/main/img10.jpg">
                <h4>see-user</h4>
                <p>Vivamus imperdiet condimentum diam, eget placerat felis consectetur id. Donec eget orci metus, ac
                    adipiscing nunc. Pellentesque fermentum, ante ac interdum ullamcorper. Donec eget orci metus,
                    <strong>ac adipiscing nunc.</strong> Vivamus imperdiet condimentum diam, eget placerat felis
                    consectetur id. Donec eget orci metus, ac adipiscing nunc. Pellentesque fermentum, ante ac
                    interdum id. Donec eget orci metus, ac adipiscing nunc. Pellentesque fermentum, ante ac interdum
                    ullamcorper. Donec eget orci metus, ac adipiscing nunc. Pellentesque fermentum, ante ac <strong>interdum
                        ullamcorper.</strong></p>
            </div>

        <#--积分中心-->
            <div class="tab-pane fade in" id="integrel">
                <#--<div class="row text-center">-->
                    <#--<div class="col-md-3"></div>-->
                    <#--<div class="col-md-6"><h3 style="margin: 0px">可用积分</h3><h3 style="margin: 0px;color: orangered;">0</h3></div>-->
                    <#--<div class="col-md-3"></div>-->
                <#--</div>-->
                <div class="heading">
                    <h2 style="margin-bottom: 0px;padding-bottom: 0px">可用积分</h2>
                    <h3 style="color: orangered">0</h3>
                </div>

                <div class="row text-center">
                    <div class="col-md-5"><p style="float: right;font-size: 15px;width: 100px ;background: gray">提现</p></div>
                    <div class="col-md-2"></div>
                    <div class="col-md-5"><p style="float:left;font-size: 15px;width: 100px ;background: red">充值</p></div>
                </div>

                <div class="heading heading-v1 margin-bottom-20">
                    <h2>积分明细</h2>
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
                        <label class="col-sm-2 control-label" for="city">所在城市：</label>
                        <div class="col-sm-4">
                            <input class="form-control" name="city" id="city" type="text" placeholder="请输入所在城市"/>
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
    <div>
        <p>2016-11-29<span>作品被浏览<span>+1</span></span></p>
        <p>2016-11-29<span>作品被浏览<span>+1</span></span></p>
        <p>2016-11-29<span>作品被浏览<span>+1</span></span></p>
        <p>2016-11-29<span>作品被浏览<span>+1</span></span></p>
        <p>2016-11-29<span>作品被浏览<span>+1</span></span></p>
        <p>2016-11-29<span>作品被浏览<span>+1</span></span></p>
    </div>


</script>
<!-- JS Customization -->
<script type="text/javascript" src="${staticPath}/assets/js/custom.js"></script>


<script>

    jQuery(document).ready(function () {
        $("#editAvatr").bind("click", function () {
            alert("上传图片")
        });

        /*积分4个tab使用模板绑定*/
        $(".user_jf_li").bind("click",function () {
            $(".user_jf_li").removeClass("jf_active");
            $(this).addClass("jf_active");
            var type = $(this)[0].getAttribute("data-type");
            /*ajax 根据 type 请求相应的积分列表*/

            //4中type模板公用
            var qbtpl = $("#qb_jf")[0].innerHTML;
            var html = Mustache.render(qbtpl,{});
            $("#jf_content")[0].innerHTML  = "";
            $("#jf_content")[0].innerHTML  = html;
        });
//        页面加载时主动触发加载全部积分列表
        $('.jf_active').trigger("click");


    });
</script>
</@footerJS>

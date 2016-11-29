<#include "../layout/main.ftl"/>

<@htmlHead title="用户中心">
</@htmlHead>
<@htmlBody>


    <hr/>
    <!--content start-->
    <div class="row tab-v3">
        <div class="col-sm-3">
            <div class="margin-bottom-40 margin-top-20"
                 style="text-align:center;display: table;width: auto;margin-left: auto;margin-right: auto;">
                <img style="height: 140px ;width: 140px;" src="${staticPath}/assets/img/main/img10.jpg">
                <p id="editAvatr" style=" background:rgba(0,0,0,.5); position:relative; top:-19px; color:whitesmoke; font-size:12px;">
                    点击修头像</p>
            </div>
            <div style="display: table;margin-left: auto ;margin-right: auto;margin-top: -25px;">

                <ul class="nav nav-pills nav-stacked margin-bottom-40" style="">
                    <li class="active text-center"><a href="shortcode_accordion_and_tabs.html#my-work"
                                                      data-toggle="tab">我的作品</a></li>
                    <li class="text-center"><a href="shortcode_accordion_and_tabs.html#transfer-work" data-toggle="tab">转让作品</a>
                    </li>
                    <li class="text-center"><a href="shortcode_accordion_and_tabs.html#colercting-work"
                                               data-toggle="tab">收藏作品</a></li>
                    <li class="text-center"><a href="shortcode_accordion_and_tabs.html#see-user" data-toggle="tab">
                        关注用户</a>
                    </li>
                    <li class="text-center"><a href="shortcode_accordion_and_tabs.html#integrel"
                                               data-toggle="tab">积分中心</a>
                    </li>
                    <li class="text-center"><a href="shortcode_accordion_and_tabs.html#user-info"
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
                                <a href="shortcode_accordion_and_tabs.html#check-success" data-toggle="tab">审核通过</a>
                            </li>
                            <li>
                                <a href="shortcode_accordion_and_tabs.html#check-fail" data-toggle="tab">审核失败</a>
                            </li>
                            <li>
                                <a href="shortcode_accordion_and_tabs.html#checking" data-toggle="tab">审核中</a>
                            </li>
                            <li>
                                <a href="shortcode_accordion_and_tabs.html#trash" data-toggle="tab">草稿箱</a>
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
                    <img alt="" class="pull-left lft-img-margin img-width-200" src="${staticPath}/assets/img/main/img22.jpg">
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
                    <p><img alt="" class="pull-right rgt-img-margin img-width-200" src="${staticPath}/assets/img/main/img13.jpg">
                        <strong>Vivamus imperdiet condimentum diam, eget placerat felis consectetur id.</strong> Donec
                        eget orci metus, Vivamus imperdiet condimentum diam, eget placerat felis consectetur id. Donec
                        eget orci metus, ac adipiscing nunc. Pellentesque fermentum, ante ac interdum ullamcorper. Donec
                        eget orci metus, ac adipiscing nunc. Pellentesque fermentum, consectetur id. Donec eget orci
                        metus, ac adipiscing nunc. <strong>Pellentesque fermentum</strong>, ante ac interdum
                        ullamcorper. Donec eget orci metus, ac adipiscing nunc. Pellentesque fermentum, ante ac interdum
                        ullamcorper.</p>
                </div>
                <div class="tab-pane fade in" id="see-user">
                    <img alt="" class="pull-left lft-img-margin img-width-200" src="${staticPath}/assets/img/main/img10.jpg">
                    <h4>see-user</h4>
                    <p>Vivamus imperdiet condimentum diam, eget placerat felis consectetur id. Donec eget orci metus, ac
                        adipiscing nunc. Pellentesque fermentum, ante ac interdum ullamcorper. Donec eget orci metus,
                        <strong>ac adipiscing nunc.</strong> Vivamus imperdiet condimentum diam, eget placerat felis
                        consectetur id. Donec eget orci metus, ac adipiscing nunc. Pellentesque fermentum, ante ac
                        interdum id. Donec eget orci metus, ac adipiscing nunc. Pellentesque fermentum, ante ac interdum
                        ullamcorper. Donec eget orci metus, ac adipiscing nunc. Pellentesque fermentum, ante ac <strong>interdum
                            ullamcorper.</strong></p>
                </div>

                <div class="tab-pane fade in" id="integrel">
                    <img alt="" class="pull-left lft-img-margin img-width-200" src="${staticPath}/assets/img/main/img10.jpg">
                    <h4>integrel</h4>
                    <p>Vivamus imperdiet condimentum diam, eget placerat felis consectetur id. Donec eget orci metus, ac
                        adipiscing nunc. Pellentesque fermentum, ante ac interdum ullamcorper. Donec eget orci metus,
                        <strong>ac adipiscing nunc.</strong> Vivamus imperdiet condimentum diam, eget placerat felis
                        consectetur id. Donec eget orci metus, ac adipiscing nunc. Pellentesque fermentum, ante ac
                        interdum id. Donec eget orci metus, ac adipiscing nunc. Pellentesque fermentum, ante ac interdum
                        ullamcorper. Donec eget orci metus, ac adipiscing nunc. Pellentesque fermentum, ante ac <strong>interdum
                            ullamcorper.</strong></p>
                </div>

                <div class="tab-pane fade in" id="user-info">
                    <img alt="" class="pull-left lft-img-margin img-width-200" src="${staticPath}/assets/img/main/img10.jpg">
                    <h4>user-info</h4>
                    <p>Vivamus imperdiet condimentum diam, eget placerat felis consectetur id. Donec eget orci metus, ac
                        adipiscing nunc. Pellentesque fermentum, ante ac interdum ullamcorper. Donec eget orci metus,
                        <strong>ac adipiscing nunc.</strong> Vivamus imperdiet condimentum diam, eget placerat felis
                        consectetur id. Donec eget orci metus, ac adipiscing nunc. Pellentesque fermentum, ante ac
                        interdum id. Donec eget orci metus, ac adipiscing nunc. Pellentesque fermentum, ante ac interdum
                        ullamcorper. Donec eget orci metus, ac adipiscing nunc. Pellentesque fermentum, ante ac <strong>interdum
                            ullamcorper.</strong></p>
                </div>
            </div>
        </div>
    </div>
    <!-- Tab v3 -->

</@htmlBody>
<@footerJS>
<script>

    jQuery(document).ready(function () {
        $("#editAvatr").bind("click",function () {
            alert("上传图片")
        });
    });
</script>
</@footerJS>

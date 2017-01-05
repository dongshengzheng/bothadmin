<#include "../layout/main.ftl"/>

<@htmlHead title="用户详情">
</@htmlHead>
<@htmlBody>
<!--content start-->
<div class="container">
    <div class="row">
        <div class="col-sm-2"></div>
        <div class="col-sm-8" style="height: 300px;border: 1px solid red">
            <div class="row">
                <div class="col-sm-5"></div>
                <div class="col-sm-7" style=" margin-top: 30px">
                    <div style="height: 80px;width: 80px;border-radius: 50px;overflow:hidden">
                        <#if appUser.headImgUrl?index_of('http')!=-1>
                            <img style="width: 100%" src="${appUser.headImgUrl}" alt=""/>
                        <#else>
                            <img style="width: 100%"
                                 src="http://windyeel.img-cn-shanghai.aliyuncs.com/${appUser.headImgUrl}?x-oss-process=image/resize,m_fill,h_100,w_100"
                                 alt=""/>
                        </#if>
                    </div>
                    <h3 style="margin-top: 15px;margin-left: -8px">${appUser.loginName!}</h3>
                    <p style="margin-left: -25px">作品
                        <span style="margin-left: 5px">${appUser.worksCount!}</span>
                        <span style="margin-left: 20px">粉丝</span>
                        <span style="margin-left: 5px">${appUser.followCount!}</span>
                    </p>
                    <button class="btn-u btn-u-red addFocus" style="margin-left: -25px;width: 150px;margin-top: 30px"
                            data-id="${appUser.id}">
                        <i class="fa fa-plus" style="margin-right: 3px"></i>
                        <span>关注</span>
                    </button>
                </div>
            </div>

        </div>
        <div class="col-sm-2"></div>
    </div>
    <!--<div class="row text-center">-->

    <div class="row">
        <div class="col-sm-2"></div>
        <div class="col-sm-8">

            <div class="tab-v1" style="margin-top: 30px">
                <ul class="nav nav-tabs">
                    <li class="active" style="margin-left: 250px">
                        <a href="#grzl" data-toggle="tab">个人资料</a>
                    </li>
                    <li>
                        <a href="#tdzp" data-toggle="tab">Ta的作品</a>
                    </li>
                    <li>
                        <a href="#tdfs" data-toggle="tab">Ta的粉丝</a>
                    </li>
                </ul>
                <div class="tab-content" style="background: rgb(254,255,255)">
                    <div class="tab-pane fade in active" id="grzl">
                        <div class="row">
                            <div class="col-sm-9" style="margin-top: 10px;margin-left: 20px;">
                                <p style="color: rgb(186,187,188);">姓名：<span
                                        style="color: black">${appUser.name!}</span></p>
                                <p style="color: rgb(186,187,188);">住址：<span
                                        style="color: black">${appUser.address!}</span></p>
                                <p style="color: rgb(186,187,188);">身份证：<span
                                        style="color: black">${appUser.identification!}</span></p>
                                <p style="color: rgb(186,187,188);">手机号：<span
                                        style="color: black">${appUser.phone!}</span></p>
                                <p style="color: rgb(186,187,188);">Email：<span
                                        style="color: black">${appUser.email!}</span></p>
                                <p style="color: rgb(186,187,188);">收藏偏好：<span
                                        style="color: black">${appUser.identification!}</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade in" id="tdzp">
                        <ul class="list-unstyled row portfolio-box" style="margin-top: 10px;">
                            <li class="col-sm-4 md-margin-bottom-50">
                                <a class="thumbnail fancybox" data-rel="gallery" title="Project One"
                                   href="../assets/img/main/img9.jpg">
                                    <img class="full-width img-responsive" src="../assets/img/main/img9.jpg" alt="">
                                    <span class="portfolio-box-in">
                                        <i class="rounded-x icon-magnifier-add"></i>
                                    </span>
                                </a>
                                <div class="headline-left margin-bottom-10"><h3 class="headline-brd">纯手工打造</h3></div>
                                <small class="project-tag"><i class="fa fa-tag"></i><a
                                        href="page_home10.html#">田黄鸡血石</a>, <a href="page_home10.html#">Business</a>
                                </small>
                                <p>鸡血石，星辰沙条带昆凌身价东方拉斯加可浪费</p>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-pane fade in" id="tdfs">

                        <div class="media" style="margin-top: 10px;">
                            <div class="pull-left">
                                <div style="height: 80px;width: 80px;border-radius: 50px;overflow:hidden">
                                    <img class="" src="../assets/img/testimonials/img5.jpg" alt=""/>
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


                    </div>
                </div>
            </div>

        </div>
        <div class="col-sm-2"></div>


    </div>

    <!--</div>-->
</div>
<script>
    //关注
    $(".addFocus").bind("click", function () {
        var thisone = $(this);
        var targetId = thisone.attr('data-id');
        if (thisone.find("span").html() == "关注") {
            $.post("/user/notToHave", {targetId: targetId}, function (data) {
                thisone.find("i").attr("class", "fa fa-check");
                thisone.find("span").html("已关注")
                alert(data);
            });
        } else {
            $.post("/user/haveToNot", {targetId: targetId}, function (data) {
                thisone.find("i").attr("class", "fa fa-plus");
                thisone.find("span").html("关注")
                alert(data);
            });
        }
    });
</script>
        <!--content end-ftl->


</@htmlBody>
<@footerJS>
</@footerJS>

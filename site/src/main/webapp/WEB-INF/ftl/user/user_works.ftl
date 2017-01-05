<#include "../layout/main.ftl"/>

<@htmlHead title="用户中心">
<link rel="stylesheet" href="${staticPath}/assets/css/style.css">
<link rel="stylesheet" href="${staticPath}/assets/css/app.css">
<link rel="stylesheet" href="${staticPath}/assets/css/pages/profile.css">
<link rel="stylesheet" href="${staticPath}/assets/plugins/line-icons/line-icons.css">
</@htmlHead>
<@htmlBody>
<!--=== Profile ===-->
<div class="container content profile">
    <div class="row">
        <!--Left Sidebar-->
        <div class="col-md-3 md-margin-bottom-40">
            <#if Session.siteSessionUser.headImgUrl?index_of('http')!=-1>
                <img class="img-responsive profile-img margin-bottom-20" src="${Session.siteSessionUser.headImgUrl!''}"
                     alt="">
            <#else>
                <img class="img-responsive profile-img margin-bottom-20"
                     src="http://windyeel.img-cn-shanghai.aliyuncs.com/${Session.siteSessionUser.headImgUrl}?x-oss-process=image/resize,m_fill,h_100,w_100"
                     alt="">
            </#if>
            <ul class="list-group sidebar-nav-v1 margin-bottom-40" id="sidebar-nav-1">
                <li class="list-group-item ">
                    <a href="/user"><i class="fa fa-tachometer"></i>面板</a>
                </li>
                <li class="list-group-item active">
                    <a href="/user/works"><i class="fa fa-user"></i> 我的作品</a>
                </li>
                <li class="list-group-item">
                    <a href="/user/transfer"><i class="fa fa-group"></i> 转让作品</a>
                </li>
                <li class="list-group-item">
                    <a href="/user/collect"><i class="fa fa-cubes"></i>收藏作品</a>
                </li>
                <li class="list-group-item">
                    <a href="/user/follow"><i class="fa fa-comments"></i>关注用户</a>
                </li>
                <li class="list-group-item">
                    <a href="/user/integral"><i class="fa fa-history"></i> 积分中心</a>
                </li>
                <li class="list-group-item">
                    <a href="/user/settings"><i class="fa fa-cog"></i> 个人设置</a>
                </li>
            </ul>

            <hr>
            <div class="margin-bottom-50"></div>
            <!--Datepicker-->
            <form action="#" id="sky-form2" class="sky-form">
                <div id="inline-start"></div>
            </form>
            <!--End Datepicker-->
        </div>
        <!--End Left Sidebar-->
        <!-- Profile Content -->
        <div class="col-md-9">
            <div class="profile-body margin-bottom-20">
                <div class="tab-v1">
                    <ul class="nav nav-justified nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#pass">审核通过</a></li>
                        <li><a data-toggle="tab" href="#unpass">审核失败</a></li>
                        <li><a data-toggle="tab" href="#checking">审核中</a></li>
                        <li><a data-toggle="tab" href="#drafts">草稿箱</a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="pass" class="profile-edit tab-pane fade in active">
                            <div class="row" id="passWorks-content">

                            </div>
                            <button id="passBtn" type="button" class="btn-u btn-u-default btn-u-sm btn-block">加载更多
                            </button>
                        </div>
                        <div id="unpass" class="profile-edit tab-pane fade">
                            <div class="row" id="unPassWorks-content">

                            </div>
                            <button id="unPassBtn" type="button" class="btn-u btn-u-default btn-u-sm btn-block">加载更多
                            </button>
                        </div>
                        <div id="checking" class="profile-edit tab-pane fade">
                            <div class="row" id="checkingWorks-content">

                            </div>
                            <button id="checkingBtn" type="button" class="btn-u btn-u-default btn-u-sm btn-block">加载更多
                            </button>
                        </div>
                        <div id="drafts" class="profile-edit tab-pane fade">
                            <div class="row" id="draftsWorks-content">

                            </div>
                            <button id="draftsBtn" type="button" class="btn-u btn-u-default btn-u-sm btn-block">加载更多
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="col-sm-6" id="passWorks" style="display: none">
    <div class="easy-block-v1">
        <a id="pass_works_img" href=""><img class="img-responsive" src="${staticPath}/assets/img/main/img12.jpg" alt=""></a>
        <div class="easy-block-v1-badge rgba-red">Web Design</div>
    </div>
    <div class="headline-left margin-bottom-10">
        <h3 id="pass_works_name" class="headline-brd works-name"></h3>
    </div>
    <small class="project-tag">
        <i class="fa fa-tag"></i>
        <a id="pass_works_des" href="javascript:void(0)"></a>
    </small>
    <p class="pass_works-remarks"></p>
    <div class="projects">
        <h2><a class="color-dark" href="page_profile_projects.html#">Getting Started Photography</a></h2>
        <ul class="list-unstyled list-inline blog-info-v2">
            <li>By: <a class="color-green" href="page_profile_projects.html#">Edward Rooster</a></li>
            <li><i class="fa fa-clock-o"></i> Jan 07, 2013</li>
        </ul>
        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry printing. Donec non dignissim eros.
            Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.</p>
        <br>
    </div>
    <div class="project-share">
        <ul class="list-inline comment-list-v2 pull-left">
            <li><i class="fa fa-eye"></i> <a href="page_profile_projects.html#">25</a></li>
            <li><i class="fa fa-comments"></i> <a href="page_profile_projects.html#">32</a></li>
            <li><i class="fa fa-retweet"></i> <a href="page_profile_projects.html#">77</a></li>
        </ul>
        <ul class="list-inline star-vote pull-right">
            <li><i class="color-green fa fa-star"></i></li>
            <li><i class="color-green fa fa-star"></i></li>
            <li><i class="color-green fa fa-star"></i></li>
            <li><i class="color-green fa fa-star-half-o"></i></li>
            <li><i class="color-green fa fa-star-o"></i></li>
        </ul>
    </div>
</div>
<div class="col-sm-6" id="unPassWorks" style="display: none">
    <div class="easy-block-v1">
        <a id="unPass_works_img" href=""><img class="img-responsive" src="${staticPath}/assets/img/main/img12.jpg"
                                              alt=""></a>
    <#--<div class="easy-block-v1-badge rgba-red">Web Design</div>-->
    </div>
    <div class="headline-left margin-bottom-10">
        <h3 id="unPass_works_name" class="headline-brd works-name"></h3>
    </div>
    <small class="project-tag">
        <i class="fa fa-tag"></i>
        <a id="unPass_works_des" href="javascript:void(0)"></a>
    </small>
    <p class="unPass_works-remarks"></p>
</div>

<div class="col-sm-6" id="checkingWorks" style="display: none">
    <div class="easy-block-v1">
        <a id="checking_works_img" href=""><img class="img-responsive" src="${staticPath}/assets/img/main/img12.jpg"
                                                alt=""></a>
    <#--<div class="easy-block-v1-badge rgba-red">Web Design</div>-->
    </div>
    <div class="headline-left margin-bottom-10">
        <h3 id="checking_works_name" class="headline-brd works-name"></h3>
    </div>
    <small class="project-tag">
        <i class="fa fa-tag"></i>
        <a id="checking_works_des" href="javascript:void(0)"></a>
    </small>
    <p class="checking_works-remarks"></p>


</div>
<div class="col-sm-6" id="draftWorks" style="display: none">
    <div class="easy-block-v1">
        <a id="draft_works_img" href=""><img class="img-responsive" src="${staticPath}/assets/img/main/img12.jpg"
                                             alt=""></a>
    <#--<div class="easy-block-v1-badge rgba-red">Web Design</div>-->
    </div>
    <div class="headline-left margin-bottom-10">
        <h3 id="draft_works_name" class="headline-brd works-name"></h3>
    </div>
    <small class="project-tag">
        <i class="fa fa-tag"></i>
        <a id="draft_works_des" href="javascript:void(0)"></a>
    </small>
    <p class="draft_works-remarks"></p>
<#--<div class="projects">-->
<#--<h2><a class="color-dark" href="page_profile_projects.html#">Getting Started Photography</a></h2>-->
<#--<ul class="list-unstyled list-inline blog-info-v2">-->
<#--<li>By: <a class="color-green" href="page_profile_projects.html#">Edward Rooster</a></li>-->
<#--<li><i class="fa fa-clock-o"></i> Jan 07, 2013</li>-->
<#--</ul>-->
<#--<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry printing. Donec non dignissim eros.-->
<#--Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.</p>-->
<#--<br>-->
<#--</div>-->
<#--<div class="project-share">-->
<#--<ul class="list-inline comment-list-v2 pull-left">-->
<#--<li><i class="fa fa-eye"></i> <a href="page_profile_projects.html#">25</a></li>-->
<#--<li><i class="fa fa-comments"></i> <a href="page_profile_projects.html#">32</a></li>-->
<#--<li><i class="fa fa-retweet"></i> <a href="page_profile_projects.html#">77</a></li>-->
<#--</ul>-->
<#--<ul class="list-inline star-vote pull-right">-->
<#--<li><i class="color-green fa fa-star"></i></li>-->
<#--<li><i class="color-green fa fa-star"></i></li>-->
<#--<li><i class="color-green fa fa-star"></i></li>-->
<#--<li><i class="color-green fa fa-star-half-o"></i></li>-->
<#--<li><i class="color-green fa fa-star-o"></i></li>-->
<#--</ul>-->
<#--</div>-->
</div>

</@htmlBody>
<@footerJS>
<script>
    //作品通过
    pagePassIndex = 1;
    passHasMore = true;
    //审核失败
    pageUnPassIndex = 1;
    unPassHasMore = true;
    //审核中
    checkingIndex = 1;
    checkingHasMore = true;
    //草稿
    draftsIndex = 1;
    draftsHasMore = true;

    $(document).ready(function () {
        loadPass(1);
        loadUnPass(1);
        loadChecking(1);
        loadDrafts(1);
        //审核通过
        function loadPass(pagePassIndex) {
            $.get("/user/works_load/3", {pageIndex: pagePassIndex}, function (data) {
                if (pagePassIndex >= data.pages) {
                    // 数据加载完毕了
                    $("#passBtn").html("客官，这次真没了");
                    passHasMore = false;
                }
                $.each(data.records, function () {
                    var $li = $("#passWorks").clone();
                    $li.removeAttr("id").css("display", "block");
                    $li.find(".img-responsive").attr("src", "http://windyeel.img-cn-shanghai.aliyuncs.com/" + this.images + "?x-oss-process=image/resize,m_fill,h_331,w_525");
                    $li.find("#pass_works_des").html(this.breed);
                    $li.find("#pass_works_name").html(this.name);
                    $li.find("#pass_works_img").attr("href", "${staticPath}/works/detail/" + this.id);
                    $("#passWorks-content").append($li);
                });


            });
        }

        $("#passBtn").on("click", function () {
            if (passHasMore) {
                pagePassIndex++;
                loadPass(pagePassIndex);
            }
        });

        //审核未通过
        function loadUnPass(pageUnPassIndex) {
            $.get("/user/works_load/2", {pageIndex: pageUnPassIndex}, function (data) {
                if (pageUnPassIndex >= data.pages) {
                    // 数据加载完毕了
                    $("#unPassBtn").html("客官，这次真没了");
                    unPassHasMore = false;
                }
                $.each(data.records, function () {
                    var $li = $("#unPassWorks").clone();
                    $li.removeAttr("id").css("display", "block");
                    $li.find(".img-responsive").attr("src", "http://windyeel.img-cn-shanghai.aliyuncs.com/" + this.images + "?x-oss-process=image/resize,m_fill,h_331,w_525");
                    $li.find("#unPass_works_des").html(this.breed);
                    $li.find("#unPass_works_name").html(this.name);
                    $li.find("#unPass_works_img").attr("href", "${staticPath}/works/detail/" + this.id);
                    $("#unPassWorks-content").append($li);
                });
            });
        }

        $("#unPassBtn").on("click", function () {
            if (unPassHasMore) {
                pageUnPassIndex++;
                loadUnPass(pageUnPassIndex);
            }
        });


        //审核中
        function loadChecking(checkingIndex) {
            $.get("/user/works_load/1", {pageIndex: checkingIndex}, function (data) {
                if (checkingIndex >= data.pages) {
                    // 数据加载完毕了
                    $("#checkingBtn").html("客官，这次真没了");
                    checkingHasMore = false;
                }
                $.each(data.records, function () {
                    var $li = $("#checkingWorks").clone();
                    $li.removeAttr("id").css("display", "block");
                    $li.find(".img-responsive").attr("src", "http://windyeel.img-cn-shanghai.aliyuncs.com/" + this.images + "?x-oss-process=image/resize,m_fill,h_331,w_525");
                    $li.find("#checking_works_des").html(this.breed);
                    $li.find("#checking_works_name").html(this.name);
                    $li.find("#checking_works_img").attr("href", "${staticPath}/works/detail/" + this.id);
                    $("#checkingWorks-content").append($li);
                });
            });
        }

        $("#checkingBtn").on("click", function () {
            if (checkingHasMore) {
                checkingIndex++;
                loadChecking(checkingIndex);
            }
        });

        //草稿
        function loadDrafts(draftsIndex) {
            $.get("/user/works_load/0", {pageIndex: draftsIndex}, function (data) {
                if (draftsIndex >= data.pages) {
                    // 数据加载完毕了
                    $("#draftsBtn").html("客官，这次真没了");
                    draftsHasMore = false;
                }
                $.each(data.records, function () {
                    var $li = $("#draftWorks").clone();
                    $li.removeAttr("id").css("display", "block");
                    $li.find(".img-responsive").attr("src", "http://windyeel.img-cn-shanghai.aliyuncs.com/" + this.images + "?x-oss-process=image/resize,m_fill,h_331,w_525");
                    $li.find("#draft_works_des").html(this.breed);
                    $li.find("#draft_works_name").html(this.name);
                    $li.find("#draft_works_img").attr("href", "${staticPath}/works/detail/" + this.id);
                    $("#draftsWorks-content").append($li);
                });
            });
        }

        $("#draftsBtn").on("click", function () {
            if (draftsHasMore) {
                draftsIndex++;
                loadDrafts(draftsIndex);
            }
        });
    });
</script>
</@footerJS>

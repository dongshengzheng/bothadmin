<#include "../layout/main.ftl"/>

<@htmlHead title="用户中心">
<link rel="stylesheet" href="${staticPath}/assets/css/style.css">
<link rel="stylesheet" href="${staticPath}/assets/css/pages/profile.css">
<link rel="stylesheet" href="${staticPath}/assets/plugins/line-icons/line-icons.css">
</@htmlHead>
<@htmlBody>
<!--=== Profile ===-->
<div class="container content profile">
    <div class="row">
        <!--Left Sidebar-->
        <div class="col-md-3 md-margin-bottom-40">
            <img onerror="nofind(2)" class="img-responsive profile-img margin-bottom-20"
                <#if Session.siteSessionUser.headImgUrl!?index_of('http')!=-1>
                 src="${Session.siteSessionUser.headImgUrl!}"
                <#else>
                 src="http://windyeel.img-cn-shanghai.aliyuncs.com/${Session.siteSessionUser.headImgUrl!}?x-oss-process=image/resize,m_fill,h_100,w_100"
                </#if>
                 alt="">
            <ul class="list-group sidebar-nav-v1 margin-bottom-40" id="sidebar-nav-1">
                <#--<li class="list-group-item ">-->
                    <#--<a href="/user"><i class="fa fa-tachometer"></i>面板</a>-->
                <#--</li>-->
                <li class="list-group-item">
                    <a href="/user/works"><i class="fa fa-user"></i> 我的作品</a>
                </li>
                <li class="list-group-item">
                    <a href="/user/transfer"><i class="fa fa-group"></i> 转让作品</a>
                </li>
                <li class="list-group-item active">
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
                        <li class="active"><a data-toggle="tab">收藏作品</a></li>
                    </ul>
                    <div class="profile-edit tab-pane fade in active">
                        <div id="collect-content" class="row">
                        </div>
                    </div>
                    <button id="collectBtn" type="button" class="btn-u btn-u-default btn-u-sm btn-block">加载更多
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="collect_works" style="display: none" class="col-sm-6">
    <div class="service-or easy-block-v2 no-margin-bottom">
        <a id="" href=""><img onerror="nofind(1)" class="works-image img-responsive" src="" alt=""></a>
    <#--<div id="works_name" class="easy-bg-v2 rgba-blue">Nokia</div>-->
    </div>
    <div class="headline-left margin-bottom-10">
        <h3 id="works_name" class="headline-brd works-name"></h3>
    </div>
    <small class="project-tag">
        <i class="fa fa-tag"></i>
        <a id="works_des" href="javascript:void(0)"></a>
    </small>
    <p class="works-remarks"></p>
<#--<div class="projects">-->
<#--<h2><a class="color-dark" href="page_profile_projects.html#">Getting Started Photography</a></h2>-->
<#--<ul class="list-unstyled list-inline blog-info-v2">-->
<#--<li>By: <a class="color-green" href="page_profile_projects.html#">Edward Rooster</a></li>-->
<#--<li><i class="fa fa-clock-o"></i> Jan 07, 2013</li>-->
<#--</ul>-->
<#--<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry printing. Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.</p>-->
<#--<br>-->
<#--</div>-->
<#--<div class="project-share">-->
<#--<ul class="list-inline comment-list-v2 pull-left">-->
<#--<li><i class="fa fa-eye"></i> <a href="page_profile_projects.html#">45</a></li>-->
<#--<li><i class="fa fa-comments"></i> <a href="page_profile_projects.html#">90</a></li>-->
<#--<li><i class="fa fa-retweet"></i> <a href="page_profile_projects.html#">84</a></li>-->
<#--</ul>-->
<#--<ul class="list-inline star-vote pull-right">-->
<#--<li><i class="color-green fa fa-star"></i></li>-->
<#--<li><i class="color-green fa fa-star"></i></li>-->
<#--<li><i class="color-green fa fa-star"></i></li>-->
<#--<li><i class="color-green fa fa-star"></i></li>-->
<#--<li><i class="color-green fa fa-star-half-o"></i></li>-->
<#--</ul>-->
<#--</div>-->
</div>

</@htmlBody>
<@footerJS>
<script>
    pageIndex = 1;
    hasMore = true;
    $(document).ready(function () {
        load(1);
        function load(pageIndex) {
            $.get("/user/collect_load", {pageIndex: pageIndex}, function (data) {
                if (pageIndex >= data.pages) {
                    // 数据加载完毕了
                    $("#collectBtn").html("客官，这次真没了");
                    hasMore = false;
                }
                $.each(data.records, function () {
                    var $li = $("#collect_works").clone();
                    $li.removeAttr("id").css("display", "block");
                    $li.find(".works-image").attr("src", "http://windyeel.img-cn-shanghai.aliyuncs.com/" + this.works.images + "?x-oss-process=image/resize,m_fill,h_331,w_525");
                    $li.find("#works_des").html(this.works.breed);
                    $li.find("#works_name").html(this.works.name);
                    $li.find("#works_img").attr("href", "${staticPath}/works/detail/" + this.works.id);
                    $("#collect-content").append($li);
                });
            });
        }

        $("#collectBtn").on("click", function () {
            if (hasMore) {
                pageIndex++;
                load(pageIndex);
            }
        })
    });
</script>
</@footerJS>

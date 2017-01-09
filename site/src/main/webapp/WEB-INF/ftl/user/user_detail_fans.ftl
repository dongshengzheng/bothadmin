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
                <#if (appUser.headImgUrl)!?index_of('http')!=-1>
                 src="${(appUser.headImgUrl)!}"
                <#else>
                 src="http://windyeel.img-cn-shanghai.aliyuncs.com/${(appUser.headImgUrl)!}?x-oss-process=image/resize,m_fill,h_100,w_100"
                </#if>
                 alt="">
            <ul class="list-group sidebar-nav-v1 margin-bottom-40" id="sidebar-nav-1">
                <li class="list-group-item">
                    <a href="/user/detail?userId=${appUser.id}"><i class="fa fa-tachometer"></i>面板</a>
                </li>
                <li class="list-group-item">
                    <a href="/user/detail/info?userId=${appUser.id}"><i class="fa fa-user"></i>Ta的资料</a>
                </li>
                <li class="list-group-item">
                    <a href="/user/detail/works?userId=${appUser.id}"><i class="fa fa-group"></i>Ta的作品</a>
                </li>
                <li class="list-group-item active">
                    <a href="/user/detail/fans?userId=${appUser.id}"><i class="fa fa-cubes"></i>Ta的粉丝</a>
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
                        <li class="active"><a data-toggle="tab" href="page_profile_settings.html#profile">Ta的粉丝</a>
                        </li>
                    </ul>
                    <!--Profile Blog-->
                    <div id="user_content" class="row margin-bottom-20">

                    </div><!--/end row-->
                </div>
            </div>
            <button id="fansButton" type="button" class="btn-u btn-u-default btn-block text-center btn-more">加载更多
            </button>
        </div>
    </div>
</div>

<div id="user_temp" style="display: none;" class="col-sm-6">
    <div class="profile-blog">
        <img id="user_avatar" onerror="nofind(2)" class="rounded-x" src="" alt="">
        <div class="name-location">
            <strong id="user_name">Natasha Kolnikova</strong>
            <span> <i class="fa fa-map-marker"></i>
                <span id="user_address" href="page_profile_users.html#">江苏省苏州市</span>
            </span>
        </div>
        <div class="clearfix margin-bottom-20"></div>
        <hr>
        <ul class="list-inline share-list">
            <li><p>作品<span id="works_count" style="margin-left: 5px;color: #E05E3F">223</span></p></li>
            <li><p>粉丝<span id="follower_count" style="margin-left: 5px;color: #E05E3F;">223</span></p></li>
            <li><i class="fa fa-share"></i><a href="page_profile_users.html#">关注</a></li>
        </ul>
    </div>
</div>

</@htmlBody>
<@footerJS>

<script>
    pageIndex = 1;
    pageSize = 6;
    hasMore = true;

    $(document).ready(function () {
        load(1, 6);
        function load(pageIndex, pageSize) {
            $.get("/user/detail/fans_load", {
                userId:${appUser.id},
                pageIndex: pageIndex,
                pageSize: pageSize
            }, function (data) {
                if (pageSize > data.length) {
                    // 数据加载完毕了
                    $("#fansButton").html("客观，这次真没了");
                    hasMore = false;
                }
                $.each(data, function () {
                    var $li = $("#user_temp").clone();
                    $li.removeAttr("id").css("display", "block");
                    if (this.headImgUrl.indexOf('http') != -1) {
                        $li.find("#user_avatar").attr("src", this.headImgUrl);
                    } else {
                        $li.find("#user_avatar").attr("src", "http://windyeel.img-cn-shanghai.aliyuncs.com/" + this.headImgUrl + "?x-oss-process=image/resize,m_fill,h_331,w_525");
                    }
                    $li.find("#follower_count").html(this.followCount);
                    $li.find("#works_count").html(this.worksCount);
                    $li.find("#user_address").html(this.address);
                    $li.find("#user_name").html(this.loginName);
                    $("#user_content").append($li);
                });
            });
        }

        $("#fanButton").on("click", function () {
            if (hasMore) {
                pageIndex++;
                load(pageIndex, pageSize);
            }
        })
    });
</script>
</@footerJS>

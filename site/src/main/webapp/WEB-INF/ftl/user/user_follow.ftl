<#include "../layout/main.ftl"/>

<@htmlHead title="用户中心">
<link rel="stylesheet" href="${staticPath}/assets/css/style.css">
<link rel="stylesheet" href="${staticPath}/assets/css/pages/profile.css">
<link rel="stylesheet" href="${staticPath}/assets/plugins/line-icons/line-icons.css">
<script type="text/javascript">
    //    function imgError() {
    //        $(this).attr("src","http://windyeel.oss-cn-shanghai.aliyuncs.com/global/img/default.png")
    //    }

</script>
</@htmlHead>
<@htmlBody>
<!--=== Profile ===-->
<div class="container content profile">
    <div class="row">
        <!--Left Sidebar-->
        <div class="col-md-3 md-margin-bottom-40">
            <img onerror="nofind(2)" class="img-responsive profile-img margin-bottom-20"
                <#if Session.siteSessionUser.headImgUrl?index_of('http')!=-1>
                 src="${Session.siteSessionUser.headImgUrl!''}"
                <#else>
                 src="http://windyeel.img-cn-shanghai.aliyuncs.com/${Session.siteSessionUser.headImgUrl}?x-oss-process=image/resize,m_fill,h_100,w_100"
                </#if>
                 alt="">
            <ul class="list-group sidebar-nav-v1 margin-bottom-40" id="sidebar-nav-1">
                <li class="list-group-item ">
                    <a href="/user"><i class="fa fa-tachometer"></i>面板</a>
                </li>
                <li class="list-group-item">
                    <a href="/user/works"><i class="fa fa-user"></i> 我的作品</a>
                </li>
                <li class="list-group-item">
                    <a href="/user/transfer"><i class="fa fa-group"></i> 转让作品</a>
                </li>
                <li class="list-group-item">
                    <a href="/user/collect"><i class="fa fa-cubes"></i>收藏作品</a>
                </li>
                <li class="list-group-item active">
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
                <!--Profile Blog-->
                <div id="user_content" class="row margin-bottom-20">

                </div><!--/end row-->
            </div>
            <button type="button" class="btn-u btn-u-default btn-block text-center btn-more">加载更多</button>
        </div>
    </div>
</div>


<div id="user_temp" style="display: none;" class="col-sm-6">
    <div class="profile-blog">
        <img id="user_avatar" onerror="nofind()" class="rounded-x" src="" alt="">
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
    hasMore = true;

    $(document).ready(function () {
        load(1);
        function load(pageIndex) {
            $.get("/user/follow_load", {pageIndex: pageIndex}, function (data) {
                if (pageIndex >= data.pages) {
                    // 数据加载完毕了
                    $(".btn-more").html("客观，这次真没了");
                    hasMore = false;
                }
                $.each(data.records, function () {
                    var $li = $("#user_temp").clone();
                    $li.removeAttr("id").css("display", "block");

                    if (this.appUser.headImgUrl.indexOf('http') != -1) {
                        $li.find("#user_avatar").attr("src", this.appUser.headImgUrl);
                    } else {
                        $li.find("#user_avatar").attr("src", "http://windyeel.img-cn-shanghai.aliyuncs.com/" + this.appUser.headImgUrl + "?x-oss-process=image/resize,m_fill,h_331,w_525");
                    }
                    $li.find("#follower_count").html(this.appUser.followCount);
                    $li.find("#works_count").html(this.appUser.worksCount);
                    $li.find("#user_address").html(this.appUser.address);
                    $li.find("#user_name").html(this.appUser.loginName);
                    $("#user_content").append($li);
                });
            });
        }

        $(".btn-more").on("click", function () {
            if (hasMore) {
                pageIndex++;
                load(pageIndex);
            }
        })
    });
</script>
</@footerJS>

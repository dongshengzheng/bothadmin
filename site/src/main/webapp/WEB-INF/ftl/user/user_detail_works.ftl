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
            <#--<li class="list-group-item">-->
            <#--<a href="/user/detail?userId=${appUser.id}"><i class="fa fa-tachometer"></i>面板</a>-->
            <#--</li>-->
                <li class="list-group-item active">
                    <a href="/user/detail/works?userId=${appUser.id}"><i class="fa fa-group"></i>Ta的作品</a>
                </li>
                <li class="list-group-item">
                    <a href="/user/detail/info?userId=${appUser.id}"><i class="fa fa-user"></i>Ta的资料</a>
                </li>
                <li class="list-group-item">
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
                    <ul class="nav nav-justified nav-tabs margin-bottom-20">
                        <li class="active"><a data-toggle="tab" href="page_profile_settings.html#profile">Ta的作品</a>
                        </li>
                    </ul>
                    <!--Profile Blog-->
                    <div id="works-content" class="row margin-bottom-20">

                    </div><!--/end row-->
                </div>
            </div>
            <button id="worksButton" type="button" class="btn-u btn-u-default btn-block text-center btn-more">加载更多
            </button>
        </div>
    </div>
</div>


<div id="works-temp" style="display: none" class="col-sm-6">
    <div class="service-or easy-block-v2 no-margin-bottom">
        <a id="works_img" href=""><img onerror="nofind(1)" class="img-responsive works-image" src="" alt=""></a>
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
</div>

</@htmlBody>
<@footerJS>
<script>
    pageIndex = 1;
    hasMore = true;
    $(document).ready(function () {
        load(1);
        function load(pageIndex) {
            $.get("/user/detail/works_load", {userId:${appUser.id}, pageIndex: pageIndex}, function (data) {
                if (pageIndex >= data.pages) {
                    // 数据加载完毕了
                    $("#worksButton").html("客官，这次真没了");
                    hasMore = false;
                }
                $.each(data.records, function () {
                    var $li = $("#works-temp").clone();
                    $li.removeAttr("id").css("display", "block");
                    $li.find(".works-image").attr("src", "http://windyeel.img-cn-shanghai.aliyuncs.com/" + this.images + "?x-oss-process=image/resize,m_fill,h_331,w_525");
                    $li.find("#works_des").html(this.breed);
                    $li.find("#works_name").html(this.name);
                    $li.find("#works_img").attr("href", "${staticPath}/works/detail/" + this.id);
                    $("#works-content").append($li);
                });
            });
        }

        $("#worksButton").on("click", function () {
            if (hasMore) {
                pageIndex++;
                load(pageIndex);
            }
        })
    });
</script>
</@footerJS>

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
                <#if Session.siteSessionUser.headImgUrl?index_of('http')!=-1>
                 src="${Session.siteSessionUser.headImgUrl!''}"
                <#else>
                 src="http://windyeel.img-cn-shanghai.aliyuncs.com/${Session.siteSessionUser.headImgUrl}?x-oss-process=image/resize,m_fill,h_100,w_100"
                </#if>
                 alt="">
            <ul class="list-group sidebar-nav-v1 margin-bottom-40" id="sidebar-nav-1">
                <li class="list-group-item active">
                    <a href="/user/detail?userId=${(appUser.id)!''}"><i class="fa fa-tachometer"></i>面板</a>
                </li>
                <li class="list-group-item">
                    <a href="/user/detail/info?userId=${(appUser.id)!''}"><i class="fa fa-user"></i>Ta的资料</a>
                </li>
                <li class="list-group-item">
                    <a href="/user/detail/works?userId=${(appUser.id)!''}"><i class="fa fa-group"></i>Ta的作品</a>
                </li>
                <li class="list-group-item">
                    <a href="/user/detail/fans?userId=${(appUser.id)!''}"><i class="fa fa-cubes"></i>Ta的粉丝</a>
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
            <div class="profile-body"></div>
        </div>
    </div>
</div>

</@htmlBody>
<@footerJS>
</@footerJS>

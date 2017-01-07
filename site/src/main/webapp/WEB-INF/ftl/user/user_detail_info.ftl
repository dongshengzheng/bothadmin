<#include "../layout/main.ftl"/>

<@htmlHead title="用户中心">
<link rel="stylesheet" href="${staticPath}/assets/css/style.css">
<link rel="stylesheet" href="${staticPath}/assets/css/pages/profile.css">
<link rel="stylesheet" href="${staticPath}/assets/plugins/line-icons/line-icons.css">

<link rel="stylesheet" href="${staticPath}/assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
<link rel="stylesheet" href="${staticPath}/assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">

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
                <li class="list-group-item">
                    <a href="/user/detail?userId=${appUser.id}"><i class="fa fa-tachometer"></i>面板</a>
                </li>
                <li class="list-group-item active">
                    <a href="/user/detail/info?userId=${appUser.id}"><i class="fa fa-user"></i>Ta的资料</a>
                </li>
                <li class="list-group-item">
                    <a href="/user/detail/works?userId=${appUser.id}"><i class="fa fa-group"></i>Ta的作品</a>
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
                    <ul class="nav nav-justified nav-tabs">
                        <li class="active"><a data-toggle="tab" href="page_profile_settings.html#profile">Ta的资料</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="profile" class="profile-edit tab-pane fade in active">
                            <br>
                            <form id="userInfo-form" class="sky-form" id="sky-form4"
                                  action="${staticPath}/user/updateUserInfo/1" method="post">
                                <dl class="dl-horizontal">
                                    <dt>姓名</dt>
                                    <dd>
                                        <section>
                                            <label class="input">
                                                <i class="icon-append fa fa-user"></i>
                                                <input disabled type="text" placeholder="暂无姓名信息" name="name"
                                                       value="${(appUser.name)!}">
                                            </label>
                                        </section>
                                    </dd>
                                    <dt>邮箱地址</dt>
                                    <dd>
                                        <section>
                                            <label class="input">
                                                <i class="icon-append fa fa-envelope"></i>
                                                <input disabled type="email" name="email" placeholder="暂无邮箱地址信息"
                                                       value="${(appUser.email)!}">
                                            </label>
                                        </section>
                                    </dd>
                                    <dt>详细地址</dt>
                                    <dd>
                                        <section>
                                            <label class="input">
                                                <i class="icon-append fa fa-location-arrow"></i>
                                                <input disabled type="text" name="address" placeholder="暂无详细地址信息"
                                                       value="${(appUser.address)!}">
                                            </label>
                                        </section>
                                    </dd>
                                    <dt>联系方式</dt>
                                    <dd>
                                        <section>
                                            <label class="input">
                                                <i class="icon-append fa fa-phone"></i>
                                                <input disabled type="text" name="phone" placeholder="暂无联系方式信息"
                                                       value="${(appUser.phone)!}">
                                            </label>
                                        </section>
                                    </dd>
                                    <dt>身份证</dt>
                                    <dd>
                                        <section>
                                            <label class="input">
                                                <i class="icon-append fa fa-lock"></i>
                                                <input disabled type="text" name="identification" placeholder="暂无身份证信息"
                                                       value="${(appUser.identification)!}">
                                            </label>
                                        </section>
                                    </dd>
                                    <dt>收藏偏好</dt>
                                    <dd>
                                        <section>
                                            <div class="inline-group">
                                                <#list preference as item>
                                                    <label class="checkbox">
                                                        <input disabled type="checkbox"
                                                            <#list pre as sel>
                                                                <#if sel == item.value>
                                                               checked="checked"
                                                                </#if>
                                                            </#list>
                                                               value="${item.value}" name="prefer">
                                                        <i class="rounded-x"></i>${item.label}</label>
                                                </#list>
                                            </div>
                                        </section>
                                    </dd>
                                </dl>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</@htmlBody>
<@footerJS>
</@footerJS>

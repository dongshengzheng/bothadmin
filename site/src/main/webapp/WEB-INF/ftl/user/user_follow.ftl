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
            <img class="img-responsive profile-img margin-bottom-20" src="${staticPath}/assets/img/team/img32-md.jpg" alt="">

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
                <div class="row margin-bottom-20">
                    <div class="col-sm-6 sm-margin-bottom-20">
                        <div class="profile-blog">
                            <img class="rounded-x" src="${staticPath}/assets/img/testimonials/img1.jpg" alt="">
                            <div class="name-location">
                                <strong>Mikel Andrews</strong>
                                <span><i class="fa fa-map-marker"></i><a href="page_profile_users.html#">California,</a> <a href="page_profile_users.html#">US</a></span>
                            </div>
                            <div class="clearfix margin-bottom-20"></div>
                            <p>Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.</p>
                            <hr>
                            <ul class="list-inline share-list">
                                <li><i class="fa fa-bell"></i><a href="page_profile_users.html#">12 Notifications</a></li>
                                <li><i class="fa fa-group"></i><a href="page_profile_users.html#">54 Followers</a></li>
                                <li><i class="fa fa-share"></i><a href="page_profile_users.html#">Share</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="profile-blog">
                            <img class="rounded-x" src="${staticPath}/assets/img/testimonials/user.jpg" alt="">
                            <div class="name-location">
                                <strong>Natasha Kolnikova</strong>
                                <span><i class="fa fa-map-marker"></i><a href="page_profile_users.html#">Moscow,</a> <a href="page_profile_users.html#">Russia</a></span>
                            </div>
                            <div class="clearfix margin-bottom-20"></div>
                            <p>Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.</p>
                            <hr>
                            <ul class="list-inline share-list">
                                <li><i class="fa fa-bell"></i><a href="page_profile_users.html#">37 Notifications</a></li>
                                <li><i class="fa fa-group"></i><a href="page_profile_users.html#">46 Followers</a></li>
                                <li><i class="fa fa-share"></i><a href="page_profile_users.html#">Share</a></li>
                            </ul>
                        </div>
                    </div>
                </div><!--/end row-->
                <!--End Profile Blog-->

                <!--Profile Blog-->
                <div class="row margin-bottom-20">
                    <div class="col-sm-6 sm-margin-bottom-20">
                        <div class="profile-blog">
                            <img class="rounded-x" src="${staticPath}/assets/img/testimonials/img2.jpg" alt="">
                            <div class="name-location">
                                <strong>Sasha Elli</strong>
                                <span><i class="fa fa-map-marker"></i><a href="page_profile_users.html#">California,</a> <a href="page_profile_users.html#">US</a></span>
                            </div>
                            <div class="clearfix margin-bottom-20"></div>
                            <p>Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.</p>
                            <hr>
                            <ul class="list-inline share-list">
                                <li><i class="fa fa-bell"></i><a href="page_profile_users.html#">3 Notifications</a></li>
                                <li><i class="fa fa-group"></i><a href="page_profile_users.html#">25 Followers</a></li>
                                <li><i class="fa fa-share"></i><a href="page_profile_users.html#">Share</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="profile-blog">
                            <img class="rounded-x" src="${staticPath}/assets/img/testimonials/img3.jpg" alt="">
                            <div class="name-location">
                                <strong>Frank Heller</strong>
                                <span><i class="fa fa-map-marker"></i><a href="page_profile_users.html#">Moscow,</a> <a href="page_profile_users.html#">Russia</a></span>
                            </div>
                            <div class="clearfix margin-bottom-20"></div>
                            <p>Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.</p>
                            <hr>
                            <ul class="list-inline share-list">
                                <li><i class="fa fa-bell"></i><a href="page_profile_users.html#">7 Notifications</a></li>
                                <li><i class="fa fa-group"></i><a href="page_profile_users.html#">77 Followers</a></li>
                                <li><i class="fa fa-share"></i><a href="page_profile_users.html#">Share</a></li>
                            </ul>
                        </div>
                    </div>
                </div><!--/end row-->
                <!--End Profile Blog-->

                <!--Profile Blog-->
                <div class="row margin-bottom-20">
                    <div class="col-sm-6 sm-margin-bottom-20">
                        <div class="profile-blog">
                            <img class="rounded-x" src="${staticPath}/assets/img/testimonials/user.jpg" alt="">
                            <div class="name-location">
                                <strong>John W.A</strong>
                                <span><i class="fa fa-map-marker"></i><a href="page_profile_users.html#">California,</a> <a href="page_profile_users.html#">US</a></span>
                            </div>
                            <div class="clearfix margin-bottom-20"></div>
                            <p>Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.</p>
                            <hr>
                            <ul class="list-inline share-list">
                                <li><i class="fa fa-bell"></i><a href="page_profile_users.html#">0 Notifications</a></li>
                                <li><i class="fa fa-group"></i><a href="page_profile_users.html#">9 Followers</a></li>
                                <li><i class="fa fa-share"></i><a href="page_profile_users.html#">Share</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="profile-blog">
                            <img class="rounded-x" src="${staticPath}/assets/img/testimonials/img5.jpg" alt="">
                            <div class="name-location">
                                <strong>Natalia J.</strong>
                                <span><i class="fa fa-map-marker"></i><a href="page_profile_users.html#">Moscow,</a> <a href="page_profile_users.html#">Russia</a></span>
                            </div>
                            <div class="clearfix margin-bottom-20"></div>
                            <p>Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.</p>
                            <hr>
                            <ul class="list-inline share-list">
                                <li><i class="fa fa-bell"></i><a href="page_profile_users.html#">56 Notifications</a></li>
                                <li><i class="fa fa-group"></i><a href="page_profile_users.html#">125 Followers</a></li>
                                <li><i class="fa fa-share"></i><a href="page_profile_users.html#">Share</a></li>
                            </ul>
                        </div>
                    </div>
                </div><!--/end row-->

                <!--Profile Blog-->
                <div class="row margin-bottom-20">
                    <div class="col-sm-6 sm-margin-bottom-20">
                        <div class="profile-blog">
                            <img class="rounded-x" src="${staticPath}/assets/img/testimonials/img4.jpg" alt="">
                            <div class="name-location">
                                <strong>Pavel Kolnikov</strong>
                                <span><i class="fa fa-map-marker"></i><a href="page_profile_users.html#">Moscow,</a> <a href="page_profile_users.html#">Russia</a></span>
                            </div>
                            <div class="clearfix margin-bottom-20"></div>
                            <p>Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.</p>
                            <hr>
                            <ul class="list-inline share-list">
                                <li><i class="fa fa-bell"></i><a href="page_profile_users.html#">37 Notifications</a></li>
                                <li><i class="fa fa-group"></i><a href="page_profile_users.html#">46 Followers</a></li>
                                <li><i class="fa fa-share"></i><a href="page_profile_users.html#">Share</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="profile-blog">
                            <img class="rounded-x" src="${staticPath}/assets/img/testimonials/img6.jpg" alt="">
                            <div class="name-location">
                                <strong>Taylor Lee</strong>
                                <span><i class="fa fa-map-marker"></i><a href="page_profile_users.html#">California,</a> <a href="page_profile_users.html#">US</a></span>
                            </div>
                            <div class="clearfix margin-bottom-20"></div>
                            <p>Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.</p>
                            <hr>
                            <ul class="list-inline share-list">
                                <li><i class="fa fa-bell"></i><a href="page_profile_users.html#">0 Notifications</a></li>
                                <li><i class="fa fa-group"></i><a href="page_profile_users.html#">9 Followers</a></li>
                                <li><i class="fa fa-share"></i><a href="page_profile_users.html#">Share</a></li>
                            </ul>
                        </div>
                    </div>
                </div><!--/end row-->
                <!--End Profile Blog-->

                <!--Profile Blog-->
                <div class="row margin-bottom-20">
                    <div class="col-sm-6 sm-margin-bottom-20">
                        <div class="profile-blog">
                            <img class="rounded-x" src="${staticPath}/assets/img/testimonials/img3.jpg" alt="">
                            <div class="name-location">
                                <strong>Frank Heller</strong>
                                <span><i class="fa fa-map-marker"></i><a href="page_profile_users.html#">Moscow,</a> <a href="page_profile_users.html#">Russia</a></span>
                            </div>
                            <div class="clearfix margin-bottom-20"></div>
                            <p>Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.</p>
                            <hr>
                            <ul class="list-inline share-list">
                                <li><i class="fa fa-bell"></i><a href="page_profile_users.html#">7 Notifications</a></li>
                                <li><i class="fa fa-group"></i><a href="page_profile_users.html#">77 Followers</a></li>
                                <li><i class="fa fa-share"></i><a href="page_profile_users.html#">Share</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="profile-blog">
                            <img class="rounded-x" src="${staticPath}/assets/img/testimonials/img2.jpg" alt="">
                            <div class="name-location">
                                <strong>Sasha Elli</strong>
                                <span><i class="fa fa-map-marker"></i><a href="page_profile_users.html#">California,</a> <a href="page_profile_users.html#">US</a></span>
                            </div>
                            <div class="clearfix margin-bottom-20"></div>
                            <p>Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.</p>
                            <hr>
                            <ul class="list-inline share-list">
                                <li><i class="fa fa-bell"></i><a href="page_profile_users.html#">3 Notifications</a></li>
                                <li><i class="fa fa-group"></i><a href="page_profile_users.html#">25 Followers</a></li>
                                <li><i class="fa fa-share"></i><a href="page_profile_users.html#">Share</a></li>
                            </ul>
                        </div>
                    </div>
                </div><!--/end row-->

                <button type="button" class="btn-u btn-u-default btn-block text-center">Load More</button>
                <!--End Profile Blog-->
            </div>
        </div>
    </div>
</div>

</@htmlBody>
<@footerJS>
</@footerJS>

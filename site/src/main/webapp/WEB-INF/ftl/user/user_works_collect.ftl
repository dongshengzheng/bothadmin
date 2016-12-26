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
            <a class="btn-u btn-u-sm" href="page_profile_me.html#">Change Picture</a>
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
            <div class="profile-body">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="easy-block-v1">
                            <img class="img-responsive" src="${staticPath}/assets/img/main/img12.jpg" alt="">
                            <div class="easy-block-v1-badge rgba-red">Web Design</div>
                        </div>
                        <div class="projects">
                            <h2><a class="color-dark" href="page_profile_projects.html#">Getting Started Photography</a></h2>
                            <ul class="list-unstyled list-inline blog-info-v2">
                                <li>By: <a class="color-green" href="page_profile_projects.html#">Edward Rooster</a></li>
                                <li><i class="fa fa-clock-o"></i> Jan 07, 2013</li>
                            </ul>
                            <div style="height: 90px;overflow: scroll">
                                <p>Lis faucibustesque et rhoncus sapien, sed ullamcustesque et rhoncus sapien, sed ullamcustesque et rhoncus sapien, sed ullamcustesque et rhoncus sapien, sed ullamcustesque et rhoncus sapien, sed ullamcustesque et rhoncus sapien, sed ullamcustesque et rhoncus sapien, sed ullamcustesque et rhoncus sapien, sed ullamcustesque et rhoncus sapien, sed ullamcustesque et rhoncus sapien, sed ullamcustesque et rhoncus sapien, sed ullamcustesque et rhoncus sapien, sed ullamcorper justo.</p>
                            </div>
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
                    <div class="col-sm-6">
                        <div class="service-or easy-block-v2 no-margin-bottom">
                            <img class="img-responsive" src="${staticPath}/assets/img/main/img16.jpg" alt="">
                            <div class="easy-bg-v2 rgba-default">Unify</div>
                        </div>
                        <div class="projects">
                            <h2><a class="color-dark" href="page_profile_projects.html#">Getting Started Photography</a></h2>
                            <ul class="list-unstyled list-inline blog-info-v2">
                                <li>By: <a class="color-green" href="page_profile_projects.html#">Edward Rooster</a></li>
                                <li><i class="fa fa-clock-o"></i> Jan 07, 2013</li>
                            </ul>
                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry printing. Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.</p>
                            <br>
                        </div>
                        <div class="project-share">
                            <ul class="list-inline comment-list-v2 pull-left">
                                <li><i class="fa fa-eye"></i> <a href="page_profile_projects.html#">45</a></li>
                                <li><i class="fa fa-comments"></i> <a href="page_profile_projects.html#">90</a></li>
                                <li><i class="fa fa-retweet"></i> <a href="page_profile_projects.html#">84</a></li>
                            </ul>
                            <ul class="list-inline star-vote pull-right">
                                <li><i class="color-green fa fa-star"></i></li>
                                <li><i class="color-green fa fa-star"></i></li>
                                <li><i class="color-green fa fa-star"></i></li>
                                <li><i class="color-green fa fa-star"></i></li>
                                <li><i class="color-green fa fa-star-half-o"></i></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="easy-block-v1">
                            <img class="img-responsive" src="${staticPath}/assets/img/main/img17.jpg" alt="">
                            <div class="easy-block-v1-badge rgba-purple">Graphic Design</div>
                        </div>
                        <div class="projects">
                            <h2><a class="color-dark" href="page_profile_projects.html#">Getting Started Photography</a></h2>
                            <ul class="list-unstyled list-inline blog-info-v2">
                                <li>By: <a class="color-green" href="page_profile_projects.html#">Edward Rooster</a></li>
                                <li><i class="fa fa-clock-o"></i> Jan 07, 2013</li>
                            </ul>
                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry printing. Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.</p>
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
                    <div class="col-sm-6">
                        <div class="service-or easy-block-v2 no-margin-bottom">
                            <img class="img-responsive" src="${staticPath}/assets/img/main/img18.jpg" alt="">
                            <div class="easy-bg-v2 rgba-blue">Nokia</div>
                        </div>
                        <div class="projects">
                            <h2><a class="color-dark" href="page_profile_projects.html#">Getting Started Photography</a></h2>
                            <ul class="list-unstyled list-inline blog-info-v2">
                                <li>By: <a class="color-green" href="page_profile_projects.html#">Edward Rooster</a></li>
                                <li><i class="fa fa-clock-o"></i> Jan 07, 2013</li>
                            </ul>
                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry printing. Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.</p>
                            <br>
                        </div>
                        <div class="project-share">
                            <ul class="list-inline comment-list-v2 pull-left">
                                <li><i class="fa fa-eye"></i> <a href="page_profile_projects.html#">45</a></li>
                                <li><i class="fa fa-comments"></i> <a href="page_profile_projects.html#">90</a></li>
                                <li><i class="fa fa-retweet"></i> <a href="page_profile_projects.html#">84</a></li>
                            </ul>
                            <ul class="list-inline star-vote pull-right">
                                <li><i class="color-green fa fa-star"></i></li>
                                <li><i class="color-green fa fa-star"></i></li>
                                <li><i class="color-green fa fa-star"></i></li>
                                <li><i class="color-green fa fa-star"></i></li>
                                <li><i class="color-green fa fa-star-half-o"></i></li>
                            </ul>
                        </div>
                    </div>
                    <button type="button" class="btn-u btn-u-default btn-u-sm btn-block">加载更多</button>
                </div>
            </div>
        </div>
    </div>
</div>

</@htmlBody>
<@footerJS>
</@footerJS>

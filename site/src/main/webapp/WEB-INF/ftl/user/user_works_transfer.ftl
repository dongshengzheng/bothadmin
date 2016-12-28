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
                <li class="list-group-item active">
                    <a href="/user/transfer"><i class="fa fa-group"></i>转让作品</a>
                </li>
                <li class="list-group-item">
                    <a href="/user/collect"><i class="fa fa-cubes"></i>收藏作品</a>
                </li>
                <li class="list-group-item">
                    <a href="/user/follow"><i class="fa fa-comments"></i>关注用户</a>
                </li>
                <li class="list-group-item">
                    <a href="/user/integral"><i class="fa fa-history"></i>积分中心</a>
                </li>
                <li class="list-group-item">
                    <a href="/user/settings"><i class="fa fa-cog"></i> 个人设置</a>
                </li>
            </ul>

            <hr>
            <div class="margin-bottom-50"></div>
            <form action="#" id="sky-form2" class="sky-form">
                <div id="inline-start"></div>
            </form>
        </div>
        <div class="col-md-9">
            <div class="profile-body margin-bottom-20">
                <div class="tab-v1">
                    <ul class="nav nav-justified nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#rollin">已转出</a></li>
                        <li><a data-toggle="tab" href="#rollOut">已转入</a></li>
                        <li><a data-toggle="tab" href="#rollInning">待转出</a></li>
                        <li><a data-toggle="tab" href="#rollOuting">待确认</a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="rollin" class="profile-edit tab-pane fade in active">
                            <div id="rollin_content" class="row">

                            </div>
                            <button id="rollinBtn" type="button" class="btn-u btn-u-default btn-u-sm btn-block">加载更多</button>
                        </div>

                        <div id="rollOut" class="profile-edit tab-pane fade">
                            <div id="rollOut_content" class="row">

                            </div>
                            <button id="rollOutBtn" type="button" class="btn-u btn-u-default btn-u-sm btn-block">加载更多</button>
                        </div>

                        <div id="rollInning" class="profile-edit tab-pane fade">
                            <div id="rollInning_content" class="row">

                            </div>
                            <button id="rollInningBtn" type="button" class="btn-u btn-u-default btn-u-sm btn-block">加载更多</button>
                        </div>

                        <div id="rollOuting" class="profile-edit tab-pane fade">
                            <div id="rollOuting_content" class="row">

                            </div>
                            <button id="rollOutingBtn" type="button" class="btn-u btn-u-default btn-u-sm btn-block">加载更多</button>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="rollin_works" style="display: none" class="col-sm-6">
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
<div id="rollOut_works" style="display: none"  class="col-sm-6">
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
<div id="rollInning_works" style="display: none"  class="col-sm-6">
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
<div id="rollOuting_works" style="display: none"  class="col-sm-6">
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

</@htmlBody>
<@footerJS>
<script>
    // 已转入
    rollinIndex = 0;
    rollinHasMore = true;
    // 已转出
    rollOutIndex = 0;
    rollOutHasMore = true;
    // 待确认转入
    rollInningIndex = 0;
    rollInningHasMore = true;
    // 待确认转出
    rollOutingIndex = 0;
    rollOutingHasMore =true;

    $(document).ready(function () {
        loadRollin(1);
        loadRollOut(1);
        loadRrollInning(1);
        loadRollOuting(1);
        //
        function loadRollin(rollinIndex) {
            $.get("/user/transfer_load/false/1", {pageIndex: rollinIndex}, function (data) {
                if (rollinIndex >= data.pages) {
                    // 数据加载完毕了
                    $("#rollinBtn").html("客观，这次真没了");
                    rollinHasMore = false;
                }
                $.each(data.records, function () {
                    var $li = $("#rollin_works").clone();
                    $li.removeAttr("id").css("display", "block");
                    $li.find(".img-responsive").attr("src", "http://windyeel.img-cn-shanghai.aliyuncs.com/" + this.works.images + "?x-oss-process=image/resize,m_fill,h_331,w_525");
                    $("#rollin_content").append($li);
                });


            });
        }
        $("#rollinBtn").on("click", function () {
            if (rollinHasMore) {
                rollinIndex++;
                loadRollin(rollinIndex);
            }
        });

        //
        function loadRollOut(rollOutIndex) {
            $.get("/user/transfer_load/true/1", {pageIndex: rollOutIndex}, function (data) {
                if (rollOutIndex >= data.pages) {
                    // 数据加载完毕了
                    $("#rollOutBtn").html("客观，这次真没了");
                    rollOutHasMore = false;
                }
                $.each(data.records, function () {
                    var $li = $("#rollOut_works").clone();
                    $li.removeAttr("id").css("display", "block");
                    $li.find(".img-responsive").attr("src", "http://windyeel.img-cn-shanghai.aliyuncs.com/" + this.works.images + "?x-oss-process=image/resize,m_fill,h_331,w_525");
                    $("#rollOut_content").append($li);
                });
            });
        }
        $("#rollOutBtn").on("click", function () {
            if (rollOutHasMore) {
                rollOutIndex++;
                loadRollOut(rollOutIndex);
            }
        });
        //
        function loadRrollInning(rollInningIndex) {
            $.get("/user/transfer_load/false/2", {pageIndex: rollInningIndex}, function (data) {
                if (rollInningIndex >= data.pages) {
                    // 数据加载完毕了
                    $("#rollInningBtn").html("客观，这次真没了");
                    rollInningHasMore = false;
                }
                $.each(data.records, function () {
                    var $li = $("#rollInning_works").clone();
                    $li.removeAttr("id").css("display", "block");
                    $li.find(".img-responsive").attr("src", "http://windyeel.img-cn-shanghai.aliyuncs.com/" + this.works.images + "?x-oss-process=image/resize,m_fill,h_331,w_525");
                    $("#rollInning_content").append($li);
                });
            });
        }
        $("#rollInningBtn").on("click", function () {
            if (rollInningHasMore) {
                rollInningIndex++;
                loadRrollInning(rollInningIndex);
            }
        });

        //
        function loadRollOuting(rollOutingIndex) {
            $.get("/user/transfer_load/false/2", {pageIndex: rollOutingIndex}, function (data) {
                if (rollOutingIndex >= data.pages) {
                    // 数据加载完毕了
                    $("#rollOutingBtn").html("客观，这次真没了");
                    rollOutingHasMore = false;
                }
                $.each(data.records, function () {
                    var $li = $("#rollOuting_works").clone();
                    $li.removeAttr("id").css("display", "block");
                    $li.find(".img-responsive").attr("src", "http://windyeel.img-cn-shanghai.aliyuncs.com/" + this.works.images + "?x-oss-process=image/resize,m_fill,h_331,w_525");
                    $("#rollOuting_content").append($li);
                });
            });
        }
        $("#rollOutingBtn").on("click", function () {
            if (rollOutingHasMore) {
                rollOutingIndex++;
                loadRollOuting(rollOutingIndex);
            }
        });
    });

</script>
</@footerJS>

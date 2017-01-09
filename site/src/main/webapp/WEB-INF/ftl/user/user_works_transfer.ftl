<#include "../layout/main.ftl"/>

<@htmlHead title="用户中心">
<link rel="stylesheet" href="${staticPath}/assets/css/style.css">
<link rel="stylesheet" href="${staticPath}/assets/css/pages/profile.css">
<link rel="stylesheet" href="${staticPath}/assets/plugins/line-icons/line-icons.css">
<style>
    .easy-block-v2-badge {
        left: 0px;
        top: 46px;
        z-index: 1;
        color: #fff;
        padding: 4px 10px;
        position: absolute;
    }

    .easy-block-v3-badge {
        left: 0px;
        top: 82px;
        z-index: 1;
        color: #fff;
        padding: 4px 10px;
        position: absolute;
    }

</style>
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
                        <li class="active"><a data-toggle="tab" href="#rollOut">已转出</a></li>
                        <li><a data-toggle="tab" href="#rollin">已转入</a></li>
                        <li><a data-toggle="tab" href="#rollOuting">待转出</a></li>
                        <li><a data-toggle="tab" href="#rollInning">待确认</a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="rollOut" class="profile-edit tab-pane fade in active">
                            <div id="rollOut_content" class="row">

                            </div>
                            <button id="rollOutBtn" type="button" class="btn-u btn-u-default btn-u-sm btn-block">加载更多
                            </button>
                        </div>

                        <div id="rollin" class="profile-edit tab-pane fade">
                            <div id="rollin_content" class="row">

                            </div>
                            <button id="rollinBtn" type="button" class="btn-u btn-u-default btn-u-sm btn-block">加载更多
                            </button>
                        </div>

                        <div id="rollOuting" class="profile-edit tab-pane fade">
                            <div id="rollOuting_content" class="row">

                            </div>
                            <button id="rollOutingBtn" type="button" class="btn-u btn-u-default btn-u-sm btn-block">
                                加载更多
                            </button>
                        </div>

                        <div id="rollInning" class="profile-edit tab-pane fade">
                            <div id="rollInning_content" class="row">

                            </div>
                            <button id="rollInningBtn" type="button" class="btn-u btn-u-default btn-u-sm btn-block">
                                加载更多
                            </button>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="rollin_works" style="display: none" class="col-sm-6">
    <div class="easy-block-v1">
        <a id="rollin_works_img" href=""><img onerror="nofind(1)" class="img-responsive"
                                              src="${staticPath}/assets/img/main/img12.jpg"
                                              alt=""></a>
    <#--<div class="easy-block-v1-badge rgba-red">Web Design</div>-->
    </div>
    <div class="headline-left margin-bottom-10">
        <h3 id="rollin_works_name" class="headline-brd works-name"></h3>
    </div>
    <small class="project-tag">
        <i class="fa fa-tag"></i>
        <a id="rollin_works_des" href="javascript:void(0)"></a>
    </small>
    <p class="rollin_works-remarks"></p>
</div>
<div id="rollOut_works" style="display: none" class="col-sm-6">
    <div class="easy-block-v1">
        <a id="rollOut_works_img" href=""><img onerror="nofind(1)" class="img-responsive"
                                               src="${staticPath}/assets/img/main/img12.jpg"
                                               alt=""></a>
    <#--<div class="easy-block-v1-badge rgba-red">Web Design</div>-->
    </div>
    <div class="headline-left margin-bottom-10">
        <h3 id="rollOut_works_name" class="headline-brd works-name"></h3>
    </div>
    <small class="project-tag">
        <i class="fa fa-tag"></i>
        <a id="rollOut_works_des" href="javascript:void(0)"></a>
    </small>
    <p class="rollOut_works-remarks"></p>
</div>
<div id="rollInning_works" style="display: none" class="col-sm-6">
    <div class="easy-block-v1">
        <a id="rollInning_works_img" href=""><img onerror="nofind(1)" class="img-responsive"
                                                  src="${staticPath}/assets/img/main/img12.jpg"
                                                  alt=""></a>
        <a data-id="" class="rollInConfirm">
            <div class="easy-block-v1-badge rgba-red">确认转入</div>
        </a>
    </div>
    <div class="headline-left margin-bottom-10">
        <h3 id="rollInning_works_name" class="headline-brd works-name"></h3>
    </div>
    <small class="project-tag">
        <i class="fa fa-tag"></i>
        <a id="rollInning_works_des" href="javascript:void(0)"></a>
    </small>
    <p class="rollInning_works-remarks"></p>
</div>
<div id="rollOuting_works" style="display: none" class="col-sm-6">
    <div class="easy-block-v1">
        <a id="rollOuting_works_img" href=""><img onerror="nofind(1)" class="img-responsive"
                                                  src="${staticPath}/assets/img/main/img12.jpg"
                                                  alt=""></a>
    <#--<div class="easy-block-v1-badge rgba-red">Web Design</div>-->
    </div>
    <div class="headline-left margin-bottom-10">
        <h3 id="rollOuting_works_name" class="headline-brd works-name"></h3>
    </div>
    <small class="project-tag">
        <i class="fa fa-tag"></i>
        <a id="rollOuting_works_des" href="javascript:void(0)"></a>
    </small>
    <p class="rollOuting_works-remarks"></p>
</div>

</@htmlBody>
<@footerJS>
<script>
    // 已转入
    rollinIndex = 1;
    rollinHasMore = true;
    // 已转出
    rollOutIndex = 1;
    rollOutHasMore = true;
    // 待确认转入
    rollInningIndex = 1;
    rollInningHasMore = true;
    // 待确认转出
    rollOutingIndex = 1;
    rollOutingHasMore = true;

    $(document).ready(function () {
        loadRollin(1);
        loadRollOut(1);
        loadRrollInning(1);
        loadRollOuting(1);
        //
        function loadRollin(rollinIndex) {
            $.get("/user/transfer_load/true/1", {pageIndex: rollinIndex}, function (data) {
                if (rollinIndex >= data.pages) {
                    // 数据加载完毕了
                    $("#rollinBtn").html("客官，这次真没了");
                    rollinHasMore = false;
                }
                $.each(data.records, function () {
                    var $li = $("#rollin_works").clone();
                    $li.removeAttr("id").css("display", "block");
                    $li.find(".img-responsive").attr("src", "http://windyeel.img-cn-shanghai.aliyuncs.com/" + this.works.images + "?x-oss-process=image/resize,m_fill,h_331,w_525");
                    $li.find("#rollin_works_des").html(this.works.breed);
                    $li.find("#rollin_works_name").html(this.works.name);
                    $li.find("#rollin_works_img").attr("href", "${staticPath}/works/detail/" + this.works.id);
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

        function loadRollOut(rollOutIndex) {
            $.get("/user/transfer_load/false/1", {pageIndex: rollOutIndex}, function (data) {
                if (rollOutIndex >= data.pages) {
                    // 数据加载完毕了
                    $("#rollOutBtn").html("客官，这次真没了");
                    rollOutHasMore = false;
                }
                $.each(data.records, function () {
                    var $li = $("#rollOut_works").clone();
                    $li.removeAttr("id").css("display", "block");
                    $li.find(".img-responsive").attr("src", "http://windyeel.img-cn-shanghai.aliyuncs.com/" + this.works.images + "?x-oss-process=image/resize,m_fill,h_331,w_525");
                    $li.find("#rollOut_works_des").html(this.works.breed);
                    $li.find("#rollOut_works_name").html(this.works.name);
                    $li.find("#rollOut_works_img").attr("href", "${staticPath}/works/detail/" + this.works.id);
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
            $.get("/user/transfer_load/true/2", {pageIndex: rollInningIndex}, function (data) {
                if (rollInningIndex >= data.pages) {
                    // 数据加载完毕了
                    $("#rollInningBtn").html("客官，这次真没了");
                    rollInningHasMore = false;
                }
                $.each(data.records, function () {
                    var $li = $("#rollInning_works").clone();
                    $li.removeAttr("id").css("display", "block");
                    $li.find(".img-responsive").attr("src", "http://windyeel.img-cn-shanghai.aliyuncs.com/" + this.works.images + "?x-oss-process=image/resize,m_fill,h_331,w_525");
                    $li.find("#rollInning_works_des").html(this.works.breed);
                    $li.find("#rollInning_works_name").html(this.works.name);
                    $li.find("#rollInning_works_img").attr("href", "${staticPath}/works/detail/" + this.works.id);
                    $li.find('.rollInConfirm').attr("data-id", this.id).on("click", confirmRollin);
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
                    $("#rollOutingBtn").html("客官，这次真没了");
                    rollOutingHasMore = false;
                }
                $.each(data.records, function () {
                    var $li = $("#rollOuting_works").clone();
                    $li.removeAttr("id").css("display", "block");
                    $li.find(".img-responsive").attr("src", "http://windyeel.img-cn-shanghai.aliyuncs.com/" + this.works.images + "?x-oss-process=image/resize,m_fill,h_331,w_525");
                    $li.find("#rollOuting_works_des").html(this.works.breed);
                    $li.find("#rollOuting_works_name").html(this.works.name);
                    $li.find("#rollOuting_works_img").attr("href", "${staticPath}/works/detail/" + this.works.id);
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

        function confirmRollin() {
            var thisone = $(this);

            $.get("${staticPath}/works/transfer/confimRollin/" + thisone.attr('data-id'), function (data) {
                if (data.suc) {
                    alert("转入成功");
                    var xx = thisone.parent().parent();
                    thisone.unbind('click');
                    thisone.find('.easy-block-v1-badge').html("新转入");
                    $("#rollin_content").append(xx);

                } else {
                    alert("转入失败");
                }
            });

        }

    });
</script>
</@footerJS>

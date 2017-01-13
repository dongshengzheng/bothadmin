<#include "../layout/main.ftl"/>

<@htmlHead title="用户中心">
<link rel="stylesheet" href="${staticPath}/assets/css/style.css">
<link rel="stylesheet" href="${staticPath}/assets/css/app.css">
<link rel="stylesheet" href="${staticPath}/assets/css/pages/profile.css">
<link rel="stylesheet" href="${staticPath}/assets/plugins/line-icons/line-icons.css">
<link rel="stylesheet" href="${staticPath}/assets/plugins/login-signup-modal-window/css/style.css">
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

    a {
        cursor: pointer;
    }

    .target {
        cursor: pointer;
    }

    .target-selected {
        border: 2px solid red;
    }

    #target-temp {
        display: none;
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
                <#--<li class="list-group-item ">-->
                    <#--<a href="/user"><i class="fa fa-tachometer"></i>面板</a>-->
                <#--</li>-->
                <li class="list-group-item active">
                    <a href="/user/works"><i class="fa fa-user"></i> 我的作品</a>
                </li>
                <li class="list-group-item">
                    <a href="/user/transfer"><i class="fa fa-group"></i> 转让作品</a>
                </li>
                <li class="list-group-item">
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
                <div class="ab-v1">
                    <ul class="nav nav-justified nav-tabs">
                        <li class="active" id="pass"><a data-toggle="tab" href="#pass">审核通过</a></li>
                        <li id="unpass"><a data-toggle="tab" href="#unpass">审核失败</a></li>
                        <li id="checking"><a data-toggle="tab" href="#checking">审核中</a></li>
                        <li id="drafts"><a data-toggle="tab" href="#drafts">草稿箱</a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="pass" class="profile-edit tab-pane fade in active">
                            <div class="row" id="passWorks-content">

                            </div>
                            <button id="passBtn" type="button" class="btn-u btn-u-default btn-u-sm btn-block">加载更多
                            </button>
                        </div>
                        <div id="unpass" class="profile-edit tab-pane fade">
                            <div class="row" id="unPassWorks-content">

                            </div>
                            <button id="unPassBtn" type="button" class="btn-u btn-u-default btn-u-sm btn-block">加载更多
                            </button>
                        </div>
                        <div id="checking" class="profile-edit tab-pane fade">
                            <div class="row" id="checkingWorks-content">

                            </div>
                            <button id="checkingBtn" type="button" class="btn-u btn-u-default btn-u-sm btn-block">加载更多
                            </button>
                        </div>
                        <div id="drafts" class="profile-edit tab-pane fade">
                            <div class="row" id="draftsWorks-content">

                            </div>
                            <button id="draftsBtn" type="button" class="btn-u btn-u-default btn-u-sm btn-block">加载更多
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="col-sm-6" id="passWorks" style="display: none">
    <div class="easy-block-v1">
        <a id="pass_works_img" href=""><img onerror="nofind(1)" class="img-responsive"
                                            src="${staticPath}/assets/img/main/img12.jpg" alt=""></a>
        <a class="works-transfer">
            <div class="easy-block-v1-badge rgba-red">转让</div>
        </a>
        <a class="works-edit">
            <div class="easy-block-v2-badge rgba-red">编辑</div>
        </a>
        <a class="works-delete">
            <div class="easy-block-v3-badge rgba-red">删除</div>
        </a>
    </div>
    <div class="headline-left margin-bottom-10">
        <h3 id="pass_works_name" class="headline-brd works-name"></h3>
    </div>
    <small class="project-tag">
        <i class="fa fa-tag"></i>
        <a id="pass_works_des" href="javascript:void(0)"></a>
    </small>
<#--<p class="pass_works-remarks"></p>-->
<#--<div class="projects">-->
<#--<h2><a class="color-dark" href="page_profile_projects.html#">Getting Started Photography</a></h2>-->
<#--<ul class="list-unstyled list-inline blog-info-v2">-->
<#--<li>By: <a class="color-green" href="page_profile_projects.html#">Edward Rooster</a></li>-->
<#--<li><i class="fa fa-clock-o"></i> Jan 07, 2013</li>-->
<#--</ul>-->
<#--<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry printing. Donec non dignissim eros.-->
<#--Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.</p>-->
<#--<br>-->
<#--</div>-->
<#--<div class="project-share">-->
<#--<ul class="list-inline comment-list-v2 pull-left">-->
<#--<li><i class="fa fa-eye"></i> <a href="page_profile_projects.html#">25</a></li>-->
<#--<li><i class="fa fa-comments"></i> <a href="page_profile_projects.html#">32</a></li>-->
<#--<li><i class="fa fa-retweet"></i> <a href="page_profile_projects.html#">77</a></li>-->
<#--</ul>-->
<#--<ul class="list-inline star-vote pull-right">-->
<#--<li><i class="color-green fa fa-star"></i></li>-->
<#--<li><i class="color-green fa fa-star"></i></li>-->
<#--<li><i class="color-green fa fa-star"></i></li>-->
<#--<li><i class="color-green fa fa-star-half-o"></i></li>-->
<#--<li><i class="color-green fa fa-star-o"></i></li>-->
<#--</ul>-->
<#--</div>-->
</div>
<div class="col-sm-6" id="unPassWorks" style="display: none">
    <div class="easy-block-v1">
        <a id="unPass_works_img" href=""><img onerror="nofind(1)" class="img-responsive"
                                              src="${staticPath}/assets/img/main/img12.jpg"
                                              alt=""></a>
        <a class="works-edit">
            <div class="easy-block-v2-badge rgba-red">编辑</div>
        </a>
        <a class="works-delete">
            <div class="easy-block-v3-badge rgba-red">删除</div>
        </a>
    <#--<div class="easy-block-v1-badge rgba-red">Web Design</div>-->
    </div>
    <div class="headline-left margin-bottom-10">
        <h3 id="unPass_works_name" class="headline-brd works-name"></h3>
    </div>
    <small class="project-tag">
        <i class="fa fa-tag"></i>
        <a id="unPass_works_des" href="javascript:void(0)"></a>
    </small>
    <p class="unPass_works-remarks"></p>
</div>

<div class="col-sm-6" id="checkingWorks" style="display: none">
    <div class="easy-block-v1">
        <a id="checking_works_img" href=""><img onerror="nofind(1)" class="img-responsive"
                                                src="${staticPath}/assets/img/main/img12.jpg"
                                                alt=""></a>
    <#--<div class="easy-block-v1-badge rgba-red">Web Design</div>-->
    </div>
    <div class="headline-left margin-bottom-10">
        <h3 id="checking_works_name" class="headline-brd works-name"></h3>
    </div>
    <small class="project-tag">
        <i class="fa fa-tag"></i>
        <a id="checking_works_des" href="javascript:void(0)"></a>
    </small>
    <p class="checking_works-remarks"></p>


</div>
<div class="col-sm-6" id="draftWorks" style="display: none">
    <div class="easy-block-v1">
        <a id="draft_works_img" href=""><img onerror="nofind(1)" class="img-responsive"
                                             src="${staticPath}/assets/img/main/img12.jpg"
                                             alt=""></a>
        <a class="works-edit">
            <div class="easy-block-v2-badge rgba-red">编辑</div>
        </a>
        <a class="works-delete">
            <div class="easy-block-v3-badge rgba-red">删除</div>
        </a>
    <#--<div class="easy-block-v1-badge rgba-red">Web Design</div>-->
    </div>
    <div class="headline-left margin-bottom-10">
        <h3 id="draft_works_name" class="headline-brd works-name"></h3>
    </div>
    <small class="project-tag">
        <i class="fa fa-tag"></i>
        <a id="draft_works_des" href="javascript:void(0)"></a>
    </small>
    <p class="draft_works-remarks"></p>
<#--<div class="projects">-->
<#--<h2><a class="color-dark" href="page_profile_projects.html#">Getting Started Photography</a></h2>-->
<#--<ul class="list-unstyled list-inline blog-info-v2">-->
<#--<li>By: <a class="color-green" href="page_profile_projects.html#">Edward Rooster</a></li>-->
<#--<li><i class="fa fa-clock-o"></i> Jan 07, 2013</li>-->
<#--</ul>-->
<#--<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry printing. Donec non dignissim eros.-->
<#--Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.</p>-->
<#--<br>-->
<#--</div>-->
<#--<div class="project-share">-->
<#--<ul class="list-inline comment-list-v2 pull-left">-->
<#--<li><i class="fa fa-eye"></i> <a href="page_profile_projects.html#">25</a></li>-->
<#--<li><i class="fa fa-comments"></i> <a href="page_profile_projects.html#">32</a></li>-->
<#--<li><i class="fa fa-retweet"></i> <a href="page_profile_projects.html#">77</a></li>-->
<#--</ul>-->
<#--<ul class="list-inline star-vote pull-right">-->
<#--<li><i class="color-green fa fa-star"></i></li>-->
<#--<li><i class="color-green fa fa-star"></i></li>-->
<#--<li><i class="color-green fa fa-star"></i></li>-->
<#--<li><i class="color-green fa fa-star-half-o"></i></li>-->
<#--<li><i class="color-green fa fa-star-o"></i></li>-->
<#--</ul>-->
<#--</div>-->
</div>


<#--转让弹出框-->
<div class="cd-user-modal"> <!-- this is the entire modal form, including the background -->
    <div class="cd-user-modal-container"> <!-- this is the container wrapper -->
        <ul class="cd-switcher">
            <li><a data-id="cd-login" href="javascript:void(0);" class="cd-switcher-tab selected">目标用户</a>
            </li>
            <li><a data-id="cd-signup" href="javascript:void(0);" class="cd-switcher-tab">转让作品</a></li>
        </ul>

        <div id="cd-login" class="cd-user-modal-content is-selected"> <!-- sign up form -->
            <form class="cd-form">
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="contact">目标用户昵称</label>
                    <div class="col-sm-9">
                        <input id="target-user-name" class="form-control" type="text"
                               placeholder="请输入目标用户昵称"/>
                    </div>
                </div>
                <br/>
                <div class="row margin-bottom-15"
                     style="margin-top: 15px;border-bottom: solid 1px #eee;margin-left: 10px">
                </div>

                <div id="target-user-content" class="row">
                </div>
            </form>
        </div>

        <div id="cd-signup" class="cd-user-modal-content ">
            <form class="cd-form form-horizontal" action="${staticPath}/works/transfer/complete" method="post">
                <input type="hidden" name="status" value="2"/>
                <input class="worksId" name="worksId" type="hidden" value="">
                <input name="fromUserId" type="hidden" value="${Session.siteSessionUser.id}">
                <div id="targetUser" class="form-group">
                    <label class="col-sm-2 control-label" for="contact">目标用户</label>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="description">转让原因</label>
                    <div class="col-sm-10">
                                    <textarea class="form-control" style="resize: none;height: 150px"
                                              name="reason"
                                              id="reason" type="text" placeholder="请输入转让原因"></textarea>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="zhidi">与用户关系</label>
                    <div class="col-sm-4">
                        <select class="form-control selectpicker" name="relation">
                            <option value="">请选择</option>
                            <option value="1">爱人</option>
                            <option value="2">朋友</option>
                            <option value="3">亲人</option>
                            <option value="4">亲戚</option>
                            <option value="5">其他</option>
                        </select>
                    </div>
                    <label class="col-sm-2 control-label" for="zhidi">售卖方式</label>
                    <div class="col-sm-4">
                        <select class="form-control selectpicker" name="transferType">
                            <option value="">请选择</option>
                            <option value="1">售卖</option>
                            <option value="2">赠送</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="description">售卖价格</label>
                    <div class="col-sm-10">
                        <input class="form-control" name="score" id="score" type="text"
                               placeholder="请输入售卖价格"/>
                    </div>
                </div>

                <div class="col-md-4 col-md-offset-1">
                    <button type="submit" class="btn-u btn-block">确认转让</button>
                </div>
                <div class="col-md-4 col-md-offset-2">
                    <button id="cancelTransfer" type="button" class="btn-u btn-block">取消</button>
                </div>
                <input type="reset" style="display: none">
                <br>
            </form>
        </div>
    </div> <!-- cd-user-modal-container -->
</div>

<div id="target-temp" class="col-sm-4 target-div" style="padding-right: 0px;width: 75px">
    <input class="toUserId" name="toUserId" type="hidden" value="">
    <img onerror="nofind(2)" class="target headImg"
         style=" margin: 10px 0px 10px 10px;height: 50px;width: 50px"
         src="${staticPath}/static/img/head3.jpg"
         alt=""/>
    <span style=" margin: 10px 0px 10px 10px;height: 50px;width: 50px">ccc</span>
</div>

</@htmlBody>
<@footerJS>
<script>
    //转让作品弹窗
    $cdUserModal = $('.cd-user-modal');
    $targetUserContent = $('#target-user-content');
    function showCdUserModal() {
        $cdUserModal.addClass('is-visible')
        $cdUserModal.find('.worksId').val($(this).attr('data-id'));
    }

    //作品通过
    pagePassIndex = 1;
    passHasMore = true;
    //审核失败
    pageUnPassIndex = 1;
    unPassHasMore = true;
    //审核中
    checkingIndex = 1;
    checkingHasMore = true;
    //草稿
    draftsIndex = 1;
    draftsHasMore = true;

    $(document).ready(function () {
        loadPass(1);
        loadUnPass(1);
        loadChecking(1);
        loadDrafts(1);
        positioningWorksType();
        //审核通过
        function loadPass(pagePassIndex) {
            $.get("/user/works_load/3", {pageIndex: pagePassIndex}, function (data) {
                if (pagePassIndex >= data.pages) {
                    // 数据加载完毕了
                    $("#passBtn").html("客官，这次真没了");
                    passHasMore = false;
                }
                $.each(data.records, function () {
                    var $li = $("#passWorks").clone();
                    $li.removeAttr("id").css("display", "block");
                    $li.find(".img-responsive").attr("src", "http://windyeel.img-cn-shanghai.aliyuncs.com/" + this.images + "?x-oss-process=image/resize,m_fill,h_331,w_525");
                    $li.find("#pass_works_des").html(this.breed);
                    $li.find("#pass_works_name").html(this.name);
                    $li.find("#pass_works_img").attr("href", "${staticPath}/works/detail/" + this.id);
                    $li.find('.works-transfer').attr('data-id', this.id).on('click', showCdUserModal);
                    $li.find('.works-edit').attr("href", "${staticPath}/works/edit/" + this.id);
                    $li.find('.works-delete').attr('data-id', this.id).on('click', deleteWorks);
                    $("#passWorks-content").append($li);
                });


            });
        }

        function positioningWorksType() {
            if(${type}=="3"){
                $("#checking").addClass("in active")
                $("#pass").removeClass("in active")
            } else if (${type}=="4"){
                    $("#drafts").addClass("in active")
                $("#pass").removeClass("in active")
            }
        }

        $("#passBtn").on("click", function () {
            if (passHasMore) {
                pagePassIndex++;
                loadPass(pagePassIndex);
            }
        });

        //审核未通过
        function loadUnPass(pageUnPassIndex) {
            $.get("/user/works_load/2", {pageIndex: pageUnPassIndex}, function (data) {
                if (pageUnPassIndex >= data.pages) {
                    // 数据加载完毕了
                    $("#unPassBtn").html("客官，这次真没了");
                    unPassHasMore = false;
                }
                $.each(data.records, function () {
                    var $li = $("#unPassWorks").clone();
                    $li.removeAttr("id").css("display", "block");
                    $li.find(".img-responsive").attr("src", "http://windyeel.img-cn-shanghai.aliyuncs.com/" + this.images + "?x-oss-process=image/resize,m_fill,h_331,w_525");
                    $li.find("#unPass_works_des").html(this.breed);
                    $li.find("#unPass_works_name").html(this.name);
                    $li.find("#unPass_works_img").attr("href", "${staticPath}/works/detail/" + this.id);
                    $li.find('.works-edit').attr("href", "${staticPath}/works/edit/" + this.id);
                    $li.find('.works-delete').attr('data-id', this.id).on('click', deleteWorks);
                    $("#unPassWorks-content").append($li);
                });
            });
        }

        $("#unPassBtn").on("click", function () {
            if (unPassHasMore) {
                pageUnPassIndex++;
                loadUnPass(pageUnPassIndex);
            }
        });


        //审核中
        function loadChecking(checkingIndex) {
            $.get("/user/works_load/1", {pageIndex: checkingIndex}, function (data) {
                if (checkingIndex >= data.pages) {
                    // 数据加载完毕了
                    $("#checkingBtn").html("客官，这次真没了");
                    checkingHasMore = false;
                }
                $.each(data.records, function () {
                    var $li = $("#checkingWorks").clone();
                    $li.removeAttr("id").css("display", "block");
                    $li.find(".img-responsive").attr("src", "http://windyeel.img-cn-shanghai.aliyuncs.com/" + this.images + "?x-oss-process=image/resize,m_fill,h_331,w_525");
                    $li.find("#checking_works_des").html(this.breed);
                    $li.find("#checking_works_name").html(this.name);
                    $li.find("#checking_works_img").attr("href", "${staticPath}/works/detail/" + this.id);
                    $("#checkingWorks-content").append($li);
                });
            });
        }

        $("#checkingBtn").on("click", function () {
            if (checkingHasMore) {
                checkingIndex++;
                loadChecking(checkingIndex);
            }
        });

        //草稿
        function loadDrafts(draftsIndex) {
            $.get("/user/works_load/0", {pageIndex: draftsIndex}, function (data) {
                if (draftsIndex >= data.pages) {
                    // 数据加载完毕了
                    $("#draftsBtn").html("客官，这次真没了");
                    draftsHasMore = false;
                }
                $.each(data.records, function () {
                    var $li = $("#draftWorks").clone();
                    $li.removeAttr("id").css("display", "block");
                    $li.find(".img-responsive").attr("src", "http://windyeel.img-cn-shanghai.aliyuncs.com/" + this.images + "?x-oss-process=image/resize,m_fill,h_331,w_525");
                    $li.find("#draft_works_des").html(this.breed);
                    $li.find("#draft_works_name").html(this.name);
                    $li.find("#draft_works_img").attr("href", "${staticPath}/works/detail/" + this.id);
                    $li.find('.works-edit').attr("href", "${staticPath}/works/edit/" + this.id);
                    $li.find('.works-delete').attr('data-id', this.id).on('click', deleteWorks);
                    $("#draftsWorks-content").append($li);
                });
            });
        }

        function deleteWorks() {
            var thisone = $(this);
            if (confirm("确认删除吗?")) {
                $.get("${staticPath}/works/delete/" + thisone.attr('data-id'), function (data) {
                    if (data.suc) {
                        thisone.parent().parent().remove();
                        alert("删除成功");
                    } else {
                        alert("删除失败");
                    }
                });
            }
        }

        $("#draftsBtn").on("click", function () {
            if (draftsHasMore) {
                draftsIndex++;
                loadDrafts(draftsIndex);
            }
        });


    });

    $(function () {
        $('.cd-switcher-tab').on('click', function () {
            $('.cd-switcher-tab').removeClass('selected');
            $(this).addClass('selected');
            $('.cd-user-modal-content').removeClass('is-selected');
            $('#' + $(this).attr('data-id')).addClass('is-selected');
        })

        function selectTarget() {
            var target = $(this).parent().clone();
            $('.target').removeClass('target-selected');
            $(this).addClass('target-selected');
            $('#targetUser .target-div').remove();
            $('#targetUser').append(target);
        }

        $('#target-user-name').on('keyup', function () {
            var keywords = $(this).val().trim();
            if (keywords.length > 0) {
                $.post("/user/userPage", {
                    pageIndex: 1,
                    pageSize: 100,
                    keywords: keywords
                }, function (data) {
                    $targetUserContent.html("");
                    $.each(data, function () {
                        var $li = $("#target-temp").clone();
                        $li.removeAttr('id');
                        if (this.headImgUrl.substr(0, 4) == "http") {
                            $li.find(".headImg").attr("src", this.headImgUrl);
                        } else {
                            $li.find(".headImg").attr("src", "http://windyeel.img-cn-shanghai.aliyuncs.com/" + this.headImgUrl + "?x-oss-process=image/resize,m_fill,h_100,w_100");
                        }
                        $li.find(".headImg").on('click', selectTarget);
                        $li.find('.toUserId').val(this.id);
                        $li.find('span').html(this.loginName);
                        $targetUserContent.append($li);
                    });
                });
            }
        })

        $('#cancelTransfer').on('click', function () {
            $cdUserModal.removeClass('is-visible')
            $targetUserContent.find('.target-div').remove();
            $('#target-user-name').val("");
            $('#targetUser .target-div').remove();
            $("input[type=reset]").trigger("click");
            $('.cd-user-modal-content').removeClass('is-selected');
            $('#cd-login').addClass('is-selected');
            $('.cd-switcher-tab').removeClass('selected');
            $('.cd-switcher-tab[data-id="cd-login"]').addClass('selected');
        })

    })
</script>
</@footerJS>

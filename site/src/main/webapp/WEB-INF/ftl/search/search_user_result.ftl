<#include "../layout/main.ftl"/>

<@htmlHead title="搜索用户结果">
<style>
    .headImg {
        width: 100%;
    }
</style>
</@htmlHead>
<@htmlBody>

<!--content start-->
<div class="container">
    <!--<div class="row">-->

    <!--</div>-->
    <div class="row">
        <div class="col-sm-9 col-sm-offset-1 text-left"
             style="background: rgb(237,238,239);margin-top: 20px;padding-top: 10px;padding-bottom: 10px;border:1px solid #E9EAEB">
            搜索用户结果
        </div>
        <div class="col-sm-9 col-sm-offset-1" style="border-right: 1px solid #E9EAEB;
                    border-left: 1px solid #E9EAEB;
                    border-bottom: 1px solid #E9EAEB">

            <div class="media" style="margin-top: 40px">
                <div class="pull-left">
                    <div style="height: 80px;width: 80px;border-radius: 50px;overflow:hidden">
                        <img class="" src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
                    </div>
                </div>
                <div class="media-body">
                    <h4 class="media-heading">M小路痴M_7132</h4>
                    <p>作品
                        <span style="margin-left: 10px;color: #FB591D">1509</span>
                        <span style="margin-left: 10px">|</span>
                        <span style="margin-left: 10px;">粉丝</span>
                        <span style="color: #FB591D;margin-left: 10px">126</span>
                        <span style="float:  right;"><button class="btn btn-default">
                                <i class="glyphicon glyphicon-ok" style="margin-right: 3px"></i>已经关注</button></span>
                    </p>
                    <p>地址
                        <span style="margin-left: 5px;">江苏</span>
                        <span style="margin-left: 5px">连云港</span>
                    </p>
                </div>
            </div>

            <hr>

            <div class="media">
                <div class="pull-left">
                    <div style="height: 80px;width: 80px;border-radius: 50px;overflow:hidden">
                        <img class="" src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
                    </div>
                </div>
                <div class="media-body">
                    <h4 class="media-heading">M小路痴M_7132</h4>
                    <p>作品
                        <span style="margin-left: 10px;color: #FB591D">1509</span>
                        <span style="margin-left: 10px">|</span>
                        <span style="margin-left: 10px;">粉丝</span>
                        <span style="color: #FB591D;margin-left: 10px">126</span>
                        <span style="float:  right;"><button class="btn btn-default">
                                <i class="glyphicon glyphicon-plus" style="margin-right: 3px"></i>添加关注</button>
                            </span>
                    </p>
                    <p>地址
                        <span style="margin-left: 5px;">江苏</span>
                        <span style="margin-left: 5px">连云港</span>
                    </p>
                </div>
            </div>

            <hr>

            <ul id="user-list" class="list-unstyled row portfolio-box">
            </ul>
            <button type="button" class="btn-u btn-u-default btn-u-sm btn-block btn-more">加载更多</button>

        </div>
    </div>
</div>

<li id="userTemp" style="display: none">
    <div class="media">
        <div class="pull-left">
            <div style="height: 80px;width: 80px;border-radius: 50px;overflow:hidden">
                <img class="headImg" src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
            </div>
        </div>
        <div class="media-body">
            <h4 class="media-heading">M小路痴M_7132</h4>
            <p>作品
                <span class="worksCount" style="margin-left: 10px;color: #FB591D">1509</span>
                <span style="margin-left: 10px">|</span>
                <span style="margin-left: 10px;">粉丝</span>
                <span class="followCount" style="color: #FB591D;margin-left: 10px">126</span>
                <span style="float:  right;"><button class="btn btn-default">
                                <i class="glyphicon glyphicon-plus focus" style="margin-right: 3px">添加关注</i></button>
                            </span>
            </p>
            <p>地址
                <span style="margin-left: 5px;">江苏</span>
                <span style="margin-left: 5px">连云港</span>
            </p>
        </div>
    </div>

    <hr>
</li>


<script>
    $('img').error(function () {
        $(this).attr('src', "http://windyeel.oss-cn-shanghai.aliyuncs.com/global/img/default.png");
    });

    pageIndex = 1;
    pageSize = 10;
    hasMore = true;
    var keywords = "${RequestParameters.keywords!''}";

    $("#headerHome").addClass("active");
    $(document).ready(function () {

        load(pageIndex, pageSize, keywords);
        function load(pageIndex, pageSize, keywords) {
            $.get("/user/userPage", {pageIndex: pageIndex, pageSize: pageSize, keywords: keywords}, function (data) {
                if (data.length < pageSize) {
                    // 数据加载完毕了
                    $(".btn-more").html("客官，这次真没了");
                    hasMore = false;
                }
                $.each(data, function () {
                    var $li = $("#userTemp").clone();
                    $li.css("display", "block");
                    $li.find(".headImg").attr("src", this.headImgUrl);
                    if (this.follow == 1) {
                        $li.find(".focus").html("已经关注");
                    } else {
                        $li.find(".focus").html("添加关注");
                    }
                    $li.find(".media-heading").html(this.loginName);
                    $li.find(".worksCount").html(this.worksCount);
                    $li.find(".followCount").html(this.followCount);
                    $("#user-list").append($li);
                });
            });
        }

        $(".btn-more").on("click", function () {
            if (hasMore) {
                pageIndex++;
                load(pageIndex, pageSize, keywords);
            }
        })
    });

</script>
<!--content end-->
</@htmlBody>
<@footerJS>
</@footerJS>

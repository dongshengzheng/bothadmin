<#include "../layout/main.ftl"/>
全部作品分页
<#import "../layout/partPagingRefresh.ftl" as pagination />

<@htmlHead title="搜索作品结果">
</@htmlHead>
<@htmlBody>

<!--content start-->
<div class="container">

    <div class="row">
        <div class="col-sm-9 col-sm-offset-1 text-left"
             style="background: rgb(237,238,239);margin-top: 20px;padding-top: 10px;padding-bottom: 10px;border:1px solid #E9EAEB;font-size: 16px">
            搜索作品结果
        </div>
        <div class="col-sm-9 col-sm-offset-1" style="border-right: 1px solid #E9EAEB;
                    border-left: 1px solid #E9EAEB;
                    border-bottom: 1px solid #E9EAEB;margin-bottom: 50px;">
            <div id="all_works_page_content" style="margin-top: 30px;">
                <ul id="works-list" class="list-unstyled row portfolio-box">

                </ul>
                <button type="button" class="btn-u btn-u-default btn-u-sm btn-block btn-more">加载更多</button>
            </div>

        <#--<div class=" text-right" style="margin-top: 30px">-->
        <#--<ul class="pagination">-->
        <#--<@pagination.pages 1..worksPaging.totalPages worksPaging.current/>-->
        <#--</ul>-->
        <#--</div>-->
        </div>


    </div>
</div>


<li class="col-sm-4 md-margin-bottom-50" style="display: none;" id="worksTemp">
    <a id="works_img" href="" class="thumbnail fancybox" data-rel="gallery" title="" href="">
        <img onerror="nofind(1)" class="full-width img-responsive works-image" src="" alt="">
    </a>
    <div class="headline-left margin-bottom-10">
        <h3 id="works_name" class="headline-brd works-name"></h3>
    </div>
    <small class="project-tag">
        <i class="fa fa-tag"></i>
        <a id="works_des" href="javascript:void(0)"></a>
    </small>
    <p class="works-remarks"></p>
</li>

</div>
<script>
    $('img').error(function () {
        $(this).attr('src', "http://windyeel.oss-cn-shanghai.aliyuncs.com/global/img/default.png");
    });


    pageIndex = 1;
    hasMore = true;
    var keywords = "${RequestParameters.keywords!''}";

    $("#headerHome").addClass("active");
    $(document).ready(function () {

        load(1, keywords);
        function load(pageIndex, keywords) {
            $.post("/works", {pageIndex: pageIndex, keywords: keywords}, function (data) {
                if (pageIndex >= data.pages) {
                    // 数据加载完毕了
                    $(".btn-more").html("客官，这次真没了");
                    hasMore = false;
                }
                $.each(data.records, function () {
                    var $li = $("#worksTemp").clone();
                    $li.removeAttr("id").css("display", "block");
                    $li.find(".works-image").attr("src", "http://windyeel.img-cn-shanghai.aliyuncs.com/" + this.images + "?x-oss-process=image/resize,m_fill,h_331,w_525");
                    $li.find("#works_des").html(this.breed);
                    $li.find("#works_name").html(this.name);
                    $li.find("#works_img").attr("href", "${staticPath}/works/detail/" + this.id);
                    $("#works-list").append($li);
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
<!--content end-->
</@htmlBody>
<@footerJS>
</@footerJS>

<#include "layout/main.ftl"/>

<#--全部作品分页-->
<#import "layout/partPagingRefresh.ftl" as pagination />

<@htmlHead title="金石典当">
<link rel="stylesheet" href="${staticPath}/assets/css/style.css">
<link rel="stylesheet" href="${staticPath}/assets/plugins/line-icons/line-icons.css">
</@htmlHead>

<@htmlBody>
<div class="wrapper">
    <div class="tp-banner-container">
        <div class="tp-banner">
            <ul>
                <!-- SLIDE -->
                <li class="revolution-mch-1" data-transition="fade" data-slotamount="5" data-masterspeed="1000"
                    data-title="Slide 1">
                    <!-- MAIN IMAGE -->
                    <img src="${staticPath}/assets/img/index/1.jpg" alt="darkblurbg" data-bgfit="cover"
                         data-bgposition="left top" data-bgrepeat="no-repeat">
                </li>
                <!-- END SLIDE -->

                <!-- SLIDE -->
                <li class="revolution-mch-1" data-transition="fade" data-slotamount="5" data-masterspeed="1000"
                    data-title="Slide 2">
                    <!-- MAIN IMAGE -->
                    <img src="${staticPath}/assets/img/index/5.jpg" alt="darkblurbg" data-bgfit="cover"
                         data-bgposition="left top" data-bgrepeat="no-repeat">
                </li>
                <!-- END SLIDE -->

                <!-- SLIDE -->
                <li class="revolution-mch-1" data-transition="fade" data-slotamount="5" data-masterspeed="1000"
                    data-title="Slide 3">
                    <!-- MAIN IMAGE -->
                    <img src="${staticPath}/assets/img/index/3.jpg" alt="darkblurbg" data-bgfit="cover"
                         data-bgposition="right top" data-bgrepeat="no-repeat">
                </li>
                <!-- END SLIDE -->

                <!-- SLIDE -->
                <li class="revolution-mch-1" data-transition="fade" data-slotamount="5" data-masterspeed="1000"
                    data-title="Slide 4">
                    <!-- MAIN IMAGE -->
                    <img src="${staticPath}/assets/img/index/2.jpg" alt="darkblurbg" data-bgfit="cover"
                         data-bgposition="left top" data-bgrepeat="no-repeat">
                </li>
                <!-- END SLIDE -->

                <!-- SLIDE -->
                <li class="revolution-mch-1" data-transition="fade" data-slotamount="5" data-masterspeed="1000"
                    data-title="Slide 5">
                    <!-- MAIN IMAGE -->
                    <img src="${staticPath}/assets/img/index/4.jpg" alt="darkblurbg" data-bgfit="cover"
                         data-bgposition="right top" data-bgrepeat="no-repeat">
                </li>
                <!-- END SLIDE -->
            </ul>
            <div class="tp-bannertimer tp-bottom"></div>
        </div>
    </div>
    <!--=== End Slider ===-->

    <div class="container content-md">
        <div class="headline-center">
            <h2>全部作品</h2>
        </div>
        <ul id="works-list" class="list-unstyled row portfolio-box">
        </ul>
        <button type="button" class="btn-u btn-u-default btn-u-sm btn-block btn-more">加载更多</button>
    </div>
</div>

<li class="col-sm-4" style="display: none;" id="worksTemp">
    <a id="works_img" href="" class="thumbnail fancybox" data-rel="gallery" title="" href="">
        <img class="full-width img-responsive works-image" src="" alt="">
        <#--<span class="portfolio-box-in">-->
            <#--<i class="rounded-x icon-magnifier-add"></i>-->
        <#--</span>-->
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
</@htmlBody>
<@footerJS>
<script>
    pageIndex = 1;
    hasMore = true;

    $("#headerHome").addClass("active");
    $(document).ready(function () {
        load(1);
        function load(pageIndex) {
            $.post("/works", {pageIndex: pageIndex}, function (data) {
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
                    $li.find("#works_img").attr("href","${staticPath}/works/detail/" + this.id);
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
</@footerJS>

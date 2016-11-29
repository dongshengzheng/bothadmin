<#include "layout/main.ftl"/>

<#--全部作品分页-->
<#import "layout/partPagingRefresh.ftl" as pagination />

<@htmlHead title="金石典当">

</@htmlHead>

<@htmlBody>
<!--body bg white-->
<!--head start-->

<!--head end-->
<!--=== Slider ===-->
<div class="tp-banner-container">
    <div class="tp-banner">
        <ul>
            <!-- SLIDE -->
            <li class="revolution-mch-1" data-transition="fade" data-slotamount="5" data-masterspeed="1000"
                data-title="Slide 1">
                <!-- MAIN IMAGE -->
                <img src="http://localhost:8080/assets/img/index/1.jpg" alt="darkblurbg" data-bgfit="cover"
                     data-bgposition="left top" data-bgrepeat="no-repeat">
            </li>
            <!-- END SLIDE -->

            <!-- SLIDE -->
            <li class="revolution-mch-1" data-transition="fade" data-slotamount="5" data-masterspeed="1000"
                data-title="Slide 2">
                <!-- MAIN IMAGE -->
                <img src="http://localhost:8080/assets/img/index/5.jpg" alt="darkblurbg" data-bgfit="cover"
                     data-bgposition="left top" data-bgrepeat="no-repeat">
            </li>
            <!-- END SLIDE -->

            <!-- SLIDE -->
            <li class="revolution-mch-1" data-transition="fade" data-slotamount="5" data-masterspeed="1000"
                data-title="Slide 3">
                <!-- MAIN IMAGE -->
                <img src="http://localhost:8080/assets/img/index/3.jpg" alt="darkblurbg" data-bgfit="cover"
                     data-bgposition="right top" data-bgrepeat="no-repeat">
            </li>
            <!-- END SLIDE -->

            <!-- SLIDE -->
            <li class="revolution-mch-1" data-transition="fade" data-slotamount="5" data-masterspeed="1000"
                data-title="Slide 4">
                <!-- MAIN IMAGE -->
                <img src="http://localhost:8080/assets/img/index/2.jpg" alt="darkblurbg" data-bgfit="cover"
                     data-bgposition="left top" data-bgrepeat="no-repeat">
            </li>
            <!-- END SLIDE -->

            <!-- SLIDE -->
            <li class="revolution-mch-1" data-transition="fade" data-slotamount="5" data-masterspeed="1000"
                data-title="Slide 5">
                <!-- MAIN IMAGE -->
                <img src="http://localhost:8080/assets/img/index/4.jpg" alt="darkblurbg" data-bgfit="cover"
                     data-bgposition="right top" data-bgrepeat="no-repeat">
            </li>
            <!-- END SLIDE -->
        </ul>
        <div class="tp-bannertimer tp-bottom"></div>
    </div>
</div>
<!--=== End Slider ===-->
<!--content start-->
<div class="container content-sm">
    <div class="headline-center margin-bottom-60">
        <h2>全部作品</h2>
    </div>

    <div id="all_works_page_content">

    </div>


</div>
<!--paging start-->
<div class="container text-right" style="margin-top: -40px">
    <div class="row">
        <div class="col-md-12">
            <ul class="pagination">
                <@pagination.pages 1..50 3/>
            </ul>
        </div>

    </div>
</div>
<!--content end-->
<!--FOOTER-->

<!--FOOTER END-->
<script id="all_works" type="mustache">
<ul class="list-unstyled row portfolio-box">
            <li class="col-sm-4 md-margin-bottom-50">
                <a class="thumbnail fancybox" data-rel="gallery" title="Project One"
                   href="http://localhost:8080/assets/img/main/img9.jpg">
                    <img class="full-width img-responsive" src="http://localhost:8080/assets/img/main/img9.jpg" alt="">
                    <span class="portfolio-box-in">
                            <i class="rounded-x icon-magnifier-add"></i>
                        </span>
                </a>
                <div class="headline-left margin-bottom-10"><h3 class="headline-brd">纯手工打造</h3></div>
                <small class="project-tag"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                        href="page_home10.html#">Business</a></small>
                <p>鸡血石，星辰沙条带昆凌身价东方拉斯加可浪费</p>
            </li>

            <li class="col-sm-4 md-margin-bottom-50">
                <a class="thumbnail fancybox" data-rel="gallery" title="Project One"
                   href="http://localhost:8080/assets/img/main/img9.jpg">
                    <img class="full-width img-responsive" src="http://localhost:8080/assets/img/main/img9.jpg" alt="">
                    <span class="portfolio-box-in">
                            <i class="rounded-x icon-magnifier-add"></i>
                        </span>
                </a>
                <div class="headline-left margin-bottom-10"><h3 class="headline-brd">纯手工打造</h3></div>
                <small class="project-tag"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                        href="page_home10.html#">Business</a></small>
                <p>鸡血石，星辰沙条带昆凌身价东方拉斯加可浪费</p>
            </li>

            <li class="col-sm-4 md-margin-bottom-50">
                <a class="thumbnail fancybox" data-rel="gallery" title="Project One"
                   href="http://localhost:8080/assets/img/main/img9.jpg">
                    <img class="full-width img-responsive" src="http://localhost:8080/assets/img/main/img9.jpg" alt="">
                    <span class="portfolio-box-in">
                            <i class="rounded-x icon-magnifier-add"></i>
                        </span>
                </a>
                <div class="headline-left margin-bottom-10"><h3 class="headline-brd">纯手工打造</h3></div>
                <small class="project-tag"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                        href="page_home10.html#">Business</a></small>
                <p>鸡血石，星辰沙条带昆凌身价东方拉斯加可浪费</p>
            </li>

            <li class="col-sm-4 md-margin-bottom-50">
                <a class="thumbnail fancybox" data-rel="gallery" title="Project One"
                   href="http://localhost:8080/assets/img/main/img9.jpg">
                    <img class="full-width img-responsive" src="http://localhost:8080/assets/img/main/img9.jpg" alt="">
                    <span class="portfolio-box-in">
                            <i class="rounded-x icon-magnifier-add"></i>
                        </span>
                </a>
                <div class="headline-left margin-bottom-10"><h3 class="headline-brd">纯手工打造</h3></div>
                <small class="project-tag"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                        href="page_home10.html#">Business</a></small>
                <p>鸡血石，星辰沙条带昆凌身价东方拉斯加可浪费</p>
            </li>

            <li class="col-sm-4 md-margin-bottom-50">
                <a class="thumbnail fancybox" data-rel="gallery" title="Project One"
                   href="http://localhost:8080/assets/img/main/img9.jpg">
                    <img class="full-width img-responsive" src="http://localhost:8080/assets/img/main/img9.jpg" alt="">
                    <span class="portfolio-box-in">
                            <i class="rounded-x icon-magnifier-add"></i>
                        </span>
                </a>
                <div class="headline-left margin-bottom-10"><h3 class="headline-brd">纯手工打造</h3></div>
                <small class="project-tag"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                        href="page_home10.html#">Business</a></small>
                <p>鸡血石，星辰沙条带昆凌身价东方拉斯加可浪费</p>
            </li>

            <li class="col-sm-4 md-margin-bottom-50">
                <a class="thumbnail fancybox" data-rel="gallery" title="Project One"
                   href="http://localhost:8080/assets/img/main/img9.jpg">
                    <img class="full-width img-responsive" src="http://localhost:8080/assets/img/main/img9.jpg" alt="">
                    <span class="portfolio-box-in">
                            <i class="rounded-x icon-magnifier-add"></i>
                        </span>
                </a>
                <div class="headline-left margin-bottom-10"><h3 class="headline-brd">纯手工打造</h3></div>
                <small class="project-tag"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                        href="page_home10.html#">Business</a></small>
                <p>鸡血石，星辰沙条带昆凌身价东方拉斯加可浪费</p>
            </li>
        </ul>

</script>
</@htmlBody>
<@footerJS>
<script>
    $(document).ready(function () {

        $(".pageRefreshBtn").bind("click", function (e) {
//            全部作品局部刷新分页
            getPage(parseInt(this.text));
        });

        getPage(1);

        function getPage(page) {
//            $.ajax({
//                type: "get",
//                url: "http://localhost:8080/site/main/getPaging?page=" + page,
//                contentType: "application/json",
//                dataType: "json",
//                success: function (result) {
//                    var tpl = $("#all_works")[0].innerHTML;
//                    var html = Mustache.render(tpl, result);
//                    $("#all_works_page_content")[0].innerHTML = html;
//                }
//            });

            var tpl = $("#all_works")[0].innerHTML;
            var html = Mustache.render(tpl, {});
            $("#all_works_page_content")[0].innerHTML = html;

        }


    });
</script>
</@footerJS>

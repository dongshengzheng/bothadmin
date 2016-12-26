<#include "layout/main.ftl"/>

<#--全部作品分页-->
<#import "layout/partPagingRefresh.ftl" as pagination />

<@htmlHead title="金石典当">
<link rel="stylesheet" href="${staticPath}/assets/css/style.css">
<link rel="stylesheet" href="${staticPath}/assets/css/pages/profile.css">
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
    <div class="headline-center">
        <h2>全部作品</h2>
    </div>
    <div class="container content-md">
        <ul class="list-unstyled row portfolio-box">
            <li class="col-sm-4 md-margin-bottom-50">
                <a class="thumbnail fancybox" data-rel="gallery" title="Project One" href="assets/img/main/img9.jpg">
                    <img class="full-width img-responsive" src="assets/img/main/img9.jpg" alt="">
                    <span class="portfolio-box-in">
                        <i class="rounded-x icon-magnifier-add"></i>
                    </span>
                </a>
                <div class="headline-left margin-bottom-10"><h3 class="headline-brd">Project One</h3></div>
                <small class="project-tag"><i class="fa fa-tag"></i><a href="feature_news_blocks.html#">Technology</a>,
                    <a href="feature_news_blocks.html#">Business</a></small>
                <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, justo sit amet </p>
            </li>
            <li class="col-sm-4 md-margin-bottom-50">
                <a class="thumbnail fancybox" data-rel="gallery" title="Project Two" href="assets/img/main/img22.jpg">
                    <img class="full-width img-responsive" src="assets/img/main/img22.jpg" alt="">
                    <span class="portfolio-box-in">
                        <i class="rounded-x icon-magnifier-add"></i>
                    </span>
                </a>
                <div class="headline-left margin-bottom-10"><h3 class="headline-brd">Project Two</h3></div>
                <small class="project-tag"><i class="fa fa-tag"></i><a href="feature_news_blocks.html#">Technology</a>,
                    <a href="feature_news_blocks.html#">Business</a></small>
                <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, justo sit amet </p>
            </li>
            <li class="col-sm-4">
                <a class="thumbnail fancybox" data-rel="gallery" title="Project Three" href="assets/img/main/img18.jpg">
                    <img class="full-width img-responsive" src="assets/img/main/img18.jpg" alt="">
                    <span class="portfolio-box-in">
                        <i class="rounded-x icon-magnifier-add"></i>
                    </span>
                </a>
                <div class="headline-left margin-bottom-10"><h3 class="headline-brd">Project Three</h3></div>
                <small class="project-tag"><i class="fa fa-tag"></i><a href="feature_news_blocks.html#">Technology</a>,
                    <a href="feature_news_blocks.html#">Business</a></small>
                <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, justo sit amet </p>
            </li>
        </ul>
    </div>
</div>

</@htmlBody>
<@footerJS>
<script>
    $("#headerHome").addClass("active");
    $(document).ready(function () {
    });
</script>
</@footerJS>

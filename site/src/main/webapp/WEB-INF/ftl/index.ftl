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
<!--content start-->
<div id="workss" class="container content-sm">
    <div class="headline-center margin-bottom-60">
        <h2>全部作品</h2>
    </div>
    <div id="all_works_page_content">
        <ul class="list-unstyled row portfolio-box">
            <#list worksPaging.data as works>
                <li class="col-sm-4 md-margin-bottom-50">
                    <a href="${staticPath}/works/detail/${works.id}"><img class="full-width img-responsive" src="${works.images}" alt=""></a>
                    <div class="headline-left margin-bottom-10"><h3 class="headline-brd">${works.name}</h3></div>
                    <small class="project-tag"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                            href="page_home10.html#">Business</a></small>
                    <p style="">${works.remarks}</p>
                </li>
            </#list>
            <button type="button" class="btn-u btn-u-default btn-u-sm btn-block">加载更多</button>
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

<#include "../layout/main.ftl"/>
<#--全部作品分页-->
<#import "../layout/partPagingRefresh.ftl" as pagination />

<@htmlHead title="搜索用户结果">
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
                <ul class="list-unstyled row portfolio-box">
                    <#list worksPaging.data as works>
                        <li class="col-sm-4 md-margin-bottom-50">
                            <a href="${staticPath}/works/detail/${works.id}"><img class="full-width img-responsive"
                                                                                  src="${works.images}" alt=""></a>
                            <div class="headline-left margin-bottom-10"><h3 class="headline-brd">${works.name}</h3>
                            </div>
                            <small class="project-tag"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>,
                                <a
                                        href="page_home10.html#">Business</a></small>
                            <p style="">${works.remarks}</p>
                        </li>
                    </#list>
                </ul>


            </div>

            <div class=" text-right" style="margin-top: 30px">
                <ul class="pagination">
                    <@pagination.pages 1..worksPaging.totalPages worksPaging.current/>
                </ul>

            </div>
        </div>


    </div>
</div>


</div>
<!--content end-->
</@htmlBody>
<@footerJS>
</@footerJS>

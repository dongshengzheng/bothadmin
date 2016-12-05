<#--局部分页刷新-->
<#function max x y>
    <#if (x<y)><#return y><#else><#return x></#if>
</#function>
<#function min x y>
    <#if (x<y)><#return x><#else><#return y></#if>
</#function>
<#macro pages totalPages p>
    <#assign size = totalPages?size>
    <#if (p<=3)> <#-- p among first 5 pages -->
        <#assign interval = 1..(min(5,size))>
    <#elseif ((size-p)<5)> <#-- p among last 5 pages -->
        <#assign interval = (max(1,(size-4)))..size >
    <#else>
        <#assign interval = (p-2)..(p+2)>
    </#if>
    <#if !(interval?seq_contains(1))>
        <#if 1=p>
        <li class="active "><a class="pageRefreshBtn" href="javascript:;">1</a></li>  <#t>
        <#else>
        <li><a class="pageRefreshBtn" href="javascript:;">1</a></li> <#t>
        </#if>

    <li><a href="javascript:;" onclick="javascript: return false">...</a></li>
    </#if>
    <#list interval as page>
        <#if page=p>
        <li class="active"><a class="pageRefreshBtn" href="javascript:;">${page}</a></li>  <#t>
        <#else>
        <li><a class="pageRefreshBtn" href="javascript:;">${page}</a></li> <#t>

        </#if>
    </#list>
    <#if !(interval?seq_contains(size))>
    <li><a href="javascript:;" onclick="javascript: return false">...</a></li>
        <#if size=p>
        <li class="active"><a  class="pageRefreshBtn" href="javascript:;">${size}</a></li>  <#t>
        <#else>
        <li><a class="pageRefreshBtn" href="javascript:;">${size}</a></li> <#t>
        </#if>

        <#lt>
    </#if>
</#macro>
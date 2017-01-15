<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">作品名称</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="name" class="weui-input" type="tel" value="${sessionScope.registerWorksName}"
               disabled>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">质地一</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="zhidi">
            <option value="">请选择质地一</option>
            <c:forEach items="${zhidi1}" var="item">
                <option value="${item.value}"
                        <c:if test="${worksLevel.zhidi==item.value}">selected</c:if>
                >${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">质地二</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="zhidi2">
            <option value="">请选择质地二</option>
            <c:forEach items="${zhidi2}" var="item">
                <option value="${item.value}"
                        <c:if test="${worksLevel.zhidi2==item.value}">selected</c:if>
                >${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">感观</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="ganguan">
            <option value="">请选择感观</option>
            <c:forEach items="${ganguan}" var="item">
                <option value="${item.value}"
                        <c:if test="${worksLevel.ganguan==item.value}">selected</c:if>
                >${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">磨氏度</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="moshidu">
            <option value="">请选择磨氏度</option>
            <c:forEach items="${moshidu}" var="item">
                <option value="${item.value}"
                        <c:if test="${worksLevel.moshidu==item.value}">selected</c:if>
                >${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">血量</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="xueliang">
            <option value="">请选择血量</option>
            <c:forEach items="${xueliang}" var="item">
                <option value="${item.value}"
                        <c:if test="${worksLevel.xueliang==item.value}">selected</c:if>
                >${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">血色</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="xuese">
            <option value="">请选择血色</option>
            <c:forEach items="${xuese}" var="item">
                <option value="${item.value}"
                        <c:if test="${worksLevel.xuese==item.value}">selected</c:if>
                >${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">血形</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="xuexing">
            <option value="">请选择血形</option>
            <c:forEach items="${xuexing}" var="item">
                <option value="${item.value}"
                        <c:if test="${worksLevel.xuexing==item.value}">selected</c:if>
                >${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">浓艳度</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="nongyandu">
            <option value="">请选择浓艳度</option>
            <c:forEach items="${nongyandu}" var="item">
                <option value="${item.value}"
                        <c:if test="${worksLevel.nongyandu==item.value}">selected</c:if>
                >${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">净度</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="chunjingdu">
            <option value="">请选择净度</option>
            <c:forEach items="${jingdu}" var="item">
                <option value="${item.value}"
                        <c:if test="${worksLevel.chunjingdu==item.value}">selected</c:if>
                >${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">地色</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="dise">
            <option value="">请选择地色</option>
            <c:forEach items="${dise}" var="item">
                <option value="${item.value}"
                        <c:if test="${worksLevel.dise==item.value}">selected</c:if>
                >${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">活筋</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="liu">
            <option value="">请选择活筋</option>
            <c:forEach items="${liu}" var="item">
                <option value="${item.value}"
                        <c:if test="${worksLevel.liu==item.value}">selected</c:if>
                >${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">裂</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="lie">
            <option value="">请选择裂</option>
            <c:forEach items="${lie}" var="item">
                <option value="${item.value}"
                        <c:if test="${worksLevel.lie==item.value}">selected</c:if>
                >${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">印章</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="inithanxueliang">
            <option value="">请选择印章</option>
            <c:forEach items="${mian}" var="item">
                <option value="${item.value}"
                        <c:if test="${worksLevel.inithanxueliang==item.value}">selected</c:if>
                >${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">含血方式</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="hanxuefangshi">
            <option value="">请选择含血方式</option>
            <c:forEach items="${hanxuefangshi}" var="item">
                <option value="${item.value}"
                        <c:if test="${worksLevel.hanxuefangshi==item.value}">selected</c:if>
                >${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">自然石皮</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="ziranshipi">
            <option value="">请选择自然石皮</option>
            <c:forEach items="${自然石皮}" var="item">
                <option value="${item.value}"
                        <c:if test="${worksLevel.ziranshipi==item.value}">selected</c:if>
                >${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
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
    <div class="weui-cell__hd"><label class="weui-label">质地</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="zhidi2">
            <option value="">请选择质地</option>
            <c:forEach items="${zhidi2}" var="item">
                <option value="${item.value}"
                        <c:if test="${worksLevel.zhidi2==item.value}">selected</c:if>
                >${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">自然石皮</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="hanxuefangshi">
            <option value="">请选择自然石皮</option>
            <c:forEach items="${自然石皮}" var="item">
                <option value="${item.value}"
                        <c:if test="${worksLevel.ziranshipi==item.value}">selected</c:if>
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

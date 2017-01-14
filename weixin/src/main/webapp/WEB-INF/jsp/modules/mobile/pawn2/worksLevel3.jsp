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
            <option value="" selected>请选择质地一</option>
            <c:forEach items="${zhidi1}" var="item">
                <option value="${item.value}">${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">质地二</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="zhidi2">
            <option value="" selected>请选择质地二</option>
            <c:forEach items="${zhidi2}" var="item">
                <option value="${item.value}">${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">感观</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="ganguan">
            <option value="" selected>请选择感观</option>
            <c:forEach items="${ganguan}" var="item">
                <option value="${item.value}">${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">磨氏度</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="moshidu">
            <option value="" selected>请选择磨氏度</option>
            <c:forEach items="${moshidu}" var="item">
                <option value="${item.value}">${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">血量</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="xueliang">
            <option value="" selected>请选择血量</option>
            <c:forEach items="${xueliang}" var="item">
                <option value="${item.value}">${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">血色</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="xuese">
            <option value="" selected>请选择血色</option>
            <c:forEach items="${xuese}" var="item">
                <option value="${item.value}">${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">血形</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="xuexing">
            <option value="" selected>请选择血形</option>
            <c:forEach items="${xuexing}" var="item">
                <option value="${item.value}">${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">浓艳度</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="nongyandu">
            <option value="" selected>请选择浓艳度</option>
            <c:forEach items="${nongyandu}" var="item">
                <option value="${item.value}">${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">净度</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="chunjingdu">
            <option value="" selected>请选择净度</option>
            <c:forEach items="${jingdu}" var="item">
                <option value="${item.value}">${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">地色</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="dise">
            <option value="" selected>请选择地色</option>
            <c:forEach items="${dise}" var="item">
                <option value="${item.value}">${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">活筋</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="liu">
            <option value="" selected>请选择活筋</option>
            <c:forEach items="${liu}" var="item">
                <option value="${item.value}">${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">裂</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="lie">
            <option value="" selected>请选择裂</option>
            <c:forEach items="${lie}" var="item">
                <option value="${item.value}">${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">印章</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="hanxuemian">
            <option value="" selected>请选择印章</option>
            <c:forEach items="${mian}" var="item">
                <option value="${item.value}">${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">含血方式</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="hanxuefangshi">
            <option value="" selected>请选择含血方式</option>
            <c:forEach items="${hanxuefangshi}" var="item">
                <option value="${item.value}">${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>

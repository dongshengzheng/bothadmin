<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">作品名称</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="worksShowName" class="weui-input worksShowName" type="tel" value="${works.name}" disabled>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">品种</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select id="breed" name="works.breed">
            <option value="">请选择品种</option>
            <c:forEach items="${pinzhong}" var="item">
                <option value="${item.value}"
                        <c:if test="${item.value==works.breed}">selected</c:if>  >${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">作品类型</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="works.type">
            <option value="">请选择作品类型</option>
            <c:forEach items="${zuopinleixing}" var="item">
                <option value="${item.value}"
                        <c:if test="${item.value==works.breed}">selected</c:if> >${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">尺寸(长-宽-高)</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="works.length" class="weui-input" type="tel" value="${works.length}" placeholder="长">
    </div>
    <div class="weui-cell__bd weui-cell_primary">
        <input class="weui-input" type="tel" value="cm" disabled>
    </div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="works.width" class="weui-input" type="tel" value="${works.width}" placeholder="宽">
    </div>
    <div class="weui-cell__bd weui-cell_primary">
        <input class="weui-input" type="tel" value="cm" disabled>
    </div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="works.height" class="weui-input" type="tel" value="${works.height}" placeholder="高">
    </div>
    <div class="weui-cell__bd weui-cell_primary">
        <input class="weui-input" type="tel" value="cm" disabled>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">重量</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="works.weight" class="weui-input" type="tel" value="${works.weight}" placeholder="请输入重量">
    </div>
    <div class="weui-cell__bd weui-cell_primary">
        <input class="weui-input" type="tel" value="g" disabled>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">工艺制作</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="works.gyType">
            <option value="">请选择工艺制作</option>
            <c:forEach items="${gyType}" var="item">
                <option value="${item.value}"
                        <c:if test="${item.value==works.gyType}">selected</c:if> >${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">篆刻级别</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="works.levelZk">
            <option value="">请选择篆刻级别</option>
            <c:forEach items="${level}" var="item">
                <option value="${item.value}"
                        <c:if test="${item.value==works.levelZk}">selected</c:if>>${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">矿区地域</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <select name="works.kqdy">
            <option value="">请选择矿区地域</option>
            <c:forEach items="${kqdy}" var="item">
                <option value="${item.value}"
                        <c:if test="${item.value==works.kqdy}">selected</c:if>>${item.label}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">制作人</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="works.maker" id="works-zhizuoren" class="weui-input" value="${works.maker}" placeholder="请输入制作人">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">制作时间</label></div>
    <div class="weui-cell__bd weui-cell_primary">
        <input name="makeTimeString" id="works-zhizuoshijian" class="weui-input"
               value="<fmt:formatDate value='${works.makeTime}' pattern="yyyy-MM-dd"/>"
               type="tel" placeholder="请选择制作时间">
    </div>
</div>
<div class="weui-cell">
    <div class="weui-cell__bd weui-cell_primary">
                    <textarea name="works.worksMeaning" id="works-zuopinquanshi" class="weui-textarea"
                              placeholder="作品诠释..."
                              rows="3">${works.worksMeaning}</textarea>
    </div>
</div>


<script>
    $(function () {
        $('#works-zhizuoshijian').calendar();
    });
</script>
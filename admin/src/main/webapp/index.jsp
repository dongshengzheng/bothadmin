<%@ page language="java" import="java.util.*, com.fish.idle.service.util.Const"
         pageEncoding="UTF-8" %>
<c:if test="${not empty sessionScope.sessionUser}">
    <jsp:forward page="/sys/index"/>
</c:if>
<c:if test="${empty sessionScope.sessionUser}">
    <jsp:forward page="/login_toLogin"/>
</c:if>
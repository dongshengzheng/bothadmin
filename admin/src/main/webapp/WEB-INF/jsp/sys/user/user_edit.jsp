<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<form class="form-horizontal" action="user/edit" method="post"
      id="defForm" callfn="refreshTable">
    <div class="modal-header">
        <div class='bootstrap-dialog-header'>
            <div class='bootstrap-dialog-close-button'
                 style='display: block;'>
                <button class='close' data-dismiss='modal' aria-label='Close'>×</button>
            </div>
            <div class='bootstrap-dialog-title'>修改用户</div>
        </div>
    </div>
    <div class="modal-body">
        <div class="container-fluid">
            <div class="form-group">
                <input type="hidden" name="userId" value="${pd.userId}"/> <label
                    for="loginName" class="col-sm-2 control-label">用户名</label>
                <div class="col-sm-7">
                    <input id="loginName" value="${pd.loginName}" type="text"
                           maxlength="32" class="form-control" readonly="readonly">
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-2 control-label">密码</label>
                <div class="col-sm-7">
                    <input id="password" name="password" type="password" maxlength="32"
                           minlength="2" class="form-control" placeholder="请输入密码">
                </div>
            </div>
            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">姓名</label>
                <div class="col-sm-7">
                    <input id="name" name="name" value="${pd.name}" type="text"
                           maxlength="32" class="form-control required" placeholder="请输入姓名">
                </div>
            </div>
            <div class="form-group">
                <label for="email" class="col-sm-2 control-label">邮箱</label>
                <div class="col-sm-7">
                    <input id="email" name="email" value="${pd.email}" type="text"
                           maxlength="32" class="form-control required" placeholder="请输入邮箱">
                </div>
            </div>
            <div class="form-group">
                <label for="phone" class="col-sm-2 control-label">电话</label>
                <div class="col-sm-7">
                    <input id="phone" name="phone" value="${pd.phone}" type="text"
                           maxlength="32" class="form-control required" placeholder="请输入电话">
                </div>
            </div>

            <div class="form-group">
                <label for="company" class="col-sm-2 control-label">公司名称</label>
                <div class="col-sm-7">
                    <input id="company" name="company" value="${pd.company}"  type="text" maxlength="32"
                           class="form-control required" placeholder="请输入公司名称">
                </div>
            </div>
            <div class="form-group">
                <label for="channelName" class="col-sm-2 control-label">渠道名</label>
                <div class="col-sm-7">
                    <input id="channelName" name="channelName" type="text" maxlength="32"
                           class="form-control required" placeholder="请输入渠道名" value="${pd.channel_name}">
                </div>
            </div>
            <div class="form-group">
                <label for="settlementType" class="col-sm-2 control-label">结算类型</label>
                <div class="col-sm-7">
                    <input id="settlementType" name="settlementType" value="${pd.settlement_type}" type="text" maxlength="32"
                           class="form-control required" placeholder="请输入结算类型">
                </div>
            </div>
            <div class="form-group">
                <label for="settlementDes" class="col-sm-2 control-label">结算备注</label>
                <div class="col-sm-7">
					<textarea id="settlementDes" name="settlementDes" class="form-control"
                              rows="3">${pd.settlement_des}</textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="description" class="col-sm-2 control-label">描述</label>
                <div class="col-sm-7">
					<textarea id="description" name="description" class="form-control"
                              rows="3">${pd.description}</textarea>
                </div>
            </div>
            <shiro:hasPermission name="user/editRole">
            <div class="form-group">
                <label for="description" class="col-sm-2 control-label">角色</label>
                <div class="col-sm-7">
                    <c:choose>
                        <c:when test="${pd.roles != null && fn:length(pd.roles) > 0}">
                            <c:forEach items="${pd.roles}" var="role" varStatus="vs">
                                <input type="checkbox" name="roleIds" value="${role.roleId}" ${role.checked ? "checked" : ""}>${role.roleName}
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="5">没有相关数据</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            </shiro:hasPermission>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <shiro:hasPermission name="user/edit">
            <button type="submit" class="btn btn-primary">保存</button>
        </shiro:hasPermission>
    </div>
</form>
<script type="text/javascript">
    $("#defForm").validate();
</script>
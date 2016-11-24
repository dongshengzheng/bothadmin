<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<form class="form-horizontal" action="office/add" method="post"
      id="defForm" callfn="refreshTable">
    <div class="modal-header">
        <div class='bootstrap-dialog-header'>
            <div class='bootstrap-dialog-close-button'
                 style='display: block;'>
                <button class='close' data-dismiss='modal' aria-label='Close'>×</button>
            </div>
            <div class='bootstrap-dialog-title'>新增部门</div>
        </div>
    </div>
    <div class="modal-body">
        <div class="container-fluid">
            <div class="form-group">
                <label for="type" class="col-sm-2 control-label">部门名称</label>
                <div class="col-sm-7">
                    <input id="type" name="type" value="${office.name}"
                           type="text" maxlength="32" minlength="2"
                           class="form-control required" placeholder="请输入部门名称">
                </div>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <shiro:hasPermission name="office/add">
            <button type="submit" class="btn btn-primary">保存</button>
        </shiro:hasPermission>
    </div>
</form>
<script type="text/javascript">
    $("#defForm").validate();
</script>
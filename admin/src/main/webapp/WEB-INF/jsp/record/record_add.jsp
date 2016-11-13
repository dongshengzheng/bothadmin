<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<form class="form-horizontal" action="record/add" method="post"
      id="defForm" callfn="refreshTable">
    <div class="modal-header">
        <div class='bootstrap-dialog-header'>
            <div class='bootstrap-dialog-close-button'
                 style='display: block;'>
                <button class='close' data-dismiss='modal' aria-label='Close'>×</button>
            </div>
            <div class='bootstrap-dialog-title'>新增数据</div>
        </div>
    </div>
    <div class="modal-body">
        <div class="container-fluid">
            <div class="form-group">
                <label for="channelName" class="col-sm-2 control-label">渠道名</label>
                <div class="col-sm-7">
                    <input id="channelName" name="channelName" type="text" maxlength="32"
                           minlength="2" class="form-control required" placeholder="请输入渠道名">
                </div>
            </div>
            <div class="form-group">
                <label for="appName" class="col-sm-2 control-label">应用名</label>
                <div class="col-sm-7">
                    <input id="appName" name="appName" type="text" maxlength="32"
                           minlength="2" class="form-control required" placeholder="请输入应用名">
                </div>
            </div>
            <div class="form-group">
                <label for="channelNo" class="col-sm-2 control-label">渠道编号</label>
                <div class="col-sm-7">
                    <input id="channelNo" name="channelNo" type="text" maxlength="32"
                           class="form-control required" placeholder="请输入渠道编号">
                </div>
            </div>
            <div class="form-group">
                <label for="increased" class="col-sm-2 control-label">新增</label>
                <div class="col-sm-7">
                    <input id="increased" name="increased" type="text" maxlength="32"
                           class="form-control required" placeholder="请输入新增">
                </div>
            </div>
            <div class="form-group">
                <label for="informationFees" class="col-sm-2 control-label">信息费</label>
                <div class="col-sm-7">
                    <input id="informationFees" name="informationFees" type="text" maxlength="32"
                           class="form-control required" placeholder="请输入信息费">
                </div>
            </div>
            <div class="form-group">
                <label for="settlementPercent" class="col-sm-2 control-label">结算比例</label>
                <div class="col-sm-7">
                    <input id="settlementPercent" name="settlementPercent" type="text" maxlength="32"
                           class="form-control required" placeholder="请输入结算比例">
                </div>
            </div>
            <div class="form-group">
                <label for="settlementValue" class="col-sm-2 control-label">结算类型</label>
                <div class="col-sm-7">
					<input id="settlementValue" name="settlementValue" class="form-control required" placeholder="请输入结算类型" />
                </div>
            </div>
            <div class="form-group">
                <label for="createDate" class="col-sm-2 control-label">日期</label>
                <div class="col-sm-7">
                    <input id="createDate" name="createDate" readonly type="text" class="form-control required" placeholder="请输入日期" />
                </div>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <shiro:hasPermission name="record/add">
            <button type="submit" class="btn btn-primary">保存</button>
        </shiro:hasPermission>
    </div>
</form>
<script type="text/javascript">
    $('#defForm').validate({
        rules: {
            appName: {
                required: true
            },
            createDate:{
                required: true
            }
        },
        messages: {
            appName: {
                required: "请输入应用名"
            },
            createDate:{
                required: "请输入时间"
            }
        }
    });


    $("#createDate").datetimepicker({
        format: 'yyyy-mm-dd',
        language: 'zh',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 'month',
        forceParse: 0,
        showMeridian: 0,
        pickerPosition: "bottom-left"
    });
</script>
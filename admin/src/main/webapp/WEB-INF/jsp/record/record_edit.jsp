<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<form class="form-horizontal" action="record/edit" method="post"
      id="defForm" callfn="refreshTable">
    <div class="modal-header">
        <div class='bootstrap-dialog-header'>
            <div class='bootstrap-dialog-close-button'
                 style='display: block;'>
                <button class='close' data-dismiss='modal' aria-label='Close'>×</button>
            </div>
            <div class='bootstrap-dialog-title'>修改数据</div>
        </div>
    </div>
    <div class="modal-body">
        <div class="container-fluid">
            <div class="form-group">
                <input type="hidden" name="id" value="${pd.id}"/>
                <label for="channelName" class="col-sm-2 control-label">渠道名</label>
                <div class="col-sm-7">
                    <input id="channelName" name="channelName" type="text" maxlength="32"
                           minlength="2" class="form-control required" placeholder="请输入渠道名" value="${pd.channel_name}">
                </div>
            </div>
            <div class="form-group">
                <label for="appName" class="col-sm-2 control-label">应用名</label>
                <div class="col-sm-7">
                    <input id="appName" name="appName" type="text" maxlength="32"
                           minlength="2" class="form-control required" placeholder="请输入应用名" value="${pd.app_name}">
                </div>
            </div>
            <div class="form-group">
                <label for="channelNo" class="col-sm-2 control-label">渠道编号</label>
                <div class="col-sm-7">
                    <input id="channelNo" name="channelNo" type="text" maxlength="32"
                           class="form-control required" placeholder="请输入渠道编号" value="${pd.channel_no}">
                </div>
            </div>
            <div class="form-group">
                <label for="increased" class="col-sm-2 control-label">新增</label>
                <div class="col-sm-7">
                    <input id="increased" name="increased" type="text" maxlength="32"
                           class="form-control required" placeholder="请输入新增" value="${pd.increased}">
                </div>
            </div>
            <div class="form-group">
                <label for="increased" class="col-sm-2 control-label">新增(改)</label>
                <div class="col-sm-7">
                    <input id="xIncreased" name="xIncreased" type="text" maxlength="32"
                           class="form-control required" placeholder="请输入新增" value="${pd.x_increased}">
                </div>
            </div>

            <div class="form-group">
                <label for="informationFees" class="col-sm-2 control-label">信息费</label>
                <div class="col-sm-7">
                    <input id="informationFees" name="informationFees" type="text" maxlength="32"
                           class="form-control required" placeholder="请输入信息费" value="${pd.information_fees}">
                </div>
            </div>

            <div class="form-group">
                <label for="informationFees" class="col-sm-2 control-label">信息费(改)</label>
                <div class="col-sm-7">
                    <input id="xInformationFees" name="xInformationFees" type="text" maxlength="32"
                           class="form-control required" placeholder="请输入信息费" value="${pd.x_information_fees}">
                </div>
            </div>
            <div class="form-group">
                <label for="settlementPercent" class="col-sm-2 control-label">结算比例</label>
                <div class="col-sm-7">
                    <input id="settlementPercent" name="settlementPercent" type="text" maxlength="32"
                           class="form-control required" placeholder="请输入结算比例" value="${pd.settlement_percent}">
                </div>
            </div>
            <div class="form-group">
                <label for="settlementValue" class="col-sm-2 control-label">结算金额</label>
                <div class="col-sm-7">
                    <input id="settlementValue" name="settlementValue" class="form-control" placeholder="请输入结算金额" value="${pd.settlement_value}">
                </div>
            </div>
            <div class="form-group">
                <label for="createDate" class="col-sm-2 control-label">日期</label>
                <div class="col-sm-7">
                    <input id="createDate" name="createDate" class="form-control"  readonly type="text"  placeholder="请输入日期" value="${pd.create_date}">
                </div>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <shiro:hasPermission name="record/edit">
            <button type="submit" class="btn btn-primary">保存</button>
        </shiro:hasPermission>
    </div>
</form>
<script type="text/javascript">
    $("#defForm").validate();

    $("#createDate").datetimepicker({
    });
</script>
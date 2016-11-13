<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="xianyu" uri="http://www.xianyu.com.cn/jsp/jstl/common" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<xianyu:navigater path="user"></xianyu:navigater>

<div class="row">
    <div class="col-md-12">
        <div class="portlet light bordered">
            <div class="portlet-body">
                <div class="table-toolbar">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="btn-group">
                                <shiro:hasPermission name="user/add">
                                    <button data-url="user/add" data-model="dialog" class="btn btn-outline btn-circle btn-sm green"> 新增
                                        <i class="fa fa-plus"></i>
                                    </button>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="user/batchDelete">

                                    <button data-url="user/batchDelete" data-msg="确定批量删除吗？" data-model="ajaxToDo" class="btn btn-outline btn-circle btn-sm green"
                                            data-checkbox-name="chx_default" data-callback="refreshTable">批量删除
                                        <i class="fa fa-times"></i>
                                    </button>
                                </shiro:hasPermission>
                            </div>
                        </div>
                        <div class="col-md-6">
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-bordered table-hover table-checkable order-column"
                       id="default_table">
                    <thead>
                    <tr>
                        <th width="10px" >
                            <input type='checkbox' name="chx_default"/>
                        </th>
                        <th>用户名</th>
                        <th>姓名</th>
                        <th>邮箱</th>
                        <th>电话</th>
                        <th>公司名称</th>
                        <th>渠道名</th>
                        <th>结算类型</th>
                        <th>结算备注</th>
                        <th>最近登录</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var defTable;
    $(document).ready(function () {
        defTable = $('#default_table').DataTable({
            "ordering": false,
            "pagingType": "simple_numbers",
            "autoWidth": false,
            "processing": true,
            "serverSide": true,
            "ajax": {
                "url": "user/list",
                "type": "post",
                "data": function (data) {
                    data.keyword = $("#keyword").val();
                }
            },
            "language": {
                "url": "<%=basePath%>assets/global/plugins/datatables/cn.txt"
            },
            "createdRow": function (row, data, index) {
                $('td:eq(0)', row).html("<input type='checkbox' name='chx_default' value='" + data.userId + "'/>");
            },
            "lengthMenu": [[5, 40, 60], [5, 40, 60]],
            "columns": [
                {"data": "userId", "orderable": false},
                {"data": "loginName", "orderable": false},
                {"data": "name"},
                {"data": "email"},
                {"data": "phone"},
                {"data": "company"},
                {"data": "channel_name"},
                {"data": "settlement_type"},
                {"data": "settlement_des"},
                {"data": "lastLogin"}
            ],
            "columnDefs": [{
                "targets": 10,
                "render": function (data, type, row) {
                    return ""
                    <shiro:hasPermission name="right/editBtn">
                    +'<a href="user/edit?userId=' + row.userId + '" class="btn btn-outline btn-circle btn-sm green" data-model="dialog"><i class="fa fa-edit"></i>编辑</a>'
                    </shiro:hasPermission>
                    <shiro:hasPermission name="right/deleteBtn">
                    +'<a href="user/delete?userId=' + row.userId +
                           '" data-msg="确定删除吗？"  data-model="ajaxToDo" data-callback="refreshTable" class="btn btn-outline btn-circle btn-sm green"><i class="fa fa-times"></i>删除</a>'
                    </shiro:hasPermission>
                    <shiro:hasPermission name="right/editRole">
                            +'<a href="user/editRole?userId=' + row.userId + '" class="btn btn-outline btn-circle btn-sm green" data-model="dialog"><i class="fa fa-user"></i>分配角色</a>'
                    </shiro:hasPermission>;
                }
            }],
            "drawCallback": function (settings) {
                drawICheck('defaultCheck', 'chx_default');
            },
            "initComplete": function () {
                var others = '<div class="input-group input-group-sm input-adjust">'
                        + '<div class="input-group-addon">'
                        + '<label for="startTime" style="margin-bottom: 0px;"><i class="fa fa-calendar"></i></label>'
                        + '</div>'
                        + '<input id="startTime" readonly name="startTime" type="text" class="form-control" placeholder="请输入开始时间" />'
                        + '</div>';
                initSearchForm(others, "搜索用户名和姓名");
                $("#startTime").datetimepicker({
                    format: 'yyyy-mm-dd hh:ii',
                    language: 'zh',
                    weekStart: 1,
                    todayBtn: 1,
                    autoclose: 1,
                    todayHighlight: 1,
                    startView: 2,
                    minView:'month',
                    forceParse: 0,
                    showMeridian: 0,
                    pickerPosition: "bottom-left"
                });
            }
        });
    });

    function refreshTable(toFirst) {
        if (toFirst) {//表格重绘，并跳转到第一页
            defTable.draw();
        } else {//表格重绘，保持在当前页
            defTable.draw(false);
        }
    }
</script>
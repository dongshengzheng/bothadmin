<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="xianyu" uri="http://www.xianyu.com.cn/jsp/jstl/common" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<xianyu:navigater path="office"></xianyu:navigater>

<div class="row">
    <div class="col-md-12">
        <div class="portlet light bordered">
            <div class="portlet-body">
                <div class="table-toolbar">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="btn-group">
                                <%--<shiro:hasPermission name="office/add">--%>
                                    <%--<button data-url="office/add" data-model="dialog"--%>
                                            <%--class="btn btn-outline btn-circle btn-sm green"> 新增--%>
                                        <%--<i class="fa fa-plus"></i>--%>
                                    <%--</button>--%>
                                <%--</shiro:hasPermission>--%>
                                <%--<shiro:hasPermission name="office/batchDelete">--%>
                                    <%--<button data-url="office/batchDelete" data-msg="确定批量删除吗？" data-model="ajaxToDo"--%>
                                            <%--class="btn btn-outline btn-circle btn-sm green"--%>
                                            <%--data-checkbox-name="chx_default" data-callback="refreshTable">批量删除--%>
                                        <%--<i class="fa fa-times"></i>--%>
                                    <%--</button>--%>
                                <%--</shiro:hasPermission>--%>
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
                        <th width="10px">
                            <input type='checkbox' name="chx_default"/>
                        </th>
                        <th>部门名称</th>
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
            "processing": true,
            "autoWidth": false,
            "serverSide": true,
            "ajax": {
                "url": "office/list",
                "type": "post",
                "data": function (data) {
                    data.keyword = $("#keyword").val();
                }
            },
            "language": {
                "url": "<%=basePath%>assets/global/plugins/datatables/cn.txt"
            },
            "createdRow": function (row, data, index) {
                $('td:eq(0)', row).html("<input type='checkbox' name='chx_default' value='" + data.id + "'/>");
            },
            "lengthMenu": [[5, 40, 60], [5, 40, 60]],
            "columns": [
                {"data": "id"},
                {"data": "name"},
            ],
            "columnDefs": [{
                "targets": 2,
                "render": function (data, type, row) {
                    return ""
                        <shiro:hasPermission name="office/editBtn">
                        + '<a href="office/edit?id=' + row.id + '" class="btn btn-outline btn-circle btn-sm green" data-model="dialog"><i class="fa fa-edit"></i>编辑</a>'
                        </shiro:hasPermission>
                        <shiro:hasPermission name="office/deleteBtn">
                        + '<a href="office/delete?id=' + row.id + '" data-msg="确定删除吗？"  data-model="ajaxToDo" data-callback="refreshTable" class="btn btn-outline btn-circle btn-sm green"><i class="fa fa-times"></i>删除</a>'
                        </shiro:hasPermission>;
                }
            }],
            "drawCallback": function () {
                drawICheck('defaultCheck', 'chx_default');
            },
            "initComplete": function () {
                initSearchForm(null, "搜索部门");
            }
        });
    });

    function refreshTable(toFirst) {
        //defaultTable.ajax.reload();
        if (toFirst) {//表格重绘，并跳转到第一页
            defTable.draw();
        } else {//表格重绘，保持在当前页
            defTable.draw(false);
        }
    }
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="xianyu" uri="http://www.xianyu.com.cn/jsp/jstl/common" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<xianyu:navigater path="record"></xianyu:navigater>

<div class="row">
    <div class="col-md-12">
        <div class="portlet light bordered">
            <div class="portlet-body">
                <div class="table-toolbar">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="btn-group">
                                <shiro:hasPermission name="record/add">
                                    <button data-url="record/add" data-model="dialog" class="btn btn-outline btn-circle btn-sm green"> 新增
                                        <i class="fa fa-plus"></i>
                                    </button>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="record/batchDelete">
                                    <button data-url="record/batchDelete" data-msg="确定批量删除吗？" data-model="ajaxToDo"
                                            class="btn btn-outline btn-circle btn-sm green"
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
                        <th width="10px">
                            <input type='checkbox' name="chx_default"/>
                        </th>
                        <th>渠道名</th>
                        <th>应用名</th>
                        <th>渠道号</th>
                        <th>新增</th>
                        <th>信息费</th>
                        <th>结算比例</th>
                        <th>结算金额</th>
                        <th>ap</th>
                        <th>新增(改)</th>
                        <th>信息费(改)</th>
                        <th>ap(改)</th>
                        <th>日期</th>

                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var defTable;
    var editor;
    $(document).ready(function () {
        editor = new $.fn.dataTable.Editor({
            ajax:"record/editor",
            idSrc: 'id',
            table: "#default_table",
            fields: [ {
                name: "channel_name"
            }, {
                name: "app_name"
            }, {
                name: "channel_no"
            }, {
                name: "increased"
            }, {
                name: "settlement_percent"
            }, {
                name: "information_fees"
            }, {
                name: "x_increased"
            }, {
                name: "x_information_fees"
            }
            ]
        });
        // Activate an inline edit on click of a table cell
        $('#default_table').on('click', 'tbody td:not(:first-child)', function (e) {
            editor.inline(this, {
                buttons: { label: '&gt;', fn: function () { this.submit(); } }
            });
        });
        defTable = $('#default_table').DataTable({
            "ordering": false,
            "pagingType": "simple_numbers",
            "autoWidth": false,
            "processing": true,
            "serverSide": true,
            "ajax": {
                "url": "record/list",
                "type": "post",

                "data": function (data) {
                    data.keyword = $("#keyword").val();
                    data.timeRange = $("#timeRange").val();
                }
            },
            "language": {
                "url": "<%=basePath%>assets/global/plugins/datatables/cn.txt"
            },
            "createdRow": function (row, data, index) {
                $('td:eq(0)', row).html("<input type='checkbox' name='chx_default' value='" + data.id + "'/>");
            },
            "lengthMenu": [[20, 30, 40], [20, 30, 40]],
            "columns": [
                {"data": "id", "orderable": false},
                {"data": "channel_name", "orderable": false},
                {"data": "app_name"},
                {"data": "channel_no"},
                {"data": "increased"},
                {"data": "information_fees"},
                {"data": "settlement_percent"},
                {"data": "settlement_value"},
                {"data": "ap"},
                {"data": "x_increased"},
                {"data": "x_information_fees"},
                {"data": "x_ap"},
                {
                    "data": "create_date", "type": "date",
                    "render": function (data) {
                        var date = new Date(data);
                        return date.Format("yyyy-MM-dd");
                    }
                }
            ],
            "drawCallback": function (settings) {
                drawICheck('defaultCheck', 'chx_default');
            },
            "initComplete": function () {
                var others = '<div class="input-group input-group-sm input-adjust">'
                        + '<div class="input-group-addon">'
                        + '<label for="timeRange" style="margin-bottom: 0px;"><i class="fa fa-calendar"></i></label>'
                        + '</div>'
                        + '<input id="timeRange" readonly name="timeRange" type="text" class="form-control" placeholder="请选择时间范围" style="min-width: 260px;" />'
                        + '</div>';
                initSearchForm(others, "渠道编号");
                $("#timeRange").daterangepicker({
                    locale: {
                        format: 'YYYY-MM-DD hh:mm:ss'
                    },
                    autoUpdateInput: false
                });
                $("#timeRange").on('apply.daterangepicker', function (ev, picker) {
                    $(this).val(picker.startDate.format('YYYY-MM-DD hh:mm:ss') + ' - ' + picker.endDate.format('YYYY-MM-DD hh:mm:ss'));
                });

                $("#timeRange").on('cancel.daterangepicker', function () {
                    $(this).val('');
                });

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
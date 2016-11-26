<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>

<div class="weui_cell weui_cell_warn" style="padding: 0px;">
    <div class="weui_cell">
        <div class="weui_cell_bd weui_cell_primary">
            <div class="weui_uploader">
                <div class="weui_uploader_hd weui_cell">
                    <div class="weui_cell_bd weui_cell_primary">图片上传</div>
                    <div class="weui_cell_ft js_counter">0/6</div>
                </div>
                <div class="weui_uploader_bd">
                    <ul class="weui_uploader_files">
                        <!-- 预览图插入到这 --> </ul>
                    <div class="weui_uploader_input_wrp">
                        <input class="weui_uploader_input js_file" type="file"
                               accept="image/jpg,image/jpeg,image/png,image/gif" multiple=""></div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="weui_dialog_alert" style="display: none;">
    <div class="weui_mask"></div>
    <div class="weui_dialog">
        <div class="weui_dialog_hd"><strong class="weui_dialog_title">警告</strong>
        </div>
        <div class="weui_dialog_bd">弹窗内容，告知当前页面信息等</div>
        <div class="weui_dialog_ft">
            <a href="javascript:;" class="weui_btn_dialog primary">确定</a>
        </div>
    </div>
</div>
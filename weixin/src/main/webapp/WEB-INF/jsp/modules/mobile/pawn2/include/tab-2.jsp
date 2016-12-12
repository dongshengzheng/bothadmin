<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="taglib.jsp" %>
<div class="fixed-footer">
    <div class="weui-tabbar">
        <a href="${ctx}/mobile/works" class="weui-tabbar__item">
            <div class="weui-tabbar__icon">
                <img src="${ctxStatic}/img/cut/index-tab-ico-1.png" alt="">
            </div>
            <p class="weui-tabbar__label">首页</p>
        </a>
        <a href="${ctx}/mobile/worksRegister1" class="weui-tabbar__item">
            <div class="weui-tabbar__icon">
                <img src="${ctxStatic}/img/cut/register-tab-icon.png" alt="">
            </div>
            <p class="weui-tabbar__label">登记申请</p>
        </a>
        <a href="${ctx}/mobile/my" class="weui-tabbar__item">
            <div class="weui-tabbar__icon">
                <img src="${ctxStatic}/img/cut/my-tab-icon-1.png" alt="">
            </div>
            <p class="weui-tabbar__label">我的</p>
        </a>
    </div>
</div>
<div class="fixed-footer-blank">
</div>
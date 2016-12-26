<#include "../layout/main.ftl"/>

<@htmlHead title="用户中心">
<link rel="stylesheet" href="${staticPath}/assets/css/pages/profile.css">
<link rel="stylesheet" href="${staticPath}/assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
<link rel="stylesheet" href="${staticPath}/assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">
</@htmlHead>
<@htmlBody>
<!--=== Profile ===-->
<div class="container content profile">
    <div class="row">
        <!--Left Sidebar-->
        <div class="col-md-3 md-margin-bottom-40">
            <img class="img-responsive profile-img margin-bottom-20" src="${staticPath}/assets/img/team/img32-md.jpg" alt="">

            <ul class="list-group sidebar-nav-v1 margin-bottom-40" id="sidebar-nav-1">
                <li class="list-group-item ">
                    <a href="/user"><i class="fa fa-tachometer"></i>面板</a>
                </li>
                <li class="list-group-item">
                    <a href="/user/works"><i class="fa fa-user"></i> 我的作品</a>
                </li>
                <li class="list-group-item">
                    <a href="/user/transfer"><i class="fa fa-group"></i> 转让作品</a>
                </li>
                <li class="list-group-item">
                    <a href="/user/collect"><i class="fa fa-cubes"></i>收藏作品</a>
                </li>
                <li class="list-group-item">
                    <a href="/user/follow"><i class="fa fa-comments"></i>关注用户</a>
                </li>
                <li class="list-group-item">
                    <a href="/user/integral"><i class="fa fa-history"></i> 积分中心</a>
                </li>
                <li class="list-group-item active">
                    <a href="/user/settings"><i class="fa fa-cog"></i> 个人设置</a>
                </li>
            </ul>

            <hr>
            <div class="margin-bottom-50"></div>
            <!--Datepicker-->
            <form action="#" id="sky-form2" class="sky-form">
                <div id="inline-start"></div>
            </form>
            <!--End Datepicker-->
        </div>
        <!--End Left Sidebar-->
        <!-- Profile Content -->
        <div class="col-md-9">
            <div class="profile-body margin-bottom-20">
                <div class="tab-v1">
                    <ul class="nav nav-justified nav-tabs">
                        <li class="active"><a data-toggle="tab" href="page_profile_settings.html#profile">编辑个人资料</a></li>
                        <li><a data-toggle="tab" href="page_profile_settings.html#passwordTab">更改密码</a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="profile" class="profile-edit tab-pane fade in active">
                            <h2 class="heading-md">管理你的姓名，身份证，邮箱地址。</h2>
                            <br>
                            <form class="sky-form" id="sky-form4" action="#">
                                <dl class="dl-horizontal">
                                    <dt>用户名</dt>
                                    <dd>
                                        <section>
                                            <label class="input">
                                                <i class="icon-append fa fa-user"></i>
                                                <input type="text" placeholder="用户名" name="username">
                                                <b class="tooltip tooltip-bottom-right">请输入用户名</b>
                                            </label>
                                        </section>
                                    </dd>
                                    <dt>邮箱地址</dt>
                                    <dd>
                                        <section>
                                            <label class="input">
                                                <i class="icon-append fa fa-envelope"></i>
                                                <input type="email" name="email" placeholder="邮箱地址" >
                                            </label>
                                        </section>
                                    </dd>
                                    <dt>详细地址</dt>
                                    <dd>
                                        <section>
                                            <label class="input">
                                                <i class="icon-append fa fa-location-arrow"></i>
                                                <input type="text" name="password" placeholder="请输入详细地址">
                                            </label>
                                        </section>
                                    </dd>
                                    <dt>联系方式</dt>
                                    <dd>
                                        <section>
                                            <label class="input">
                                                <i class="icon-append fa fa-phone"></i>
                                                <input type="text" name="phone" placeholder="请输入联系方式">
                                            </label>
                                        </section>
                                    </dd>
                                    <dt>身份证</dt>
                                    <dd>
                                        <section>
                                            <label class="input">
                                                <i class="icon-append fa fa-lock"></i>
                                                <input type="text" name="phone" placeholder="请输入身份证">
                                            </label>
                                        </section>
                                    </dd>
                                    <dt>收藏偏好</dt>
                                    <dd>
                                        <section>
                                            <div class="inline-group">
                                                <label class="checkbox"><input type="checkbox" value="1" checked="" name="prefer"><i class="rounded-x"></i>玉器</label>
                                                <label class="checkbox"><input type="checkbox" value="2" name="prefer"><i class="rounded-x"></i>古玩</label>
                                                <label class="checkbox"><input type="checkbox" value="3" name="prefer"><i class="rounded-x"></i>古玩家</label>
                                            </div>
                                        </section>
                                    </dd>
                                </dl>
                                <label class="toggle toggle-change"><input type="checkbox" checked="" name="pub"><i class="no-rounded"></i>是否公开</label>
                                <br>
                                <button type="button" class="btn-u btn-u-default">取消</button>
                                <button class="btn-u" type="submit">保存</button>
                            </form>
                        </div>
                        <div id="passwordTab" class="profile-edit tab-pane fade">
                            <h2 class="heading-md">管理你的安全设置</h2>
                            <p>更改你的密码</p>
                            <br>
                            <form class="sky-form" id="sky-form4" action="#">
                                <dl class="dl-horizontal">
                                    <dt>登录名</dt>
                                    <dd>
                                        <section>
                                            <label class="input">
                                                <i class="icon-append fa fa-user"></i>
                                                <input type="text" placeholder="登录名" name="loginName">
                                                <b class="tooltip tooltip-bottom-right">请输入您的登录名</b>
                                            </label>
                                        </section>
                                    </dd>

                                    <dt>密码</dt>
                                    <dd>
                                        <section>
                                            <label class="input">
                                                <i class="icon-append fa fa-lock"></i>
                                                <input type="password" id="password" name="password" placeholder="请输入密码">
                                                <b class="tooltip tooltip-bottom-right">不要忘记了您的密码</b>
                                            </label>
                                        </section>
                                    </dd>
                                    <dt>确认密码</dt>
                                    <dd>
                                        <section>
                                            <label class="input">
                                                <i class="icon-append fa fa-lock"></i>
                                                <input type="password" name="passwordConfirm" placeholder="请再次输入密码">
                                                <b class="tooltip tooltip-bottom-right">不要忘记了您的密码</b>
                                            </label>
                                        </section>
                                    </dd>
                                </dl>

                                <button type="button" class="btn-u btn-u-default">取消</button>
                                <button class="btn-u" type="submit">保存</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</@htmlBody>
<@footerJS>
</@footerJS>

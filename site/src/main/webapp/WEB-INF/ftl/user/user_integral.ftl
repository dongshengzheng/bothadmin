<#include "../layout/main.ftl"/>

<@htmlHead title="用户中心">
<link rel="stylesheet" href="${staticPath}/assets/css/style.css">
<link rel="stylesheet" href="${staticPath}/assets/css/pages/profile.css">
<link rel="stylesheet" href="${staticPath}/assets/plugins/line-icons/line-icons.css">
<link rel="stylesheet" href="${staticPath}/assets/plugins/login-signup-modal-window/css/style.css">
<style>
    .fa-plus {
        color: #FF6400;
    }

    .fa-minus {
        color: #009FD9;
    }

    .score-value {
        width: 40%;
        margin-left: 8%;
        height: 80px;
        line-height: 72px;
        display: inline-block;
        border: 1px solid lightgray;
    }

    .score-value.selected {
        border: 2px solid red;
    }

    .score-value input {
        font-size: 20px;
        border: none;
        width: 50%;
        text-align: center;
        background-color: white;

    }

    .score-value input.left {
        color: #00BE41;
    }

    .score-value input.right {
        color: #FF0000;
    }


</style>
</@htmlHead>
<@htmlBody>
<!--=== Profile ===-->
<div class="container content profile">
    <div class="row">
        <!--Left Sidebar-->
        <div class="col-md-3 md-margin-bottom-40">
            <img onerror="nofind(2)" class="img-responsive profile-img margin-bottom-20"
                <#if Session.siteSessionUser.headImgUrl!?index_of('http')!=-1>
                 src="${Session.siteSessionUser.headImgUrl!}"
                <#else>
                 src="http://windyeel.img-cn-shanghai.aliyuncs.com/${Session.siteSessionUser.headImgUrl!}?x-oss-process=image/resize,m_fill,h_100,w_100"
                </#if>
                 alt="">
            <ul class="list-group sidebar-nav-v1 margin-bottom-40" id="sidebar-nav-1">
                <#--<li class="list-group-item ">-->
                    <#--<a href="/user"><i class="fa fa-tachometer"></i>面板</a>-->
                <#--</li>-->
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
                <li class="list-group-item active">
                    <a href="/user/integral"><i class="fa fa-history"></i> 积分中心</a>
                </li>
                <li class="list-group-item">
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
            <div class="profile-body">
                <div class="tab-v1">
                    <ul class="nav nav-justified nav-tabs margin-bottom-20">
                        <li class="active"><a data-toggle="tab">积分中心</a></li>
                    </ul>
                    <div class="margin-bottom-100">
                        <center><h2>可用积分</h2></center>
                        <center><h2>0</h2></center>
                        <div class="col-md-3 col-md-offset-2">
                            <button id="save-btn" data-id="cd-login" type="button" class="score-btn btn-u btn-block">
                                充值
                            </button>
                        </div>
                        <div class="col-md-3 col-md-offset-2">
                            <button id="withdraw-btn" data-id="cd-signup" type="button"
                                    class="score-btn btn-u btn-block">提现
                            </button>
                        </div>
                    </div>
                    <center><h2>积分明细</h2></center>
                    <div class="tab-v1">
                        <ul class="nav nav-justified nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#all">全部</a>
                            </li>
                            <li><a data-toggle="tab" href="#save">充值</a>
                            </li>
                            <li><a data-toggle="tab" href="#withdraw">提现</a>
                            </li>
                            <li><a data-toggle="tab" href="#other">其他</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div id="all" class="profile-edit tab-pane fade in active">
                            </div>
                            <div id="save" class="profile-edit tab-pane fade">
                            </div>
                            <div id="withdraw" class="profile-edit tab-pane fade">
                            </div>
                            <div id="other" class="profile-edit tab-pane fade">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<#--充值弹出框-->
<div id="pop" class="cd-user-modal">
    <div class="cd-user-modal-container">
        <ul class="cd-switcher">
            <li><a data-id="cd-login" href="javascript:void(0);" class="cd-switcher-tab selected">积分充值</a>
            </li>
            <li><a data-id="cd-signup" href="javascript:void(0);" class="cd-switcher-tab">积分提现</a>
            </li>
        </ul>

        <div id="cd-login" class="cd-user-modal-content">
            <br/>
            <center>当前积分:280</center>
            <form class="cd-form form-horizontal" action="${staticPath}/" method="post">
                <div style="margin-bottom: 20px">
                    <div class="score-value">
                        <input disabled class="left" value="5积分"><input disabled class="right" value="5元">
                    </div>
                    <div class="score-value">
                        <input disabled class="left" value="10积分"><input disabled class="right" value="10元">
                    </div>
                </div>
                <div style="margin-bottom: 20px">
                    <div class="score-value">
                        <input disabled class="left" value="20积分"><input disabled class="right" value="20元">
                    </div>
                    <div class="score-value">
                        <input disabled class="left" value="50积分"><input disabled class="right" value="49元">
                    </div>
                </div>
                <div style="margin-bottom: 20px">
                    <div class="score-value">
                        <input disabled class="left" value="100积分"><input disabled class="right" value="95元">
                    </div>
                    <div class="score-value">
                        <input disabled class="left" value="200积分"><input disabled class="right" value="180元">
                    </div>
                </div>
                <br>
                <div class="col-md-4 col-md-offset-1">
                    <button type="button" class="btn-u btn-block">确认充值</button>
                </div>
                <div class="col-md-4 col-md-offset-2">
                    <button type="button" class="btn-u btn-block cancel-btn">取消</button>
                </div>
                <br/>
            </form>
        </div>
        <div id="cd-signup" class="cd-user-modal-content">
            <br/>
            <center>可用积分:280</center>
            <br/>
            <form class="cd-form form-horizontal" action="${staticPath}/" method="post">
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="description">请输入提现积分</label>
                    <div class="col-sm-9">
                        <input class="form-control" name="score" id="score" type="text"
                               placeholder="请输入提现积分"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="description"></label>
                    <div class="col-sm-9">
                        <span>*预计一个工作日以内以红包形式发放到您的微信账户</span>

                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="description"></label>
                    <div class="col-sm-9" style="color: #A20000">
                        <span>*请输入0~280提现积分</span>
                    </div>
                </div>
                <br/>

                <div class="col-md-4 col-md-offset-1">
                    <button type="button" class="btn-u btn-block">确认提现</button>
                </div>
                <div class="col-md-4 col-md-offset-2">
                    <button type="button" class="btn-u btn-block cancel-btn">取消</button>
                </div>
                <br/>
            </form>
        </div>
    </div>
</div>

<div id="score-history-temp" class="row margin-bottom-5">
    <div class="col-md-3">
        <span class="date">2012-11-11 21:10:23</span>
    </div>
    <div class="col-md-6">
        <span class="type"></span>
    </div>
    <div class="col-md-3" style="text-align: right">
        <span class="fa fa-plus"> 1</span>
    </div>
</div>

</@htmlBody>
<@footerJS>
<script>
    var $pop = $('#pop');

    $('.score-btn').on('click', function () {
        var data = $(this).attr('data-id');
        $pop.addClass('is-visible');
        $('.cd-switcher-tab').removeClass('selected');
        $('.cd-switcher-tab[data-id="' + data + '"]').addClass('selected');
        $('#' + data).addClass('is-selected').siblings('.cd-user-modal-content').removeClass('is-selected');
    })

    $('.cd-switcher-tab').on('click', function () {
        $('.cd-switcher-tab').removeClass('selected');
        $(this).addClass('selected');
        $('.cd-user-modal-content').removeClass('is-selected');
        $('#' + $(this).attr('data-id')).addClass('is-selected');
    })

    $('.cancel-btn').on('click', function () {
        $pop.removeClass('is-visible');
        $('#score').val("");
    })

    $('.score-value').on('click', function () {
        $('.score-value').removeClass('selected');
        $(this).addClass('selected');
    })


    $(document).ready(function () {
        $.get("/user/integral_load", function (data) {
            $.each(data, function () {
                var $li = $('#score-history-temp').clone();
                $li.find('.date').text(new Date(parseInt(this.updateDate)).Format("yyyy-MM-dd hh:mm:ss"));
                $li.find('.type').text(this.type);
                if (this.fromUserId ==${Session.siteSessionUser.id}) {
                    $li.find('.fa').removeClass('fa-plus').addClass('fa-minus').text(" " + this.value);
                } else {
                    $li.find('.fa').text(" " + this.value);
                }
                $li.removeAttr('id');
                $('#all').append($li);
                if (this.type == '充值') {
                    $('#save').append($li.clone());
                } else if (this.type == '提现') {
                    $('#withdraw').append($li.clone());
                } else {
                    $('#other').append($li.clone());
                }
            });
        });
    });


    Date.prototype.Format = function (fmt) { //author: meizz
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "h+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }

</script>


</script>
</@footerJS>

<#include "../layout/main.ftl"/>

<@htmlHead title="作品详情">
<link rel="stylesheet" href="${staticPath}/assets/css/jsdd/work/work_detail.css">
<link rel="stylesheet" href="${staticPath}/assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
<link rel="stylesheet" href="${staticPath}/assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">

<link rel="stylesheet" href="${staticPath}/assets/css/pages/shortcode_timeline2.css">
<link rel="stylesheet"
      href="${staticPath}/static/plugins/master-slider/quick-start/masterslider/style/masterslider.css">
<link rel="stylesheet" href="${staticPath}/assets/css/pages/profile.css">
<link rel='stylesheet'
      href="${staticPath}/static/plugins/master-slider/quick-start/masterslider/skins/default/style.css">
</@htmlHead>
<@htmlBody>
<div class="breadcrumbs">
    <div class="container">
        <h1 class="pull-left">作品详情</h1>
        <ul class="pull-right breadcrumb">
            <li><a href="/">首页</a></li>
            <li class="active">作品详情</li>
        </ul>
    </div>
</div>
<div class="container margin-bottom-40 margin-top-20 ">
    <div class="row">
        <!--left start-->
        <div class="col-sm-9">
            <div class="row" style="border-right: 1px solid #eee">
                <div class="col-sm-6" style="margin-left: -15px">
                    <div class="ms-showcase2-template">
                        <!-- Master Slider -->
                        <div class="master-slider ms-skin-default" id="masterslider">
                            <#list worksImage as imgs>
                                <div class="ms-slide">
                                    <img onerror="nofind(2)" class="ms-brd"
                                         src="http://windyeel.img-cn-shanghai.aliyuncs.com/${imgs.url}?x-oss-process=image/resize,m_fill,h_550,w_550"
                                         data-src="http://windyeel.img-cn-shanghai.aliyuncs.com/${imgs.url}">
                                    <img onerror="nofind(2)" class="ms-thumb"
                                         src="http://windyeel.img-cn-shanghai.aliyuncs.com/${imgs.url}?x-oss-process=image/resize,m_fill,h_80,w_80"
                                         alt="thumb">
                                </div>
                            </#list>
                        </div>
                        <!-- End Master Slider -->
                    </div>
                </div>
                <div class="col-sm-6" style="margin-left: -10px">
                    <h2 style="">${(works.name)!}</h2>
                    <hr class="devider devider-dotted">
                    <p>${(works.remarks)!}</p>
                    <div style="background: rgb(244,244,244);width: 100%">
                        <div class="row">
                            <div class="col-sm-4 col-sm-offset-1" style="margin-top: 15px">
                                编号
                            </div>
                            <div class="col-sm-6 " style="color: red;margin-top: 15px">
                                JAX-100000233
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4 col-sm-offset-1" style="margin-top: 10px">
                                类型
                            </div>
                            <div class="col-sm-6" style="margin-top: 10px">
                            ${(works.type)!}
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-4 col-sm-offset-1" style="margin-top: 10px">
                                尺寸
                            </div>
                            <div class="col-sm-6" style="margin-top: 10px">
                                长：${(works.length)!}&nbsp;宽：${(works.width)!}&nbsp;高：${(works.height)!}
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-4 col-sm-offset-1" style="margin-top: 10px">
                                品种
                            </div>
                            <div class="col-sm-6" style="margin-top: 10px">
                            ${(works.breed)!}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4 col-sm-offset-1" style="margin-top: 10px">
                                浏览次数
                            </div>
                            <div class="col-sm-6" style="margin-top: 10px">
                            ${(works.browserCount)!}
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-4 col-sm-offset-1" style="margin-top: 10px">
                                登记时间
                            </div>
                            <div class="col-sm-6" style="margin-top: 10px;margin-bottom: 10px">
                            ${(provider.datetime?string("yyyy-MM-dd"))!}
                            </div>
                        </div>
                    </div>
                    <div style="background: rgb(244,244,244); margin-top: 10px">
                        <div>
                            <div class="media">
                                <div class="pull-left">
                                    <div style="margin: 12px 10px;height: 50px;width: 50px;border-radius: 50px;overflow:hidden">
                                        <img onerror="nofind(2)" data-id="${appUser.id}" class="headImg"
                                            <#if appUser.headImgUrl!?index_of('http')!=-1>
                                             src="${appUser.headImgUrl!}"
                                            <#else>
                                             src="http://windyeel.img-cn-shanghai.aliyuncs.com/${appUser.headImgUrl!}?x-oss-process=image/resize,m_fill,h_100,w_100"
                                            </#if>
                                             style="width: 100%" alt=""/>
                                    </div>
                                </div>
                                <div class="media-body">
                                    <p style="margin-top: 25px">
                                        <span style="float:  right;">
                                            <button data-id="${appUser.id}" id="addFocus"
                                                    class="btn btn-default btn-sm addFocus"
                                                    style="margin-right: 6px">
                                                <i class="fa fa-plus" style="margin-right: 3px"></i>
                                                <span>关注</span>
                                            </button>
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                        </div>
            </div>
            <div class="container margin-top-5 margin-bottom-20">
                <div class="row">
                    <div class="col-sm-9">
                        <div class="tab-v1" style="margin-top: 30px">
                            <div class="tab-content" style="background: rgb(254,255,255)">
                                <div class="tab-pane fade in active" id="detail">
                                    <!--登记者信息-->
                                    <div class="headline"><h2>登记者信息</h2></div>
                                    <table class="table table-bordered">
                                        <tr>
                                            <td>姓名：${(provider.name)!}</td>
                                            <td>联系方式：${(provider.phone)!}</td>
                                            <td>地址：${(provider.address)!}</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">身份证：${(provider.no)!}</td>
                                        </tr>
                                    </table>
                                    <!--作品信息-->
                                    <div class="headline"><h2>作品信息</h2></div>
                                    <table class="table table-bordered">
                                        <tr>
                                            <td>品种：${(works.breed)!}</td>
                                            <td>作品类型：${(works.type)!}</td>
                                            <td>
                                                尺寸：长：${(works.length)!}cm&nbsp;宽：${(works.width)!}cm&nbsp;高：${(works.height)!}cm
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>重量：${(works.weight)!}g</td>
                                            <td>工艺制作：${(works.gyType)!}</td>
                                            <td>篆刻级别：${(works.levelZk)!}</td>
                                        </tr>
                                        <tr>
                                            <td>矿区地域：${(works.kqdy)!}</td>
                                            <td>制作人：${(works.maker)!}</td>
                                            <td>制作时间：${(works.makeTime?string("yyyy-MM-dd"))!}</td>
                                        </tr>
                                    </table>

                                    <div class="headline"><h2>作品等级</h2></div>
                                    <table class="table table-bordered">
                                        <tr>
                                            <td>质地一：${(worksLevel.zhidi)!}</td>
                                            <td>质地二：${(worksLevel.zhidi2)!}</td>
                                            <td>感官：${(worksLevel.ganguan)!}</td>
                                        </tr>
                                        <tr>
                                            <td>磨氏度：${(worksLevel.moshidu)!}</td>
                                            <td>血量：${(worksLevel.xueliang)!}</td>
                                            <td>血色：${(worksLevel.xuese)!}</td>
                                        </tr>
                                        <tr>
                                            <td>血形：${(worksLevel.xuexing)!}</td>
                                            <td>浓艳度：${(worksLevel.nongyandu)!}</td>
                                            <td>纯净度： ${(worksLevel.chunjingdu)!}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>地色：${(worksLevel.dise)!}</td>
                                            <td>活筋：${(worksLevel.liu)!}</td>
                                            <td>裂：${(worksLevel.lie)!}</td>
                                        </tr>
                                        <tr>
                                            <td>印章：${(worksLevel.inithanxueliang)!}</td>
                                            <td colspan="2">含血方式：${(worksLevel.hanxuefangshi)!}</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <!--作品等级-->
                                    <div class="headline"><h2>评估报告</h2></div>
                                    <pre>${(report.des)!}</pre>
                                    <div>
                                        <#if reportImage?exists>
                                            <img style="width: 100%;"
                                                 src="http://windyeel.img-cn-shanghai.aliyuncs.com/${reportImage.url}?x-oss-process=image/resize,m_fill,h_500,w_500"
                                                 alt="评估报告">
                                        </#if>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!---作品详情 作品诠释 转让历史-->


<!---作品详情 作品诠释 转让历史-->


<div id="temp_interpretation" class="media media-v2 margin-bottom-20" style="display: none;">
    <a class="pull-left" href="page_profile_comments.html#">
        <img class="media-object rounded-x headImgUrl" src="" alt="">
    </a>
    <div class="media-body">
        <h4 class="media-heading">
            <strong><a class="name" href="javascript:;"></a></strong>
            <small></small>
        </h4>
        <p class="description"></p>
        <ul class="list-inline img-uploaded">
        </ul>
        <ul class="list-inline results-list pull-left">
            <li><a href="page_profile_comments.html#">7 Likes</a></li>
            <li><a href="page_profile_comments.html#">2 Share</a></li>
        </ul>
        <ul class="list-inline pull-right">
            <li><a href="page_profile_comments.html#"><i class="expand-list rounded-x fa fa-reply"></i></a></li>
            <li><a href="page_profile_comments.html#"><i class="expand-list rounded-x fa fa-heart"></i></a></li>
            <li><a href="page_profile_comments.html#"><i class="expand-list rounded-x fa fa-retweet"></i></a></li>
        </ul>
        <div class="clearfix"></div>
    </div>
</div>

</@htmlBody>
<@footerJS>
<!-- Master Slider -->
<script src="${staticPath}/static/plugins/master-slider/quick-start/masterslider/masterslider.min.js"></script>
<script src="${staticPath}/static/plugins/master-slider/quick-start/masterslider/jquery.easing.min.js"></script>
<script src="${staticPath}/static/js/plugins/master-slider.js"></script>
<script src="${staticPath}/assets/js/upload/upload.js"></script>
<script src="${staticPath}/assets/js/plugins/plupload-2.1.2/js/moxie.js"></script>
<script src="${staticPath}/assets/js/plugins/plupload-2.1.2/js/plupload.dev.js"></script>

<script>
    pageIndex = 1;
    hasMore = true;

    jQuery(document).ready(function () {

        MasterSliderShowcase2.initMasterSliderShowcase2();
        initUploaders_interpretation("btn-interpretation", "windyeel", '${staticPath}/');
        //获取要操作的元素
        var smallimg = $('.small-box img');
        var square = $('.square');
        var imgs = $all('.img-list img');

        //鼠标经过图片列表显示被选中，实现图片切换
        for (var i = 0; i < imgs.length; i++) {
            imgs[i].onmouseover = function () {
                for (var j = 0; j < imgs.length; j++) {
                    imgs[j].className = '';
                }
                this.className = 'active';

                //改变对应的图片链接
                smallimg.src = this.getAttribute('data-big');
            };
        }
        //通过名称查找某个元素
        function $(name) {
            return document.querySelector(name);
        }

        //通过名称查找相同的一组数据
        function $all(name) {
            return document.querySelectorAll(name);
        }
    });

    //关注
    $(".addFocus").bind("click", function () {
        var thisone = $(this);
        var targetId = thisone.attr('data-id');
        if (thisone.find("span").html() == "关注") {
            $.post("/user/notToHave", {targetId: targetId}, function (data) {
                thisone.find("i").attr("class", "fa fa-check");
                thisone.find("span").html("已关注")
                alert(data);
            });
        } else {
            $.post("/user/haveToNot", {targetId: targetId}, function (data) {
                thisone.find("i").attr("class", "fa fa-plus");
                thisone.find("span").html("关注")
                alert(data);
            });
        }
    });

    //收藏
    $("#addCollect").bind("click", function () {
        var thisone = $(this);
        var worksId = thisone.attr('data-id');
        if (thisone.find("span").html() == "添加收藏") {
            $.post("/works/collectWorks", {worksId: worksId}, function (data) {
                thisone.find("i").attr("class", "fa fa-heart");
                thisone.find("span").html("已收藏")
                alert(data);
            });
        } else {
            $.post("/works/cancelCollect", {worksId: worksId}, function (data) {
                thisone.find("i").attr("class", "fa fa-heart-o");
                thisone.find("span").html("添加收藏")
                alert(data);
            });
        }
    });


    // 提交诠释
    var $form = $("#form_interpretation");
    $form.validate({
        rules: {
            description: "required"
        },
        messages: {
            description: {
                required: "诠释详情必填"
            }
        },
        submitHandler: function (form) {
            $(form).ajaxSubmit({
                success: function (data) {
                    if (data) {
                        alert("诠释成功!");
                        $('#description').val('');
                        $('#container-interpretation').html('');
                        $('#interpretation_contain .media').remove();
                        loadInterpretation(1);
                    } else {
                        alert("失败");
                    }
                },
                error: function () {
                    alert("error");
                    return;
                }
            });
        }
    });


    loadInterpretation(1);
    function loadInterpretation(pageIndex) {
        $.post("/interpretation", {pageIndex: pageIndex, worksId: '${works.id}'}, function (data) {
            if (pageIndex >= data.pages) {
                // 数据加载完毕了
                $(".btn-more").html("客官，这次真没了");
                hasMore = false;
            }
            $.each(data.records, function () {
                var $li = $("#temp_interpretation").clone();
                $li.removeAttr("id").css("display", "block");
                $li.find(".description").html(this.description);
                $li.find(".name").html(this.appUser.name);
                $li.find(".headImgUrl").parent().attr('href', "${staticPath}/user/detail/works?userId=" + this.appUser.id);
                if (this.appUser.headImgUrl.indexOf('http') != -1) {
                    $li.find(".headImgUrl").attr("src", this.appUser.headImgUrl);
                } else {
                    $li.find(".headImgUrl").attr("src", "http://windyeel.img-cn-shanghai.aliyuncs.com/" + this.appUser.headImgUrl + "?x-oss-process=image/resize,m_fill,h_80,w_80");
                }
                var t = this.createDate;
                var d = new Date(parseInt(t)).Format("yyyy-MM-dd hh:mm:ss");
                $li.find("small").html(d);
                $.each(this.imagesList, function () {
                    $li.find(".img-uploaded").append('<li><img class="img-responsive" src="http://windyeel.img-cn-shanghai.aliyuncs.com/' + this.url + '?x-oss-process=image/resize,m_fill,h_80,w_80" alt=""></li>');
                });
                $("#interpretation_contain").append($li);
            });
        });
    }
    $(".btn-more").on("click", function () {
        if (hasMore) {
            pageIndex++;
            loadInterpretation(pageIndex);
        }
    })


    $('.headImg').on('click', function () {
        location.href = "${staticPath}/user/detail/works?userId=" + $(this).attr('data-id');
    })

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

</@footerJS>

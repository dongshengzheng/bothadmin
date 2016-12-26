<#include "../layout/main.ftl"/>

<@htmlHead title="作品详情">
<link rel="stylesheet" href="${staticPath}/assets/css/jsdd/work/work_detail.css">
<!-- CSS Page Style -->
<link rel="stylesheet" href="${staticPath}/assets/css/pages/profile.css">
<link rel="stylesheet" href="${staticPath}/assets/css/pages/shortcode_timeline2.css">
<link rel="stylesheet"
      href="${staticPath}/static/plugins/master-slider/quick-start/masterslider/style/masterslider.css">
<link rel='stylesheet'
      href="${staticPath}/static/plugins/master-slider/quick-start/masterslider/skins/default/style.css">
</@htmlHead>
<@htmlBody>
<div class="breadcrumbs">
    <div class="container">
        <h1 class="pull-left">作品详情</h1>
        <ul class="pull-right breadcrumb">
            <li><a href="index.html">首页</a></li>
            <li class="active">作品详情</li>
        </ul>
    </div>
</div>
<div class="container margin-bottom-40 margin-top-20">
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
                                    <img class="ms-brd"
                                         src="http://windyeel.img-cn-shanghai.aliyuncs.com/${imgs.url}?x-oss-process=image/resize,m_fill,h_550,w_550"
                                         data-src="http://windyeel.img-cn-shanghai.aliyuncs.com/${imgs.url}">
                                    <img class="ms-thumb"
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
                                11
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
                                        <img class="" src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
                                    </div>
                                </div>
                                <div class="media-body">
                                    <p style="margin-top: 25px">
                                        <span style="float:  right;">
                                            <button id="addFocus" class="btn btn-default btn-sm"
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

                    <div class="margin-top-20 text-center">
                        <button id="addCollect" class="btn btn-lg btn-u btn-u-red">
                            <i class="fa fa-heart-o"></i>&nbsp;<span>添加收藏</span>
                        </button>
                    </div>
                </div>
            </div>
            <div class="container margin-top-5 margin-bottom-20">
                <div class="row">
                    <div class="col-sm-9">
                        <div class="tab-v1" style="margin-top: 30px">
                            <ul class="nav nav-tabs" style="background: rgb(244,244,244)">
                                <li class="active" style="">
                                    <a href="shortcode_accordion_and_tabs.html#detail" data-toggle="tab">作品详情</a>
                                </li>
                                <li>
                                    <a href="shortcode_accordion_and_tabs.html#quanshi" data-toggle="tab">作品诠释</a>
                                </li>
                                <li>
                                    <a href="shortcode_accordion_and_tabs.html#history" data-toggle="tab">转让历史</a>
                                </li>
                            </ul>
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
                                        <img width="500px;"
                                             src="http://windyeel.img-cn-shanghai.aliyuncs.com/${reportImage.url}?x-oss-process=image/resize,m_fill,h_500,w_500"
                                             alt="评估报告">
                                    </div>
                                    <#if collect?exists>
                                        <div class="headline"><h2>收藏者信息</h2></div>
                                        <table class="table table-bordered">
                                            <tr>
                                                <td>姓名：${(collect.name)!}</td>
                                                <td>联系方式：${(collect.phone)!}</td>
                                                <td>地址：${(collect.address)!}</td>
                                            </tr>
                                            <tr>
                                                <td>身份证：${(collect.no)!}</td>
                                                <td colspan="2">收藏时间：${(collect.datetime?string("yyyy-MM-dd"))!}</td>
                                            </tr>
                                        </table>
                                    </#if>
                                </div>

                                <!--作品诠释-->
                                <div class="tab-pane fade in" id="quanshi">
                                    <!--<div class="container">-->
                                    <div class="row">
                                        <!--头像-->
                                        <div class="col-sm-1" style="">
                                            <div style="margin-top: 5px;margin-bottom: 5px; margin-left: 15px;">
                                                <img style="height: 50px;width: 50px;-webkit-border-radius: 50px;-moz-border-radius: 50px;border-radius: 50px;overflow:hidden"
                                                     class="" src="${staticPath}/assets/img/testimonials/img5.jpg"
                                                     alt=""/>
                                            </div>
                                        </div>
                                        <!--文本-->
                                        <div class="col-sm-10" style="margin-left: 25px;background:rgb(246,237,236)">
                                            <form action="" method="post">

                                                <label class="textarea" style="margin-top: 10px">
                                        <textarea style="resize: none;width: 700px;height: 200px" rows="3">

                                        </textarea>
                                                </label>
                                                <span>
                                        <button class="btn btn-sm btn-info"><i class="glyphicon glyphicon-picture"></i>上传图片</button>
                                        <span style="float: right;"><button class="btn btn-sm btn-u btn-u-red"
                                                                            type="submit">确认诠释</button></span>
                                    </span>
                                                <div style="border: solid 1px gainsboro;height: 50px;margin: 10px 0px"></div>
                                            </form>
                                        </div>
                                    </div>
                                    <!--</div>-->

                                    <!--诠释列表-->
                                    <div class="row">
                                        <!--头像-->
                                        <div class="col-sm-1" style="margin-top: 15px">
                                            <div style="margin-top: 5px;margin-bottom: 5px; margin-left: 15px;">
                                                <img style="height: 50px;width: 50px;-webkit-border-radius: 50px;-moz-border-radius: 50px;border-radius: 50px;overflow:hidden"
                                                     class="" src="${staticPath}/assets/img/testimonials/img5.jpg"
                                                     alt=""/>
                                            </div>
                                        </div>
                                        <!--文本-->
                                        <div class="col-sm-10" style="margin-left: 25px;margin-top: 15px">
                                            <p>jssss**被 <span style="float: right;">2013年10月25日</span></p>
                                            <p>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                                                啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                                                啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                                                啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                                                啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p>
                                            <div class="img-list-quanshi"><!-- 图片列表-->
                                                <ul style="margin-top: -15px">
                                                    <li style="padding-left: 0px"><img class=""
                                                                                       src="${staticPath}/assets/img/team/img2-sm.jpg"
                                                                                       alt=""/></li>
                                                    <li><img src="${staticPath}/assets/img/team/img2-sm.jpg" alt=""/>
                                                    </li>
                                                    <li><img src="${staticPath}/assets/img/team/img2-sm.jpg" alt=""/>
                                                    </li>
                                                    <li><img src="${staticPath}/assets/img/team/img2-sm.jpg" alt=""/>
                                                    </li>
                                                    <li><img src="${staticPath}/assets/img/team/img2-sm.jpg" alt=""/>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <!--头像-->
                                        <div class="col-sm-1" style="margin-top: 15px">
                                            <div style="margin-top: 5px;margin-bottom: 5px; margin-left: 15px;">
                                                <img style="height: 50px;width: 50px;-webkit-border-radius: 50px;-moz-border-radius: 50px;border-radius: 50px;overflow:hidden"
                                                     class="" src="${staticPath}/assets/img/testimonials/img5.jpg"
                                                     alt=""/>
                                            </div>
                                        </div>
                                        <!--文本-->
                                        <div class="col-sm-10" style="margin-left: 25px;margin-top: 15px">
                                            <p>jssss**被 <span style="float: right;">2013年10月25日</span></p>
                                            <p>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                                                啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                                                啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                                                啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                                                啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p>
                                            <div class="img-list-quanshi"><!-- 图片列表-->
                                                <ul style="margin-top: -15px">
                                                    <li style="padding-left: 0px"><img class=""
                                                                                       src="${staticPath}/assets/img/team/img2-sm.jpg"
                                                                                       alt=""/></li>
                                                    <li><img src="${staticPath}/assets/img/team/img2-sm.jpg" alt=""/>
                                                    </li>
                                                    <li><img src="${staticPath}/assets/img/team/img2-sm.jpg" alt=""/>
                                                    </li>
                                                    <li><img src="${staticPath}/assets/img/team/img2-sm.jpg" alt=""/>
                                                    </li>
                                                    <li><img src="${staticPath}/assets/img/team/img2-sm.jpg" alt=""/>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row">
                                        <!--头像-->
                                        <div class="col-sm-1" style="margin-top: 15px">
                                            <div style="margin-top: 5px;margin-bottom: 5px; margin-left: 15px;">
                                                <img style="height: 50px;width: 50px;-webkit-border-radius: 50px;-moz-border-radius: 50px;border-radius: 50px;overflow:hidden"
                                                     class="" src="${staticPath}/assets/img/testimonials/img5.jpg"
                                                     alt=""/>
                                            </div>
                                        </div>
                                        <!--文本-->
                                        <div class="col-sm-10" style="margin-left: 25px;margin-top: 15px">
                                            <p>jssss**被 <span style="float: right;">2013年10月25日</span></p>
                                            <p>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                                                啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                                                啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                                                啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                                                啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p>
                                            <div class="img-list-quanshi"><!-- 图片列表-->
                                                <ul style="margin-top: -15px">
                                                    <li style="padding-left: 0px"><img class=""
                                                                                       src="${staticPath}/assets/img/team/img2-sm.jpg"
                                                                                       alt=""/></li>
                                                    <li><img src="${staticPath}/assets/img/team/img2-sm.jpg" alt=""/>
                                                    </li>
                                                    <li><img src="${staticPath}/assets/img/team/img2-sm.jpg" alt=""/>
                                                    </li>
                                                    <li><img src="${staticPath}/assets/img/team/img2-sm.jpg" alt=""/>
                                                    </li>
                                                    <li><img src="${staticPath}/assets/img/team/img2-sm.jpg" alt=""/>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <!--头像-->
                                        <div class="col-sm-1" style="margin-top: 15px">
                                            <div style="margin-top: 5px;margin-bottom: 5px; margin-left: 15px;">
                                                <img style="height: 50px;width: 50px;-webkit-border-radius: 50px;-moz-border-radius: 50px;border-radius: 50px;overflow:hidden"
                                                     class="" src="${staticPath}/assets/img/testimonials/img5.jpg"
                                                     alt=""/>
                                            </div>
                                        </div>
                                        <!--文本-->
                                        <div class="col-sm-10" style="margin-left: 25px;margin-top: 15px">
                                            <p>jssss**被 <span style="float: right;">2013年10月25日</span></p>
                                            <p>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                                                啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                                                啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                                                啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                                                啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p>
                                            <div class="img-list-quanshi"><!-- 图片列表-->
                                                <ul style="margin-top: -15px">
                                                    <li style="padding-left: 0px"><img class=""
                                                                                       src="${staticPath}/assets/img/team/img2-sm.jpg"
                                                                                       alt=""/></li>
                                                    <li><img src="${staticPath}/assets/img/team/img2-sm.jpg" alt=""/>
                                                    </li>
                                                    <li><img src="${staticPath}/assets/img/team/img2-sm.jpg" alt=""/>
                                                    </li>
                                                    <li><img src="${staticPath}/assets/img/team/img2-sm.jpg" alt=""/>
                                                    </li>
                                                    <li><img src="${staticPath}/assets/img/team/img2-sm.jpg" alt=""/>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!--转让历史-->
                                <div class="tab-pane fade in" id="history">

                                    <div class="profile-body">
                                        <!--Timeline-->
                                        <ul class="timeline-v2">
                                            <li>
                                                <time class="cbp_tmtime" datetime=""><span>12:16:06</span> <span>2016-05-26</span>
                                                </time>
                                                <i class="cbp_tmicon rounded-x hidden-xs"></i>
                                                <div class="cbp_tmlabel">

                                                    <!--todo transfer-->


                                                </div>
                                            </li>

                                            <li>
                                                <time class="cbp_tmtime" datetime=""><span>12:16:06</span> <span>2016-05-26</span>
                                                </time>
                                                <i class="cbp_tmicon rounded-x hidden-xs"></i>
                                                <div class="cbp_tmlabel">

                                                    <!--todo transfer-->


                                                </div>
                                            </li>

                                            <li>
                                                <time class="cbp_tmtime" datetime=""><span>12:16:06</span> <span>2016-05-26</span>
                                                </time>
                                                <i class="cbp_tmicon rounded-x hidden-xs"></i>
                                                <div class="cbp_tmlabel">

                                                    <!--todo transfer-->


                                                </div>
                                            </li>
                                        </ul>
                                        <!--End Timeline-->
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!--left end-->

        <!--right start-->
        <div class="col-sm-3">

            <div class="row margin-bottom-15" style="border-bottom: solid 1px #eee;margin-left: 10px">
                <h4>收藏者</h4>
            </div>

            <div class="row">
                <div class="col-sm-4" style="padding-right: 0px;width: 75px">
                    <img class="" style="margin: 10px 0px 10px 10px;height: 50px;width: 50px"
                         src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
                </div>

                <div class="col-sm-4" style="padding-right: 0px;width: 75px">
                    <img class="" style="margin: 10px 0px 10px 10px;height: 50px;width: 50px"
                         src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
                </div>

                <div class="col-sm-4" style="padding-right: 0px;width: 75px">
                    <img class="" style="margin: 10px 0px 10px 10px;height: 50px;width: 50px"
                         src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
                </div>

                <div class="col-sm-4" style="padding-right: 0px;width: 75px">
                    <img class="" style="margin: 10px 0px 10px 10px;height: 50px;width: 50px"
                         src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
                </div>

                <div class="col-sm-4" style="padding-right: 0px;width: 75px">
                    <img class="" style="margin: 10px 0px 10px 10px;height: 50px;width: 50px"
                         src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
                </div>

                <div class="col-sm-4" style="padding-right: 0px;width: 75px">
                    <img class="" style="margin: 10px 0px 10px 10px;height: 50px;width: 50px"
                         src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
                </div>

                <div class="col-sm-4" style="padding-right: 0px;width: 75px">
                    <img class="" style="margin: 10px 0px 10px 10px;height: 50px;width: 50px"
                         src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
                </div>


            </div>

            <div class="row margin-bottom-15" style="margin-top: 15px;border-bottom: solid 1px #eee;margin-left: 10px">
                <h4>最近浏览人</h4>
            </div>

            <div class="row">
                <div class="media">
                    <div class="pull-left">
                        <div style="height: 50px;width: 50px;border-radius: 50px;overflow:hidden;margin-left: 15px">
                            <img class="" src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
                        </div>
                    </div>
                    <div class="media-body">
                        <h6 class="media-heading" style="margin-top: 5px">M小路痴M_7132<span
                                style="float:right;margin-top: 8px"><button class="btn btn-default btn-sm"
                                                                            style="font-size: 8px">
                            <i class="glyphicon glyphicon-plus" style="margin-right: 3px"></i>关注</button>
                        </span></h6>
                        <p style="font-size: 10px">2016-1-5 12:15:50
                        </p>
                    </div>
                </div>

                <div class="media">
                    <div class="pull-left">
                        <div style="height: 50px;width: 50px;border-radius: 50px;overflow:hidden;margin-left: 15px">
                            <img class="" src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
                        </div>
                    </div>
                    <div class="media-body">
                        <h6 class="media-heading" style="margin-top: 5px">M小路痴M_7132<span
                                style="float:right;margin-top: 8px"><button class="btn btn-default btn-sm"
                                                                            style="font-size: 8px">
                            <i class="glyphicon glyphicon-plus" style="margin-right: 3px"></i>关注</button>
                        </span></h6>
                        <p style="font-size: 10px">2016-1-5 12:15:50
                        </p>
                    </div>
                </div>


                <div class="media">
                    <div class="pull-left">
                        <div style="height: 50px;width: 50px;border-radius: 50px;overflow:hidden;margin-left: 15px">
                            <img class="" src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
                        </div>
                    </div>
                    <div class="media-body">
                        <h6 class="media-heading" style="margin-top: 5px">M小路痴M_7132<span
                                style="float:right;margin-top: 8px"><button class="btn btn-default btn-sm"
                                                                            style="font-size: 8px">
                            <i class="glyphicon glyphicon-plus" style="margin-right: 3px"></i>关注</button>
                        </span></h6>
                        <p style="font-size: 10px">2016-1-5 12:15:50
                        </p>
                    </div>
                </div>

                <div class="media">
                    <div class="pull-left">
                        <div style="height: 50px;width: 50px;border-radius: 50px;overflow:hidden;margin-left: 15px">
                            <img class="" src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
                        </div>
                    </div>
                    <div class="media-body">
                        <h6 class="media-heading" style="margin-top: 5px">M小路痴M_7132<span
                                style="float:right;margin-top: 8px"><button class="btn btn-default btn-sm"
                                                                            style="font-size: 8px">
                            <i class="glyphicon glyphicon-plus" style="margin-right: 3px"></i>关注</button>
                        </span></h6>
                        <p style="font-size: 10px">2016-1-5 12:15:50
                        </p>
                    </div>
                </div>

            </div>

        </div>
        <!--right end-->
    </div>
</div>
<!---作品详情 作品诠释 转让历史-->


<!---作品详情 作品诠释 转让历史-->
</@htmlBody>
<@footerJS>
<!-- Master Slider -->
<script src="${staticPath}/static/plugins/master-slider/quick-start/masterslider/masterslider.min.js"></script>
<script src="${staticPath}/static/plugins/master-slider/quick-start/masterslider/jquery.easing.min.js"></script>
<script src="${staticPath}/static/js/plugins/master-slider.js"></script>
<script>
    jQuery(document).ready(function () {

        MasterSliderShowcase2.initMasterSliderShowcase2();

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
    $("#addFocus").bind("click", function () {

        if ($(this).find("span").html() == "关注") {
            $(this).find("i").attr("class", "fa fa-check");
            $(this).find("span").html("已关注")
        } else {
            $(this).find("i").attr("class", "fa fa-plus");
            $(this).find("span").html("关注")
        }

    });

    //关注
    $("#addCollect").bind("click", function () {
        if ($(this).find("span").html() == "添加收藏") {
            $(this).find("i").attr("class", "fa fa-heart");
            $(this).find("span").html("已收藏")
        } else {
            $(this).find("i").attr("class", "fa fa-heart-o");
            $(this).find("span").html("添加收藏")
        }
    });
</script>

</@footerJS>

<#include "../layout/main.ftl"/>

<@htmlHead title="用户中心">
<link rel="stylesheet" href="${staticPath}/assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">
<link rel="stylesheet" href="${staticPath}/assets/css/jsdd/user/usercenter.css">
</@htmlHead>
<@htmlBody>


<hr/>
<!--content start-->
<div class="row tab-v3">
    <div class="col-sm-3">
        <div class="margin-bottom-40 margin-top-20"
             style="text-align:center;display: table;width: auto;margin-left: auto;margin-right: auto;">
            <img style="height: 140px ;width: 140px;" src="${staticPath}/assets/img/main/img10.jpg">
            <p id="editAvatr"
               style=" background:rgba(0,0,0,.5); position:relative; top:-19px; color:whitesmoke; font-size:12px;">
                点击修头像</p>
        </div>
        <div style="display: table;margin-left: auto ;margin-right: auto;margin-top: -25px;">

            <ul class="nav nav-pills nav-stacked margin-bottom-40" style="">
                <li class="active text-center"><a href="#my-work"
                                                  data-toggle="tab">我的作品</a></li>
                <li class="text-center"><a href="#transfer-work"
                                           data-toggle="tab">转让作品</a>
                </li>
                <li class="text-center"><a href="#colercting-work"
                                           data-toggle="tab">收藏作品</a></li>
                <li class="text-center"><a href="#see-user" data-toggle="tab">
                    关注用户</a>
                </li>
                <li class="text-center"><a href="#integrel"
                                           data-toggle="tab">积分中心</a>
                </li>
                <li class="text-center"><a href="#user-info"
                                           data-toggle="tab">个人资料</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="col-sm-9 margin-top-20">
        <div class="tab-content margin-bottom-40">
            <!--START  我的作品-->
            <div class="tab-pane fade in active" id="my-work">
                <div class="tab-v1" style="">
                    <ul class="nav nav-tabs">
                        <li class="active" style="">
                            <a href="#check-success" data-toggle="tab">审核通过</a>
                        </li>
                        <li>
                            <a href="#check-fail" data-toggle="tab">审核失败</a>
                        </li>
                        <li>
                            <a href="#checking" data-toggle="tab">审核中</a>
                        </li>
                        <li>
                            <a href="#trash" data-toggle="tab">草稿箱</a>
                        </li>
                    </ul>
                    <div class="tab-content" style="background: rgb(254,255,255)">
                        <!--审核通过-->
                        <div class="tab-pane fade in active" id="check-success">
                            <ul class="list-unstyled row portfolio-box">
                                <li class="col-sm-4 md-margin-bottom-50">
                                    <img class="full-width " src="http://localhost:8080/assets/img/main/img9.jpg" style="margin-bottom: 0px" alt="">
                                    <div class="" style="background:rgba(0,0,0,.5);height: 20px;margin-top: -20px;position:relative;z-index: 999">
                                        <label style="text-align: center;color:whitesmoke;width: 50%">作品编辑</label><label  style="text-align: center;color:whitesmoke;background: #FB0007;width: 50%">作品转让</label>
                                    </div>

                                    <div class="headline-left margin-bottom-10 text-left ">
                                        <h3 class="headline-brd">纯手工打造
                                        </h3></div>
                                    <small class="project-tag text-left"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                                            href="page_home10.html#">Business</a></small>
                                    <p class="text-left">鸡血石，星辰沙辰条带昆凌身斯加可浪费</p>
                                </li>
                            </ul>
                        </div>
                        <!--审核通过-->
                        <!--审核失败-->
                        <div class="tab-pane fade in" id="check-fail">

                            <ul class="list-unstyled row portfolio-box">
                                <li class="col-sm-4 md-margin-bottom-50">
                                    <img class="full-width " src="http://localhost:8080/assets/img/main/img9.jpg" style="margin-bottom: 0px" alt="">
                                    <div class="" style="background:rgba(0,0,0,.5);height: 20px;margin-top: -20px;position:relative;z-index: 999">
                                        <label style="text-align: center;color:whitesmoke;width: 100%">作品编辑</label>
                                    </div>

                                    <div class="headline-left margin-bottom-10 text-left ">
                                        <h3 class="headline-brd">纯手工打造
                                        </h3></div>
                                    <small class="project-tag text-left"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                                            href="page_home10.html#">Business</a></small>
                                    <p class="text-left">鸡血石，星辰沙辰条带昆凌身斯加可浪费</p>
                                </li>
                            </ul>

                        </div>
                        <!--审核失败-->
                        <!--审核中-->
                        <div class="tab-pane fade in" id="checking">

                            <ul class="list-unstyled row portfolio-box">
                                <li class="col-sm-4 md-margin-bottom-50">
                                    <img class="full-width " src="http://localhost:8080/assets/img/main/img9.jpg" style="margin-bottom: 0px" alt="">
                                    <div class="headline-left margin-bottom-10 text-left ">
                                        <h3 class="headline-brd">纯手工打造
                                        </h3></div>
                                    <small class="project-tag text-left"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                                            href="page_home10.html#">Business</a></small>
                                    <p class="text-left">鸡血石，星辰沙辰条带昆凌身斯加可浪费</p>
                                </li>
                            </ul>



                        </div>
                        <!--审核中-->
                        <!--草稿箱-->
                        <div class="tab-pane fade in" id="trash">

                            <ul class="list-unstyled row portfolio-box">
                                <li class="col-sm-4 md-margin-bottom-50">
                                    <img class="full-width " src="http://localhost:8080/assets/img/main/img9.jpg" style="margin-bottom: 0px" alt="">
                                    <div class="" style="background:rgba(0,0,0,.5);height: 20px;margin-top: -20px;position:relative;z-index: 999">
                                        <label style="text-align: center;color:whitesmoke;width: 100%">作品编辑</label>
                                    </div>

                                    <div class="headline-left margin-bottom-10 text-left ">
                                        <h3 class="headline-brd">纯手工打造
                                        </h3></div>
                                    <small class="project-tag text-left"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                                            href="page_home10.html#">Business</a></small>
                                    <p class="text-left">鸡血石，星辰沙辰条带昆凌身斯加可浪费</p>
                                </li>
                            </ul>

                        </div>
                        <!--草稿箱-->
                    </div>
                </div>

            </div>
            <!--END  我的作品-->

            <#--转让作品-->
            <div class="tab-pane fade in" id="transfer-work">

                <div class="tab-v1" style="">
                    <ul class="nav nav-tabs">
                        <li class="active" style="">
                            <a href="#transfer-out" data-toggle="tab">已转出</a>
                        </li>
                        <li>
                            <a href="#transfer-in" data-toggle="tab">已转入</a>
                        </li>
                        <li>
                            <a href="#transfer-wait" data-toggle="tab">待转出</a>
                        </li>
                        <li>
                            <a href="#transfer-confirm" data-toggle="tab">待确认</a>
                        </li>
                    </ul>
                    <div class="tab-content" style="background: rgb(254,255,255)">
                        <!--已转出-->
                        <div class="tab-pane fade in active" id="transfer-out">
                            <ul class="list-unstyled row portfolio-box">
                                <li class="col-sm-4 md-margin-bottom-50 text-center">
                                    <img class="full-width " src="http://localhost:8080/assets/img/main/img9.jpg" alt="">

                                    <div class="headline-left margin-bottom-10 text-left ">
                                        <h3 class="headline-brd ">纯手工打造
                                        </h3></div>
                                    <small class="project-tag text-left"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                                            href="page_home10.html#">Business</a></small>
                                    <p >鸡血石，星辰沙条带昆凌身价东斯加可浪费费</p>
                                </li>

                                <li class="col-sm-4 md-margin-bottom-50 text-center">
                                    <img class="full-width " src="http://localhost:8080/assets/img/main/img9.jpg" alt="">

                                    <div class="headline-left margin-bottom-10 text-left ">
                                        <h3 class="headline-brd ">纯手工打造
                                        </h3></div>
                                    <small class="project-tag text-left"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                                            href="page_home10.html#">Business</a></small>
                                    <p>鸡血石，星辰沙条带昆凌身价东方拉斯加可浪费</p>
                                </li>


                                <li class="col-sm-4 md-margin-bottom-50 text-center">
                                    <img class="full-width " src="http://localhost:8080/assets/img/main/img9.jpg" alt="">

                                    <div class="headline-left margin-bottom-10  ">
                                        <h3 class="headline-brd text-left">纯手工打造
                                        </h3></div>
                                    <small class="project-tag text-left"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                                            href="page_home10.html#">Business</a></small>
                                    <p>鸡血石，星辰沙条带昆凌身价东方拉斯加可浪费</p>
                                </li>

                                <li class="col-sm-4 md-margin-bottom-50 text-center">
                                    <img class="full-width " src="http://localhost:8080/assets/img/main/img9.jpg" alt="">

                                    <div class="headline-left margin-bottom-10 text-left ">
                                        <h3 class="headline-brd ">纯手工打造
                                        </h3></div>
                                    <small class="project-tag text-left"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                                            href="page_home10.html#">Business</a></small>
                                    <p>鸡血石，星辰沙条带昆凌身价东方拉斯加可浪费</p>
                                </li>

                            </ul>
                        </div>

                        <!--已转入-->
                        <div class="tab-pane fade in" id="transfer-in">
                            <ul class="list-unstyled row portfolio-box">
                                <li class="col-sm-4 md-margin-bottom-50 text-center">
                                    <img class="full-width " src="http://localhost:8080/assets/img/main/img9.jpg" alt="">

                                    <div class="headline-left margin-bottom-10 text-left ">
                                        <h3 class="headline-brd ">纯手工打造
                                        </h3></div>
                                    <small class="project-tag text-left"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                                            href="page_home10.html#">Business</a></small>
                                    <p>鸡血石，星辰沙条带昆凌身价东方拉斯加可浪费</p>
                                </li>

                                <li class="col-sm-4 md-margin-bottom-50 text-center">
                                    <img class="full-width " src="http://localhost:8080/assets/img/main/img9.jpg" alt="">

                                    <div class="headline-left margin-bottom-10 text-left ">
                                        <h3 class="headline-brd ">纯手工打造
                                        </h3></div>
                                    <small class="project-tag text-left"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                                            href="page_home10.html#">Business</a></small>
                                    <p>鸡血石，星辰沙条带昆凌身价东方拉斯加可浪费</p>
                                </li>


                                <li class="col-sm-4 md-margin-bottom-50 text-center">
                                    <img class="full-width " src="http://localhost:8080/assets/img/main/img9.jpg" alt="">

                                    <div class="headline-left margin-bottom-10  ">
                                        <h3 class="headline-brd text-left">纯手工打造
                                        </h3></div>
                                    <small class="project-tag text-left"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                                            href="page_home10.html#">Business</a></small>
                                    <p>鸡血石，星辰沙条带昆凌身价东方拉斯加可浪费</p>
                                </li>

                                <li class="col-sm-4 md-margin-bottom-50 text-center">
                                    <img class="full-width " src="http://localhost:8080/assets/img/main/img9.jpg" alt="">

                                    <div class="headline-left margin-bottom-10 text-left ">
                                        <h3 class="headline-brd ">纯手工打造
                                        </h3></div>
                                    <small class="project-tag text-left"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                                            href="page_home10.html#">Business</a></small>
                                    <p>鸡血石，星辰沙条带昆凌身价东方拉斯加可浪费</p>
                                </li>

                            </ul>
                        </div>
                        <!--待转出-->
                        <div class="tab-pane fade in" id="transfer-wait">
                            <ul class="list-unstyled row portfolio-box">
                                <li class="col-sm-4 md-margin-bottom-50 text-center">
                                    <img class="full-width " src="http://localhost:8080/assets/img/main/img9.jpg" alt="">

                                    <div class="headline-left margin-bottom-10 text-left ">
                                        <h3 class="headline-brd ">纯手工打造
                                        </h3></div>
                                    <small class="project-tag text-left"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                                            href="page_home10.html#">Business</a></small>
                                    <p>鸡血石，星辰沙条带昆凌身价东方拉斯加可浪费</p>
                                </li>

                                <li class="col-sm-4 md-margin-bottom-50 text-center">
                                    <img class="full-width " src="http://localhost:8080/assets/img/main/img9.jpg" alt="">

                                    <div class="headline-left margin-bottom-10 text-left ">
                                        <h3 class="headline-brd ">纯手工打造
                                        </h3></div>
                                    <small class="project-tag text-left"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                                            href="page_home10.html#">Business</a></small>
                                    <p>鸡血石，星辰沙条带昆凌身价东方拉斯加可浪费</p>
                                </li>


                                <li class="col-sm-4 md-margin-bottom-50 text-center">
                                    <img class="full-width " src="http://localhost:8080/assets/img/main/img9.jpg" alt="">

                                    <div class="headline-left margin-bottom-10  ">
                                        <h3 class="headline-brd text-left">纯手工打造
                                        </h3></div>
                                    <small class="project-tag text-left"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                                            href="page_home10.html#">Business</a></small>
                                    <p>鸡血石，星辰沙条带昆凌身价东方拉斯加可浪费</p>
                                </li>

                                <li class="col-sm-4 md-margin-bottom-50 text-center">
                                    <img class="full-width " src="http://localhost:8080/assets/img/main/img9.jpg" alt="">

                                    <div class="headline-left margin-bottom-10 text-left ">
                                        <h3 class="headline-brd ">纯手工打造
                                        </h3></div>
                                    <small class="project-tag text-left"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                                            href="page_home10.html#">Business</a></small>
                                    <p>鸡血石，星辰沙条带昆凌身价东方拉斯加可浪费</p>
                                </li>

                            </ul>
                        </div>
                        <!--待确认-->
                        <div class="tab-pane fade in" id="transfer-confirm">
                            <ul class="list-unstyled row portfolio-box">
                                <li class="col-sm-4 md-margin-bottom-50">
                                    <img class="full-width " src="http://localhost:8080/assets/img/main/img9.jpg" style="margin-bottom: 0px" alt="">
                                    <div class="" style="background:rgba(0,0,0,.5);height: 20px;margin-top: -20px;position:relative;z-index: 999">
                                        <label style="text-align: center;color:whitesmoke;width: 50%">确认转入</label><label  style="text-align: center;color:whitesmoke;background: #FB0007;width: 50%">拒绝转入</label>
                                    </div>

                                    <div class="headline-left margin-bottom-10 text-left ">
                                        <h3 class="headline-brd">纯手工打造
                                        </h3></div>
                                    <small class="project-tag text-left"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                                            href="page_home10.html#">Business</a></small>
                                    <p class="text-left">鸡血石，星辰沙辰条带昆凌身斯加可浪费</p>
                                </li>

                                <li class="col-sm-4 md-margin-bottom-50">
                                    <img class="full-width " src="http://localhost:8080/assets/img/main/img9.jpg" style="margin-bottom: 0px" alt="">
                                    <div class="" style="background:rgba(0,0,0,.5);height: 20px;margin-top: -20px;position:relative;z-index: 999">
                                        <label style="text-align: center;color:whitesmoke;width: 50%">确认转入</label><label  style="text-align: center;color:whitesmoke;background: #FB0007;width: 50%">拒绝转入</label>
                                    </div>

                                    <div class="headline-left margin-bottom-10 text-left ">
                                        <h3 class="headline-brd">纯手工打造
                                        </h3></div>
                                    <small class="project-tag text-left"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                                            href="page_home10.html#">Business</a></small>
                                    <p class="text-left">鸡血石，星辰沙辰条带昆凌身斯加可浪费</p>
                                </li>

                                <li class="col-sm-4 md-margin-bottom-50">
                                    <img class="full-width " src="http://localhost:8080/assets/img/main/img9.jpg" style="margin-bottom: 0px" alt="">
                                    <div class="" style="background:rgba(0,0,0,.5);height: 20px;margin-top: -20px;position:relative;z-index: 999">
                                        <label style="text-align: center;color:whitesmoke;width: 50%">确认转入</label><label  style="text-align: center;color:whitesmoke;background: #FB0007;width: 50%">拒绝转入</label>
                                    </div>

                                    <div class="headline-left margin-bottom-10 text-left ">
                                        <h3 class="headline-brd">纯手工打造
                                        </h3></div>
                                    <small class="project-tag text-left"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                                            href="page_home10.html#">Business</a></small>
                                    <p class="text-left">鸡血石，星辰沙辰条带昆凌身斯加可浪费</p>
                                </li>

                                <li class="col-sm-4 md-margin-bottom-50">
                                    <img class="full-width " src="http://localhost:8080/assets/img/main/img9.jpg" style="margin-bottom: 0px" alt="">
                                    <div class="" style="background:rgba(0,0,0,.5);height: 20px;margin-top: -20px;position:relative;z-index: 999">
                                        <label style="text-align: center;color:whitesmoke;width: 50%">确认转入</label><label  style="text-align: center;color:whitesmoke;background: #FB0007;width: 50%">拒绝转入</label>
                                    </div>

                                    <div class="headline-left margin-bottom-10 text-left ">
                                        <h3 class="headline-brd">纯手工打造
                                        </h3></div>
                                    <small class="project-tag text-left"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                                            href="page_home10.html#">Business</a></small>
                                    <p class="text-left">鸡血石，星辰沙辰条带昆凌身斯加可浪费</p>
                                </li>

                            </ul>
                        </div>

                    </div>
                </div>

            </div>


        <#--收藏作品 collect_work_title_top-->
            <div class="tab-pane fade in" id="colercting-work">
                <h4>收藏作品</h4>
                <hr style="padding: 0px;margin-top: 5px"/>
                <ul class="list-unstyled row portfolio-box">
                    <li class="col-sm-4 md-margin-bottom-50 text-center">
                        <img class="full-width " src="http://localhost:8080/assets/img/main/img9.jpg" alt="">
                        <p id="" style=" background:rgba(0,0,0,.5); position:relative; top:-19px; color:whitesmoke; font-size:12px;">
                            取消收藏
                        </p>
                        <div class="headline-left margin-bottom-10 text-left ">
                            <h3 class="headline-brd collect_work_title_top">纯手工打造
                        </h3></div>
                        <small class="project-tag text-left"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                                href="page_home10.html#">Business</a></small>
                        <p>鸡血石，星辰沙条带昆凌身价东方拉斯加可浪费</p>
                    </li>


                    <li class="col-sm-4 md-margin-bottom-50 text-center">
                        <img class="full-width " src="http://localhost:8080/assets/img/main/img9.jpg" alt="">
                        <p id="" style=" background:rgba(0,0,0,.5); position:relative; top:-19px; color:whitesmoke; font-size:12px;">
                            取消收藏
                        </p>
                        <div class="headline-left margin-bottom-10 text-left ">
                            <h3 class="headline-brd collect_work_title_top">纯手工打造
                            </h3></div>
                        <small class="project-tag text-left"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                                href="page_home10.html#">Business</a></small>
                        <p>鸡血石，星辰沙条带昆凌身价东方拉斯加可浪费</p>
                    </li>

                    <li class="col-sm-4 md-margin-bottom-50 text-center">
                        <img class="full-width " src="http://localhost:8080/assets/img/main/img9.jpg" alt="">
                        <p id="" style=" background:rgba(0,0,0,.5); position:relative; top:-19px; color:whitesmoke; font-size:12px;">
                            取消收藏
                        </p>
                        <div class="headline-left margin-bottom-10 text-left ">
                            <h3 class="headline-brd collect_work_title_top">纯手工打造
                            </h3></div>
                        <small class="project-tag text-left"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                                href="page_home10.html#">Business</a></small>
                        <p>鸡血石，星辰沙条带昆凌身价东方拉斯加可浪费</p>
                    </li>


                    <li class="col-sm-4 md-margin-bottom-50 text-center">
                        <img class="full-width " src="http://localhost:8080/assets/img/main/img9.jpg" alt="">
                        <p id="" style=" background:rgba(0,0,0,.5); position:relative; top:-19px; color:whitesmoke; font-size:12px;">
                            取消收藏
                        </p>
                        <div class="headline-left margin-bottom-10 text-left ">
                            <h3 class="headline-brd collect_work_title_top">纯手工打造
                            </h3></div>
                        <small class="project-tag text-left"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                                href="page_home10.html#">Business</a></small>
                        <p>鸡血石，星辰沙条带昆凌身价东方拉斯加可浪费</p>
                    </li>


                    <li class="col-sm-4 md-margin-bottom-50 text-center">
                        <img class="full-width " src="http://localhost:8080/assets/img/main/img9.jpg" alt="">
                        <p id="" style=" background:rgba(0,0,0,.5); position:relative; top:-19px; color:whitesmoke; font-size:12px;">
                            取消收藏
                        </p>
                        <div class="headline-left margin-bottom-10 text-left ">
                            <h3 class="headline-brd collect_work_title_top">纯手工打造
                            </h3></div>
                        <small class="project-tag text-left"><i class="fa fa-tag"></i><a href="page_home10.html#">田黄鸡血石</a>, <a
                                href="page_home10.html#">Business</a></small>
                        <p>鸡血石，星辰沙条带昆凌身价东方拉斯加可浪费</p>
                    </li>

                </ul>


            </div>
            <div class="tab-pane fade in" id="see-user">
                <div class="row">
                    <div class="col-md-9 " style="margin-top: 20px">
                        <div class="media">
                            <div class="pull-left">
                                <div style="height: 60px;width: 60px;border-radius: 50px;overflow:hidden">
                                    <img class="" src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
                                </div>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">M小路痴M_7132</h4>
                                <p>作品
                                    <span style="margin-left: 10px;color: #FB591D">1509</span>
                                    <span style="margin-left: 10px">|</span>
                                    <span style="margin-left: 10px;">粉丝</span>
                                    <span style="color: #FB591D;margin-left: 10px">126</span>
                                    <span style="float:  right;"><button class="btn btn-default">
                                <i class="glyphicon glyphicon-ok" style="margin-right: 3px"></i>已经关注</button></span>
                                </p>
                                <p>地址
                                    <span style="margin-left: 5px;">江苏</span>
                                    <span style="margin-left: 5px">连云港</span>
                                </p>
                            </div>
                        </div>

                        <hr>

                        <div class="media">
                            <div class="pull-left">
                                <div style="height: 60px;width: 60px;border-radius: 50px;overflow:hidden">
                                    <img class="" src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
                                </div>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">M小路痴M_7132</h4>
                                <p>作品
                                    <span style="margin-left: 10px;color: #FB591D">1509</span>
                                    <span style="margin-left: 10px">|</span>
                                    <span style="margin-left: 10px;">粉丝</span>
                                    <span style="color: #FB591D;margin-left: 10px">126</span>
                                    <span style="float:  right;"><button class="btn btn-default">
                                <i class="glyphicon glyphicon-plus" style="margin-right: 3px"></i>添加关注</button>
                            </span>
                                </p>
                                <p>地址
                                    <span style="margin-left: 5px;">江苏</span>
                                    <span style="margin-left: 5px">连云港</span>
                                </p>
                            </div>
                        </div>

                        <hr>

                        <div class="media">
                            <div class="pull-left">
                                <div style="height: 60px;width: 60px;border-radius: 50px;overflow:hidden">
                                    <img class="" src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
                                </div>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">M小路痴M_7132</h4>
                                <p>作品
                                    <span style="margin-left: 10px;color: #FB591D">1509</span>
                                    <span style="margin-left: 10px">|</span>
                                    <span style="margin-left: 10px;">粉丝</span>
                                    <span style="color: #FB591D;margin-left: 10px">126</span>
                                    <span style="float:  right;"><button class="btn btn-default">
                                <i class="glyphicon glyphicon-plus" style="margin-right: 3px"></i>添加关注</button>
                            </span>
                                </p>
                                <p>地址
                                    <span style="margin-left: 5px;">江苏</span>
                                    <span style="margin-left: 5px">连云港</span>
                                </p>
                            </div>
                        </div>

                        <hr>

                        <div class="media">
                            <div class="pull-left">
                                <div style="height: 60px;width: 60px;border-radius: 50px;overflow:hidden">
                                    <img class="" src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
                                </div>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">M小路痴M_7132</h4>
                                <p>作品
                                    <span style="margin-left: 10px;color: #FB591D">1509</span>
                                    <span style="margin-left: 10px">|</span>
                                    <span style="margin-left: 10px;">粉丝</span>
                                    <span style="color: #FB591D;margin-left: 10px">126</span>
                                    <span style="float:  right;"><button class="btn btn-default">
                                <i class="glyphicon glyphicon-plus" style="margin-right: 3px"></i>添加关注</button>
                            </span>
                                </p>
                                <p>地址
                                    <span style="margin-left: 5px;">江苏</span>
                                    <span style="margin-left: 5px">连云港</span>
                                </p>
                            </div>
                        </div>

                        <hr>

                        <div class="media">
                            <div class="pull-left">
                                <div style="height: 60px;width: 60px;border-radius: 50px;overflow:hidden">
                                    <img class="" src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
                                </div>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">M小路痴M_7132</h4>
                                <p>作品
                                    <span style="margin-left: 10px;color: #FB591D">1509</span>
                                    <span style="margin-left: 10px">|</span>
                                    <span style="margin-left: 10px;">粉丝</span>
                                    <span style="color: #FB591D;margin-left: 10px">126</span>
                                    <span style="float:  right;"><button class="btn btn-default">
                                <i class="glyphicon glyphicon-plus" style="margin-right: 3px"></i>添加关注</button>
                            </span>
                                </p>
                                <p>地址
                                    <span style="margin-left: 5px;">江苏</span>
                                    <span style="margin-left: 5px">连云港</span>
                                </p>
                            </div>
                        </div>

                        <hr>

                        <div class="media">
                            <div class="pull-left">
                                <div style="height: 60px;width: 60px;border-radius: 50px;overflow:hidden">
                                    <img class="" src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
                                </div>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">M小路痴M_7132</h4>
                                <p>作品
                                    <span style="margin-left: 10px;color: #FB591D">1509</span>
                                    <span style="margin-left: 10px">|</span>
                                    <span style="margin-left: 10px;">粉丝</span>
                                    <span style="color: #FB591D;margin-left: 10px">126</span>
                                    <span style="float:  right;"><button class="btn btn-default">
                                <i class="glyphicon glyphicon-plus" style="margin-right: 3px"></i>添加关注</button>
                            </span>
                                </p>
                                <p>地址
                                    <span style="margin-left: 5px;">江苏</span>
                                    <span style="margin-left: 5px">连云港</span>
                                </p>
                            </div>
                        </div>

                        <hr>

                        <div class="media">
                            <div class="pull-left">
                                <div style="height: 60px;width: 60px;border-radius: 50px;overflow:hidden">
                                    <img class="" src="${staticPath}/assets/img/testimonials/img5.jpg" alt=""/>
                                </div>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">M小路痴M_7132</h4>
                                <p>作品
                                    <span style="margin-left: 10px;color: #FB591D">1509</span>
                                    <span style="margin-left: 10px">|</span>
                                    <span style="margin-left: 10px;">粉丝</span>
                                    <span style="color: #FB591D;margin-left: 10px">126</span>
                                    <span style="float:  right;"><button class="btn btn-default">
                                <i class="glyphicon glyphicon-plus" style="margin-right: 3px"></i>添加关注</button>
                            </span>
                                </p>
                                <p>地址
                                    <span style="margin-left: 5px;">江苏</span>
                                    <span style="margin-left: 5px">连云港</span>
                                </p>
                            </div>
                        </div>
                        <hr>
                    </div>
                </div>

            </div>

        <#--积分中心-->
            <div class="tab-pane fade in" id="integrel">
                <div class="heading">
                    <h2 style="margin-bottom: 0px;padding-bottom: 0px">可用积分</h2>
                    <h3 style="color: orangered">0</h3>
                </div>

                <div class="row text-center margin-bottom-40">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <div class="col-md-5">
                            <button class="btn btn-u btn-u-default" data-toggle="modal" data-target=".withdrawModel"
                                    style="width: 150px;background: #AFAFB0;color: whitesmoke">提现
                            </button>
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-5">
                            <button class="btn btn-u btn-u-default" data-toggle="modal" data-target=".chargeModel"
                                    style="width: 150px;background: #D70016;color: whitesmoke">充值
                            </button>
                        </div>
                    </div>
                    <div class="col-md-2"></div>
                </div>

                <div class="heading heading-v1 margin-bottom-20">
                    <h4 style="color:  #bbb;">积分明细</h4>
                </div>

                <div class="row table">
                    <div class="col-md-3"></div>
                    <div class="col-md-6">
                        <ul class="">
                            <li style="" class="jf_active user_jf_li" data-type="qb">
                                <a href="#quanbu" data-toggle="tab">全部</a>
                            </li>
                            <li class="user_jf_li" data-type="cz">
                                <a href="#chongzhi" data-toggle="tab">充值</a>
                            </li>
                            <li class="user_jf_li" data-type="tx">
                                <a href="#tixian" data-toggle="tab">提现</a>
                            </li>
                            <li class="user_jf_li" data-type="qt">
                                <a href="#qita" data-toggle="tab">其他</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-3"></div>

                </div>
            <#--积分列表-->
                <div id="jf_content">


                </div>
            </div>

        <#--个人资料-->
            <div class="tab-pane fade in" id="user-info">
                <h4>个人资料</h4>
                <hr style="padding: 0px;margin-top: 5px"/>

                <form action="" method="post" class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="name">姓名：</label>
                        <div class="col-sm-4">
                            <input class="form-control" name="name" id="name" type="text" placeholder="请输入姓名"/>
                        </div>

                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">所在城市：</label>
                        <div class="col-sm-4">
                            <div class="row">
                                <div class="col-sm-6">
                                    <select data-placeholder="省份" data-rel="chosen" id="provinceId" name="province"
                                            class="form-control" name="">
                                        <option value="0">请选择</option>
                                        <#if provinceList?? && (provinceList?size >0)>

                                            <#list provinceList as item>
                                                <option value="${item.provinceid}">${item.province}</option>
                                            </#list>


                                        </#if>
                                    </select>

                                </div>
                                <div class="col-sm-6">
                                    <select data-placeholder="城市" data-rel="chosen" name="city" id="cityId"
                                            class="form-control" name="">
                                        <option value="0">请选择</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="contact">联系方式：</label>
                        <div class="col-sm-4">
                            <input class="form-control" name="contact" id="contact" type="text"
                                   placeholder="请输入联系方式"/>
                        </div>

                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="email">Email：</label>
                        <div class="col-sm-4">
                            <input class="form-control" name="email" id="email" type="email"
                                   placeholder="请输入Email"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="cardNo">身份证：</label>
                        <div class="col-sm-4">
                            <input class="form-control" name="cardNo" id="cardNo" type="text" placeholder="请输入身份证"/>
                        </div>
                    </div>

                <#--收藏偏好-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">偏好：</label>
                        <div class="col-sm-4 checkbox">
                            <label><input name="preferences" type="checkbox">玉器</label>
                            <label><input name="preferences" type="checkbox">古玩</label>
                            <label><input name="preferences" type="checkbox">古家具</label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">是否公开：</label>
                        <div class="col-sm-4 radio">
                            <label><input name="isPublic" type="radio">是</label>
                            <label><input name="isPublic" type="radio">否</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-2"></div>
                        <div class="col-sm-4">
                            <button class="btn btn-u btn-u-green" type="submit" style="font-size: 14px;
                                        width: 100%">保存
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Tab v3 -->

</@htmlBody>
<@footerJS>

<script id="qb_jf" type="mustache">
    <div class="container" style="margin-top: 50px">
                            <div class="row margin-bottom-10">
                                <div class="col-md-2 col-md-offset-1">2016-11-29 12:00:00</div>
                                <div class="col-md-5">作品被浏览</div>
                                <div class="col-md-2" style="color: orangered">+1</div>
                            </div>
                            <hr style="height: 0px ;margin: 0px;"/>
                        </div>
                        <div class="container" style="margin-top: 30px">
                            <div class="row margin-bottom-10">
                                <div class="col-md-2 col-md-offset-1">2016-11-29 12:00:00</div>
                                <div class="col-md-5">作品被浏览</div>
                                <div class="col-md-2" style="color: orangered">+1</div>
                            </div>
                            <hr style="height: 0px ;margin: 0px;"/>
                        </div>
                        <div class="container" style="margin-top: 30px">
                            <div class="row margin-bottom-10">
                                <div class="col-md-2 col-md-offset-1">2016-11-29 12:00:00</div>
                                <div class="col-md-5">作品被浏览</div>
                                <div class="col-md-2" style="color: orangered">+1</div>
                            </div>
                            <hr style="height: 0px ;margin: 0px;"/>
                        </div>
                        <div class="container" style="margin-top: 30px">
                            <div class="row margin-bottom-10">
                                <div class="col-md-2 col-md-offset-1">2016-11-29 12:00:00</div>
                                <div class="col-md-5">作品被浏览</div>
                                <div class="col-md-2" style="color: orangered">+1</div>
                            </div>
                            <hr style="height: 0px ;margin: 0px;"/>
                        </div>
                        <div class="container" style="margin-top: 30px">
                            <div class="row margin-bottom-10">
                                <div class="col-md-2 col-md-offset-1">2016-11-29 12:00:00</div>
                                <div class="col-md-5">作品被浏览</div>
                                <div class="col-md-2" style="color: orangered">+1</div>
                            </div>
                            <hr style="height: 0px ;margin: 0px;"/>
                        </div>

</script>

<script id="cz_jf" type="mustache">
    <div class="container" style="margin-top: 50px">
                            <div class="row margin-bottom-10">
                                <div class="col-md-2 col-md-offset-1">2016-11-29 12:00:00</div>
                                <div class="col-md-5">充值送积分</div>
                                <div class="col-md-2" style="color: orangered">+1</div>
                            </div>
                            <hr style="height: 0px ;margin: 0px;"/>
                        </div>
                        <div class="container" style="margin-top: 30px">
                            <div class="row margin-bottom-10">
                                <div class="col-md-2 col-md-offset-1">2016-11-29 12:00:00</div>
                                <div class="col-md-5">充值送积分</div>
                                <div class="col-md-2" style="color: orangered">+1</div>
                            </div>
                            <hr style="height: 0px ;margin: 0px;"/>
                        </div>
                        <div class="container" style="margin-top: 30px">
                            <div class="row margin-bottom-10">
                                <div class="col-md-2 col-md-offset-1">2016-11-29 12:00:00</div>
                                <div class="col-md-5">充值送积分</div>
                                <div class="col-md-2" style="color: orangered">+1</div>
                            </div>
                            <hr style="height: 0px ;margin: 0px;"/>
                        </div>
                        <div class="container" style="margin-top: 30px">
                            <div class="row margin-bottom-10">
                                <div class="col-md-2 col-md-offset-1">2016-11-29 12:00:00</div>
                                <div class="col-md-5">充值送积分</div>
                                <div class="col-md-2" style="color: orangered">+1</div>
                            </div>
                            <hr style="height: 0px ;margin: 0px;"/>
                        </div>
                        <div class="container" style="margin-top: 30px">
                            <div class="row margin-bottom-10">
                                <div class="col-md-2 col-md-offset-1">2016-11-29 12:00:00</div>
                                <div class="col-md-5">充值送积分</div>
                                <div class="col-md-2" style="color: orangered">+1</div>
                            </div>
                            <hr style="height: 0px ;margin: 0px;"/>
                        </div>

</script>

<script id="tx_jf" type="mustache">
    <div class="container" style="margin-top: 50px">
                            <div class="row margin-bottom-10">
                                <div class="col-md-2 col-md-offset-1">2016-11-29 12:00:00</div>
                                <div class="col-md-5">提现送积分</div>
                                <div class="col-md-2" style="color: orangered">+1</div>
                            </div>
                            <hr style="height: 0px ;margin: 0px;"/>
                        </div>
                        <div class="container" style="margin-top: 30px">
                            <div class="row margin-bottom-10">
                                <div class="col-md-2 col-md-offset-1">2016-11-29 12:00:00</div>
                                <div class="col-md-5">提现送积分</div>
                                <div class="col-md-2" style="color: orangered">+1</div>
                            </div>
                            <hr style="height: 0px ;margin: 0px;"/>
                        </div>

</script>

<script id="qt_jf" type="mustache">
    <div class="container" style="margin-top: 50px">
                            <div class="row margin-bottom-10">
                                <div class="col-md-2 col-md-offset-1">2016-11-29 12:00:00</div>
                                <div class="col-md-5">其他送积分</div>
                                <div class="col-md-2" style="color: orangered">+1</div>
                            </div>
                            <hr style="height: 0px ;margin: 0px;"/>
                        </div>
                        <div class="container" style="margin-top: 30px">
                            <div class="row margin-bottom-10">
                                <div class="col-md-2 col-md-offset-1">2016-11-29 12:00:00</div>
                                <div class="col-md-5">其他送积分</div>
                                <div class="col-md-2" style="color: orangered">+1</div>
                            </div>
                            <hr style="height: 0px ;margin: 0px;"/>
                        </div>

</script>
<!-- JS Customization -->

<!--提现积分model-->
<div class="modal fade withdrawModel" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                <h4 id="myLargeModalLabel2" class="modal-title">积分提现</h4>
            </div>
            <div class="modal-body margin-top-20 margin-bottom-50">
                <div class="heading heading-v1 margin-bottom-20">
                    <h4 style="">可用积分：280</h4>
                </div>

                <div class="container">

                    <div class="row">

                        <div class="col-md-1"></div>
                        <div class="col-md-2 text-right">
                            <p>请输入提现积分：</p>
                        </div>
                        <div class="col-md-4">
                            <input type="text" id="jifen" class="form-control">
                            <p style="margin-bottom: 0px">预计一个工作日内以红包的形式发放到你的微信账户</p>
                            <p style="color: darkred">请输入0~280提现积分</p>
                            <button class="btn btn-lg form-control" id="withdraw_qr" type="button"
                                    style="color: white;background: darkred;padding: 0px">确认提现
                            </button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<!--积分充值model-->
<div class="modal fade chargeModel" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                <h4 id="myLargeModalLabel2" class="modal-title">积分提现</h4>
            </div>
            <div class="modal-body margin-top-20 margin-bottom-50">
                <div class="heading heading-v1 margin-bottom-20">
                    <h4 style="">当前积分：280</h4>
                </div>
                <div class="container">
                    <div class="row margin-bottom-20">
                        <div class="col-md-4">
                            <div style="border: solid #E6E7E8 1px;height: 100px">
                                <div class="row">
                                    <label style="color:#51C041;text-align: center;border-right: solid #E6E7E8 1px;width: 50%;margin-top: 20px"><span style="font-size: 35px">5</span>积分</label><label style="color: #FB1E25;text-align: center;width: 50%;margin-top: 20px;"><span style="font-size: 35px">5</span></span>元</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div style="border: solid #E6E7E8 1px;height: 100px">
                                <div class="row">
                                    <label style="color:#51C041;text-align: center;border-right: solid #E6E7E8 1px;width: 50%;margin-top: 20px"><span style="font-size: 35px">10</span>积分</label><label style="color: #FB1E25;text-align: center;width: 50%;margin-top: 20px;"><span style="font-size: 35px">10</span></span>元</label>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row margin-bottom-20">
                        <div class="col-md-4">
                            <div style="border: solid #E6E7E8 1px;height: 100px">
                                <div class="row">
                                    <label style="color:#51C041;text-align: center;border-right: solid #E6E7E8 1px;width: 50%;margin-top: 20px"><span style="font-size: 35px">20</span>积分</label><label style="color: #FB1E25;text-align: center;width: 50%;margin-top: 20px;"><span style="font-size: 35px">20</span></span>元</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div style="border: solid #E6E7E8 1px;height: 100px">
                                <div class="row">
                                    <label style="color:#51C041;text-align: center;border-right: solid #E6E7E8 1px;width: 50%;margin-top: 20px"><span style="font-size: 35px">50</span>积分</label><label style="color: #FB1E25;text-align: center;width: 50%;margin-top: 20px;"><span style="font-size: 35px">49</span></span>元</label>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row margin-bottom-20">
                        <div class="col-md-4">
                            <div style="border: solid #E6E7E8 1px;height: 100px">
                                <div class="row">
                                    <label style="color:#51C041;text-align: center;border-right: solid #E6E7E8 1px;width: 50%;margin-top: 20px"><span style="font-size: 35px">100</span>积分&nbsp;&nbsp;<s style="color:#E6E7E8 ">100元</s></label><label style="color: #FB1E25;text-align: center;width: 50%;margin-top: 20px;"><span style="font-size: 35px">95</span></span>元&nbsp;&nbsp;优惠5%</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div style="border: solid #E6E7E8 1px;height: 100px">
                                <div class="row">
                                    <label style="color:#51C041;text-align: center;border-right: solid #E6E7E8 1px;width: 50%;margin-top: 20px"><span style="font-size: 35px">200</span>积分&nbsp;&nbsp;<s style="color:#E6E7E8 ">200元</s></label><label style="color: #FB1E25;text-align: center;width: 50%;margin-top: 20px;"><span style="font-size: 35px">180</span></span>元&nbsp;&nbsp;优惠10%</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<#--<!--充值model&ndash;&gt;-->
<#--<div class="modal fade chargeModel" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">-->
    <#--<div class="modal-dialog modal-lg">-->
        <#--<div class="modal-content">-->
            <#--<div class="modal-header">-->
                <#--<button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>-->
                <#--<h4 id="myLargeModalLabel2" class="modal-title">积分充值</h4>-->
            <#--</div>-->
            <#--<div class="modal-body margin-top-20 margin-bottom-50">-->
                <#--<div class="container">-->
                    <#--<div class="row">-->
                        <#--<div class="col-md-1"></div>-->
                        <#--<div class="col-md-2 text-right">-->
                            <#--<p>请输入提现积分：</p>-->
                        <#--</div>-->
                        <#--<div class="col-md-4">-->
                            <#--<input type="text" id="jifen" class="form-control">-->
                            <#--<p style="margin-bottom: 0px">预计一个工作日内以红包的形式发放到你的微信账户</p>-->
                            <#--<p style="color: darkred">请输入0~280提现积分</p>-->
                            <#--<button class="btn btn-lg" id="recharge_qr" type="button"-->
                                    <#--style="color: white;background: darkred">确认提现-->
                            <#--</button>-->
                        <#--</div>-->
                    <#--</div>-->
                <#--</div>-->

            <#--</div>-->
        <#--</div>-->
    <#--</div>-->
<#--</div>-->

<script type="text/javascript" src="${staticPath}/assets/js/custom.js"></script>


<script>

    jQuery(document).ready(function () {


        $("#editAvatr").bind("click", function () {
            alert("上传图片")
        });

        /*积分4个tab使用模板绑定*/
        $(".user_jf_li").bind("click", function () {
            $(".user_jf_li").removeClass("jf_active");
            $(this).addClass("jf_active");
            var type = $(this)[0].getAttribute("data-type");
            /*ajax 根据 type 请求相应的积分列表*/
            //4中type模板公用
            if (type == "qb") {
                var qbtpl = $("#qb_jf")[0].innerHTML;
                var html = Mustache.render(qbtpl, {});
                $("#jf_content")[0].innerHTML = "";
                $("#jf_content")[0].innerHTML = html;
            }
            if (type == "cz") {
                var cztpl = $("#cz_jf")[0].innerHTML;
                var html = Mustache.render(cztpl, {});
                $("#jf_content")[0].innerHTML = "";
                $("#jf_content")[0].innerHTML = html;
            }
            if (type == "tx") {
                var txtpl = $("#tx_jf")[0].innerHTML;
                var html = Mustache.render(txtpl, {});
                $("#jf_content")[0].innerHTML = "";
                $("#jf_content")[0].innerHTML = html;
            }

            if (type == "qt") {
                var qttpl = $("#qt_jf")[0].innerHTML;
                var html = Mustache.render(qttpl, {});
                $("#jf_content")[0].innerHTML = "";
                $("#jf_content")[0].innerHTML = html;
            }

        });
//        页面加载时主动触发加载全部积分列表
        $('.jf_active').trigger("click");

        $("#provinceId").change(function () {
            $.get("getCityByProvinceId/" + $("#provinceId").val(), function (data) {
                if (data.status) {
                    var result = "<option>选择城市</option>";
                    $.each(data.cityList, function (n, value) {
                        result += "<option value='" + value.cityid + "'>" + value.city + "</option>";
                    });
                    $("#cityId").html('');
                    $("#cityId").append(result);
                }
            }, "json");
        });

        //积分提现
        $("#withdraw_qr").bind("click", function () {
            alert("提现成功");
            $('.withdrawModel').modal("hide");
        });

        //积分充值
        $("#recharge_qr").bind("click", function () {
            alert("充值成功");

        });

    });
</script>
</@footerJS>

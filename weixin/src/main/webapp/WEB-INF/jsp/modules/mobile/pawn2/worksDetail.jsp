<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>金石典当</title>
    <link rel="stylesheet" href="${ctxStatic}/css/custom.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/weui.min.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/jquery-weui.min.css"/>

    <script src="${ctxStatic}/js/jquery-2.1.4.js"></script>
    <script src="${ctxStatic}/js/jquery-weui.js"></script>
    <script src="${ctxStatic}/js/swiper.js"></script>
    <style>
        #header-left {
            width: 15%;
            float: left;
            overflow: hidden;
            display: inline-block;
        }

        #header-left-img {
            height: 50px;
            width: 50px;
            background-image: url("${ctxStatic}/img/headImg/15.jpg");

        }

        #header-left-like {
            font-size: 8px;
            width: 50px;
        }

        #header-right {
            display: inline-block;
            /*float: right;*/
            margin-left: 3%;
            width: 80%;
            height: 500px;

        }

        #header-right-tab {
            font-size: 15px;
            height: 55px;
            position: relative;
        }

        .header-right-userName {
            position: absolute;
            color: #98CCEB;
            top: 0;
            left: 0;
        }

        .header-right-workId {
            color: #C27B77;
            position: absolute;
            top: 0;
            right: 5px;

        }

        .header-right-workName {
            position: absolute;
            bottom: 0px;
            left: 0;

        }

        .header-right-btn {
            font-size: 8px;
            position: absolute;
            bottom: 5px;
            right: 5px;
            border: 1px solid gray;
            color: gray;
            line-height: 13px;
        }

        #header-right-intro {
            margin-top: 4%;
            line-height: 20px;
            margin-bottom: 4%;

        }

        #header-right-footer {
            font-size: 10px;
        }

        #like {
            margin-bottom: 10px;
        }

        #like-icon {
            margin-left: 5%;
            width: 10%;
            display: inline-block;
            float: left;
        }

        #like-icon img {
            margin-top: 10px;
            width: 20px;
            height: 20px;
        }

        #like-people {
            width: 85%;
            display: inline-block;
        }

        .like-people-one {
            float: left;
            width: 32px;
            height: 32px;
            margin: 3px;

        }

        #look-icon {
            margin-left: 5%;
            width: 10%;
            display: inline-block;
            float: left;
        }

        #look-people {
            margin-left: 1%;
            width: 75%;
            display: inline-block;
        }

        .look-people-one {
            margin-bottom: 5%;
        }

        .look-people-one-img {
            width: 40px;
            height: 40px;
            margin-right: 1%;
        }

        .look-people-one-info {
            display: inline-block;
            font-size: 10px;
        }

        .look-people-one-info-name {
            position: relative;
            top: -10px;
        }

        .look-people-one-care {
            text-align: center;
            display: inline-block;
            float: right;
            margin-top: 2%;
        }

        .look-people-one-care-text-not {
            font-size: 15px;
            background-color: #189AD8;
            color: white;
            border-radius: 3px;
            padding-left: 12px;
            padding-right: 12px;
        }

        .look-people-one-care-text-have {
            font-size: 15px;
            background-color: #C3C3C3;
            color: white;
            border-radius: 3px;
            padding-left: 8px;
            padding-right: 8px;

        }

        #look-people-more {
            font-size: 10px;
            color: #A8A8A8;
            margin-bottom: 5%;
        }

        .info-register-left {
            float: left;
            margin-left: 10%;
            margin-right: 3%;
            width: 20%;
        }

        .info-register-left-icon {
            background-image: url("${ctxStatic}/img/cut/worksDetail-register-or-like.png");
            background-repeat: no-repeat;
            background-position-x: center;
            background-size: 30px 30px;
            padding-top: 30px;
            text-align: center;
            font-size: 10px;
        }

        .info-register-right {
            display: inline-block;
            font-size: 10px;
        }

        .info-work {
            font-size: 10px;
            margin-left: 5%;
            margin-top: 5%;
            margin-bottom: 5%;
        }

        .info-work span {
            color: gray;

        }

        .each-row-two {
            display: inline-block;
            width: 46%;
        }

        .explain-img {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            vertical-align: bottom;
        }

        .explain-text {
            border: none;
            height: 26px;
            line-height: 26px;
            width: 160px;
            padding-left: 2px;
            padding-right: 2px;
            vertical-align: bottom;
        }

        .explain-btn {
            background-color: #2598DB;
            color: white;
            border: 2px solid white;
            height: 32px;
            width: 80px;
            font-size: 14px;
            font-weight: bold;
            margin-left: 30px;
        }

        .explains-one {
            margin-bottom: 2%;
        }

        .explains-one-title-name {
            border: none;
            height: 26px;
            line-height: 26px;
            width: 80px;
            padding-left: 2px;
            padding-right: 2px;
            vertical-align: bottom;
        }

        .explains-one-title-date {
            border: none;
            height: 26px;
            line-height: 26px;
            width: 80px;
            margin-left: 120px;
            padding-right: 2px;
            vertical-align: bottom;
        }

        .explains-one-imgs-one {
            width: 23%;
            height: 70px;
        }

        .weui-grid__icon {
            width: 90px;
            height: 90px;
            margin: 0 auto;
        }

        .weui-grid {
            padding: 3px 3px;
        }

        .weui-grids:before, .weui-grids:after, .weui-grid:after, .weui-grid:before {
            border: none;
        }

        .explains-one-text:after {
            content: '全文';
            color: blue;

        }


    </style>

</head>
<body>
<div id="header" class="div-outer">
    <div id="header-left">
        <div id="header-left-img"></div>
        <input type="button" value=" +关注 " id="header-left-like">
    </div>
    <div id="header-right">
        <div id="header-right-tab">
            <span class="header-right-userName">谁与论春秋</span>
            <span class="header-right-workId">JS_A201612050001A</span>
            <span class="header-right-workName">[极品玉化琥珀老星月菩提佛珠]</span>
            <span class="header-right-btn">&nbsp;+&nbsp;收藏&nbsp;</span>
        </div>
        <div id="header-right-intro">
            测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字
            测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字
        </div>
        <div class="weui-grids">
            <a href="javascript:;" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="${ctxStatic}/img/headImg/16.jpg" alt="">
                </div>
            </a>
            <a href="javascript:;" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="${ctxStatic}/img/headImg/16.jpg" alt="">
                </div>
            </a>
            <a href="javascript:;" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="${ctxStatic}/img/headImg/16.jpg" alt="">
                </div>
            </a>
            <a href="javascript:;" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="${ctxStatic}/img/headImg/16.jpg" alt="">
                </div>
            </a>
            <a href="javascript:;" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="${ctxStatic}/img/headImg/16.jpg" alt="">
                </div>
            </a>
            <a href="javascript:;" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="${ctxStatic}/img/headImg/16.jpg" alt="">
                </div>
            </a>
            <a href="javascript:;" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="${ctxStatic}/img/headImg/16.jpg" alt="">
                </div>
            </a>
            <a href="javascript:;" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="${ctxStatic}/img/headImg/16.jpg" alt="">
                </div>
            </a>
            <a href="javascript:;" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="${ctxStatic}/img/headImg/16.jpg" alt="">
                </div>
            </a>
        </div>
        <div id="header-right-footer">
            <span>浏览次数 588</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span>2016-11-06&nbsp;12:06:18</span>
        </div>
    </div>
</div>

<div class="div-outer">
    <div id="like">
        <div id="like-icon">
            <img src="${ctxStatic}/img/cut/worksDetail-likepeople.png">
        </div>

        <div id="like-people">
            <img src="${ctxStatic}/img/headImg/1.jpg" class="like-people-one">
            <img src="${ctxStatic}/img/headImg/2.jpg" class="like-people-one">
            <img src="${ctxStatic}/img/headImg/3.jpg" class="like-people-one">
            <img src="${ctxStatic}/img/headImg/4.jpg" class="like-people-one">
            <img src="${ctxStatic}/img/headImg/5.jpg" class="like-people-one">
            <img src="${ctxStatic}/img/headImg/6.jpg" class="like-people-one">
            <img src="${ctxStatic}/img/headImg/7.jpg" class="like-people-one">
            <img src="${ctxStatic}/img/headImg/8.jpg" class="like-people-one">
            <img src="${ctxStatic}/img/headImg/9.jpg" class="like-people-one">
            <img src="${ctxStatic}/img/headImg/10.jpg" class="like-people-one">
            <img src="${ctxStatic}/img/headImg/11.jpg" class="like-people-one">
            <img src="${ctxStatic}/img/headImg/12.jpg" class="like-people-one">
            <img src="${ctxStatic}/img/headImg/13.jpg" class="like-people-one">
            <img src="${ctxStatic}/img/headImg/14.jpg" class="like-people-one">
            <img src="${ctxStatic}/img/headImg/15.jpg" class="like-people-one">
            <img src="${ctxStatic}/img/cut/worksDetail-morelikepeople.png" class="like-people-one">
        </div>
    </div>


    <div id="look">
        <div id="look-icon">
            <img src="${ctxStatic}/img/cut/worksDetail-lookpeople.png">
        </div>

        <div id="look-people">
            <div class="look-people-one">
                <img src="${ctxStatic}/img/headImg/16.jpg" class="look-people-one-img"/>
                <div class="look-people-one-info">
                    <p class="look-people-one-info-name">
                        缘溪寻梦
                    </p>
                    <p class="look-people-one-info-date">
                        16-12-05 &nbsp;09:19:27
                    </p>
                </div>
                <div class="look-people-one-care">
                    <p class="look-people-one-care-text-not">
                        +关注
                    </p>
                </div>
            </div>
            <div class="look-people-one">
                <img src="${ctxStatic}/img/headImg/17.jpg" class="look-people-one-img"/>
                <div class="look-people-one-info">
                    <p class="look-people-one-info-name">
                        老特拉福德永恒
                    </p>
                    <p class="look-people-one-info-date">
                        16-12-05 &nbsp;09:19:27
                    </p>
                </div>
                <div class="look-people-one-care">
                    <p class="look-people-one-care-text-not">
                        +关注
                    </p>
                </div>
            </div>
            <div class="look-people-one">
                <img src="${ctxStatic}/img/headImg/18.jpg" class="look-people-one-img"/>
                <div class="look-people-one-info">
                    <p class="look-people-one-info-name">
                        致明天的信
                    </p>
                    <p class="look-people-one-info-date">
                        16-12-05 &nbsp;09:19:27
                    </p>
                </div>
                <div class="look-people-one-care">
                    <p class="look-people-one-care-text-have">
                        已关注
                    </p>
                </div>
            </div>
            <center id="look-people-more">加载更多</center>
        </div>
    </div>
</div>


<div class="div-outer">
    <div id="info">
        <div class="info-register">
            <div class="info-register-left">
                <p class="info-register-left-icon">登记者信息</p>
            </div>
            <div class="info-register-right">
                <p>姓名:张三</p>
                <p>联系方式:15151999000</p>
                <p>地址:江苏无锡滨湖区科教创业园1号602</p>
                <p>身份证:320503199911011884</p>
            </div>
        </div>

        <div class="info-work">
            <center>作品信息</center>
            <div class="each-row-two">
                <span>品种:</span>昌化田黄石
            </div>
            <div class="each-row-two">
                <span>作品类型: </span>印章
            </div>
            <div class="each-row-two">
                <span>尺寸: </span>17cm*20cm*20cm
            </div>
            <div class="each-row-two">
                <span>重量:</span>106g
            </div>
            <div class="each-row-two">
                <span>工艺制作: </span>一级
            </div>
            <div class="each-row-two">
                <span>篆刻级别:</span>三级
            </div>
            <div class="each-row-two">
                <span>矿区地域:</span>核桃岭
            </div>
            <div class="each-row-two">
                <span>制作人:</span>赵四
            </div>
            <div>
                <span>制作时间:</span>2016-12-05 14:40
            </div>
            <div>
                <span>作品诠释:</span>测试文字测试文字测试文字测试文字测试文字测试文字测试文字
                测试文字测试文字测试文字测试文字测试文字测试文字测试文字
                测试文字测试文字测试文字测试文字测试文字测试文字测试文字
                测试文字测试文字测试文字测试文字测试文字测试文字测试文字
            </div>
        </div>

        <div class="info-work">
            <center>作品等级</center>
            <div class="each-row-two">
                <span>质地一:</span>冻
            </div>
            <div class="each-row-two">
                <span>质地二: </span>软地
            </div>
            <div class="each-row-two">
                <span>感观: </span>透细腻温润
            </div>
            <div class="each-row-two">
                <span>磨氏度: </span>2-2.5
            </div>
            <div class="each-row-two">
                <span>血量:</span>&gt;50%
            </div>
            <div class="each-row-two">
                <span>血色: </span>鲜红
            </div>
            <div class="each-row-two">
                <span>血形:</span>团状块
            </div>
            <div class="each-row-two">
                <span>浓艳度:</span>浓艳
            </div>
            <div class="each-row-two">
                <span>纯净度:</span>略净
            </div>
            <div class="each-row-two">
                <span>地色:</span>黄
            </div>
            <div class="each-row-two">
                <span>活筋:</span>格裂复位粘结
            </div>
            <div class="each-row-two">
                <span>裂:</span>裂缝
            </div>
            <div class="each-row-two">
                <span>印章:</span>5面
            </div>
            <div class="each-row-two">
                <span>含血方式:</span>表面及内在含血
            </div>
        </div>

        <div class="info-work">
            <center>评估报告</center>
            测试文字测试文字测试文字测试文字测试文字测试文字
            测试文字测试文字测试文字测试文字测试文字测试文字
            测试文字测试文字测试文字测试文字测试文字测试文字
            测试文字测试文字测试文字测试文字测试文字测试文字
            测试文字测试文字测试文字测试文字测试文字测试文字
            测试文字测试文字测试文字测试文字测试文字测试文字
            测试文字测试文字测试文字测试文字测试文字测试文字
        </div>

        <div class="info-register">
            <div class="info-register-left">
                <p class="info-register-left-icon">收藏者信息</p>
            </div>
            <div class="info-register-right">
                <p>姓名:张三</p>
                <p>联系方式:15151999000</p>
                <p>地址:江苏无锡滨湖区科教创业园1号602</p>
                <p>身份证:320503199911011884</p>
            </div>
        </div>

        <div class="info-work">
            <center>作品诠释</center>
            <img src="${ctxStatic}/img/headImg/3.jpg" class="explain-img">
            <input type="text" class="explain-text" placeholder="点击进行诠释"/>
            <input type="button" value="诠释" class="explain-btn"/>
        </div>

        <div class="info-work">
            <div class="explains-one">
                <div class="explains-one-title">
                    <img src="${ctxStatic}/img/headImg/5.jpg" class="explain-img">
                    <input type="text" class="explains-one-title-name" value="天**我"/>
                    <input type="text" value="2016-12-05" class="explains-one-title-date"/>
                </div>
                <div class="explains-one-text">
                    新疆和田玉籽料,独籽,佛像,背面留皮,底部的皮裂痕是故意留下的,因为不影响整个构图,40.6毫米啦啦啦啦啦啦啦
                </div>
                <div class="explains-one-imgs">
                    <img src="${ctxStatic}/img/swiper/swiper-1.jpg" class="explains-one-imgs-one">
                    <img src="${ctxStatic}/img/swiper/swiper-2.jpg" class="explains-one-imgs-one">
                    <img src="${ctxStatic}/img/swiper/swiper-3.jpg" class="explains-one-imgs-one">
                    <img src="${ctxStatic}/img/cut/certificate-icon.png" class="explains-one-imgs-one">
                    <img src="${ctxStatic}/img/swiper/swiper-1.jpg" class="explains-one-imgs-one">
                    <img src="${ctxStatic}/img/headImg/1.jpg" class="explains-one-imgs-one">
                    <img src="${ctxStatic}/img/swiper/swiper-1.jpg" class="explains-one-imgs-one">

                </div>
            </div>
            <div class="explains-one">
                <div class="explains-one-title">
                    <img src="${ctxStatic}/img/headImg/5.jpg" class="explain-img">
                    <input type="text" class="explains-one-title-name" value="天**我"/>
                    <input type="text" value="2016-12-05" class="explains-one-title-date"/>
                </div>
                <div class="explains-one-text">
                    新疆和田玉籽料,独籽,佛像,背面留皮,底部的皮裂痕是故意留下的,因为不影响整个构图,40.6毫米啦啦啦啦啦啦啦
                </div>
                <div class="explains-one-imgs">
                    <img src="${ctxStatic}/img/swiper/swiper-1.jpg" class="explains-one-imgs-one">
                    <img src="${ctxStatic}/img/swiper/swiper-2.jpg" class="explains-one-imgs-one">
                    <img src="${ctxStatic}/img/swiper/swiper-3.jpg" class="explains-one-imgs-one">
                    <img src="${ctxStatic}/img/cut/certificate-icon.png" class="explains-one-imgs-one">
                    <img src="${ctxStatic}/img/swiper/swiper-1.jpg" class="explains-one-imgs-one">
                    <img src="${ctxStatic}/img/headImg/1.jpg" class="explains-one-imgs-one">
                    <img src="${ctxStatic}/img/swiper/swiper-1.jpg" class="explains-one-imgs-one">
                </div>
            </div>
            <div class="explains-one">
                <div class="explains-one-title">
                    <img src="${ctxStatic}/img/headImg/5.jpg" class="explain-img">
                    <input type="text" class="explains-one-title-name" value="天**我"/>
                    <input type="text" value="2016-12-05" class="explains-one-title-date"/>
                </div>
                <div class="explains-one-text">
                    新疆和田玉籽料,独籽,佛像,背面留皮,底部的皮裂痕是故意留下的,因为不影响整个构图,40.6毫米啦啦啦啦啦啦啦
                </div>
                <div class="explains-one-imgs">
                    <img src="${ctxStatic}/img/swiper/swiper-1.jpg" class="explains-one-imgs-one">
                    <img src="${ctxStatic}/img/swiper/swiper-2.jpg" class="explains-one-imgs-one">
                    <img src="${ctxStatic}/img/swiper/swiper-3.jpg" class="explains-one-imgs-one">
                    <img src="${ctxStatic}/img/cut/certificate-icon.png" class="explains-one-imgs-one">
                    <img src="${ctxStatic}/img/swiper/swiper-1.jpg" class="explains-one-imgs-one">
                    <img src="${ctxStatic}/img/headImg/1.jpg" class="explains-one-imgs-one">
                    <img src="${ctxStatic}/img/swiper/swiper-1.jpg" class="explains-one-imgs-one">
                </div>
            </div>
        </div>
    </div>

</div>
<script>
    $(function () {
        $('.explains-one-text').on('click', function () {
            location.href = "#";
        })
    })

</script>

</body>
</html>
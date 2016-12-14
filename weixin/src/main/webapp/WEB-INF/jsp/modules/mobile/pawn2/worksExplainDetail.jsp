<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
    <title>诠释详情</title>
    <link rel="stylesheet" href="${ctxStatic}/css/custom.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/weui.min.css"/>
    <link rel="stylesheet" href="${ctxStatic}/css/jquery-weui.min.css"/>

    <script src="${ctxStatic}/js/jquery-2.1.4.js"></script>
    <script src="${ctxStatic}/js/jquery-weui.js"></script>
    <script src="${ctxStatic}/js/swiper.js"></script>
    <style>

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
            margin: 4%;
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
            width: 100%;
        }

        body {
            background-color: white;
        }
    </style>
</head>
<body>
<div class="explains-one div-outer">
    <div class="explains-one-title">
        <img src="${ctxStatic}/img/headImg/5.jpg" class="explain-img">
        <input type="text" class="explains-one-title-name" value="天**我"/>
        <input type="text" value="2016-12-05" class="explains-one-title-date"/>
    </div>
    <div class="explains-one-text">
        新疆和田玉籽料,独籽,佛像,背面留皮,底部的皮裂痕是故意留下的,因为不影响整个构图,40.6毫米啦啦啦啦啦啦啦
        新疆和田玉籽料,独籽,佛像,背面留皮,底部的皮裂痕是故意留下的,因为不影响整个构图,40.6毫米啦啦啦啦啦啦啦
        新疆和田玉籽料,独籽,佛像,背面留皮,底部的皮裂痕是故意留下的,因为不影响整个构图,40.6毫米啦啦啦啦啦啦啦
        新疆和田玉籽料,独籽,佛像,背面留皮,底部的皮裂痕是故意留下的,因为不影响整个构图,40.6毫米啦啦啦啦啦啦啦 新疆和田玉籽料,独籽,佛像,背面留皮,底部的皮裂痕是故意留下的,因为不影响整个构图,40.6毫米啦啦啦啦啦啦啦
        新疆和田玉籽料,独籽,佛像,背面留皮,底部的皮裂痕是故意留下的,因为不影响整个构图,40.6毫米啦啦啦啦啦啦啦 新疆和田玉籽料,独籽,佛像,背面留皮,底部的皮裂痕是故意留下的,因为不影响整个构图,40.6毫米啦啦啦啦啦啦啦
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
</body>
</html>
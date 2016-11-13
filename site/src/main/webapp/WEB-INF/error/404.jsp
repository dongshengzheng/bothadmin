<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <style type="text/css">
        #container {
            width: 794px;
            margin: 50px auto;
            position: relative;
            padding-top: 379px;
            visibility: hidden;
        }

        #icon.color-404 {
            background-image: url(http://www.srdlc.com/static/img/404.png);
        }

        #icon {
            width: 328px;
            height: 385px;
            position: absolute;
            left: 0;
            top: -10px;
        }

        h1.title {
            position: absolute;
            left: 353px;
            top: 170px;
        }

        h1 {
            font-size: 55px;
            line-height: 55px;
            color: #444;
            font-family: "Ubuntu", sans-serif;
            font-weight: 700;
            margin: 0;
        }

        h3.description {
            position: absolute;
            left: 353px;
            top: 222px;
        }

        h3 {
            font-size: 16px;
            line-height: 16px;
            color: #888;
            font-family: "Ubuntu", sans-serif;
            font-weight: 500;
            margin: 0;
            padding-left: 3px;
        }

        nav {
            padding-top: 11px;
            display: block;
        }

        nav ul {
            text-align: center;
            list-style: none;
            list-style-image: none;
            margin: 0;
            padding: 0;
        }

        nav ul li {
            display: inline;
            color: #969696;
            font-size: 15px;
            font-family: "HelveticaNeue", Helvetica, sans-serif;
            text-decoration: none;
        }

        nav ul li.divider {
            padding: 0 14px;
        }

        nav ul li a:link, nav ul li a:hover, nav ul li a:visited, nav ul li a:active {
            color: #969696;
            font-size: 15px;
            font-family: "HelveticaNeue", Helvetica, sans-serif;
            text-decoration: none;
        }

        nav ul li a:hover {
            color: #828282;
        }
        nav ul li.divider {
            padding: 0 14px;
        }

    </style>
</head>
<body>
<div id="container" style="visibility: visible;">

    <div id="icon" class="color-404"></div>

    <h1 class="title">Uh Oh...</h1>
    <h3 class="description">页面不存在或者已经过期，您可以进入 <a href="http://www.srdlc.com">苏融贷主站</a> 。</h3>


    <nav>
        <ul>
            <li><a href="http://www.srdlc.com">苏融贷主页</a></li>
            <li class="divider">|</li>
            <li><a href="http://www.srdlc.com/aboutUs.html">关于我们</a></li>
            <li class="divider">|</li>
            <li><a href="http://www.srdlc.com/invest/list.html">我要投资</a></li>
            <li class="divider">|</li>
            <li><a href="http://www.srdlc.com/borrow/view.html">我要借款</a></li>
            <li class="divider">|</li>
            <li><a href="http://www.srdlc.com/newGuide.html">新手帮助</a></li>
        </ul>
    </nav>



</div>
</body>
</html>

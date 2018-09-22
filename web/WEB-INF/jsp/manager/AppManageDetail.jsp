<%--
  Created by IntelliJ IDEA.
  User: Zwiebeln_Chan
  Date: 2018/9/7
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="e" %>
<html>
<head>
    <title>用户列表</title>
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript">
        addEventListener("load", function() { setTimeout(hideURLbar, 0);
        }, false);
        function hideURLbar(){ window.scrollTo(0,1);
        }

        if(${sessionScope.user == null}){
            alert("请先登录！");
            window.location.replace("<%=request.getContextPath()%>/index.login");

        }

    </script>
    <link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <script>
        $(function() {
            var pull 		= $('#pull');
            menu 		= $('nav ul');
            menuHeight	= menu.height();
            $(pull).on('click', function(e) {
                e.preventDefault();
                menu.slideToggle();
            });
            $(window).resize(function(){
                var w = $(window).width();
                if(w > 320 && menu.is(':hidden')) {
                    menu.removeAttr('style');
                }
            });
        });
    </script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/css/font-awesome.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ZCW/appDetail.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ZCW/global.css" />
</head>
<body>
<div class="header_bg" id="home"><!-- start header -->
    <div class="container">
        <div class="row header text-center specials">
            <div class="h_logo">
                <a href="#" onclick="window.close()"><img src="<%=request.getContextPath()%>/imgs/logo.png" alt="" class="responsive"/></a>
            </div>
            <nav class="top-nav">
                <ul class="top-nav nav_list">
                    <li class="logo page-scroll"><a title="关闭" href="#" onclick="window.close()">
                        <img src="<%=request.getContextPath()%>/imgs/logo.png" alt="" class="responsive"/></a></li>
                </ul>
                <a href="#" id="pull"><img src="<%=request.getContextPath()%>/imgs/nav-icon.png" title="menu" /></a>
            </nav>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<div class="slider_bg" style="min-height: 650px; width:100%;">
    <div class="container" id="mainContainer">
        <div class="titleText">
            <h2 style="color: #2DC0F1;">用户详细信息</h2></div>
        <div class="detailDiv">
    <fieldset>
        <table>
            <tr>
                <th width="120px;">ID 号：</td><td >${account.userId}</td>
            </tr>
            <tr>
                <th>昵 称：</td><td >${account.normalName}</td>
            </tr>
            <tr>
                <th>用户名：</td><td >${account.userName}</td>
            </tr>

            <tr>
                <th>权限等级：</td><td >${authority}</td>
            </tr>
            <tr>
                <th>身份证号：</td><td >${account.identityCard}</td>
            </tr>
            <tr>
                <th>身份证姓名：</td><td >${account.idName}</td>
            </tr>
            <tr>
                <th>地 址：</td><td >${account.address}</td>
            </tr>
            <tr>
                <th>QQ 号：</td><td>${account.qq}</td>
            </tr>
            <tr>
                <th>电 话：</th><td>${account.tel}</td>
            </tr>

        </table>
    </fieldset>
</div>
    </div>
</div>
        <div class="footer_bg" id="contact">
            <div class="container"> </div>
        </div>
        <div class="footer1_bg">
            <div class="container">
                <div class="row  footer">
                    <div class="copy text-center">
                        <p class="link"><span>Copyright &copy; 2018.Company name All rights reserved.</span></p>
                        <a href="#home" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"> </span></a>
                    </div>
                </div>
                <script type="text/javascript">
                    $(function() {
                        $('a[href*=#]:not([href=#])').click(function() {
                            if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {

                                var target = $(this.hash);
                                target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
                                if (target.length) {
                                    $('html,body').animate({
                                        scrollTop: target.offset().top
                                    }, 1000);
                                    return false;
                                }
                            }
                        });
                    });
                </script>
            </div>
        </div>

</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.NJUST.ZCW.Entities.AccountEntity" %><%--
  Created by IntelliJ IDEA.
  User: Zwiebeln_Chan
  Date: 2018/9/7
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>权限申请</title>
    <link href="<%=request.getContextPath()%>/css/ZCW/authority.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/css/ZCW/global.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript">
        addEventListener("load", function() { setTimeout(hideURLbar, 0);
        }, false);
        function hideURLbar(){ window.scrollTo(0,1);
        }

        //登录检查
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/css/font-awesome.min.css">
</head>
<body>
<%
    AccountEntity ac=(AccountEntity) session.getAttribute("user");
    String authorities =ac.getAuthority();
    String userType =ac.getIsManager();
    if(userType !=null) {
        switch (userType){
            case "N":
                userType = "普通用户";
                break;
            case "K":
                userType = "开发者";
                break;
            case "C":
                userType = "管理员";
                break;
            default: userType = "普通用户";
            break;
        }
        pageContext.setAttribute("userType", userType);
    }
    pageContext.setAttribute("authorities", authorities);
%>
<div class="header_bg" id="home"><!-- start header -->
    <div class="container">
        <div class="row header text-center specials">
            <div class="h_logo">
                <a href="<%=request.getContextPath()%>/toMainPage.login"><img src="<%=request.getContextPath()%>/imgs/logo.png" alt="" class="responsive"/></a>
            </div>
            <nav class="top-nav">
                <ul class="top-nav nav_list">
                    <li><a href="<%=request.getContextPath()%>/accountmanage.manager">BACK</a></li>
                    <li class="logo page-scroll"><a title="hexa" href="<%=request.getContextPath()%>/index.login">
                        <img src="<%=request.getContextPath()%>/imgs/logo.png" alt="" class="responsive"/></a></li>
                    <li class="page-scroll"><a href="#">about us</a></li>
                </ul>
                <a href="#" id="pull"><img src="<%=request.getContextPath()%>/imgs/nav-icon.png" title="menu" /></a>
            </nav>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<div class="slider_bg" id="mainContainer"><!-- start slider -->
    <div class="container">
        <div class="welcomeDiv1">
            <h3> 您当前的权限等级：<span style="color: #05b7a7;font-size: 28px;">${userType}</span> </h3>
        </div>
        <div id="signAuthority"><h4 style="color: aliceblue">权限对应表:</h4></div>
        <div id="form">
    <table border="2" bgcolor="#00008b">
        <tr>
           <td>等级</td>
           <td>应用查询</td>
           <td>应用上传</td>
           <td>应用管理</td>
           <td>应用统计</td>
           <td>应用分析</td>
           <td>用户管理</td>
           <td>权限管理</td>
           <td>请求审核</td>
        </tr>
        <tr>
            <td>普通用户</td>
            <td style="color: green;font-size: 25px;">√</td>
            <td style="color: red;font-size: 25px">×</td>
            <td style="color: red;font-size: 25px">×</td>
            <td style="color: green;font-size: 25px;">√</td>
            <td style="color: green;font-size: 25px;">√</td>
            <td style="color: red;font-size: 25px">×</td>
            <td style="color: red;font-size: 25px">×</td>
            <td style="color: red;font-size: 25px">×</td>
        </tr>
        <tr>
            <td>开发商用户</td>
            <td style="color: green;font-size: 25px;">√</td>
            <td style="color: green;font-size: 25px;">√</td>
            <td style="color: green;font-size: 25px;">√</td>
            <td style="color: green;font-size: 25px;">√</td>
            <td style="color: green;font-size: 25px;">√</td>
            <td style="color: red;font-size: 25px">×</td>
            <td style="color: red;font-size: 25px">×</td>
            <td style="color: red;font-size: 25px">×</td>
        </tr>
        <tr>
            <td>管理员用户</td>
            <td style="color: green;font-size: 25px;">√</td>
            <td style="color: red;font-size: 25px;">×</td>
            <td style="color: green;font-size: 25px;">√</td>
            <td style="color: green;font-size: 25px;">√</td>
            <td style="color: green;font-size: 25px;">√</td>
            <td style="color: green;font-size: 25px;">√</td>
            <td style="color: green;font-size: 25px;">√</td>
            <td style="color: green;font-size: 25px;">√</td>
        </tr>
    </table>
     </div>
    <div class="apply">
        <c:choose>
            <c:when test="${pageScope.userType == '普通用户'}">
                <a href="<%=request.getContextPath()%>/askforK.manager">申请成为开发商</a>
                <a href="<%=request.getContextPath()%>/askforC.manager">申请成为管理员</a>
            </c:when>
            <c:when test="${pageScope.userType == '开发者'}">
                <a href="<%=request.getContextPath()%>/askforC.manager">申请成为管理员</a>
            </c:when>
            <c:when test="${pageScope.userType == '管理员'}">
                <p><strong>您已拥有最高权限，无需申请！</strong></p>
            </c:when>
        </c:choose>
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
<br>
</body>
</html>

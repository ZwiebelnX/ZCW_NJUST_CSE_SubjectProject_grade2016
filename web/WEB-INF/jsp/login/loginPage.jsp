<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Zwiebeln_Chan
  Date: 2018/9/6
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link href="<%=request.getContextPath()%>/css/login1.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/css/mainPageCss.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript">
        addEventListener("load", function() { setTimeout(hideURLbar, 0);
        }, false);
        function hideURLbar(){ window.scrollTo(0,1);
        }
    </script>
    <link href="<%=request.getContextPath()%>/http//fonts.googleapis.com/css?family=Kreon:300,400,700" rel="stylesheet" type="text/css">
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
<div class="header_bg" id="home"><!-- start header -->
    <div class="container">
        <div class="row header text-center specials">
            <div class="h_logo">
                <a href="<%=request.getContextPath()%>/toMainPage.login"><img src="<%=request.getContextPath()%>/imgs/logo.png" alt="" class="responsive"/></a>
            </div>
            <nav class="top-nav">
                <ul class="top-nav nav_list">
                    <li><a href="<%=request.getContextPath()%>/loginPage.login">LOGIN</a></li>
                    <li class="logo page-scroll"><a title="hexa" href="<%=request.getContextPath()%>/toMainPage.login">
                        <img src="<%=request.getContextPath()%>/imgs/logo.png" alt="" class="responsive"/></a></li>
                    <li class="page-scroll"><a href="<%=request.getContextPath()%>/signUpPage.login">signup</a></li>
                </ul>
                <a href="#" id="pull"><img src="<%=request.getContextPath()%>/imgs/nav-icon.png" title="menu" /></a>
            </nav>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<div class="slider_bg" id="mainContainer"><!-- start slider -->
    <div class="container">
    <div id="content">
        <div id="word">
            <h1>LOGIN</h1>
            <div id="form">
            <from:form commandName="login" action="login.login" method="post">
                <table height="253" id="tab">
                    <tr>
                        <td width="75" height="68" style="color: aliceblue; text-align: right;" >用 户：</td>
                        <td width="80"><from:input id="name" path="username" placeholder="请输入用户名" class="ipt"/></td>
                    </tr>
                    <tr>
                        <td height="58" style="color: aliceblue; text-align: right;">密 码：</td>
                        <td><from:password id="password" path="password"  placeholder="请输入密码" class="ipt"/> </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: right;"><a href="signUpPage.login">用户注册</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="forgetPassword.login">找回密码&nbsp;</a></td>
                     </tr>
                    <tr>
                        <td style="text-align: center;"><img src="<%=request.getContextPath()%>/imgs/Male.gif"/></td>
                        <td  style="text-align: center;"><input type="reset" value="重置" class="buttom"/></td>
                    </tr>
                    <tr>
                        <td style="text-align: center"><img src="<%=request.getContextPath()%>/imgs/Female.gif"/>
                        <td  style="text-align: center;"><input type="submit" value="登录" class="buttom" /></td>
                    </tr>

                </table>
            </from:form>
            </div>
        </div>
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
<div style="display:none"><script src='http//v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
<br>
</body>
</html>

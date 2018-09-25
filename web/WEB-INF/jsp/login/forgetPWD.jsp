<%--
  Created by IntelliJ IDEA.
  User: 10447
  Date: 2018/9/17
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>找回密码</title>
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath()%>/css/ZCW/forgetPWD.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath()%>/css/ZCW/global.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript">
        addEventListener("load", function() { setTimeout(hideURLbar, 0);
        }, false);
        function hideURLbar(){ window.scrollTo(0,1);
        }

    </script>
    <link href="<%=request.getContextPath()%>/http://fonts.googleapis.com/css?family=Kreon:300,400,700" rel="stylesheet" type="text/css">
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ZCW/forgetPWD.css" />
</head>
<body>
<div class="header_bg" id="home" style="min-width: 1000px;padding: 0;margin:0"><!-- start header -->
    <div class="container">
        <div class="row header text-center specials">
            <div class="h_logo">
                <a href="<%=request.getContextPath()%>/toMainPage.login"><img src="<%=request.getContextPath()%>/imgs/logo.png" alt="" class="responsive"/></a>
            </div>
            <nav class="top-nav">
                <ul class="top-nav nav_list">
                    <li style="width:150px;padding: 0;margin:0"><a href="<%=request.getContextPath()%>/loginPage.login">back to login</a></li>
                    <li style="width:70px;"><a title="回到欢迎页" href="<%=request.getContextPath()%>/index.login">
                        <img src="<%=request.getContextPath()%>/imgs/logo.png" alt="" class="responsive"/></a></li>
                    <li style="width:150px;padding: 0;margin:0"><a href="#">about us</a></li>
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
            <h1 style="margin-bottom: 30px;"><strong>找回密码</strong></h1>
        </div>
        <div class="warningText">
            <h3 style="padding: 0;margin: 0;"><strong>${msg}</strong></h3>
        </div>
        <div class="inputDiv">
            <div class="mailInputDiv">
                <form action="postEmail.login">
                    <table>
                        <tr>
                            <td><p>请输入用户名：</p></td>
                            <td><input type="text" name="account" id="account"></td>
                        </tr>
                        <tr align="center">
                            <td colspan="2" style="padding-top: 36px;"><input class="button" type="submit" value="发送验证邮件"></td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="passwordInputDiv">
                <form action="checkemailyzm.login">
                    <table>
                        <tr>
                            <td><p>请输入验证码：</p></td>
                            <td><input type="text" name="yzm" id="yzm"></td>
                        </tr>
                        <tr>
                            <td><p>请输入新密码：</p></td>
                            <td><input type="text" name="pwd" id="pwd"></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center"><input class="button" type="submit" value="确定"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="clearfix"></div >
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

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%--
  Created by IntelliJ IDEA.
  User: Zwiebeln_Chan
  Date: 2018/9/7
  Time: 22:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>应用上传</title>
    <link href="<%=request.getContextPath()%>/css/ZCW/appup.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/css/ZCW/global.css" rel="stylesheet" type="text/css">
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
                    <li class="logo page-scroll"><a title="hexa" href="<%=request.getContextPath()%>/index.login">
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
        <div class="welcomeDiv1"><h2 style="color: #2DC0F1;">应用上传</h2></div>
        <div id="form">
        <fieldset>
        <form action="douploadinfo.upload"  method="post" onsubmit="return finalCheck()">
        <table>
        <tr>
            <td style="color: aliceblue;text-align: right;">应用名称 <span style="color: red;">*</span> ：</td>
            <td style="text-align: center;width: 250px;"><input type="text" name="appname" id="appname" /></td>
        </tr>
        <tr>
            <td style="color: aliceblue; ">应用类型 <span style="color: red;">*</span> ：</td>
            <td style="text-align: center"><select name="type" id="type" style="width: 199px; border-radius: 5px;">
                <option value="-1" selected="selected">[请选择相应类型]</option>
                <option value="游戏">游戏</option>
                <option value="视频">视频</option>
                <option value="聊天">聊天</option>
                <option value="浏览器">浏览器</option>
                <option value="网购金融">网购金融</option>
                <option value="生活">生活</option>
                <option value="新闻">新闻</option>
                <option value="摄影">摄影</option>
                <option value="美食">美食</option>
                <option value="音乐">音乐</option>
            </select></td>
        </tr>
        <tr>
            <td style="color: aliceblue;">适宜年龄：</td>
            <td style="text-align: center"><input type="text" name="limitAge" /></td>
        </tr>
        <tr>
            <td style="color: aliceblue;">兼容性：</td>
            <td style="text-align: center"><input type="text" name="compability" /></td>
        </tr>
        <tr>
            <td style="color: aliceblue;">语  言：</td>
            <td style="text-align: center"><input type="text" name="language"/></td>
        </tr>
            <tr rowspan="3">
                <td style="color: aliceblue;height: 110px;">介  绍 <span style="color: red;">*</span> ：</td>
                <td style="text-align: center"><textarea name="introduction" id="introduction" cols="39" rows="4" placeholder="请输入相关应用的介绍" style="width: 199px; border-radius: 5px;"></textarea></td>
            </tr>
        <tr>
            <td width="120">&nbsp;</td>
0            <td style="text-align: center"><input type="submit" value="提交" class="buttom"></td>
        </tr>
    </table>
        </form>
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

            function finalCheck() {
                var appName = $("#appname").val();
                var appType = $("#type").val();
                var appIntroduction = $("#introduction").val();
                if(appName === "" || appName == null){
                    alert("请输入App名称！");
                    return false;
                }
                if(appType === "-1"){
                    alert("请选择App类别！");
                    return false;
                }
                if(appIntroduction === "" || appIntroduction == null){
                    alert("请输入App介绍！");
                    return false;
                }
                return true;
            }
        </script>
    </div>
</div>
<div style="display:none"><script src='http//v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>

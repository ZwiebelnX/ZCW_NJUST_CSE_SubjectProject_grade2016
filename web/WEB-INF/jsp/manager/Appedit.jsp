<%@ page import="com.NJUST.ZCW.Entities.ApplicationEntity" %>
<%@ page import="com.NJUST.ZCW.Entities.AccountEntity" %><%--
  Created by IntelliJ IDEA.
  User: 10447
  Date: 2018/9/12
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="e" %>
<html>
<head>
    <title>更新应用</title>
    <link href="<%=request.getContextPath()%>/css/ZCW/appedit.css" rel="stylesheet" type="text/css">
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

        //权限检查
        if(${sessionScope.userType == "N"}){
            alert("对不起，您没有权限进行操作！");
            window.location.replace("<%=request.getContextPath()%>/toMainPage.login");
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
<div class="header_bg" id="home"><!-- start header -->
    <div class="container">
        <div class="row header text-center specials">
            <div class="h_logo">
                <a href="<%=request.getContextPath()%>/toMainPage.login"><img src="<%=request.getContextPath()%>/imgs/logo.png" alt="" class="responsive"/></a>
            </div>
            <nav class="top-nav">
                <ul class="top-nav nav_list">
                    <li><a href="<%=request.getContextPath()%>/toMainPage.login">main page</a></li>
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
<%
    ApplicationEntity app=(ApplicationEntity)session.getAttribute("app");
    request.setAttribute("aname",app.getName());
    request.setAttribute("atype",app.getType());
    request.setAttribute("aintroduction",app.getIntroduction());
    request.setAttribute("acompatibility",app.getCompatibility());
    request.setAttribute("aversion",app.getVersion());
    request.setAttribute("arequireVersion",app.getRequireVersion());
    request.setAttribute("alanguage",app.getLanguage());

    AccountEntity user = (AccountEntity)session.getAttribute("user");
    pageContext.setAttribute("userType", user.getIsManager());
%>
<div class="slider_bg" id="mainContainer"><!-- start slider -->
    <div class="container">
        <div class="welcomeDiv1"><h2 style="color: #2DC0F1;">应用更新</h2></div>
        <div id="form">
        <fieldset>
    <form action="<%=request.getContextPath()%>/appInfoUpgrade.upload" enctype="multipart/form-data"  method="post">
        <table>
            <tr>
                <td style="color: aliceblue;">应用名称 <span style="color: red;">*</span> ：</td>
                <td width="220"><input type="text" name="appname" value="${aname}"/></td>
                <td width="200">&nbsp;</td>
                <e:choose>
                    <e:when test="${pageScope.userType == 'K'}">
            <td style="color: aliceblue;">更新图标<span style="color: red;">*</span> ：</td>
            <td width="220;"style="text-align: right;"><input type="file" name="iconFile" style="width: 220px; height: 27px; color: #05b7a7;font-size: 15px;"/></td>
                    </e:when>
                </e:choose>
            </tr>
            <tr>
                <td style="color: aliceblue;">应用类型 <span style="color: red;">*</span> ：</td>
                <td><select name="type" id="type" style="width: 199px; border-radius: 5px;">
                        <option value="-1" selected="selected">原类型：${atype}</option>
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
                    </select>
                </td>
                <td>&nbsp;</td>
                <e:choose>
                    <e:when test="${pageScope.userType == 'K'}">
                        <td style="color: aliceblue;">更新apk文件 <span style="color: red;">*</span> ：</td>
                        <td><input type="file" name="apkFile" style="width: 220px; height: 27px; color: #05b7a7;font-size: 15px;"/></td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            </e:when>
            </e:choose>
            <tr>
                <td style="color: aliceblue;">兼容性 ：</td>
                <td><input type="text" name="compability" value="${acompatibility}" /></td>
                <td>&nbsp;</td>
                <td style="color: aliceblue;">介  绍 ：</td>
                <td style="text-align: left;padding-top: 10px;"><textarea name="introduction" id="introduction" cols="300" rows="3" placeholder="原介绍：${aintroduction}" style="width: 220px; border-radius: 15px;color: #037f74;"></textarea>
                </td>

            </tr>
            <tr>
                        <td style="color: aliceblue;">语  言 :</td>
                        <td><input type="text" name="language" value="${alanguage}" /></td>
                    </tr>
            <e:choose>
             <e:when test="${pageScope.userType != 'K'}">
                    <tr>
                        <td colspan="5" style="color: #137569;text-align: center;padding-top: 15px;">
                            * 只有应用开发者才有重新上传apk和图标的权限
                        </td>
                    </tr>
             </e:when>
            </e:choose>
            <tr>
                <td colspan="5" style="text-align: center;padding-top: 20px;"><input type="submit" value="保存修改" class="buttom"/></td>
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

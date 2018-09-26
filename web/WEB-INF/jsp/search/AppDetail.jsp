<%--
  Created by IntelliJ IDEA.
  User: Zwiebeln_Chan
  Date: 2018/9/7
  Time: 22:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="e" %>
<html>
<head>
    <title>应用详细信息</title>
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
            <h2>${app.name}的详细信息</h2>
        </div>
        <div class="detailDiv">
            <table>
                <tr>
                    <th>应用名称:</th>
                    <td>${app.name}</td>
                </tr>
                <tr>
                    <th>图标</th>
                    <td><img src="${app.img}" style="width:50px;height: 50px;"/></td>
                </tr>
                <tr>
                    <th>开发商:</th>
                    <td><a href="<%=request.getContextPath()%>/getappbypublisher/${app.publisherId}.manager">${publishername}</a></td>
                </tr>
                <tr>
                    <th>分类:</th>
                    <td>${app.type}</td>
                </tr>
                <tr>
                    <th>简介:</th>
                    <td>${app.introduction}</td>
                </tr>
                <tr>
                    <th>版本号:</th>
                    <td>${app.version}</td>
                </tr>
                <tr>
                    <th>限制年龄:</th>
                    <td>${app.limitAge}</td>
                </tr>
                <tr>
                    <th>语言:</th>
                    <td>${app.language}</td>
                </tr>
                <tr>
                    <th>兼容性:</th>
                    <td>${app.compatibility}</td>
                </tr>
                <tr>
                    <th>最低版本:</th>
                    <td>${app.requireVersion}</td>
                </tr>
                <tr>
                    <th>浏览总数:</th>
                    <td>${app.visitCnt}</td>
                </tr>
                <tr>
                    <th>所需权限:</th>
                    <td>
                        <textarea class="permissionText" readonly="readonly">
                        ${app.auriorityNeed}
                        </textarea>
                    </td>
                </tr>
                <tr>
                    <th>审核状态</th>
                    <td>${zt}</td>
                </tr>
                <tr>
                    <th>下载链接:</th>
                    <td><a href="${app.downloadUrl}">点此下载</a></td>
                </tr>
            </table>
        </div>
        <div class="clearfix"></div >
    </div>
</div>
<div class="footer_bg" id="contact">
    <div class="container"> </div>
</div>
<div class="footer1_bg">
    <div class="container">
        <div class="row  footer">
            <div class="copy text-center">
                <p class="link"><span>Copyright &copy; 2018.CZW All rights reserved.</span></p>
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

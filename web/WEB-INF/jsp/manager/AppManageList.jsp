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
        if(${!sessionScope.userType == "C"}){
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/css/font-awesome.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ZCW/appManageList.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ZCW/global.css" />
</head>
<body>
    <div class="header_bg" id="home" style="min-width: 1000px;"><!-- start header -->
        <div class="container">
            <div class="row header text-center specials">
                <div class="h_logo">
                    <a href="<%=request.getContextPath()%>/toMainPage.login"><img src="<%=request.getContextPath()%>/imgs/logo.png" alt="" class="responsive"/></a>
                </div>
                <nav class="top-nav">
                    <ul class="top-nav nav_list">
                        <li><a href="<%=request.getContextPath()%>/toMainPage.login">back to main</a></li>
                        <li class="logo page-scroll"><a title="回到主页" href="<%=request.getContextPath()%>/toMainPage.login">
                        <img src="<%=request.getContextPath()%>/imgs/logo.png" alt="" class="responsive"/></a></li>
                        <li class="page-scroll"><a href="#">about us</a></li>
                    </ul>
                    <a href="#" id="pull"><img src="<%=request.getContextPath()%>/imgs/nav-icon.png" title="menu" /></a>
                </nav>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <div class="slider_bg" style="min-height: 650px; width:100%;">
        <div class="container" id="mainContainer">
            <div id="global">
                <div class="titleText">
                    <h2>用户列表</h2>
                    <h4 style="color:grey;">N:代表普通用户&nbsp;K:代表开发商用户&nbsp;C:代表管理员</h4>
                </div>
                    <div class="accountListDiv">
                        <table>
                            <tr>
                                <th>用户名</th>
                                <th>权限等级</th>
                                <th>详细信息</th>
                                <th colspan="4">操作</th>
                            </tr>
                            <e:forEach items="${Accountlist}" var="Accountlist">
                                <tr>
                                    <td style="width: 120px">${Accountlist.userName}</td>
                                    <td>${Accountlist.isManager}</td>
                                    <td><button class="button" style="width: 150px" onclick="
                                            window.open('<%=request.getContextPath()%>/accountinformation/${Accountlist.userId}.manager');
                                            ">查看</button></td>
                                    <td><button class="button" style="width: 130px" onclick="
                                            window.location.href=('<%=request.getContextPath()%>/askforN/${Accountlist.userId}.manager');
                                            ">更改成普通用户</button>
                                    </td>
                                    <td><button class="button" style="width: 130px" onclick="
                                            window.location.href=('<%=request.getContextPath()%>/askforK/${Accountlist.userId}.manager');
                                            ">更改成开发商用户</button>
                                    </td>
                                    <td>
                                        <button class="button" style="width: 130px" onclick="
                                                window.location.href=('<%=request.getContextPath()%>/askforC/${Accountlist.userId}.manager');
                                                ">更改成管理员</button>
                                    </td>
                                    <td>
                                        <button class="button" style="width: 130px" onclick="
                                                window.location.href=('<%=request.getContextPath()%>/accountdelete/${Accountlist.userId}.manager');
                                                ">删除用户</button>
                                    </td>
                                </tr>
                            </e:forEach>
                        </table>
                    </div>
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

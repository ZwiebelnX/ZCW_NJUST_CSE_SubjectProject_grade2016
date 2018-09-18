<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.NJUST.ZCW.Entities.AccountEntity" %>
<%--
  Created by IntelliJ IDEA.
  User: Zwiebeln_Chan
  Date: 2018/9/6
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <title>ZCW安卓软件管理系统</title>
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css" />
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/mainPageCss.css" />
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
            <li><a href="<%=request.getContextPath()%>/logout.login">logout</a></li>
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
  <div class="slider_bg" style="height: 650px;">
    <div class="container" id="mainContainer">
      <c:choose>
        <c:when  test="${sessionScope.nickname != null}">
          <%
            AccountEntity ac=(AccountEntity) session.getAttribute("user");
            pageContext.setAttribute("userType", ac.getIsManager());
            request.setAttribute("authority",ac.getAuthority());
          %>
          <div class="welcomeText">
            <h2><strong>欢迎登录：${sessionScope.nickname}</strong></h2>
          </div>
          <div class="userAction">
            <a href="<%=request.getContextPath()%>/accountmanage.manager">个人管理</a>
          </div>
          <div class="appSearchAction">
            <a href="<%=request.getContextPath()%>/app.search">应用查询</a>
            <a href="<%=request.getContextPath()%>/app.statistics">应用统计</a>
          </div>
          <c:if test="${userType.equals('C')}">
            <div class="managerDiv">
              <a href="<%=request.getContextPath()%>/AuthorityManagee.manager">权限管理</a>
              <a href="<%=request.getContextPath()%>/Accountlist.manager">用户管理</a>
              <a href="<%=request.getContextPath()%>/AppCheck.manager">应用审核</a>
              <a href="<%=request.getContextPath()%>/AppManage.manager">应用管理</a>
            </div>
          </c:if>
          <c:if test="${userType.equals('K')}">
            <div class="developerDiv">
              <a href="<%=request.getContextPath()%>/AppUpload.upload">应用上传</a>
              <a href="<%=request.getContextPath()%>/AppManage.manager">应用管理</a>
            </div>
          </c:if>
        </c:when>
        <c:otherwise>
          <div class="welcomeText">
            <h1><strong>您尚未登录</strong></h1>
          </div>
          <div class="logAction">
            <h4><a href="<%=request.getContextPath()%>/loginPage.login">登录 </a></h4>
            <h4 style="color:grey">没有账号？<a href="<%=request.getContextPath()%>/signUpPage.login">注册</a></h4>
          </div>
        </c:otherwise>
      </c:choose>
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

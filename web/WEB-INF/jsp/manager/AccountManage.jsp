<%@ page import="com.NJUST.ZCW.Entities.AccountEntity" %><%--
  Created by IntelliJ IDEA.
  User: Zwiebeln_Chan
  Date: 2018/9/7
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>个人设置</title>
    <link href="<%=request.getContextPath()%>/css/ZCW/accountmanage.css" rel="stylesheet" type="text/css">
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
    if(session.getAttribute("user") != null){
        AccountEntity ac=(AccountEntity) session.getAttribute("user");
        pageContext.setAttribute("username", ac.getUserName());
        pageContext.setAttribute("nickname", ac.getNormalName());
        pageContext.setAttribute("mail",ac.getMail());
        pageContext.setAttribute("IDnumber",ac.getIdentityCard());
        pageContext.setAttribute("IDname",ac.getIdName());
        pageContext.setAttribute("qq",ac.getQq());
        pageContext.setAttribute("address",ac.getAddress());
        pageContext.setAttribute("age",ac.getAge());
        pageContext.setAttribute("gender",ac.getGender());
        pageContext.setAttribute("tel",ac.getTel());
        pageContext.setAttribute("username",ac.getUserName());
    }
%>
<div class="header_bg" id="home"><!-- start header -->
    <div class="container">
        <div class="row header text-center specials">
            <div class="h_logo">
                <a href="<%=request.getContextPath()%>/toMainPage.login"><img src="<%=request.getContextPath()%>/imgs/logo.png" alt="" class="responsive"/></a>
            </div>
            <nav class="top-nav">
                <ul class="top-nav nav_list">
                    <li><a href="<%=request.getContextPath()%>/toMainPage.login">main page</a></li>
                    <li class="logo page-scroll"><a title="hexa" href="<%=request.getContextPath()%>/toMainPage.login">
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
            <h2><strong>您好，${pageScope.username}</strong></h2>
        </div>
<div id="personalInformation">
    <fieldset>
    <legend style="font-size: 23px; color: #2DC0F1;">个人信息</legend>
     <div id="form">
    <from:form commandName="personal" action="personal.manager" method="post">
        <table>
            <tr>
                <td style="color: aliceblue;">昵 称：</td>
                <td><from:input id="nickname" path="nickname" value="${pageScope.nickname}"/></td>
            </tr>
            <tr>
                <td style="color: aliceblue;">邮 箱：</td>
                <td><from:input id="email" path="email" value="${pageScope.mail}"/> </td>
            </tr>

            <tr>
                <td style="color: aliceblue;">电 话：</td>
                <td><from:input id="phoneNumber" path="phoneNumber" value="${pageScope.tel}"/> </td>
            </tr>
            <tr>
                <td style="color: aliceblue;">地 址：</td>
                <td><from:input id="address" path="address" value="${pageScope.address}"/> </td>
            </tr>
            <tr>
                <td style="color: aliceblue;">性 别：</td>
                <td><from:input id="gender" path="gender" value="${pageScope.gender}"/> </td>
            </tr>
            <tr>
                <td  style="color: aliceblue;">Q Q号：</td>
                <td><from:input id="qq" path="QQ" value="${pageScope.qq}"/> </td>
            </tr>
            <tr>
                <td style="color: aliceblue;">身份证号：</td>
                <td><from:input id="IDnumber" path="IDnumber" value="${pageScope.IDnumber}"/> </td>
            </tr>
            <tr>
                <td style="color: aliceblue;">身份证姓名：</td>
                <td><from:input id="IDname" path="IDname" value="${pageScope.IDname}"/> </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td  style="text-align: left;"><input type="submit" value="保存修改" class="buttom"/> </td>
            </tr>
        </table>
    </from:form>
     </div>
</fieldset>
</div>
    <div class="modifyPassword">
        <legend style="font-size: 23px; color: #2DC0F1;">修改密码</legend>
        <div id="form1">
    <form  action="pwdchg.manager" method="post">
    <table>
        <tr>
            <td width="120" style="color: aliceblue;">旧密码：</td>
            <td><input type="password" id="pwd"></td>
        </tr>
        <tr>
            <td style="color: aliceblue;">新密码：</td>
            <td><input type="password" id="repwd"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td style="text-align: left"><input type="submit" value="提交" class="buttom"/> </td>
        </tr>
        </table></form>
        </div>
         </fieldset>
        <div id="checkAuthority">
            <legend style="font-size: 23px; color: #2DC0F1;">权限查看</legend>
            <div id="form1"><a href="<%=request.getContextPath()%>/accountauthority.manager" >查看个人当前权限信息</a></div>
        </div>
    </div>
</div>
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

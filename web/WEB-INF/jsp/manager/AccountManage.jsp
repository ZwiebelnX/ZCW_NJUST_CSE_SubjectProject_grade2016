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
<%@ taglib prefix="e" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div class="header_bg" id="home" style="min-width: 1000px;"><!-- start header -->
    <div class="container">
        <div class="row header text-center specials">
            <div class="searchBox">
                <link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
                <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ZCW/searchbox.css" />
                <form method="post" action="<%=request.getContextPath()%>/getappbykeyword.search">
                    <input type="text" name="keyword" placeholder="请输入您要搜索的内容...">
                    <button type="submit"></button>
                </form>
            </div>
            <div class="h_logo">
                <a href="<%=request.getContextPath()%>/toMainPage.login"><img src="<%=request.getContextPath()%>/imgs/logo.png" alt="" class="responsive"/></a>
            </div>
            <nav class="top-nav">
                <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ZCW/nav.css" />
                <ul class="top-nav nav_list">
                    <e:choose>
                        <e:when test="${sessionScope.userType == 'C'}">
                            <li>
                                <div class="index-nav-frame-line active" tabindex="-1">
                                    管理
                                    <div class="index-nav-frame-line-center">
                                        <div class="index-nav-frame-line-li">
                                            <a href="<%=request.getContextPath()%>/AuthorityManagee.manager">权限管理</a>
                                        </div>
                                        <div class="index-nav-frame-line-li">
                                            <a href="<%=request.getContextPath()%>/Accountlist.manager">用户管理</a>
                                        </div>
                                        <div class="index-nav-frame-line-li">
                                            <a href="<%=request.getContextPath()%>/AppCheck.manager">应用审核</a>
                                        </div>
                                        <div class="index-nav-frame-line-li">
                                            <a href="<%=request.getContextPath()%>/AppManage.manager">应用管理</a>
                                        </div>
                                    </div>
                                    <div class="index-nav-frame-line-focus" tabindex="-1"></div>
                                </div>
                            </li>
                        </e:when>
                        <e:when test="${sessionScope.userType == 'K'}">
                            <li>
                                <div class="index-nav-frame-line active" tabindex="-1">
                                    开发
                                    <div class="index-nav-frame-line-center">
                                        <div class="index-nav-frame-line-li">
                                            <a href="<%=request.getContextPath()%>/AppUpload.upload">应用上传</a>
                                        </div>
                                        <div class="index-nav-frame-line-li">
                                            <a href="<%=request.getContextPath()%>/AppManage.manager">应用管理</a>
                                        </div>
                                    </div>
                                    <div class="index-nav-frame-line-focus" tabindex="-1"></div>
                                </div>
                            </li>
                        </e:when>
                        <e:otherwise>
                            <li></li>
                        </e:otherwise>
                    </e:choose>
                    <li>
                        <div class="index-nav-frame-line active" tabindex="-1">
                            查询
                            <div class="index-nav-frame-line-center">
                                <div class="index-nav-frame-line-li">
                                    <a href="<%=request.getContextPath()%>/app.search">应用查询</a>
                                </div>
                                <div class="index-nav-frame-line-li">
                                    <a href="<%=request.getContextPath()%>/app.statistics">应用统计</a>
                                </div>
                            </div>
                            <div class="index-nav-frame-line-focus" tabindex="-1"></div>
                        </div>
                    </li>
                    <li class="logo page-scroll"><a title="回到主页" href="<%=request.getContextPath()%>/toMainPage.login">
                        <img src="<%=request.getContextPath()%>/imgs/logo.png" alt="" class="responsive"/></a></li>
                    <li><a href="<%=request.getContextPath()%>/accountmanage.manager">个人中心</a></li>
                    <li></li>
                </ul>
                <a href="#" id="pull"><img src="<%=request.getContextPath()%>/imgs/nav-icon.png" title="menu" /></a>
                <div class="welcomeText">
                    <strong>
                        欢迎使用：${sessionScope.userNickname}&nbsp;&nbsp;
                        <a href="<%=request.getContextPath()%>/logout.login">注销</a>
                    </strong>
                    <br />
                    <strong>
                        <e:choose>
                            <e:when test="${sessionScope.userType == 'C'}">
                                ——————管理员——————
                            </e:when>
                            <e:when test="${sessionScope.userType == 'K'}">
                                ——————开发者——————
                            </e:when>
                            <e:when test="${sessionScope.userType == 'N'}">
                                ——————普通用户——————
                            </e:when>
                        </e:choose>
                    </strong>
                </div>
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
    <form  action="<%=request.getContextPath()%>/pwdchg.manager" method="post">
    <table>
        <tr>
            <td width="120" style="color: aliceblue;">旧密码：</td>
            <td><input type="password" id="pwd" name="pwd"></td>
        </tr>
        <tr>
            <td style="color: aliceblue;">新密码：</td>
            <td><input type="password" id="repwd" name="repwd"></td>
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
    <br>
</body>
</html>

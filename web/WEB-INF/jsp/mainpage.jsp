<%@ page import="com.NJUST.ZCW.Entities.AccountEntity" %><%--
  Created by IntelliJ IDEA.
  User: Zwiebeln_Chan
  Date: 2018/9/6
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>

  主页。 <br>
  <%
    if(session.getAttribute("nickname")!=null)
    {
      AccountEntity ac=(AccountEntity) session.getAttribute("user");
      String s=ac.getAuthority();
      String s2=ac.getIsManager();
      request.setAttribute("authority",s);
      out.println("欢迎登录："+session.getAttribute("nickname"));
      out.println("<a href=\"logout.login\">注销</a>");
      out.println("<a href=\"accountmanage.manager\">个人管理</a>");
      if(s2!=null&&s2.equals("C")){
        out.println("<a href=\"AuthorityManagee.manager\">权限管理</a>");
        out.println("<a href=\"AccountManagee.manager\">用户管理</a>");
      }
    }
    else{
      out.println("您尚未登录，请先：");
      out.println("<a href=\"loginPage.login\">登录</a>");
      out.println("<a href=\"signUpPage.login\">注册</a>");
    }
  %>
  </body>
</html>

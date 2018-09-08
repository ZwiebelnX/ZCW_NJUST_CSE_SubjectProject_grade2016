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
    <title>$Title$</title>
  </head>
  <body>
  主页。 <br>
  <%
    if(session.getAttribute("username")!=null)
    {
      out.println("欢迎登录："+session.getAttribute("username"));
      out.println("<a href=\"logout\">注销</a>");
    }
    else{
      out.println("您尚未登录，请先：");
      out.println("<a href=\"loginPage\">登录</a>");
      out.println("<a href=\"signUpPage\">注册</a>");
    }
  %>
  </body>
</html>

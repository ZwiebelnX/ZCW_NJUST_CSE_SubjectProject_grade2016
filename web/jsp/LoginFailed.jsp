<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: 10447
  Date: 2018/9/6
  Time: 17:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<body>
登录失败，请检查您的账号和密码！
<br>
三秒钟后返回主页面
<% response.setHeader("refresh", "3;URL=../index.jsp");%>
</body>
</html>

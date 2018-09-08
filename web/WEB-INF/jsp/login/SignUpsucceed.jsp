<%--
  Created by IntelliJ IDEA.
  User: Zwiebeln_Chan
  Date: 2018/9/6
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign Up Success</title>
</head>
<body>
    <h1>注册成功，3秒钟后返回主页</h1>
    <% response.setHeader("refresh", "3;URL=../index.jsp");%>
</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: Zwiebeln_Chan
  Date: 2018/9/6
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Success !</title>
</head>
<body>
    <h1>登录成功，欢迎您</h1>
    <p>用户名：${account.userName}</p>
    <br>
    三秒钟后返回主页面
    <% response.setHeader("refresh", "3; URL=index.jsp");%>
</body>
</html>

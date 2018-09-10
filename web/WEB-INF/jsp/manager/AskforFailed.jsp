<%--
  Created by IntelliJ IDEA.
  User: 10447
  Date: 2018/9/10
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>权限申请</title>
</head>
<body>
<h1>权限申请失败，您已多次提交申请!</h1>
<h2>1秒后返回信息主页</h2>
<% response.setHeader("refresh", "1; URL=accountmanage.manager");%>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: 10447
  Date: 2018/9/7
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册失败</title>
</head>
<body>
注册失败 您的用户名可能重复，请重新注册！
<br>
三秒后返回主页面
<% response.setHeader("refresh", "3;URL=/index.jsp");%>
</body>
</html>

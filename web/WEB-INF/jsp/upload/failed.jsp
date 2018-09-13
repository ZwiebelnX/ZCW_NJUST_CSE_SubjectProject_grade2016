<%--
  Created by IntelliJ IDEA.
  User: 10447
  Date: 2018/9/12
  Time: 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传失败</title>
</head>
<body>
    请检查您的网络环境！
    2秒钟后返回主页。
    <% response.setHeader("refresh", "2; URL=mainPage.login");%>
</body>
</html>

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
    <title>上传成功</title>
</head>
<body>
    上传成功，请等待管理员审核！
    2秒钟后返回主页。
    <% response.setHeader("refresh", "2; URL=mainPage.login");%>
</body>
</html>

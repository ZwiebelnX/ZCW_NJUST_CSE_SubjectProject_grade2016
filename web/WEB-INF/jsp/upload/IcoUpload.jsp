<%--
  Created by IntelliJ IDEA.
  User: 10447
  Date: 2018/9/13
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传图标</title>
</head>
<body>
<h1>为您的应用上传图标</h1>
<form action="douploadico.upload" enctype="multipart/form-data" method="post">
    <table>
        <tr>
            <td>请选择图片:</td>
            <td><input type="file" name="file"></td>
        </tr>
        <tr>
            <td><input type="submit" value="上传"></td>
        </tr>
    </table>
</form>
</body>
<h3>请选择.jpg或.png格式的图片</h3>
</html>

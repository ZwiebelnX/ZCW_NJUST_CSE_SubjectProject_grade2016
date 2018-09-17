<%--
  Created by IntelliJ IDEA.
  User: 10447
  Date: 2018/9/17
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>找回密码</title>
</head>
<body>
<h1>找回密码</h1>
<h2>点击下面的链接，向您的邮箱发送一封验证邮件</h2>
<br>
${msg}
<br>
<form action="postEmail.login">
    请输入您的账号:
    <input type="text" name="account" id="account">
    <input type="submit" value="发送邮件">
</form>
<br>
<form action="checkemailyzm.login">
    请输入验证码:
    <input type="text" name="yzm" id="yzm">
    请输入新密码:
    <input type="text" name="pwd" id="pwd">
    <input type="submit" value="确定">
</form>
</body>
</html>

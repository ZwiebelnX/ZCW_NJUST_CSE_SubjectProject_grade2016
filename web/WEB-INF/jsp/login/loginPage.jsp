<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Zwiebeln_Chan
  Date: 2018/9/6
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<%=request.getContextPath()%>/css/login1.css" rel="stylesheet" type="text/css">
    <title>登录</title>
</head>
<body>
<div id="canvas">
    <div id="header"><img src="<%=request.getContextPath()%>/imgs/1.jpg" width="809" height="111" alt="la"></div>
    <div id="menu"><img src="<%=request.getContextPath()%>/imgs/2.jpg" width="310" height="265" alt="shi"></div>
    <div id="content">
        <fieldset id="fil">
            <legend align="center">请登录</legend>
            <from:form commandName="login" action="login.login" method="post">
                <table id="re">
                    <tr>
                        <td width="64" height="53">用户：</td>
                        <td width="206"><from:input id="name" path="username" placeholder="请输入用户名" class="ipt"/></td>
                    </tr>
                    <tr>
                        <td height="53">密码：</td>
                        <td><from:password id="password" path="password"  placeholder="请输入密码" class="ipt"/> </td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="reset" value="重置" class="buttom"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="登录" class="buttom" /></td>
                    </tr>
                    <tr id="sign">
                        <td colspan="2" height="34"><a href="signUpPage.login">用户注册</a></td>
                    </tr>
                    <tr id="forgetpwd">
                        <td colspan="2" height="34"><a href="forgetPassword.login">找回密码</a></td>
                    </tr>
                </table>
            </from:form>
        </fieldset>
    </div>
    <div id="footer">
        <p>Copyright&nbsp;&copy;&nbsp;2018&nbsp;&#183;&nbsp;All Rights Reserved</p>
    </div>
</div>
</body>
</html>

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
    <title>登录</title>
</head>
<body>
    <fieldset>
        <legend>请登录</legend>
        <from:form commandName="account" action="doLogin" method="post">
            <table>
                <tr>
                    <td>帐号：</td>
                    <td><from:input id="name" path="userName" /></td>
                </tr>
                <tr>
                    <td>密码：</td>
                    <td><from:password id="password" path="pwd" /> </td>
                </tr>
                <tr>
                    <td><input type="reset" value="重置" /> </td>
                    <td><input type="submit" value="登录" /> </td>
                </tr>
            </table>
        </from:form>
    </fieldset>
</body>
</html>

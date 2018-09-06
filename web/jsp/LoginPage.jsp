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
        <from:form commandName="login" action="login" method="post">
            <table>
                <tr>
                    <td>帐号：</td>
                    <td><from:input id="name" path="username" /></td>
                </tr>
                <tr>
                    <td>密码：</td>
                    <td><from:password id="password" path="password" /> </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><a href="<c:url value="/SignUpPage"/>">注册</a></td>
                </tr>
                <tr>
                    <td><input type="reset" value="reset" /> </td>
                    <td><input type="submit" value="submit" /> </td>
                </tr>
            </table>
        </from:form>
    </fieldset>
</body>
</html>

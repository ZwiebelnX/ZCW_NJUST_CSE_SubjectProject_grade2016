<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Zwiebeln_Chan
  Date: 2018/9/6
  Time: 21:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
</head>
<body>
    <fieldset>
        <legend>注册</legend>
        <form:form commandName="SignUpInfo" action="SignUp" method="post">
            <table>
                <tr>
                    <td>用户名*</td>
                    <td><form:input path="username" /></td>
                </tr>
                <tr>
                    <td>昵称*</td>
                    <td><form:input path="nickname" /></td>

                </tr>
                <tr>
                    <td>密码*</td>
                    <td><form:password path="password" /></td>
                </tr>
                <tr>
                    <td>确认密码*</td>
                    <td><input type="password" /> </td>
                </tr>
                <tr>
                    <td>邮箱*</td>
                    <td><form:input path="email" /></td>
                </tr>
                <tr>
                    <td>身份证名称</td>
                    <td><form:input path="IDname" /></td>
                </tr>
                <tr>
                    <td>身份证号</td>
                    <td><form:input path="IDnumber" /></td>
                </tr>
                <tr>
                    <td>手机号</td>
                    <td><form:input path="phoneNumber" /> </td>
                </tr>
                <tr>
                    <td>QQ</td>
                    <td><form:input path="QQ" /></td>
                </tr>
                <tr>
                    <td><input type="reset"></td>
                    <td><input type="submit"></td>
                </tr>
            </table>
        </form:form>
    </fieldset>
</body>
</html>

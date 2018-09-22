<%--
  Created by IntelliJ IDEA.
  User: Zwiebeln_Chan
  Date: 2018/9/7
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="e" %>
<html>
<head>
    <title>用户列表</title>
    <!-- TODO 网页优化 -->
</head>
<body>
<div id="global">
    <h1>用户详细信息:</h1>
    <fieldset>
        <table>
            <tr>
                <td>ID号:</td><td>${account.userId}</td>
            </tr>
            <tr>
                <td>用户名:</td><td>${account.userName}</td>
            </tr>
            <tr>
                <td>昵称:</td><td>${account.normalName}</td>
            </tr>
            <tr>
                <td>权限等级:</td><td>${authority}</td>
            </tr>
            <tr>
                <td>身份证号:</td><td>${account.identityCard}</td>
            </tr>
            <tr>
                <td>身份证姓名:</td><td>${account.idName}</td>
            </tr>
            <tr>
                <td>地址:</td><td>${account.address}</td>
            </tr>
            <tr>
                <td>QQ:</td><td>${account.qq}</td>
            </tr>
            <tr>
                <td>电话:</td><td>${account.tel}</td>
            </tr>

        </table>
    </fieldset>
</div>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Zwiebeln_Chan
  Date: 2018/9/7
  Time: 22:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="e" %>
<html>
<head>
    <title>应用详细信息</title>
</head>
<body>
<h1>应用详细信息</h1>
<fieldset>
    <table>
        <tr>
            <td>应用名称:</td>
            <td>${app.name}</td>
        </tr>
        <tr>
            <td>开发商:</td>
            <td><a href="getappbypublisher/${app.publisherId}">${publishername}</a></td>
        </tr>
        <tr>
            <td>分类:</td>
            <td>${app.type}</td>
        </tr>
        <tr>
            <td>简介:</td>
            <td>${app.introduction}</td>
        </tr>
        <tr>
            <td>版本号:</td>
            <td>${app.version}</td>
        </tr>
        <tr>
            <td>限制年龄:</td>
            <td>${app.limitAge}</td>
        </tr>
        <tr>
            <td>语言:</td>
            <td>${app.language}</td>
        </tr>
        <tr>
            <td>兼容性:</td>
            <td>${app.compatibility}</td>
        </tr>
        <tr>
            <td>最低版本:</td>
            <td>${app.requireVersion}</td>
        </tr>
        <tr>
            <td>浏览总数:</td>
            <td>${app.visitCnt}</td>
        </tr>
        <tr>
            <td>下载链接:</td>
            <td><a href="${app.downloadUrl}">点此下载</a></td>
        </tr>
    </table>
</fieldset>
</body>
</html>

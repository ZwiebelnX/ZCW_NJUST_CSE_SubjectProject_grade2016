<%--
  Created by IntelliJ IDEA.
  User: 10447
  Date: 2018/9/12
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="e" %>
<html>
<head>
    <title>审核应用列表</title>
</head>
<body>
<h1>应用审核列表</h1>
    <fieldset>
        <table>
            <tr>
                <th>序号</th>
                <th>名称</th>
                <th>详情</th>
                <th>操作</th>
            </tr>
            <e:forEach items="${list}" var="list">
                <tr>
                    <td>${list.id}</td>
                    <td>${list.name}</td>
                    <td><a href="/appinformation/${list.id}">查看详情</a></td>
                    <td><a href="/appac/${list.id}">通过</a><a href="/appwa/${list.id}">拒绝</a></td>
                </tr>
            </e:forEach>
        </table>
    </fieldset>
</body>
</html>

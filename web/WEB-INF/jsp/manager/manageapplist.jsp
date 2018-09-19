<%--
  Created by IntelliJ IDEA.
  User: 10447
  Date: 2018/9/12
  Time: 22:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="e" %>
<html>
<head>
    <title>应用列表</title>
</head>
<body>
<h1>应用管理列表</h1>
<fieldset>
    <table>
        <tr>
            <th>序号</th>
            <th>名称</th>
            <th>详情</th>
            <th>操作</th>
        </tr>
        <e:forEach items="${applist}" var="appList">
            <tr>
                <td>${appList.id}</td>
                <td>${appList.name}</td>
                <td><a href="<%=request.getContextPath()%>/appinformation/${appList.id}.manager">查看详情</a></td>
                <td><a href="<%=request.getContextPath()%>/appedit/${appList.id}.manager">重新编辑</a><a href="appdelete/${appList.id}.manager">删除</a></td>
            </tr>
        </e:forEach>
    </table>
</fieldset>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Zwiebeln_Chan
  Date: 2018/9/7
  Time: 22:07
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
<fieldset>
    <table>
        <tr>
            <th>名称</th>
            <th>图像</th>
            <th>发行商</th>
            <th>类型</th>
            <th>详情</th>
            <th>下载</th>
        </tr>
        <e:forEach items="${applist}" var="appList">
            <tr>
                <td>${appList.name}</td>
                <td><img src="${appList.img}" width="100" height="100"/></td>
                <td>${appList.publisherName}</td>
                <td>${appList.type}</td>
                <td><a href="<%=request.getContextPath()%>/appinformation/${appList.id}.manager">查看详情</a></td>
                <td><a href="${appList.downloadUrl}">点击下载</a></td>
            </tr>
        </e:forEach>
    </table>
</fieldset>
</body>
</html>

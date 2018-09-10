<%@ page import="com.NJUST.ZCW.Entities.AccountEntity" %><%--
  Created by IntelliJ IDEA.
  User: Zwiebeln_Chan
  Date: 2018/9/7
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>权限申请</title>
</head>
<body>
<%
    AccountEntity ac=(AccountEntity) session.getAttribute("user");
    String s=ac.getAuthority();
    String s2=ac.getIsManager();
    if(s2!=null) {
        if (s2.equals("N"))
            request.setAttribute("level", "普通用户");
        else if (s2.equals("K"))
            request.setAttribute("level", "用户开发商");
        else
            request.setAttribute("level", "管理员用户");
    }
    request.setAttribute("authority",s);
%>
<h1> 您当前的权限等级：${level}</h1>
<h2>权限对应表</h2>
<table border="1">
    <tr>
        <th>等级</th>
        <th>应用查询</th>
        <th>应用上传</th>
        <th>应用管理</th>
        <th>应用统计</th>
        <th>应用分析</th>
        <th>用户管理</th>
        <th>权限管理</th>
        <th>请求审核</th>
    </tr>
    <tr>
        <td>普通用户</td>
        <td>√</td>
        <td>×</td>
        <td>×</td>
        <td>√</td>
        <td>√</td>
        <td>×</td>
        <td>×</td>
        <td>×</td>
    </tr>
    <tr>
        <td>开发商用户</td>
        <td>√</td>
        <td>√</td>
        <td>√</td>
        <td>√</td>
        <td>√</td>
        <td>×</td>
        <td>×</td>
        <td>×</td>
    </tr>
    <tr>
        <td>管理员</td>
        <td>√</td>
        <td>√</td>
        <td>√</td>
        <td>√</td>
        <td>√</td>
        <td>√</td>
        <td>√</td>
        <td>√</td>
    </tr>
</table>
<%
    if(s2!=null) {
        if (s2.equals("N")){
            out.println("<a href=\"askforK.manager\">申请成为用户开发商</a>");
            out.println("<a href=\"askforC.manager\">申请成为管理员</a>");
        }
        else if (s2.equals("K"))
            out.println("<a href=\"askforC.manager\">申请成为管理员</a>");
    }
%>
</body>
</html>

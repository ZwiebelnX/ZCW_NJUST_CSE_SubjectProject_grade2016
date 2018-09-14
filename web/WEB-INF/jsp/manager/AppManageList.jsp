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
</head>
<body>
<div id="global">
    <h1>用户列表</h1>
    <h2>N:代表普通用户 K：代表开发商用户 C：代表管理员</h2>
    <fieldset>
        <table>
            <tr>
                <th>用户名</th>
                <th>权限等级</th>
                <th>详细信息</th>
                <th>操作</th>
                <th>&nbsp;</th>

            </tr>
            <e:forEach items="${Accountlist}" var="Accountlist">
                <tr>
                    <td>${Accountlist.userName}</td>
                    <td>${Accountlist.isManager}</td>
                    <td><button  onclick="
                            window.open('/accountinformation/${Accountlist.userId}.manager');
                            ">查看</button></td>
                    <td><button  onclick="
                            window.location.href=('/askforN/${Accountlist.userId}.manager');
                            ">更改成普通用户</button> &nbsp;
                        <button  onclick="
                                window.location.href=('/askforK/${Accountlist.userId}.manager');
                                ">更改成开发商用户</button>
                        <button  onclick="
                                window.location.href=('/askforC/${Accountlist.userId}.manager');
                                ">更改成管理员</button>
                        <button  onclick="
                                window.location.href=('/accountdelete/${Accountlist.userId}.manager');
                                ">删除用户</button>
                    </td>
                </tr>
            </e:forEach>
        </table></fieldset>
</div>
</body>
</html>

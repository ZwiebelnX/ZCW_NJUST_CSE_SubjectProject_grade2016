<%@ page import="com.NJUST.ZCW.Entities.AccountEntity" %><%--
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
    <title>Title</title>
</head>
<body>
<div id="global">
    <h1>申请列表</h1>
    <fieldset>
    <table>
        <tr>
            <th>申请者</th>
            <th>申请权限</th>
            <th>操作</th>
            <th>&nbsp;</th>

        </tr>
        <e:forEach items="${Querylist}" var="Querylist">
            <tr>
                <td>${Querylist.askerName}</td>
                <td>${Querylist.authorityrealname}</td>
                <td><button  onclick="
                        window.location.href=('<%=request.getContextPath()%>/authority_ac/${Querylist.id}.manager');
                        ">同意</button>&nbsp;
                    <button onclick="
                            window.location.href=('<%=request.getContextPath()%>/authority_wa/${Querylist.id}.manager');
                            ">拒绝</button></td>
            </tr>
        </e:forEach>
    </table></fieldset>
</div>
</body>

    <!--<script language="JavaScript">
        function myrefresh() {
            window.location.reload();
        }
        setTimeout('myrefresh()', 2000);
    </script>-->
</html>

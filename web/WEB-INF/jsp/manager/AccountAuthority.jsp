<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script type="text/javascript">
        if(${sessionScope.user == null}){
            alert("请先登录！");
            window.location.replace("<%=request.getContextPath()%>/index.login");
        }
    </script>
</head>
<body>
<%
    AccountEntity ac=(AccountEntity) session.getAttribute("user");
    String authorities =ac.getAuthority();
    String userType =ac.getIsManager();
    if(userType !=null) {
        switch (userType){
            case "N":
                userType = "普通用户";
                break;
            case "K":
                userType = "开发者";
                break;
            case "C":
                userType = "管理员";
                break;
            default: userType = "普通用户";
            break;
        }
        pageContext.setAttribute("userType", userType);
    }
    pageContext.setAttribute("authorities", authorities);
%>
    <h1> 您当前的权限等级：${userType}</h1>
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
    <c:choose>
        <c:when test="${pageScope.userType == '普通用户'}">
            <a href="<%=request.getContextPath()%>/askforK.manager">申请成为开发者</a>
            <a href="<%=request.getContextPath()%>/askforC.manager">申请成为管理员</a>
        </c:when>
        <c:when test="${pageScope.userType == '开发者'}">
            <a href="<%=request.getContextPath()%>/askforC.manager">申请成为管理员</a>
        </c:when>
        <c:when test="${pageScope.userType == '管理员'}">
            <p><<strong>您已拥有最高权限，无需申请！</strong></p>
        </c:when>
    </c:choose>
</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.NJUST.ZCW.Entities.AccountEntity" %>
<%--
  Created by IntelliJ IDEA.
  User: Zwiebeln_Chan
  Date: 2018/9/6
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <title>欢迎来到ZCW安卓软件管理系统</title>
  </head>
  <body>
  主页。 <br>
  <c:choose>
    <c:when  test="${sessionScope.nickname != null}">
      <p><strong>欢迎登录：${sessionScope.nickname}</strong></p>
      <%
        AccountEntity ac=(AccountEntity) session.getAttribute("user");
        String s=ac.getAuthority();
        String s2=ac.getIsManager();
        request.setAttribute("authority",s);
      %>
      <a href="<%=request.getContextPath()%>/logout.login">注销</a>
      <a href="<%=request.getContextPath()%>/accountmanage.manager">个人管理</a>
      <a href="<%=request.getContextPath()%>/app.search">应用查询</a>
      <a href="<%=request.getContextPath()%>/app.statistics">应用统计</a>
      <c:if test="${s2 != null && s2.equal('C')}">
        <a href="<%=request.getContextPath()%>/AuthorityManagee.manager">权限管理</a>
        <a href="<%=request.getContextPath()%>/Accountlist.manager">用户管理</a>
        <a href="<%=request.getContextPath()%>/AppCheck.manager">应用审核</a>
        <a href="<%=request.getContextPath()%>/AppManage.manager">应用管理</a>
      </c:if>
      <c:if test="${s2 != null && s2.equals('K')}">
        <a href="<%=request.getContextPath()%>/AppUpload.upload">应用上传</a>
        <a href="<%=request.getContextPath()%>/AppManage.manager">应用管理</a>
      </c:if>
    </c:when>
    <c:otherwise>
      <p><strong>您尚未登录。</strong></p>
      <a href="<%=request.getContextPath()%>/loginPage.login">登录 </a>
      <a href="<%=request.getContextPath()%>/signUpPage.login">注册</a>
    </c:otherwise>
  </c:choose>

  </body>
</html>

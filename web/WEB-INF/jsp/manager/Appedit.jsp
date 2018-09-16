<%@ page import="com.NJUST.ZCW.Entities.ApplicationEntity" %><%--
  Created by IntelliJ IDEA.
  User: 10447
  Date: 2018/9/12
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>编辑应用</title>
</head>
<body>
<%
    ApplicationEntity app=(ApplicationEntity)session.getAttribute("app");
    request.setAttribute("aname",app.getName());
    request.setAttribute("atype",app.getType());
    request.setAttribute("aintroduction",app.getIntroduction());
    request.setAttribute("acompatibility",app.getCompatibility());
    request.setAttribute("aversion",app.getVersion());
    request.setAttribute("arequireVersion",app.getRequireVersion());
    request.setAttribute("alanguage",app.getLanguage());
%>
<h1>编辑应用</h1>
<fieldset>
    <form action="/appreupload.upload"  method="post">
        <table>
            <tr>
                <td>应用名称:</td>
                <td><input type="text" name="appname" value="${aname}"/></td>
            </tr>
            <tr>
                <td>应用类型:</td>
                <td><input type="text" name="type" value="${atype}" /></td>
            </tr>
            <tr>
                <td>介绍:</td>
                <td><input type="text" name="introduction" value="${aintroduction}" /></td>
            </tr>
            <tr>
                <td>兼容性:</td>
                <td><input type="text" name="compability" value="${acompatibility}"/></td>
            </tr>
            <tr>
                <td>最低运行要求:</td>
                <td><input type="text" name="requireVersion" value="${arequireVersion}"/></td>
            </tr>
            <tr>
                <td>语言:</td>
                <td><input type="text" name="language" value="${alanguage}"/></td>
            </tr>
            <tr>
                <td><input type="submit" value="保存修改"></td>
            </tr>
        </table>
    </form>
</fieldset>
<a href="<%=request.getContextPath()%>/uploadico.upload">上传图标</a>&nbsp;
<a href="<%=request.getContextPath()%>/reuploadapp.upload">重新上传apk</a>
</body>
</html>

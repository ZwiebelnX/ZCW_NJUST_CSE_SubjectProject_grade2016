<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%--
  Created by IntelliJ IDEA.
  User: Zwiebeln_Chan
  Date: 2018/9/7
  Time: 22:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>应用上传</title>
</head>
<body>
<h2>应用上传</h2>
<fieldset>
<form action="douploadinfo.upload"  method="post">
    <table>
        <tr>
            <td>应用名称:</td>
            <td><input type="text" name="appname" /></td>
        </tr>
        <tr>
            <td>应用类型:</td>
            <td><input type="text" name="type" /></td>
        </tr>
        <tr rowspan="2">
            <td>介绍:</td>
            <td><input type="text" name="introduction" /></td>
        </tr>
        <tr>
            <td>适宜年龄:</td>
            <td><input type="text" name="limitAge" /></td>
        </tr>
        <tr>
            <td>兼容性:</td>
            <td><input type="text" name="compability" /></td>
        </tr>
        <tr>
            <td>版本号:</td>
            <td><input type="text" name="version"/></td>
        </tr>
        <tr>
            <td>最低运行要求:</td>
            <td><input type="text" name="requireVersion"/></td>
        </tr>
        <tr>
            <td>语言:</td>
            <td><input type="text" name="language"/></td>
        </tr>
        <tr>
            <td><input type="submit" value="提交"></td>
        </tr>
    </table>
</form>
</fieldset>
</body>
</html>

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
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    AccountEntity ac=(AccountEntity) session.getAttribute("user");
    out.println("您好"+ac.getUserName());
    request.setAttribute("nickname", ac.getNormalName());
    request.setAttribute("mail",ac.getMail());
    request.setAttribute("IDnumber",ac.getIdentityCard());
    request.setAttribute("IDname",ac.getIdName());
    request.setAttribute("qq",ac.getQq());
    request.setAttribute("address",ac.getAddress());
    request.setAttribute("age",ac.getAge());
    request.setAttribute("gender",ac.getGender());
    request.setAttribute("tel",ac.getTel());
    request.setAttribute("username",ac.getUserName());
%>
<fieldset>
    <legend>个人信息</legend>
    <from:form commandName="personal" action="personal.manager" method="post">
        <table>
            <tr>
                <td>昵称</td>
                <td><from:input id="nickname" path="nickname" value="${nickname}"/></td>
            </tr>
            <tr>
                <td>邮箱：</td>
                <td><from:input id="email" path="email" value="${mail}"/> </td>
            </tr>
            <tr>
                <td>身份证号：</td>
                <td><from:input id="IDnumber" path="IDnumber" value="${IDnumber}"/> </td>
            </tr>
            <tr>
            <td>身份证姓名：</td>
            <td><from:input id="IDname" path="IDname" value="${IDname}"/> </td>
            </tr>
            <tr>
                <td>电话：</td>
                <td><from:input id="phoneNumber" path="phoneNumber" value="${tel}"/> </td>
            </tr>
            <tr>
                <td>地址：</td>
                <td><from:input id="address" path="address" value="${address}"/> </td>
            </tr>
            <tr>
                <td>性别：</td>
                <td><from:input id="gender" path="gender" value="${gender}"/> </td>
            </tr>
            <tr>
                <td>QQ：</td>
                <td><from:input id="qq" path="QQ" value="${qq}"/> </td>
            </tr>
            <tr>
                <td><input type="submit" value="保存修改" /> </td>
            </tr>
        </table>
    </from:form>
</fieldset>
<fieldset>
    <legend>修改密码</legend>
    <form  action="pwdchg.manager" method="post">
    <table>
        <tr>
            <td>旧密码:</td>
            <td><input type="password" id="pwd"></td>
        </tr>
        <tr>
            <td>新密码:</td>
            <td><input type="password" id="repwd"></td>
        </tr>
        <tr>
            <td><input type="submit" value="提交" /> </td>
        </tr>
    </table></form>
</fieldset>
<a href="/accountauthority.manager" a>查看更改权限</a>
</body>
</html>

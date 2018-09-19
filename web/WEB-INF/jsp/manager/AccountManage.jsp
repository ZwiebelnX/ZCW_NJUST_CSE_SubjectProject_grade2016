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
    <title>个人设置</title>
    <script type="text/javascript">
        if(${sessionScope.user == null}){
            alert("请先登录！");
            window.location.replace("<%=request.getContextPath()%>/index.login");
        }
    </script>
</head>
<body>
<%
    if(session.getAttribute("user") != null){
        AccountEntity ac=(AccountEntity) session.getAttribute("user");
        out.println("您好"+ac.getUserName());
        pageContext.setAttribute("nickname", ac.getNormalName());
        pageContext.setAttribute("mail",ac.getMail());
        pageContext.setAttribute("IDnumber",ac.getIdentityCard());
        pageContext.setAttribute("IDname",ac.getIdName());
        pageContext.setAttribute("qq",ac.getQq());
        pageContext.setAttribute("address",ac.getAddress());
        pageContext.setAttribute("age",ac.getAge());
        pageContext.setAttribute("gender",ac.getGender());
        pageContext.setAttribute("tel",ac.getTel());
        pageContext.setAttribute("username",ac.getUserName());
    }
%>
<fieldset>
    <legend>个人信息</legend>
    <from:form commandName="personal" action="personal.manager" method="post">
        <table>
            <tr>
                <td>昵称</td>
                <td><from:input id="nickname" path="nickname" value="${pageScope.nickname}"/></td>
            </tr>
            <tr>
                <td>邮箱：</td>
                <td><from:input id="email" path="email" value="${pageScope.mail}"/> </td>
            </tr>
            <tr>
                <td>身份证号：</td>
                <td><from:input id="IDnumber" path="IDnumber" value="${pageScope.IDnumber}"/> </td>
            </tr>
            <tr>
            <td>身份证姓名：</td>
            <td><from:input id="IDname" path="IDname" value="${pageScope.IDname}"/> </td>
            </tr>
            <tr>
                <td>电话：</td>
                <td><from:input id="phoneNumber" path="phoneNumber" value="${pageScope.tel}"/> </td>
            </tr>
            <tr>
                <td>地址：</td>
                <td><from:input id="address" path="address" value="${pageScope.address}"/> </td>
            </tr>
            <tr>
                <td>性别：</td>
                <td><from:input id="gender" path="gender" value="${pageScope.gender}"/> </td>
            </tr>
            <tr>
                <td>QQ：</td>
                <td><from:input id="qq" path="QQ" value="${pageScope.qq}"/> </td>
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
<a href="<%=request.getContextPath()%>/accountauthority.manager">查看更改权限</a>
</body>
</html>

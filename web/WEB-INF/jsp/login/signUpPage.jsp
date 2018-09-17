<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Zwiebeln_Chan
  Date: 2018/9/6
  Time: 21:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<%=request.getContextPath()%>/css/sign2.css" rel="stylesheet" type="text/css">
    <title>注册</title>
</head>
<body>
<div id="canvas">
    <div id="header"><img src="<%=request.getContextPath()%>/imgs/1.jpg" width="809" height="111" alt="la"></div>
    <div id="content">
        <fieldset id="fil">
            <legend id="legen">注册</legend>
            <form:form commandName="AccountEntity" action="signUp.login" method="post" onsubmit="return finalcheck(this)">
                <table>
                    <tr>
                        <td width="123">用户名<span style="color: red;">*</span>：</td>
                        <td><form:input id="p0" path="userName" /></td>
                    </tr>
                    <tr>
                        <td>昵称<span style="color: red;">*</span>：</td>
                        <td><form:input id="p5" path="normalName" /></td>

                    </tr>
                    <tr>
                        <td>密码<span style="color: red;">*</span>：</td>
                        <td><form:password onkeyup="check1()" id="p1" path="pwd" /></td>
                        <td><div id=check_tip1></div> </td>
                    </tr>
                    <tr>
                        <td>确认密码<span style="color: red;">*</span>：</td>
                        <td><input  onkeyup="check2()" id="p2" type="password" /> </td>
                        <td><div id=check_tip2></div></td>
                    </tr>
                    <tr>
                        <td>邮箱<span style="color: red;">*</span>：</td>
                        <td><form:input id="p3" onkeyup="check3()" path="mail" /></td>
                        <td><div id=check_tip3></div></td>
                    </tr>
                    <tr>
                        <td>身份证名称：</td>
                        <td><form:input id="idname" path="idName" /></td>
                    </tr>
                    <tr>
                        <td>身份证号：</td>
                        <td><form:input id="idcard" path="identityCard" /></td>
                    </tr>
                    <tr>
                        <td>手机号：</td>
                        <td><form:input id="tel" path="tel" /> </td>
                    </tr>
                    <tr>
                        <td>QQ号：</td>
                        <td><form:input id="qq" path="qq" /></td>
                    </tr>
                    <tr>
                        <td>性别：</td>
                        <td style="text-align: left">
                            <input type="radio" name="gen" value="男"/>
                            <img src="<%=request.getContextPath()%>/imgs/Male.gif" alt="alt"/>男
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="gen" value="女"/>
                            <img src="<%=request.getContextPath()%>/imgs/Female.gif" alt="alt"/>女
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" text-align="center"><input value="重置" type="reset" class="buttom"/></td>
                    </tr>
                    <tr>
                        <td colspan="2" text-align="center"><input value="注册" type="submit" class="buttom"/></td>
                    </tr>
                </table>
            </form:form>
        </fieldset>
    </div>
    <div id="footer">
        <p>Copyright&nbsp;&copy;&nbsp;2018&nbsp;&#183;&nbsp;All Rights Reserved</p>
    </div>
</div>
</body>
<script type="text/javascript">
    function finalcheck(form){
        with (form)
        {
            if (p0.value.length<=0){
                p0.focus();
                alert("用户名不得为空");
                return false;
            }
            if (p5.value.length<=0){
                p5.focus();
                alert("昵称不得为空");
                return false;
            }
            if (p1.value.length<6||p1.value.length>17){
                p5.focus();
                alert("密码长度超出限制！");
                return false;
            }
            if (p1.value!=p2.value){
                p2.focus();
                alert("重复密码输入不一致！");
                return false;
            }
            var tmp=p3.value;
            var flag=1;
            for (var i = 0; i < tmp.length; i++) {
                if(tmp[i]=='@'){
                    flag=0;
                    break;
                }
            }
            if(flag){
                p3.focus();
                alert("邮箱输入不合法");
                return false;
            }
        }
    }
    function check2(){
        if(p2.value.length==0){
            check_tip2.innerHTML="<font color=red></font>";
            return;
        }
        if (p1.value!=p2.value)
        {
            check_tip2.innerHTML="<font color=red>两次输入的密码不相符</font>";
        }else{
            check_tip2.innerHTML="<font color=blue></font>";
        }
    }
    function check1(){
        var t=p1.value.length;
        if(t<=16&&t>=6){
            check_tip1.innerHTML="<font color=blue></font>";
        }else{
            check_tip1.innerHTML="<font color=red>密码非法</font>";
        }
    }
    function check3(){
        var tmp=p3.value;
        var flag=1;
        for (var i = 0; i < tmp.length; i++) {
            if(tmp[i]=='@'){
                flag=0;
                break;
            }
        }
        if(flag){
            check_tip3.innerHTML="<font color=red>请输入合规的邮箱！</font>";
        }else{
            check_tip3.innerHTML="<font color=blue></font>";
        }
    }
</script>
</html>

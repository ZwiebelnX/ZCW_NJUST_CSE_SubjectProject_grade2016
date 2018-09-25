<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
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

    <title>注册</title>
    <link href="<%=request.getContextPath()%>/css/ZCW/sign2.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/css/ZCW/global.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript">
        addEventListener("load", function() { setTimeout(hideURLbar, 0);
        }, false);
        function hideURLbar(){ window.scrollTo(0,1);
        }
    </script>
    <link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <script>
        $(function() {
            var pull 		= $('#pull');
            menu 		= $('nav ul');
            menuHeight	= menu.height();
            $(pull).on('click', function(e) {
                e.preventDefault();
                menu.slideToggle();
            });
            $(window).resize(function(){
                var w = $(window).width();
                if(w > 320 && menu.is(':hidden')) {
                    menu.removeAttr('style');
                }
            });
        });
    </script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/css/font-awesome.min.css">
</head>
<body>
<div class="header_bg" id="home"><!-- start header -->
    <div class="container">
        <div class="row header text-center specials">
            <div class="h_logo">
                <a href="<%=request.getContextPath()%>/toMainPage.login"><img src="<%=request.getContextPath()%>/imgs/logo.png" alt="" class="responsive"/></a>
            </div>
            <nav class="top-nav">
                <ul class="top-nav nav_list">
                    <li><a href="<%=request.getContextPath()%>/loginPage.login">登录</a></li>
                    <li class="logo page-scroll"><a title="返回欢迎页" href="<%=request.getContextPath()%>/index.login">
                        <img src="<%=request.getContextPath()%>/imgs/logo.png" alt="" class="responsive"/></a></li>
                    <li class="page-scroll"><a href="<%=request.getContextPath()%>/index.login">主页</a></li>
                </ul>
                <a href="#" id="pull"><img src="<%=request.getContextPath()%>/imgs/nav-icon.png" title="menu" /></a>
            </nav>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<div class="slider_bg" id="mainContainer"><!-- start slider -->
    <div class="container">
        <div id="word">
            <h1>SIGNUP</h1>
            <div id="form">
            <form:form commandName="AccountEntity" action="signUp.login" method="post" onsubmit="return finalcheck(this)">
                <table>
                    <tr>
                        <td style="color: aliceblue;">性 别：</td>
                        <td style="text-align: left; color: aliceblue;">
                            &nbsp;&nbsp;<form:radiobutton path="gender" name="gen" value="M"/>
                            <img src="<%=request.getContextPath()%>/imgs/Male.gif" alt="alt"/>男
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <form:radiobutton path="gender" name="gen" value="F"/>
                            <img src="<%=request.getContextPath()%>/imgs/Female.gif" alt="alt"/>女
                        </td>
                        <td width="250">&nbsp;</td>
                        <td width="100" style="color: aliceblue;">用户名 <span style="color: red;">*</span> ：</td>
                        <td width="235" style="text-align: left"><form:input id="p0" path="userName" /></td>


                    </tr>
                    <tr>
                        <td style="color: aliceblue;" >QQ号：</td>
                        <td><form:input id="qq" path="qq" /></td>
                        <td>&nbsp;</td>
                        <td style="color: aliceblue;">昵 称 <span style="color: red;">*</span> ：</td>
                        <td style="text-align: left"><form:input id="p5" path="normalName" /></td>

                    </tr>
                    <tr>
                        <td style="color: aliceblue;">手机号：</td>
                        <td><form:input id="tel" path="tel" /> </td>
                        <td>&nbsp;</td>
                        <td style="color: aliceblue;">邮 箱 <span style="color: red;">*</span> ：</td>
                        <td style="text-align: left"><form:input id="p3" onkeyup="check3()" path="mail" /></td>
                        <td style="text-align: left"><div id=check_tip3></div></td>
                    </tr>
                    <tr>
                        <td style="color: aliceblue;">身份证号：</td>
                        <td><form:input id="idcard" path="identityCard" /></td>
                        <td>&nbsp;</td>
                        <td style="color: aliceblue;">密 码 <span style="color: red;">*</span> ：</td>
                        <td style="text-align: left"><form:password onkeyup="check1()" id="p1" path="pwd" /></td>
                        <td style="text-align: left"><div id=check_tip1></div> </td>

                    </tr>
                    <tr>
                        <td width="123" style="color: aliceblue;">身份证姓名：</td>
                        <td><form:input id="idname" path="idName" /></td>
                        <td>&nbsp;</td>
                        <td style="color: aliceblue;">确认密码 <span style="color: red;">*</span> ：</td>
                        <td style="text-align: left"><input  onkeyup="check2()" id="p2" type="password" /> </td>
                        <td style="text-align: left"><div id=check_tip2></div></td>
                    <tr><td colspan="5"  style="height: 30px;">&nbsp;</td> </tr>
                    <tr>
                        <td colspan="5" style="text-align: center;"><input value="重置" type="reset" class="buttom"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input value="注册" type="submit" class="buttom"/>
                        </td>
                    </tr>

                </table>
            </form:form>
            </div>
        </div>
    </div>
</div>
    <div class="footer1_bg">
        <div class="container">
            <div class="row  footer">
                <div class="copy text-center">
                    <p class="link"><span>Copyright &copy; 2018.CZW All rights reserved.</span></p>
                    <a href="#home" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"> </span></a>
                </div>
            </div>
            <script type="text/javascript">
                $(function() {
                    $('a[href*=#]:not([href=#])').click(function() {
                        if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {

                            var target = $(this.hash);
                            target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
                            if (target.length) {
                                $('html,body').animate({
                                    scrollTop: target.offset().top
                                }, 1000);
                                return false;
                            }
                        }
                    });
                });
            </script>
        </div>
    </div>
    <br>
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

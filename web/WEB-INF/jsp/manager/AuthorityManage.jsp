<%@ page import="com.NJUST.ZCW.Entities.AccountEntity" %>
<%@ page import="java.util.List" %><%--
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
    <title>权限管理</title>
    <link href="<%=request.getContextPath()%>/css/ZCW/applyauthority.css" rel="stylesheet" type="text/css">
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

        //登录检查
        if(${sessionScope.user == null}){
            alert("请先登录！");
            window.location.replace("<%=request.getContextPath()%>/index.login");
        }

        //权限检查
        if(${!sessionScope.userType == "C"}){
            alert("对不起，您没有权限进行操作！");
            window.location.replace("<%=request.getContextPath()%>/toMainPage.login");
        }
    </script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/css/font-awesome.min.css">
</head>
<body>
<div class="header_bg" id="home" style="min-width: 1000px;"><!-- start header -->
    <div class="container">
        <div class="row header text-center specials">
            <div class="h_logo">
                <a href="<%=request.getContextPath()%>/toMainPage.login"><img src="<%=request.getContextPath()%>/imgs/logo.png" alt="" class="responsive"/></a>
            </div>
            <nav class="top-nav">
                <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ZCW/nav.css" />
                <ul class="top-nav nav_list">
                    <e:choose>
                        <e:when test="${sessionScope.userType == 'C'}">
                            <li>
                                <div class="index-nav-frame-line active" tabindex="-1">
                                    管理
                                    <div class="index-nav-frame-line-center">
                                        <div class="index-nav-frame-line-li">
                                            <a href="<%=request.getContextPath()%>/AuthorityManagee.manager">权限管理</a>
                                        </div>
                                        <div class="index-nav-frame-line-li">
                                            <a href="<%=request.getContextPath()%>/Accountlist.manager">用户管理</a>
                                        </div>
                                        <div class="index-nav-frame-line-li">
                                            <a href="<%=request.getContextPath()%>/AppCheck.manager">应用审核</a>
                                        </div>
                                        <div class="index-nav-frame-line-li">
                                            <a href="<%=request.getContextPath()%>/AppManage.manager">应用管理</a>
                                        </div>
                                    </div>
                                    <div class="index-nav-frame-line-focus" tabindex="-1"></div>
                                </div>
                            </li>
                        </e:when>
                        <e:when test="${sessionScope.userType == 'K'}">
                            <li>
                                <div class="index-nav-frame-line active" tabindex="-1">
                                    管理
                                    <div class="index-nav-frame-line-center">
                                        <div class="index-nav-frame-line-li">
                                            <a href="<%=request.getContextPath()%>/AppUpload.upload">应用上传</a>
                                        </div>
                                        <div class="index-nav-frame-line-li">
                                            <a href="<%=request.getContextPath()%>/AppManage.manager">应用管理</a>
                                        </div>
                                    </div>
                                    <div class="index-nav-frame-line-focus" tabindex="-1"></div>
                                </div>
                            </li>
                        </e:when>
                        <e:otherwise>
                            <li></li>
                        </e:otherwise>
                    </e:choose>
                    <li>
                        <div class="index-nav-frame-line active" tabindex="-1">
                            查询
                            <div class="index-nav-frame-line-center">
                                <div class="index-nav-frame-line-li">
                                    <a href="<%=request.getContextPath()%>/app.search">应用查询</a>
                                </div>
                                <div class="index-nav-frame-line-li">
                                    <a href="<%=request.getContextPath()%>/app.statistics">应用统计</a>
                                </div>
                            </div>
                            <div class="index-nav-frame-line-focus" tabindex="-1"></div>
                        </div>
                    </li>
                    <li class="logo page-scroll"><a title="回到主页" href="<%=request.getContextPath()%>/toMainPage.login">
                        <img src="<%=request.getContextPath()%>/imgs/logo.png" alt="" class="responsive"/></a></li>
                    <li><a href="<%=request.getContextPath()%>/toMainPage.login">返回主页</a></li>
                    <li class="page-scroll"><a href="<%=request.getContextPath()%>/aboutus.login">关于我们</a></li>
                </ul>
                <a href="#" id="pull"><img src="<%=request.getContextPath()%>/imgs/nav-icon.png" title="menu" /></a>
                <div class="welcomeText">
                    <strong>
                        欢迎使用：${sessionScope.userNickname}&nbsp;&nbsp;
                        <a href="<%=request.getContextPath()%>/logout.login">注销</a>
                    </strong>
                    <br />
                    <strong>
                        <e:choose>
                            <e:when test="${sessionScope.userType == 'C'}">
                                ——————管理员——————
                            </e:when>
                            <e:when test="${sessionScope.userType == 'K'}">
                                ——————开发者——————
                            </e:when>
                            <e:when test="${sessionScope.userType == 'N'}">
                                ——————普通用户——————
                            </e:when>
                        </e:choose>
                    </strong>
                </div>
            </nav>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<div class="slider_bg" id="mainContainer"><!-- start slider -->
    <div class="container">
        <div class="welcomeDiv1"><h2 >申请权限列表</h2></div>
    <div id="form">
    <table width="600px;" id="theTable">
        <%


            List Querylist = (List) request.getAttribute("Querylist");
            if(Querylist != null){
                int appsPerPage = 5;
                int totalPages = Querylist.size() % appsPerPage == 0 ? Querylist.size() / appsPerPage : Querylist.size() / appsPerPage + 1;
                pageContext.setAttribute("Querylist", Querylist);
                pageContext.setAttribute("curPage", 1);
                pageContext.setAttribute("totalPages", totalPages);
                pageContext.setAttribute("totalQueries", Querylist.size());
            }

        %>
        <tr>
            <td style="font-size: 22px;">申请者</td>
            <td style="font-size: 22px;">申请权限</td>
            <td style="font-size: 22px;">操作</td>

        </tr>
        <e:forEach items="${Querylist}" var="Querylist">
            <tr>
                <td>${Querylist.askerName}</td>
                <td>${Querylist.authorityrealname}</td>
                <td><button class="buttom" onclick="
                        window.location.href=('<%=request.getContextPath()%>/authority_ac/${Querylist.id}.manager');
                        ">同意</button>&nbsp;
                    <script type="text/javascript">
                        function refuse() {
                            if(window.confirm("您确定要拒绝该申请吗？"))
                            {
                                window.location.href=('<%=request.getContextPath()%>/authority_wa/${Querylist.id}.manager');
                            }else{
                                return false;
                            }
                        }
                    </script>
                    <button class="buttom" onclick="refuse() ">拒绝</button></td>
            </tr>
        </e:forEach>
    </table>
        <div class="pageDiv">
            <div class="gridItem" style="padding: 5px; width: 250px; float: left; text-align: center; height: 20px; font-size: 15px;" >
                共<span id="spanTotalInfor">${totalQueries}</span> 条记录&nbsp; &nbsp;
                当前第<span id="spanPageNum">${curPage}</span>页
                &nbsp; &nbsp; &nbsp; 共<span id="spanTotalPage">${totalPages}</span>页
            </div>
            <div class="gridItem" style="margin-left:25px;  padding: 5px; width: 400px; float: left; text-align: center; height: 20px; vertical-align: middle; font-size: 15px;">
                <span id="spanFirst" >首页</span> &nbsp;
                <span id="spanPre">上一页</span>&nbsp;
                <span id="spanInput" style="margin: 0; padding: 0 0 4px 0; height:100%; ">
                第<input id="Text1" type="text" class="TextBox" onkeyup="changepage()"   style="height:20px; text-align: center;width:50px;color: black;" />页
            </span>&nbsp;
                <span id="spanNext">下一页</span> &nbsp;
                <span  id="spanLast">尾页</span>
            </div>
        </div>
        <script type="text/javascript">
            var theTable = document.getElementById("theTable");
            var txtValue = document.getElementById("Text1").value;
            function changepage() {
                var txtValue2 = document.getElementById("Text1").value;
                if (txtValue != txtValue2) {
                    if (txtValue2 > pageCount()) {

                    }
                    else if (txtValue2 <= 0) {

                    }
                    else if (txtValue2 == 1) {
                        first();
                    }
                    else if (txtValue2 == pageCount()) {
                        last();
                    }
                    else {
                        hideTable();
                        page = txtValue2;
                        pageNum2.value = page;

                        currentRow = pageSize * page;
                        maxRow = currentRow - pageSize;
                        if (currentRow > numberRowsInTable) currentRow = numberRowsInTable;
                        for (var i = maxRow; i < currentRow; i++) {
                            theTable.rows[i].style.display = '';
                        }
                        if (maxRow == 0) { preText(); firstText(); }
                        showPage();
                        nextLink();
                        lastLink();
                        preLink();
                        firstLink();
                    }

                    txtValue = txtValue2;
                }
            }

        </script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/pagging.js"></script>
</div>
    </div>
</div>
<div class="footer_bg" id="contact">
    <div class="container"> </div>
</div>
<div class="footer1_bg">
    <div class="container">
        <div class="row  footer">
            <div class="copy text-center">
                <p class="link"><span>Copyright &copy; 2018.Company name All rights reserved.</span></p>
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

            function finalCheck() {
                var name = $("#name").val();
                var password = $("#password").val();
                if(name === "" || name == null){
                    alert("请输入用户名！");
                    return false;
                }
                if(password === "" || password == null){
                    alert("请输入密码！");
                    return false;
                }
                return true;
            }
        </script>
    </div>
</div>
</body>
</html>

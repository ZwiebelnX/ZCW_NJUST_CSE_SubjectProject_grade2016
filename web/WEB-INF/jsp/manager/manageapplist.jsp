<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 10447
  Date: 2018/9/12
  Time: 22:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="e" %>
<html>
<head>
    <title>应用管理列表</title>
    <link href="<%=request.getContextPath()%>/css/ZCW/applyauthority.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript">
        addEventListener("load", function() { setTimeout(hideURLbar, 0);
        }, false);
        function hideURLbar(){ window.scrollTo(0,1);
        }

        if(${sessionScope.user == null}){
            alert("请先登录！");
            window.location.replace("<%=request.getContextPath()%>/index.login");
        }
        if(${sessionScope.userType == "N"}){
            alert("对不起，您没有权限进行操作！");
            window.location.replace("<%=request.getContextPath()%>/toMainPage.login");
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/css/font-awesome.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ZCW/manageAppList.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ZCW/global.css" />
</head>
<body>
<div class="header_bg" id="home" style="min-width: 1000px;"><!-- start header -->
    <div class="container">
        <div class="row header text-center specials">
            <div class="h_logo">
                <a href="<%=request.getContextPath()%>/toMainPage.login"><img src="<%=request.getContextPath()%>/imgs/logo.png" alt="" class="responsive"/></a>
            </div>
            <nav class="top-nav">
                <ul class="top-nav nav_list">
                    <li><a href="<%=request.getContextPath()%>/toMainPage.login">back to main</a></li>
                    <li class="logo page-scroll"><a title="回到主页" href="<%=request.getContextPath()%>/toMainPage.login">
                        <img src="<%=request.getContextPath()%>/imgs/logo.png" alt="" class="responsive"/></a></li>
                    <li class="page-scroll"><a href="#">about us</a></li>
                </ul>
                <a href="#" id="pull"><img src="<%=request.getContextPath()%>/imgs/nav-icon.png" title="menu" /></a>
            </nav>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<div class="slider_bg" id="mainContainer"><!-- start slider -->
    <div class="container">
        <div class="welcomeDiv1"><h2 >应用管理列表</h2></div>
        <div id="form">
            <%


                List appList = (List) request.getAttribute("appList");
                if(appList != null){
                    int appsPerPage = 8;
                    int totalPages = appList.size() % appsPerPage == 0 ? appList.size() / appsPerPage : appList.size() / appsPerPage + 1;
                    pageContext.setAttribute("appList", appList);
                    pageContext.setAttribute("curPage", 1);
                    pageContext.setAttribute("totalPages", totalPages);
                    pageContext.setAttribute("totalApps", appList.size());
                }

            %>
                <table id="theTable">
                    <tr>
                        <td style="font-size: 22px;">序号</td>
                        <td style="font-size: 22px;">名称</td>
                        <td style="font-size: 22px;">详情</td>
                        <td style="font-size: 22px;">操作</td>
                    </tr>
                    <e:forEach items="${appList}" var="appList">
                        <tr>
                            <td>${appList.id}</td>
                            <td>${appList.name}</td>
                            <td><a href="#" onclick="window.open('<%=request.getContextPath()%>/appinformation/${appList.id}.manager', '应用详情',
                                    'height=700, width=600, toolbar =no, menubar=no, scrollbars=no, resizable=no, location=no, status=no')">查看详情</a></td>

                            <td><button class="buttom" onclick="
                                    window.location.href=('<%=request.getContextPath()%>/appedit/${appList.id}.manager');
                                    ">更新</button>&nbsp;
                                <script type="text/javascript">
                                    function deleteapp() {
                                        if(window.confirm("您确定要下架该应用吗？"))
                                        {
                                            window.location.href=('<%=request.getContextPath()%>/AppManage.manager');
                                        }else{
                                            return false;
                                        }
                                    }
                                </script>
                                <button class="buttom" onclick="deleteapp()">下架</button></td>
                        </tr>
                    </e:forEach>
                </table>
            </div>
        <div class="pageDiv" style="top: 550px;">
            <div class="gridItem" style="padding: 5px; width: 250px; float: left; text-align: center; height: 20px; font-size: 15px;" >
                共<span id="spanTotalInfor">${totalApps}</span> 条记录&nbsp; &nbsp;
                当前第<span id="spanPageNum">${curPage}</span>页
                &nbsp; &nbsp; &nbsp; 共<span id="spanTotalPage">${totalPages}</span>页
            </div>
            <div class="gridItem" style="margin-left:25px;  padding: 5px; width: 400px; float: left; text-align: center; height: 20px; vertical-align: middle; font-size: 15px;">
                <span id="spanFirst" >首页</span> &nbsp;
                <span id="spanPre">上一页</span>&nbsp;
                <span id="spanInput" style="margin: 0; padding: 0 0 4px 0; height:100%; ">
                第<input id="Text1" type="text" class="TextBox" onkeyup="changepage()"   style="height:20px; text-align: center;width:50px" />页
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
        <div class="clearfix"></div >
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
        </script>
    </div>
</div>

</body>
</html>

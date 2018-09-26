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
    <title>用户列表</title>
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript">
        addEventListener("load", function() { setTimeout(hideURLbar, 0);
        }, false);
        function hideURLbar(){ window.scrollTo(0,1);
        }

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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ZCW/appManageList.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ZCW/global.css" />
</head>
<body>
<div class="header_bg" id="home" style="min-width: 1000px;"><!-- start header -->
    <div class="container">
        <div class="row header text-center specials">
            <div class="searchBox">
                <link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
                <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ZCW/searchbox.css" />
                <form method="post" action="<%=request.getContextPath()%>/getappbykeyword.search">
                    <input type="text" name="keyword" placeholder="请输入您要搜索的内容...">
                    <button type="submit"></button>
                </form>
            </div>
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
                                    开发
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
                    <li><a href="<%=request.getContextPath()%>/accountmanage.manager">个人中心</a></li>
                    <li></li>
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
    <div class="slider_bg" style="min-height: 650px; width:100%;">
        <div class="container" id="mainContainer">
            <div id="global">
                <div class="titleText">
                    <h2>用户列表</h2>
                </div>
                    <div class="accountListDiv">
                    <%
                        List accountList = (List) request.getAttribute("accountList");
                        if(accountList != null){
                            int accountsPerPage = 5;
                            int totalPages = accountList.size() % accountsPerPage == 0 ? accountList.size() / accountsPerPage : accountList.size() / accountsPerPage + 1;
                            pageContext.setAttribute("accountList", accountList);
                            pageContext.setAttribute("curPage", 1);
                            pageContext.setAttribute("totalPages", totalPages);
                            pageContext.setAttribute("totalAccounts", accountList.size());
                        }

                    %>
                        <table id="theTable">
                            <tr>
                                <th style="font-size: 22px;">用户名</th>
                                <th style="font-size: 22px;">权限等级</th>
                                <th style="font-size: 22px;">详情</th>
                                <th colspan="4" style="font-size: 22px;">操作</th>
                            </tr>
                            <e:forEach items="${pageScope.accountList}" var="Accountlist">
                                <tr>
                                    <td style="width: 120px">${Accountlist.userName}</td>
                                    <td>
                                        <e:choose>
                                            <e:when test="${Accountlist.isManager == 'C'}">
                                                管理员
                                            </e:when>
                                            <e:when test="${Accountlist.isManager == 'K'}">
                                                开发者
                                            </e:when>
                                            <e:when test="${Accountlist.isManager == 'N'}">
                                                一般用户
                                            </e:when>
                                        </e:choose>
                                    </td>
                                    <td><a href="#" onclick="
                                            window.open('<%=request.getContextPath()%>/accountinformation/${Accountlist.userId}.manager','用户详情',
                                            'height=700, width=600, toolbar =no, menubar=no, scrollbars=no, resizable=no, location=no, status=no')">
                                            查看</a></td>
                                    <td><button class="button" style="width: 130px" onclick="
                                            window.location.href=('<%=request.getContextPath()%>/askforN/${Accountlist.userId}.manager');
                                            ">更改成普通用户</button>
                                    </td>
                                    <td><button class="button" style="width: 130px" onclick="
                                            window.location.href=('<%=request.getContextPath()%>/askforK/${Accountlist.userId}.manager');
                                            ">更改成开发商用户</button>
                                    </td>
                                    <td>
                                        <button class="button" style="width: 130px" onclick="
                                                window.location.href=('<%=request.getContextPath()%>/askforC/${Accountlist.userId}.manager');
                                                ">更改成管理员</button>
                                    </td>

                                    <td>
                                        <button class="button" style="width: 130px" onclick="
                                                window.location.href=('<%=request.getContextPath()%>/accountdelete/${Accountlist.userId}.manager');
                                                ">删除用户</button>
                                    </td>
                                </tr>
                            </e:forEach>
                        </table>
                    </div>
                <div style="text-align: center;padding-top: 70px;">
                    <h4 style="color:#629392;">* N:代表普通用户&nbsp;K:代表开发商用户&nbsp;C:代表管理员</h4>
                </div>
                <div class="pageDiv">
                    <div class="gridItem" style="padding: 5px; width: 300px; float: left; text-align: center; height: 20px; font-size: 15px;" >
                        共 <span id="spanTotalInfor">${totalAccounts}</span> 条记录&nbsp; &nbsp;
                        当前第 <span id="spanPageNum">${curPage}</span> 页
                        &nbsp; &nbsp; &nbsp; 共 <span id="spanTotalPage">${totalPages}</span> 页
                    </div>
                    <div class="gridItem" style="margin-left:25px;  padding: 5px; width: 400px; float: left; text-align: center; height: 20px; vertical-align: middle; font-size: 15px;">
                        <span id="spanFirst" >首页</span> &nbsp;
                        <span id="spanPre">上一页</span>&nbsp;
                        <span id="spanInput" style="margin: 0; padding: 0 0 4px 0; height:100%; ">
                第<input id="Text1" type="text" class="TextBox" onkeyup="changepage()"   style="height:20px; text-align: center;width:50px; color: black;" />页
            </span>&nbsp;
                        <span id="spanNext">下一页</span> &nbsp;
                        <span  id="spanLast">尾页</span>
                    </div>
                </div>
                <script type="text/javascript" src="<%=request.getContextPath()%>/js/pagging.js"></script>
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
            </div>
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
</body>
</html>

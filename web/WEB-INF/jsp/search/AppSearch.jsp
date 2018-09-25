<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Zwiebeln_Chan
  Date: 2018/9/7
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>应用查询</title>
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/css/font-awesome.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ZCW/appSearch.css" />
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
                    <c:choose>
                        <c:when test="${sessionScope.userType == 'C'}">
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
                        </c:when>
                        <c:when test="${sessionScope.userType == 'K'}">
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
                        </c:when>
                        <c:otherwise>
                            <li></li>
                        </c:otherwise>
                    </c:choose>
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
                        <c:choose>
                            <c:when test="${sessionScope.userType == 'C'}">
                                ——————管理员——————
                            </c:when>
                            <c:when test="${sessionScope.userType == 'K'}">
                                ——————开发者——————
                            </c:when>
                            <c:when test="${sessionScope.userType == 'N'}">
                                ——————普通用户——————
                            </c:when>
                        </c:choose>
                    </strong>
                </div>
            </nav>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<div class="slider_bg" style="min-height: 650px; width:100%;">
    <div class="container" id="mainContainer">
        <div class="appSearchInputDiv">
            <h3>应用查询</h3>
            <hr style="padding: 0;margin-top: 0; margin-bottom:5px;" />
                <form method="post" action="<%=request.getContextPath()%>/getapp.search">
                    <table>
                        <tr>
                            <td><p>关键字:</p></td>
                            <td><input type="text" name="keyword"></td>
                        </tr>
                        <tr>
                            <td><p>发布商:</p></td>
                            <td><input type="text" name="publisher"></td>
                        </tr>
                        <tr>
                            <td><p>发布商:</p></td>
                            <td>
                                <select name="tp">
                                    <option value="全部">全部</option>
                                    <option value="游戏">游戏</option>
                                    <option value="视频">视频</option>
                                    <option value="聊天">聊天</option>
                                    <option value="浏览器">浏览器</option>
                                    <option value="网购金融">网购金融</option>
                                    <option value="生活">生活</option>
                                    <option value="新闻">新闻</option>
                                    <option value="摄影">摄影</option>
                                    <option value="美食">美食</option>
                                    <option value="音乐">音乐</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><input class="button" type="submit" value="搜索"></td>
                        </tr>
                    </table>
                </form>
        </div>
        <div class="appKindSearchInput">
            <h3>分类浏览</h3>
            <hr style="padding: 0;margin-top: 0;margin-bottom:5px;" />
            <table>
                <tr>
                    <td><a href="<%=request.getContextPath()%>/getappbytp/游戏.search">游戏</a> </td>
                    <td><a href="<%=request.getContextPath()%>/getappbytp/视频.search">视频</a> </td>
                    <td><a href="<%=request.getContextPath()%>/getappbytp/聊天.search">聊天</a> </td>
                    <td><a href="<%=request.getContextPath()%>/getappbytp/浏览器.search">浏览器</a> </td>
                </tr>
                <tr>
                    <td><a href="<%=request.getContextPath()%>/getappbytp/网购金融.search">网购金融</a></td>
                    <td><a href="<%=request.getContextPath()%>/getappbytp/生活.search">生活</a> </td>
                    <td><a href="<%=request.getContextPath()%>/getappbytp/新闻.search">新闻</a> </td>
                    <td><a href="<%=request.getContextPath()%>/getappbytp/摄影.search">摄影</a> </td>
                </tr>
                <tr>
                    <td><a href="<%=request.getContextPath()%>/getappbytp/美食.search">美食</a> </td>
                    <td><a href="<%=request.getContextPath()%>/getappbytp/音乐.search">音乐</a> </td>
                </tr>
            </table>
        </div>

        <div class="appListDiv">
            <c:if test="${requestScope.appList != null}">
            <%


                List appList = (List) request.getAttribute("appList");
                if(appList != null){
                    int appsPerPage = 6;
                    int totalPages = appList.size() % appsPerPage == 0 ? appList.size() / appsPerPage : appList.size() / appsPerPage + 1;
                    pageContext.setAttribute("appList", appList);
                    pageContext.setAttribute("curPage", 1);
                    pageContext.setAttribute("totalPages", totalPages);
                    pageContext.setAttribute("totalApps", appList.size());
                }

            %>
                <table id="theTable">
                    <thead>
                        <tr>
                            <th>名称</th>
                            <th>图像</th>
                            <th>发行商</th>
                            <th>类型</th>
                            <th>详情</th>
                            <th>下载</th>
                        </tr>
                    </thead>
                    <c:forEach items="${requestScope.appList}" var="appList">
                        <tr>
                            <td>${appList.name}</td>
                            <td><img src="${appList.img}" style="width:50px;height: 50px;"/></td>
                            <td>${appList.publisherName}</td>
                            <td>${appList.type}</td>
                            <td><a href="#" onclick="window.open('<%=request.getContextPath()%>/appinformation/${appList.id}.manager', '应用详情',
                                    'height=700, width=600, toolbar =no, menubar=no, scrollbars=no, resizable=no, location=no, status=no')">查看详情</a></td>
                            <td><a href="${appList.downloadUrl}">点击下载</a></td>
                        </tr>
                    </c:forEach>
                </table>
        </div>
        <div class="pageDiv">
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
    </c:if>

        </div>
        <!--
        <h3>为您推荐</h3>
        <fieldset>
            广告招商位
        </fieldset>
        -->
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

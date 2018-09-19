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
    </script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/css/font-awesome.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ZCW/appSearch.css" />
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
                    <li><a href="<%=request.getContextPath()%>/toMainPage.login">main page</a></li>
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
                <table>
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
                            <td><a href="<%=request.getContextPath()%>/appinformation/${appList.id}.manager">查看详情</a></td>
                            <td><a href="${appList.downloadUrl}">点击下载</a></td>
                        </tr>
                    </c:forEach>
                </table>
                <nav>
                    <ul>
                        <li></li>
                    </ul>
                </nav>
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

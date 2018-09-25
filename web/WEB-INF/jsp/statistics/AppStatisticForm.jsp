<%--
  Created by IntelliJ IDEA.
  User: Zwiebeln_Chan
  Date: 2018/9/7
  Time: 22:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>应用统计</title>
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ZCW/appStatisticForm.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/ZCW/global.css" />
    <script src="<%=request.getContextPath()%>/js/echarts.min.js"></script>
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
        <div class="searchDiv">
            <h2>应用统计</h2>
            <hr style="padding: 0;margin-top: 0; margin-bottom:5px;" />
            <form method="post" action="<%=request.getContextPath()%>/getapp.statistics">
                <table class="searchTable">
                    <tr>
                        <th>关键字:</th>
                        <td colspan="6" style="color:black"><input type="text" name="keyword"></td>
                    </tr>
                    <tr>
                        <th rowspan="5">类型:</th>
                        <td><input type="checkbox" name="tp" value="游戏" />游戏</td>
                        <td><input type="checkbox" name="tp" value="视频" />视频</td>

                    </tr>
                    <tr>

                        <td><input type="checkbox" name="tp" value="摄影" />摄影</td>
                        <td><input type="checkbox" name="tp" value="美食" />美食</td>

                    </tr>
                    <tr>
                        <td><input type="checkbox" name="tp" value="聊天" />聊天</td>
                        <td><input type="checkbox" name="tp" value="浏览器" />浏览器</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="tp" value="生活" />生活</td>
                        <td><input type="checkbox" name="tp" value="新闻" />新闻</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="tp" value="网购金融" />网购金融</td>
                        <td><input type="checkbox" name="tp" value="音乐" />音乐</td>
                    </tr>
                    <tr>
                        <th>发布商:</th>
                        <td colspan="6" style="color:black"><input type="text" name="publisher"></td>
                    </tr>
                    <tr>
                        <th>搜索方式:</th>
                        <td colspan="2" style="color:black">
                        <select name="method" style="border-radius: 5px;">
                        <option value="热度" >热度</option>
                            <option value="数量统计">数量统计</option></select></td>
                    </tr>
                    <tr>
                        <td colspan="2"> <input class="button" type="submit" value="搜索"></td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="chartDiv" id="chart" ></div>
            <script type="text/javascript">
                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('chart'),'light');

                // 指定图表的配置项和数据
                var option = {
                    tooltip: {
                        trigger: 'item',
                        formatter: "{a} <br/>{b}: {c} ({d}%)"
                    },
                    legend: {
                        orient: 'vertical',
                        x: 'left',
                        textStyle:{
                            color:'white'
                        },
                        //data:['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
                        data: [<c:forEach items="${Staticdata}" var="staticdata">'${staticdata.name}',</c:forEach>]
                    },
                    series: [
                        {
                            name:'${Method}',
                            type:'pie',
                            radius: ['50%', '70%'],
                            avoidLabelOverlap: false,
                            label: {
                                normal: {
                                    show: false,
                                    position: 'center'
                                },
                                emphasis: {
                                    show: true,
                                    textStyle: {
                                        fontSize: '30',
                                        fontWeight: 'bold'
                                    }
                                }
                            },
                            labelLine: {
                                normal: {
                                    show: false
                                }
                            },
                            data:[
                                /*{value:335, name:'直接访问'},
                                {value:310, name:'邮件营销'},
                                {value:234, name:'联盟广告'},
                                {value:135, name:'视频广告'},
                                {value:1548, name:'搜索引擎'}*/
                                <c:forEach items="${Staticdata}" var="staticdata">{value:${staticdata.value},name:'${staticdata.name}'},</c:forEach>
                            ]
                        }
                    ]
                };

                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
            </script>

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

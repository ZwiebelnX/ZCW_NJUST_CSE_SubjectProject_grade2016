<%--
  Created by IntelliJ IDEA.
  User: Zwiebeln_Chan
  Date: 2018/9/7
  Time: 22:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="e" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>应用统计</h1>
<fieldset>
    <form method="post" action="<%=request.getContextPath()%>/getapp.statistics">
        关键字:<input type="text" name="keyword">&nbsp;
        类型:<select name="tp">
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
    </select>&nbsp;
        发布商:<input type="text" name="publisher">
        <input type="submit" value="搜索">
    </form>
</fieldset>
</body>
</html>

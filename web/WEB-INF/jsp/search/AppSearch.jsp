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
    <title>Title</title>
</head>
<body>
<h1>应用查询</h1>
<fieldset>
<form method="post" action="getapp.search">
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
<h3>分类</h3>
<fieldset>
    <table>
        <tr>
            <td><a href="/getappbytp/游戏.search">游戏</a> </td>
            <td><a href="/getappbytp/视频.search">视频</a> </td>
            <td><a href="/getappbytp/聊天.search">聊天</a> </td>
            <td><a href="/getappbytp/浏览器.search">浏览器</a> </td>
        </tr>
        <tr>
            <td><a href="/getappbytp/网购金融.search">网购金融</a> </td>
            <td><a href="/getappbytp/生活.search">生活</a> </td>
            <td><a href="/getappbytp/新闻.search">新闻</a> </td>
            <td><a href="/getappbytp/摄影.search">摄影</a> </td>
        </tr>
        <tr>
            <td><a href="/getappbytp/美食.search">美食</a> </td>
            <td><a href="/getappbytp/音乐.search">音乐</a> </td>
        </tr>
    </table>
</fieldset>
<h3>为您推荐</h3>
<fieldset>
    广告招商位
</fieldset>
</body>
</html>

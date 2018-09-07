<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.util.Random"%>
<%@ page import="java.io.OutputStream"%>
<%@ page import="java.awt.Color"%>
<%@ page import="java.awt.Font"%>
<%@ page import="java.awt.Graphics"%>
<%@ page import="java.awt.image.BufferedImage"%>
<%@ page import="javax.imageio.ImageIO"%>
<%
    int width = 160;//验证码的长和宽
    int height = 64;
    BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
    Graphics g = image.getGraphics();
    g.setColor(new Color(0xffffff));//背景颜色
    g.fillRect(0, 0, width, height);
    g.setColor(Color.blue);
    g.drawRect(0, 0, width - 1, height - 1);
    Random rdm = new Random();
    String hash1 = Integer.toHexString(rdm.nextInt());
    //System.out.print(hash1);
    // make some confusion
    for (int i = 0; i < 500; i++) {
        int x = rdm.nextInt(width);
        int y = rdm.nextInt(height);
        g.drawLine(x, y, x+1, y+1);
    }
    // generate a random code
    String capstr = hash1.substring(0, 4);
    session.setAttribute("key", capstr);
    g.setColor(new Color(0xD200D2));
    g.setFont(new Font("黑体", Font.BOLD, 48));
    g.drawString(capstr, 16, 48);
    g.dispose();
    response.setContentType("image/jpeg");
    out.clear();
    out = pageContext.pushBody();
    OutputStream strm = response.getOutputStream();
    ImageIO.write(image, "jpeg", strm);
    strm.close();
%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'validatecode.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    This is my JSP page. <br>
  </body>
</html>

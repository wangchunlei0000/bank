<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'chakanuser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/input.css">
	<style type="text/css">
	body{background:url("img/bbb.jpg"); 
	 background-attachment: fixed;
	 background-repeat: no-repeat;
	 background-size: cover;}
	.setbg{
		margin: 0px;
        padding: 0px;
        background-size: 100% 100%;
        width: 100%;
        height: 100%;
    	top: 0px;
    	left: 0px;	
	}
	.setborder{
		border-style:solid;
		border-width:1px;
		border-color:#4682B4;
		border-radius: 30px;
		width: 400px;
		height: 300px;
		background: rgba(255,255,255,0.2);
	}
</style>
	
	<% bean.User user = (bean.User)session.getAttribute("form");%>

  </head>
  
  <body><center>
 <div class="setbg"> <br/><br/><br/>
	<div class="setborder" > <br>
    <b>当前登录用户信息</b><br><br>
    工号：<%=user.getUserid() %><br><br>
    姓名：<%=user.getUsername() %><br><br>
    身份证号：<%=user.getUsersfzh() %><br><br>
    入职时间：<%=user.getWorkdate() %><br><br>
  </div> </div></center></body>
</html>

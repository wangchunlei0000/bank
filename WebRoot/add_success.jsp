<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>职员添加成功</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%bean.User user=(bean.User)session.getAttribute("user"); 
	%>
 <link rel="stylesheet" type="text/css" href="css/input.css">
  <style type="text/css">
 
</style>
</head>
  <body bgcolor=#4682B4>
  <center>
 
  <div>
  <h3>职员添加成功,该员工的信息如下</h3>
  <form name="mainform" action="addclerk.jsp" method="post" onsubmit="return check();">
  <table border="1" cellpadding="0" cellspacing="0" bordercolor="#fffff" bgcolor="#CDCDCD" width="521" height="266">
  	<tr>
    	<td width="150" height="70" align="left" valign="middle">&nbsp;职员姓名：</td>
    	<td><%=user.getUsername() %></td>
  	</tr>
  	<tr>
    	<td width="150" height="70" align="left" valign="middle">&nbsp;职员性别：</td>
    	<td><%=user.getUsersex() %></td>
  	</tr>
  	<tr>
    	<td width="150" height="70" align="left" valign="middle">&nbsp;职员工号：</td>
    	<td><%=user.getUserid() %></td>
  	</tr>
  	<tr>
    	<td colspan="2" width="100" height="40" align="center"><input class="bu" type="submit" value="返回"></td>
  	</tr>
</table>
</form>  
</div>

  </center>
  </body>
</html>

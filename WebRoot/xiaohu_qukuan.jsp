<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="bean.Account" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>销户取款页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/input.css">
	<%
	    Account account= (Account)session.getAttribute("xiaohu");
	    System.out.println("xiaohu:"+account.getMoney());
	    session.setAttribute("xiaohua",account);
	 %>
  </head>
    <style type="text/css">
  

body{
   background:url("img/bbb.jpg");
    background-attachment: fixed;
	 background-repeat: no-repeat;
	 background-size: cover;
	

}
</style>
  <body >
  	<center>
  	<div >
    <form name="mainform" action="AccountServlet?method=11&sign=17" method="post">
    <table width="300" border="0" cellspacing="1" cellpadding="1">
    	<tr height="50"  align="center">
    		<td colspan="2"></td>
  		</tr>
  		<tr height="50"  align="center">
    		<td align="left" valign="middle">该账户还有余额：<%=account.getMoney() %></td>
  		</tr>
  		<tr height="50"  align="center">
    		<td colspan="2">
    			<input class=bu type="submit" value="  全部取出  "></td>
  		</tr>
  	</table>
    </form>
    </div>
    </center>
  </body>
</html>

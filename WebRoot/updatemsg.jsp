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
    
    <title>客户信息修改页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/input.css">
	<%
	    Account account=(Account)session.getAttribute("xgacc"); 
	    session.setAttribute("xgaccount",account);
	    //System.out.println("xgaccount"+account.getAccpwd());
	%>
  </head>
    <style type="text/css">
    
body{
   background:url("img/bbb.jpg");
    background-attachment: fixed;
	 background-repeat: no-repeat;
	 background-size: cover;
	
}
a{
		text-decoration:none;
		font-size:1.2em;
}
</style>
  <body >
  <center><br/><br/><br/>
   <div >
    <form name="mainform" action="" method="post">
    
    		<h2>请选择你要办理的业务</h2>
  		
    	<a  href="updatepwd.jsp"><h2>修改客户密码</h1></a>
        <a  href="updatetel.jsp"><h2>修改客户电话</h1></a>
  		
  	</form>
  	</div>
  </center>
  </body>
</html>

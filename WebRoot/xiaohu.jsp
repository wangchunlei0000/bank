<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>销户页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/input.css">
	<style type="text/css">
	
	.setbg{
	margin: 0px;
    padding: 0px;
    background: url(img/bg_4.jpg) no-repeat;
    background-size: 100% 100%;
    width: 100%;
    height: 100%;
    top: 0px;
    left: 0px;
    position: absolute;

	}
	.setborder{
		border-style:solid;
		border-width:2px;
		border-color:#0099cc;
		border-radius: 30px;
		width: 400px;
		height: 400px;
		position: absolute;
		top:100px;
		left: 500px;	
		background: rgba(255,255,255,0.2);
	}
body{
   background:url("img/bbb.jpg");
    background-attachment: fixed;
	 background-repeat: no-repeat;
	 background-size: cover;
	
}
</style>
  </head>
  
  <body >

	<div >
  	<center><br/>
  	<h2>请输入销户信息</h2>
    <form name="mainform" action="AccountServlet?method=2&sign=2" method="post" onsubmit="return check();">
    <table width="458" border="0" cellspacing="1" cellpadding="1" height="246">
    	<tr height="50"  align="center">
    		<td align="left" valign="middle">&nbsp; 身份证号：</td>
    		<td><input type="text" name="accsfzh"></td>
  		</tr>
  		<tr height="50"  align="center">
    		<td align="left" valign="middle">&nbsp; 账号：</td>
    		<td><input type="text" name="accid"></td>
  		</tr>
  		<tr height="50"  align="center">
    		<td align="left" valign="middle">&nbsp; 密码：</td>
    		<td><input type="password" name="accpwd"></td>
  		</tr>
  		<tr height="50"  align="center">
    		<td colspan=2>
    			<input class=bu type="submit" value=" 销户  "></td>
    			
  		</tr>
  	</table>
    </form>
    </center>
    </div>
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��ʧ�ɹ�</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/input.css">

  <style type="text/css">
body{
   background:url("img/bbb.jpg");
    background-attachment: fixed;
	 background-repeat: no-repeat;
	 background-size: cover;
	
}
</style>
</head>
  <body>
  <center>
  <div>
  <form name="mainform" action="guashi.jsp" method="post" onsubmit="return check();">
    <table width="300" border="0" cellspacing="0" cellpadding="0">
  	<tr>
    	<td width="300" height="50">&nbsp;</td>
  	</tr>
  	<tr>
    	<td width="300" height="50">&nbsp;</td>
  	</tr>
  	<tr>
    	<td width="300" height="50"><h2>�˻���ʧ�ɹ���</h2></td>
  	</tr>
  	<tr>
    	
  	</tr>
	</table>
 </form>
 </div>
 </center>
 </body>
</html>

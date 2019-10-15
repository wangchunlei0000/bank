<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>贷款客户信息核对</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body  background="images/bg1.jpg">
  <center>
  <h3>贷款业务办理成功，请核对贷款客户信息</h3>
  <form name="mainform" action="xindai.jsp" method="post">
  <table width="600" border="1" cellpadding="0" cellspacing="0" bordercolor="#fffff" bgcolor="#e2f0d9">
  	<tr>
    	<td width="200" height="50" align="left" valign="middle">客户姓名：</td>
    	<td>&nbsp;</td>
  	</tr>
  	<tr>
    	<td width="200" height="50" align="left" valign="middle">客户身份证号：</td>
    	<td>&nbsp;</td>
  	</tr>
  	<tr>
    	<td width="200" height="50" align="left" valign="middle">客户贷款金额：</td>
    	<td>&nbsp;</td>
  	</tr>
  	<tr>
    	<td width="200" height="50" align="left" valign="middle">客户贷款期限：</td>
    	<td>&nbsp;</td>
  	</tr>
  	<tr>
    	<td width="200" height="50" align="left" valign="middle">客户还款方式：</td>
    	<td>&nbsp;</td>
  	</tr>
  	<tr>
    	<td width="200" height="50" align="left" valign="middle">客户预留手机号:</td>
    	<td>&nbsp;</td>
  	</tr>
  	<tr>
      	<td height="50" colspan="2" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="xindaisuccess.jsp"><input type="submit" value="返回"></a></td>
  	</tr>
</table> 
</form>   	
</center>
</body>
</html>

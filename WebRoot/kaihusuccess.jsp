<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="bean.Account"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>�����ɹ�</title>
   	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/input.css">
	<%
		bean.Account account=(bean.Account)session.getAttribute("accid");
	%>
<style type="text/css">
body{background:url("img/bbb.jpg");
    background-attachment: fixed;
	 background-repeat: no-repeat;
	 background-size: cover;
	
}
</style>
  </head>
 
  <body >
  <center>

 <div><br/><br/>
    <h2>�����ɹ����ͻ���Ϣ���£�</h2>
 	<form name="mainform" action="kaihu.jsp" method="post" onsubmit="return check();" >
    	<table width="422" border="0" cellspacing="1" cellpadding="1" height="187">
    		<tr height="45"  align="center">
    			<td align="left" valign="middle">�� &nbsp; ����</td>
    			<td><%=account.getAccname()%></td>
  			</tr>
  			<tr height="45"  align="center">
    			<td align="left" valign="middle">��&nbsp;&nbsp; ��</td>
    			<td><%=account.getAccsex()%></td>
  			</tr>
    		<tr height="45"  align="center">
    			<td align="left" valign="middle">���֤�ţ�</td>
    			<td><%=account.getAccsfzh()%></td>
  			</tr>
  			<tr height="45"  align="center">
    			<td align="left" valign="middle">��&nbsp;&nbsp; �ţ�</td>
    			<td><%=account.getAccid()%></td>
  			</tr>
  		</table>
    </form>
  
  
  </div>
  </center>

  </body>
</html>

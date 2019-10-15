<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="bean.TimeType"%>
<%@page import="ctrl.TimeTypeCtrl"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>当前定期利率</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/input.css">
	<%
	    TimeTypeCtrl timeTypeCtrl=new TimeTypeCtrl();
	    TimeType timeType2=timeTypeCtrl.getRate(2);
	    TimeType timeType3=timeTypeCtrl.getRate(3);
	    TimeType timeType4=timeTypeCtrl.getRate(4);
	    TimeType timeType5=timeTypeCtrl.getRate(5);
	    TimeType timeType6=timeTypeCtrl.getRate(6);
	    TimeType timeType7=timeTypeCtrl.getRate(7);
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
  <form name="mainform" action="dingqi_cunkuan.jsp" method="post">
  	<table width="620" border="0" cellspacing="0" cellpadding="0" >
  	<tr>
    	<td width="300" height="50">&nbsp;</td>
  	</tr>
  	<tr>
    	<td width="300" height="50">&nbsp;</td>
  	</tr>
  	<tr>
    	<td colspan="2" align="center"><h3>此时定期存款各存期利率如下</h3></td>
  	</tr>
  	<tr>
    	<td width="800" valign="bottom">
    		<table width="800" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#fffff" bgcolor="#e2f0d9">
    			<tr height="30" align="center">
    				<th>三个月</th>
    				<th>六个月</th>
    				<th>一年</th>
    				<th>两年</th>
    				<th>三年</th>
    				<th>五年</th>
    			</tr>
    			<tr align="center">
    				<td  height="30"><%=timeType2.getRate() %></td>
    				<td  height="30"><%=timeType3.getRate() %></td>
    				<td  height="30"><%=timeType4.getRate() %></td>
    				<td  height="30"><%=timeType5.getRate() %></td>
    				<td  height="30"><%=timeType6.getRate() %></td>
    				<td  height="30"><%=timeType7.getRate() %></td>
    			</tr>
    		</table>
    	</td>
  	</tr>
  	<tr>
  		<td colspan="2">&nbsp;</td>
  	</tr>
  	<tr>
  		<td colspan="2">&nbsp;</td>
  	</tr>
  	<tr>
  		<td colspan="2">&nbsp;</td>
  	</tr>
  	
	</table>
</form>  
</div> 	
</center>
</body>
</html>

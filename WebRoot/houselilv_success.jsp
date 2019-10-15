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
    
    <title>房贷利率修改成功</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/input.css">
	<%
	    TimeTypeCtrl timeTypeCtrl=new TimeTypeCtrl();
	    TimeType timeType31=timeTypeCtrl.getRate(31);
	    TimeType timeType32=timeTypeCtrl.getRate(32);
	    TimeType timeType33=timeTypeCtrl.getRate(33);
	    TimeType timeType34=timeTypeCtrl.getRate(34);
	    TimeType timeType35=timeTypeCtrl.getRate(35);
	%>
<style type="text/css">
.aa{
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
.bb{
    border-style:solid;
		border-width:1px;
		border-color:#0099cc;
		border-radius: 30px;
		width: 400px;
		height: 300px;
		position: absolute;
		top:80px;
		left: 500px;		
		background: rgba(255,255,255,0.2);
}
</style>  
</head>
  <body  bgcolor=#4682B4>
  <center>
  <div class="aa">
  <form name="mainform" action="houselilv.jsp" method="post">
  <table width="800" border="0" cellspacing="0" cellpadding="0">
  	
  	<tr>
    	<td width="800" height="50">&nbsp;</td>
  	</tr>
  	<tr>
    	<td colspan="2" align="center"><h4>房贷利率修改成功,当前各定期利率如下</h4></td>
  	</tr>
  	<tr>
    	<td width="800" height="20">&nbsp;</td>
  </table>
  <table width="800" border="1" align="center" cellspacing="0" cellpadding="0" bordercolor="#fffff" bgcolor="#e2f0d9">
    <tr height="30" align="center">
    	<th>三年利率</th>
    	<th>五年利率</th>
    	<th>十年利率</th>
    	<th>二十年利率</th>
    	<th>三十年利率</th>
    </tr>
    <tr align="center">
    	<td  height="30"><%=timeType31.getRate() %></td>
    	<td  height="30"><%=timeType32.getRate() %></td>
    	<td  height="30"><%=timeType33.getRate() %></td>
    	<td  height="30"><%=timeType34.getRate() %></td>
    	<td  height="30"><%=timeType35.getRate() %></td>
    </tr>   		
  </table>
  <table>
    <tr>
    	<td width="300" height="20" align="center"><input class="bu" type="submit" value="返回"></td>
  	</tr>
</table>
</form>   
</div>	
  </center>
  </body>
</html>

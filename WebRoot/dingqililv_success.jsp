0<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    
    <title>定期利率修改成功</title>
    
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
.aa{
margin: 0px;
        padding: 0px;
        background-size: 100% 100%;
        width: 100%;
        height: 100%;
        top: 0px;
        left: 0px;
        position: absolute;
   }
   body{font-family:幼圆;}
</style>
  <body  bgcolor=#4682B4>
  <center>
  <div class="aa">
  <form name="mainform" action="dingqililv.jsp" method="post" onsubmit="return check();">
  		<table width="800" border="0" cellspacing="0" cellpadding="0">
  			<tr>
    			<td width="800" height="50">&nbsp;</td>
  			</tr>
  			<tr>
    			<td colspan="2" align="center"><h4>定期利率修改成功,当前各定期利率如下</h4></td>
  			</tr>
  			<tr>
    			<td width="800" height="20">&nbsp;</td>
    		</tr>
  		</table>
  		<table width="800" border="1" align="center" cellspacing="0" cellpadding="0" bordercolor="#fffff" bgcolor="	#CDCDCD">
    <tr height="30" align="center">
    	<th>三个月期利率</th>
    	<th>六个月期利率</th>
    	<th>一年期利率</th>
    	<th>两年期利率</th>
    	<th>三年期利率</th>
    	<th>五年期利率</th>
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
  <table>
  	
</table>
<br/>
	<input class="bu" type="submit" value="返回">
</form> 
</div>  	
  </center>
  </body>
</html>

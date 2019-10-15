<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>活期利率修改成功</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/input.css">
    <%
        Double lilv1=(Double)session.getAttribute("lilv");
     %>
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

body{
    background:url("img/1.jpg");
    animation-name:myfirst;
    animation-duration:12s; 
    animation-delay:2s;
    animation-iteration-count:infinite;
    animation-play-state:running;
	font-family:幼圆;
}
@keyframes myfirst
{
    0%   {background:url("img/1.jpg");}
    25%  {background:url("img/2.jpg");}
    50%  {background:url("img/3.jpg");}
    75%  {background:url("img/1.jpg");}
    100% {background:url("img/1.jpg");}
}
</style>
</head>
  <body bgcolor=#4682B4>
  <center><br/><br/>
  <div class="aa">
  <form name="mainform" action="huoqililv.jsp" method="post" onsubmit="return check();">
  <table width="300" border="0" cellspacing="0" cellpadding="0">
  	<tr>
    	<td width="300" height="50">&nbsp;</td>
  	</tr>
  	<tr>
    	<td width="300" height="50">&nbsp;</td>
  	</tr>
  	<tr>
    	<td colspan="2" align="center"><h4>活期利率修改成功!当前活期利率为：<%=lilv1 %></h4></td>
  	</tr>
  	
  	<tr>
    	<td width="300" height="20" align="center"><input class="bu" type="submit" value=" 返回  "></td>
  	</tr>
</table>
</form>  
</div> 	
  </center>
  </body>
</html>

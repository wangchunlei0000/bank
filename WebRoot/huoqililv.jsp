<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="bean.TimeType"%>
<%@ page import="ctrl.TimeTypeCtrl"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>活期利率修改页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/input.css">
	<script type="text/javascript">
    function on_submit(){
       if(mainform.newhuoqililv.value==""){
       		alert("请输入新的利率值！")
       		mainform.newhuoqililv.focus()
       		return false;
       }else if(mainform.newhuoqililv.value>=1){ 
	      	alert("请输入正确的利率值！"); 
	    	mainform.newhuoqililv.focus(); 
	    	return false; 
		}else{
			return true;
       }
    }
    </script>
    <%
        TimeType timeType=new TimeType();
        TimeTypeCtrl timeTypeCtrl=new TimeTypeCtrl();
        timeType=timeTypeCtrl.getRate(1);
        
     %>
<style type="text/css">
   
     body{
    background:url("img/1.jpg");
    animation-name:myfirst;
    animation-duration:12s; 
    animation-delay:2s;
    animation-iteration-count:infinite;
    animation-play-state:running;

}
	@keyframes myfirst{
    0%   {background:url("img/1.jpg");}
    25%  {background:url("img/2.jpg");}
    50%  {background:url("img/3.jpg");}
    75%  {background:url("img/1.jpg");}
    100% {background:url("img/1.jpg");}
}
     
   .setborder{
	border-style:solid;
	border-width:1px;
	border-color:#696969;
	border-radius: 30px;
	margin-left:28%;
	margin-top:8%;
	width: 500px;
	height: 500px;
	position: absolute;
	background: rgba(255,255,255,0.5);
}
</style>
    
  </head>
  
<body>
  <center>
<div class="setborder" style="top: 56px; height: 433px; left: 10px;">
  	
  		<h2><br></h2><h2>请输入新利率值</h2><br><br>
    	<form name="mainform" action="UserServlet?method=5&sign=15" method="post" onsubmit="return on_submit()">
    		<table border="0" cellspacing="1" cellpadding="1" style="left: -56px; width: 449px;">
    			<tr height="50"  align="center">
    				<td align="left" valign="middle">&nbsp; 当前利率：</td>
    				<td><%=timeType.getRate() %></td>
  				</tr>
  				<tr height="50"  align="center">
  					<td align="left" valign="middle">&nbsp; 新利率：</td>
    				<td><input type="text" name="newhuoqililv"></td>
    			</tr>
  				<tr height="50"  align="center">
    				<td colspan="2"><br/>	
    					<input class="bu" type="submit" value="  确定  ">
    				</td>
    			</tr>
  			</table>
    	</form>
    
</div>
</center>
</body>
</html>

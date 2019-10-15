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
    
    <title>房贷利率修改页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/input.css">
	<script type="text/javascript">
    function on_submit(){
    	if(mainform.newthreeyear.value==""&&mainform.newfiveyear.value==""&&mainform.newtenyear.value==""&&
    	    	mainform.newtwentyyear.value==""&&mainform.newthirtyyear.value==""){
    	       		alert("请输入你要修改的房贷利率值！")
    	       		mainform.newthreeyear.focus()
    	       		return false;
    	       }else if(mainform.newthreeyear.value>=1||mainform.newfiveyear.value>=1||mainform.newtenyear.value>=1||
    	    		   mainform.newtwentyyear.value>=1||mainform.newthirtyyear.value>=1){ 
    		      	alert("请输入正确的利率值！"); 
    		    	mainform.newthreeyear.focus(); 
    		    	return false; 
    	       }else{
				return true;
       			}
    		}
    </script>
    <%
	    TimeTypeCtrl timeTypeCtrl=new TimeTypeCtrl();
	    TimeType timeType31=timeTypeCtrl.getRate(31);
	    TimeType timeType32=timeTypeCtrl.getRate(32);
	    TimeType timeType33=timeTypeCtrl.getRate(33);
	    TimeType timeType34=timeTypeCtrl.getRate(34);
	    TimeType timeType35=timeTypeCtrl.getRate(35);
	%>
	<style type="text/css">
	body{
    background:url("img/1.jpg");
    animation-name:myfirst;
    animation-duration:12s;
    animation-delay:2s;
    animation-iteration-count:infinite;
    animation-play-state:running;
    margin:0px;
    padding:0px;
    
}
@keyframes myfirst
{
    0%   {background:url("img/1.jpg");}
    25%  {background:url("img/2.jpg");}
    50%  {background:url("img/3.jpg");}
    75%  {background:url("img/1.jpg");}
    100% {background:url("img/1.jpg");}
}
		.setborder{
		border-style:solid;
		border-width:1px;
		border-color:#0099cc;
		border-radius: 30px;
		position: absolute;
		background: rgba(255,255,255,0.4);
	}
	.setborder{
		border-style:solid;
		border-width:1px;
		border-color:#0099cc;
		border-radius: 30px;
		width: 400px;
		height: 500px;
		position: absolute;
		top:80px;
		left: 500px;		
		background: rgba(255,255,255,0.5);
	}
</style>
  </head>
  
  <body>
 <center>
	<div class="setborder" style="height: 642px; width: 583px; left: 457px;">
  	
  	<h2><br></h2><h2>请输入新利率值</h2>
    <form name="mainform" action="UserServlet?method=7&sign=19" method="post" onsubmit="return on_submit()">
    <table style="width: 498px; height: 364px; left: -48px;">
    	<tr height="30"  align="center">
    		<td align="left" valign="middle">当前三年期房贷利率：</td>
    		<td><%=timeType31.getRate() %></td>
  		</tr>
  		<tr height="30"  align="center">
  			<td align="left" valign="middle">修改：</td>
    		<td><input type="text" name="newthreeyear"></td>
    	</tr>
    	<tr height="30"  align="center">
    		<td align="left" valign="middle">当前五年期房贷利率：</td>
    		<td><%=timeType32.getRate() %></td>
  		</tr>
  		<tr height="30"  align="center">
  			<td align="left" valign="middle">修改：</td>
    		<td><input type="text" name="newfiveyear"></td>
    	</tr>
    	<tr height="30"  align="center">
    		<td align="left" valign="middle">当前十年期房贷利率：</td>
    		<td><%=timeType33.getRate() %></td>
  		</tr>
  		<tr height="30"  align="center">
  			<td align="left" valign="middle">修改：</td>
    		<td><input type="text" name="newtenyear"></td>
    	</tr>
    	<tr height="30"  align="center">
    		<td align="left" valign="middle">当前二十年期房贷利率：</td>
    		<td><%=timeType34.getRate() %></td>
  		</tr>
  		<tr height="30"  align="center">
  			<td align="left" valign="middle">修改：</td>
    		<td><input type="text" name="newtwentyyear"></td>
    	</tr>
    	<tr height="30"  align="center">
    		<td align="left" valign="middle">当前三十年期房贷利率：</td>
    		<td><%=timeType35.getRate() %></td>
  		</tr>
  		<tr height="30"  align="center">
  			<td align="left" valign="middle">修改：</td>
    		<td><input type="text" name="newthirtyyear"></td>
    	</tr>
  		<tr height="50"  align="center">
    		<td colspan="2">
    			<br/><input class="bu" type="submit" value="  确定  "></td>
    			
  		</tr>
  	</table>
    </form>
   
    </div>
     </center>
  </body>
</html>

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
    
    <title>定期利率修改页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/input.css">
	<script type="text/javascript">
    function on_submit(){
       if(mainform.newthreemonth.value==""&&mainform.newsixmonth.value==""&&mainform.newoneyear.value==""&&
    	mainform.newtwoyear.value==""&&mainform.newthreeyear.value==""&&mainform.newfiveyear.value==""){
       		alert("请输入你要修改的存期利率值！")
       		mainform.newthreemonth.focus()
       		return false;
       }else if(mainform.newthreemonth.value>=1||mainform.newsixmonth.value>=1||mainform.newoneyear.value>=1||
    		   mainform.newtwoyear.value>=1||mainform.newthreeyear.value>=1||mainform.newfiveyear.value>=1){ 
	      	alert("请输入正确的利率值！"); 
	    	mainform.newthreemonth.focus(); 
	    	return false; 
       }else{
			return true;
       }
    }
    </script>
    <%
	    TimeTypeCtrl timeTypeCtrl=new TimeTypeCtrl();
	    TimeType timeType2=timeTypeCtrl.getRate(2);
	    TimeType timeType3=timeTypeCtrl.getRate(3);
	    TimeType timeType4=timeTypeCtrl.getRate(4);
	    TimeType timeType5=timeTypeCtrl.getRate(5);
	    TimeType timeType6=timeTypeCtrl.getRate(6);
	    TimeType timeType7=timeTypeCtrl.getRate(7);
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
	border-color:#CDCDCD;
	border-radius: 30px;
	margin-left:28%;
	margin-top:8%;
	width: 500px;
	height: 560px;
	position: absolute;
	background: rgba(255,255,255,0.5);
}
</style>
  </head>
  
  <body>
<center>
	<div class="setborder" style="height: 722px; left: -141px; width: 849px; top: -31px;">
  	
  <center>	<h3><br></h3><h3><font face="幼圆" size="5">请输入要修改的利率值</font></h3></center>
    <form name="mainform" action="UserServlet?method=6&sign=18" method="post" onsubmit="return on_submit()">
    <table  align="center"  style="top: 65px; left: -173px; width: 547px; height: 548px;">
    	<tr height="30"  align="center">
    		<td align="left" valign="middle"><font face="幼圆">当前3个月定期利率：</font></td>
    		<td><font face="幼圆"><%=timeType2.getRate() %></font><br></td>
  		</tr>
  		<tr height="30"  align="center">
  			<td align="left" valign="middle"><font face="幼圆">修改：</font></td>
    		<td><font face="幼圆"><input type="text" name="newthreemonth"></font></td>
    	</tr>
    	<tr height="30"  align="center">
    		<td align="left" valign="middle"><font face="幼圆">当前6个月定期利率：</font></td>
    		<td><font face="幼圆"><%=timeType3.getRate() %></font><br></td>
  		</tr>
  		<tr height="30"  align="center">
  			<td align="left" valign="middle"><font face="幼圆">修改：</font></td>
    		<td><font face="幼圆"><input type="text" name="newsixmonth"></font></td>
    	</tr>
    	<tr height="30"  align="center">
    		<td align="left" valign="middle"><font face="幼圆">当前一年定期利率：</font></td>
    		<td><font face="幼圆"><%=timeType4.getRate() %></font><br></td>
  		</tr>
  		<tr height="30"  align="center">
  			<td align="left" valign="middle"><font face="幼圆">修改：</font></td>
    		<td><font face="幼圆"><input type="text" name="newoneyear"></font></td>
    	</tr>
    	<tr height="30"  align="center">
    		<td align="left" valign="middle"><font face="幼圆">当前两年定期利率：</font></td>
    		<td><font face="幼圆"><%=timeType5.getRate() %></font><br></td>
  		</tr>
  		<tr height="30"  align="center">
  			<td align="left" valign="middle"><font face="幼圆">修改：</font></td>
    		<td><font face="幼圆"><input type="text" name="newtwoyear"></font></td>
    	</tr>
    	<tr height="30"  align="center">
    		<td align="left" valign="middle"><font face="幼圆">当前三年定期利率：</font></td>
    		<td><font face="幼圆"><%=timeType6.getRate() %></font><br></td>
  		</tr>
  		<tr height="30"  align="center">
  			<td align="left" valign="middle"><font face="幼圆">修改：</font></td>
    		<td><font face="幼圆"><input type="text" name="newthreeyear"></font></td>
    	</tr>
    	<tr height="30"  align="center">
    		<td align="left" valign="middle"><font face="幼圆">当前五年定期利率：</font></td>
    		<td><font face="幼圆"><%=timeType7.getRate() %></font><br></td>
  		</tr>
  		<tr height="30"  align="center">
  			<td align="left" valign="middle"><font face="幼圆">修改：</font></td>
    		<td><font face="幼圆"><input type="text" name="newfiveyear"></font></td>
    	</tr>
  		<tr height="50" align="center" >
    		<td colspan="2">
    			<input class="bu" type="submit" value="  确定  "></td>
    			
  		</tr>
  	</table>
    </form>

    </div>
       </center>
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="bean.Account" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>客户密码修改页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/input.css">
<script type="text/javascript">
	function on_submit(){
		if(mainform.accpwd.value==""){
          	alert("请输入新密码！");
         	mainform.accpwd.focus();
          	return false;
      	}else if(!(/^[0-9]\d{5}$/.test(mainform.accpwd.value))){
          	alert("请输入六位数字密码密码！");
         	mainform.accpwd.focus();
          	return false;
      	}else if(mainform.accrepwd.value==""){
          	alert("请输入确认密码！");
          	mainform.accrepwd.focus();
          	return false;
      	}else if(mainform.accpwd.value!=mainform.accrepwd.value){
       		alert("密码与确认密码不一致，请重新输入！");
       		mainform.accrepwd.value="";
       		mainform.accrepwd.focus();
       		return false;
       	}else{
			return true;
		}
    }
    </script>
    <%
      Account account=(Account)session.getAttribute("xgaccount"); 
      session.setAttribute("xgaccount1",account);
      //System.out.println("xgaccount1:+"+account.getAccpwd());
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
  <body  >
  <center><BR/><BR/><BR/>
  <div >
    <h2>请输入客户如下信息</h2>
    <form name="mainform" action="AccountServlet?method=8&sign=10" method="post" onsubmit="return on_submit()">
    <table width="428" border="0" cellspacing="1" cellpadding="1" height="231">
    	<tr height="50"  align="center">
    		<td align="left" valign="middle">输入新密码:</td>
    		<td><input type="password" name="accpwd"></td>
  		</tr>
  		<tr height="50"  align="center">
    		<td align="left" valign="middle">输入确认密码：</td>
    		<td><input type="password" name="accrepwd"></td>
  		</tr>
  		<tr height="50"  align="center">
    		<td colspan="2">
    			<input class="bu" type="submit" value=" 修改   ">&nbsp;&nbsp;&nbsp;
    			<input class="bu" type="reset" value=" 重置   "></td>
  		</tr>
  		
  	</table>
  	</form>
  	</div>
  </center>
  </body>
</html>

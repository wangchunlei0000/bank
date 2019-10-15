<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>定期取款页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/input.css">
	<script type="text/javascript">
	
    function on_submit(){
       if(mainform.accid.value==""){
       		alert("请输入取款账号！")
       		mainform.accid.focus()
       		return false;
       }else if(!( /^\d{19}$/g.test(mainform.accid.value))){ 
	      	alert("账号输入错误，请重新输入！"); 
	    	mainform.accid.focus(); 
	    	return false; 
		}else if(mainform.accpwd.value==""){
          	alert("请输入取款密码！");
         	mainform.accpwd.focus();
          	return false;
      	}else if(!(/^[0-9]\d{5}$/.test(mainform.accpwd.value))){
          	alert("请输入六位数字密码密码！");
         	mainform.accpwd.focus();
          	return false;
      	}else if(mainform.tramoney.value==""){
           alert("请输入取款金额！");
           mainform.tramoney.focus();
           return false;
       }else if(mainform.tramoney.value<=0){
           alert("请输入正确的取款金额！");
           mainform.tramoney.focus();
           return false;
       }else{
			return true;
       }
    }
    </script>
    <%
	bean.User user=(bean.User)session.getAttribute("form");
	session.setAttribute("useridSession",user.getUserid());
    %>
   
<style type="text/css">
 body{
    background:url("img/bbb.jpg");
    background-attachment: fixed;
	 background-repeat: no-repeat;
	 background-size: cover;
	
}


</style>
  </head>
  
  <body >

	<div><br/>
  	<center>
  	<h2>定期取款账户信息</h2>
    <form name="mainform" action="AccountServlet?method=12&sign=20" method="post" onsubmit="return on_submit()">
    <table width="370" border="0" height="211">
    	<tr height="50"  align="center">
    		<td align="left" valign="middle">取款账户：</td>
    		<td><input type="text" name="accid"></td>
  		</tr>
  		<tr height="50"  align="center">
  			<td align="left" valign="middle">取款密码：</td>
    		<td><input type="password" name="accpwd"></td>
    	</tr>
    	<!--  
  		<tr height="50"  align="center">
    		<td align="left" valign="middle">取款金额：</td>
    		<td><input type="text" name="tramoney"></td>
  		</tr>
  		-->
  		<tr height="50"  align="center">
    		<td colspan='2' >
    			<input class=bu type="submit" value=" 确定  ">
    		</td>
    			
  		</tr>
  	</table>
    </form>
    </center>
    </div>
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName

()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>取款页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/input.css">
<style type="text/css">

body{
    background:url("img/bbb.jpg");
    background-attachment: fixed;
	 background-repeat: no-repeat;
	 background-size: cover;
	
}
	.setborder{
		border-style:solid;
		border-width:2px;
		border-color:#0099cc;
		border-radius: 30px;
		width: 400px;
		height: 400px;
		position: absolute;
		top:100px;
		left: 500px;
		background: rgba(255,255,255,0.2);
	}
</style>
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
  </head>
  
  <body  >
 
	<div >
  	<center><br/>
  	<h2>请输入取款账户信息</h2>
    <form name="mainform" action="TradeServlet?method=2&sign=5" method="post" onsubmit="return on_submit()">
    <table width="432" border="0" cellspacing="1" cellpadding="1" height="270">
    	<tr height="50"  align="center">
    		<td align="left" valign="middle">取款账户：</td>
    		<td><input type="text" name="accid"></td>
  		</tr>
  		<tr height="50"  align="center">
  			<td align="left" valign="middle">取款密码：</td>
    		<td><input type="password" name="accpwd"></td>
    	</tr>
  		<tr height="50"  align="center">
    		<td align="left" valign="middle">取款金额：</td>
    		<td><input type="text" name="tramoney"></td>
  		</tr>
  		<tr height="50"  align="center">
    		<td colspan=2><input class=bu type="submit" value="确定 "></td>
    		
  		</tr>
  	</table>
    </form>
    </center>
  </div> </body>
</html>

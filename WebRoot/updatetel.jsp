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
    
    <title>客户信息修改</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/input.css">
<script type="text/javascript">
	function on_submit(){
		if(mainform.acctel.value==""){
   			alert("请输入客户原预留手机号！")
 			mainform.acctel.focus()
 			return false;
 	  	}else if(!(/^1[34578]\d{9}$/.test(mainform.acctel.value))){ 
      		alert("手机号码有误，请重新输入！"); 
    		mainform.acctel.focus(); 
    		return false; 
		}else if(mainform.accretel.value==""){
          	alert("请输入客户新手机号！");
         	mainform.accretel.focus();
          	return false;
      	}else if(!(/^1[34578]\d{9}$/.test(mainform.accretel.value))){ 
      		alert("手机号码有误，请重新输入！"); 
    		mainform.accretel.focus(); 
    		return false; 
		}else if(mainform.accretel.value==mainform.acctel.value){
       		alert("原预留手机号与新手机号相同，请重新输入！");
       		mainform.accretel.value="";
       		mainform.accretel.focus();
       		return false;
       	}else{
			return true;
		}
    }
    </script>
    <%
      Account account=(Account)session.getAttribute("xgaccount"); 
      session.setAttribute("xgaccount2",account);
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
  <center><BR/><BR/><BR/>
  <div>
    <h2>请输入客户的新信息</h2>
    <form name="mainform" action="AccountServlet?method=9&sign=11" method="post" onsubmit="return on_submit()">
    <table width="451" border="0" cellspacing="1" cellpadding="1" height="259">
  		<tr height="50"  align="center">
    		<td align="left" valign="middle">原预留手机号：</td>
    		<td><input type="text" name="acctel"></td>
  		</tr>
  		<tr height="50"  align="center">
    		<td align="left" valign="middle">新预留手机号：</td>
    		<td><input type="text" name="accretel"></td>
  		</tr>
  		<tr height="50"  align="center">
    		<td colspan="2" align="center" valign="middle">
    			<input class=bu type="submit" value=" 修改   "></td>
  		</tr>
  	</table>
  	</form>
  	</div>
  </center>
  </body>
</html>

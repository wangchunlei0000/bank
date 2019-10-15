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
    
    <title>贷款客户信息核对</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/input.css">
	<%
	    Account account=(Account)session.getAttribute("daikuan");
	    session.setAttribute("dai",account);
	 %>
	 <%
	    bean.User user=(bean.User)session.getAttribute("form");
	    session.setAttribute("useridSession",user.getUserid());
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
  <body>
  <center>
 <br/><br/>
      <div>
  <h3>贷款业务办理成功，请核对贷款客户信息</h3>
  <form name="mainform" action="TradeServlet?method=5&sign=23" method="post">
  <table width="639" border="1" cellpadding="0" cellspacing="0" bordercolor="#fffff" bgcolor="#CDCDCD" height="315">
  	<tr>
    	<td width="200" height="50" align="center" valign="middle">客户姓名：</td>
    	<td><%=account.getAccname() %></td>
  	</tr>
  	<tr>
    	<td width="200" height="50" align="center" valign="middle">客户身份证号：</td>
    	<td><%=account.getAccsfzh() %></td>
  	</tr>
  	<tr>
    	<td width="200" height="50" align="center" valign="middle">客户贷款金额：</td>
    	<td><%=account.getLoanmoney() %></td>
  	</tr>
  	<%
  	    String times=null;
  	    if(account.getTimeid()==31){
  	        times="三年";
  	    } else if(account.getTimeid()==32){
  	        times="五年";
  	    } else if(account.getTimeid()==33){
  	        times="十年";
  	    } else if(account.getTimeid()==34){
  	        times="二十年";
  	    } else if(account.getTimeid()==35){
  	        times="三十年";
  	    }
  	    
  	 %>
  	<tr>
    	<td width="200" height="50" align="center" valign="middle">客户贷款期限：</td>
    	<td><%=times %></td>
  	</tr>
  	<tr>
    	<td width="200" height="50" align="center" valign="middle">客户还款方式：</td>
    	<td><%=account.getLoantype() %></td>
  	</tr>
  	<tr>
    	<td width="200" height="50" align="center" valign="middle">客户预留手机号:</td>
    	<td><%=account.getAcctel() %></td>
  	</tr>
  	
     
  	
</table>  	<input class="bu" type="submit" value=" 确定  ">
</form>  
</div>
 
</center>
</body>
</html>

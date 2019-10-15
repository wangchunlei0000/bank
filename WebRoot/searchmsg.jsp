<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="bean.Account" %>
<%@ page import="ctrl.AccountCtrl" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>客户信息显示界面</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/input.css">

  <%
    List accountList=(List)session.getAttribute("accountList"); 
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
  <center>
  <div ><br/><br/>
    <h2>该客户的账号信息如下</h2>
    <form name="mainform" action="main.jsp" method="post">
    <table width="800" border="1" cellspacing="0" cellpadding="0" bordercolor="#fffff" bgcolor="#CDCDCD">
    	<tr height="30"  align="center">
    		<th>账号</th>
    		<th>开户时间</th>
    		<th>业务类型</th>
    		<th>账号余额</th>
  		</tr>
  		  <% 
    		   for(int i=0;i<accountList.size();i++){
    		      Account account=(Account)accountList.get(i);
    		      String type=null;
    		      Integer id=account.getTratypeid();
    		      if(id==1){
    		          type="活期";
    		      }else if(id==2){
    		          type="定期";
    		      }else if(id==3){
    		          type="贷款";
    		      }
    	  %>
  		<tr height="30"  align="center">
    		<td width="200"><%=account.getAccid()%></td>
    		<td width="200"><%=account.getStdate()%></td>
    		<td width="200"><%=type%></td>
    		<td width="200"><%=account.getMoney()%></td>
  		</tr>  	
  		<%} %>	
  	</table>
  	<table width="500" border="0" cellspacing="1" cellpadding="0">
  		<tr height="50"  align="center">
    		<td colspan="2" align="left" valign="middle">
    			
  		</tr>
  	</table>
  	</form>
  	</div>
  </center>
  </body>
</html>

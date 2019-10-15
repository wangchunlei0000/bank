<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="bean.Account" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName

()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>定期存款成功</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/input.css">
    <%
	    Account account=(Account)session.getAttribute("accid");
	%>

  </head>
    <style type="text/css">
    body{
    background:url("img/bbb.jpg");
    background-attachment: fixed;
	 background-repeat: no-repeat;
	 background-size: cover;
	
}

.aa{
margin: 0px;
        padding: 0px;
        background: url(img/bg_4.jpg) no-repeat;
        background-size: 100% 100%;
        width: 100%;
        height: 100%;
    top: 0px;
    left: 0px;
    position: absolute;
}

</style>
  <body  >
  <center>
<br/><br/>
      <div >
  <h3>定期存款业务办理成功</h3>
  <form name="mainform" action="dingqi_cunkuan.jsp" method="post" onsubmit="return check();">
  	<table width="800" border="1" cellspacing="0" cellpadding="0" bordercolor="#fffff" bgcolor="#CDCDCD">
    	<tr height="30"  align="center">
    		<th>存款账号</th>
    		<th>存款期限</th>
    		<th>存款金额</th>
    		<th>存款到期日</th>
  		</tr>
        <%
  	    String time=null;
  	    if(account.getTimeid()==2){
  	        time="三个月";
  	    }
  	    if(account.getTimeid()==3){
  	        time="六个月";
  	    }
  	    if(account.getTimeid()==4){
  	        time="一年";
  	    }
  	    if(account.getTimeid()==5){
  	        time="两年";
  	    }
  	    if(account.getTimeid()==6){
  	        time="三年";
  	    }
  	    if(account.getTimeid()==7){
  	        time="五年";
  	    }
  	 %>
  		<tr height="30"  align="center">
    		<td width="200"><%=account.getAccid()%></td>
    		<td width="200"><%=time%></td>
    		<td width="200"><%=account.getMoney()%></td>
    		<td width="200"><%=account.getEndate()%></td>
  		</tr>  		
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

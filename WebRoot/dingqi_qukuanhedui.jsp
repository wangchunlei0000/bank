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
    
    <title>定期取款信息核对页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/input.css">
	<script type="text/javascript">
    function on_submit(){
       if(mainform.tramoney.value==""){
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
        Account account=(Account)session.getAttribute("account");
        session.setAttribute("accountid",account.getAccid());
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
  <body>
  <center>

      <div >
  <form name="mainform" action="TradeServlet?method=3&sign=21" method="post" onsubmit="return on_submit()" >
    <table width="495" border="0" cellspacing="0" cellpadding="0" height="171">
  	    <tr>
    	    <td height="50" colspan="2" align="center" valign="middle">&nbsp;</td>
  	    </tr>
  	    <tr>
    	    <td height="50" colspan="2" align="center" valign="middle"><h2>该定期账户的存款信息如下</h2></td>
  	    </tr>
  	</table>
  	<table width="800" border="1" cellspacing="0" cellpadding="0" bordercolor="#fffff" bgcolor="#CDCDCD">
    	<tr height="30"  align="center">
    		<th>开户日期</th>
    		<th>存款期限</th>
    		<th>存款到期日</th>
    		<th>定期存款</th>
    		<th>账户余额</th>
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
    		<td width="200"><%=account.getStdate().substring(0,10) %></td>
    		<td width="200"><%=time %></td>
    		<td width="200"><%=account.getEndate() %></td>
    		<td width="200"><%=account.getDmoney() %></td>
    		<td width="200"><%=account.getMoney() %></td>
  		</tr>  		
  	</table>
  	<table width="507" border="0" cellspacing="0" cellpadding="0" height="94">
  	<tr>
    	<td width="150" height="50" align="left" valign="middle">请输入金额：</td>
    	<td><input type="text" name="tramoney"></td>
  	</tr>
  	<tr align=center>
  	<td colspan=2>
  		<a href="dingqi_qukuansuccess.jsp" onclick="return confirm('确定取款吗？');" target="_top"><input class="bu" type="submit" value=" 确定  "></a>&nbsp;&nbsp;&nbsp;</td>
  		
  	</tr>
  	
</table> 
</form> 
</div>
	
</center>
</body>
</html>
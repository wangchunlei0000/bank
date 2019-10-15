<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="bean.Trade" %>
<%@ page import="bean.Account"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>定期取款成功</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/input.css">
	<%
	    Integer userid=(Integer)session.getAttribute("useridSession");
	    session.setAttribute("useridSession",userid);
	    List tradeList=(List)session.getAttribute("jilulist");
	    Account account=(Account)session.getAttribute("dingqiAccount");
	 %>
  <style type="text/css">
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
  <form name="mainform" action="dingqi_qukuan.jsp" method="post">
  	  <table width="620" border="0" cellspacing="0" cellpadding="0">
  	<tr>
    	<td width="300" height="50"> <br>&nbsp;</td>
  	</tr>
  	<tr>
    	<td width="300" height="50">&nbsp;</td>
  	</tr>
  	<tr>
    	<td colspan="2"><h2>该账户的取款明细如下：</h2></td>
  	</tr>
  	<tr>
    	<td width="600" valign="bottom">
    		<table width="600" border="1" align="center" cellpadding="1" cellspacing="0" bordercolor="#fffff" bgcolor="#CDCDCD">
    			<tr align="center">
    				<th>账号</th>
    				<th>日期</th>
    				<th>摘要</th>
    				<th>交易金额</th>
    				<th>利息</th>
    				<th>余额</th>
    			</tr>
    			<% 
    			   for(int i=0;i<tradeList.size();i++){
    			       Trade trade=(Trade)tradeList.get(i);
    			       String str=trade.getTradate();
    			       String time=str.substring(0,10);
    			       Double interest=trade.getInterest();
    			       String type=null;
    			       if(trade.getTramoney()==0.00){
    			         type="结息";
    			       }else{
    			         type="取款";
    			       }
    			%>
    			<tr align="center">
    				<td width="120"><%=trade.getAccid() %></td>
    				<td width="120"><%=time %></td>
    				<td width="120"><%=type %></td>
    				<td width="120"><%=(-1)*trade.getTramoney()%></td>
    				<td width="120"><%=trade.getInterest()%></td>
    				<td width="120"><%=trade.getMoney()%></td>
    			</tr>
    			<%} %>   		
    		</table>
    	</td>
  	</tr>
  	<tr>
  		<td colspan="2">&nbsp;</td>
  	</tr>
    <tr align="center">
    	<td >
    		<table width="600" border="1" align="center" cellpadding="1" cellspacing="0" bordercolor="#fffff" bgcolor="#CDCDCD">
    			<tr align="center">
    				<td>定期金额</td>
    				<td><%=account.getDmoney() %></td>
    			</tr>
    			<tr align="center">
    				<td>到期日</td>
    				<td><%=account.getEndate() %></td>
    			</tr>
    			<tr align="center">
    				<td>余额</td>
    				<td><%=account.getMoney()%></td>
    			</tr>
    		</table>
    	
    	</td>
    </tr> 
    <tr><td>&nbsp;</td></tr>
  	<tr align="center">
    	
  	</tr>
</table>
</form>  
</div>
	
</center>
</body>
</html>

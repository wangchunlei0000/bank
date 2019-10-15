<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="bean.Trade" %>
<%@ page import="ctrl.TradeCtrl" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>存款成功</title>
    
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
  <center>
  
      <div >
  <form name="mainform" action="cunkuan.jsp" method="post" onsubmit="return check();">
  <table width="620" border="0" cellspacing="0" cellpadding="0">
  	<tr>
    	<td width="300" height="50"><br>&nbsp;</td>
  	</tr>
  	<tr>
    	<td width="300" height="50">&nbsp;</td>
  	</tr>
  	<tr>
    	<td colspan="2" align="center"><h4>存款成功！该账户的存款明细如下</h4></td>
  	</tr>
  	<tr>
    	<td width="600" valign="bottom">
    		<table width="704" border="1" align="center" cellpadding="1" cellspacing="0" bordercolor="#fffff" bgcolor="#CDCDCD" height="117">
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
    			         type="存款";
    			       }
    			       if(i==0){
    			         interest=0.00;
    			       }
    			%>
    			<tr align="center">
    				<td width="120"><%=trade.getAccid() %></td>
    				<td width="120"><%=time %></td>
    				<td width="120"><%=type%></td>
    				<td width="120"><%=trade.getTramoney()%></td>
    				<td width="120"><%=interest%></td>
    				<td width="120"><%=trade.getMoney()%></td>
    			</tr>
    			<%} %>   		
    		</table>
    	</td>
  	</tr>
  	<tr>
  		<td colspan="2">&nbsp;</td>
  	</tr>
  
</table>
</form>   
</div>

  </center>
  </body>
</html>

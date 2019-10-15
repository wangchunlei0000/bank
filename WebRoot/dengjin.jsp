<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="bean.Account" %>
<%@ page import="bean.TimeType" %>
<%@ page import="ctrl.TimeTypeCtrl" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>等额本金还款</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/input.css">
	<%
	    String str=(String)session.getAttribute("chuan");
	   // System.out.println("str:"+str);
	    String[] chuanArray = str.split(" ");
	    String sum=null;
		String fmonth=null;
		String jian=null;
		String lixi=null;
		for (int i = 0; i < chuanArray.length; i++) {
		    if(i==0){
		    	sum=chuanArray[i];//还款总额
		    }else if(i==1){
		    	fmonth=chuanArray[i]; //首月
		    }else if(i==2){
		    	jian=chuanArray[i];//每月递减
		    }else if(i==3){
		    	lixi=chuanArray[i];//利息
		    }
		}
		Account account=(Account)session.getAttribute("daik");
		TimeTypeCtrl timeTypeCtrl = new TimeTypeCtrl();
	    TimeType timeType=new TimeType();
	    timeType=timeTypeCtrl.getRate(account.getTimeid());
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
  
   <div >
  <table>
  	<tr height="100">
  		<td></td>
  	</tr>
  </table>
  <h4>逐月递减还款</h4>
   <form name="mainform" action="xindai.jsp" method="post" >
    <table width="450" border="1" cellspacing="0" cellpadding="0" bordercolor="#fffff" bgcolor="#CDCDCD" height="263">
    	<tr height="30"  align="center">
    		<td width="150" align="center" valign="middle">贷款总额</td>
    		<td><%=account.getLoanmoney() %>元</td>
  		</tr>
  		<tr height="30"  align="center">
  			<td width="150" align="center" valign="middle">还款月数</td>
    		<td><%=timeType.getTimes() %>个月</td>
    	</tr>
    	<tr height="30"  align="center">
    		<td width="150" align="center" valign="middle">首月还款</td>
    		<td><%=fmonth %>元</td>
  		</tr>
  		<tr height="30"  align="center">
    		<td width="150" align="center" valign="middle">依次递减</td>
    		<td><%=jian %>元</td>
  		</tr>
  		<tr height="30"  align="center">
  			<td width="150" align="center" valign="middle">总支付利息</td>
    		<td><%=lixi %>元</td>
    	</tr>
    	<tr height="30"  align="center">
    		<td width="150" align="center" valign="middle">本息合计</td>
    		<td><%=sum %>元</td>
  		</tr>
  		
  		<tr height="50"  align="center">
    		<td colspan="2">
    			<input class=bu type="submit" value="返回 " ></td>
  		</tr>
  	</table>
    </form>
    </div>
 
    </center>
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>柜员登录界面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/input.css">
    <link rel="stylesheet" type="text/css" href="css/pp.css">
<script language="javascript" type="text/javascript">
	function check(){
  	    var tno=document.getElementById("userid").value;
		var pwd=document.getElementById("pwd").value;
		//var yzm=document.getElementById("yzm").value;
		if(tno==""){
			alert("用户名不能为空！");
			return false;
		}
		if(pwd==""){
			alert("密码不能为空！");
			return false;
		}
		return true;
	}
	  
</script>
	<link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
  </head>
  
<body onload="createCode()" >
<div class="slide">
    <ul class="slide-auto">
        <li><img class="bo" src="img/three.jpg"/></li>
        <li><img class="bo" src="img/two.jpg"/></li>
        <li><img class="bo" src="img/four.jpg"/></li>
    </ul>  
</div>
<font style="position:absolute; top:100px;left: 320px; height: 435px;" color="white" size="7">银行业务系统</font><center>
<div class="bef" style="top: 186px; left: 304px; height: 435px;">
    <form name="form1" method="post" action="UserServlet?method=2&sign=0" onSubmit="return check()">
			<div class="login-head">
				<br><center><h1>&nbsp;<font size="7">柜员登录</font></h1></center>
				</div><br/>
				<div class="login-head1">
				<a href="adminlogin.jsp">管理员登录</a><br><br><a href="yhlogin.jsp">用户登录</a><br/><br/><font size="5">用 户 名&nbsp;</font><input type="text" name="userid" id="userid" placeholder="请输入用户名"><br></div><br>
    			<font size="5">密&nbsp;&nbsp;&nbsp;码&nbsp;</font> 
    			 <input type="password" name="userpwd" id="pwd" placeholder="请输入密码"><br><br/>
    			<input class="bu" type="submit" value="登录 " >&nbsp;&nbsp;
    			<input class="bu" type="reset" value="重置 ">&nbsp;&nbsp;

     </form>
</div>
</center>

	
</body>
</html>

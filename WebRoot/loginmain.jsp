<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/input.css">
  <style>
   body{font-family:幼圆;
   }
   *{
   text-align:center；
   }
 
.nav{
  
  font:bold 0/50px 幼圆;
  text-align:center;
  margin-top:0;
  margin-left:0;
  margin-right:0;
  margin-bottom:5;
  background: black;
  box-shadow:0 5px 1px 0 red;
}
.nav a{
  display: inline-block;
  -webkit-transition: all 0.2s ease-in;
  -moz-transition: all 0.2s ease-in;
  -o-transition: all 0.2s ease-in;
  -ms-transition: all 0.2s ease-in;
  transition: all 0.2s ease-in;
}
.nav a:hover{
  -webkit-transform:rotate(10deg);
  -moz-transform:rotate(10deg);
  -o-transform:rotate(10deg);
  -ms-transform:rotate(10deg);
  transform:rotate(10deg);
}

.nav li{
  position:relative;
  display:inline-block;
  padding:0 16px;
  font-size: 13px;
  /**text-shadow:1px 2px 4px rgba(0,0,0,.5);*/
  list-style: none outside none;
}
/*使用伪元素制作导航列表项分隔线*/
.nav li:before{
      content:"";   
      position:absolute;
      top:14px;
      height:25px;
      width:1px;
      left:-1px;
      background-image:linear-gradient(to bottom,red,white,orange);
}
  
/*删除第一项和最后一项导航分隔线*/
.nav li:first-child:before{
      background:none; 
}
.nav a{
  color:#fff;/**字体颜色*/
  text-decoration: none;
}

.nav a:hover{
  color:blue;/**字体颜色*/
  text-decoration: none;
}



.dropdown {
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align:center;
    display:block;
    width:140px;
    height:30px;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
    display: block;
}

</style>
</head>
  <body>
 <%
	    bean.User user=(bean.User)session.getAttribute("form");
	    session.setAttribute("useridSession",user.getUserid());
 %>
  <div>
  	<ul class="nav">
  		<li><font size="5"><a href="loginmain.jsp">柜员页面</a></font></li>
  		
  		<li class="dropdown"><font size="5"><a href="loginmain.jsp">活期业务</a></font>
    	<div class="dropdown-content">
      		<a href="kaihu.jsp"target="mainly"><font size="4">活期开户</font></a>
            <a href="cunkuan.jsp"target="mainly"><font size="4">活期存款</font></a>                 	
            <a href="qukuan.jsp"target="mainly"><font size="4">活期取款</font></a>
            <a href="xiaohu.jsp"target="mainly"><font size="4">活期销户</font></a>
            <a href="guashi.jsp"target="mainly"><font size="4">账户挂失</font></a>
            <a href="jiegua.jsp"target="mainly"><font size="4">账户解挂</font></a>
   		</div>
 	 	</li>
 	 	<li class="dropdown"><font size="5"><a href="loginmain.jsp">定期业务</a></font>
    	<div class="dropdown-content">
      		<a href="dingqi_cunkuan.jsp"target="mainly"><font size="4">定期存款</font></a>
            <a href="dingqi_qukuan.jsp"target="mainly"><font size="4">定期取款</font></a>     
   		</div>
 	 	</li>
 	 	<li class="dropdown"><font size="5"><a href="loginmain.jsp" >贷款业务</a></font>
    	<div class="dropdown-content">
      		<a href="xindai.jsp"target="mainly"><font size="4">住房贷款</font></a>     
   		</div>
 	 	</li>
 	 	<li class="dropdown"><font size="5"><a href="loginmain.jsp">查询业务</a></font>
    	<div class="dropdown-content">
      		<a href="search.jsp"target="mainly"><font size="4">查询账户信息</font></a>
    	    <a href="nowlilv.jsp"target="mainly"><font size="4">查询当前利率</font></a>     
   		</div>
 	 	</li>
 	 	<li class="dropdown"><font size="5"><a href="loginmain.jsp">修改业务</a></font>
 	 	<div class="dropdown-content">
      		<a href="update.jsp"target="mainly"><font size="4">修改账户信息</font></a>
        
   		</div>
 	 	</li>
 	 	<li class="dropdown"><font size="5"><a href="loginmain.jsp">用户中心</a></font>
    	<div class="dropdown-content">
      		<a href="chakanuser.jsp"target="mainly"><font size="4">用户名</font></a>
            <a href="login.jsp"><font size="4">退出</font></a>     
   		</div>
 	 	</li>
    </ul>
  </div>
  <div>
   
  		<iframe src ="test.jsp" name="mainly" frameborder="0" marginheight="50px" marginwidth="0" height="100%" width="100%"></iframe>
  </div>
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/input.css">
<style>
   a {
    display: block;
          font-family: "幼圆","Open Sans","Helvetica Neue",Arial,sans-serif;
          position: relative;
          line-height: 36px;
          color: white;
          font-size: 25px;
          text-decoration: none;
          padding: 6px 8px 6px 16px;
        }

      a:hover {
          color: #F08080;
          font-size:30px;
        }         
       a:before {
          content: "";
          position: absolute;
          width: 100%;
          height: 2px;
          bottom:-5px;
          left: 0;
          background-color: #DC143C;
          visibility: hidden;
          -webkit-transform: scaleX(0);
          -o-transform: scaleX(0);
          transform: scaleX(0);
          -webkit-transition: all 0.3s ease-in-out 0s;
          -o-transition: all 0.3s ease-in-out 0s;
          transition: all 0.3s ease-in-out 0s;
        }         
      a:hover:before {
          visibility: visible;
          -webkit-transform: scaleX(1);
          -o-transform: scaleX(1);
          transform: scaleX(1);
        }  
li {
    float: left;
}
body {
    font-family: "Lato", sans-serif;
    background:url(img/1.jpg);
    background:no-repeat;
    font-face:幼圆;
    
}

.sa {
    height: 100%;
    width: 180px;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color:black;
    overflow-x: hidden;
    padding-top: 20px;
}

.main {
    margin-left: 180px; /* 与sidenav的宽度相同 */
    font-size: 28px; /* 字体放大，让页面可滚动 */
    padding: 0px 0px;
    
}

@media screen and (max-height: 450px) {
    .sidenav {padding-top: 0px;}
    .sidenav a {font-size: 0px;}
}

</style>
<% bean.Account account = (bean.Account)session.getAttribute("form1");
   session.setAttribute("accidSession",account.getAccid());%>

</head>
  
  <body style=" margin:0;padding:0;overflow:hidden" >
<div class="sa"> 
    <br/><br/><br/><center><font size="6" color="#ffffff" face="幼圆"><span>欢迎登录</span></font></center><br/><br/><br/><br/><br/>
    <center>
 		 <font face="幼圆">
 		 <a href="yhsearch.jsp" target="mainly">查询明细</a>
 		 <a href="" target="mainly">转账业务</a>
 		 <a href="" target="mainly">贷款还款</a>
 		 <a href="" target="mainly">定期利率</a>
 		 <a href="" target="mainly">贷款利率</a>
 		 <a href="yhlogin.jsp">退出登录</a></font>	 	 
  </center>
</div>

<div class="main">
<iframe src ="test.jsp"  frameborder="0" scrolling="no" marginwidth="0" 
marginheight="0"name="mainly" height="100%" width="100%"></iframe>
        	 
</div>
  </body>
</html>

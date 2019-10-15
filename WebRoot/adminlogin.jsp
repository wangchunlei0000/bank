<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/input.css">
	<link rel="stylesheet" type="text/css" href="css/pp.css">
	<link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
<style type="text/css">  
 	.code
    {
            background:url(bbb.jpg);
            font-family:幼圆;
            font-style:italic;
             color:	#2F4F4F;
             font-size:30px;
             border:0;
             padding:2px 3px;
             letter-spacing:3px;
             font-weight:bolder;             
             float:left;            
             cursor:pointer;
             width:150px;
             height:60px;
             line-height:60px;
             text-align:center;
             vertical-align:middle;

    }
   

</style>

<script language="javascript" type="text/javascript">
	var code;
	function createCode(){
		code="";
        var codeLength = 4; //验证码的长度
        var checkCode = document.getElementById("checkCode");
        var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
		'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
		'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //所有候选组成验证码的字符，当然也可以用中文的
		for (var i = 0; i < codeLength; i++){
			var charNum = Math.floor(Math.random() * 52);
			code += codeChars[charNum];
		}
		if (checkCode){
			checkCode.className = "code";
			checkCode.innerHTML = code;
		}
	}
	function validateCode(){
		var inputCode = document.getElementById("yzm").value;
		var tmp = code;
		document.getElementById("test").value = tmp;
		if (inputCode.length <= 0){
			//alert("请输入验证码！");
			return false;
		}else if (inputCode.toUpperCase() != code.toUpperCase()){
			//alert("验证码输入有误！");
			return false;
			createCode();
		}else{
			//alert("验证码正确！");
			return true;
		}        
	}
	
		
	function check(){
  	    var tno=document.getElementById("tno").value;
		var pwd=document.getElementById("pwd").value;
		var yzm=document.getElementById("yzm").value;
		if(tno==""){
			alert("用户名不能为空！");
			return false;
		}
		if(pwd==""){
			alert("密码不能为空！");
			return false;
		}
		if(yzm==""){
			alert("验证码不能为空！");
			return false;
		}
		return true;
	}	  
</script>
<script language="javascript"> 
function changeColor()

{ 
var color="#f00|#0f0|#00f|#880|#808|#088|yellow|green|blue|gray"; 
color=color.split("|"); 
document.getElementById("blink").style.color=color[parseInt(Math.random() * color.length)]; 
} 
setInterval("changeColor()",200); 
</script>
</head>
<body onload="createCode()" >
   <div class="slide">
    <ul class="slide-auto">
        <li><img class="bo" src="img/three.jpg"/></li>
        <li><img class="bo" src="img/two.jpg"/></li>
        <li><img class="bo" src="img/four.jpg"/></li>
    </ul>  
</div><font style="position:absolute; top:100px;left: 320px; height: 435px;" color="white" size="7">银行业务系统</font><center>
		<div class="bef" style="top: 186px; left: 304px; height: 537px; width: 541px;">
			<form name="form1" method="post" action="UserServlet?method=3&sign=12" onSubmit="return on_submit()">
				<font size="5px"><br><font size="7"><br>管&nbsp;理&nbsp;员&nbsp;登&nbsp;录</font></font><br/><br/>
				<a href="login.jsp">用户登录</a><br><br/> 
    			<font size="4">用&nbsp;户&nbsp;名：</font><input type="text" name="userid" id="userid" placeholder="请输入用户名"><br><br>  
    			<font size="4">密&nbsp; &nbsp; 码：</font><input type="password" name="userpwd" id="userpwd" placeholder="请输入密码"><br><br/> 
    			<font size="4">验&nbsp;证&nbsp;码：</font><input type="text" id="yzm" name="yzm" placeholder="请输入验证码"/>
        		<table border="0" cellspacing="5" cellpadding="5" >
                    <tr>
                        <td>
                        	<div class="code" id="checkCode" onclick="createCode()" ></div>
                        </td>
                        <td>
                        	<a onclick="createCode()">看不清换一张<br></a>
                        </td>
                    </tr>
   				</table>&nbsp; 
        		<input id="test" type="hidden" name="test">	
        		<input class="bu" type="submit" value="登录 " onclick="validateCode();">&nbsp;&nbsp;
    			<input class="bu" type="reset" value="重置 ">&nbsp;&nbsp;

     		</form>
		</div>
	</center>

	
</body>
</html>

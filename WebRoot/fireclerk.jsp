<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改职员状态页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/input.css">
<script type="text/javascript">
	function on_submit(){
		var City={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",
    	    	31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",
    	    	43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",
    	    	61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"}
    	var num=0;
    	var info="";
    	for(var i=17;i>=0;i--){
       	  num+=(Math.pow(2,i)%11)*parseInt(mainform.adminsfzh.value.charAt(17-i),11);
       	}
    	Birthday=mainform.adminsfzh.value.substr(6,4)+"-"+Number(mainform.adminsfzh.value.substr(10,2))+"-"+Number(mainform.adminsfzh.value.substr(12,2));
    	var birth=new Date(Birthday.replace(/-/g,"/")) ;
    	if(mainform.adminname.value==""){
      		alert("请输入离职员工姓名！")
      		mainform.adminname.focus()
      		return false;
        }else if(mainform.adminsfzh.value==""){
      		alert("请输入离职人员身份证号！")
      		mainform.adminsfzh.focus()
      		return false;
        }else if(!/^\d{17}(\d|x)$/i.test(mainform.adminsfzh.value)){
      		alert("您输入的身份证长度或格式错误！")
      		mainform.adminsfzh.focus()
      		return false;
        }else if(City[parseInt(mainform.adminsfzh.value.replace(/x$/i,"a").substring(0,2))]==null){
    	  	alert("您输入的身份证地区非法！")
    		mainform.adminsfzh.focus()
    		return false;
        }else if(Birthday!=(birth.getFullYear()+"-"+ (birth.getMonth()+1) + "-" + birth.getDate())){
    	  	alert("身份证上的出生日期非法")
    		mainform.adminsfzh.focus()
    		return false;
        }else if(num%11!=1){
    		alert("您输入的身份证号非法！")
  			mainform.adminsfzh.focus()
  			return false;
		}else if(mainform.adminid.value==""){
      		alert("请输入离职人员的职工号！")
      		mainform.adminid.focus()
      		return false;
        }else if(!(/^[0-9]\d{5}$/.test(mainform.adminid.value))){
      		alert("请正确输入离职人员的职工号！")
      		mainform.adminid.focus()
      		return false;
        }else{
			return true;
		}
    }
    </script>
    <style type="text/css">
    
body{
    background:url("img/1.jpg");
    animation-name:myfirst;
    animation-duration:12s; 
    animation-delay:2s;
    animation-iteration-count:infinite;
    animation-play-state:running;

}
@keyframes myfirst
{
    0%   {background:url("img/1.jpg");}
    25%  {background:url("img/2.jpg");}
    50%  {background:url("img/3.jpg");}
    75%  {background:url("img/1.jpg");}
    100% {background:url("img/1.jpg");}
}
	
   .setborder{
	border-style:solid;
	border-width:1px;
	border-color:#696969;
	border-radius: 30px;
	margin-left:28%;
	margin-top:8%;
	width: 500px;
	height: 500px;
	position: absolute;
	background: rgba(255,255,255,0.5);
}
  body{font-family:幼圆;}
       
</style>
  </head>
  
  <body>
 
	<div class="setborder" style="top: 8px; height: 397px; left: 39px; width: 469px;">
  <center>
    <h2><br></h2><h2>请输入离职员工的信息</h2>
    <form name="mainform" action="UserServlet?method=4&sign=14" method="post" onsubmit="return on_submit()">
    <table border="0" cellspacing="1" cellpadding="1" style="left: 66px;">
    	<tr height="50"  align="center">
    		<td align="left" valign="middle">姓&nbsp; 名：</td>
    		<td><input type="text" name="username"></td>
  		</tr>
    	<tr height="50"  align="center">
    		<td align="left" valign="middle">身份证号：</td>
    		<td><input type="text" name="usersfzh"></td>
  		</tr>
  		<tr height="50"  align="center">
    		<td align="left" valign="middle">职工号：</td>
    		<td><input type="text" name="userid"></td>
  		</tr>
  		
  	</table>
  	<br/><center><input class="bu" type="submit" name="submit" value="  确定  "></center>
  	</form>
  </center>
  </div>
  </body>
</html>

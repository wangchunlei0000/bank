<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="util.CountTime" %>
<jsp:useBean id="countTime" scope="session" class="util.CountTime"></jsp:useBean>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName

()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>定期存款页面</title>
	
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
       	  num+=(Math.pow(2,i)%11)*parseInt(mainform.accsfzh.value.charAt(17-i),11);
       	}
    	Birthday=mainform.accsfzh.value.substr(6,4)+"-"+Number(mainform.accsfzh.value.substr(10,2))+"-"+Number(mainform.accsfzh.value.substr(12,2));
    	var birth=new Date(Birthday.replace(/-/g,"/")) ;
        if(mainform.accname.value==""){
       		alert("请输入客户姓名！")
       		mainform.accname.focus()
       		return false;
        }else if(mainform.accsfzh.value==""){
      		alert("请输入客户身份证号！")
      		mainform.accsfzh.focus()
      		return false;
        }else if(!/^\d{17}(\d|x)$/i.test(mainform.accsfzh.value)){
      		alert("你输入的身份证长度或格式错误！")
      		mainform.accsfzh.focus()
      		return false;
        }else if(mainform.accpwd.value==""){
          	alert("请输入客户存取款密码！");
         	mainform.accpwd.focus();
          	return false;
      	}else if(!(/^[0-9]\d{5}$/.test(mainform.accpwd.value))){
          	alert("请输入六位数字密码密码！");
         	mainform.accpwd.focus();
          	return false;
      	}else if(mainform.accrepwd.value==""){
          	alert("确认密码不能为空，请输入确认密码！");
          	mainform.accrepwd.focus();
          	return false;
      	}else if(mainform.accpwd.value!=mainform.accrepwd.value){
       		alert("密码与确认密码不一致，请重新输入确认密码");
       		mainform.accrepwd.value="";
       		mainform.accrepwd.focus();
       		return false;
       	}else if(mainform.tramoney.value==""){
            alert("请输入存款金额！");
            mainform.tramoney.focus();
            return false;
        }else if(mainform.tramoney.value<=0){
            alert("请输入正确的存款金额！");
            mainform.tramoney.focus();
            return false;
        }else if(City[parseInt(mainform.accsfzh.value.replace(/x$/i,"a").substring(0,2))]==null){
    	  	alert("你输入的身份证地区非法！")
    		mainform.accsfzh.focus()
    		return false;
        }else if(Birthday!=(birth.getFullYear()+"-"+ (birth.getMonth()+1) + "-" + birth.getDate())){
    	  	alert("身份证上的出生日期非法")
    		mainform.accsfzh.focus()
    		return false;
        }else if(num%11!=1){
    		alert("您输入的身份证号非法！")
  			mainform.accsfzh.focus()
  			return false;
		}else if(mainform.acctel.value==""){
   			alert("请输入客户手机号！")
 			mainform.acctel.focus()
 			return false;
 	  	}else if(!(/^1[34578]\d{9}$/.test(mainform.acctel.value))){ 
      		alert("手机号码格式有误，请重新输入！"); 
    		mainform.acctel.focus(); 
    		return false; 
		}else if(mainform.accid.value==""){
			alert("请输入客户账号！")
			mainform.accid.focus()
			return false;
	  	}else if(!( /^\d{19}$/g.test(mainform.accid.value))){ 
	      	alert("账号输入错误，请重新输入！"); 
	    	mainform.accid.focus(); 
	    	return false; 
		}else{
    	   return true;
       }
 	  
    }
    </script>
  <%
	bean.User user=(bean.User)session.getAttribute("form");
	session.setAttribute("useridSession",user.getUserid());
    %>
     <style type="text/css">
.setbg{
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
	.setborder{
		border-style:solid;
		border-width:2px;
		border-color:#0099cc;
		border-radius: 30px;
		width: 400px;
		height: 400px;
		position: absolute;
		top:100px;
		left: 500px;	
		background: rgba(255,255,255,0.2);
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
  
	<div><br/>
  	<center>
  	<h2>请输入存款账户信息</h2>
    <form name="mainform" action="AccountServlet?method=5&sign=6" method="post" onSubmit="return on_submit()">
    <table width="400"  >
    	<tr height="30"  align="center">
    		<td align="left" valign="middle">姓名：</td>
    		<td><input type="text" name="accname"></td>
  		</tr>
  		<tr height="30"  align="center">
    		<td align="left" valign="middle">性别：</td>
    		<td><input type="radio" name="accsex" id="accsex" value="0" checked/>男
  				<input type="radio" name="accsex" id="accsex" value="1"/>女
  			</td>
  		</tr>
    	<tr height="30"  align="center">
    		<td align="left" valign="middle">身份证号：</td>
    		<td><input type="text" name="accsfzh"></td>
  		</tr>
  		<tr height="30"  align="center">
    		<td align="left" valign="middle">手机号：</td>
    		<td><input type="text" name="acctel"></td>
  		</tr>
  		<tr height="30"  align="center">
    		<td align="left" valign="middle">密码：</td>
    		<td><input type="password" name="accpwd"></td>
  		</tr>
  		<tr height="30"  align="center">
    		<td align="left" valign="middle">确认密码：</td>
    		<td><input type="password" name="accrepwd"></td>
  		</tr>
  		<tr height="30"  align="center">
    		<td align="left" valign="middle">存款金额：</td>
    		<td><input type="text" name="tramoney"></td>
  		</tr>
  		<tr height="30"  align="center">
    		<td align="left" valign="middle">存款期限:</td>
    		<td>
    			<select class="se" name="timeid" id="timeid">
      				<option value="2">三个月</option>
        			<option value="3">六个月</option>
        			<option value="4">一年</option>
        			<option value="5">两年</option>
        			<option value="6">三年</option>
        			<option value="7">五年</option>
      			</select>
      		</td>
  		</tr>
  		<tr height="30"  align="center">
    		
  		</tr>
  		<tr height="50"  align="center">
    		<td colspan=2>
    			<input class=bu type="submit" value="存款 "></td>
  		</tr>
  	</table>
    </form>
    </center>
     </div>
  </body>
</html>

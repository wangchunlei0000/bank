<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>信贷</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
      		alert("身份证号不能为空，请输入身份证号！")
      		mainform.accsfzh.focus()
      		return false;
        }else if(!/^\d{17}(\d|x)$/i.test(mainform.accsfzh.value)){
      		alert("你输入的身份证长度或格式错误！")
      		mainform.accsfzh.focus()
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
		}else if(mainform.tramoney.value==""){
			alert("请输入贷款金额！")
  			mainform.tramoney.focus()
  			return false;
		}else if(mainform.tramoney.value<=0){
			alert("请输入正确的贷款金额！")
  			mainform.tramoney.focus()
  			return false;
		}else if(mainform.accid.value==""){
			alert("请输入还款账号！")
			mainform.accid.focus()
			return false;
	  	}else if(!( /^\d{19}$/g.test(mainform.accid.value))){ 
	      	alert("账号输入错误，请重新输入！"); 
	    	mainform.accid.focus(); 
	    	return false; 
		}else if(mainform.acctel.value==""){
   			alert("手机号不能为空，请输入手机号！")
 			mainform.acctel.focus()
 			return false;
 	  	}else if(!(/^1[34578]\d{9}$/.test(mainform.acctel.value))){ 
      		alert("手机号码有误，请重新输入！"); 
    		mainform.acctel.focus(); 
    		return false; 
		}
		else{
    	   return true;
       }
    }
    
    </script>
	
  </head>
  
  <body background="images/bg1.jpg">
  	<center>
  	<h2>请输入贷款客户信息</h2>
    <form name="mainform" action="xindaihedui.jsp" method="post" onsubmit="return on_submit()">
    <table width="400" border="1" cellspacing="0" cellpadding="0" bordercolor="#fffff" bgcolor="#e2f0d9">
    	<tr height="36"  align="center">
    		<td align="left" valign="middle">姓名：</td>
    		<td><input type="text" name="accname"></td>
  		</tr>
  		<tr height="36"  align="center">
    		<td align="left" valign="middle">性别：</td>
    		<td><input type="radio" name="sex" id="sex" value="0" checked/>男
  				<input type="radio" name="sex" id="sex" value="1"/>女
  			</td>
  		</tr>
    	<tr height="36"  align="center">
    		<td align="left" valign="middle">身份证号：</td>
    		<td><input type="text" name="accsfzh"></td>
  		</tr>
  		<tr height="36"  align="center">
    		<td align="left" valign="middle">贷款证明：</td>
    		<td></td>
  		</tr>
  		<tr height="36"  align="center">
    		<td align="left" valign="middle">贷款金额：</td>
    		<td><input type="text" name="tramoney"></td>
  		</tr>
  		<tr height="36"  align="center">
    		<td align="left" valign="middle">贷款期限:</td>
    		<td>
    			<select name="select">
      				<option value="36">36个月</option>
        			<option value="60">60个月</option>
        			<option value="120">120个月</option>
        			<option value="240">240个月</option>
        			<option value="360">360个月</option>       			
      			</select>
      		</td>
  		</tr>
  		<tr height="36"  align="center">
    		<td align="left" valign="middle">还款账号：</td>
    		<td><input type="text" name="accid"></td>
  		</tr>
  		<tr height="36"  align="center">
    		<td align="left" valign="middle">银行预留手机号：</td>
    		<td><input type="text" name="acctel"></td>
  		</tr>
  		<tr height="36"  align="center">
    		<td align="left" valign="middle">还款方式:</td>
    		<td>
    			<select name="select">
      				<option value="等额本金">等额本金</option>
        			<option value="等额本息">等额本息</option>
      			</select>
      		</td>
  		</tr>
  		<tr height="36"  align="center">
    		<td colspan="2"><a href="uploadimg.jsp">上传贷款审核资料</a></td>
  		</tr>
  		<tr height="36"  align="center">
    		<td colspan="2">
    			<input type="submit" value="确定">&nbsp;&nbsp;&nbsp;
    			<input type="reset" value="重置"></td>
  		</tr>
  	</table>
    </form>
    </center>
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>客户信息查询页面</title>
    
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
           	  num+=(Math.pow(2,i)%11)*parseInt(mainform.accsfzh.value.charAt(17-i),11);
           	}
        	Birthday=mainform.accsfzh.value.substr(6,4)+"-"+Number(mainform.accsfzh.value.substr(10,2))+"-"+Number(mainform.accsfzh.value.substr(12,2));
        	var birth=new Date(Birthday.replace(/-/g,"/")) ;
           if(mainform.accsfzh.value==""){
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
    		}else{
			return true;
       }
    }
    </script>
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
  <center><br/><br/>
  <div >
    <h2>请输入客户账户信息</h2>
    <form name="mainform" action="AccountServlet?method=7&sign=9" method="post" onsubmit="return on_submit()">
    <table width="440" border="0" cellspacing="1" cellpadding="1" height="173">
    	<tr height="50"  align="center">
    		<td align="left" valign="middle">身份证号：</td>
    		<td><input type="text" name="accsfzh"></td>
  		</tr>
  		<tr height="50"  align="center">
    		<td colspan="2" align="center" valign="middle"><br/>
    			<input class=bu type="submit" value=" 确定  "></td>
  		</tr>
  	</table>
  	</form>
  	</div>
  </center>
  </body>
</html>

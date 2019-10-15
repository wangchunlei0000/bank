<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="util.CountTime"%>
<jsp:useBean id="countTime" scope="session" class="util.CountTime"></jsp:useBean>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>上传审核资料</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body background="images/bg1.jpg">
    <table align="center" id="table1" cellspacing="1px">
          <tr><td height="30px" align="center"><h3>审核资料上传</h3></td>
          </tr>
          <tr><td>
          <br>
          <table align="center" height="300px">
          <tr>
          <td valign="top" align="center">
          <form action="" method="post" name="form" onSubmit="return addPhoto()" enctype="multipart/form-data">
                    <table width="600" border="1" cellpadding="0" cellspacing="0" bordercolor="#fffff" bgcolor="#e2f0d9">
                      <tr>
                        <td width="100" height="40px"><div align="center">上传地址：</div></td>
                        <td width="500"  bgcolor="#e2f0d9">
                          <div align="center">
                            <input name="photoAddress" type="file" class="inputinput"  size="40">
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td height="40px"><div align="center">相片描述：</div></td>
                        <td  bgcolor="#e2f0d9">
                          <div align="center">
                            <input name="pdescription" type="text" class="inputinput"  size="40">
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td height="40"><div align="center">上传时间：</div></td>
                        <td  bgcolor="#e2f0d9">
                          <div align="center">
                            <input name="ptime" type="text" class="inputinput" onclick="alert('此文本框已设为只读，用户不能修改')" value="<%=countTime.currentlyTime() %>" size="40" readonly="readonly">
                          </div>
                        </td>
                      </tr>
                    </table>
                    <table width="600" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="600"><br>
				          <div align="center" class="style1">注意：图片的格式只能为：“JPG”,“jpg”,“gif”,“bmp”,“BMP”格式</div>
				        </td>
                      </tr>
                    </table>
                    <table width="600" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="600" align="center"><br>
				          	<input type="submit" name="submit" value="保存">&nbsp;&nbsp;&nbsp;&nbsp;
                    		<input type="reset" name="reset" value="重置">&nbsp;&nbsp;&nbsp;&nbsp;
                    		<a href="xindai.jsp">返回</a>
				        </td>
                      </tr>
                    </table>
                   </form>
				<%
				  if (request.getAttribute("result") != null) {
					out.print(request.getAttribute("result"));
				   }
				%>
				</td>
				</tr>
          </table>
          </td>
          </tr>
        </table>  
  </body>
</html>

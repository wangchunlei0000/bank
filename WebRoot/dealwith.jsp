<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage=""%>
<%@ page import="bean.Trade" %>
<%@ page import="java.util.List" %>
<%@page import="bean.Account"%>
<%
	Integer sign = Integer.valueOf(request.getParameter("sign"));
	if (sign == 0) {
		if (request.getAttribute("information") != null) {
			String information = (String) request.getAttribute("information");
			out.print("<script language=javascript>alert('"	+ information + "');history.go(-1);</script>");
		} else {
			session.setAttribute("form", request.getAttribute("form"));
			out.print("<script language=javascript>alert('用户登录成功！');window.location.href='loginmain.jsp';</script>");
		}
	}
	if (sign == 1) {
		String result = (String) request.getAttribute("result");
		if (result.equals("success")) {
		    session.setAttribute("accid", request.getAttribute("accid"));
			out.print("<script language=javascript>alert('开户成功！');window.location.href='kaihusuccess.jsp';</script>");
		}
		if (result.equals("fail")) {
			out.print("<script language=javascript>alert('开户失败！');history.go(-1);</script>");
		}
	}
	if (sign == 2) {
		if (request.getAttribute("information") != null) {
			String information = (String) request.getAttribute("information");
			out.print("<script language=javascript>alert('"	+ information + "');history.go(-1);</script>");
		} else {
		    bean.Account account=(bean.Account)request.getAttribute("xiaohuacc");
		    session.setAttribute("xiaohu",request.getAttribute("xiaohuacc"));
		    out.print("<script language=javascript>alert('该账户还有余额："	+ account.getMoney() + "！');window.location.href='xiaohu_qukuan.jsp';</script>");
		}
	}
	if (sign == 3) {
		if (request.getAttribute("information") != null) {
			String information = (String) request.getAttribute("information");
			out.print("<script language=javascript>alert('"	+ information + "');history.go(-1);</script>");
		} else {
			session.setAttribute("account", request.getAttribute("account"));
			out.print("<script language=javascript>alert('挂失成功！');window.location.href='guashi.jsp';</script>");
		}
	}
	if (sign == 4) {
	    session.setAttribute("useridSession", request.getAttribute("useridSession"));
	    session.setAttribute("jilulist", request.getAttribute("jilulist"));
	    if (request.getAttribute("information") != null) {
			String information = (String) request.getAttribute("information");
			out.print("<script language=javascript>alert('"	+ information + "');history.go(-1);</script>");
		} else {
			out.print("<script language=javascript>alert('存款成功！');window.location.href='cunkuansuccess.jsp';</script>");
		}
	}
	if (sign == 5) {
	    session.setAttribute("useridSession", request.getAttribute("useridSession"));
	    session.setAttribute("jilulist", request.getAttribute("jilulist"));
	    if (request.getAttribute("information") != null) {
			String information = (String) request.getAttribute("information");
			out.print("<script language=javascript>alert('"	+ information + "');history.go(-1);</script>");
		} else {
			out.print("<script language=javascript>alert('取款成功！');window.location.href='qukuansuccess.jsp';</script>");
		}
	}
	if (sign == 6) {
		String result = (String) request.getAttribute("result");
		if (result.equals("success")) {
		    session.setAttribute("accid", request.getAttribute("accid"));
		    String endate=(String)request.getAttribute("endate");
		    String year=endate.substring(0,4);
		    String month=endate.substring(5,7);
		    String day=endate.substring(8,10);
		    out.print("<script language=javascript>alert('到期日为："+year+"年"+month+"月"+day+"日"+"');</script>");
			out.print("<script language=javascript>alert('开户成功！');window.location.href='dingqi_cunkuansuccess.jsp';</script>");
		}
		if (result.equals("fail")) {
			out.print("<script language=javascript>alert('开户失败！');history.go(-1);</script>");
		}
	}
	if (sign == 7) {
	    if (request.getAttribute("information") != null) {
			String information = (String) request.getAttribute("information");
			out.print("<script language=javascript>alert('"	+ information + "');history.go(-1);</script>");
		} else {
			//session.setAttribute("form", request.getAttribute("form"));
			out.print("<script language=javascript>alert('取款成功！');window.location.href='qukuansuccess.jsp';</script>");
		}
	}
	if (sign == 8) {
	    if (request.getAttribute("information") != null) {
			String information = (String) request.getAttribute("information");
			out.print("<script language=javascript>alert('"	+ information + "');history.go(-1);</script>");
		} else {
			session.setAttribute("xgacc", request.getAttribute("xgacc"));
			bean.Account account=(bean.Account)session.getAttribute("xgacc"); 
	        session.setAttribute("xgaccount",account);
			out.print("<script language=javascript>window.location.href='updatemsg.jsp';</script>");
		}
	}
	if (sign == 9) {
		session.setAttribute("accountList", request.getAttribute("accountList"));
		out.print("<script language=javascript>window.location.href='searchmsg.jsp';</script>");
	}
	if (sign == 10) {
		//session.setAttribute("xgacc", request.getAttribute("xgacc"));
		out.print("<script language=javascript>alert('修改密码成功！');history.go(-3);</script>");
	}
	if (sign == 11) {
	    if (request.getAttribute("information") != null) {
			String information = (String) request.getAttribute("information");
			out.print("<script language=javascript>alert('"	+ information + "');history.go(-1);</script>");
		} else {
			//session.setAttribute("xgacc", request.getAttribute("xgacc"));
			out.print("<script language=javascript>alert('修改手机号成功！');history.go(-3);</script>");
		}
	}
	if (sign == 12) {
		if (request.getAttribute("information") != null) {
			String information = (String) request.getAttribute("information");
			out.print("<script language=javascript>alert('"	+ information + "');history.go(-1);</script>");
		} else {
			session.setAttribute("form", request.getAttribute("form"));
			out.print("<script language=javascript>alert('管理员登录成功！');window.location.href='admin_loginmain.jsp';</script>");
		}
	}
	if (sign == 13) {
		String result = (String) request.getAttribute("result");
		if (result.equals("success")) {
		    session.setAttribute("user", request.getAttribute("user"));
			out.print("<script language=javascript>alert('添加职员成功！');window.location.href='add_success.jsp';</script>");
		}
		if (result.equals("fail")) {
			out.print("<script language=javascript>alert('添加职员失败！');history.go(-1);</script>");
		}
	}
	if (sign == 14) {
		if (request.getAttribute("information") != null) {
			String information = (String) request.getAttribute("information");
			out.print("<script language=javascript>alert('"	+ information + "');history.go(-1);</script>");
		} else {
			out.print("<script language=javascript>alert('修改成功！');window.location.href='fireclerk.jsp';</script>");
		}
	}
	if (sign == 15) {
	    session.setAttribute("lilv", request.getAttribute("lilv"));
		out.print("<script language=javascript>window.location.href='huoqililv_success.jsp';</script>");
	}
	if (sign == 16) {
		if (request.getAttribute("information") != null) {
			String information = (String) request.getAttribute("information");
			out.print("<script language=javascript>alert('"	+ information + "');history.go(-1);</script>");
		} else {
			session.setAttribute("account", request.getAttribute("account"));
			out.print("<script language=javascript>alert('解挂成功！');window.location.href='jiegua.jsp';</script>");
		}
	}
	if (sign == 17) {
		if (request.getAttribute("information") != null) {
			String information = (String) request.getAttribute("information");
			out.print("<script language=javascript>alert('"	+ information + "');history.go(-1);</script>");
		} else {
			String str=(String) request.getAttribute("qmoney");
			session.setAttribute("qmoney", request.getAttribute("qmoney"));
			out.print("<script language=javascript>alert('取出金额："+ str + "！')</script>");
			out.print("<script language=javascript>alert('销户成功！');window.location.href='xiaohu.jsp';</script>");
		}
	}
	if (sign == 18) {
	    //session.setAttribute("lilv", request.getAttribute("lilv"));
		out.print("<script language=javascript>window.location.href='dingqililv_success.jsp';</script>");
	}
	if (sign == 19) {
	    //session.setAttribute("lilv", request.getAttribute("lilv"));
		out.print("<script language=javascript>window.location.href='houselilv_success.jsp';</script>");
	}
	if (sign == 20) {
		if (request.getAttribute("information") != null) {
			String information = (String) request.getAttribute("information");
			out.print("<script language=javascript>alert('"	+ information + "');history.go(-1);</script>");
		} else {
			session.setAttribute("account", request.getAttribute("account"));
			out.print("<script language=javascript>window.location.href='dingqi_qukuanhedui.jsp';</script>");
		}
	}
	if (sign == 21) {  
	    if (request.getAttribute("information") != null) {
			String information = (String) request.getAttribute("information");
			out.print("<script language=javascript>alert('"	+ information + "');history.go(-1);</script>");
		} else {
		    session.setAttribute("useridSession", request.getAttribute("useridSession"));
	        session.setAttribute("jilulist", request.getAttribute("jilulist"));
		    Double output=(Double) request.getAttribute("outputM");
		    System.out.println("outputM:"+output);
			session.setAttribute("dingqiAccount", request.getAttribute("dingqiAccount"));
			out.print("<script language=javascript>alert('成功取款"+output+"元！');window.location.href='dingqi_qukuansuccess.jsp';</script>");
		}
	}
	if (sign == 22) {  
	    if (request.getAttribute("information") != null) {
			String information = (String) request.getAttribute("information");
			out.print("<script language=javascript>alert('"	+ information + "');history.go(-1);</script>");
		} else {//没问题 跳转到核对界面
		    session.setAttribute("daikuan", request.getAttribute("daikuan"));//获取的account对象
			out.print("<script language=javascript>window.location.href='xindaihedui.jsp';</script>");
		}
	}
	if (sign == 23) {  
	    if (request.getAttribute("information") != null) {
			String information = (String) request.getAttribute("information");
			out.print("<script language=javascript>alert('"	+ information + "');history.go(-1);</script>");
		} else {
		    session.setAttribute("daik", request.getAttribute("daik"));
		    String dijian=(String)request.getAttribute("chuan");
		    String[] chuanArray = dijian.split(" ");//根据空格分开
		    String jian=chuanArray[2];
		    session.setAttribute("chuan",request.getAttribute("chuan"));
		    if(jian.equals("0")){
		        out.print("<script language=javascript>window.location.href='dengxi.jsp';</script>");
		    }else{
		        out.print("<script language=javascript>window.location.href='dengjin.jsp';</script>");
		    }
		}
	}
	if (sign == 24) {  
	    session.setAttribute("photoAddress", request.getAttribute("photoAddress"));
		out.print("<script language=javascript>window.location.href='xindai.jsp';</script>");
	}if (sign == 100) {
		if (request.getAttribute("information") != null) {
			String information = (String) request.getAttribute("information");
			out.print("<script language=javascript>alert('"	+ information + "');history.go(-1);</script>");
		} else {
			session.setAttribute("form1", request.getAttribute("form1"));
			out.print("<script language=javascript>alert('账户登录成功！');window.location.href='yhlogin_main.jsp';</script>");
		}
	}
%>

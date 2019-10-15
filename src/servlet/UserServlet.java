package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Account;
import bean.TimeType;
import bean.User;

import ctrl.AccountCtrl;
import ctrl.TimeTypeCtrl;
import ctrl.UserCtrl;
import ctrl.UserTypeCtrl;

import util.Encode;

public class UserServlet extends HttpServlet {
	private UserCtrl userCtrl=null;
	private UserTypeCtrl userTypeCtrl=null;
	
	public void doGet(HttpServletRequest request,
			HttpServletResponse response)throws ServletException, IOException {
		int method = Integer.parseInt(request.getParameter("method"));
		if (method == 1) {
			this.addUser(request, response);
		}
		if (method == 2) {
			this.checkUser(request, response);
		}
		if (method == 3) {
			this.checkAdmin(request, response);
		}
		if (method == 4) {
			this.updateUser(request, response);
		}
		if (method == 5) {
			this.updateHqlilv(request, response);
		}
		if (method == 6) {
			this.updateDqlilv(request, response);
		}
		if (method == 7) {
			this.updateHouselilv(request, response);
		}if (method == 100) {
			this.yhLogin(request, response);
		}
	}
	
	public void yhLogin(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		String accid = request.getParameter("accid");	
		String accpwd = request.getParameter("accpwd");
		AccountCtrl acctrl= new AccountCtrl();
		long tre = Long.parseLong(accid.trim());
		Account account = acctrl.getAccount(tre);
		if (account == null) {
			request.setAttribute("information", "您输入的账号不存在，请重新输入！");
		} else if (!account.getAccpwd().trim().equals(accpwd)) {
			request.setAttribute("information", "您输入的登录密码有误，请重新输入！");
		} else {
			request.setAttribute("form1", account);
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("dealwith.jsp");
		requestDispatcher.forward(request, response);
	}
	
	private void updateHouselilv(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String newthreeyear=request.getParameter("newthreeyear");
		String newfiveyear=request.getParameter("newfiveyear");
		String newtenyear=request.getParameter("newtenyear");
		String newtwentyyear=request.getParameter("newtwentyyear");
		String newthirtyyear=request.getParameter("newthirtyyear");
		TimeType timeType=new TimeType();
		TimeTypeCtrl timeTypeCtrl=new TimeTypeCtrl();
		if(!newthreeyear.equals("")){
			Double lilv31=Double.parseDouble(newthreeyear.trim());
			timeType=timeTypeCtrl.getRate(31);
			timeType.setRate(lilv31);
			timeTypeCtrl.operationTimeType("修改房贷利率", timeType);
			request.setAttribute("lilv31", lilv31);
		}
		if(!newfiveyear.equals("")){
			Double lilv32=Double.parseDouble(newfiveyear.trim());
			timeType=timeTypeCtrl.getRate(32);
			timeType.setRate(lilv32);
			timeTypeCtrl.operationTimeType("修改房贷利率", timeType);
			request.setAttribute("lilv32", lilv32);
		}
		if(!newtenyear.equals("")){
			Double lilv33=Double.parseDouble(newtenyear.trim());
			timeType=timeTypeCtrl.getRate(33);
			timeType.setRate(lilv33);
			timeTypeCtrl.operationTimeType("修改房贷利率", timeType);
			request.setAttribute("lilv33", lilv33);
		}
		if(!newtwentyyear.equals("")){
			Double lilv34=Double.parseDouble(newtwentyyear.trim());
			timeType=timeTypeCtrl.getRate(34);
			timeType.setRate(lilv34);
			timeTypeCtrl.operationTimeType("修改房贷利率", timeType);
			request.setAttribute("lilv34", lilv34);
		}
		if(!newthirtyyear.equals("")){
			Double lilv35=Double.parseDouble(newthirtyyear.trim());
			timeType=timeTypeCtrl.getRate(35);
			timeType.setRate(lilv35);
			timeTypeCtrl.operationTimeType("修改房贷利率", timeType);
			request.setAttribute("lilv35", lilv35);
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("dealwith.jsp");
		requestDispatcher.forward(request, response);
	}
	private void updateDqlilv(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String newthreemonth=request.getParameter("newthreemonth");
		String newsixmonth=request.getParameter("newsixmonth");
		String newoneyear=request.getParameter("newoneyear");
		String newtwoyear=request.getParameter("newtwoyear");
		String newthreeyear=request.getParameter("newthreeyear");
		String newfiveyear=request.getParameter("newfiveyear");
		TimeType timeType=new TimeType();
		TimeTypeCtrl timeTypeCtrl=new TimeTypeCtrl();
		if(!newthreemonth.equals("")){
			Double lilv2=Double.parseDouble(newthreemonth.trim());
			timeType=timeTypeCtrl.getRate(2);
			timeType.setRate(lilv2);
			timeTypeCtrl.operationTimeType("修改定期利率", timeType);
			request.setAttribute("lilv2", lilv2);
		}
		if(!newsixmonth.equals("")){
			Double lilv3=Double.parseDouble(newsixmonth.trim());
			timeType=timeTypeCtrl.getRate(3);
			timeType.setRate(lilv3);
			timeTypeCtrl.operationTimeType("修改定期利率", timeType);
			request.setAttribute("lilv3", lilv3);
		}
		if(!newoneyear.equals("")){
			Double lilv4=Double.parseDouble(newoneyear.trim());
			timeType=timeTypeCtrl.getRate(4);
			timeType.setRate(lilv4);
			timeTypeCtrl.operationTimeType("修改定期利率", timeType);
			request.setAttribute("lilv4", lilv4);
		}
		if(!newtwoyear.equals("")){
			Double lilv5=Double.parseDouble(newtwoyear.trim());
			timeType=timeTypeCtrl.getRate(5);
			timeType.setRate(lilv5);
			timeTypeCtrl.operationTimeType("修改定期利率", timeType);
			request.setAttribute("lilv5", lilv5);
		}
		if(!newthreeyear.equals("")){
			Double lilv6=Double.parseDouble(newthreeyear.trim());
			timeType=timeTypeCtrl.getRate(6);
			timeType.setRate(lilv6);
			timeTypeCtrl.operationTimeType("修改定期利率", timeType);
			request.setAttribute("lilv6", lilv6);
		}
		if(!newfiveyear.equals("")){
			Double lilv7=Double.parseDouble(newfiveyear.trim());
			timeType=timeTypeCtrl.getRate(7);
			timeType.setRate(lilv7);
			timeTypeCtrl.operationTimeType("修改定期利率", timeType);
			request.setAttribute("lilv7", lilv7);
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("dealwith.jsp");
		requestDispatcher.forward(request, response);
	}
	private void updateHqlilv(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String newhuoqililv=request.getParameter("newhuoqililv");
		Double lilv=Double.parseDouble(newhuoqililv);
		TimeType timeType=new TimeType();
		TimeTypeCtrl timeTypeCtrl=new TimeTypeCtrl();
		timeType=timeTypeCtrl.getRate(1);
		timeType.setRate(lilv);
		timeTypeCtrl.operationTimeType("修改活期利率", timeType);
		request.setAttribute("lilv", lilv);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("dealwith.jsp");
		requestDispatcher.forward(request, response);
		
	}
	private void addUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		String str1 = sdf1.format(new Date());
		User user= new User();
		user.setUserid(Integer.valueOf(request.getParameter("userid")));
		user.setUsername(Encode.toChinese(request.getParameter("username")));
		if(request.getParameter("usersex").equals(0)){
			user.setUsersex("男");
		}else{
			user.setUsersex("女");
		}
		user.setUsersfzh(Encode.toChinese(request.getParameter("usersfzh")));
		user.setUserpwd(Encode.toChinese(request.getParameter("userpwd")));
		user.setWorkconid(Integer.valueOf(1));
		user.setWorkdate(Encode.toChinese(str1));
		userCtrl = new UserCtrl();
		String result = "fail";
		if (userCtrl.operationUser("添加", user)) {
			result = "success";
			request.setAttribute("user", user);
		}
		request.setAttribute("result", result);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("dealwith.jsp");
		requestDispatcher.forward(request, response);
	}
	
	// 用户登录操作
	public void checkUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		String userid = request.getParameter("userid");	
		String test = request.getParameter("test");
		userCtrl = new UserCtrl();
		int tre = Integer.parseInt(userid.trim());
		User user = userCtrl.getUser(tre);
		if (user == null) {
			request.setAttribute("information", "您输入的员工编号不存在，请重新输入！");
		} else if (!user.getUserpwd().trim().equals(request.getParameter("userpwd"))) {
			request.setAttribute("information", "您输入的登录密码有误，请重新输入！");
		} else if (user.getWorkconid()==2) {
			request.setAttribute("information", "该员工已离职，请重新输入！");
		} else if (user.getWorkconid()==4) {
			request.setAttribute("information", "您输入的编号不是员工编号，请重新输入！");
		} else {
			request.setAttribute("form", user);
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("dealwith.jsp");
		requestDispatcher.forward(request, response);
	}
	
	// 管理员登录操作
	public void checkAdmin(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		String userid = request.getParameter("userid");	
		String yzm = request.getParameter("yzm");
		String test = request.getParameter("test");
		
		userCtrl = new UserCtrl();
		int tre = Integer.parseInt(userid.trim());
		User user = userCtrl.getUser(tre);
		if (user == null) {
			request.setAttribute("information", "您输入的管理员编号不存在，请重新输入！");
		} else if (!user.getUserpwd().trim().equals(request.getParameter("userpwd"))) {
			request.setAttribute("information", "您输入的登录密码有误，请重新输入！");
		} else if(!yzm.equals(test)){
			request.setAttribute("information", "您输入的验证码有误，请重新输入！");
		} else if (user.getWorkconid()!=4) {
			request.setAttribute("information", "您输入的编号不是管理员编号，请重新输入！");
		} else {
			request.setAttribute("form", user);
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("dealwith.jsp");
		requestDispatcher.forward(request, response);
	}
	
	private void updateUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		User user= new User();
		userCtrl = new UserCtrl();
		String str=request.getParameter("userid");
		String usersfzh=request.getParameter("usersfzh");
		String username=request.getParameter("username");
		Integer userid=Integer.parseInt(str);
		user=userCtrl.getUser(userid);
		if(user==null){
			request.setAttribute("information", "您输入的员工编号不存在，请重新输入！");
		}else if(!user.getUsername().trim().equals(Encode.toChinese(username).trim())){
			request.setAttribute("information", "您输入的员工姓名错误，请重新输入！");
		}else if(!user.getUsersfzh().trim().equals(usersfzh.trim())){
			request.setAttribute("information", "您输入的员工身份证号错误，请重新输入！");
		}else{
			user.setWorkconid(Integer.valueOf(2));
			userCtrl.operationUser("修改状态", user);//对user的操作
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("dealwith.jsp");
		requestDispatcher.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            doGet(request, response);
    }
}


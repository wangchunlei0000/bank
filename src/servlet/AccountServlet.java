package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Encode;
import bean.Account;
import bean.TimeType;
import bean.Trade;
import bean.User;
import ctrl.AccountCtrl;
import ctrl.AccountTypeCtrl;
import ctrl.TimeTypeCtrl;
import ctrl.TradeCtrl;

public class AccountServlet extends HttpServlet {
	private AccountCtrl accountCtrl=null;
	private AccountTypeCtrl accountTypeCtrl=null;
	
	public void doGet(HttpServletRequest request,
			HttpServletResponse response)throws ServletException, IOException {
		int method = Integer.parseInt(request.getParameter("method"));
		if (method == 1) {
			this.addHqAccount(request, response);
		}
		if (method == 2) {
			this.removeAccount(request, response);
		}
		if (method == 3) {
			this.lossAccount(request, response);
		}
		if (method == 4) {
			this.xgAccount(request, response);
		}
		if (method == 5) {
			this.addDqAccount(request, response);
		}
		if (method == 6) {
			this.loanAccount(request, response);
		}
		if (method == 7) {
			this.searchAccount(request, response);
		}
		if (method == 8) {
			this.updatePwd(request, response);
		}
		if (method == 9) {
			this.updateTel(request, response);
		}
		if (method == 10) {
			this.nolossAccount(request, response);
		}
		if (method == 11) {
			this.removeAllmoney(request, response);
		}
		if (method == 12) {
			this.searchMoney(request, response);
		}
	}
	
	
	//添加活期账户
	private void addHqAccount(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Account account= new Account();
		response.setContentType("text/html;charset=UTF-8");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String str = sdf.format(new Date());
		String str1 = sdf1.format(new Date());
		account.setAccid(Long.valueOf("71051"+str.trim()));
		account.setAccname(Encode.toChinese(request.getParameter("accname")));
		if(request.getParameter("accsex").equals("0")){
			account.setAccsex("男");
		}else{
			account.setAccsex("女");
		}
		account.setAccsfzh(Encode.toChinese(request.getParameter("accsfzh")));
		account.setAcctel(Encode.toChinese(request.getParameter("acctel")));
		account.setAccpwd(Encode.toChinese(request.getParameter("accpwd")));
		account.setTratypeid(Integer.valueOf(1));
		account.setTimeid(Integer.valueOf(1));
		account.setDmoney(Double.valueOf(0));
		account.setMoney(Double.valueOf(0));
		account.setLoanmoney(Double.valueOf(0));
		account.setAccconid(Integer.valueOf(1));
		account.setStdate(Encode.toChinese(str1));
		account.setUserid(Integer.valueOf(request.getSession().getAttribute("useridSession").toString()));		
		account.setOpenb("金院建设银行");
		accountCtrl = new AccountCtrl();
		String result = "fail";
		if (accountCtrl.operationAccount("添加", account)) {
			result = "success";
			Trade trade = new Trade();
			TradeCtrl tradeCtrl = new TradeCtrl();
			trade.setAccid(Long.valueOf(account.getAccid()));
			trade.setTratypeid(Integer.valueOf(account.getTratypeid()));
			trade.setTramoney(Double.valueOf(0));
			trade.setMoney(Double.valueOf(0));
			trade.setInterest(Double.valueOf(0));
			trade.setTradate(str1);
			trade.setUserid(Integer.valueOf(request.getSession().getAttribute("useridSession").toString()));
			String result1 = "交易失败！";
			if (tradeCtrl.operationTrade("添加", trade)) {
				result1 = "记录添加成功！";
			}
			if(result1.equals("交易失败！")){
				accountCtrl.operationAccount("删除", account);	
				result = "fail";
			}
			//request.setAttribute("result1", result1);
		}
		request.setAttribute("result", result);
		Account acc=accountCtrl.getAccount(account.getAccid());
		request.setAttribute("accid", acc);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("dealwith.jsp");
		requestDispatcher.forward(request, response);
	}
	
	//修改账户
	private void xgAccount(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String accid = request.getParameter("accid");
		accountCtrl = new AccountCtrl();
		Long tre = Long.parseLong(accid.trim());
		Account account = accountCtrl.getAccount(tre);
		if(account==null){
			request.setAttribute("information", "您输入的账号不存在，请重新输入！");
		} else if (!account.getAccsfzh().trim().equals(request.getParameter("accsfzh"))) {
			request.setAttribute("information", "您输入的身份证号有误，请重新输入！");
		} else {
			request.setAttribute("xgacc",account);
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("dealwith.jsp");
		requestDispatcher.forward(request, response);
	}
	
	//注销账户
	private void removeAccount(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String accid = request.getParameter("accid");
		accountCtrl = new AccountCtrl();
		Long tre = Long.parseLong(accid.trim());
		Account account = accountCtrl.getAccount(tre);
		if (account == null) {
			request.setAttribute("information", "您输入的账号不存在，请重新输入！");
		} else if (!account.getAccsfzh().trim().equals(request.getParameter("accsfzh"))) {
			request.setAttribute("information", "您输入的身份证号有误，请重新输入！");
		} else if (!account.getAccpwd().trim().equals(request.getParameter("accpwd"))) {
			request.setAttribute("information", "您输入的账号密码有误，请重新输入！");
		} else if (account.getAccconid()==2) {
			request.setAttribute("information", "您输入的账号已挂失，请解挂之后再注销！");
		} else if (account.getAccconid()==3) {
			request.setAttribute("information", "您输入的账号已销户，请重新输入！");
		} else {
			request.setAttribute("xiaohuacc", account);
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("dealwith.jsp");
		requestDispatcher.forward(request, response);
	}

	//挂失账户
	private void lossAccount(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String accid = request.getParameter("accid");
		accountCtrl = new AccountCtrl();
		Long tre = Long.parseLong(accid.trim());
		Account account = accountCtrl.getAccount(tre);
		if (account == null) {
			request.setAttribute("information", "您输入的账号不存在，请重新输入！");
		} else if (!account.getAccsfzh().trim().equals(request.getParameter("accsfzh"))) {
			request.setAttribute("information", "您输入的身份证号有误，请重新输入！");
		} else if (!account.getAccpwd().trim().equals(request.getParameter("accpwd"))) {
			request.setAttribute("information", "您输入的账号密码有误，请重新输入！");
		} else if (account.getAccconid()==2) {
			request.setAttribute("information", "您输入的账号已挂失，请重新输入！");
		} else if (account.getAccconid()==3) {
			request.setAttribute("information", "您输入的账号已销户，请重新输入！");
		} else {
			account.setAccconid(Integer.valueOf(2));
			accountCtrl.operationAccount("挂失", account);
			request.setAttribute("account", account);
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("dealwith.jsp");
		requestDispatcher.forward(request, response);
	}
	
	

	//添加定期账户和定期存款
	private void addDqAccount(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Account account= new Account();
		response.setContentType("text/html;charset=UTF-8");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String str = sdf.format(new Date());
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String str1 = sdf1.format(new Date());
		account.setAccid(Long.valueOf("71052"+str.trim()));
		account.setAccname(Encode.toChinese(request.getParameter("accname")));
		account.setAccname(Encode.toChinese(request.getParameter("accname")));
		if(request.getParameter("accsex").equals("0")){
			account.setAccsex("男");
		}else{
			account.setAccsex("女");
		}
		account.setAccsfzh(Encode.toChinese(request.getParameter("accsfzh")));
		account.setAcctel(Encode.toChinese(request.getParameter("acctel")));
		account.setAccpwd(Encode.toChinese(request.getParameter("accpwd")));
		account.setTratypeid(Integer.valueOf(2));
		account.setTimeid(Integer.valueOf(request.getParameter("timeid")));
		account.setDmoney(Double.valueOf(request.getParameter("tramoney").trim()));
		account.setMoney(Double.valueOf(request.getParameter("tramoney").trim()));
		account.setLoanmoney(Double.valueOf(0));
		account.setAccconid(Integer.valueOf(1));
		account.setStdate(Encode.toChinese(str1));
		TimeTypeCtrl timeTypeCtrl=new TimeTypeCtrl();
		TimeType timeType=timeTypeCtrl.getRate(Integer.valueOf(request.getParameter("timeid")));
		Integer yue=timeType.getTimes();
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMdd");
		String str2 = sdf2.format(new Date());
		Date dt;
		try {
			dt = sdf2.parse(str2);
			Calendar rightNow = Calendar.getInstance();
			rightNow.setTime(dt);
			rightNow.add(Calendar.MONTH,yue);//日期加几个月
			Date dt1=rightNow.getTime();
			String str3 = sdf.format(dt1);
			String en1 = str3.substring(0, 4);
			String en2 = str3.substring(4, 6);
			String en3 = str3.substring(6, 8);
			account.setEndate(Encode.toChinese(en1+"-"+en2+"-"+en3));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		account.setUserid(Integer.valueOf(request.getSession().getAttribute("useridSession").toString()));		
		account.setOpenb("金院建设银行");
		accountCtrl = new AccountCtrl();
		String result = "fail";
		if (accountCtrl.operationAccount("添加", account)) {
			result = "success";
			Trade trade = new Trade();
			TradeCtrl tradeCtrl = new TradeCtrl();
			trade.setAccid(Long.valueOf(account.getAccid()));
			trade.setTratypeid(Integer.valueOf(account.getTratypeid()));
			trade.setTramoney(Double.valueOf(request.getParameter("tramoney")));
			trade.setMoney(Double.valueOf(request.getParameter("tramoney")));
			trade.setInterest(Double.valueOf(0));
			trade.setTradate(str1);
			trade.setUserid(Integer.valueOf(request.getSession().getAttribute("useridSession").toString()));
			String result1 = "交易失败！";
			if (tradeCtrl.operationTrade("添加", trade)) {
				result1 = "记录添加成功！";
			}
			if(result1.equals("交易失败！")){
				accountCtrl.operationAccount("删除", account);	
				result = "fail";
			}
			request.setAttribute("result1", result1);
		}
		request.setAttribute("endate", account.getEndate());
		request.setAttribute("result", result);
		Account acc=accountCtrl.getAccount(account.getAccid());
		request.setAttribute("accid", acc);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("dealwith.jsp");
		requestDispatcher.forward(request, response);
	}
	
	//贷款用户
	private void loanAccount(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//从前台接收参数
		String accid = request.getParameter("accid");
		String accname = Encode.toChinese(request.getParameter("accname"));
		String accsex=null;
		if(request.getParameter("accsex").equals("0")){
			accsex="男";
		}else{
			accsex="女";
		}
		String accsfzh = request.getParameter("accsfzh");
		String id= request.getParameter("timeid");
		int timeid = Integer.parseInt(id);//贷款期限id
		String acctel = request.getParameter("acctel");
		String money = request.getParameter("tramoney");
		Double loanmoney = Double.parseDouble(money);//贷款金额
		String loantype = request.getParameter("loantype");
		Account account= new Account();
		response.setContentType("text/html;charset=UTF-8");
		accountCtrl = new AccountCtrl();
		Long tre = Long.parseLong(accid.trim());
		account = accountCtrl.getAccount(tre);//以accid 为条件查询纪录
		if (account == null) {
			request.setAttribute("information", "您输入的账号不存在，请重新输入！");
		} else if (account.getAccconid() == 2) {
			request.setAttribute("information", "您输入的账号已挂失，请重新输入！");
		} else if (account.getAccconid() == 3) {
			request.setAttribute("information", "您输入的账号已注销，请重新输入！");
		} else if (!account.getAccname().trim().equals(accname.trim())) {
			request.setAttribute("information", "您输入的账号姓名错误，请重新输入！");
		} else if (!account.getAccsex().trim().equals(accsex.trim())) {
			request.setAttribute("information", "您输入的性别错误，请重新输入！");
		} else if (!account.getAccsfzh().trim().equals(accsfzh.trim())) {
			request.setAttribute("information", "您输入的身份证号错误，请重新输入！");
		} else if (!account.getAcctel().trim().equals(acctel.trim())) {
			request.setAttribute("information", "您输入的手机号错误，请重新输入！");
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");//日期格式
			String str = sdf.format(new Date());//当前日期
			account.setLoanmoney(loanmoney);
			account.setLoantype(Encode.toChinese(loantype));//贷款类型
			account.setTimeid(timeid);//期限编号
			account.setTratypeid(3);//贷款编号
			account.setLoandate(str);//贷款日期
			accountCtrl.operationAccount("贷款", account);//对贷款的操作
			request.setAttribute("daikuan", account);
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("dealwith.jsp");//跳转
		requestDispatcher.forward(request, response);
	}
	
	
	private void searchAccount(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String accsfzh=(String)request.getParameter("accsfzh");
		accountCtrl = new AccountCtrl();
		List accountList=accountCtrl.sfzhAccount(accsfzh);
		request.setAttribute("accountList", accountList);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("dealwith.jsp");
		requestDispatcher.forward(request, response);
	}
	
	//修改账户密码
	private void updatePwd(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String accpwd = request.getParameter("accpwd");
		AccountCtrl accountCtrl=new AccountCtrl();
		Account account = (Account)request.getSession().getAttribute("xgaccount1");
		account.setAccpwd(accpwd);
		accountCtrl.operationAccount("修改密码", account);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("dealwith.jsp");
		requestDispatcher.forward(request, response);
	}
	
	//修改账户电话号码
	private void updateTel(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String acctel = request.getParameter("acctel");
		String accretel = request.getParameter("accretel");
		AccountCtrl accountCtrl=new AccountCtrl();
		Account account = (Account)request.getSession().getAttribute("xgaccount2");
		if(!account.getAcctel().trim().equals(acctel)){
			request.setAttribute("information", "您输入的手机号错误，请重新输入！");
		} else if (acctel.trim().equals(accretel.trim())) {
			request.setAttribute("information", "您输入的手机号和之前手机号一致，请重新输入！");
		} else {
			System.out.println("xgaccount2:"+account.getAccpwd());
			account.setAcctel(accretel);
			accountCtrl.operationAccount("修改手机号", account);
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("dealwith.jsp");
		requestDispatcher.forward(request, response);
	}
	
	//解挂账户
	private void nolossAccount(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String accid = request.getParameter("accid");
		accountCtrl = new AccountCtrl();
		Long tre = Long.parseLong(accid.trim());
		Account account = accountCtrl.getAccount(tre);
		if (account == null) {
			request.setAttribute("information", "您输入的账号不存在，请重新输入！");
		} else if (!account.getAccsfzh().trim().equals(request.getParameter("accsfzh"))) {
			request.setAttribute("information", "您输入的身份证号有误，请重新输入！");
		} else if (account.getAccconid()==1) {
			request.setAttribute("information", "您输入的账号已解挂，请重新输入！");
		} else if (account.getAccconid()==3) {
			request.setAttribute("information", "您输入的账号已销户，请重新输入！");
		} else {
			account.setAccconid(Integer.valueOf(1));
			accountCtrl.operationAccount("挂失", account);
			request.setAttribute("account", account);
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("dealwith.jsp");
		requestDispatcher.forward(request, response);
	}
	
	//销户取出全部的钱账户
	private void removeAllmoney(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		Account account = (Account)request.getSession().getAttribute("xiaohua");
		String money = String.valueOf(account.getMoney());
		String qian=String.valueOf(account.getMoney());
		if(!money.substring(money.length()-1,money.length()).equals("0")){
		   	if(!money.substring(money.length()-2,money.length()-1).equals("9")){
		 		Integer qian1=Integer.valueOf(money.substring(money.length()-2,money.length()-1));
		   		Integer qian2=qian1+1;
		   		qian=money.substring(0,money.length()-2)+qian2+"0";	
		    	System.out.println("qian1:"+qian);
		   	} else{
		   		Integer qian1=Integer.valueOf(money.substring(0,money.length()-3));
		   		Integer qian2=qian1+1;
		    	qian=qian2+"."+"00";
		    	System.out.println("qian2:"+qian);
		   	}    	
		}
		request.setAttribute("qmoney", qian);
		account.setMoney(Double.valueOf(0));
		account.setAccconid(Integer.valueOf(3));
		accountCtrl.operationAccount("销户", account);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("dealwith.jsp");
		requestDispatcher.forward(request, response);
	}
	
	private void searchMoney(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String accid = request.getParameter("accid");
		accountCtrl = new AccountCtrl();
		Long tre = Long.parseLong(accid.trim());
		Account account = accountCtrl.getAccount(tre);
		String accpwd = request.getParameter("accpwd");
		if (account == null) {
			request.setAttribute("information", "您输入的账号不存在，请重新输入！");
		} else if (account.getAccconid() == 3) {
			request.setAttribute("information", "您输入的账号已注销，请重新输入！");
		} else if (!account.getAccpwd().trim().equals(accpwd.trim())) {
			request.setAttribute("information", "您输入的账号密码错误，请重新输入！");
		} else{
			request.setAttribute("account", account);
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("dealwith.jsp");
		requestDispatcher.forward(request, response);
	}
	
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         doGet(request, response);
	}	
}

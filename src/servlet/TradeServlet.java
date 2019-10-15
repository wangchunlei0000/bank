package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import suanfa.Daikuan;
import suanfa.Dingqi;
import suanfa.Huoqi;
import bean.Account;
import bean.TimeType;
import bean.Trade;
import ctrl.AccountCtrl;
import ctrl.TimeTypeCtrl;
import ctrl.TradeCtrl;
import ctrl.TradeTypeCtrl;

public class TradeServlet extends HttpServlet {

	private Trade trade=null;
	private TradeCtrl tradeCtrl=null;
	private TradeTypeCtrl tradeTypeCtrl=null;
	
	public void doGet(HttpServletRequest request,
			HttpServletResponse response)throws ServletException, IOException {
		int method = Integer.parseInt(request.getParameter("method"));
		if (method == 1) {
			this.adddepositTrade(request, response);
		}
		if (method == 2) {
			this.addremoveTrade(request, response);
		}
		if (method == 3) {
			this.adddqTrade(request, response);
		}
		if (method == 4) {
			this.researchTrade(request, response);
		}
		if (method == 5) {
			this.dkTrade(request, response);
		}
	}
	
	//添加存款记录
	private void adddepositTrade(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String accid = request.getParameter("accid");
		Double tramoney=Double.parseDouble(request.getParameter("tramoney").trim());
		AccountCtrl accountCtrl = new AccountCtrl();
		Long tre = Long.parseLong(accid.trim());
		Account account = accountCtrl.getAccount(tre);
		TradeCtrl tradeCtrl = new TradeCtrl();
		if (account == null) {
			request.setAttribute("information", "您输入的账号不存在，请重新输入！");
		} else if (account.getAccconid() == 2) {
			request.setAttribute("information", "您输入的账号已挂失，请重新输入！");
		} else if (account.getAccconid() == 3) {
			request.setAttribute("information", "您输入的账号已注销，请重新输入！");
		} else {
			trade=tradeCtrl.researchMoney(account.getAccid());
			if(trade==null){
				account.setMoney(account.getMoney()+tramoney);
			} else{
				Integer userid=Integer.valueOf(request.getSession().getAttribute("useridSession").toString());
				Huoqi huoqi=new Huoqi(account.getAccid(),trade.getTradate(),tramoney,account.getMoney(),trade.getInterest(),userid);
				int number=huoqi.main();
				System.out.println("umber "+number);
				List jiluList=tradeCtrl.JxTrade(account.getAccid(),number);
				request.setAttribute("jilulist", jiluList);
				trade=tradeCtrl.researchMoney(account.getAccid());
				account.setMoney(trade.getMoney());
				request.setAttribute("useridSession", userid);
			}
			accountCtrl.operationAccount("存款", account);
			System.out.println("account.getMoney():"+account.getMoney());
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("dealwith.jsp");
		requestDispatcher.forward(request, response);
	}
	
	//添加取款记录
	private void addremoveTrade(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String accid = request.getParameter("accid");
		String accpwd = request.getParameter("accpwd");
		String str = request.getParameter("tramoney");
		Float tramoney = Float.parseFloat(str);
		AccountCtrl accountCtrl = new AccountCtrl();
		Long tre = Long.parseLong(accid.trim());
		Account account = accountCtrl.getAccount(tre);
		TradeCtrl tradeCtrl = new TradeCtrl();
		if (account == null) {
			request.setAttribute("information", "您输入的账号不存在，请重新输入！");
		} else if (account.getAccconid() == 2) {
			request.setAttribute("information", "您输入的账号已挂失，请重新输入！");
		} else if (account.getAccconid() == 3) {
			request.setAttribute("information", "您输入的账号已注销，请重新输入！");
		} else if (!account.getAccpwd().trim().equals(accpwd.trim())) {
			request.setAttribute("information", "您输入的账号密码错误，请重新输入！");
		} else if (account.getMoney()<tramoney) {
			request.setAttribute("information", "您输入的账号余额不足，请重新输入！");
		} else {
			Trade trade=tradeCtrl.researchMoney(account.getAccid());
			Integer userid=Integer.valueOf(request.getSession().getAttribute("useridSession").toString());
			Huoqi huoqi=new Huoqi(account.getAccid(),trade.getTradate(),(-1)*tramoney,account.getMoney(),trade.getInterest(),userid);
			int number=huoqi.main();
			List jiluList=tradeCtrl.JxTrade(account.getAccid(),number);
			request.setAttribute("jilu", jiluList);
			trade=tradeCtrl.researchMoney(account.getAccid());
			request.setAttribute("jilulist", jiluList);
			account.setMoney(trade.getMoney());
			accountCtrl.operationAccount("取款", account);
			request.setAttribute("useridSession", userid);
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("dealwith.jsp");
		requestDispatcher.forward(request, response);
	}
	
	//添加定期取款记录
	private void adddqTrade(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String tr=request.getSession().getAttribute("accountid").toString();
		Long accid=Long.parseLong(tr);
		String str = request.getParameter("tramoney");
		Float tramoney = Float.parseFloat(str);
		AccountCtrl accountCtrl = new AccountCtrl();
		Account account = accountCtrl.getAccount(accid);
		TradeCtrl tradeCtrl = new TradeCtrl();
		if (account == null) {
			request.setAttribute("information", "您输入的账号不存在，请重新输入！");
		} else if (account.getMoney()<tramoney) {
			request.setAttribute("information", "您输入的账号金额不足，请重新输入！");
		} else if (account.getAccconid()==3) {
			request.setAttribute("information", "您输入的账号已销户，请重新输入！");
		} else {
			Trade trade=tradeCtrl.researchMoney(account.getAccid());
			TimeTypeCtrl timeTypeCtrl=new TimeTypeCtrl();
			TimeType timeType=timeTypeCtrl.getRate(Integer.valueOf(account.getTimeid()));
			Integer userid=Integer.valueOf(request.getSession().getAttribute("useridSession").toString());
			Dingqi dingqi;
			try {
				dingqi = new Dingqi(account.getAccid(),trade.getTradate().substring(0, 10),account.getDmoney(),account.getMoney(),timeType.getTimes(),account.getEndate(),tramoney,userid);
				int number=dingqi.main();
				List jiluList=tradeCtrl.JxTrade(account.getAccid(),number);
				request.setAttribute("jilulist", jiluList);
				trade=tradeCtrl.researchMoney(account.getAccid());
				Account account1=new Account();
				account1=accountCtrl.getAccount(accid);
				request.setAttribute("dingqiAccount", account1);
				double outputM=(-1)*trade.getTramoney();
				request.setAttribute("outputM", outputM);
				System.out.println("outputM:"+outputM);
				request.setAttribute("useridSession", userid);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("dealwith.jsp");
		requestDispatcher.forward(request, response);
	}
	
	//查找交易记录
	private void researchTrade(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
	}

	//贷款记录
	private void dkTrade(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Integer userid=Integer.valueOf(request.getSession().getAttribute("useridSession").toString());//职员id
		Account account=(Account)request.getSession().getAttribute("dai");//贷款账号信息对象
		int mode=0;
		if(account.getLoantype().equals("等额本金")){
			mode=1;
		}else if(account.getLoantype().equals("等额本息")){
			mode=2;
		}
		Daikuan daikuan = new Daikuan(account.getAccid(),
				account.getTratypeid(),//存款类型
				account.getMoney(),
				account.getLoandate(),
				account.getLoanmoney(),
				mode,
				account.getTimeid(),//期限
				userid);
		String chuan=daikuan.main();
		System.out.println("chuan:"+chuan);
		request.setAttribute("chuan", chuan);
		request.setAttribute("daik", account);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("dealwith.jsp");
		requestDispatcher.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
        doGet(request, response);
    }
}

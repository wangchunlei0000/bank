package suanfa;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.Scanner;

import ctrl.AccountCtrl;
import ctrl.TimeTypeCtrl;
import ctrl.TradeCtrl;

import bean.Account;
import bean.TimeType;
import bean.Trade;

public class Huoqi{
	Long accid;//card
	int userid;//user id
	int jilu;//return
	int y;
	int m;
	int d;
	int flag0;
	int flagn;
	double all =0;//all money in card
	double money = 0;//tramony
	double lixi = 0;
	Date d0 = null;
	Date dn = null;
	double rate=0;
	TimeTypeCtrl timeTypeCtrl = new TimeTypeCtrl();
	TimeType timeType=new TimeType();//期限编号
	public Huoqi(Long ID,String lastdate,double money,double totalmoney,double L,int opid){
		System.out.println("money "+money);
		System.out.println("lastdate "+lastdate);
		String stime=lastdate.substring(0,10);//截取字符串
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			d0 = sdf.parse(stime);
			System.out.println("d0"+d0);
			System.out.println("dn"+dn);
			int lasty=Integer.parseInt(lastdate.substring(0,4));
			int lastm=Integer.parseInt(lastdate.substring(5,7));
			int lastd=Integer.parseInt(lastdate.substring(8,10));
			System.out.println("lasty "+lasty);
			System.out.println("lastm "+lastm);
			System.out.println("lastd "+lastd);
			String str = sdf.format(new Date());
			flag0=10000*lasty+100*lastm+lastd;
			System.out.println("flag0:"+flag0);
			y=Integer.parseInt(str.substring(0,4));
			m=Integer.parseInt(str.substring(5,7));
			d=Integer.parseInt(str.substring(8,10));
			dn=sdf.parse(str);
			
			System.out.println("y:"+y);
			System.out.println("m:"+m);
			System.out.println("d:"+d);
			
			flagn=10000*y+100*m+d;
			
			System.out.println("flagn:"+flagn);
			all=totalmoney;
			lixi=L;
			System.out.println("lixi "+lixi);
			this.money=money;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		accid=ID;
		userid=opid;
	}


	private  void jiexi(Date d1, Date d2) {
		int t0 = (flag0 / 10000 - 2018) * 4, tn = (flagn / 10000 - 2018) * 4, f0 = flag0 % 10000, fn = flagn % 10000;
		if (f0 >= 101 && f0 < 320) {
			t0 += 0;
		} else if (f0 >= 320 && f0 < 620) {
			t0 += 1;
		} else if (f0 >= 620 && f0 < 920) {
			t0 += 2;
		} else if (f0 >= 920 && f0 < 1220) {
			t0 += 3;
		} else if (f0 >= 1220 && f0 <= 1231) {
			t0 += 4;
		}

		if (fn >= 101 && fn < 320) {
			tn += 0;
		} else if (fn >= 320 && fn < 620) {
			tn += 1;
		} else if (fn >= 620 && fn < 920) {
			tn += 2;
		} else if (fn >= 920 && fn < 1220) {
			tn += 3;
		} else if (fn >= 1220 && fn <= 1231) {
			tn += 4;
		}
		jilu=tn-t0;
		Date dmin, dmid, dmax;
		dmin = d1;
		dmax = d2;

		for (; t0 < tn; t0++) {
			SimpleDateFormat sdf1 = new SimpleDateFormat("hh:mm:ss");
			String str1 = sdf1.format(new Date());
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
			int midy=2017+t0/4;
			int midm=(t0%4+1)*3;
			int midd=20;
			String midtime=midy+"-"+midm+"-"+midd;
			System.out.println(midtime);
//			dmid = new Date(2018 + t0 / 4, (t0 % 4 + 1) * 3 - 1, 20, 0, 0, 0);
			try {
				dmid=sdf2.parse(midtime);
				System.out.println("dmid "+dmid);
				jisuanlixi(dmin, dmid);
				all = all + lixi;
				System.out.println("all "+all);
				AccountCtrl accountCtrl = new AccountCtrl();
				Account account = accountCtrl.getAccount(accid);
				Trade trade = new Trade();
				TradeCtrl tradeCtrl = new TradeCtrl();
				trade.setAccid(Long.valueOf(accid));
				trade.setTratypeid(Integer.valueOf(account.getTratypeid()));
				trade.setTramoney(Double.valueOf(0));
				trade.setMoney(Double.valueOf(all));
				trade.setInterest(Double.valueOf(lixi));
				System.out.println("t0:"+t0);
				System.out.println("year1:"+midy);
				System.out.println("month1:"+midm);
				trade.setTradate(midy+"-"+midm+"-20 "+str1);
				trade.setUserid(Integer.valueOf(userid));		
				String result = "交易失败！";
				if (tradeCtrl.operationTrade("添加", trade)) {
					result = "记录添加成功！";
				}
				System.out.println((2018 + t0 / 4) + "年" + ((t0 % 4 + 1) * 3) + "月" + 20 + "日结息" + lixi + "余额" + all);
				lixi = 0;
				dmin = dmid;
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		jisuanlixi(dmin, dmax);
	}

	private  void jisuanlixi(Date d1, Date d2) {
		// TODO Auto-generated method stub
		int days = (int) ((d2.getTime() - d1.getTime()) / 86400000);
		timeType = timeTypeCtrl.getRate(Integer.valueOf(1));
		System.out.println("days:"+days);
		rate=timeType.getRate();
		lixi += all * (rate / 360) * days;
		System.out.println("lixi"+lixi);
	}

	public  int main() {
		// TODO Auto-generated method stub
			jiexi(d0, dn);
			all += money;
			AccountCtrl accountCtrl = new AccountCtrl();
			Account account = accountCtrl.getAccount(accid);
			Trade trade = new Trade();
			TradeCtrl tradeCtrl = new TradeCtrl();
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String str1 = sdf1.format(new Date());
			trade.setAccid(Long.valueOf(accid));
			trade.setTratypeid(Integer.valueOf(account.getTratypeid()));
			if(money>0){
				trade.setTramoney(Double.valueOf(money));
			}else{
				trade.setTramoney(Double.valueOf(money));
			}
			trade.setMoney(Double.valueOf(all));
			trade.setInterest(Double.valueOf(lixi));
			trade.setTradate(str1);
			trade.setUserid(Integer.valueOf(userid));		
			String result = "交易失败！";
			if (tradeCtrl.operationTrade("添加", trade)) {
				result = "记录添加成功！";
			}
			if (money > 0) {
				System.out.println(y + "年" + m + "月" + d + "日存入" + money + "余额" + all);
			} else {
				System.out.println(y + "年" + m + "月" + d + "日取出" + (-1 * money) + "余额" + all);
			}
			return jilu+1;
	}

}


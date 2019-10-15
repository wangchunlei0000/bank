package suanfa;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Scanner;

import bean.Account;
import bean.TimeType;
import bean.Trade;
import ctrl.AccountCtrl;
import ctrl.TimeTypeCtrl;
import ctrl.TradeCtrl;

public class Dingqi {
	String str[];
	String inputStr;//输入字符串“2017-01-01 100 12 2018-02-02 5000”
	String startDate;//存款日期
	String endDate;//到期日期
	String currentDate;//当前取款日期
	double inputMoney;//存款金额
	double outputMoney;//取款金额
	int term;//存款期限
	double r=0;//当前业务的定期利率
	double i1=0;//活期钱数
	double i2=0;//定期钱数
	long days=0;//超出天数
	int userid=0;
	double money=0;
	Long accid;
	double outputM=0;
	double lixi=0;
	int jilu=0;
	
	TimeTypeCtrl timeTypeCtrl = new TimeTypeCtrl();
	TimeType timeType=new TimeType();
	double hq=0;
//	public static final double []rate=new double[]{0.0135,0.0155,0.0175,0.0225,0.0275};//定期利率
//	public static final double hq=0.003;//活期存款利率
	/**
	 * @param args
	 */
	//计算两个日期之间的天数
	public long dateToDate(String date1,String date2)throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date d1=sdf.parse(date1);
		Date d2=sdf.parse(date2);
		System.out.println((d2.getTime()-d1.getTime())/(1000*3600*24));
		return (d2.getTime()-d1.getTime())/(1000*3600*24);
	}
	public Dingqi(Long id ,String startDate ,double inputMoney ,double money,int term,String endDate,double outputMoney,int userid) throws ParseException {
		// TODO Auto-generated method stub
		timeType = timeTypeCtrl.getRate(Integer.valueOf(1));
		hq=timeType.getRate();
		accid=id;
		this.userid=userid;
		DecimalFormat df=new DecimalFormat("##0.00");//精确小数点后两位
//		System.out.println("     存款日期        "+"存款金额        "+"期限（月）        "+"取款日期           "+"取款金额         ");
//		System.out.print("该账户余额为  ");
		timeType = timeTypeCtrl.getRate(Integer.valueOf(term));
		r=timeType.getRate();
//		switch(term){//确定当前定期业务的存款利率
//		case 3:r=rate[0];break;
//		case 6:r=rate[1];break;
//		case 12:r=rate[2];break;
//		case 24:r=rate[3];break;
//		case 36:r=rate[4];break;		
//		}
		System.out.println("r："+r);
		System.out.println("hq:"+hq);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String str = sdf.format(new Date());
		currentDate=str;
		Date date=sdf.parse(startDate);
		Calendar c=Calendar.getInstance();
     	c.setTime(date);
    	c.add(c.MONTH, term);
     	
     	int result=currentDate.compareTo(endDate);//到期日期和当前取款日期
     	if(result>0){
     		String lastDate=endDate;
     		double sum=0;
     		while(result>0){
     			sum=inputMoney*(r/12)*term;
     			i2+=sum;//i2:定期利息
     			inputMoney+=sum;//本金加利息
     			money+=sum;
     			AccountCtrl accountCtrl = new AccountCtrl();
    			Account account = accountCtrl.getAccount(accid);
    			Trade trade = new Trade();
    			TradeCtrl tradeCtrl = new TradeCtrl();
    			trade.setAccid(Long.valueOf(accid));
    			trade.setTratypeid(Integer.valueOf(account.getTratypeid()));
    			trade.setTramoney(Double.valueOf(0));
    			trade.setMoney(Double.valueOf(money));
    			trade.setInterest(Double.valueOf(sum));
    			trade.setTradate(endDate);
    			trade.setUserid(Integer.valueOf(userid));		
    			String result1 = "交易失败！";
    			if (tradeCtrl.operationTrade("添加", trade)) {
    				result1 = "记录添加成功！";
    				jilu+=1;
    			}
    			account.setDmoney(inputMoney);
    			account.setMoney(money);
    			System.out.println("dmoney1："+inputMoney);
    			System.out.println("money1："+money);
    			accountCtrl.operationAccount("定期取款", account);
     			lastDate=endDate;//另一个定期的开始
     			c.add(c.MONTH, term);
     			endDate=sdf.format(c.getTime());
     			System.out.println("endDate:"+endDate);
     			result=currentDate.compareTo(endDate);
     		}
     		days=dateToDate(lastDate,currentDate);
     		if(money==outputMoney){
     			i1=inputMoney*days*hq/360;
     			lixi=i1;
     			outputM=i1+money;
     			money=0;
     			df.format(money);
     			System.out.println("dmoney1if："+inputMoney);
    			System.out.println("money1if："+money);
     		}else{
     			i1=outputMoney*days*hq/360;
     			lixi=i1+i2;
     			outputM=outputMoney;
     			money=inputMoney+i1-outputMoney;
     			inputMoney=inputMoney-outputMoney;
     			df.format(money);
     			System.out.println("dmoney1else："+inputMoney);
    			System.out.println("money1else："+money);
     		}	
     	}else if(result==0){
     		double sum=0;
     		if(money==outputMoney){
     			sum=inputMoney*(r/12)*term;
     			lixi=sum;
     			outputM=sum+money;
     			money=0;
     			df.format(money);
     			System.out.println("dmoney2if："+inputMoney);
    			System.out.println("money2if："+money);
     		}else{
     			sum=inputMoney*(r/12)*term;
     			lixi=sum;
     			outputM=outputMoney;
     			money=inputMoney+sum-outputMoney;
     			inputMoney=inputMoney-outputMoney;
     			df.format(money);
     			System.out.println("dmoney2else："+inputMoney);
    			System.out.println("money2else："+money);
     		}	
     	}else{
     		days=dateToDate(startDate, currentDate);
     		double sum=0;
     		if(money==outputMoney){
     			i1=outputMoney*days*hq/360;
     			lixi=i1;
     			outputM=i1+money;
     			money=0;
     			df.format(money);
     			System.out.println("dmoney3if："+inputMoney);
    			System.out.println("money3if："+money);
     		}else{
     			i1=outputMoney*days*hq/360;
     			lixi=i1;
     			outputM=outputMoney;
     			money=inputMoney+i1-outputMoney;
     			inputMoney=inputMoney-outputMoney;
     			df.format(money);
     			System.out.println("dmoney3else："+inputMoney);
    			System.out.println("money3else："+money);
     		}
     	}
     	this.money=money;
     	this.outputM=outputM;
     	this.inputMoney=inputMoney;
     	this.lixi=lixi;
     	this.endDate=endDate;
//     	yue=inputMoney+i1+i2-outputMoney;
     	//return (inputMoney+i1+i2-outputMoney);		
	}
	public int main() throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String str = sdf.format(new Date());
		AccountCtrl accountCtrl = new AccountCtrl();
		Account account = accountCtrl.getAccount(accid);
		Trade trade = new Trade();
		TradeCtrl tradeCtrl = new TradeCtrl();
		trade.setAccid(Long.valueOf(accid));
		trade.setTratypeid(Integer.valueOf(account.getTratypeid()));
		trade.setTramoney(Double.valueOf((-1)*outputM));
		trade.setMoney(Double.valueOf(money));
		trade.setInterest(Double.valueOf(lixi));
		trade.setTradate(str);
		trade.setUserid(Integer.valueOf(userid));		
		String result1 = "交易失败！";
		if (tradeCtrl.operationTrade("添加", trade)) {
			result1 = "记录添加成功！";
			System.out.println("记录添加成功！");
		}
		account.setDmoney(inputMoney);
		account.setMoney(money);
		DecimalFormat df=new DecimalFormat("##0.00");//精确小数点后两位
		if(df.format(money).equals("0.00")){
			account.setAccconid(3);
		}else{
			account.setAccconid(1);
		}
		account.setEndate(endDate);
		accountCtrl.operationAccount("定期取款销户", account);
		return jilu+1;
	}
}

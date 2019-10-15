package suanfa;

import java.text.DecimalFormat;

import bean.TimeType;
import bean.Trade;
import ctrl.TimeTypeCtrl;
import ctrl.TradeCtrl;

public class Daikuan {
//初始化
	String s1;
	double m;
	int c;//贷款类型
	int n;
	int term;
	TimeTypeCtrl timeTypeCtrl = new TimeTypeCtrl();
	TimeType timeType=new TimeType();
	int userid=0;
	Long accid;
	int tratypeid=0;
	double mo=0;
	double yue=0;
	public Daikuan(Long accid,int tratypeid,double yue,String date,double money,int mode,int term,int userid){

		s1=date;//贷款日期
		m=money;//贷款金额
		c=mode;//还款方式
		timeType=timeTypeCtrl.getRate(term);//id查询贷款期限纪录 
		n=timeType.getTimes();//月数
		mo=money;//贷款金额
		this.userid=userid;
		this.accid=accid;
		this.tratypeid=tratypeid;//存款类型
		this.yue=yue;  
	}

	public String main() {
		// TODO Auto-generated method stub		
		double lv;
		double eb=m/n;//本金/月
		double sum=m;//贷款总额
		double eh;
		double el=0;
		double a=0;
		double b=0;
		String w=null;
		timeType = timeTypeCtrl.getRate(Integer.valueOf(term));
		lv=timeType.getRate();//利率
		DecimalFormat df=new DecimalFormat("##0.00");//精确小数点后两位
		if(c==1){
			//等额本金   eb:（本金/月数）+el:（本金-还金额）*月利率
			for(int i=0;i<n;i++){			
			    el=m*lv/12;   //每个月减少一个月的还款额*月利率
			    m=m-eb;
			    eh=eb+el; //月还款
			    System.out.println("第"+(i+1)+"期 "+"  "+eh+"   本金"+eb+"  利息"+el);
			    sum=sum+el;//总共还款额
			    if(i==0){
			    	a=eh;
			    }
			}
			b=sum-mo;//总利息
			w=df.format(sum)+" "+df.format(a)+" "+df.format(el)+" "+df.format(b);//精确
			System.out.println("总共还"+sum);
			System.out.println(w);
		}
		if(c==2){
			
			//  本金*月利率*（1+月利率）^还款月数  /（1+月利率）^ 还款月数  -1
			eb=(m*(lv/12)*Math.pow((1+lv/12),n))/(Math.pow((1+lv/12),n)-1);
			for(int j=1;j<=n;j++){
				double eb1=m*(lv/12)*Math.pow((1+lv/12),(j-1))/(Math.pow((1+lv/12),n)-1);
				el=eb-eb1;
				System.out.println("第"+j+"期 "+"  "+eb+"   本金"+eb1+"  利息"+el);
				if(j==1){
			    	a=eb;
			    }
			}
			sum=eb*n;
			System.out.println("总共还"+sum);
			b=sum-mo;
			w=df.format(sum)+" "+df.format(a)+" "+0+" "+df.format(b);
		}
		Trade trade=new Trade();
		TradeCtrl tradeCtrl=new TradeCtrl();
		trade.setAccid(accid);
		trade.setTratypeid(tratypeid);
		trade.setTramoney((-1)*mo);
		trade.setMoney(yue);
		trade.setInterest(b);
		trade.setTradate(s1);
		trade.setUserid(userid);
		tradeCtrl.operationTrade("添加", trade);
		return w;
	}

}


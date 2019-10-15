package bean;

import java.math.BigDecimal;
import java.util.Date;

public class Account {

	private Long accid;//账号
	private String accname="";//姓名
	private String accsex="";//性别
	private String accsfzh="";//开户身份证号
	private String acctel="";//开户人手机号
	private String accpwd="";//开户密码
	private Integer tratypeid;//交易类型编号
	private Integer timeid;//年限编号
	private Double dmoney;//定期金额
	private Double money;//余额
	private String loantype;//贷款类型
	private Double loanmoney;//贷款金额
	private String paper;//证件
	private String loandate;//贷款日期
	private Integer accconid=-1;//账户状态编号	
	private String stdate;//开户日期
	private String endate;//定期结束日期
	private Integer userid;//员工编号
	private String openb="";//开户行
	public Long getAccid() {
		return accid;
	}
	public void setAccid(Long accid) {
		this.accid = accid;
	}
	public String getAccname() {
		return accname;
	}
	public void setAccname(String accname) {
		this.accname = accname;
	}
	public String getAccsex() {
		return accsex;
	}
	public void setAccsex(String accsex) {
		this.accsex = accsex;
	}
	public String getAccsfzh() {
		return accsfzh;
	}
	public void setAccsfzh(String accsfzh) {
		this.accsfzh = accsfzh;
	}
	public String getAcctel() {
		return acctel;
	}
	public void setAcctel(String acctel) {
		this.acctel = acctel;
	}
	public String getAccpwd() {
		return accpwd;
	}
	public void setAccpwd(String accpwd) {
		this.accpwd = accpwd;
	}
	public Integer getTratypeid() {
		return tratypeid;
	}
	public void setTratypeid(Integer tratypeid) {
		this.tratypeid = tratypeid;
	}
	public Integer getTimeid() {
		return timeid;
	}
	public void setTimeid(Integer timeid) {
		this.timeid = timeid;
	}
	public Double getDmoney() {
		return dmoney;
	}
	public void setDmoney(Double dmoney) {
		this.dmoney = dmoney;
	}
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	public String getLoantype() {
		return loantype;
	}
	public void setLoantype(String loantype) {
		this.loantype = loantype;
	}
	public Double getLoanmoney() {
		return loanmoney;
	}
	public void setLoanmoney(Double loanmoney) {
		this.loanmoney = loanmoney;
	}
	public String getPaper() {
		return paper;
	}
	public void setPaper(String paper) {
		this.paper = paper;
	}
	public String getLoandate() {
		return loandate;
	}
	public void setLoandate(String loandate) {
		this.loandate = loandate;
	}
	public Integer getAccconid() {
		return accconid;
	}
	public void setAccconid(Integer accconid) {
		this.accconid = accconid;
	}
	public String getStdate() {
		return stdate;
	}
	public void setStdate(String stdate) {
		this.stdate = stdate;
	}
	public String getEndate() {
		return endate;
	}
	public void setEndate(String endate) {
		this.endate = endate;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getOpenb() {
		return openb;
	}
	public void setOpenb(String openb) {
		this.openb = openb;
	}
}

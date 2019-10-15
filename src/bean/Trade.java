package bean;

import java.util.Date;

public class Trade {

	private Integer traid=-1;//流水号
	private Long accid;//账号
	private Integer tratypeid=-1;//交易类型编号
	private Double tramoney;//交易金额
	private Double money;//余额
	private Double interest;//利息
	private String tradate;//交易日期
	private Integer userid=-1;//员工编号
	public Integer getTraid() {
		return traid;
	}
	public void setTraid(Integer traid) {
		this.traid = traid;
	}
	public Long getAccid() {
		return accid;
	}
	public void setAccid(Long accid) {
		this.accid = accid;
	}
	public Integer getTratypeid() {
		return tratypeid;
	}
	public void setTratypeid(Integer tratypeid) {
		this.tratypeid = tratypeid;
	}
	public Double getTramoney() {
		return tramoney;
	}
	public void setTramoney(Double tramoney) {
		this.tramoney = tramoney;
	}
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	public Double getInterest() {
		return interest;
	}
	public void setInterest(Double interest) {
		this.interest = interest;
	}
	public String getTradate() {
		return tradate;
	}
	public void setTradate(String tradate) {
		this.tradate = tradate;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	
}

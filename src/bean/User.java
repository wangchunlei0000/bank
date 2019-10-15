package bean;

import java.util.Date;

public class User {
	private Integer userid=0;//员工编号
	private String username="";//员工姓名
	private String usersex;//性别
	private String usersfzh="";//员工身份证号
	private String userpwd="";//员工密码
	private Integer workconid=-1;//员工状态编号
	private String workdate;//入职时间
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUsersex() {
		return usersex;
	}
	public void setUsersex(String usersex) {
		this.usersex = usersex;
	}
	public String getUsersfzh() {
		return usersfzh;
	}
	public void setUsersfzh(String usersfzh) {
		this.usersfzh = usersfzh;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public Integer getWorkconid() {
		return workconid;
	}
	public void setWorkconid(Integer workconid) {
		this.workconid = workconid;
	}
	public String getWorkdate() {
		return workdate;
	}
	public void setWorkdate(String workdate) {
		this.workdate = workdate;
	}
		
}

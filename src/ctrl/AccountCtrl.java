package ctrl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Account;
import conn.DBConn;

/*
 * 
 * 对acc表进行增改
 */
public class AccountCtrl {
	private DBConn connection = null;
	private Account account=null;
    public AccountCtrl(){
    	connection=new DBConn();
    }
    public boolean operationAccount(String operation, Account account) {
		boolean flag = false;
		String sql = null;
		if (operation.equals("添加"))
			sql = "insert into acc values ('" + account.getAccid() + "','"
					+ account.getAccname() + "','" + account.getAccsex() + "','"
					+ account.getAccsfzh() + "','" + account.getAcctel() + "','"
					+ account.getAccpwd() + "','" + account.getTratypeid() + "','"
					+ account.getTimeid() + "','" + account.getDmoney() + "','"
					+ account.getMoney() + "','" + account.getLoantype() + "','"
					+ account.getLoanmoney() + "','" + account.getPaper() + "','"
					+ account.getLoandate() + "','" + account.getAccconid() + "','"
					+ account.getStdate() + "','" + account.getEndate() + "','"
					+ account.getUserid() + "','" + account.getOpenb() + "')";
		if (operation.equals("删除"))
			sql = "delete from acc where accid='" + account.getAccid() + "',accpwd='" +account.getAccpwd()
					+ "',accconid='" +account.getAccconid() + "' where accid='" + account.getAccid() + "'";
		if (operation.equals("修改"))
			sql = "update acc set acctel='" + account.getAcctel() + "',accpwd='" +account.getAccpwd()
					+ "',accconid='" +account.getAccconid() + "' where accid='" + account.getAccid() + "'";
		if (operation.equals("销户"))
			sql = "update acc set accconid='" + account.getAccconid() +"',money='" +account.getMoney()
			+ "'where accid='" + account.getAccid() + "'";
		if (operation.equals("挂失"))
			sql = "update acc set accconid='" + account.getAccconid() + "'where accid='" + account.getAccid() + "'";
		if (operation.equals("存款"))
			sql = "update acc set money='" + account.getMoney() + "'where accid='" + account.getAccid() + "'";
		if (operation.equals("取款"))
			sql = "update acc set money='" + account.getMoney() + "'where accid='" + account.getAccid() + "'";
		if (operation.equals("修改密码"))
			sql = "update acc set accpwd='" + account.getAccpwd() + "'where accid='" + account.getAccid() + "'";
		if (operation.equals("修改手机号"))
			sql = "update acc set acctel='" + account.getAcctel() + "'where accid='" + account.getAccid() + "'";
		if (operation.equals("定期取款"))
			sql = "update acc set dmoney='" + account.getDmoney() + "',money='" + account.getMoney() + "'where accid='" + account.getAccid() + "'";
		if (operation.equals("定期取款销户"))
			sql = "update acc set dmoney='" + account.getDmoney() + "',money='" + account.getMoney() 
			        + "',accconid='" + account.getAccconid()  + "',endate='" + account.getEndate() + "'where accid='" + account.getAccid() + "'";
		if (operation.equals("贷款"))
			sql = "update acc set tratypeid='" + account.getTratypeid() + "',timeid='" + account.getTimeid() 
			        + "',loantype='" + account.getLoantype() + "',loanmoney='" + account.getLoanmoney() 
			        + "',paper='" + account.getPaper() + "',loandate='" + account.getLoandate() + "'where accid='" + account.getAccid() + "'";
		if (connection.executeUpdate(sql)) {
			flag = true;
		}
		return flag;
	}
    public List queryAccount(Long accid) {
		List list = new ArrayList();
		String sql = null;
		if (accid == null)
			sql = "select * from acc";
		else
			sql = "select * from acc where accid='" + accid	+ "' order by id desc";
		ResultSet rs = connection.executeQuery(sql);
		try {
			while (rs.next()) {
				account =new Account();
				account.setAccid(rs.getLong(1));
				account.setAccname(rs.getString(2));
				account.setAccsex(rs.getString(3));
				account.setAccsfzh(rs.getString(4));
				account.setAcctel(rs.getString(5));
				account.setAccpwd(rs.getString(6));
				account.setTratypeid(rs.getInt(7));
				account.setTimeid(rs.getInt(8));
				account.setDmoney(rs.getDouble(9));
				account.setMoney(rs.getDouble(10));
				account.setLoantype(rs.getString(11));
				account.setLoanmoney(rs.getDouble(12));
				account.setPaper(rs.getString(13));
				account.setLoandate(rs.getString(14));
				account.setAccconid(rs.getInt(15));
				account.setStdate(rs.getString(16)); 
				account.setEndate(rs.getString(17));  
				account.setUserid(rs.getInt(18));
				account.setOpenb(rs.getString(19));
				list.add(account);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
    // 以账号为查询条件，查询一组数据
	public Account getAccount(Long accid) {
		String sql = "select * from acc where accid='" + accid + "'";
		try {
			ResultSet rs = connection.executeQuery(sql);
			while (rs.next()) {
				account = new Account();
				account =new Account();
				account.setAccid(rs.getLong(1));
				account.setAccname(rs.getString(2));
				account.setAccsex(rs.getString(3));
				account.setAccsfzh(rs.getString(4));
				account.setAcctel(rs.getString(5));
				account.setAccpwd(rs.getString(6));
				account.setTratypeid(rs.getInt(7));
				account.setTimeid(rs.getInt(8));
				account.setDmoney(rs.getDouble(9));
				account.setMoney(rs.getDouble(10));
				account.setLoantype(rs.getString(11));
				account.setLoanmoney(rs.getDouble(12));
				account.setPaper(rs.getString(13));
				account.setLoandate(rs.getString(14));
				account.setAccconid(rs.getInt(15));
				account.setStdate(rs.getString(16)); 
				account.setEndate(rs.getString(17));  
				account.setUserid(rs.getInt(18));
				account.setOpenb(rs.getString(19));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		connection.closeConnection();
		return account;
	}
	
	public List sfzhAccount(String accsfzh) {
		List list = new ArrayList();
		String sql = null;
		if (accsfzh == null)
			sql = "select * from acc";
		else
			sql = "select * from acc where accsfzh='" + accsfzh	+ "'";
		ResultSet rs = connection.executeQuery(sql);
		try {
			while (rs.next()) {
				account =new Account();
				account.setAccid(rs.getLong(1));
				account.setAccname(rs.getString(2));
				account.setAccsex(rs.getString(3));
				account.setAccsfzh(rs.getString(4));
				account.setAcctel(rs.getString(5));
				account.setAccpwd(rs.getString(6));
				account.setTratypeid(rs.getInt(7));
				account.setTimeid(rs.getInt(8));
				account.setDmoney(rs.getDouble(9));
				account.setMoney(rs.getDouble(10));
				account.setLoantype(rs.getString(11));
				account.setLoanmoney(rs.getDouble(12));
				account.setPaper(rs.getString(13));
				account.setLoandate(rs.getString(14));
				account.setAccconid(rs.getInt(15));
				account.setStdate(rs.getString(16)); 
				account.setEndate(rs.getString(17));  
				account.setUserid(rs.getInt(18));
				account.setOpenb(rs.getString(19));
				list.add(account);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}

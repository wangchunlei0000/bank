package ctrl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.AccountType;

import conn.DBConn;


public class AccountTypeCtrl {

	private DBConn connection = null;
	private AccountType accountType=null;
    public AccountTypeCtrl(){
    	connection=new DBConn();
    }
	public List queryAccountTypeAll() {
		List list = new ArrayList();
		String sql = null;
		sql = "select * from acccon order by id desc";
		ResultSet rs = connection.executeQuery(sql);
		try {
			while (rs.next()) {
				AccountType	accountType = new AccountType();
				accountType.setAccconid(rs.getInt(1));
				accountType.setAcccon(rs.getString(2));
				list.add(accountType);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}

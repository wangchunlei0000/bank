package ctrl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.UserType;

import conn.DBConn;

public class UserTypeCtrl {

	private DBConn connection = null;
	private UserType userType=null;
    public UserTypeCtrl(){
    	connection=new DBConn();
    }
	public List queryUserTypeAll() {
		List list = new ArrayList();
		String sql = null;
		sql = "select * from workcon order by id desc";
		ResultSet rs = connection.executeQuery(sql);
		try {
			while (rs.next()) {
				UserType userType = new UserType();
				userType.setWorkconid(rs.getInt(1));
				userType.setWorkcon(rs.getString(2));
				list.add(userType);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}

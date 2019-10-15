package ctrl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Account;
import bean.User;

import conn.DBConn;


 //对user表进行增删查改
 
public class UserCtrl {
	private DBConn connection = null;
	private User user=null;
    public UserCtrl(){
    	connection=new DBConn();
    }
    public boolean operationUser(String operation, User user) {
    	boolean flag = false;
		String sql = null;
		if (operation.equals("添加"))
			sql = "insert into users values ('" + user.getUserid() + "','"
					+ user.getUsername() + "','" + user.getUsersex() + "','"
					+ user.getUsersfzh() + "','" + user.getUserpwd() + "','"
					+ user.getWorkconid() + "','" + user.getWorkdate() + "')";
		if (operation.equals("修改"))
			sql = "update users set userpwd='" + user.getUserpwd()
					+ "',workconid='" +user.getWorkconid()+ "' where userid='" + user.getUserid() + "'";
		if (operation.equals("修改状态"))
			sql = "update users set workconid='" + user.getWorkconid()+ "' where userid='" + user.getUserid() + "'";
		if (connection.executeUpdate(sql)) {
			flag = true;
		}
		return flag;
	}
    public List queryUser(Integer userid) {
		List list = new ArrayList();
		String sql = null;
		if (userid == null)
			sql = "select * from users";
		else
			sql = "select * from users where userid='" + userid
					+ "'";
		ResultSet rs = connection.executeQuery(sql);
		try {
			while (rs.next()) {
				user =new User();
				user.setUserid(rs.getInt(1));
				user.setUsername(rs.getString(2));
				user.setUsersex(rs.getString(3));
				user.setUsersfzh(rs.getString(4));
				user.setUserpwd(rs.getString(5));	
                user.setWorkconid(rs.getInt(6));
                user.setWorkdate(rs.getString(7));
				list.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
    // 以员工编号为查询条件，查询一组数据
	public User getUser(Integer userid) {
		String sql = "select * from users where userid='" + userid + "'";
		try {
			ResultSet rs = connection.executeQuery(sql);
			while (rs.next()) {
				user = new User();
				user.setUserid(rs.getInt(1));
				user.setUsername(rs.getString(2));
				user.setUsersex(rs.getString(3));
				user.setUsersfzh(rs.getString(4));
				user.setUserpwd(rs.getString(5));	
                user.setWorkconid(rs.getInt(6));
                user.setWorkdate(rs.getString(7));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		connection.closeConnection();
		return user;
	}
	// 根据在职情况查询所有的数据
	public List getUserList(Integer workconid) {
		List list = new ArrayList();
		String sql = "select * from users where workconid='" + workconid + "'";
		try {
			ResultSet rs = connection.executeQuery(sql);
			while (rs.next()) {
				user = new User();
				user.setUserid(rs.getInt(1));
				user.setUsername(rs.getString(2));
				user.setUsersex(rs.getString(3));
				user.setUsersfzh(rs.getString(4));
				user.setUserpwd(rs.getString(5));	
                user.setWorkconid(rs.getInt(6));
                user.setWorkdate(rs.getString(7));
				list.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		connection.closeConnection();
		return list;
	}

	public void closeConnection() {
		connection.closeConnection();
	}
}

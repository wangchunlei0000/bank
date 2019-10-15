package ctrl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.TimeType;
import conn.DBConn;

public class TimeTypeCtrl {

	private DBConn connection = null;
	private TimeType timeType=null;
    public TimeTypeCtrl(){
    	connection=new DBConn();
    }
    public boolean operationTimeType(String operation, TimeType timeType) {
    	boolean flag = false;
		String sql = null;
		if (operation.equals("添加"))
			sql = "insert into timetype values ('" + timeType.getTimeid() + "','"
					+ timeType.getTimes() + "','" + timeType.getRate() + "')";
		if (operation.equals("修改活期利率"))
			sql = "update timetype set rate='" + timeType.getRate() + "' where timeid = 1";
		if (operation.equals("修改定期利率"))
			sql = "update timetype set rate='" + timeType.getRate() + "' where timeid = '" +timeType.getTimeid()+"'";
		if (operation.equals("修改房贷利率"))
			sql = "update timetype set rate='" + timeType.getRate() + "' where timeid = '" +timeType.getTimeid()+"'";
		if (connection.executeUpdate(sql)) {
			flag = true;
		}
		return flag;
	}

    // 以timeid为查询条件，查询一组数据
	public TimeType getRate(Integer timeid) {
		String sql = "select * from timetype where timeid='" + timeid + "'";
		try {
			ResultSet rs = connection.executeQuery(sql);
			while (rs.next()) {
				timeType = new TimeType();
				timeType.setTimeid(rs.getInt(1));
				timeType.setTimes(rs.getInt(2));
				timeType.setRate(rs.getDouble(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		connection.closeConnection();
		return timeType;
	}

	public void closeConnection() {
		connection.closeConnection();
	}
}

package ctrl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.TradeType;

import conn.DBConn;

public class TradeTypeCtrl {

	private DBConn connection = null;
	private TradeType tradeType=null;
    public TradeTypeCtrl(){
    	connection=new DBConn();
    }
	public List queryTradeTypeAll() {
		List list = new ArrayList();
		String sql = null;
		sql = "select * from tratype order by id desc";
		ResultSet rs = connection.executeQuery(sql);
		try {
			while (rs.next()) {
				TradeType tradeType = new TradeType();
				tradeType.setTratypeid(rs.getInt(1));
				tradeType.setTratype(rs.getString(2));
				list.add(tradeType);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}

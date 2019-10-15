package ctrl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Trade;

import conn.DBConn;

/*
 * 
 * 对tra表进行增删查改
 */
public class TradeCtrl {
	private DBConn connection = null;
	private Trade trade=null;
    public TradeCtrl(){
    	connection=new DBConn();
    }
    public boolean operationTrade(String operation, Trade trade) {
		boolean flag = false;
		String sql = null;
		if (operation.equals("添加"))
			sql = "insert into tra values ('" + trade.getAccid() + "','"
					+ trade.getTratypeid()+ "','" + trade.getTramoney() + "','"
					+ trade.getMoney() + "','" + trade.getInterest() + "','"
					+ trade.getTradate() + "','" + trade.getUserid() + "')";
		if (operation.equals("查值"))
			sql = "select money from tra where accid='" + trade.getAccid() + "'";
		if (connection.executeUpdate(sql)) {
			flag = true;
		}
		return flag;
	}
    
    public Trade researchMoney(Long accid){
    	String sql = null;
    	if (accid == null)
			sql = "select * from tra";
		else
    	    sql = "select top 1 * from tra where accid='" + accid + "' order by traid desc";
    	ResultSet rs = connection.executeQuery(sql);
    	try {
			while (rs.next()) {
				trade =new Trade();
				trade.setTraid(rs.getInt(1));
				trade.setAccid(rs.getLong(2));
				trade.setTratypeid(rs.getInt(3));
				trade.setTramoney(rs.getDouble(4));
				trade.setMoney(rs.getDouble(5));
				trade.setInterest(rs.getDouble(6));
				trade.setTradate(rs.getString(7));
				trade.setUserid(rs.getInt(8));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return trade;
    }
        
    public List JxTrade(Long accid,Integer number) {
		List list = new ArrayList();
		String sql = null;
		if (accid == null)
			sql = "select * from tra";
		else
			sql = "select top "+ number +" * from tra where accid='" + accid + "' order by traid desc";
		ResultSet rs = connection.executeQuery(sql);
		try {
			while (rs.next()) {
				trade =new Trade();
				trade.setTraid(rs.getInt(1));
				trade.setAccid(rs.getLong(2));
				trade.setTratypeid(rs.getInt(3));
				trade.setTramoney(rs.getDouble(4));
				trade.setMoney(rs.getDouble(5));
				trade.setInterest(rs.getDouble(6));
				trade.setTradate(rs.getString(7));
				trade.setUserid(rs.getInt(8));
				list.add(trade);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
    
    public Trade researchJilu(Long accid){
    	String sql = null;
    	if (accid == null)
			sql = "select * from tra";
		else
    	    sql = "select * from tra where accid='" + accid + "'";
    	ResultSet rs = connection.executeQuery(sql);
    	try {
			while (rs.next()) {
				trade =new Trade();
				trade.setTraid(rs.getInt(1));
				trade.setAccid(rs.getLong(2));
				trade.setTratypeid(rs.getInt(3));
				trade.setTramoney(rs.getDouble(4));
				trade.setMoney(rs.getDouble(5));
				trade.setInterest(rs.getDouble(6));
				trade.setTradate(rs.getString(7));
				trade.setUserid(rs.getInt(8));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return trade;
    }
 
}

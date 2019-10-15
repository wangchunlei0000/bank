package conn;

import java.sql.*;

public class DBConn {
	private final String DRIVER="com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private final String url = "jdbc:sqlserver://localhost:1433;dataBasename=Bank";
    private final String userName = "sa";
    private final String password = "123";
    private Connection con = null;
//通过构造方法加载数据库驱动
    static {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance(); 
        } catch (Exception ex) {
            System.out.println("数据库加载失败");
        }
    }
//创建数据库连接
    public boolean creatConnection() {
        try {
            con = DriverManager.getConnection(url, userName, password);
            con.setAutoCommit(true);

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println("creatConnectionError!");
        }
        return true;
    }
//对数据库的增加、修改和删除的操作
    public boolean executeUpdate(String sql) {
         if (con == null) {
            creatConnection();
        }
        try {
            Statement stat = con.createStatement();
            int iCount = stat.executeUpdate(sql);
            System.out.println("操作成功，所影响的记录数为" + String.valueOf(iCount));
		    return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
		    return false;
        }   
    }
//对数据库的查询操作
    public ResultSet executeQuery(String sql) {
        ResultSet rs;
        try {
            if (con == null) {
                creatConnection();
            }
            Statement stat = con.createStatement();
            try {
                rs = stat.executeQuery(sql);
            } catch (SQLException e) {
                System.out.println(e.getMessage());
                return null;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println("executeQueryError!");
            return null;
        }
        return rs;
    }
//关闭数据库的操作
    public void closeConnection(ResultSet rs,Statement stat,Connection con) {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace(); //To change body of catch statement use File | Settings | File Templates.
                System.out.println("Failed to close connection!");
            } finally {
                con = null;
            }
        }
    }
    public void closeConnection() {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace(); //To change body of catch statement use File | Settings | File Templates.
                System.out.println("Failed to close connection!");
            } finally {
                con = null;
            }
        }
    }
    public Connection getConn(){
		try{
		Class.forName(DRIVER);
	    con=DriverManager.getConnection(url,userName,password);
		}catch(ClassNotFoundException e){
			System.out.println("加载驱动失败！"+e.toString());
		}catch(SQLException e){
			System.out.println("数据库操作了失败！"+e.toString());
		}finally{
	    
		}
		return con;
	}
}

package conn;

import java.sql.*;

public class DBConn {
	private final String DRIVER="com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private final String url = "jdbc:sqlserver://localhost:1433;dataBasename=Bank";
    private final String userName = "sa";
    private final String password = "123";
    private Connection con = null;
//ͨ�����췽���������ݿ�����
    static {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance(); 
        } catch (Exception ex) {
            System.out.println("���ݿ����ʧ��");
        }
    }
//�������ݿ�����
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
//�����ݿ�����ӡ��޸ĺ�ɾ���Ĳ���
    public boolean executeUpdate(String sql) {
         if (con == null) {
            creatConnection();
        }
        try {
            Statement stat = con.createStatement();
            int iCount = stat.executeUpdate(sql);
            System.out.println("�����ɹ�����Ӱ��ļ�¼��Ϊ" + String.valueOf(iCount));
		    return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
		    return false;
        }   
    }
//�����ݿ�Ĳ�ѯ����
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
//�ر����ݿ�Ĳ���
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
			System.out.println("��������ʧ�ܣ�"+e.toString());
		}catch(SQLException e){
			System.out.println("���ݿ������ʧ�ܣ�"+e.toString());
		}finally{
	    
		}
		return con;
	}
}

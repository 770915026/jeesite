package com.thinkgem.jeesite.modules.tmc.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectionUtils {
	private static String url="jdbc:oracle:thin:@10.5.66.21:1521:crs";
    private static String driver="oracle.jdbc.driver.OracleDriver";
    private static String username="tewz";
    private static String password="tewz";
//	private static String url="jdbc:oracle:thin:@localhost:1521:orcl";
//    private static String driver="oracle.jdbc.driver.OracleDriver";
//    private static String username="TMC9081";
//    private static String password="123456";
    private static Connection conn=null;
    
    	 
    public static Connection getConnection(){
    	try {
    		if(conn==null || conn.isClosed()){
    			Class.forName(driver);
    			conn = DriverManager.getConnection(url, username, password);
    		}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return conn;
    }
    
}

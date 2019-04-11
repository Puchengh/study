package com.puchen.java;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcUtil {

	private static String dirver = "org.apache.hive.jdbc.HiveDriver";
	private static String url = "jdbc:hive://192.168.31.205:10000/shxy_ods_safe";
	
	//注册驱动
	static {
		try {
			Class.forName(dirver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new ExceptionInInitializerError(e);
		}
		
	}

	
	//获取连接
	public static Connection getConnection() {
		
		try {
			return DriverManager.getConnection(url);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//释放资源
	public static void release(Connection conn,Statement st,ResultSet rs ) {
		if(rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				rs = null;
			}
		}
		if(st != null) {
			try {
				st.close();
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				st = null;
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				conn = null;
			}
		}
	}
}

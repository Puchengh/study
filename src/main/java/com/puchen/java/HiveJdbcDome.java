package com.puchen.java;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class HiveJdbcDome {

	
	public static void main(String[] args) {
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		
		String str ="select * from hr_emp";
		
		try {
			//获取连接
			conn = JdbcUtil.getConnection();
			//创建运行环境
			st = conn.createStatement(); 
			//运行HQL
			rs = st.executeQuery(str);
			while(rs.next()) {
				//取出列
				Double id = rs.getDouble(1);				
				String name = rs.getString(2);
				System.out.println(id+"\t"+name);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//释放资源
			JdbcUtil.release(conn, st, rs);
		}
	}
}

package com.ibeifeng.ajax.util;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.mchange.v2.c3p0.ComboPooledDataSource;

public class C3p0Util {
	static ComboPooledDataSource ds = null;
	/*
	 * 加载驱动
	 */
	static {
		ds = new ComboPooledDataSource("myc3p0");
	}
	/*
	 * 获取连接
	 */
	public static Connection getConnWithC3p0() {
		try {
			return ds.getConnection();
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	/*
	 * 释放资源
	 */
	public static void close(Connection conn,PreparedStatement ps,ResultSet rs){
		try {
			if(conn != null) conn.close();
			if(ps != null) ps.close();
			if(rs !=null) rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

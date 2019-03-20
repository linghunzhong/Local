package com.jianli.search01;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class baseDao {
	/*
	 * 静态语句块
	 */

	static {
		// 加载驱动
		try {
			Class.forName(ConfigUtil.getValue("Driver"));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	// 获取连接
	private static Connection getCon() {
		try {
			return DriverManager.getConnection(ConfigUtil.getValue("url"), ConfigUtil.getValue("username"),
					ConfigUtil.getValue("password"));
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	/*
	 * / 释放资源
	 */

	private static void close(ResultSet rs, PreparedStatement ps, Connection con) {
		try {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/*
	 * 通用单个查询 sql SQL语句：DQL params 参数 return clz对象
	 */
	public static Object search(String sql, Object[] params, Class<?> clz) {// search
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			if (params != null && params.length > 0) {
				for (int i = 0; i < params.length; i++) {
					ps.setObject(i + 1, params[i]);
				}
			}
			rs = ps.executeQuery();// 返回的是结果集
			if (!rs.next()) { // 针对结果集进行判断是否有数据
				return null;
			}
			return doRusultSet(rs, clz);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs,ps,con);
		}
		return null;
	}

	public static List<?> searchList(String sql, Object[] params, Class<?> clz) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = getCon();
			ps = con.prepareStatement(sql);
			if (params != null && params.length > 0) {
				for (int i = 0; i < params.length; i++) {
					ps.setObject(i+1, params[i]);
				}
			}
			rs = ps.executeQuery();
			return doRusultSet(rs, clz);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs,ps,con);
		}
		return null;
	}
	
	private static List<Object> doRusultSet(ResultSet rs, Class<?> clz) {
		List<Object> list = new ArrayList<Object>();
		try {
			while (rs.next()) {
				ResultSetMetaData med = rs.getMetaData();
				int col = med.getColumnCount();
				Object obj = clz.newInstance();
				for (int i = 0; i < col; i++) {
					Object colValue = rs.getObject(i + 1);
					String coln = med.getColumnName(i + 1);
					Field f = clz.getDeclaredField(coln);
					f.setAccessible(true);
					f.set(obj, colValue);
				}
				list.add(obj);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return list;
	}


}

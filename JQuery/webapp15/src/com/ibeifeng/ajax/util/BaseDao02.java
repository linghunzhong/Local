package com.ibeifeng.ajax.util;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.ibeifeng.ajax.util.C3p0Util;

/*
 * JDBC操作Dao通用类V2.0
 */
public class BaseDao02 {
	/*集合查询
	 *@params sql DQL
	 *@params params 参数
	 *@params clz 类对象
	 *return 
	 */
	public static List<?> queryT(Class<?> clz,Connection conn,String sql,Object[] params){
		PreparedStatement ps= null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(sql);
			if(params != null && params.length > 0){
				for(int i=0;i<params.length;i++){
					ps.setObject(i+1, params[i]);
				}
			}
			rs = ps.executeQuery();
			return doResultSetList(rs,clz);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			C3p0Util.close(conn,ps,rs);
		}
		return null;
	}
	private static List<Object> doResultSetList(ResultSet rs,Class<?> clz){
		List<Object> list = new ArrayList<Object>();
		try {
			while(rs.next()){
			ResultSetMetaData metaData = rs.getMetaData();
			int colCount = metaData.getColumnCount();
			Object bean = clz.newInstance();
			for(int i=0;i<colCount;i++){
				Object colValue = rs.getObject(i+1);
				String colName = metaData.getColumnName(i+1);
				Field f = clz.getDeclaredField(colName);
				f.setAccessible(true);
				f.set(bean,colValue);
			}
			list.add(bean);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			e.printStackTrace();
		}
		return null;
	}
}

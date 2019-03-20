package com.jianli.search01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class Search {	
      public long countStu(String EMP_NAME){
      	String sql="select count(Id) total from Employee where EMP_NAME like ?";
          Object[] params={"%"+EMP_NAME+"%"};
          Pager page=(Pager) baseDao.search(sql,params,Pager.class);
          if(page != null){
          	return page.getTotal();
          }
		return 0l;
          } 
	  public List<EMP> pageEmp(int pageIndex,int pageSize,String EMP_NAME){
	    	String sql="select * from Employee where EMP_NAME like ? limit ?,?";
	    	int lim=(pageIndex-1)*pageSize;
	    	Object[] params={"%"+EMP_NAME+"%",lim,pageSize};
	    	List<EMP> list=(List<EMP>)baseDao.searchList(sql, params,EMP.class);
	    	return list;
	    }
}

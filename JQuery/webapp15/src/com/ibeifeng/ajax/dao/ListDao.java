package com.ibeifeng.ajax.dao;
import java.sql.Connection;
import java.util.List;
import com.ibeifeng.ajax.po.City;
import com.ibeifeng.ajax.po.District;
import com.ibeifeng.ajax.po.Province;
import com.ibeifeng.ajax.util.BaseDao02;
import com.ibeifeng.ajax.util.C3p0Util;

public class ListDao {
	//��ȡʡ�ݵı���
	public List<Province> queryProvinces(){
	Connection connection = C3p0Util.getConnWithC3p0();
	//ע��ʹ�ñ���
	String sql = "select id ID,province_name from province";
	try{
		List<Province> list = (List<Province>) BaseDao02.queryT(Province.class,connection,sql,null);
		return list;
	}catch (Exception e){
		e.printStackTrace();
	}finally{
		C3p0Util.close(connection,null,null);
	}
		return null;
	}
	/**
	 * ��ȡ���е��б�
	 * @param id
	 * @return
	 */
	public List<City> queryCities(int id){
		Connection connection = C3p0Util.getConnWithC3p0();
		//ע��ʹ�ñ���
		String sql = "select id,city_name,province_id from city where province_id = ?";
		Object[] args = {id};
		try{
			List<City> list = (List<City>) BaseDao02.queryT(City.class,connection,sql,args);
			return list;
		}catch (Exception e){
			e.printStackTrace();
		}finally{
			C3p0Util.close(connection,null,null);
		}
			return null;
	}
	public List<District> queryDistricts(int id){
		Connection connection = C3p0Util.getConnWithC3p0();
	   //ע��ʹ�ñ���
		String sql ="select id ,district_name,city_id from district where city_id=? ";
		Object[] args={id};
		try{
			List<District> list = (List<District>) BaseDao02.queryT(District.class,connection,sql,args);
			return list;
		}catch (Exception e){
			e.printStackTrace();
		}finally{
			C3p0Util.close(connection,null,null);
		}
			return null;
	}
}

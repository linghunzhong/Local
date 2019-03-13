package com.ibeifeng.ajax.servlet;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ibeifeng.ajax.dao.ListDao;
import com.ibeifeng.ajax.po.City;
import com.ibeifeng.ajax.po.District;
import com.ibeifeng.ajax.po.Province;

public class ListServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String method = request.getParameter("method");
		if(method.equals("provinceList")){
			//˵��Ҫ�������province��list
			ListDao dao = new ListDao();
			List<Province> list = dao.queryProvinces();
			if(list != null){
				request.setAttribute("provinceList",list);
				request.getRequestDispatcher("list.jsp").forward(request,response);
			}
		}
		if(method.equals("cityList")){
			//˵���Ҹ���province��id��ѯcity���б�
			String idStr = request.getParameter("provinceId");
			if(!idStr.equals("ʡ��") && idStr !="" && idStr !=null){
				int id = new Integer(idStr);
				List<City> cities = queryCities(id);
				//�첽����
				ObjectMapper mapper = new ObjectMapper();
				String valueAsString = mapper.writeValueAsString(cities);
				response.getWriter().write(valueAsString);
			}
		}
		if(method.equals("districtList")){
			//˵���Ҹ���City��id��ѯdistrict��list�б�
			String idStr = request.getParameter("cityId");
//			System.out.println(idStr);
			if(!idStr.equals("����") && idStr !=null && idStr !=""){
				int id = new Integer(idStr);
				List<District> districts = queryDistricts(id);
				//�첽����
				ObjectMapper mapper = new ObjectMapper();
				String valueAsString = mapper.writeValueAsString(districts);
				response.getWriter().write(valueAsString);
			}
	}
	}
	private List<Province> queryProvinces(){
		ListDao dao = new ListDao();
		List<Province> list = dao.queryProvinces();
		return list;
	}
	private List<City> queryCities(int id){
		ListDao dao = new ListDao();
		List<City> queryCities = dao.queryCities(id);
		return queryCities;
	}
	private List<District> queryDistricts(int id){
		ListDao dao = new ListDao();
		List<District> districts = dao.queryDistricts(id);
		return districts;
	}
}

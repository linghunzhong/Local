<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'list.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript"">
$(function(){
  	//当省份发生改变的时候触发的事件
  	$('#province').change(function(){
  		//0.之前的city,district列表内容要删除
  		$('#city :not(:first)').remove();
  		$('#district :not(:first)').remove();
  		//1.获取选择的省份的id
  		var id = $(this).val();
 // 	alert(id)
  		//2.根据省份的id查询城市的列表
  		var url = "listServlet.action?method=cityList";
  		var args = {"provinceId":id};
  		$.getJSON(url,args,function(result){
  			//result是List<City> list
  			for(var i=0;i<result.length;i++){
  				//3.将查到的city的list的name添加到城市的下拉列表中
  				$('#city').append("<option value='"+result[i].id+"'>"+result[i].city_name+"</option>");
  			}
  		});
  	});
  	//当city列表发生变化的时候触发的事件
  	$('#city').change(function(){
  		//1.district的列表需要删除
  		$('#district :not(:first)').remove();
  		//2.获取选择的city的id
  		var id = $('#city').val();
  		//3.根据city的id异步查询district的list
  		var url = "listServlet.action?method=districtList";
  		var args = {"cityId":id};
  		$.getJSON(url,args,function(result){
  			for(var i=0;i<result.length;i++){
  				$('#district').append("<option value='"+result[i].id+"'>"+result[i].district_name+"</option>");
  			}
  		});
  });
});
  </script>
  </head>
  <body>
   	<select id="province">
   		<option selected="selected">省份</option>
  		<c:forEach items="${provinceList}" var="province">
  			<option value="${province.id}">${province.province_name}</option>
  		</c:forEach>
   	</select>
   	&nbsp;&nbsp;&nbsp;
    <select id="city">
   		<option selected="selected">城市</option>
   	</select>
   	&nbsp;&nbsp;&nbsp;
   	<select id="district">
   		<option selected="selected">县区</option>
   	</select>
  </body>
</html>

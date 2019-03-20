<%@page import="java.util.List"%>
<%@page import="com.jianli.search01.EMP"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html locale="true">
  <head>
    <html:base />
    
    <title>结果页面</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="addsearch.css">
  </head>
  
  <body>
  <% 
      List<EMP> list  =(List<EMP>)request.getAttribute("list"); 
    /*int curpage=Integer.parseInt(request.getAttribute("curpage").toString());
      long totalpage=Long.parseLong(request.getAttribute("totalpage").toString());
      int count =Integer.parseInt(request.getAttribute("count").toString()); */
   %>
   <form action="SearchList.jsp">
    <div id="box">
     <h2>雇员查询系统</h2>
    <table width="100%"  cellpadding="3">
       <tr id="heade" bgcolor="#1965b3">
         <th name="id">雇员编号</th>
         <th name="ype">职位类别</th>
         <th name="name">雇员姓名</th>
         <th name="sex">雇员性别</th>
         <th name="age">雇员年龄</th>
         <th name="dep">所属部门</th>
         <th name="year">雇员年龄</th>
       </tr>
       <%if(list !=null&& list.size()>0) {
           for( EMP em :  list){
       %>
       <tr bgcolor="#d6d5d6">
         <th><%=em.getId()%></th>
         <th><%if(em.getPOST_TYPE()==1){%>行政助理 <%}else if(em.getPOST_TYPE()==2){%>业务经理<%}else{%>总经理<%}%></th>
         <th><%=em.getEMP_NAME() %></th>
         <th><%if(em.getEMP_SEX()==1){%> 男<%}else{%>女<%} %></th>
         <th><%=em.getEMP_AGE() %>岁</th>
         <th><%=em.getEMP_DEPART() %></th>
         <th><%=em.getEMP_YRAR() %>年</th>
       </tr>
       <%}}else{%>
       
        <tr>
	               <td colspan="5" align="center">暂无数据</td>
	          </tr>
	      <%} %>
    </table>
   </div>
   </form>
  </body>
</html:html>

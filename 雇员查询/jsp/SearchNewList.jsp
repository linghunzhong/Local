<%@page import="com.jianli.search01.EMP"%>
<%@page import="com.jianli.search01.Search"%>
<%@page import="java.util.List"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:useBean id="Search" class="com.jianli.search01.Search" scope="page"></jsp:useBean>
<%
    request.setCharacterEncoding("utf-8");
     response.setCharacterEncoding("utf-8");
     //接收页面显示第几页 
     String num=request.getParameter("number");
     String index=request.getParameter("pageIndex");
     String name=request.getParameter("name"); 
      int shownum=5;
      int pageIndex=1;
      if(index != null && !"".equals(index)){
         pageIndex=Integer.parseInt(index);
      }  
      if(num != null&&!"".equals(num)){
         shownum=Integer.parseInt(num);
      }
      if(name==null){
         name="";
      }
      List<EMP> list=(List<EMP>)Search.pageEmp(pageIndex, shownum,name);
     /*  Long count =Search.countStu(name);
      //下一页
      Long totalpage=count%5==0 ?count/5:count/5 +1;
      request.setAttribute("totalpage",totalpage);
      request.setAttribute("count",count);
       */
 //存储当前页
     request.setAttribute("curpage",pageIndex );
 //。将list存储到request中
      request.setAttribute("list",list);
    //跳转到stulist页面
      request.getRequestDispatcher("addSearch.jsp").forward(request,response);
%>
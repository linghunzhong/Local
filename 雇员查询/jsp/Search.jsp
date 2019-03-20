<%@page import="com.jianli.search01.EMP"%>
<%@ page language="java" pageEncoding="UTF-8"%>

<%
  
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html locale="true">
  <head>
    <html:base />
    
    <title>查询页面</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="search.css">
  </head>   
  <body>
   <div id="box">
    <h2>雇员查询系统</h2>
   <form action="SearchNewList.jsp" method="post" id="registerform"   name="test" onsubmit="return checkForm()">       
                            雇员姓名:<input type="text" value="" name="name" id="usename" onblur="checkUserName()"/><br/>
                     公司职位:
         <select id="type" name="type" id="type" onblur="checktype()">
           <option></option>
           <option value="0"></option>
           <option value="1">行政助理</option>
           <option value="2">业务经理</option>
           <option value="3">总经理</option>
         </select><br/>
         <input type="submit" value="查询雇员明细" id="fun"/>
     </form>
   </div>
  </body>
  <script>
      var verifyer,username,userId,type
      onload=function () {
        verifyer=true;
        username=e("username");
        userId=e("userId");
        type=e("type");
        }
         function checkForm(){
        return verifyer;
    }
 /*验证表单  */
        function checkForm(){
        return verifyer;
    } 
    var registerform=document.querySelector("#registerform")
   registerform.onsubmit=function () {
       var isubmit=confirm("是否选择职位名称")
        if(isubmit) {
            return true;
        }return false;
    }
    </script>
</html:html>

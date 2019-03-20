<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.jianli.search01.EMP"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jianli.search01.ConfigUtil"%>
<%@ page language="java" pageEncoding="UTF-8"%>

<%--<%
  //1.加载驱动 com.mysql.jdbc.Driver//类全名（类名+包名）
  /*2.创建数据连接
            协议           主机名               端口
     http://localhost:8080
             协议    子协议
     jdbc:mysql://localhost:3306/myschool
  */
     //1加载驱动
    Class.forName(ConfigUtil.getValue("Driver"));
   //2创建数据链接
   String url=ConfigUtil.getValue("url");
   String user=ConfigUtil.getValue("username");
   String pas=ConfigUtil.getValue("password");
   Connection con=DriverManager.getConnection(url, user, pas);
   //3.操作数据库————>查询  用statement,不能直接实例化，通过con.createStatemenet来获取
      Statement st =con.createStatement();
   //4.执行Query操作：Statement方法里的executeQuerysql - 要发送给数据库的 SQL 语句，通常为静态 SQL SELECT 语句 
   //编写sql语句   
      String sql="select * from Employee ";
   //得到返回值 ：ResultSet 对象具有指向其当前数据行的光标。最初，光标被置于第一行之前。next 方法将光标移动到下一行；
   //因为该方法在 ResultSet 对象没有下一行时返回 false，所以可以在 while 循环中使用它来迭代结果集。 
  ResultSet rs =rs = st.executeQuery(sql);// 返回的是结果集
   //创建list集合
   List<EMP> list=new ArrayList<EMP>();
     while(rs.next()){
        int id=rs.getInt("Id");
        int type=rs.getInt("POST_TYPE");//或者rs.getString(1)
        String name=rs.getString("EMP_NAME");
        int sex= rs.getInt("EMP_SEX");
        int age=rs.getInt("EMP_AGE");
        String dep= rs.getString("EMP_DEPART");
        int year=rs.getInt("EMP_YRAR");
        //给Student对象赋值
       EMP emp= new EMP();
        emp.setId(id);
        emp.setPOST_TYPE(type);
        emp.setEMP_NAME(name);
        emp.setEMP_SEX(sex);
        emp.setEMP_AGE(age);
        emp.setEMP_DEPART(dep);
        emp.setEMP_YRAR(year);
     
        //添加到list几何中
         list.add(emp);
     }
    //5.释放资源
    if(rs !=null )rs.close();
    if(st !=null )st.close();
    if(con != null)con.close();
    //6。将list存储到request中
      request.setAttribute("list",list);
    //跳转到stulist页面
      request.getRequestDispatcher("addSearch.jsp").forward(request,response);
    
 %>
 --%>
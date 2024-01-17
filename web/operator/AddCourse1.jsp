<%@include file="op.jsp" %>
<%@page import="java.sql.*" %>
<%
    String s_id=request.getParameter("t1");
    String course_id=request.getParameter("t2");
    String course_name=request.getParameter("t3");
    String fees=request.getParameter("t4");
    String duration=request.getParameter("t5");
    int e=Integer.parseInt(s_id);
    
    Class.forName("com.mysql.jdbc.Driver");
    String path="jdbc:mysql://localhost:3306/fee_system";
    String dbuser="root";
    String dbpass="";
    Connection cn=DriverManager.getConnection(path,dbuser,dbpass);
    String s1="insert into st_course values(0,?,?,?,?,?,?)";
    PreparedStatement p1=cn.prepareStatement(s1);
    java.sql.Date dt=new java.sql.Date(new java.util.Date().getTime());
    p1.setString(1, course_id);
    p1.setString(2, s_id);
    p1.setString(3, course_name);
    p1.setString(4, fees);
    p1.setString(5, duration);
    p1.setDate(6,dt);
    
    int a=p1.executeUpdate();
    if(a==1)
    {
        response.sendRedirect("View.jsp?s_id="+e);
    }
%>
<h1><a href="View.jsp">show</a></h1>
<%@include file="op2.jsp" %>
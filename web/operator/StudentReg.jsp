<%@include file="op.jsp" %>
<%@page import="java.sql.*" %>
<%
    String name,contact,email,address,password;
    name=request.getParameter("t1");
    contact=request.getParameter("t2");
    address=request.getParameter("t3");
    email=request.getParameter("t4");
    password=request.getParameter("t5");
    int s_id=0;
    String usertype="student";
    Class.forName("com.mysql.jdbc.Driver");
    String path="jdbc:mysql://localhost:3306/fee_system";
    String dbuser="root";
    String dbpass="";
    String s1="insert into stdata values(0,?,?,?,?)";
    String s2="insert into logindata values(?,?,?)";
    Connection cn=DriverManager.getConnection(path,dbuser,dbpass);
    PreparedStatement p1=cn.prepareStatement(s1);
    PreparedStatement p2=cn.prepareStatement(s2);
   
    p1.setString(1, name);
    p1.setString(2, contact);
    p1.setString(3, address);
    p1.setString(4, email);
        
    p2.setString(1, email);
    p2.setString(2, password);
    p2.setString(3, usertype);
    String msg="";
    int a=p1.executeUpdate();
    int b=p2.executeUpdate();
    if(a==1 && b==1)
    {
        msg="Data is saved & login is created";
    }
    else if(a==1)
    {
        msg="data is saved";
    }
    else if(b==1)
    {
        msg="login is saved";
    }
    else
    {
        msg="no Data is saved & login is created";
    }
%>
<h3><%= msg %></h3>
<%@include file="op2.jsp" %>
<%@page import="java.sql.*" %>
<%
    String name,contact,address,email,password;
    name=request.getParameter("t1");
    contact=request.getParameter("t2");
    address=request.getParameter("t3");
    email=request.getParameter("t4");
    password=request.getParameter("t5");
    Class.forName("com.mysql.jdbc.Driver");
    String path="jdbc:mysql://localhost:3306/fee_system";
    String dbuser="root";
    String dbpass="";
    Connection cn=DriverManager.getConnection(path,dbuser,dbpass);
    String s1="insert into admindata values(?,?,?,?)";
    String s2="insert into logindata values(?,?,?)";
    PreparedStatement p1=cn.prepareStatement(s1);
    PreparedStatement p2=cn.prepareStatement(s2);
    p1.setString(1, name);
    p1.setString(2, contact);
    p1.setString(3, address);
    p1.setString(4, email);
    
    
    p2.setString(1, email);
    p2.setString(2, password);
    p2.setString(3, "admin");
    int a=p1.executeUpdate();
    int b=p2.executeUpdate();
    String msg="";
    if(a==1 && b==1)
    {
        msg="data is saved and login is created";
    }
    else if(a==1)
    {
        msg="only data is saved";
    }
    else if(b==1)
    {
        msg="only login is created";
    }
    else
    {
        msg="no data is saved and no login created";
    }
%>
<h3><%=msg%></h3>

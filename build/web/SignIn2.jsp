<%@include file="in.jsp" %>
<%@page import="java.sql.*" %>
<%
    String usertype=request.getParameter("t7");
    String msg="";
    if(usertype.equalsIgnoreCase("admin"))
    {
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
        p2.setString(3, usertype);
        int a,b;
       
        a=p1.executeUpdate();
        b=p2.executeUpdate();

        
        if(a==1 && b==1)
        {
            msg="admin data is saved and login is created";
        }
        else if(a==1)
        {
            msg="only admindata is saved";
        }
        else if(b==1)
        {
            msg="only login is created";
        }
        else
        {
            msg="no data is saved and no login created";
        }
    }
    else if(usertype.equalsIgnoreCase("operator"))
    {
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
        String s3="insert into operatordata values(?,?,?,?)";
        String s2="insert into logindata values(?,?,?)";
        PreparedStatement p2=cn.prepareStatement(s2);
        PreparedStatement p3=cn.prepareStatement(s3);
     
        p3.setString(1, name);
        p3.setString(2, contact);
        p3.setString(3, address);
        p3.setString(4, email);


        p2.setString(1, email);
        p2.setString(2, password);
        p2.setString(3, usertype);
        int b,c;
   
        b=p2.executeUpdate();
        c=p3.executeUpdate();


        if(c==1 && b==1)
        {
            msg="admin data is saved and login is created";
        }
        else if(c==1)
        {
            msg="only operatordata is saved";
        }
        else if(b==1)
        {
            msg="only login is created";
        }
        else
        {
            msg="no data is saved and no login created";
        }
    }
    else if(usertype.equalsIgnoreCase("student"))
    {
        String name,contact,email,address,password;
        name=request.getParameter("t1");
        contact=request.getParameter("t2");
        address=request.getParameter("t3");
        email=request.getParameter("t4");
        password=request.getParameter("t5");
        int s_id=0;

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
}
    
        
%>
<h3><%=msg%></h3>
<h2><a href="Login.jsp" id="btn2">Login</a></h2>
<%@include file="in2.jsp" %>
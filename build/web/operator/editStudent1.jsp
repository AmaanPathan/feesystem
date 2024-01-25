<%@include file="op.jsp" %>
<%@page import="java.sql.*" %>
<%
    String s_id=request.getParameter("t5");
    if(s_id==null)
    {
        response.sendRedirect("ShowStudent.jsp");
    }
    else
    {
        String name=request.getParameter("t1");
        String contact=request.getParameter("t2");
        String address=request.getParameter("t3");
        String email=request.getParameter("t4");
        int e=Integer.parseInt(s_id);


        Class.forName("com.mysql.jdbc.Driver");
        String path="jdbc:mysql://localhost:3306/fee_System";
        String dbuser="root";
        String dbpass="";
        Connection cn=DriverManager.getConnection(path,dbuser,dbpass);
        String s1="update stdata set name=?,contact=?,address=?,email=? where s_id=?";
        PreparedStatement p1=cn.prepareStatement(s1);
        p1.setString(1, name);
        p1.setString(2, contact);
        p1.setString(3, address);
        p1.setString(4, email);
        p1.setInt(5, e);

        int a=p1.executeUpdate();
        String msg="";
        if(a==1)
        {
            msg="data is changed";
        }
        else
        {
            msg="Not  changed";
        }
        %>
        <div id="d1">
        <h3><%= msg %></h3>
        <a href="View.jsp?s_id=<%= e %>" id="g1">show</a>
        </div>
        <%
    }
%>

<%@include file="op2.jsp" %>    
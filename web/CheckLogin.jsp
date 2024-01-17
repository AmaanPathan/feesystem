<%@include file="in.jsp" %>

<div>
<%@page import="java.sql.*" %>
<%
    
    String email=request.getParameter("t1");
    String password=request.getParameter("t2");
    String button=request.getParameter("b1");
    
    if(button==null)
    {
        response.sendRedirect("LoginError.jsp");
    }
    else
    { 
     
        Class.forName("com.mysql.jdbc.Driver");
        String path="jdbc:mysql://localhost:3306/fee_system";
        String dbuser="root";
        String dbpass="";
        Connection cn=DriverManager.getConnection(path,dbuser, dbpass);
        String s1="select * from logindata where email=? and password=?";
        PreparedStatement p1=cn.prepareStatement(s1);
        p1.setString(1,email);
        p1.setString(2,password);
        ResultSet r1=p1.executeQuery();
        if(r1.next())
        {
            String ut=r1.getString("usertype");
            session=request.getSession(true);
            session.setAttribute("email", email);
            session.setAttribute("usertype", ut);
            
            
            if(ut.equalsIgnoreCase("admin"))
            {
                response.sendRedirect("Admin/AdminHome.jsp");
            }
            else if(ut.equalsIgnoreCase("operator"))
            {
                response.sendRedirect("operator/operatorHome.jsp");
            }
            else if(ut.equalsIgnoreCase("student"))
            {
                response.sendRedirect("Student/Student_1.jsp?email="+email);
            }
        }
        else
        {
            response.sendRedirect("LoginError.jsp");
        }
    }
%>
</div>
<%@include file="in2.jsp" %>
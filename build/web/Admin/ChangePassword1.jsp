<%@page import="java.sql.*" %>
<%
    String ut="",e1="";
    session=request.getSession(false);
    if(session==null)
    {
        response.sendRedirect("../AuthError");
    }
    else
    {
        try
        {
            e1=session.getAttribute("email").toString();
            ut=session.getAttribute("usertype").toString();
            if(ut.equalsIgnoreCase("admin")==false)
            {
                response.sendRedirect("../AuthError.jsp");
            }
        }
        catch(NullPointerException e)
        {
            response.sendRedirect("../AuthError.jsp");
        }
    }
%>
<%
    
    String old_pass,new_pass,confirm_pass;
    old_pass=request.getParameter("t1");
    new_pass=request.getParameter("t2");
    confirm_pass=request.getParameter("t3");
    Class.forName("com.mysql.jdbc.Driver");
    String path="jdbc:mysql://localhost:3306/fee_system";
    String dbuser="root";
    String dbpass="";
    Connection cn=DriverManager.getConnection(path,dbuser,dbpass);
    String s1="update logindata set password=? where email=? and password=?";
    PreparedStatement p1=cn.prepareStatement(s1);
    p1.setString(1, new_pass);
    p1.setString(2, e1);
    p1.setString(3, old_pass);
    int a=p1.executeUpdate();
    String msg="";
    if(a==1)
    {
        msg="password is changed";
    }
    else
    {
        msg="password is not changed";
    }
%>
<h3><%=msg%></h3>
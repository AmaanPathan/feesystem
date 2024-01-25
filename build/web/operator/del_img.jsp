<%@page import="java.sql.*" %>
<%
    String s_id=request.getParameter("s_id");
    if(s_id==null)
    {
        response.sendRedirect("ShowStudent.jsp");
    }
    else
    {

        Class.forName("com.mysql.jdbc.Driver");
        String path="jdbc:mysql://localhost:3306/fee_System";
        String dbuser="root";
        String dbpass="";
        Connection cn=DriverManager.getConnection(path,dbuser,dbpass);
        String s1="delete from st_photo where s_id=?";
        PreparedStatement p1=cn.prepareStatement(s1);
        int e=Integer.parseInt(s_id);
        p1.setInt(1, e);

        int a=p1.executeUpdate();
        String msg="";
        if(a==1)
        {
            msg="delete succesfully";
        }
        else
        {
            msg="Not deleted";
        }
        
%>
<h3><%= msg %></h3>
<form method="post" action="View.jsp">
    <input type="hidden" name="s_id" value="<%= e %>"/>
            <input type="submit" value="Back" id="btn2"/>
</form>
<%
    }
%>
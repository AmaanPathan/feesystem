<%@include file="op.jsp" %>
<%@page import="java.sql.*" %>
<%  
    String s_id=request.getParameter("h1");
    String course_id=request.getParameter("h2");
    String amount=request.getParameter("t1");
    String remark=request.getParameter("t2");
    String st=request.getParameter("h3");
    
    int e=Integer.parseInt(s_id);
    int f=Integer.parseInt(st);
    Class.forName("com.mysql.jdbc.Driver");
    String path="jdbc:mysql://localhost:3306/fee_system";
    String dbuser="root";
    String dbpass="";
    String sql="insert into st_installment values(?,0,?,?,?,?,?)";
    Connection cn=DriverManager.getConnection(path,dbuser,dbpass);
    PreparedStatement p1=cn.prepareStatement(sql);
    java.sql.Date dt=new java.sql.Date(new java.util.Date().getTime());
    p1.setString(1, st);
    p1.setString(2, course_id);
    p1.setString(3, s_id);
    p1.setString(4, amount);
    p1.setDate(5, dt);
    p1.setString(6, remark);
    
    int a=p1.executeUpdate();
    if(a==1)
    {
        response.sendRedirect("View.jsp?s_id="+e);
    }

%>
<br/>
<form method="post" action="View.jsp">
    <input type="hidden" name="s_id" value="<%= e %>"/>
            <input type="submit" value="Back" id="btn2"/>
</form>
<%@include file="op.jsp" %>
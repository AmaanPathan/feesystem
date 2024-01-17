<%@include file="op.jsp" %>
<%@page import="amaan.data.modules.Mylib"%>
<%@page import="java.sql.*" %>
<%
    String s_id=request.getParameter("t1");
    String course_id=request.getParameter("t2");
    String fees=request.getParameter("t3");
    String st=request.getParameter("t5");
    
    Connection cn=new Mylib().connect();
    String s1="select * from st_course where course_id=?";
    PreparedStatement p1=cn.prepareStatement(s1);
    p1.setInt(1, Integer.parseInt(course_id));
    ResultSet r1=p1.executeQuery();
    if(r1.next())
    {
        String a;
        a=r1.getString("fees");      
%>
<h1>Discount</h1>
<form method="post" action="editf1.jsp">
    <input type="text" name="t5" value="<%= st %>"/>
    <input type="hidden" name="t3" value="<%= s_id %>"/>
    <input type="hidden" name="t1" value="<%= course_id %>"/>
    <p><input type="text" name="t2" id="txt1" value="<%= fees %>"/></p>
    <p><button type="submit" name="b1" id="btn2">changes</button></p>
</form>
    <form method="post" action="View.jsp">
    <input type="hidden" name="s_id" value="<%= s_id %>"/>
            <input type="submit" value="Back" id="btn2"/>
</form>
<%
    }
    
    
%>
<%@include file="op2.jsp" %>
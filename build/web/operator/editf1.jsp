<%@include file="op.jsp" %>
<%@page import="amaan.data.modules.Mylib"%>
<%@page import="java.sql.*" %>
<%
    String cid=request.getParameter("t1");
    String fees=request.getParameter("t2");
    String sid=request.getParameter("t3");
    String st=request.getParameter("t5");
    int e=Integer.parseInt(sid);
    Connection cn=new Mylib().connect();
    String s1="update st_course set fees=? where course_id=? and st_course_id=?";
    PreparedStatement p1=cn.prepareStatement(s1);
    p1.setInt(1, Integer.parseInt(fees));
    p1.setInt(2, Integer.parseInt(cid));
    p1.setInt(3, Integer.parseInt(st));
    
    int a=p1.executeUpdate();
    if(a==1)
    {
        response.sendRedirect("View.jsp?s_id="+e);
    
    }
    
%>
<p><a href="View.jsp?s_id=<%= e %>" id="g1">View</a></p>
<%@include file="op2.jsp" %>

<%@include file="op.jsp" %>
<%@page import="java.sql.*" %>
<h1>Course</h1>
<table border="2px" style="border-collapse: collapse;">
    <tr>
        <th>Course id</th>
        <th>Course name</th>
        <th>Fee</th>
        <th>Duration</th>
        <th>&nbsp;</th>
        
    </tr>
<%
    String s_id=request.getParameter("t1");
    Class.forName("com.mysql.jdbc.Driver");
    String path="jdbc:mysql://localhost:3306/fee_system";
    String dbuser="root";
    String dbpass="";
    int e=Integer.parseInt(s_id);
    Connection cn=DriverManager.getConnection(path,dbuser,dbpass);
    String s1="select * from course_master ";
    PreparedStatement p1=cn.prepareStatement(s1);
    ResultSet r1=p1.executeQuery();
    while(r1.next())
    {
        String a,b,c,d;
        a=r1.getString("course_id");
        b=r1.getString("course_name");
        c=r1.getString("fee");
        d=r1.getString("duration");
%>
<tr>
    <td><%= a %></td>
    <td><%= b %></td>
    <td><%= c %></td>
    <td><%= d %></td>
    <td>
        <form method="post" action="AddCourse1.jsp">
            <input type="hidden" name="t1" value="<%= s_id %>"/>
            <input type="hidden" name="t2" value="<%= a %>"/>
            <input type="hidden" name="t3" value="<%= b %>"/>
            <input type="hidden" name="t4" value="<%= c %>"/>
            <input type="hidden" name="t5" value="<%= d %>"/>
            <input type="submit" value="add" id="btn2"/>
        </form>
    </td>
</tr>
<%
    }
%>
</table>
<br/>
<form method="post" action="View.jsp">
    <input type="hidden" name="s_id" value="<%= e %>"/>
            <input type="submit" value="back" id="btn2"/>
</form>
<%@include file="op2.jsp" %>
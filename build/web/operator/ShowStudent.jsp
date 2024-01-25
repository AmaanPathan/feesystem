<%@include file="op.jsp" %>
<%@page import="java.sql.*" %>
<h1>Student</h1>
<hr/>
<%
    
    Class.forName("com.mysql.jdbc.Driver");
    String path="jdbc:mysql://localhost:3306/fee_system";
    String dbuser="root";
    String dbpass="";
    Connection cn=DriverManager.getConnection(path,dbuser,dbpass);
    String s1="select * from stdata";
    
    PreparedStatement p1=cn.prepareStatement(s1);
    ResultSet r1=p1.executeQuery();
    while(r1.next())
    {
        String a,b,c,d;
        int e=r1.getInt("s_id");
        a=r1.getString("name");
        b=r1.getString("contact");
        c=r1.getString("address");
        d=r1.getString("email");
        
        
       %>
       <div id="d1">
           
           <h3><%= a %></h3>
       <p>
           Contact:<%= b %><br/>
           Address:<%= c %><br/>
           Email:<%= d %><br/>
       </p>
       <a href="View.jsp?s_id=<%= e %>" id="g1">view</a>
       
       </div>
       <hr/>
       <%
    
        }
   
    
    %>
    <br/>
<%@include file="op2.jsp" %>
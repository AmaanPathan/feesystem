<%@include file="op.jsp" %>
<h1>Operator Home</h1>
<hr/>
<%
    String ut="",e1="";
    session =request.getSession(false);
    if(session==null)
    {
        response.sendRedirect("../AuthError.jsp");
    }
    else
    {
        try
        {
            e1=session.getAttribute("email").toString();
            ut=session.getAttribute("usertype").toString();
            if(ut.equalsIgnoreCase("operator")==false)
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


<%@page import="java.sql.*" %>
<% 
    String email=request.getParameter("e1");
    Class.forName("com.mysql.jdbc.Driver");
    String path="jdbc:mysql://localhost:3306/fee_system";
    String dbuser="root";
    String dbpass="";
    Connection cn=DriverManager.getConnection(path,dbuser,dbpass);
    String s1="select * from operatordata where email=?";
    PreparedStatement p1=cn.prepareStatement(s1);
    p1.setString(1, e1);
    ResultSet r1=p1.executeQuery();
    if(r1.next())
    {
        String a,b,c,d;
        a=r1.getString("name");
        b=r1.getString("contact");
        c=r1.getString("address");
        d=r1.getString("email");
       %>
       <div style="width: 100%; float: left;">
           <div style="width:50%; float: left;">
       <h3><%= a %></h3>
       <p>
           Contact:<%= b %><br/>
           address:<%= c %><br/>
           address:<%= d %><br/>
       </p>
       </div>
       <hr style="margin-top:140px;"/>
           <%
    }
    
    %> 
    
<%@include file="op2.jsp" %>
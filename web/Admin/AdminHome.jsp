<%@include file="ad.jsp" %>
<%@page import="java.sql.*" %>
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
            if(ut.equalsIgnoreCase("admin")==false)
            {
                response.sendRedirect("../AuthError.jsp");
            }
        }
        catch(NullPointerException e)
        {
        }
    }
%>
<br>
<br>
<h1>Administrators</h1>
<%@page import="java.sql.*" %>
<%
    
    Class.forName("com.mysql.jdbc.Driver");
    String path="jdbc:mysql://localhost:3306/fee_system";
    String dbuser="root";
    String dbpass="";
    Connection cn=DriverManager.getConnection(path,dbuser,dbpass);
    String s1="select * from admindata where email=?";
    
    PreparedStatement p1=cn.prepareStatement(s1);
    p1.setString(1, e1);
    ResultSet r1=p1.executeQuery();
    while(r1.next())
    {
        String a,b,c,d;
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
           Email:<%= e1 %><br/>
       </p>
       
       
       </div>
       <hr/>
       <%
    
        }
   
    
    %>
 

<%@include file="ad2.jsp" %>
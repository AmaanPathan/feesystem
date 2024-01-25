<%@include file="ad.jsp" %>
<br/>
<h2>Operators</h2>
<br/>
<%@page import="java.sql.*" %>
<% 
    String email=request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver");
    String path="jdbc:mysql://localhost:3306/fee_system";
    String dbuser="root";
    String dbpass="";
    Connection cn=DriverManager.getConnection(path,dbuser,dbpass);
    String s1="select * from operatordata ";
    PreparedStatement p1=cn.prepareStatement(s1);
   
    ResultSet r1=p1.executeQuery();
    while(r1.next())
    {
        String a,b,c,d;
        a=r1.getString("name");
        b=r1.getString("contact");
        c=r1.getString("address");
        d=r1.getString("email");
       %>
       <div class="row" >
	<div class="col-6">
       <h3><%= a %></h3>
       <p>
           Contact:<%= b %><br/>
           address:<%= c %><br/>
           address:<%= d %><br/>
       </p>
       </div>
       <div class="col-6">
           <%
            String s2="select * from photo where name=?";
            PreparedStatement p2=cn.prepareCall(s2);
            p2.setString(1, a);
            ResultSet r2=p2.executeQuery();
            if(r2.next()) //photo found
            {
                String photo=r2.getString("photo");
                %>
                <img src="../operator/photo/<%= photo %>" width="100" height="125" />
               <%
            }
            else
            {
            %>

            <form method="post" enctype="multipart/form-data" action="up1.jsp?name=<%= a %>">
                <p>Photo 
                    <label for="F1"></label>
                    <input type="file" name="F1"  />
                </p>
                <p>
                    <input type="submit" name="B1" id="btn2" value="Upload Photo" />
                </p>
                    </form>
        <%
            }
        %>
       </div>
       </div>
       <hr/>
       <%
    }
    
    %>  
    <%@include file="ad2.jsp" %>
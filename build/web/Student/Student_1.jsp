<%@include file="st.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="amaan.data.modules.Mylib"%>


<div>
<%
    Mylib obj=new Mylib();
    Connection cn=obj.connect();
%>
<br/>
<h1>Dashboard</h1>
<hr/>

        
            
            <%
String dtype=request.getParameter("email");
if(dtype!=null)
{
    
    String sql="select * from stdata where email=?";
    PreparedStatement p1=cn.prepareStatement(sql);
    p1.setString(1, dtype);

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
       <a href="view.jsp?s_id=<%= e %>" id="g1">
        <h3><%= e %>. <%= a %></h3>
        <p>
           Contact:<%= b %><br/>
           Address:<%= c %><br/>
           Email:<%= d %><br/>
        </p>
       </a>
       <%
    
        }
}
    %>
</div>
            <%@include file="st2.jsp" %>
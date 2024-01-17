<%@page import="amaan.data.modules.Mylib"%>
<%@page import="java.sql.*" %>
<%
    
    Mylib obj=new Mylib();
    Connection cn=obj.connect();

String dtype=request.getParameter("s1");
if(dtype!=null)
{
    
    String sql="select * from stdata where name=?";
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
       
        <h3><%= e %>. <%= a %></h3>
        <p>
           Contact:<%= b %><br/>
           Address:<%= c %><br/>
           Email:<%= d %><br/>
        </p>
       
       <%
    
        }
}
    %>
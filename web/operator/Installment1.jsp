<%@include file="op.jsp" %>
<%@page  import="java.sql.*" %> 

<h2>Deposit Section</h2>
<hr/>
<%
    String s_id=request.getParameter("t1");
    String course_id=request.getParameter("t2");
    String fee=request.getParameter("t3");
    String st=request.getParameter("t5");
    String course_paid=request.getParameter("t6");
    
    
    Class.forName("com.mysql.jdbc.Driver");
    
    
    String path="jdbc:mysql://localhost:3306/fee_system";
    String dbuser="root";
    String dbpass="";
    
    Connection cn=DriverManager.getConnection(path, dbuser, dbpass);
    
    String sql="select * from st_course where course_id=? and st_course_id=?";
    
    PreparedStatement p1=cn.prepareStatement(sql);
    java.sql.Date dt=new java.sql.Date(new java.util.Date().getTime());
    p1.setInt(1,Integer.parseInt(course_id));
    p1.setInt(2, Integer.parseInt(st));
    ResultSet r1=p1.executeQuery();
    
    if(r1.next())
    {
        String a,b,c,d;
        int p=r1.getInt("st_course_id");
        int f=r1.getInt("s_id");
        int e=r1.getInt("course_id");
        a=r1.getString("course_name");
        b=r1.getString("fees");
        c=r1.getString("duration");
        d=r1.getString("commencement_date");
        
 %>
 <h3><%= e%>. <%= a %></h3>
 <p>Fees: <%= b %><br/></p>
 <p>Duration: <%= c%></p>
 <p>Commencement_date: <%= d %></p>
 <p>Paid : <%= course_paid %></p>
 
 <form method="post" action="Installment.jsp" onsubmit="return amount()">
     <input type="hidden" name="h1" value="<%= f %>"/>
     <input type="hidden" name="h2" value="<%= e %>"/>
     <input type="hidden" name="h3" value="<%= st %>"/>
     <p><input type="hidden" name="h4" value="<%= course_paid %>" id="txt3"/></p>
     <p>Amount to pay<br/><input type="text" name="t1" id="txt1"/><span id="sp1"></span></p>
     <p>Remark<br/><input type="text" name="t2" id="txt2"/><span id="sp2"></span></p>
     <button type="submit" id="btn2">Submit</button>     
 </form>
     <br/>
<form method="post" action="View.jsp">
    <input type="hidden" name="s_id" value="<%= e %>"/>
            <input type="submit" value="Back" id="btn2"/>
</form>
<%
    }
%>
<%@include file="op2.jsp" %>
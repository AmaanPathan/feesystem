
<%@page import="amaan.data.modules.Mylib"%>
<%@page import="java.sql.*" %>
<html>
<head>
    <title>FEE SYSTEM</title>
    <link href="../static/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="../static/css/newcss.css" rel="stylesheet" type="text/css" />
    <link href="../static/jQuery/jquery.js" rel="stylesheet" type="text/css" />
<script>
    
</script>
</head>
<body>
 <nav class="navbar navbar-expand-lg" data-bs-theme="dark" style="margin-top: -10px; background-image: url(../static/images/8.png);">
     <div class="container-fluid" style="margin-top:10px;">
    <a class="navbar-brand" href="#"> FEE SYSTEM</a>
    <button class="navbar-toggler navbar-dark" style="float: right;">
    	<span class="navbar-toggler-icon" id="v1"></span>
    </button>
    <div class="collapse navbar-collapse " id="navbarColor02">
        <ul class="navbar-nav me-auto">
     
        </ul>
       
    </div>
    
  </div>
 </nav>
    
    <div class="container-fluid" style="background-image: url(../static/images/8.png); min-height: 100%; background-size: 100% 100%; margin-top: -60px;">
<br/>
<br/>
<br/>

<%
    String s_id=request.getParameter("s_id");
    if(s_id==null)
    {
        response.sendRedirect("ShowStudent.jsp");
    }
    else
    {
        Class.forName("com.mysql.jdbc.Driver");
        String path="jdbc:mysql://localhost:3306/fee_system";
        String dbuser="root";
        String dbpass="";
        Connection cn=DriverManager.getConnection(path,dbuser,dbpass);
        String s1="select * from stdata where s_id=?";
        PreparedStatement p1=cn.prepareStatement(s1);                                                               
        int e=Integer.parseInt(s_id);
        p1.setInt(1, e);                         
        ResultSet r1=p1.executeQuery();                                   
        if(r1.next())
        {
            String a,b,c,d;
            e=r1.getInt("s_id");
            a=r1.getString("name");
            b=r1.getString("contact");
            c=r1.getString("address");
            d=r1.getString("email");


            String s2="select * from st_photo where s_id=?";
            PreparedStatement p2=cn.prepareCall(s2);
            p2.setInt(1, e);
            ResultSet r2=p2.executeQuery();
            if(r2.next()) //photo found
            {
                String photo=r2.getString("photo");
                %>
                <img src="operator/photo/<%= photo %>" width="100" height="125" />
               <%
            }
            else
            {
            %>

                <form method="post" enctype="multipart/form-data" action="Uploadphoto.jsp?s_id=<%= e %>" >
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
           <h2><%= e %>. <%= a %></h2>
           <p>
               Contact:<%= b %><br/>
               Address:<%= c %><br/>
               Email:<%= d %><br/>
           </p>
    
       
           <%--<a href="editStudent.jsp?s_id=<%= e %>">edit</a>
       <a href="deleteStudent.jsp?s_id=<%= e %>">delete</a>
           --%>
       <br/>
       <br/> 
       <h4>Courses</h4>
       <%--<form method="post" action="AddCourse.jsp">
           <h4>Courses
           <input type="hidden" name="t1" value="<%= e %>"/>
           <input type="submit" name="B1" value="Add" id="btn2"/>
           </h4>
</form>--%>
       <table border="2px solid #000000">
           <tr>
                <th>course_id</th>
                <th>s_id</th>
                <th>course_name</th>
                <th>fees</th>
                <th>duration</th>
                <th>Commencement_date</th>
                <th>Paid</th>
                <th>Due</th>
                <%--<th>Pay</th>
<th>Changes</th>--%>
                
            </tr>
        <%
            
            String s3="select * from st_course where s_id=?";
            PreparedStatement p3=cn.prepareCall(s3);
            p3.setInt(1, e);
            ResultSet r3=p3.executeQuery();
            int total_fee=0;
            while(r3.next())
            {
                
               String r,s,u,v;
               int p=r3.getInt("course_id");
               int q=r3.getInt("s_id");
               r=r3.getString("course_name");
               s=r3.getString("fees");
               total_fee=total_fee+Integer.parseInt(s);
               u=r3.getString("duration");
               v=r3.getString("commencement_date");
               int course_paid=new Mylib().find_course_paid(q,p);
               int course_due=Integer.parseInt(s)-course_paid;
               
        %> 
        
             
            <tr>
                <td><%= p %></td>
                <td><%= q %></td>
                <td><%= r %></td>
                <td><%= s %></td>
                <td><%= u %></td>
                <td><%= v %></td>
                <td><%= course_paid %></td>
                <td><%= course_due %></td>
                <%--<td>
                    <%
                    if(course_due==0)
                    {
                        %>
                        <p>Completed</p>
                        <%
                    }
                    else
                    {
                    %>
                    <form method="post" action="Installment1.jsp">
                        <input type="hidden" name="t1" value="<%= e %>" />
                        <input type="hidden" name="t2" value="<%= p %>" />
                        <input type="hidden" name="t3" value="<%= s %>" />
                        <input type="submit" name="t4" value="Pay" id="btn2"/>
                    </form>
                        <%
                    }
                %>
                </td>
                
                <td>
                    <form method="post" action="editf.jsp">
                        <input type="hidden" name="t1" value="<%= e %>" />
                        <input type="hidden" name="t2" value="<%= p %>" />
                        <input type="hidden" name="t3" value="<%= s %>" />
                        <input type="submit" name="t4" value="Edit" id="btn2" />
                    </form>
</td>--%>
            </tr>
        
       <%    
            }
            %>
            </table>
            <h5>Total : <%= total_fee %></h5>
            <br/>
            <br/>
            <h4>Installment</h4>
            <table border="2px solid #000000">
            <tr>
                <th>t_id</th>
                <th>course_id</th>
                <th>amount</th>
                <th>t_date</th>
                <th>remark</th>
                
            </tr>
        <%
            String s4="select * from st_installment where s_id=?";
            PreparedStatement p4=cn.prepareCall(s4);
            p4.setInt(1, e);
            ResultSet r4=p4.executeQuery();
            int paid=0;
            while(r4.next())
            {
                String i,j,k,l; 
                int g=r4.getInt("t_id");
                int h=r4.getInt("course_id");
                String course=new Mylib().getCourseName(h);
                i=r4.getString("amount");
                paid=paid+Integer.parseInt(i);
                j=r4.getString("t_date");
                k=r4.getString("remark");
            
%>
            <tr>
                <td><%= g %></td>
                <td><%= course %></td>
                <td><%= i %></td>
                <td><%= j %></td>
                <td><%= k %></td>
            </tr>
<%          
            }
            int due=total_fee-paid;
            %>
            </table>
           <h5>Total Paid : <%= paid %></h5>
           <h5>Due : <%= due %></h5>
            <%
        }
    }
%> 

<a href="Login.jsp" id="btn2"> back </a>
    </div>



</body>
</html>
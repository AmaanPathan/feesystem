<%@include file="op.jsp" %>
<%@page import="amaan.data.modules.Mylib"%>
<%@page import="java.sql.*" %>
<div class="row">
    <div class="col-6" id="d1">
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
        %>
             
           <h2><%= e %>. <%= a %></h2>
           <p>
               Contact:<%= b %><br/>
               Address:<%= c %><br/>
               Email:<%= d %><br/>
           </p>
    
           
           <p><a href="editStudent.jsp?s_id=<%= e %>" id="g1">edit</a></p>
           <p><a href="deleteStudent.jsp?s_id=<%= e %>" id="g1">delete</a></p>
           <p><a href="del_img.jsp?s_id=<%= e %>" id="g1">delete images</a></p>
    </div>
    <div class="col-6" >
            
            
            <%
            String s2="select * from st_photo where s_id=?";
            PreparedStatement p2=cn.prepareCall(s2);
            p2.setInt(1, e);
            ResultSet r2=p2.executeQuery();
            if(r2.next()) //photo found
            {
                String photo=r2.getString("photo");
                %>
                <img src="photo/<%= photo %>" width="100" height="125" />
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
           
           </div>
</div>
<hr/>
       <br/>
       
       
           <table border="2px solid #000000" id="d1" class="table-bordered table-responsive" width="1000px">
               <thead>
               <tr>
                   <td colspan="11" class="text-center"><h3>Course Details</h3></td>
               </tr>
               </thead>
               <tr class="text-center">
                <th>St_course_id</th>
                <th>course_id</th>
                <th>s_id</th>
                <th>course_name</th>
                <th>fees</th>
                <th>duration</th>
                <th>Commencement_date</th>
                <th>Paid</th>
                <th>Due</th>
                <th>Pay</th>
                <th>Changes</th>
                
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
               int st=r3.getInt("st_course_id");
               int p=r3.getInt("course_id");
               int q=r3.getInt("s_id");
               r=r3.getString("course_name");
               s=r3.getString("fees");
               total_fee=total_fee+Integer.parseInt(s);
               u=r3.getString("duration");
               v=r3.getString("commencement_date");
               int course_paid=new Mylib().find_course_paid(q,st);
               int course_due=Integer.parseInt(s)-course_paid;
               
        %> 
        
             
        <tr class="text-center">
                <td><%= st %></td>
                <td><%= p %></td>
                <td><%= q %></td>
                <td><%= r %></td>
                <td><%= s %></td>
                <td><%= u %></td>
                <td><%= v %></td>
                <td><%= course_paid %></td>
                <td><%= course_due %></td>
                <td>
                    <%
                    if(course_due==0)
                    {
                        %>
                        <p>Completed</p>
                        <%
                    }
                    else if(course_paid>Integer.parseInt(s))
                    {
                    %>
                        <p>Amount Exceeded</p>
                        <%
                    }
                else
                    {
                    %>
                    <form method="post" action="Installment1.jsp">
                        <input type="hidden" name="t5" value="<%= st %>"/>
                        <input type="hidden" name="t1" value="<%= e %>" />
                        <input type="hidden" name="t2" value="<%= p %>" />
                        <input type="hidden" name="t3" value="<%= s %>" />
                        <input type="hidden" name="t6" value="<%= course_paid %>" />
                        <button id="btn2"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
  <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z"/>
</svg></button>
                    </form>
                        <%
                    }
                %>
                </td>
                
                <td>
                    <form method="post" action="editf.jsp">
                        <input type="hidden" name="t5" value="<%= st %>" />
                        <input type="hidden" name="t1" value="<%= e %>" />
                        <input type="hidden" name="t2" value="<%= p %>" />
                        <input type="hidden" name="t3" value="<%= s %>" />
                        <button id="btn2" style="margin-top: 5px;"><img src="../static/images/editing.png" width="16" height="16" /></button>
                    </form>
                </td>
                    
   
            </tr>
        
       <%    
            }
            %>
            <tr>
                <td colspan="11">
                    <form method="post" action="AddCourse.jsp">
           <center>
                          <p>

                        <input type="hidden" name="t1" value="<%= e %>"/>
                        <button type="submit" name="t2" id="btn2"><svg style="height: 30px;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square-fill" viewBox="0 0 16 16">
  <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm6.5 4.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3a.5.5 0 0 1 1 0"/>
</svg></button>
                        </p>
           </center>
                    
                    </form>
            </td>
            
            
            
            </tr>
            </table>
            <h5 id="d1">Total : <%= total_fee %></h5>
            <hr/>
         
            <table border="2px solid #000000" id="d1" class="table-bordered table-responsive" width="500px;">
               <thead>
               <tr>
                   <td colspan="11" class="text-center"><h3>Intallments</h3></td>
               </tr>
               </thead>
               <tr class="text-center">
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
<tr class="text-center">
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
            <br/>
            <h5 id="d1">Total Paid : <%= paid %><br/>
               Due : <%= due %></h5>
            <%
        }
    }
%> 
<hr/>
<form method="post" action="ShowStudent.jsp">
                        
                        <input type="submit" name="btn"  value="Back" id="btn2" />
                    </form>
<br/>
<%@include file="op2.jsp" %>
<%@include file="in.jsp" %>
<h2>Sign In</h2>
<hr/>
<br/>
<br/>
<form method="post" action="SignIn2.jsp">
    <table class="w-100">
        <tr>
            <th>Name</th>
            <th>Contact</th>
        </tr>
         <tr>
             <td><input type="text" name="t1" id="txt1"/><br/><span id="sp1"></span><br/><br/></td>
             <td><input type="text" name="t2" id="txt2"/><br/><span id="sp2"></span><br/><br/></td>
        </tr>
        <tr>
            <th>Address</th>
            <th>Email</th>
        </tr>
        <tr>
            <td><input type="text" name="t3" id="txt3"/><br/><span id="sp3"></span><br/><br/></td>
            <td><input type="email" name="t4" id="txt4"/><br/><span id="sp4"></span><br/><br/></td>
        </tr>
        <tr>
            <th>Password</th>
            <th>Confirm password</th>
        </tr>
        <tr>            
            <td><input type="password" name="t5" id="txt5"/><br/><span id="sp5"></span><br/><br/></td>
            <td><input type="password" name="t6" id="txt6"/><br/><span id="sp6"></span><br/><br/></td>
            
        </tr>
         <tr>
            <th>Usertype</th>
            
        </tr>
        <tr>            
            <td><input type="text" name="t7" id="txt7"/><br/><span id="sp7"></span><br/><br/></td>
            
            
        </tr>
    </table>
    <p><button type="submit" id="btn2" name="btn1">Save</button></p>

</form>
<form method="post" action="index.jsp">
    <button type="submit" id="btn2" name="btn1">Back</button>
</form>
<%@include file="in2.jsp" %>

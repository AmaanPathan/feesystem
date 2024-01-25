<%@include file="op.jsp" %>
<h1>Student Reg</h1>
<hr/>
<form method="post" onsubmit="return H()" action="StudentReg.jsp">
    <p>Name<br/><input type="text" name="t1" id="txt1"/><span id="sp1"></span></p>
    <p>Contact<br/><input type="text" name="t2" id="txt2" /><span id="sp2"></span></p>
    <p>Address<br/><input type="text" name="t3" id="txt3" /><span id="sp3"></span></p>
    <p>Email<br/><input type="email" name="t4" id="txt4" /><span id="sp4"></span></p> 
    <p><button type="submit" id="btn2" >Register</button></p>
</form>
<%@include file="op2.jsp" %>
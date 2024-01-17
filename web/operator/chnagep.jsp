
<%@include file="op.jsp" %>
<h1>Change password</h1>
<hr/>
<form method="post" action="changep1.jsp" onsubmit="return j()">
    <p>old password<br/><input type="password" name="t1" id="txt1" /><span id="sp1"></span></p>
    <p>new password<br/><input type="password" name="t2" id="txt2" /><span id="sp2"></span></p>
    <p>confirm password<br/><input type="password" name="t3" id="txt3"><span id="sp3"></span></p>
    <p><button type="submit" name="b1" id="btn2">Change</button></p>
</form>
<%@include file="op2.jsp" %>
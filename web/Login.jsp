<%@include file="in.jsp" %>

<br/>
<div class="row">
    <div class="col-6">
<div class="container-fluid">
<form method="post" action="CheckLogin.jsp" id="f1">
    <div class="container-fluid">
    <h1 style="font-family:'Courier New', Courier, monospace;padding-top: 20px; margin-left: 10px;" id="l1">LOGIN</h1>
    <hr/>
    <br/>
    
    <p><input type="email"  id="tt1" name="t1" placeholder="Email" style="color: black"/></p>
        <br/>
        <p><input type="password"  id="tt2" name="t2" placeholder="password"/></p>
    <br/>
  
    <p><button type="submit"  id="btn1" name="b1">LOGIN</button>
    
    <p><a href="#">Forgot password?</a></p>
    </div>
</form>
 </div>
    </div>
    <div class="col-6">
        <img src="static/images/13151-removebg.png" width="500" height="500" style="margin-top: 10px;"/>
    </div>
</div>
<%@include file="in2.jsp" %>
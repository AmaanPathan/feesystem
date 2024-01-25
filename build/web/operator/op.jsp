<html>
<head>
    
    <link href="../static/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../static/css/newcss.css" rel="stylesheet" type="text/css" />
    <script src="../static/jQuery/func.js"></script>
    <script src="../static/jQuery/jquery.js"></script>
    
    <script>
    	$(document).ready(function(e) {
            $("#b1").click(function(){
				$("#navbarColor02").slideToggle();
			});
        });
		$(document).ready(function(e) {
            $("#b4").click(function(){
				$("#nav2").slideToggle();
			});
        });
    </script>

</head>
<body>
<nav class="navbar navbar-expand-lg bg-dark" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Fee System</a>
    <button class="navbar-toggler" type="button" >
      <span class="navbar-toggler-icon" id="b1"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarColor02">
        <ul class="navbar-nav me-auto " style="margin-left: 370px;">
        <li class="nav-item">
            <a class="nav-link " href="operatorHome.jsp">Home
            
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Contact</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="chnagep.jsp">Change Password</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle"  id="b4">Student</a>
          <div class="dropdown-menu" id="nav2">
              <a class="dropdown-item" href="Student.jsp">Student Reg.</a>
              <a class="dropdown-item" href="ShowStudent.jsp">Show Student</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href=""></a>
          </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="../Login.jsp">Logout</a>
        </li>
      </ul>
      <!--<form class="d-flex">
        <input class="form-control me-sm-2" type="search" placeholder="Search">
        <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
      </form>-->
    </div>
    
  </div>
</nav>
    
    
<div class="container-fluid bg-dark-subtle" style="min-height:700px; margin-bottom: -20px">
    
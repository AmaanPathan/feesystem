<%@page import="java.sql.*"%>
<%@page import="amaan.data.modules.Mylib"%>

<div>
<script type="text/javascript">
function find_doctor(str)
{
    console.log(str);
	var xmlhttp;
	if (str.length==0)
  	{ 
  		document.getElementById("s1").innerHTML="";
  		return;
  	}
	if (window.XMLHttpRequest)
  	{// code for IE7+, Firefox, Chrome, Opera, Safari
  		xmlhttp=new XMLHttpRequest();
  	}
	else
  	{// code for IE6, IE5
  		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  	}
	
	xmlhttp.onreadystatechange=function()
  	{
  		if (xmlhttp.readyState==4 && xmlhttp.status==200)
    		{
    				document.getElementById("s1").innerHTML=xmlhttp.responseText;
    		}
  	}
	xmlhttp.open("GET","search.jsp?q="+str,true);
	xmlhttp.send();
}
</script>
</div>



<br/>
<br/>
<br/>
<div class="search" style="float: left;">
    <form action="#" onchange="find_doctor(this.value)">
                <input type="text"
                       placeholder=" Search Courses"
                       name="s1">
                <button>
                    <img src="static/images/search_7079548.png" width="15"/>
                </button>
            </form>
        </div>
<div >  
    <%
    
    Mylib obj=new Mylib();
    Connection cn=obj.connect();

String dtype=request.getParameter("s1");
if(dtype!=null)
{
    
    String sql="select * from stdata where name like "+dtype;
    PreparedStatement p1=cn.prepareStatement(sql);
  
    ResultSet r1=p1.executeQuery();
 
    if(r1.next())
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
    </div>
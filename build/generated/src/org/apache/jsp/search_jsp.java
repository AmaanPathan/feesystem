package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import amaan.data.modules.Mylib;
import amaan.data.modules.Mylib;
import java.sql.*;

public final class search_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/in.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>FEE SYSTEM</title>\n");
      out.write("    <link href=\"static/css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("    <link href=\"static/css/newcss.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("    <link href=\"static/jQuery/jquery.js\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("    <link href=\"static/css/first.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("<script>\n");
      out.write("    function on() \n");
      out.write("    {\n");
      out.write("  \tdocument.getElementById(\"overlay\").style.display = \"block\";\n");
      out.write("        \n");
      out.write("    }\n");
      out.write("\n");
      out.write("    function off() \n");
      out.write("    {\n");
      out.write("      document.getElementById(\"overlay\").style.display = \"none\";\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    \n");
      out.write("    function find_doctor(str)\n");
      out.write("    {\n");
      out.write("    console.log(str);\n");
      out.write("\tvar xmlhttp;\n");
      out.write("\tif (str.length==0)\n");
      out.write("  \t{ \n");
      out.write("  \t\tdocument.getElementById(\"s1\").innerHTML=\"\";\n");
      out.write("  \t\treturn;\n");
      out.write("  \t}\n");
      out.write("\tif (window.XMLHttpRequest)\n");
      out.write("  \t{// code for IE7+, Firefox, Chrome, Opera, Safari\n");
      out.write("  \t\txmlhttp=new XMLHttpRequest();\n");
      out.write("  \t}\n");
      out.write("\telse\n");
      out.write("  \t{// code for IE6, IE5\n");
      out.write("  \t\txmlhttp=new ActiveXObject(\"Microsoft.XMLHTTP\");\n");
      out.write("  \t}\n");
      out.write("\t\n");
      out.write("\txmlhttp.onreadystatechange=function()\n");
      out.write("  \t{\n");
      out.write("  \t\tif (xmlhttp.readyState==4 && xmlhttp.status==200)\n");
      out.write("    \t\t{\n");
      out.write("    \t\t\t\tdocument.getElementById(\"s1\").innerHTML=xmlhttp.responseText;\n");
      out.write("    \t\t}\n");
      out.write("  \t}\n");
      out.write("\txmlhttp.open(\"GET\",\"in.jsp?q=\"+str,true);\n");
      out.write("\txmlhttp.send();\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    \n");
      out.write("</script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("<nav class=\"navbar navbar-expand-lg bg-dark\" data-bs-theme=\"dark\">\n");
      out.write("  <div class=\"container-fluid\">\n");
      out.write("      <a class=\"navbar-brand\" href=\"index.jsp\">FEE SYSTEM</a>\n");
      out.write("    <button class=\"navbar-toggler\" type=\"button\" >\n");
      out.write("      <span class=\"navbar-toggler-icon\" id=\"b1\"></span>\n");
      out.write("    </button>\n");
      out.write("  </div>\n");
      out.write("  \n");
      out.write("    <form class=\"d-flex\" onsubmit=\"on\">\n");
      out.write("                <input type=\"text\"\n");
      out.write("                       placeholder=\" Search Courses\"\n");
      out.write("                       name=\"s1\" onkeyup=\"find_doctor(this.value)\">\n");
      out.write("                <button type=\"submit\"><img  src=\"static/images/search_7079548.png\" width=\"16\" height=\"16\"/></button>\n");
      out.write("    </form>\n");
      out.write("    <button type=\"submit\" onclick=\"on()\">x</button>\n");
      out.write("</nav>\n");
      out.write("    <div id=\"overlay\">\n");
      out.write("        <form class=\"d-flex\" onsubmit=\"find_doctor(this.value)\">\n");
      out.write("                <input type=\"text\"\n");
      out.write("                       placeholder=\" Search Courses\"\n");
      out.write("                       name=\"s1\" >\n");
      out.write("                <button type=\"submit\"><img  src=\"static/images/search_7079548.png\" width=\"16\" height=\"16\"/></button>\n");
      out.write("    </form>    \n");
      out.write("    ");

        Mylib obj=new Mylib();
    Connection cn=obj.connect();
    
String dtype=request.getParameter("s1");
if(dtype!=null)
{
    
    String sql="select * from stdata where name like '__a%'";
    PreparedStatement p1=cn.prepareStatement(sql);

    ResultSet r1=p1.executeQuery();
 
    while(r1.next())
    {
        String a,b,c,d;
        int e=r1.getInt("s_id");
        a=r1.getString("name");
        b=r1.getString("contact");
        c=r1.getString("address");
        d=r1.getString("email");
        
        
       
      out.write("\n");
      out.write("        <h3>");
      out.print( e );
      out.write('.');
      out.write(' ');
      out.print( a );
      out.write("</h3>\n");
      out.write("       \n");
      out.write("        <p style=\"margin-left: 200px;\">\n");
      out.write("           Contact:");
      out.print( b );
      out.write("<br/>\n");
      out.write("           Address:");
      out.print( c );
      out.write("<br/>\n");
      out.write("           Email:");
      out.print( d );
      out.write("<br/>\n");
      out.write("        </p>\n");
      out.write("       \n");
      out.write("       ");

    
        }
}
    
      out.write("\n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("     <div class=\"container-fluid bg-dark-subtle\" style=\"min-height:700px; margin-bottom: -20px\">\n");
      out.write("\n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("  \n");
      out.write(" \n");
      out.write("    \n");
      out.write("    ");
      out.write("\n");
      out.write("\n");
      out.write("<div>\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("function find_doctor(str)\n");
      out.write("{\n");
      out.write("    console.log(str);\n");
      out.write("\tvar xmlhttp;\n");
      out.write("\tif (str.length==0)\n");
      out.write("  \t{ \n");
      out.write("  \t\tdocument.getElementById(\"s1\").innerHTML=\"\";\n");
      out.write("  \t\treturn;\n");
      out.write("  \t}\n");
      out.write("\tif (window.XMLHttpRequest)\n");
      out.write("  \t{// code for IE7+, Firefox, Chrome, Opera, Safari\n");
      out.write("  \t\txmlhttp=new XMLHttpRequest();\n");
      out.write("  \t}\n");
      out.write("\telse\n");
      out.write("  \t{// code for IE6, IE5\n");
      out.write("  \t\txmlhttp=new ActiveXObject(\"Microsoft.XMLHTTP\");\n");
      out.write("  \t}\n");
      out.write("\t\n");
      out.write("\txmlhttp.onreadystatechange=function()\n");
      out.write("  \t{\n");
      out.write("  \t\tif (xmlhttp.readyState==4 && xmlhttp.status==200)\n");
      out.write("    \t\t{\n");
      out.write("    \t\t\t\tdocument.getElementById(\"s1\").innerHTML=xmlhttp.responseText;\n");
      out.write("    \t\t}\n");
      out.write("  \t}\n");
      out.write("\txmlhttp.open(\"GET\",\"search.jsp?q=\"+str,true);\n");
      out.write("\txmlhttp.send();\n");
      out.write("}\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<br/>\n");
      out.write("<br/>\n");
      out.write("<br/>\n");
      out.write("<div class=\"search\" style=\"float: left;\">\n");
      out.write("    <form action=\"#\" onchange=\"find_doctor(this.value)\">\n");
      out.write("                <input type=\"text\"\n");
      out.write("                       placeholder=\" Search Courses\"\n");
      out.write("                       name=\"s1\">\n");
      out.write("                <button>\n");
      out.write("                    <img src=\"static/images/search_7079548.png\" width=\"15\"/>\n");
      out.write("                </button>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("<div id=\"h1\">  \n");
      out.write("    \n");
      out.write("    </div>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

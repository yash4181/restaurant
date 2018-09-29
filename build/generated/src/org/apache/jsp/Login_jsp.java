package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

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

      out.write("<html>\n");
      out.write("<script>\n");
      out.write("function validate(){\n");
      out.write("var email=document.form.user.value;\n");
      out.write("var password=document.form.pass.value;\n");
      out.write("if(email==\"\"){\n");
      out.write(" alert(\"Enter email!\");\n");
      out.write("  return false;\n");
      out.write("}\n");
      out.write("if(password==\"\"){\n");
      out.write(" alert(\"Enter Password!\");\n");
      out.write("  return false;\n");
      out.write("}\n");
      out.write("return true;\n");
      out.write("}\n");
      out.write("</script>\n");
      out.write("<form name=\"form\" method=\"post\" action=\"CheckLogin\" onsubmit=\"javascript:return validate();\">\n");
      out.write("<table>\n");
      out.write("<tr><td>Email:</td><td><input type=\"text\" name=\"email\"></td></tr>\n");
      out.write("<tr><td>Password:</td><td><input type=\"password\" name=\"pass\"></td></tr>\n");
      out.write("<tr><td></td><td><input type=\"submit\" value=\"Login\"></td></tr>\n");
      out.write("<tr><td></td><td><a href=\"signup.jsp\">Register Here</a></td></tr>\n");
      out.write("</table>\n");
      out.write("</form>\n");
      out.write("</html>");
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

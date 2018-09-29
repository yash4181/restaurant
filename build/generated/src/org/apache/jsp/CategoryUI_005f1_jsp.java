package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class CategoryUI_005f1_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        \n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("        <style>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            .btn{\n");
      out.write("                margin-top: 20px;\n");
      out.write("                width: 150px;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            .form-control{\n");
      out.write("                \n");
      out.write("                width: 400px;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("    <body style=\"margin: auto; width: 80%;\">\n");
      out.write("        <div id=\"#\">\n");
      out.write("        <h1>Category View:</h1>\n");
      out.write("    \n");
      out.write("        <form action=\"#\" method=\"post\">\n");
      out.write("            \n");
      out.write("            <h3>Name:</h3>\n");
      out.write("            <input type=\"text\" name=\"name\" class=\"form-control\" required>\n");
      out.write("            \n");
      out.write("            <h3>Description:</h3>\n");
      out.write("            <input type=\"description\" name=\"description\" class=\"form-control\" required>\n");
      out.write("            \n");
      out.write("            <h3>Price:</h3>\n");
      out.write("            <input type=\"price\" name=\"price\" class=\"form-control\" required>\n");
      out.write("            \n");
      out.write("            <h3 for=\"sel1\">Category:</h3>\n");
      out.write("                <select class=\"form-control\" id=\"sel1\">\n");
      out.write("                  <option>South Indian</option>\n");
      out.write("                  <option>North Indian</option>\n");
      out.write("                  <option>Chinese</option>\n");
      out.write("                  <option>Italian</option>\n");
      out.write("                  <option>Burgers</option>\n");
      out.write("                  <option>Vegetarian</option>\n");
      out.write("                  <option>Non-Vegetarian</option>\n");
      out.write("                  <option>Special</option>\n");
      out.write("                </select>\n");
      out.write("                \n");
      out.write("                \n");
      out.write("            <br>\n");
      out.write("            \n");
      out.write("            <input type=\"submit\" value=\"Save\" class=\"btn btn-lg btn-success\" >\n");
      out.write("                       \n");
      out.write("        </form>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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

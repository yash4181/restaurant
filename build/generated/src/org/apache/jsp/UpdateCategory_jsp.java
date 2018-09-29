package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.Category;
import dao.CategoryDAO;
import impl.CategoryDAOImpl;

public final class UpdateCategory_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");

CategoryDAO udao = new CategoryDAOImpl();

request.setAttribute("category", udao.getCategory( Integer.parseInt(request.getParameter("id")) ));

      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>+\n");
      out.write("        \n");
      out.write("\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("\n");
      out.write("<!-- jQuery library -->\n");
      out.write("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("\n");
      out.write("<!-- Latest compiled JavaScript -->\n");
      out.write("<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("\n");
      out.write("<link href=\"https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300|Slabo+27px\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body style=\"margin: auto; width: 80%;\">\n");
      out.write("        \n");
      out.write("        <h1>Update Category:</h1>\n");
      out.write("        \n");
      out.write("        <form method=\"post\" action=\"UpdateCategoryToDB\">\n");
      out.write("\n");
      out.write("            <input type=\"hidden\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${category.getId()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" name=\"id\">\n");
      out.write("        \n");
      out.write("        <table class=\"table table-striped\">\n");
      out.write("            \n");
      out.write("            <tbody>\n");
      out.write("                <tr>\n");
      out.write("                    <td style=\"font-family: 'Slabo 27px', serif; font-size: 28px;\"> <i><b>Id:</b></i> </td>\n");
      out.write("                    <td style=\"font-family: 'Open Sans Condensed', sans-serif; font-size: 28px;\"> <b>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${category.getId()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</b> </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td style=\"font-family: 'Slabo 27px', serif; font-size: 28px;\"> <i><b>Name:</b></i> </td>\n");
      out.write("                    <td style=\"font-family: 'Open Sans Condensed', sans-serif; font-size: 28px;\"> \n");
      out.write("                        <b>\n");
      out.write("                            <input type=\"text\" placeholder=\"Enter Username\" class=\"form-control\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${category.getName()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" name=\"name\"/> \n");
      out.write("                        </b>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td style=\"font-family: 'Slabo 27px', serif; font-size: 28px;\"> <i><b>Description:</b></i> </td>\n");
      out.write("                    <td style=\"font-family: 'Open Sans Condensed', sans-serif; font-size: 28px;\">\n");
      out.write("                        <b>\n");
      out.write("                            <input type=\"category\" placeholder=\"Enter Category\" class=\"form-control\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${category.getDescription()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" name=\"description\"/> \n");
      out.write("                        </b>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                <tr>\n");
      out.write("                    <td style=\"font-family: 'Open Sans Condensed', sans-serif; font-size: 28px;\">\n");
      out.write("                        <input type=\"submit\" value=\"Update\" class=\"btn btn-success\"/>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("            </tbody>\n");
      out.write("            \n");
      out.write("        </table>\n");
      out.write("        </form>\n");
      out.write("        \n");
      out.write("        \n");
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

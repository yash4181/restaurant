package servlets;

import dao.UsersDAO;
import impl.UsersDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Users;
import validation.UserValidation;

@WebServlet(name = "RegisterUser", urlPatterns = {"/RegisterUser"})
public class RegisterUser extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

//            if( !request.getParameter("password").equals(request.getParameter("cpassword")) ){
//                response.sendRedirect("Failure.jsp");
//            }
//            else{
                {   
                
                Users u = new Users();
            
                u.setName(request.getParameter("name"));
                u.setPhone(request.getParameter("phone"));
                u.setEmail(request.getParameter("email"));
                u.setAddress(request.getParameter("address"));
                u.setPassword(request.getParameter("password"));
                u.setCpassword(request.getParameter("cpassword"));

                System.out.println( u );

                UserValidation uv = new UserValidation();
                
                Map m = uv.getValidationMap(u);
                
                if( m.keySet().isEmpty() ){
                    
                    UsersDAO udao = new UsersDAOImpl();

                    udao.insert(u);

                    response.sendRedirect("Login.jsp");
                }else{

                    request.setAttribute("signupUser",  u );
                    
                    request.setAttribute("errorsMap", m);
                    
                    request.getRequestDispatcher("signup.jsp").forward(request, response);
                }
                
                
                

            }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

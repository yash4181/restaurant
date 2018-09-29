/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import dao.AddProductDAO;
import impl.AddProductDAOImpl;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.AddProduct;

/**
 *
 * @author MAYANK
 */
@WebServlet(name = "ViewAddProduct", urlPatterns = {"/ViewAddProduct"})
@MultipartConfig(maxRequestSize = 10 * 1024 * 1024)
public class ViewAddProduct extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            AddProduct u = new AddProduct();

            u.setName(request.getParameter("name"));
            u.setDescription(request.getParameter("description"));
            u.setPrice(Float.parseFloat(request.getParameter("price")));
            u.setCategory(request.getParameter("category"));

            try {
                Part p = request.getPart("file");
                byte b[] = new byte[(int) p.getSize()];
                p.getInputStream().read(b);
                File f = new File(request.getRealPath("") + "/" + p.getSubmittedFileName());
                if (!f.exists()) {
                    f.createNewFile();
                }
                FileOutputStream fos = new FileOutputStream(f);
                fos.write(b);
                fos.close();

                Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                        "cloud_name", "dpuvc8lvh",
                        "api_key", "741654741722829",
                        "api_secret", "WH_F13JlgXMXQ4ZlmD-45433jtM"));

                File toUpload = new File(request.getRealPath("") + "/" + p.getSubmittedFileName());
                Map uploadResult = cloudinary.uploader().upload(toUpload, ObjectUtils.emptyMap());

                System.out.println(uploadResult.get("secure_url"));

                u.setImagePath( uploadResult.get("secure_url").toString() );
                
            } catch (Exception e) {
                e.printStackTrace();
            }

            System.out.println(u);

            AddProductDAO udao = new AddProductDAOImpl();

            udao.insert(u);

            response.sendRedirect("ProductSuccess.jsp");

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

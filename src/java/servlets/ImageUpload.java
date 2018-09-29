package servlets;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
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

@WebServlet(name = "ImageUpload", urlPatterns = {"/ImageUpload"})
@MultipartConfig( maxFileSize = 1024 * 1024 * 10)
public class ImageUpload extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            Part p = request.getPart("myfile");
            
            System.out.println( p. getName() );
            System.out.println( p. getSize() );
            
            String realPath = getServletContext(). getRealPath("");
            
            System.out.println( realPath);
            
            FileOutputStream fos = new FileOutputStream(new File(realPath + "/.sample.png"));
            
            byte b[] = new byte [(int)p.getSize()];
            
            p.getInputStream().read(b);
           
            fos.write(b);
            
            fos.close();
                    
            Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "dpuvc8lvh",
                "api_key", "741654741722829",
                "api_secret", "WH_F13JlgXMXQ4ZlmD-45433jtM"));
            
            File toUpload = new File(realPath + "/.sample.png");
            Map uploadResult = cloudinary.uploader().upload(toUpload, ObjectUtils.emptyMap());
        
            System.out.println( uploadResult.get("secure_url") );
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

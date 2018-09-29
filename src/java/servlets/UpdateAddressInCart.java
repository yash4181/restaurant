package servlets;

import dao.CartDAO;
import impl.CartDAOImpl;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/UpdateAddressInCart")
public class UpdateAddressInCart extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    
        String email = req.getParameter("email");
        String bill = req.getParameter("bill");
        String ship = req.getParameter("ship");
        
        CartDAO cdao = new CartDAOImpl();
        
        cdao.updateShippingAndBilling(email, bill, ship);
        
        resp.sendRedirect("Invoice.jsp?email=" + email);
        
    }
    
    
    
}

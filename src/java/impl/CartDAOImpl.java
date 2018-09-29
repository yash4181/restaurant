package impl;

import dao.AddProductDAO;
import dao.CartDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.AddProduct;
import model.Cart;

public class CartDAOImpl implements CartDAO {

    @Override
    public Cart getCart(String email, int productId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void insert(Cart c) {
        String query = "insert into Cart (productId,qty,email) values (?,?,?)";
        try {
            Connection conn = config.Config.conn;

            PreparedStatement pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, c.getProductId());
            pstmt.setInt(2, c.getQty());
            pstmt.setString(3, c.getEmail());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Cart> getCart(String email) {
        String query = "select * from Cart where email=?";

        List<Cart> cart = new ArrayList<>();
        AddProductDAO pdao = new AddProductDAOImpl();

        try {
            Connection conn = config.Config.conn;

            PreparedStatement pstmt = conn.prepareStatement(query);

            pstmt.setString(1, email);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Cart u = new Cart();

                u.setId(rs.getInt("id"));
                u.setEmail(rs.getString("email"));
                u.setProductId(rs.getInt("productId"));
                u.setQty(rs.getInt("qty"));
                u.setBillingAddress(rs.getString("billingaddress"));
                u.setShippingAddress(rs.getString("shippingaddress"));

                AddProduct p = pdao.getAddProduct(u.getProductId());

                u.setProduct(p);

                cart.add(u);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cart;
    }

    @Override
    public void deleteAllItemsByEmail(String email) {
        String query = "delete from Cart where email = ?";
        try {
            Connection conn = config.Config.conn;

            PreparedStatement pstmt = conn.prepareStatement(query);

            pstmt.setString(1, email);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        String query = "delete from Cart where id = ?";
        try {
            Connection conn = config.Config.conn;

            PreparedStatement pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, id);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateShippingAndBilling(String email, String ship, String bill) {
        String query = "update Cart set billingaddress = ?, shippingaddress = ? where email = ?";
        
        System.out.println("email: " + email);
        System.out.println("ship: " + ship);
        System.out.println("bill: " + bill);
        
        try {
            Connection conn = config.Config.conn;

            PreparedStatement pstmt = conn.prepareStatement(query);

            pstmt.setString(1, ship);
            pstmt.setString(2, bill);
            pstmt.setString(3, email);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(String email) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}

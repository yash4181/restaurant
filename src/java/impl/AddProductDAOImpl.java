package impl;

import dao.AddProductDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.AddProduct;

public class AddProductDAOImpl implements AddProductDAO{

    @Override
    public void insert(AddProduct u) {
    
        String query = "insert into addproduct (name, description, price, category, imagepath) values (?,?,?,?,?)";
        
        try{
            Connection conn = config.Config.conn;
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setString(1, u.getName());
            pstmt.setString(2, u.getDescription());
            pstmt.setFloat(3, u.getPrice());
            pstmt.setString(4, u.getCategory());
            pstmt.setString(5, u.getImagePath());
           
            pstmt.executeUpdate();
            
        }catch( Exception e ){
            e.printStackTrace();
        }
    
    }

    @Override
    public void update(AddProduct u) {
    String query = "update addproduct set name=?,description=?, price=?, category=? where id=?";
        
        try{
            Connection conn = config.Config.conn;
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            
            pstmt.setString(1, u.getName());
            pstmt.setString(2, u.getDescription());
            pstmt.setFloat(3, u.getPrice());
            pstmt.setString(4, u.getCategory());
            
            pstmt.setInt(5, u.getId());
            
            pstmt.executeUpdate();
            
        }catch( Exception e ){
            e.printStackTrace();
        }
    
    }

    @Override
    public void delete(int uid) {
    String query = "delete from addproduct where id=?";
        
        try{
            Connection conn = config.Config.conn;
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setInt(1, uid);
                        
            pstmt.executeUpdate();
            
        }catch( Exception e ){
            e.printStackTrace();
        }
    
    }

    @Override
    public AddProduct getAddProduct(int uid) {
    String query = "select * from addproduct where id=?";
        
        try{
            Connection conn = config.Config.conn;
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setInt(1, uid);
            
            ResultSet rs = pstmt.executeQuery();
            
            while( rs.next() ){
                AddProduct u = new AddProduct();
                
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setDescription(rs.getString("description"));
                u.setPrice(rs.getFloat("price"));
                u.setCategory(rs.getString("category"));
                u.setImagePath(rs.getString("imagepath"));
                
                return u;
                
            }
            
        }catch( Exception e ){
            e.printStackTrace();
        }
        
        return null;
    }

    @Override
    public List<AddProduct> getAddProduct() {
    List<AddProduct> list = new ArrayList<>();
        
        String query = "select * from addproduct";
        
        try{
            Connection conn = config.Config.conn;
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            ResultSet rs = pstmt.executeQuery();
            
            while( rs.next() ){
                AddProduct u = new AddProduct();
                
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setDescription(rs.getString("description"));
                u.setPrice(rs.getFloat("price"));
                u.setCategory(rs.getString("category"));
                u.setImagePath(rs.getString("imagepath"));
                
                list.add(u);
                
            }
        
            
        }catch( Exception e ){
            e.printStackTrace();
        }
        
        return list;
    
    }
}

package impl;

import dao.CategoryDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Category;

public class CategoryDAOImpl implements CategoryDAO{

    @Override
    public void insert(Category u) {
        String query = "insert into category (name, description) values (?,?)";
        
        try{
            Connection conn = config.Config.conn;
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setString(1, u.getName());
            pstmt.setString(2, u.getDescription());
           
            pstmt.executeUpdate();
            
        }catch( Exception e ){
            e.printStackTrace();
        }
    }

    @Override
    public void update(Category u) {
        String query = "update category set name=?,description=? where id=?";
        
        try{
            Connection conn = config.Config.conn;
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setString(1, u.getName());
            pstmt.setString(2, u.getDescription());
            
            pstmt.setInt(3, u.getId());
            
            pstmt.executeUpdate();
            
        }catch( Exception e ){
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int uid) {
        String query = "delete from category where id=?";
        
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
    public Category getCategory(int uid) {
        String query = "select * from category where id=?";
        
        try{
            Connection conn = config.Config.conn;
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setInt(1, uid);
            
            ResultSet rs = pstmt.executeQuery();
            
            while( rs.next() ){
                Category u = new Category();
                
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setDescription(rs.getString("description"));
                
                return u;
                
            }
            
        }catch( Exception e ){
            e.printStackTrace();
        }
        
        return null;
    }
    

    @Override
    public List<Category> getCategory() {
        List<Category> list = new ArrayList<>();
        
        String query = "select * from category";
        
        try{
            Connection conn = config.Config.conn;
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            ResultSet rs = pstmt.executeQuery();
            
            while( rs.next() ){
                Category u = new Category();
                
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setDescription(rs.getString("description"));
                
                list.add(u);
                
            }
            
        }catch( Exception e ){
            e.printStackTrace();
        }
        
        return list;       
        
    }
}



package impl;

import dao.UsersDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Users;

public class UsersDAOImpl implements UsersDAO{

    @Override
    public boolean checkLogin(String email, String password ) {
        
        System.out.println("Check Login");
        System.out.println( email );
        System.out.println( password );
        
        String query = "select * from Users where email=? and password=?";
        
        try{
            Connection conn = config.Config.conn;
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            
            ResultSet rs = pstmt.executeQuery();
            
            return( rs.next() );
            
        }catch( Exception e ){
            e.printStackTrace();
        }
        
        return false;
    }

    
    
    @Override
    public void insert(Users u) {
        String query = "insert into Users (name,phone,password,email,address) values (?,?,?,?,?)";
        
        try{
            Connection conn = config.Config.conn;
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setString(1, u.getName());
            pstmt.setString(2, u.getPhone());
            pstmt.setString(3, u.getPassword());
            pstmt.setString(4, u.getEmail());
            pstmt.setString(5, u.getAddress());
            
            pstmt.executeUpdate();
            
        }catch( Exception e ){
            e.printStackTrace();
        }
    }

    @Override
    public void update(Users u) {
        String query = "update Users set name=?,phone=?,email=?,address=? where id=?";
        
        try{
            Connection conn = config.Config.conn;
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setString(1, u.getName());
            pstmt.setString(2, u.getPhone());
            pstmt.setString(3, u.getEmail());
            pstmt.setString(4, u.getAddress());
            pstmt.setInt(5, u.getId());
            
            pstmt.executeUpdate();
            
        }catch( Exception e ){
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int uid) {
        String query = "delete from Users where id=?";
        
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
    public Users getUsers(int uid) {
        String query = "select * from Users where id=?";
        
        try{
            Connection conn = config.Config.conn;
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setInt(1, uid);
            
            ResultSet rs = pstmt.executeQuery();
            
            while( rs.next() ){
                Users u = new Users();
                
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setAddress(rs.getString("address"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setPhone(rs.getString("phone"));
                
                return u;
                
            }
            
        }catch( Exception e ){
            e.printStackTrace();
        }
        
        return null;
    }

    @Override
    public List<Users> getUsers() {
        
        List<Users> list = new ArrayList<>();
        
        String query = "select * from Users";
        
        try{
            Connection conn = config.Config.conn;
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            ResultSet rs = pstmt.executeQuery();
            
            while( rs.next() ){
                Users u = new Users();
                
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setAddress(rs.getString("address"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setPhone(rs.getString("phone"));
                
                list.add(u);
                
            }
            
        }catch( Exception e ){
            e.printStackTrace();
        }
        
        return list;       
        
    }

    @Override
    public boolean getUsers(String email) {
        String query = "select * from Users where email=?";
        
        try{
            Connection conn = config.Config.conn;
            
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setString(1, email);
            
            ResultSet rs = pstmt.executeQuery();
            
            return ( rs.next() );
            
        }catch( Exception e ){
            e.printStackTrace();
        }
        
        return false;
    }
    
}

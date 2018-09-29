package config;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class Config implements ServletContextListener{

    public static Connection conn;
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Context Initialized");
        
        try{
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/category", "yash", "yash");
            
            System.out.println("DB Connected");
        }
        catch( Exception e ){
            e.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        
        try{
            conn.close();
            
            System.out.println("DB Disconnected");
        }
        catch( Exception e ){
            e.printStackTrace();
        }
        
        System.out.println("Context Destroyed");
    }
    
}

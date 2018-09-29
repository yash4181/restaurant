package validation;

import dao.UsersDAO;
import impl.UsersDAOImpl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.Users;

public class UserValidation {

    private Map<String,List<String>> validationMap = new HashMap<>();

    private static void addKey( String key , List<String> value , Map<String,List<String>> map ){
        
        if(value != null){
        
            if( map.get(key) == null ){
                ArrayList<String> list = new ArrayList();

                list.addAll(value);

                map.put(key, list);
            }
            else{
                ArrayList<String> list = (ArrayList) map.get(key) ;

                list.addAll(value);

                map.put(key, list);
            }
            
        }
        
        
    }
    
    private List<String> checkEmail(String email){
        
        List<String> list = new ArrayList<>();
        
        Pattern p = Pattern.compile("^[ \\w\\.]{5,}@[\\w]{2,}\\.[\\w]{2,}(\\.[\\w]{2,}){0,1}$");
        
        Matcher m = p.matcher(email);
        
        if( !m.matches() ){
            list.add("Invalid Email");
        }
        
        UsersDAO udao = new UsersDAOImpl();
        
        if( udao.getUsers(email) ){
            list.add("Email in Use");
        }
        
        return  (!list.isEmpty()) ? list : null;
        
    }
    
    private List<String> checkNumber(String number){
        
        List<String> list = new ArrayList<>();
        
        Pattern p = Pattern.compile("^[6-9][0-9]{9}$");
        
        Matcher m = p.matcher(number);
        
        if( !m.matches() ){
            list.add("Phone Number must be a valid Indian Mobile Number");
        }
        
        p = Pattern.compile("^.{10}$");
        
        m = p.matcher(number);
        
        if( !m.matches() ){
            list.add("Phone Number Must be 10 digits only");
        }
        
        return  (!list.isEmpty()) ? list : null;
        
    }
    
    private List<String> checkAddress(String address){
        
        List<String> list = new ArrayList<>();
        
        Pattern p = Pattern.compile("^.{30,}$");
        
        Matcher m = p.matcher(address);
        
        if( !m.matches() ){
            list.add("Address must be minimum 30 chars long");
        }
        
        
        return  (!list.isEmpty()) ? list : null;
        
    }
    
    private List<String> checkMatchPasswords(String password, String cpassword){
        
        List<String> list = new ArrayList<>();
        
        Pattern p = Pattern.compile("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$");

        Matcher m = p.matcher(password);
        
        if( !m.matches() ){
            list.add("Must have 4-8 characters with 1 special and 1 uppercase character");
        }
        
        if( !password.equals(cpassword) ){
            list.add("Passwords do Not Match");
        }
        
        
        return  (!list.isEmpty()) ? list : null;
        
    }
    
    
    
    public Map<String, List<String>> getValidationMap( Users u ) {
//        if(this.checkEmail( u.getEmail(), "Invalid Email" ) != null) addKey("email", this.checkEmail( u.getEmail(), "Invalid Email" ), validationMap);
        addKey("number", this.checkNumber( u.getPhone() ), validationMap);
        addKey("email", this.checkEmail(u.getEmail()), validationMap);
        addKey("address", this.checkAddress(u.getAddress()), validationMap);
        addKey("matchpasswords", this.checkMatchPasswords(u.getPassword(),u.getCpassword()), validationMap);
        
        return validationMap;
    }
      
    
}

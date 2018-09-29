<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
         <script>
function validate(){
var email=document.form.user.value;
var password=document.form.pass.value;
if(email==""){
 alert("Enter email!");
  return false;
}
if(password==""){
 alert("Enter Password!");
  return false;
}
return true;
}
</script>
        
    </head>
    <body style="margin: auto; width: 80%;">
        <div id="register">
        <h1>LOG IN:</h1>
        
                <form name="form" method="post" action="CheckLogin" onsubmit="javascript:return validate();">
                
                 <h3>Email:</h3>
                <input type="text" name="email" placeholder="Enter Email" class="form-control" required>
           
                 <h3>Password:</h3>
                <input type="password" name="pass" placeholder="Enter Password"  class="form-control" required>
           
                <br>
                
                    <input type="submit" value="Log In" class="btn btn-lg btn-success">
            
                
                
                
                </form>

        
        </div>
    </body>
</html>

<%-- 
    Document   : PlaceYourOrder
    Created on : Sep 26, 2018, 2:52:50 PM
    Author     : MAYANK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        
    </head>
    <body style="margin: auto; width: 80%;">
        
            <form action="UpdateAddressInCart" method="post">
            
                <input type="hidden" name="email" value="${param.email}"/>
                
            <h3>Billing Address:</h3>
            <textarea style="width: 300px; height: 100px;" name="bill" class="form-control" required></textarea>
            
            <h3>Shipping Address:</h3>
            <textarea style="width: 300px; height: 100px;" name="ship" class="form-control" required></textarea>
            
            
            <br>
            
            <input type="submit" value="Buy Order" class="btn btn-lg btn-success"/>
            
            
        </form>
    
        
                       
        
    </body>
</html>

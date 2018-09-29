<%-- 
    Document   : ViewSingleProduct
    Created on : 21 Sep, 2018, 2:21:54 PM
    Author     : rajku
--%>

<%@page import="dao.AddProductDAO"%>
<%@page import="impl.AddProductDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    AddProductDAO pdao = new AddProductDAOImpl();
    
    int id = Integer.parseInt( request.getParameter("id") );
    
    System.out.println( pdao.getAddProduct(id) );
    
    request.setAttribute("product", pdao.getAddProduct(id));
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Single Product</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    <body style="margin: auto; width: 80%;">
        <h1>View Single Product</h1>
    
        <h1>${product.getName()}</h1>
    
        <img src="${product.getImagePath()}" class="img img-thumbnail" style="max-width: 300px;"/>
        
        <br>
        <hr>
        
        <form action="AddToCart" method="post">
            
            <input type="hidden" name="pid" value="${product.getId()}"/>
            <input type="number" name="qty" class="form-control" placeholder="Enter Qty"/>
            <br>
            
            <input type="email" name="email" class="form-control" placeholder="Enter Email"/>
            
            <br>
            
            <input type="submit" value="Buy" class="btn btn-success"/>
            
        </form>
        
    </body>
</html>

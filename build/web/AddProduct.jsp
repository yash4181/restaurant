<%-- 
    Document   : Product
    Created on : Sep 13, 2018, 7:34:38 PM
    Author     : MAYANK
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="impl.CategoryDAOImpl"%>
<%@page import="dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Products</title>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        <%
        CategoryDAO cdao = new CategoryDAOImpl();
        request.setAttribute("categories", cdao.getCategory());
        %>
        
        
    </head>
    <body style="margin: auto; width: 80%;">
        <div id="products">
        <h1>Products:</h1>
    
        <form action="ViewAddProduct" method="post" enctype="multipart/form-data">
            
            <h3>Name:</h3>
            <input type="text" name="name" class="form-control" required>
            
            <h3>Description:</h3>
            <input type="description" name="description" class="form-control" required>
            
            <h3>Price:</h3>
            <input type="number" name="price" class="form-control" required>
            
            <h3>Image:</h3>
            <input type="file" name="file" class="form-control" required>
            
            <h3>Category:</h3>
            
            <select name="category" class="form-control">
                
                <c:forEach var="x" items="${categories}">
                    <option value="${x.getName()}" title="${x.getDescription()}">${x.getName()}</option>
                </c:forEach>
                
            </select>
            
            <br>
            
            <input type="submit" value="Submit" class="btn btn-lg btn-success">
                       
        </form>
        </div>
    </body>
</html>

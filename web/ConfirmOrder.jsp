<%-- 
    Document   : ProductSuccess
    Created on : 20 Sep, 2018, 12:43:37 PM
    Author     : rajku
--%>
<%@page import="impl.CartDAOImpl"%>
<%@page import="dao.CartDAO"%>
<%@page import="model.AddProduct" %>
<%@page import="dao.AddProductDAO" %>
<%@page import="impl.AddProductDAOImpl" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    CartDAO cdao = new CartDAOImpl();

    String email = request.getParameter("email");

    if (email != null) {
        cdao.deleteAllItemsByEmail(email);
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart View</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body style="margin: auto; width: 80%;">
        <h1>Thank You for Shopping with us!!</h1><br>

        
        <br>

        <a href="index.html"><input type="button" value="Home" class="btn btn-lg btn-danger"></a>


    </body>
</html>

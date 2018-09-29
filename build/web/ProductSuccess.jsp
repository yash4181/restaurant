<%-- 
    Document   : Success
    Created on : Aug 24, 2018, 2:00:04 PM
    Author     : MRuser
--%>

<%@page import="model.AddProduct"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dao.AddProductDAO"%>
<%@page import="impl.AddProductDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    AddProductDAO udao = new AddProductDAOImpl();

    request.setAttribute("addproduct", udao.getAddProduct());
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    <body style="margin: auto; width: 80%;">

        <h1>Products</h1>
        <a href="AddProduct.jsp"><input type="button" value="Back" class="btn btn-lg btn-danger"></a>
        <table class="table table-striped"> 

            <thead>

                <tr>
                    <td>Id</td>
                    <td>Image</td>
                    <td>Name</td>
                    <td>Description</td>
                    <td>Price</td>
                    <td>Category</td>
                </tr>

            </thead>

            <tbody>

                <c:forEach items="${addproduct}" var="x">
                    <tr>
                        <td>${x.getId()}</td>
                        <td><img src="${x.getImagePath()}" style="max-width: 100px;" class="img img-thumbnail"/></td>
                        <td>${x.getName()}</td>
                        <td>${x.getDescription()}</td>
                        <td>${x.getPrice()}</td>
                        <td>${x.getCategory()}</td>
                        <td><a href="UpdateAddProduct.jsp?id=${x.getId()}" class="btn btn-success">Update</a></td>
                        <td><a href="DeleteAddProduct?id=${x.getId()}" class="btn btn-danger">Delete</a></td>
                        <td><a href="ViewSingleProduct.jsp?id=${x.getId()}" class="btn btn-primary">View</a></td>
                   
                    </tr>
                </c:forEach>

            </tbody>

        </table>
    </body>
</html>

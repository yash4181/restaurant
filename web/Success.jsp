<%-- 
    Document   : Success
    Created on : Aug 24, 2018, 2:00:04 PM
    Author     : MRuser
--%>

<%@page import="model.Category"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dao.CategoryDAO"%>
<%@page import="impl.CategoryDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
CategoryDAO udao = new CategoryDAOImpl();

request.setAttribute("category", udao.getCategory());
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
        <h1>User Registered Successfully</h1>
    
        <h1>Users:</h1>
        <a href="InCat.jsp"><input type="button" value="Back" class="btn btn-lg btn-danger"></a>
        <table class="table table-striped"> 
            
            <thead>
                
                <tr>
                    <td>Id</td>
                    <td>Name</td>
                    <td>Description</td>
                </tr>
                
            </thead>
            
            <tbody>
             
                <c:forEach items="${category}" var="x">
                <tr>
                    <td>${x.getId()}</td>
                    <td>${x.getName()}</td>
                    <td>${x.getDescription()}</td>
                    <td><a href="UpdateCategory.jsp?id=${x.getId()}" class="btn btn-success">Update</a></td>
                    <td><a href="DeleteCategory?id=${x.getId()}" class="btn btn-danger">Delete</a></td>
                </tr>
                </c:forEach>
                
            </tbody>
            
        </table>
    </body>
</html>

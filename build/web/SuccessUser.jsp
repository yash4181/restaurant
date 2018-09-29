<%-- 
    Document   : Success
    Created on : Aug 24, 2018, 2:00:04 PM
    Author     : MRuser
--%>

<%@page import="model.Users"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dao.UsersDAO"%>
<%@page import="impl.UsersDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
UsersDAO udao = new UsersDAOImpl();

request.setAttribute("users", udao.getUsers());
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
        <a href="signup.jsp"><input type="button" value="Back" class="btn btn-lg btn-danger"></a>
        <table class="table table-striped"> 
            
            <thead>
                
                <tr>
                    <td>Id</td>
                    <td>Name</td>
                    <td>Address</td>
                    <td>Email</td>
                    <td>Phone</td>
                    <td>View</td>
                    <td>Update</td>
                    <td>Delete</td>
                </tr>
                
            </thead>
            
            <tbody>
             
                <c:forEach items="${users}" var="x">
                <tr>
                    <td>${x.getId()}</td>
                    <td>${x.getName()}</td>
                    <td>${x.getAddress()}</td>
                    <td>${x.getEmail()}</td>
                    <td>${x.getPhone()}</td>
                    <td><a href="ViewUser.jsp?id=${x.getId()}" class="btn btn-primary">View</a></td>
                    <td><a href="UpdateUser.jsp?id=${x.getId()}" class="btn btn-success">Update</a></td>
                    <td><a href="DeleteUser?id=${x.getId()}" class="btn btn-danger">Delete</a></td>
                </tr>
                </c:forEach>
                
            </tbody>
            
        </table>
    </body>
</html>

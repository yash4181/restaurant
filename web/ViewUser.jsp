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

request.setAttribute("user", udao.getUsers( Integer.parseInt(request.getParameter("id")) ));
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

<link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300|Slabo+27px" rel="stylesheet">

    </head>
    <body style="margin: auto; width: 80%;">
        
        <h1>View User:</h1>
        
        <table class="table table-striped">
            
            <tbody>
                <tr>
                    <td style="font-family: 'Slabo 27px', serif; font-size: 28px;"> <i><b>Id:</b></i> </td>
                    <td style="font-family: 'Open Sans Condensed', sans-serif; font-size: 28px;"> <b>${user.getId()}</b> </td>
                </tr>
                <tr>
                    <td style="font-family: 'Slabo 27px', serif; font-size: 28px;"> <i><b>Name:</b></i> </td>
                    <td style="font-family: 'Open Sans Condensed', sans-serif; font-size: 28px;"> <b>${user.getName()}</b> </td>
                </tr>
                <tr>
                    <td style="font-family: 'Slabo 27px', serif; font-size: 28px;"> <i><b>Email:</b></i> </td>
                    <td style="font-family: 'Open Sans Condensed', sans-serif; font-size: 28px;"> <b>${user.getEmail()}</b> </td>
                </tr>
                <tr>
                    <td style="font-family: 'Slabo 27px', serif; font-size: 28px;"> <i><b>Phone:</b></i> </td>
                    <td style="font-family: 'Open Sans Condensed', sans-serif; font-size: 28px;"> <b>${user.getPhone()}</b> </td>
                </tr>
                <tr>
                    <td style="font-family: 'Slabo 27px', serif; font-size: 28px;"> <i><b>Address:</b></i> </td>
                    <td style="font-family: 'Open Sans Condensed', sans-serif; font-size: 28px;"> <b>${user.getAddress()}</b> </td>
                </tr>
            </tbody>
            
        </table>
        
        
        
    </body>
</html>

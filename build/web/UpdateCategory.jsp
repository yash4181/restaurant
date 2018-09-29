<%-- *  
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

request.setAttribute("category", udao.getCategory( Integer.parseInt(request.getParameter("id")) ));
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>+
        

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300|Slabo+27px" rel="stylesheet">

    </head>
    <body style="margin: auto; width: 80%;">
        
        <h1>Update Category:</h1>
        
        <form method="post" action="UpdateCategoryToDB">

            <input type="hidden" value="${category.getId()}" name="id">
        
        <table class="table table-striped">
            
            <tbody>
                <tr>
                    <td style="font-family: 'Slabo 27px', serif; font-size: 28px;"> <i><b>Id:</b></i> </td>
                    <td style="font-family: 'Open Sans Condensed', sans-serif; font-size: 28px;"> <b>${category.getId()}</b> </td>
                </tr>
                <tr>
                    <td style="font-family: 'Slabo 27px', serif; font-size: 28px;"> <i><b>Name:</b></i> </td>
                    <td style="font-family: 'Open Sans Condensed', sans-serif; font-size: 28px;"> 
                        <b>
                            <input type="text" placeholder="Enter Username" class="form-control" value="${category.getName()}" name="name"/> 
                        </b>
                    </td>
                </tr>
                <tr>
                    <td style="font-family: 'Slabo 27px', serif; font-size: 28px;"> <i><b>Description:</b></i> </td>
                    <td style="font-family: 'Open Sans Condensed', sans-serif; font-size: 28px;">
                        <b>
                            <input type="category" placeholder="Enter Category" class="form-control" value="${category.getDescription()}" name="description"/> 
                        </b>
                    </td>
                </tr>
                
                
                <tr>
                    <td style="font-family: 'Open Sans Condensed', sans-serif; font-size: 28px;">
                        <input type="submit" value="Update" class="btn btn-success"/>
                    </td>
                </tr>
            </tbody>
            
        </table>
        </form>
        
        
    </body>
</html>

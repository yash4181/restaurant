<%-- 
    Document   : index
    Created on : Sep 25, 2018, 1:43:44 PM
    Author     : MAYANK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello ${sessionScope.loggedInUser}</h1>
        
                    <a href="profile.jsp">login</a>|  
                    <a href="logout.jsp">logout</a>|
    </body>
</html>

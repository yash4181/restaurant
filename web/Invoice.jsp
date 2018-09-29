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
        request.setAttribute("cartItems", cdao.getCart(email));
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
        <h1>Your Invoice:</h1><br>

        <table class="table table-striped" style="font-size: 30px; font-weight: bold;"> 


            <tbody>


                <tr>
                    <td>Billing Address</td>
                    <td>${cartItems.get(0).getBillingAddress()}</td>
                </tr>
                
                <tr>
                    <td>Shipping Address</td>
                    <td>${cartItems.get(0).getShippingAddress()}</td>
                </tr>

            </tbody>

        </table>

                <hr>
                
                <br>
                <br>
                
        <table class="table table-striped"> 

            <thead>

                <tr>
                    <td>Image</td>
                    <td>Category</td>
                    <td>Product Name</td>
                    <td>Price</td>
                    <td>Qty</td>
                    <td>Sub-Total</td>
                </tr>

            </thead>

            <tbody>


                <c:set var="gTotal" value="0"></c:set>

                <c:forEach items="${cartItems}" var="x">
                    <tr>
                        <td><img src="${x.getProduct().getImagePath()}" style="width: 50px; height:50px;"></td>
                        <td>${x.getProduct().getCategory()}</td>
                        <td>${x.getProduct().getName()}</td>
                        <td>${x.getProduct().getPrice()}</td>
                        <td>${x.getQty()}</td>
                        <td>${x.getQty() * x.getProduct().getPrice()}</td>

                        <c:set var="gTotal" value="${gTotal + x.getQty() * x.getProduct().getPrice()}"></c:set>


                        </tr>
                </c:forEach>

            </tbody>

        </table> 


        <h1> Grand Total: ${gTotal} </h1>

        <br>

        <a href="ConfirmOrder.jsp?email=${param.email}"><input type="button" value="Confirm" class="btn btn-lg btn-primary"></a>


    </body>
</html>

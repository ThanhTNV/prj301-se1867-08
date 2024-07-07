<%-- 
    Document   : productadmindetail
    Created on : Mar 16, 2024, 1:16:16 PM
    Author     : ducco
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<body style="background-color: grey;">
    <div style="margin-left: 700px; margin-top:100px; padding: 30px; font-size: 30px; border: black 2px solid; display: inline-block; background-color: white;">
        <h1>Product Detail </h1>
        <a href='admin?action=list'>Product List</a> | <a href='login.jsp'>Login</a>  | <a href='login?action=logout'>Logout</a>
        <form action="admin"method="POST">
                <table style="font-size: 30px">


                    <tr><td>Id</td><td>${requestScope.products.id}</td></tr>
                    <tr><td>Name</td><td>${requestScope.products.name}</td></tr>
                    <tr><td>Price</td><td>${requestScope.products.price}</td></tr>
                    <tr><td>Category</td><td>${requestScope.products.category}</td></tr>	
                    <tr><td>Amount</td><td>${requestScope.products.amount}</td></tr>		 
                    <tr><td>Color</td><td>${requestScope.products.color}</td></tr>		 
                    <tr><td>Type</td><td>${requestScope.products.type}</td></tr>		 
                    <tr><td>Size</td><td>${requestScope.products.size}</td></tr>		 
                    <tr><td>Status</td><td>${requestScope.products.status}</td></tr>

                </table>


                <form action="admin">
                    <input type=hidden name="id" value="${requestScope.products.id}">
                    <input type=hidden name="action" value="edit">
                    <input style="justify-content: center;
                           font-size: 20px;
                           padding: 10px;
                           " type=submit value="Edit"></form>
            </form>
</body>

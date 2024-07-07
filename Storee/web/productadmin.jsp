<%@page import="Users.UserDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/headeradmin.css">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

    </head>
    <header>
        <img class="logo-admin" src="images/logo1.png" alt="logo">

        <nav class="navbar">
            <ul>
                <li><a href="admin?action=list&keyword=Shirt" class="tags">SHIRTS</a></li>
                <li><a href="admin?action=list&keyword=Pant" class="tags">PANTS</a></li>
                <li><a href="admin?action=list&keyword=Accessory" class="tags">ACCESSORIES</a></li>
                <li><a href="admin?action=list&keyword=Perfume" class="tags">PERFUME</a></li>
                <li><a href="admin?action=voucherlist" class="tags">VOUCHER</a></li>
                <li><a href="admin?action=voucherlist" class="tags">ORDER</a></li>

            </ul>
        </nav>
            <c:if test="${not empty usersession}">
                
            <a href="./adminloginSucc.jsp" class="logicon"><img src="images/user1.png" alt="admin" ></a>
            </c:if>

    </header>

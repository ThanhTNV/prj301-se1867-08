<%@page import="Users.UserDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

    </head>
    <header>
        <a href="./home.jsp" class="logo"><img src="images/logo1.png" alt="logo"></a>

        <nav class="navbar">
            <ul>
                <li><a href="./home.jsp" class="tags">HOME</a></li>
                <li><a href="user?action=list&keyword=Shirt" class="tags">SHIRTS</a></li>
                <li><a href="user?action=list&keyword=Pant" class="tags">PANTS</a></li>
                <li><a href="user?action=list&keyword=Accessory" class="tags">ACCESORIES</a></li>
                <li><a href="user?action=list&keyword=Perfume" class="tags">PERFUME</a></li>

            </ul>
        </nav>
        <form action="user" method="GET">
            <div class="search">
                <span class="search-icon material-symbols-outlined"> search </span>
                <input class="search-input" type="search" name="keyword" placeholder="Search products...">
                <input type="submit" name="action" value="search" hidden>
            </div>
        </form>
        <c:if test="${empty usersession}">
            <a href="./login.jsp" class="logicon"><img src="images/user1.png" alt="user" ></a>
            <a href="user?action=showcart" class="carticon"><img src="images/shopping-bag.png" alt="cart" ></a>
            </c:if>
            <c:if test="${not empty usersession}">
                
            <a href="./loginSucc.jsp" class="logicon"><img src="images/user1.png" alt="user" ></a>
            <a href="user?action=showcart" class="carticon"><img src="images/shopping-bag.png" alt="cart" ></a>
            </c:if>

    </header>

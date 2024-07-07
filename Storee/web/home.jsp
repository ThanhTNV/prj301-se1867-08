<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Storee
    </title>
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

</head>

<body>
    <%@include file="header.jsp" %>

    <div>
        <img src="images/background.png" alt="" style="width: 100%;">
    </div>

    <div class="class">

        <div class="headcontent">
            <form action="">
                <input class="button-choose" type="button" value="NEW PRODUCT">
                <input class="button-choose" type="button" value="BEST SELLER">
                <input class="button-choose" type="button" value="COMMING SOON">
            </form>
        </div>

        <div class="product">
            <div class="product-content">
                <img src="images/aothun.png" alt="">
                <h2> Essential Shirt</h2>
                <h2> 450.000 VND</h2>
                <h5> <del> 500.000 VND </del></h5>
            </div>
            <div class="product-content">
                <img src="images/aohoodie.png" alt="">
                <h2> Hoodie</h2>
                <h2> 720.000 VND</h2>
                <h5> <del> 800.000 </del> </h5>
            </div>
            <div class="product-content">
                <img src="images/essensial.png" alt="">
                <h2> Men's Short</h2>
                <h2> 450.000 VND</h2>
                <h5> <del> 500.000 VND </del></h5>
            </div>
            <div class="product-content">
                <img src="images/giaynike.png" alt="">
                <h2> Nike Air Force 1</h2>
                <h2> 2.700.000 VND</h2>
                <h5> <del> 3.000.000 VND </del></h5>
                
            </div>
            <div class="product-content">
                <img src="images/diorsavage.png" alt="">
                <h2> Dior Savage EDP</h2>
                <h2> 3.250.000 VND</h2>
                
            </div>
        </div>
    </div>


    <%@include file="footer.jsp" %>
</body>

</html>

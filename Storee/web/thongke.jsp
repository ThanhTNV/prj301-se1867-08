<%-- 
    Document   : thongke
    Created on : Mar 2, 2024, 11:18:11 PM
    Author     : ducco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Storee - Admin
    </title>
    <link rel="stylesheet" href="css/productadmin.css">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>

<body>
    <header>
        <img src="images/logo1.png" alt="logo" width="20%" height="95%" style="margin-left: 10px;">
        <img src="images/user1.png" alt="user" style="margin-left: auto;width: 55px; margin-right: 20px;">
    </header>
    <div class="bodymenu">
        <div class="divmenu">
            <ul class="ulmenu">
                    <li><a href="aoadmin.jsp">ÁO</a></li>
                    <li><a href="quanadmin.jsp">QUẦN</a></li>
                    <li><a href="phukienadmin.jsp">PHỤ KIỆN</a></li>
                    <li><a href="nuochoaadmin.jsp">NƯỚC HOA</a></li>
                    <li><a href="voucher.jsp">VOUCHER</a></li>
                    <li><a style="color: white; background-color: grey;" href="thongke.jsp">THỐNG KÊ</a></li>
            </ul>
            <div>
                <div class="product">
                    <img src="images/hbshoodie.png" alt="product" width="80px" height="100px"
                        style="margin: 22px 20px;">
                    <p class="aohoodie">Áo Hoodie</p>
                    <p class="aohoodie">Size: XL</p> 
                    <p class="aohoodie">Màu: Đen</p>
                    <P class="aohoodie">Số lượng: 1</P>
                    <P class="aohoodie">Ngày: 16/08/2024</P>
                </div>
                <div class="product">
                    <img src="images/youthtee.png" alt="product" width="80px" height="100px"
                        style="margin: 22px 20px;">
                    <p class="aohoodie">Áo Youth Tee</p>
                    <p class="aohoodie">Size: L</p>
                    <p class="aohoodie">Màu: Trắng</p>
                    <P class="aohoodie">Số lượng: 100</P>
                    <P class="aohoodie">Ngày: 03/02/2024</P>
                </div>
                <button>+</button>
            </div>
        </div>

    </div>
</body>

</html>



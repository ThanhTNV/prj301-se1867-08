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
                    <li><a style="color: white; background-color: grey;"  >VOUCHER</a></li>
                    <li><a href="thongke.jsp">THỐNG KÊ</a></li>
            </ul>
            <div>
                <div class="product">
                    <p class="aohoodie">Mã: 123456</p>
                    <p class="aohoodie">Giảm: 10%</p>
                    <P class="aohoodie1">Sửa</P>
                    <P class="aohoodie1">Xóa</P>
                </div>
                <div class="product">
                    <p class="aohoodie">Mã: 456782</p>
                    <p class="aohoodie">Giảm: 20%</p>
                    <P class="aohoodie1">Sửa</P>
                    <P class="aohoodie1">Xóa</P>
                </div>
                <button>+</button>
            </div>
        </div>

    </div>
</body>

</html>


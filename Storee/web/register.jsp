<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Storee - Register</title>
        <link rel="stylesheet" href="css/register.css">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    </head>
    <body>
        <%@include file="header.jsp" %>


        <div class="register">
            <div class="element-register">
                <h1>Đăng ký tài khoản mới</h1>
                <p>Đăng nhập để không bỏ lỡ quyền lợi tích lũy và hoàn tiền</p>
                <p>cho bất kỳ đơn hàng nào</p>
                <h4>Đăng nhập hoặc đăng ký (miễn phí)</h4>
                <img src="images/gglogin.png" alt="" width="50px">
                <img src="images/fblogin.png" alt="" width="50px"> <br>
                <hr width="100%" align="left">

                <form action="register" method="post">
                    <input class="log" type="email" name="mail" placeholder="Email"> <br>
                    <input class="log" type="text" name="username" placeholder="Tên đăng nhập"> <br>
                    <input class="log" type="password" name="password" placeholder="Mật khẩu"> <br>          
                    <input class="sub" type="submit" value="Đăng ký"> <br>
                    <a class="dn" href="login.jsp">Đã có tài khoản? Đăng nhập tại đây </a>                  
                </form>
            </div>
        </div>

        <%@include file="footer.jsp" %>
    </body>
</html>

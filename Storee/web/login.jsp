<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Log In - Storee
        </title>
        <link rel="stylesheet" href="css/log.css">
      
    </head>

    <body>
        <%@include file="header.jsp" %>

        <div class="login">
            <div class="element-login">
                <h1>Login</h1>
                <p>Log in so you don't miss out on accumulated benefits</p>
                <p>and cashback for any order</p>
                <h4>Login or Register (free)</h4>
                <img src="images/gglogin.png" alt="" width="50px">
                <img src="images/fblogin.png" alt="" width="50px"> <br>
                <hr width="100%" align="left">
                <c:if test="${not empty error}">
                    ${error}
                </c:if>
                <form action="./login" method="post">
                    <input class="log" type="text" placeholder="Username" name="username"> <br>
                    <input class="log" type="password" placeholder="Password" name="password"> <br>
                    <input class="sub" type="submit" value="Login"> <br>
                    <a class="dk" href="register.jsp">Register</a>
                    <a class="for" href="">Forgot password</a>
                </form>
            </div>
        </div>




        <%@include file="footer.jsp" %>
    </body>

</html>




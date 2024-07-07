<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Log In - Storee
        </title>
        <link rel="stylesheet" href="css/loginSucc.css">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    </head>

    <body>
        <%@include file="productadmin.jsp" %>

        <div class="login">
            <div class="element-login">
                <h1>User Information</h1>
                <hr width="100%" align="left">

                <h3>Username: ${sessionScope.usersession.username}</h3>
                <h3>Email: ${sessionScope.usersession.mail}</h3>



                <hr width="100%" align="left">
                <div class="butt">



                    <form action="./login" method="POST">
                        <input name="action" value="logout" hidden="">
                        <input type="submit" value="Logout">

                    </form>
                </div>

            </div>
        </div>

        <%@include file="footer.jsp" %>
    </body>

</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit - Storee
        </title>
        <link rel="stylesheet" href="css/loginSucc.css">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    </head>

    <body>
        <%@include file="header.jsp" %>

        <div class="login">
            <div class="element-login">
                <h1>Thông tin người dùng</h1>
                <hr width="100%" align="left">

                <form action="./login" method="POST" class="butt">              
                    <table>

                        <tr><td>Password</td><td> <input name="password" value="${requestScope.user.password}"</td></tr>
                        <tr> <h3><td>Email</td></h3><td> <h3><input name="mail" value="${requestScope.user.mail }"</td></h3></tr>
                        
                        <tr><td>
                                <input type="text" name="username" value="${requestScope.user.username}" hidden>
                                <input type="text" name="action" value="save" hidden>
                                <input type=submit value=Save>
                            </td></tr>

                    </table>

                </form>


                
               

            </div>
        </div>

        <%@include file="footer.jsp" %>
    </body>

</html>

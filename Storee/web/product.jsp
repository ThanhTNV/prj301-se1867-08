<%-- 
    Document   : ao
    Created on : Mar 5, 2024, 12:09:53 PM
    Author     : Admin
--%>

<%@page import="Products.ProductsDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Products - Storee
        </title>
        <link rel="stylesheet" href="css/prrrr.css">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

    </head>

    <body>
        <%@include file="header.jsp" %>


        <div class="class">

            <div class="product">

                <div class="product2">
                    <%
                        List<ProductsDTO> list = (List<ProductsDTO>) request.getAttribute("list");
                        int count = 1;
                        for (ProductsDTO product : list) {
                            pageContext.setAttribute("product", product);

                    %>


                    <div class="product-content" id="cb1">
                        <label for="cb1">
                            <a href="user?action=details&id=${product.id}"><img src="${product.picture}" alt=""></a>
                            <h2> ${product.name}</h2>
                            <h3>Size: ${product.size}</h3>
                            <h2>$ ${product.price}</h2>
                            <h4>Stock: ${product.amount}</h4>
                        </label>
                    </div>
                    <%                        if (count == 5) {
                            count = 0;
                    %>
                </div>
                <div class="product2">
                    <%
                            }
                            count = count + 1;
                        }
                    %>   
                </div>

            </div>
        </div>


        <%@include file="footer.jsp" %>
    </body>

</html>

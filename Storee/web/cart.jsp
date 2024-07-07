<%@page import="java.util.List"%>
<%@page import="Products.ProductsDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Storee - Cart</title>
        <link rel="stylesheet" href="css/cart.css">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    </head>

    <body>
        <%@include file="header.jsp" %>

        <div class="bigcart">
            <form class="cart" action="./user" method="get">
                <div class="form">

                    <h1>Shipping information</h1>
                    <input class="inp" type="text" name="username"  placeholder="Fullname" size="40" required> <br>
                    <input class="inp" type="text" name="phone" placeholder="Phone" size="40"required> <br>
                    <input class="inp" type="text" name="address" placeholder="Address (Ex: 103 Van Phuc)" size="40"required> <br>
                    <input class="inp" type="text" name="notes" placeholder="Notes" size="40"required> <br>
                    <br>
                    <hr>
                    <h1>Payment method</h1>
                    <ul>
                        <li><input type="radio" name="payment" id="cb1" value="cod"/>
                            <label for="cb1"><img src="images/cod.png" /></label>
                        </li>
                        <li><input type="radio" name="payment" id="cb2" value="mm"/>
                            <label for="cb2"><img src="images/momo.png" /></label>
                        </li>
                        <li><input type="radio" name="payment" id="cb3" value="qr"/>       
                            <label for="cb3"><img src="images/qr.jpg" /></label>
                        </li>

                    </ul>

                </div>

                <div class="list">
                    <h1>Cart</h1>
                    <hr>
                    <table style="width: 100%;">
                        <thead>
                        <td style="padding-right: -50px;"><h3>Product Details</h3></td>
                        <td></td>
                        <td><h3>Amount</h3></td>
                        <td style="padding-left: 50px;"><h3>Price</h3></td>
                        </thead>



                        <%
                            int totalprice = 0;
                            List<ProductsDTO> listcart = (List<ProductsDTO>) request.getAttribute("cartlist");
                            if (listcart != null && !listcart.isEmpty()) {
                                for (ProductsDTO product : listcart) {
                                    pageContext.setAttribute("product", product);
                                    totalprice += product.getPrice();
                        %>

                        <div class="cart-descrb">

                            <div>
                                <div class="cartdetails">

                                    <input name="name" value="${product.name}"hidden>
                                    <input name="color" value="${product.color}"hidden>
                                    <input name="size" value="${product.size}"hidden>
                                    <tr>
                                        <td><img src="${product.picture}" alt=""></td>
                                        <td>

                                            <h2>${product.name}</h2>
                                            <h3>${product.color} / ${product.size} </h3>
                                        </td>
                                        <td style="padding-left: 50px;"> 1 </td>
                                        <td>$ ${product.price}</td>
                                    </tr>
                                </div> 
                            </div>  
                        </div>  


                        <%                            }
                        } else {
                        %>
                        <li>Nothing in your cart.</li>
                            <%
                                }
                            %>


                    </table>
                    <hr>

                        
                        <input class="liinp" type="text" name="voucher" id="" placeholder="Voucher" size="40" value="no" style="background-color: lightgrey;">
                        
                  

                    <div class="total">
                        <h3>Before sale<span>$ <%=totalprice%></span></h3>
                        <%

                            Integer sale = null;
                           // try {
                                //sale = Integer.parseInt(request.getAttribute("value"));
                           // } catch (NumberFormatException ex) {
                                //log("Parameter phone has wrong format.");
                           // }
                        %>



                        <h3>Sale<span>$ 0</span></h3>
                        <%
                            if (listcart != null && !listcart.isEmpty()) {
                                int dis = 300;
                        %>
                        <h3>Shipping cost<span>$ 300</span></h3>
                        <hr>
                        <h2>Total<span>$ <%=totalprice * (1 - 0.5) + 300%></span></h2>
                        <% } else {%>
                        <h3>Shipping cost<span>$ 0</span></h3>
                        <hr>
                        <h2>Total<span>$ <%=totalprice * (1 - 0.5)%></span></h2>
                        <%}
                        %>

                        <input name="totalPrice" value="700" hidden>
                        <input name="action" value="order" hidden>
                        <input class="ttoan" type="submit" value="ORDER">
                    </div>
                </div>

            </form>
        </div>

        <%@include file="footer.jsp" %>
    </body>

</html>

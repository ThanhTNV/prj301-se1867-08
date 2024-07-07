<%@page import="Vouchers.VouchersDTO"%>
<%@page import="Products.ProductsDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Products - Storee
        </title>
        <link rel="stylesheet" href="css/product.css">
        <link rel="stylesheet" href="css/adminlist.css">

        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

    </head>

    <body>
            <%@ include file="/productadmin.jsp" %>
            <c:if test="${not empty list}"> 
            <table style="margin: 10px 10px 10px 40px;  text-align: center; background-color: white" border>
                <tr class="adminlist">
                    <td  width="100px">Id</td>
                    <td  width="350px">Name</td>
                    <td  width="150px">Price</td>
                    <td width="150px">Category</td>
                    <td width="150px">Amount</td>
                    <td width="150px">Color</td>
                    <td width="150px">Type</td>
                    <td width="150px">Size</td>
                    <td width="150px">Status</td>
                    <td width="150px">Picture</td>
                    <td width="100px">Edit</td>
                    <td width="100px">Delete</td>
                </tr>
                <%
                    List<ProductsDTO> list = (List<ProductsDTO>) request.getAttribute("list");
                    for (ProductsDTO products : list) {
                        pageContext.setAttribute("products", products);
                %>
                <tr>
                    <td>${products.id} </td>
                    <td>${products.name}</td>
                    <td>${products.price}</td>
                    <td>${products.category}</td>
                    <td>${products.amount} </td>
                    <td>${products.color}</td>
                    <td>${products.type}</td>
                    <td>${products.size}</td>
                    <td>${products.status}</td>
                    <td>${products.picture}</td>
                    <td><form action="admin" method="POST">
                            <input name="action" value="edit" type="hidden">
                            <input name="id" value="${products.id}" type="hidden">
                            <input type="submit" value="Edit">
                        </form>
                    </td>
                    <td><form action="admin" method="POST">
                            <input name="action" value="delete" type="hidden">
                            <input name="id" value="${products.id}" type="hidden">
                            <input type="submit" value="Delete">
                        </form>
                    </td>

                </tr>
                <%
                    }
                %>   
            </table>
            <form style="margin-left: 900px" action="admin" method="POST">
                            <input name="action" value="create" type="hidden">
                            <input name="id" value="${products.id}" type="hidden">
                            <input type="submit" value="Create">
            </form>
            </c:if>
            <c:if test="${not empty voucherlist}"> 
                <table style="margin: 10px 10px 10px 40px;  text-align: center; background-color: white" border>
                <tr class="adminlist">
                    <td  width="100px">Id</td>
                    <td  width="350px">Value</td>
                    <td  width="150px">Status</td>

                </tr>
                <%
                    List<VouchersDTO> voucherlist = (List<VouchersDTO>) request.getAttribute("voucherlist");
                    for (VouchersDTO vouchers : voucherlist) {
                        pageContext.setAttribute("vouchers", vouchers);
                %>
                <tr>
                    <td>${vouchers.id} </td>
                    <td>${vouchers.value}</td>
                    <td>${vouchers.status}</td>

                    <td><form action="admin" method="POST">
                            <input name="action" value="voucher-edit" type="hidden">
                            <input name="id" value="${vouchers.id}" type="hidden">
                            <input type="submit" value="Edit">
                        </form>
                    </td>
                    <td><form action="admin" method="POST">
                            <input name="action" value="voucher-delete" type="hidden">
                            <input name="id" value="${vouchers.id}" type="hidden">
                            <input type="submit" value="Delete">
                        </form>
                    </td>

                </tr>
                <%
                    }
                %>   
            </table>
            <form style="margin-left: 300px" action="admin" method="POST">
                            <input name="action" value="voucher-create" type="hidden">
                            <input name="id" value="${vouchers.id}" type="hidden">
                            <input type="submit" value="Create">
            </form>
            </c:if>
    </body>

</html>

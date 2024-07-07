/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Order.OrderDAO;
import Order.OrderDTO;
import OrderDetails.OrderDetailsDAO;
import OrderDetails.OrderDetailsDTO;
import Products.ProductsDAO;
import Products.ProductsDTO;
import Users.UserDAO;
import Users.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "UserController", urlPatterns = {"/user"})
public class UserController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String keyword = request.getParameter("keyword");
            String id = request.getParameter("id");
            int totalPrice = 0;

            if (action.equals("list")) {
                ProductsDAO dao = new ProductsDAO();
                List<ProductsDTO> list = dao.list(keyword);
                request.setAttribute("list", list);
                request.getRequestDispatcher("product.jsp").forward(request, response);

            } else if (action.equals("search")) {
                ProductsDAO dao = new ProductsDAO();
                List<ProductsDTO> list = dao.searchName(keyword);
                request.setAttribute("list", list);
                request.getRequestDispatcher("product.jsp").forward(request, response);

            } else if (action.equals("details")) {

                ProductsDAO dao = new ProductsDAO();
                ProductsDTO product = null;
                if (id != null) {
                    product = dao.load(id);
                }

                request.setAttribute("product", product);
                RequestDispatcher rd = request.getRequestDispatcher("productdetails.jsp");
                rd.forward(request, response);
            } else if (action.equals("addcart")) {
                HttpSession session = request.getSession(false);
                if (session == null || session.getAttribute("usersession") == null) {
                    response.sendRedirect("login.jsp");
                    return;
                }
                if (id != null) {

                    List<ProductsDTO> cart = (List<ProductsDTO>) session.getAttribute("cart");
                    if (cart == null) {
                        cart = new ArrayList<>();
                        session.setAttribute("cart", cart);
                    }
                    boolean existsInCart = false;
                    for (ProductsDTO item : cart) {
                        if (item.getId().equals(id)) {
                            existsInCart = true;
                            break;
                        }
                    }
                    if (!existsInCart) {
                        ProductsDAO dao = new ProductsDAO();
                        ProductsDTO product = dao.load(id);
                        if (product != null) {
                            cart.add(product);
//                            totalPrice += product.getPrice();
//                            session.setAttribute("totalPrice", totalPrice);
                            //session.setAttribute("cart", cart);
                        }

                    }
                }

                response.sendRedirect("home.jsp");
            } else if (action.equals("showcart")) {
                HttpSession session = request.getSession(false);
                if (session == null || session.getAttribute("usersession") == null) {
                    response.sendRedirect("login.jsp");
                    return;
                }
                List<ProductsDTO> cart = (List<ProductsDTO>) session.getAttribute("cart");

                if (cart != null) {
                    ProductsDAO dao = new ProductsDAO();
                    List<ProductsDTO> cartlist = new ArrayList<>();
                    for (ProductsDTO cartItem : cart) {

                        ProductsDTO product = dao.load(cartItem.getId());
                        if (product != null) {
                            cartlist.add(product);
                        }
                    }
                    request.setAttribute("cartlist", cartlist);
                    //request.setAttribute("totalPrice", (int)session.getAttribute("totalPrice"));

                }

                RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
                rd.forward(request, response);
            } else if (action.equals("order")) {
                OrderDAO orderdao = new OrderDAO();
                String orderID = (String) orderdao.getMaxOrderID();
                String userID = request.getParameter("username");
                Integer phone = null;
                try {
                    phone = Integer.parseInt(request.getParameter("phone"));
                } catch (NumberFormatException ex) {
                    log("Parameter phone has wrong format.");
                }
                String address = request.getParameter("address");
                String voucher = request.getParameter("voucher");
                String notes = request.getParameter("notes");
                Integer totalPriceOrder = null;
                try {
                    totalPriceOrder = Integer.parseInt(request.getParameter("totalPrice"));
                } catch (NumberFormatException ex) {
                    log("Parameter totalPriceOrder has wrong format.");
                }
                OrderDTO neworder = new OrderDTO(orderID, userID, address, phone, "0", voucher, totalPriceOrder);
                orderdao.order(neworder);

                //detail
                HttpSession session = request.getSession(false);
                if (session == null || session.getAttribute("usersession") == null) {
                    response.sendRedirect("login.jsp");
                    return;
                }
                List<ProductsDTO> cart = (List<ProductsDTO>) session.getAttribute("cart");
                OrderDetailsDAO detaildao = new OrderDetailsDAO();               
                for (ProductsDTO cartItem : cart) {
                    String productID = cartItem.getId();
                   OrderDetailsDTO addOrder = new OrderDetailsDTO(orderID, productID);
                   detaildao.addOrderDetail(addOrder);
                    
                }

                RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
                rd.forward(request, response);
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

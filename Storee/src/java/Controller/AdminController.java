/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Products.ProductsDAO;
import Products.ProductsDTO;
import Users.UserDAO;
import Users.UserDTO;
import Vouchers.VouchersDAO;
import Vouchers.VouchersDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "UserController", urlPatterns = {"/user"})
public class AdminController extends HttpServlet {

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
            ProductsDAO productsDAO = new ProductsDAO();
            VouchersDAO vouchersDAO = new VouchersDAO();


            if (action.equals("list")) {
                ProductsDAO dao = new ProductsDAO();
                List<ProductsDTO> list = dao.list(keyword);
                request.setAttribute("list", list);
                request.getRequestDispatcher("productadminlist.jsp").forward(request, response);
            } else if (action.equals("voucherlist")) {
                VouchersDAO voucherdao = new VouchersDAO();
                List<VouchersDTO> voucherlist = voucherdao.list();
                request.setAttribute("voucherlist", voucherlist);
                request.getRequestDispatcher("productadminlist.jsp").forward(request, response);
            }
            else {
                switch (action) {
                    case "details":
                        String id = request.getParameter("id");

                        ProductsDTO products = null;
                        if (id != null) {
                            products = productsDAO.load(id);
                        }

                        request.setAttribute("products", products);
                        RequestDispatcher rd = request.getRequestDispatcher("productadmindetail.jsp");
                        rd.forward(request, response);
                        break;
                    case "edit":
                        id = null;
                        id = request.getParameter("id");
                        products = null;
                        if (id != null) {
                            products = productsDAO.load(id);
                        }

                        request.setAttribute("products", products);
                        request.setAttribute("nextaction", "update");

                        rd = request.getRequestDispatcher("productadminedit.jsp");
                        rd.forward(request, response);

                        break;
                    case "create":
                        id = null;
                        id = request.getParameter("id");
                        products = new ProductsDTO();
                        products.setId(id);
                        request.setAttribute("products", products);
                        request.setAttribute("nextaction", "insert");
                        rd = request.getRequestDispatcher("productadminedit.jsp");
                        rd.forward(request, response);
                        break;
                    case "update":
                        id = null;
                        id = request.getParameter("id");

                        String name = request.getParameter("name");
                        int price = Integer.parseInt(request.getParameter("price"));
                        String category = request.getParameter("category");
                        int amount = Integer.parseInt(request.getParameter("amount"));
                        String color = request.getParameter("color");
                        String type = request.getParameter("type");
                        String size = request.getParameter("size");
                        int status = Integer.parseInt(request.getParameter("status"));
                        String picture = request.getParameter("picture");

                        products = null;
                        if (id != null) {
                            products = productsDAO.load(id);
                        }

                        products.setName(name);
                        products.setPrice(price);
                        products.setCategory(category);
                        products.setAmount(amount);
                        products.setColor(color);
                        products.setType(type);
                        products.setSize(size);
                        products.setStatus(status);
                        products.setPicture(picture);

                        productsDAO.update(products);

                        request.setAttribute("products", products);
                        request.setAttribute("nextaction", "update");
                        rd = request.getRequestDispatcher("productadmindetail.jsp");
                        rd.forward(request, response);

                        break;
                    case "insert":
                        id = null;
                        id = request.getParameter("id");

                        name = request.getParameter("name");
                        price = Integer.parseInt(request.getParameter("price"));
                        category = request.getParameter("category");
                        amount = Integer.parseInt(request.getParameter("amount"));
                        color = request.getParameter("color");
                        type = request.getParameter("type");
                        size = request.getParameter("size");
                        status = Integer.parseInt(request.getParameter("status"));
                        picture = request.getParameter("picture");


                        products = new ProductsDTO();
                        products.setId(id);
                        products.setName(name);
                        products.setPrice(price);
                        products.setCategory(category);
                        products.setAmount(amount);
                        products.setColor(color);
                        products.setType(type);
                        products.setSize(size);
                        products.setStatus(status);
                        products.setPicture(picture);
    
                        productsDAO.insert(products);

                        request.setAttribute("products", products);
                        rd = request.getRequestDispatcher("productadmindetail.jsp");
                        rd.forward(request, response);
                        break;
                    case "delete":
                        id = null;
                        id = request.getParameter("id");

                        productsDAO.delete(id);

                        List<ProductsDTO> list = productsDAO.list(keyword);
                        request.setAttribute("list", list);
                        request.getRequestDispatcher("productadminlist.jsp").forward(request, response);
                        break;
                    case "voucher-edit":
                        id = null;
                        id = request.getParameter("id");
                        VouchersDTO vouchers = null;
                        if (id != null) {
                            vouchers = vouchersDAO.load(id);
                        }

                        request.setAttribute("vouchers", vouchers);
                        request.setAttribute("nextaction", "voucher-update");

                        rd = request.getRequestDispatcher("voucheradminedit.jsp");
                        rd.forward(request, response);

                        break;
                    case "voucher-create":
                        id = null;
                        id = request.getParameter("id");
                        vouchers = new VouchersDTO();
                        vouchers.setId(id);
                        request.setAttribute("vouchers", vouchers);
                        request.setAttribute("nextaction", "voucher-insert");
                        rd = request.getRequestDispatcher("voucheradminedit.jsp");
                        rd.forward(request, response);
                        break;
                    case "voucher-update":
                        id = null;
                        id = request.getParameter("id");

                        int value = Integer.parseInt(request.getParameter("value"));
                        status = Integer.parseInt(request.getParameter("status"));
                        vouchers = null;
                        if (id != null) {
                            vouchers = vouchersDAO.load(id);
                        }

                        vouchers.setValue(value);
                        vouchers.setStatus(status);

                        vouchersDAO.update(vouchers);

                        request.setAttribute("vouchers", vouchers);
                        request.setAttribute("nextaction", "voucher-update");
                        rd = request.getRequestDispatcher("voucheradmindetail.jsp");
                        rd.forward(request, response);

                        break;
                    case "voucher-insert":
                        id = null;
                        id = request.getParameter("id");

                        value = Integer.parseInt(request.getParameter("value"));
                        status = Integer.parseInt(request.getParameter("status"));
                        vouchers = null;


                        vouchers = new VouchersDTO();
                        vouchers.setId(id);
                        vouchers.setValue(value);
                        vouchers.setStatus(status);
    
                        vouchersDAO.insert(vouchers);

                        request.setAttribute("vouchers", vouchers);
                        rd = request.getRequestDispatcher("voucheradmindetail.jsp");
                        rd.forward(request, response);
                        break;
                    case "voucher-delete":
                        id = null;
                        id = request.getParameter("id");

                        vouchersDAO.delete(id);

                        List<VouchersDTO> voucherlist = vouchersDAO.list();
                        request.setAttribute("voucherlist", voucherlist);
                        request.getRequestDispatcher("productadminlist.jsp").forward(request, response);
                        break;
                }
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

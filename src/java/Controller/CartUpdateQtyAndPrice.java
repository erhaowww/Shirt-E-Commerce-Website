/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;
import model.Cart;
import model.CartService;

/**
 *
 * @author user
 */
public class CartUpdateQtyAndPrice extends HttpServlet {

    @PersistenceContext(unitName = "PeaceAssPU")
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            int userId = Integer.parseInt(request.getParameter("userId"));
            int cartId = Integer.parseInt(request.getParameter("cartId"));
            int productId = Integer.parseInt(request.getParameter("productId"));
            int payId = Integer.parseInt(request.getParameter("payId"));
            int qty = Integer.parseInt(request.getParameter("qty"));
            double line_subtotal = Double.parseDouble(request.getParameter("line_subtotal"));
            String size = request.getParameter("size");
            String status = request.getParameter("status");
            

            CartService cartService = new CartService(em);

            Cart tempCarttList = new Cart(cartId, productId, payId, userId, size, status, qty, line_subtotal);
            utx.begin();
            cartService.updateIQtyItem(tempCarttList);
            utx.commit();
            response.sendRedirect("CartDisplay?userId="+userId);
        } catch (Exception ex) {
            Logger.getLogger(Cart.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("cart.jsp");
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

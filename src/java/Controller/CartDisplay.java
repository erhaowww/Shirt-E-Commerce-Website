/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import model.Cart;
import model.CartInfo;
import model.CartService;
import model.Payment;
import model.PaymentService;

/**
 *
 * @author user
 */
public class CartDisplay extends HttpServlet {

    @PersistenceContext(unitName = "PeaceAssPU")
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            CartService cartService = new CartService(em);
            int userId = Integer.parseInt(request.getParameter("userId"));
//            PaymentService paymentService = new PaymentService(em);

//            List<Payment> paymentList = paymentService.findByPaymentStatus();

            List<CartInfo> cartList = cartService.cusfindByUserId(userId);

//            System.out.println("cartList size = " + cartList.size());
//
//            for (Payment payment : paymentList) {
//                System.out.println(payment.toString());
//                 System.out.println(cart.getProducts().toString());
//
//            }
//
//            for (Cart cart : cartList) {
//                System.out.println("cart quantity = " + cart.getQuantity() + " cart size = " + cart.getOrdersize() + " price = " + cart.getPrice() + " status = " + cart.getStatus());
//                System.out.println(cart.toString());
//                System.out.println(cart.getPayment().toString());
//                 System.out.println(cart.getProducts().toString());
//
//            }

            HttpSession session = request.getSession();
            session.setAttribute("cartList", cartList);
            response.sendRedirect("cart.jsp");
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

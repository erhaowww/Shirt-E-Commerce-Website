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
import model.PaymentService;
import java.time.LocalDateTime;  // Import the LocalDateTime class
import java.time.format.DateTimeFormatter;  // Import the DateTimeFormatter class
import model.CartPK;
import model.CartService;
import model.Payment;

/**
 *
 * @author user
 */
public class PaymentUpdate extends HttpServlet {

    @PersistenceContext(unitName = "PeaceAssPU")
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String[] tempPaymentId = request.getParameterValues("paymentId");
            String[] tempUserId = request.getParameterValues("userId");
            String[] tempCartId = request.getParameterValues("cartId");
            String[] tempProductId = request.getParameterValues("productId");

            int[] paymentId = new int[tempPaymentId.length];
            int[] userId = new int[tempUserId.length];
            int[] cartId = new int[tempCartId.length];
            int[] productId = new int[tempProductId.length];

            for (int i = 0; i < productId.length; i++) {
                paymentId[i] = Integer.parseInt(tempPaymentId[i]);
                userId[i] = Integer.parseInt(tempUserId[i]);
                cartId[i] = Integer.parseInt(tempCartId[i]);
                productId[i] = Integer.parseInt(tempProductId[i]);

            }

            String address = request.getParameter("address");
            String zip = request.getParameter("zip");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String country = request.getParameter("country");
            String full_address = address.concat(zip).concat(city).concat(state).concat(country);

            double basketTotal = Double.parseDouble(request.getParameter("basketTotal"));
            String payment_method = request.getParameter("payment_method");
            String shipping_method = request.getParameter("group1").toUpperCase();

            LocalDateTime myDateObj = LocalDateTime.now();
            DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
            String formattedDate = myDateObj.format(myFormatObj);

            PaymentService paymentService = new PaymentService(em);
            CartService cartService = new CartService(em);
            Payment payment = new Payment(paymentId[0], basketTotal, payment_method, full_address, shipping_method, formattedDate, "packaging");

            utx.begin();
            paymentService.updateItem(payment);
            for (int i = 0; i < cartId.length; i++) {
                Cart cart = new Cart(new CartPK(cartId[i], productId[i], paymentId[i], userId[i]), "ordering");
                cartService.updateCartStatus(cart);
            }
            utx.commit();

            response.sendRedirect("UserPayment");

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

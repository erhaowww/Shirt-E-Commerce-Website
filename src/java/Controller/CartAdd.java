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
public class CartAdd extends HttpServlet {

    @PersistenceContext(unitName = "PeaceAssPU")
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            int userId = Integer.parseInt(request.getParameter("userId"));
            int productId = Integer.parseInt(request.getParameter("productId"));
            double price = Double.parseDouble(request.getParameter("price"));
            String size = request.getParameter("size");
            String status = "ordering";

            CartService cartService = new CartService(em);
            PaymentService paymentService = new PaymentService(em);
//            List<Cart> cartList = cartService.findByUserId(userId);
            List<CartInfo> cartList = cartService.cusfindByUserId(userId);
            List<Payment> paymentList = paymentService.findByPaymentStatus();
            List<Cart> carttListAll = cartService.findAll();
            List<Payment> paymentListAll = paymentService.findAll();
            boolean addSameProdDetail = false;
            boolean addSamePayId = false;

            if (cartList.isEmpty()) { //if user didnt has any shopping cart that is "ordering" status
                Payment payment = new Payment(price, "NULL", "NULL", "GLS", "NULL", "pending");
                utx.begin();
                paymentService.addItem(payment);
                utx.commit();

                Cart cart = new Cart(1, price, size, "ordering", (carttListAll.size() + 1), (paymentListAll.size() + 1), productId, userId);
                utx.begin();
                cartService.addItem(cart);
                utx.commit();

            } else {
                for (CartInfo tempCarttList : cartList) { //if user order same clothes with same size, add quantity only but not cart row
                    if (tempCarttList.getCart().getCartPK().getProductId() == productId && tempCarttList.getCart().getOrdersize().equals(size)) {
                        utx.begin();
                        Cart cart = new Cart(tempCarttList.getCart().getQuantity(), tempCarttList.getCart().getPrice(), tempCarttList.getCart().getOrdersize(), tempCarttList.getCart().getStatus(), tempCarttList.getCart().getCartPK().getCartId(), tempCarttList.getCart().getCartPK().getPaymentId(), tempCarttList.getCart().getCartPK().getProductId(), tempCarttList.getCart().getCartPK().getUserId());
                        addSameProdDetail = cartService.updateSameProductDetail(cart, tempCarttList.getProduct().getProductAmount());
                        utx.commit();

                        break;
                    }
                }

                if (addSameProdDetail == false) { //if user has paymentId, use back the same payment row
                    for (CartInfo tempCarttList : cartList) {
                        for (Payment tempPaymentList : paymentList) {
                            if (tempCarttList.getCart().getCartPK().getPaymentId() == tempPaymentList.getPaymentId()) {
                                Cart cart = new Cart(1, price, size, status, (carttListAll.size() + 1), tempPaymentList.getPaymentId(), productId, userId);
                                utx.begin();
                                addSamePayId = cartService.addItem(cart);
                                utx.commit();

                                break;
                            }
                        }
                        if (addSamePayId == true) {
                            break;
                        }
                    }
                }
            }

            response.setContentType("text/plain");
            if (addSameProdDetail == false) {
                out.write(String.valueOf((cartList.size() + 1)));//add cart notification
            } else {
                out.write(String.valueOf((cartList.size())));
            }

//            response.sendRedirect("cart.jsp");
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

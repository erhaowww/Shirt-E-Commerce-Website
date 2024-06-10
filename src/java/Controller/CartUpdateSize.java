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

/**
 *
 * @author user
 */
public class CartUpdateSize extends HttpServlet {

    @PersistenceContext(unitName = "PeaceAssPU")
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
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
            List<CartInfo> cartInfo = cartService.cusfindByUserId(userId); //get the cartList that status=ordering
            Cart tempCarttList = new Cart(cartId, productId, payId, userId, size, status, qty, line_subtotal);
            boolean success = false;
            utx.begin();
            //if same product with same size, delete the row and the product qty plus 1
            for (CartInfo cartInfo1 : cartInfo) {
                if (cartInfo1.getCart().getCartPK().getCartId() != tempCarttList.getCartPK().getCartId()) { //if not same cart id, compare them
                    if (cartInfo1.getCart().getCartPK().getUserId() == tempCarttList.getCartPK().getUserId()) { //if same user id
                        if (cartInfo1.getCart().getCartPK().getProductId() == tempCarttList.getCartPK().getProductId()) { //if same product id
                            if (cartInfo1.getCart().getOrdersize().equals(tempCarttList.getOrdersize())) { //if same size
                                success = cartService.deleteItem(tempCarttList);
                                Cart oldCart = new Cart(cartInfo1.getCart().getCartPK().getCartId(), cartInfo1.getCart().getCartPK().getProductId(), cartInfo1.getCart().getCartPK().getPaymentId(), cartInfo1.getCart().getCartPK().getUserId(), cartInfo1.getCart().getOrdersize(), cartInfo1.getCart().getStatus(), cartInfo1.getCart().getQuantity(), cartInfo1.getCart().getPrice());
                                cartService.updateSameProductSize(oldCart, tempCarttList.getQuantity(), cartInfo1.getProduct().getProductAmount());
                                break;
                            }
                        }
                    }
                }
            }
            if (success == false) {
                cartService.updateSizeItem(tempCarttList);
            }
            utx.commit();

            if (success == false) {
                response.sendRedirect("CartDisplay?userId="+userId);
            } else {
                response.setContentType("text/plain");
                out.write("success"); 
            }

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

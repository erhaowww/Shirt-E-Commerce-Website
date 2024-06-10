/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.PaymentService;
import model.Shipping;

public class ShippingReport extends HttpServlet {

//    @PersistenceContext(unitName = "PeaceAssPU")
    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
//            String heading = getServletConfig().getInitParameter("viewShippingHeading");
            PaymentService paymentService = new PaymentService(em);
            List<Shipping> shippingList = paymentService.findShippings();
            
            double[] shippingPercentage = {0,0,0};
            for (Shipping shipping : shippingList) {
                if(shipping.getShippingMethod().equals("GLS"))
                    shippingPercentage[0]++;
                else if(shipping.getShippingMethod().equals("DHL"))
                    shippingPercentage[1]++;
                else
                    shippingPercentage[2]++;
            }
            
            
            HttpSession session = request.getSession();
            session.setAttribute("shippingList", shippingList);
//            session.setAttribute("heading", heading);
            session.setAttribute("shippingPercentage", shippingPercentage);
            response.sendRedirect("displayShippingReport.jsp");

        }catch (Exception ex) {
            response.sendRedirect("error.jsp");
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

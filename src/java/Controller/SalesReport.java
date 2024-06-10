/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CartService;
import model.PaymentService;
import model.Sales;
import model.Shipping;

/**
 *
 * @author user
 */
public class SalesReport extends HttpServlet {

//    @PersistenceContext(unitName = "PeaceAssPU")
    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
//            String heading = getServletConfig().getInitParameter("viewSalesHeading");
            CartService cartService = new CartService(em);
            List<Sales> tempSalesList = cartService.findSales();

            List<Sales> salesList = new ArrayList<>();
            Date d = new Date();
            String year = String.valueOf(d.getYear() + 1900);
            double[] monthlySales = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

            for (Sales sales : tempSalesList) {
                //if year = current year
                if (sales.getPaymentDate().substring(6, 10).equals(year)) {
                    salesList.add(sales);

                    //compare month to do monthly sales report
                    if (sales.getPaymentDate().substring(3, 5).equals("01")) {
                        monthlySales[0] += sales.getPaymentTotal();
                    } else if (sales.getPaymentDate().substring(3, 5).equals("02")) {
                        monthlySales[1] += sales.getPaymentTotal();
                    } else if (sales.getPaymentDate().substring(3, 5).equals("03")) {
                        monthlySales[2] += sales.getPaymentTotal();
                    } else if (sales.getPaymentDate().substring(3, 5).equals("04")) {
                        monthlySales[3] += sales.getPaymentTotal();
                    } else if (sales.getPaymentDate().substring(3, 5).equals("05")) {
                        monthlySales[4] += sales.getPaymentTotal();
                    } else if (sales.getPaymentDate().substring(3, 5).equals("06")) {
                        monthlySales[5] += sales.getPaymentTotal();
                    } else if (sales.getPaymentDate().substring(3, 5).equals("07")) {
                        monthlySales[6] += sales.getPaymentTotal();
                    } else if (sales.getPaymentDate().substring(3, 5).equals("08")) {
                        monthlySales[7] += sales.getPaymentTotal();
                    } else if (sales.getPaymentDate().substring(3, 5).equals("09")) {
                        monthlySales[8] += sales.getPaymentTotal();
                    } else if (sales.getPaymentDate().substring(3, 5).equals("10")) {
                        monthlySales[9] += sales.getPaymentTotal();
                    } else if (sales.getPaymentDate().substring(3, 5).equals("11")) {
                        monthlySales[10] += sales.getPaymentTotal();
                    } else {
                        monthlySales[11] += sales.getPaymentTotal();
                    }
                    
                    monthlySales[12] += sales.getPaymentTotal();
                }

            }

            HttpSession session = request.getSession();
            session.setAttribute("salesList", salesList);
//            session.setAttribute("heading", heading);
            session.setAttribute("year", year);
            session.setAttribute("monthlySales", monthlySales);
            response.sendRedirect("displaySalesReport.jsp");
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

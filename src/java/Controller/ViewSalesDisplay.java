/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.io.*;
import java.util.List;
import java.util.logging.*;
import javax.annotation.Resource;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.transaction.UserTransaction;
import model.Comment;
import model.CommentService;
import model.Payment;
import model.PaymentTest;
import model.PaymentService;
import model.Products;
import model.Users;
import model.UsersService;


public class ViewSalesDisplay extends HttpServlet {

   @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException{
            
                  try {

            PaymentService payService = new PaymentService(em);
            List<PaymentTest> cusList = payService.findByCustomerTest();

            HttpSession session = request.getSession();
            
           session.setAttribute("viewSalesList", cusList);

            response.sendRedirect("viewSales.jsp");
      
        } catch (Exception ex) {
            Logger.getLogger(CommentAdd.class.getName()).log(Level.SEVERE, null, ex);
              response.sendRedirect("secureStaff/Peace.jsp");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
}


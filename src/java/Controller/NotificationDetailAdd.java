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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.*;
import javax.annotation.Resource;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.transaction.UserTransaction;
import model.Comment;
import model.CommentService;
import model.Notification;
import model.NotificationDetail;
import model.NotificationDetailService;
import model.NotificationService;
import model.Products;
import model.Staff;
import model.Users;


public class NotificationDetailAdd extends HttpServlet {
    
   @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String successText = "Success Send Reply Comment.";
        
        
        try {
            String status = request.getParameter("status");
            String sender = request.getParameter("sender");
            String message = request.getParameter("message");
//         
            int staffId = Integer.parseInt(request.getParameter("staffId"));
            int userId = Integer.parseInt(request.getParameter("userId"));
            Staff staff = new Staff(staffId);
            Users user = new Users(userId);
                             System.out.println(status+" "+sender+" "+message+" "+staff.toString()+" "+user.toString());
          
            System.out.println(status+sender+message+staff.getStaffId()+user.getUserId());
//              public Notification(String message, String status, String sender, Staff staffId, Users userId) 




            Notification notification = new Notification(message, status,sender ,staff);
            NotificationService notificationService = new NotificationService(em);
           
         
            utx.begin();
            boolean success = notificationService.addItem(notification);
              
            utx.commit();
               

            
            HttpSession session = request.getSession();
//            session.setAttribute("success", success);
            session.setAttribute("successText", successText);
            response.sendRedirect("../secureStaff/NotificationDetailPKAdd?userId="+userId);
        } catch (Exception ex) {
            Logger.getLogger(Notification.class.getName()).log(Level.SEVERE, null, ex);

//            response.sendRedirect("Peacea.jsp");
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


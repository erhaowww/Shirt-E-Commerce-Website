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
import java.util.List;
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
import model.NotificationDetailPK;
import model.NotificationDetailService;
import model.NotificationService;
import model.Products;
import model.Staff;
import model.Users;


public class NotificationDetailPKAdd extends HttpServlet {
    
   @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String successText = "Success Send Reply Comment.";
        
                    Date time = Calendar.getInstance().getTime();
                   Date date = Calendar.getInstance().getTime();  
                DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");  
            DateFormat timeFormat = new SimpleDateFormat("hh:mm");  
                String strDate = dateFormat.format(date);  
                String strTime = timeFormat.format(time);  
                System.out.println("Converted String: " + strDate);  
        
        try {
            
            int userId = Integer.parseInt(request.getParameter("userId"));
     
            Users user = new Users(userId);
              
   
//            NotificationDetailPK notification = new NotificationDetailPK(message, status,sender ,staff,user);
            

            NotificationService notificationService = new NotificationService(em);
            
            
//             List<Notification> notificationService = NotificationService.;
             List<Notification> notification = notificationService.findAll();
             Notification newNoti = notification.get(notification.size() - 1);
              int notId = newNoti.getNotificationId();

              NotificationDetailPK notiPk = new NotificationDetailPK(notId,userId);
              
//            Notification notification2 = notificationService.findLast();
              NotificationDetail notificationD = new NotificationDetail(notiPk,strDate, strTime);
            NotificationDetailService notificationDetailService = new NotificationDetailService(em);
          
            
          
            
            
            utx.begin();
            boolean success = notificationDetailService.addItem(notificationD);       
            utx.commit();
   
            
            HttpSession session = request.getSession();
            session.setAttribute("success", success);
            session.setAttribute("successText", successText);
            response.sendRedirect("../secureStaff/include/Success.jsp");
        } catch (Exception ex) {
            Logger.getLogger(Notification.class.getName()).log(Level.SEVERE, null, ex);
//            response.sendRedirect("Peace.jsp");
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


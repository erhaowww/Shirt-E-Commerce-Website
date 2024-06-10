/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.awt.Image;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.io.*;
import java.nio.file.Paths;
import java.sql.Blob;
import java.util.logging.*;
import javax.annotation.Resource;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import javax.sql.rowset.serial.SerialBlob;
import javax.transaction.UserTransaction;
import model.Comment;
import model.CommentService;
import model.Products;
import model.ProductsService;
import model.Users;
import model.UsersService;


public class UsersUpdatePassword extends HttpServlet {
//(unitName="PeaceAssPU")
   @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try {

            String pss =request.getParameter("pss");
            String newpss =request.getParameter("newpss");
            String compss =request.getParameter("compss");
            int userId = Integer.parseInt(request.getParameter("userId"));
            

        UsersService userSearch = new UsersService(em);

         Users userS = userSearch.Search(userId);

            System.out.println(userS.getPassword());
         
            
//  boolean success = (Boolean)session.getAttribute("success");
//    String successText = (String)session.getAttribute("successText");
//          String redirect = (String)session.getAttribute("redirect");
         if(!(userS.getPassword().equals(pss))){
               HttpSession session = request.getSession();

                       session.setAttribute("error", false);
              session.setAttribute("errorText", "Old Password not Match");
                session.setAttribute("redirect", "changePss.jsp");
               
                response.sendRedirect("secureUser/error.jsp");
         }
         else{
              UsersService userService = new UsersService(em);
            Users user = new Users(userId,newpss);
          
               
            utx.begin();
            boolean success = userService.updateChangePss(user);
            utx.commit();
            
              HttpSession session = request.getSession();
            
                                  session.setAttribute("success", true);
              session.setAttribute("successText", "Password Successfully Changed");
                session.setAttribute("redirect", "changePss.jsp");
               
                response.sendRedirect("secureUser/success.jsp");
            
         }

        } catch (Exception ex) {
            Logger.getLogger(Comment.class.getName()).log(Level.SEVERE, null, ex);
//            response.sendRedirect("secureUser/home.jsp");
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


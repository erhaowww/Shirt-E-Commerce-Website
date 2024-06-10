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
import java.util.logging.*;
import javax.annotation.Resource;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.transaction.UserTransaction;
import model.Comment;
import model.CommentService;
import model.Products;
import model.Users;


public class CommentAdd extends HttpServlet {
//(unitName="PeaceAssPU")
   @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            int ratings = Integer.parseInt(request.getParameter("ratings"));
            String about = request.getParameter("about");
            String reviews = request.getParameter("reviews");
            int useid = Integer.parseInt(request.getParameter("userId"));
            Users userId = new Users(useid);

            Comment comment = new Comment(ratings, about, reviews,userId);
            CommentService commentService = new CommentService(em);
            
            utx.begin();
            boolean success = commentService.addItem(comment);
            utx.commit();
            
            HttpSession session = request.getSession();
            session.setAttribute("success", success);
            
              session.setAttribute("successText", "Comment Successfully Sended");
                session.setAttribute("redirect", "home.jsp");
               
                response.sendRedirect("secureUser/success.jsp");
            
//            response.sendRedirect("secureUser/productDetail.jsp?proName="+about);
        } catch (Exception ex) {
            Logger.getLogger(Comment.class.getName()).log(Level.SEVERE, null, ex);
//            response.sendRedirect("secureUser/productDetail.jsp");
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


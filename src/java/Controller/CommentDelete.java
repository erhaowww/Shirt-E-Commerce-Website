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
import model.Products;
import model.Users;
import model.UsersService;


public class CommentDelete extends HttpServlet {

   @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException{
            int id = Integer.parseInt(request.getParameter("commentUser"));
            String successText = "Successfully deleted comment.";
               try {
            CommentService commentService = new CommentService(em);
            HttpSession session = request.getSession();
//            Comment comment = (Comment)session.getAttribute("commentUser");

//            Integer id = comment.getCommentId();
               
            utx.begin();
            boolean success = commentService.deleteComment(id);
            utx.commit();
            
                  
            session.setAttribute("success", success);
            session.setAttribute("successText", successText);  
//            response.sendRedirect("../secureStaff/include/Success.jsp");
             response.sendRedirect("../secureStaff/CommentDisplay");
        } catch (Exception ex) {
            Logger.getLogger(CommentAdd.class.getName()).log(Level.SEVERE, null, ex);
//            response.sendRedirect("../secureStaff/Peace.jsp");
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


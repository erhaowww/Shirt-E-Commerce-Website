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

@MultipartConfig(location="/tmp", fileSizeThreshold=1024*1024, 
    maxFileSize=1024*1024*5, maxRequestSize=1024*1024*5*5)
public class UsersUpdate extends HttpServlet {
//(unitName="PeaceAssPU")
   @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
  int id = Integer.parseInt(request.getParameter("userId"));
            String pn =request.getParameter("pn");
            String email =request.getParameter("email");
            String name =request.getParameter("name");
            Part file = request.getPart("image");
            
            
                            out.println("<script type=\"text/javascript\">");
                out.println("alert('Updated User Profile');");
             
                out.println("</script>");
            
            String imageFileName = file.getSubmittedFileName();
            String uploadPath = "C:/PeaceAss/web/images/userImage/"+imageFileName;


            try{
                FileOutputStream fos = new FileOutputStream(uploadPath);
                InputStream is = file.getInputStream();
                
                byte[] data = new byte[is.available()];
                System.out.println(uploadPath);
                is.read(data);
                fos.write(data);
                fos.close();
            }catch(Exception e){
            e.printStackTrace();            
            }
            
//                public Users(Integer userId, String name, String email, String phoneNum, String image) {
             UsersService userService = new UsersService(em);
                 Users user = new Users(id,name,email,pn,imageFileName);
       
           
                if(imageFileName.isEmpty()){       
            utx.begin();
            boolean success = userService.updateNoImage(user);
            utx.commit();
            }else{

       
            utx.begin();
            boolean success = userService.updateItem(user);
            utx.commit();  
            }
           
       

            
            
            
            response.sendRedirect("NotificationDisplay?userId=" + id);
        } catch (Exception ex) {
            Logger.getLogger(Comment.class.getName()).log(Level.SEVERE, null, ex);
           response.sendRedirect("errorr.jsp");
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


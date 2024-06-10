/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;


import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import javax.servlet.RequestDispatcher;
import model.Users;

/**
 *
 * @author khairaychin
 */
public class RegisterServlet extends HttpServlet {

    @PersistenceContext
    EntityManager manager;
    @Resource
    UserTransaction transaction;
    String emailAddress = "username@domain.com";
    String regexPattern = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");

        System.out.println(username+password+email+phone);
        
// response.sendRedirect("secureStaff/a.jap");
        RequestDispatcher dispatcher = null;
        PrintWriter out = resp.getWriter();

        Users users = new Users(username, password, email, phone);

        if (username != null) {
            try {
                transaction.begin();
                manager.persist(users);
                transaction.commit();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            session.setAttribute("users", users);
        }

        
        if (username == null || username.equals("")) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Invalid Username ! ');");
            out.println("location='secureUser/users_signup.html';");
            out.println("</script>");
        }

        if (username.length() < 3) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Please Make Sure Username more than 3');");
            out.println("location='secureUser/users_signup.html';");
            out.println("</script>");
        }

        if (username.length() > 30) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Please Make Sure Username not more than 30');");
            out.println("location='secureUser/users_signup.html';");
            out.println("</script>");
        }

        if (password == null || password.equals("")) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Invalid Password ! ');");
            out.println("location='secureUser/users_signup.html';");
            out.println("</script>");
        }

        if (password.length() > 20) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Please Make Sure Password Less Than 20 !');");
            out.println("location='secureUser/users_signup.html';");
            out.println("</script>");
        }
        if (password.length() < 5) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Please Make Sure Password IN Between 5 - 20 !');");
            out.println("location='secureUser/users_signup.html';");
            out.println("</script>");
        }

        if (email == null || email.equals("")) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Invalid Email Address ! ');");
            out.println("location='secureUser/users_signup.html';");
            out.println("</script>");
        }



        if (phone == null || phone.equals("")) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Invalid Phone Number ! ');");
            out.println("location='secureUser/users_signup.html';");
            out.println("</script>");

        }
        if (phone.length() > 15) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Please Key In Legit Phone Number ');");
            out.println("location='secureUser/users_signup.html';");
            out.println("</script>");
        }

        if (phone.length() < 3) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Please Key In Legit Phone Number ');");
            out.println("location='secureUser/users_signup.html';");
            out.println("</script>");
        } else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Registration Completed');");
            out.println("location='secureUser/login.jsp';");
            out.println("</script>");
        }

        
    }
}

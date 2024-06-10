/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;
import model.Users;

/**
 *
 * @author khairaychin
 */
public class LoginServlet extends HttpServlet {

    @PersistenceContext
    EntityManager manager;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        try ( PrintWriter out = response.getWriter()) {
            RequestDispatcher req = null;

//                        response.sendRedirect("../a.jsp");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/peace", "nbuser", "nbuser");
            PreparedStatement stmt = conn.prepareStatement("SELECT USER_ID , NAME , PASSWORD, EMAIL, PHONE_NUM, IMAGE FROM USERS WHERE NAME = ? AND PASSWORD = ?");
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                System.out.println(rs.getString(1));
                int id = Integer.parseInt(rs.getString(1));
                Users profile = manager.find(Users.class, id);
//Users profile =new Users(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
                session.setMaxInactiveInterval(86400); //86400 secs = 24hours
                session.setAttribute("profileuser", profile);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Welcome back');");
                out.println("location='NotificationDisplay?userId=" + id + "';");
                out.println("</script>");

            } else {

                req = request.getRequestDispatcher("ReLogin");
                req.forward(request, response);
            }

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            processRequest(req, res);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}

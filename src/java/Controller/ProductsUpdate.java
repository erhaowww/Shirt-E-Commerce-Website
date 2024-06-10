/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import model.Products;
import model.ProductsService;
import java.io.*;
import java.util.logging.*;
import javax.annotation.Resource;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.transaction.UserTransaction;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;

@WebServlet("/ProductsUpdate")
@MultipartConfig(location = "/tmp", fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class ProductsUpdate extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            
            int productId = Integer.parseInt(request.getParameter("productId"));
            String productTitle = request.getParameter("name");
            String productDateStart = request.getParameter("date");
            Part file = request.getPart("image");
            String imageFileName = file.getSubmittedFileName();
            String uploadPath = "C:\\Peace\\web\\images\\product_image\\" + imageFileName;
            try {
                FileOutputStream fos = new FileOutputStream(uploadPath);
                InputStream is = file.getInputStream();

                byte[] data = new byte[is.available()];
                System.out.println(uploadPath);
                is.read(data);
                fos.write(data);
                fos.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

            Integer productStock = Integer.parseInt(request.getParameter("stock"));
            double productAmount = Double.parseDouble(request.getParameter("amount"));
            String[] allProductSize = request.getParameterValues("size");
            String productCategories = request.getParameter("category");
            StringBuilder sizeBuilder = new StringBuilder();
            for (String s : allProductSize) {
                sizeBuilder.append(s);
                sizeBuilder.append(",");
            }

            String productSize = sizeBuilder.toString();
            productSize = productSize.substring(0, productSize.length() - 1);

            Products products = new Products(productId, productTitle, productDateStart, imageFileName, productStock, productAmount, productSize, productCategories);

            ProductsService productsService = new ProductsService(em);
            boolean success;

            if (imageFileName.isEmpty()) {

                utx.begin();
                success = productsService.updateProductsNoImage(products);
                utx.commit();
            } else {

                utx.begin();
                success = productsService.updateProducts(products);
                utx.commit();
            }

            HttpSession session = request.getSession();
            session.setAttribute("success", success);
            response.sendRedirect("../secureStaff/ProductsDisplayToStaff");
        } catch (Exception ex) {
            //Logger.getLogger(ProductsAdd.class.getName()).log(Level.SEVERE, null, ex);
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

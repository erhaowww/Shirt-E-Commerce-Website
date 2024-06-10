package Controller;

import model.Products;
import model.ProductsService;
import java.io.*;
import java.util.List;
import java.util.logging.*;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class ProductsSearchAndSort extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ProductsService productsService = new ProductsService(em);
            HttpSession session = request.getSession();
            String search = request.getParameter("search");
            String sorting = request.getParameter("sorting");
            List<Products> ProductsList = (List) productsService.findAllProductsByProductTitle("%"+search+"%");
            if(search.equals("null")||search.equals("all")){
                if(sorting.equals("name-a-z")){
                    ProductsList = productsService.findAllOrderByNameAsc();
                }else if(sorting.equals("name-z-a")){
                    ProductsList = (List) productsService.findAllOrderByNameDesc();
                }else if(sorting.equals("price-low-high")){
                    ProductsList = (List) productsService.findAllOrderByPriceAsc();
                }else if(sorting.equals("price-high-low")){
                    ProductsList = (List) productsService.findAllOrderByPriceDesc();
                }
                search = "all";
            }else{
                if(sorting.equals("name-a-z")){
                    ProductsList = (List) productsService.findAllProductsByProductTitleOrderByNameAsc("%"+search+"%");
                }else if(sorting.equals("name-z-a")){
                    ProductsList = (List) productsService.findAllProductsByProductTitleOrderByNameDesc("%"+search+"%");
                }else if(sorting.equals("price-low-high")){
                    ProductsList = (List) productsService.findAllProductsByProductTitleOrderByPriceAsc("%"+search+"%");
                }else if(sorting.equals("price-high-low")){
                    ProductsList = (List) productsService.findAllProductsByProductTitleOrderByPriceDesc("%"+search+"%");
                }
            }
            
            
            session.setAttribute("proList", ProductsList);
            response.sendRedirect("product.jsp?search="+search+"&&orderBy="+sorting);
        } catch (Exception ex) {
            Logger.getLogger(ProductsAdd.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.*;

public class ProductsService {

    EntityManager mgr;
    @Resource
    Query query;

    public ProductsService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addProducts(Products products) {
        mgr.persist(products);
        return true;
    }

    public boolean deleteProducts(int productId) {
        Products products = findProductsByProductId(productId);
        if (products != null) {
            mgr.remove(products);
            return true;
        }
        return false;
    }

    public List<Products> findByProductTitle() {
        List productsList = mgr.createNamedQuery("Products.findByProductTitle").getResultList();
        return productsList;
    }

    public Products findProductsByProductTitle(String productTitle) {
        Products products = mgr.find(Products.class, productTitle);
        return products;
    }

    public List<Products> findAllProductsByProductTitle(String search) {
        List productsList = mgr.createNamedQuery("Products.findByProductTitle").setParameter("productTitle", search).getResultList();
        return productsList;
    }

    public List<Products> findAllProductsByProductTitleOrderByNameAsc(String search) {
        List productsList = mgr.createNamedQuery("Products.findByProductTitleOrderByNameAsc").setParameter("productTitle", search).getResultList();
        return productsList;
    }

    public List<Products> findAllProductsByProductTitleOrderByNameDesc(String search) {
        List productsList = mgr.createNamedQuery("Products.findByProductTitleOrderByNameDesc").setParameter("productTitle", search).getResultList();
        return productsList;
    }

    public List<Products> findAllProductsByProductTitleOrderByPriceAsc(String search) {
        List productsList = mgr.createNamedQuery("Products.findByProductTitleOrderByPriceAsc").setParameter("productTitle", search).getResultList();
        return productsList;
    }

    public List<Products> findAllProductsByProductTitleOrderByPriceDesc(String search) {
        List productsList = mgr.createNamedQuery("Products.findByProductTitleOrderByPriceDesc").setParameter("productTitle", search).getResultList();
        return productsList;
    }

    public Products findProductsByProductId(int productId) {
        Products products = mgr.find(Products.class, productId);
        return products;
    }

    public boolean updateProducts(Products products) {
        Products tempProducts = findProductsByProductId(products.getProductId());
        if (tempProducts != null) {
            tempProducts.setProductTitle(products.getProductTitle());
            tempProducts.setProductDateStart(products.getProductDateStart());
            tempProducts.setProductImage(products.getProductImage());
            tempProducts.setProductStock(products.getProductStock());
            tempProducts.setProductAmount(products.getProductAmount());
            tempProducts.setProductSize(products.getProductSize());
            tempProducts.setProductCategories(products.getProductCategories());
            return true;
        }
        return false;
    }

    public boolean updateProductsNoImage(Products products) {
        Products tempProducts = findProductsByProductId(products.getProductId());
        if (tempProducts != null) {
            tempProducts.setProductTitle(products.getProductTitle());
            tempProducts.setProductDateStart(products.getProductDateStart());
            tempProducts.setProductStock(products.getProductStock());
            tempProducts.setProductAmount(products.getProductAmount());
            tempProducts.setProductSize(products.getProductSize());
            tempProducts.setProductCategories(products.getProductCategories());
            return true;
        }
        return false;
    }

    public List<Products> findAll() {
        List productsList = mgr.createNamedQuery("Products.findAll").getResultList();
        return productsList;
    }

    public List<Products> findAllOrderByNameAsc() {
        List productsList = mgr.createNamedQuery("Products.findAllOrderByNameAsc").getResultList();
        return productsList;
    }

    public List<Products> findAllOrderByNameDesc() {
        List productsList = mgr.createNamedQuery("Products.findAllOrderByNameDesc").getResultList();
        return productsList;
    }

    public List<Products> findAllOrderByPriceAsc() {
        List productsList = mgr.createNamedQuery("Products.findAllOrderByPriceAsc").getResultList();
        return productsList;
    }

    public List<Products> findAllOrderByPriceDesc() {
        List productsList = mgr.createNamedQuery("Products.findAllOrderByPriceDesc").getResultList();
        return productsList;
    }

    public List<Products> findByProductId() {
        List productsList = mgr.createNamedQuery("Products.findByProductId").getResultList();
        return productsList;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author user
 */
public class CartInfo {
    private Cart cart;
    private Products product;
    private Payment payment;

    public CartInfo(Cart cart, Products product, Payment payment) {
        this.cart = cart;
        this.product = product;
        this.payment = payment;
    }

    public Cart getCart() {
        return cart;
    }

    public Products getProduct() {
        return product;
    }

    public Payment getPayment() {
        return payment;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public void setProduct(Products product) {
        this.product = product;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }

    

 
    
    
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author User
 */
public class PaymentMDisplay {
    
    int paymentId;
     int user_id;
      String user_name;
       String user_image;
    int product_title;
    int product_image;
    int quantity;
    String status;
    double payment_total;
    String payment_address;
    String payment_date;

    public PaymentMDisplay(int paymentId, int user_id, String user_name, String user_image, int product_title, int product_image, int quantity, String status, double payment_total, String payment_address, String payment_date) {
        this.paymentId = paymentId;
        this.user_id = user_id;
        this.user_name = user_name;
        this.user_image = user_image;
        this.product_title = product_title;
        this.product_image = product_image;
        this.quantity = quantity;
        this.status = status;
        this.payment_total = payment_total;
        this.payment_address = payment_address;
        this.payment_date = payment_date;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_image() {
        return user_image;
    }

    public void setUser_image(String user_image) {
        this.user_image = user_image;
    }

    public int getProduct_title() {
        return product_title;
    }

    public void setProduct_title(int product_title) {
        this.product_title = product_title;
    }

    public int getProduct_image() {
        return product_image;
    }

    public void setProduct_image(int product_image) {
        this.product_image = product_image;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getPayment_total() {
        return payment_total;
    }

    public void setPayment_total(double payment_total) {
        this.payment_total = payment_total;
    }

    public String getPayment_address() {
        return payment_address;
    }

    public void setPayment_address(String payment_address) {
        this.payment_address = payment_address;
    }

    public String getPayment_date() {
        return payment_date;
    }

    public void setPayment_date(String payment_date) {
        this.payment_date = payment_date;
    }

    
    
    
    
    
}

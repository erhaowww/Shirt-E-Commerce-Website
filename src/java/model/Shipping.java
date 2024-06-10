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
public class Shipping {

    private String name;
    private String phoneNum;
    private String address;
    private int quantity;
    private String productTitle;
    private String shippingMethod;
    private String shippingStatus;

    public Shipping() {
    }

    public Shipping(String name, String phoneNum, String address, int quantity, String productTitle, String shippingMethod, String shippingStatus) {
        this.name = name;
        this.phoneNum = phoneNum;
        this.address = address;
        this.quantity = quantity;
        this.productTitle = productTitle;
        this.shippingMethod = shippingMethod;
        this.shippingStatus = shippingStatus;
    }

    public void setShippingMethod(String shippingMethod) {
        this.shippingMethod = shippingMethod;
    }

    public String getShippingMethod() {
        return shippingMethod;
    }

    public void setProductTitle(String productTitle) {
        this.productTitle = productTitle;
    }

    public String getProductTitle() {
        return productTitle;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public int getQuantity() {
        return quantity;
    }

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getShippingStatus() {
        return shippingStatus;
    }

    public void setShippingStatus(String shippingStatus) {
        this.shippingStatus = shippingStatus;
    }
    
    

}

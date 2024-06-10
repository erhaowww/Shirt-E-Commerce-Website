/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


public class Sales extends Payment {
    private String name;
    private String paymentMethod;
    private double paymentTotal;
    private String paymentDate;

    public Sales() {
    }

    public Sales(String name, String paymentMethod, double paymentTotal, String paymentDate) {
        this.name = name;
        this.paymentMethod = paymentMethod;
        this.paymentTotal = paymentTotal;
        this.paymentDate = paymentDate;
    }
    

    public String getName() {
        return name;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public double getPaymentTotal() {
        return paymentTotal;
    }

    public String getPaymentDate() {
        return paymentDate;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public void setPaymentTotal(double paymentTotal) {
        this.paymentTotal = paymentTotal;
    }

    public void setPaymentDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }

    
    
}

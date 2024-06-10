/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.*;

public class PaymentService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public PaymentService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addItem(Payment payment) {
        mgr.persist(payment);
        return true;
    }

    public List<Payment> findByPaymentStatus() {
        List PaymentList = mgr.createNamedQuery("Payment.findByPaymentStatus").getResultList();
        return PaymentList;
    }

    public List<PaymentTest> findByCustomerTest() {
        List commentList = mgr.createNamedQuery("Payment.findByCustomerTest").getResultList();
        return commentList;
    }

    public List<Payment> findAll() {
        List PaymentList = mgr.createNamedQuery("Payment.findAll").getResultList();
        return PaymentList;
    }

    public Payment findPaymentById(int paymentId) {
        Payment pay = mgr.find(Payment.class, paymentId);
        return pay;
    }

    public List<PaymentDisplay2> findByCustomer() {
        List commentList = mgr.createNamedQuery("Payment.findByCustomer").getResultList();
        return commentList;
    }

    public List<Shipping> findShippings() {
        List ShippingList = mgr.createNamedQuery("Payment.findShipping").getResultList();
        return ShippingList;
    }

    public List<Payment> findByViewSales() {
        List commentList = mgr.createNamedQuery("Payment.findByViewSales").getResultList();
        return commentList;
    }

    public List<Comment> findByUserId() {
        List commentList = mgr.createNamedQuery("Comment.findByUserId").getResultList();
        return commentList;
    }

    public Payment findPaymentByCode(int code) {
        Payment payment = mgr.find(Payment.class, code);
        return payment;
    }

    public List<PaymentDisplay2> findByDelivered(int userId) {
        List commentList = mgr.createNamedQuery("Payment.findByDelivered").setParameter("userId", userId).getResultList();
        return commentList;
    }
    public List<PaymentDisplay2> findByAvailable(int userId) {
        List commentList = mgr.createNamedQuery("Payment.findByAvailable").setParameter("userId", userId).getResultList();
        return commentList;
    }

    public boolean deleteItem(int code) {
        Payment payment = findPaymentByCode(code);
        if (payment != null) {
//            mgr.remove(payment);
            payment.setPaymentStatus("cancelled");
            return true;
        }
        return false;
    }

    public boolean updateStatus(Payment pay) {
        Payment tempPayment = findPaymentById(pay.getPaymentId());
        if (tempPayment != null) {
            tempPayment.setPaymentStatus(pay.getPaymentStatus());

            return true;
        }
        return false;
    }

    public boolean updateItem(Payment payment) {
        Payment tempPayment = findPaymentByCode(payment.getPaymentId());
        if (tempPayment != null) {
            tempPayment.setPaymentTotal(payment.getPaymentTotal());
            tempPayment.setPaymentMethod(payment.getPaymentMethod());
            tempPayment.setPaymentAddress(payment.getPaymentAddress());
            tempPayment.setShipping(payment.getShipping());
            tempPayment.setPaymentDate(payment.getPaymentDate());
            tempPayment.setPaymentStatus(payment.getPaymentStatus());

            return true;
        }
        return false;
    }

}

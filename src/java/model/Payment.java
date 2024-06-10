/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author User
 */
@Entity
@Table(name = "PAYMENT")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Payment.findAll", query = "SELECT p FROM Payment p"),
    @NamedQuery(name = "Payment.findByPaymentId", query = "SELECT p FROM Payment p WHERE p.paymentId = :paymentId"),
    @NamedQuery(name = "Payment.findByPaymentTotal", query = "SELECT p FROM Payment p WHERE p.paymentTotal = :paymentTotal"),
    @NamedQuery(name = "Payment.findByPaymentMethod", query = "SELECT p FROM Payment p WHERE p.paymentMethod = :paymentMethod"),
    @NamedQuery(name = "Payment.findByPaymentAddress", query = "SELECT p FROM Payment p WHERE p.paymentAddress = :paymentAddress"),
    @NamedQuery(name = "Payment.findByShipping", query = "SELECT p FROM Payment p WHERE p.shipping = :shipping"),
    @NamedQuery(name = "Payment.findByPaymentDate", query = "SELECT p FROM Payment p WHERE p.paymentDate = :paymentDate"),
    @NamedQuery(name = "Payment.findByPaymentStatus", query = "SELECT p FROM Payment p WHERE p.paymentStatus = \"pending\""),
    @NamedQuery(name = "Payment.findByCustomerTest", query = "select new model.PaymentTest(p.paymentId, c.quantity, p.paymentTotal , o.productTitle, u.name, p.paymentDate "
            + " ) from Payment p join p.cartList c, c.products o, c.users u WHERE p.paymentStatus = \"delivered\" "),
    @NamedQuery(name = "Payment.findByCustomer", query = "select new model.PaymentDisplay2(p.paymentId, u.userId, u.name, u.image, o.productTitle, o.productImage, c.quantity, p.paymentStatus, p.paymentTotal, p.paymentAddress, p.paymentDate "
            + " ) from Payment p join p.cartList c, c.products o, c.users u WHERE p.paymentStatus = \"shipping\" or p.paymentStatus =\"packaging\" or p.paymentStatus =\"delivered\" "),

    @NamedQuery(name = "Payment.findByDelivered", query = "select new model.PaymentDisplay2(p.paymentId, u.userId, u.name, u.image, o.productTitle, o.productImage, c.quantity, p.paymentStatus, p.paymentTotal, p.paymentAddress, p.paymentDate "
            + " ) from Payment p join p.cartList c, c.products o, c.users u WHERE u.userId = :userId and p.paymentStatus = \"delivered\" AND c.status = \"ordered\""),

    @NamedQuery(name = "Payment.findByAvailable", query = "select new model.PaymentDisplay2(p.paymentId, u.userId, u.name, u.image, o.productTitle, o.productImage, c.quantity, p.paymentStatus, p.paymentTotal, p.paymentAddress, p.paymentDate "
            + " ) from Payment p join p.cartList c, c.products o, c.users u WHERE u.userId = :userId and p.paymentStatus = \"shipping\" or u.userId = :userId and p.paymentStatus =\"packaging\" AND c.status = \"ordered\""),
    //Shipping report
    @NamedQuery(name = "Payment.findShipping", query = "select new model.Shipping(u.name, u.phoneNum, p.paymentAddress, "
            + "c.quantity, o.productTitle, p.shipping, p.paymentStatus) from Payment p join p.cartList c, c.products o, c.users u WHERE p.paymentStatus <> \"pending\" AND"
            + " p.paymentStatus <> \"cancelled\" AND c.status = \"ordered\"")

})

public class Payment implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "PAYMENT_ID")
    private Integer paymentId;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "PAYMENT_TOTAL")
    private double paymentTotal;
    @Size(max = 100)
    @Column(name = "PAYMENT_METHOD")
    private String paymentMethod;
    @Size(max = 100)
    @Column(name = "PAYMENT_ADDRESS")
    private String paymentAddress;
    @Size(max = 100)
    @Column(name = "SHIPPING")
    private String shipping;
    @Size(max = 100)
    @Column(name = "PAYMENT_DATE")
    private String paymentDate;
    @Size(max = 100)
    @Column(name = "PAYMENT_STATUS")
    private String paymentStatus;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "payment")
    private List<Cart> cartList;

    public Payment() {
    }

    public Payment(Integer paymentId) {
        this.paymentId = paymentId;
    }

    public Payment(Integer paymentId, double paymentTotal, String paymentMethod, String paymentAddress, String shipping, String paymentDate, String paymentStatus) {
        this.paymentId = paymentId;
        this.paymentTotal = paymentTotal;
        this.paymentMethod = paymentMethod;
        this.paymentAddress = paymentAddress;
        this.shipping = shipping;
        this.paymentDate = paymentDate;
        this.paymentStatus = paymentStatus;
    }

    public Payment(Integer payId, String sts) {
        this.paymentId = payId;
        this.paymentStatus = sts;
    }

    public Payment(double paymentTotal, String paymentMethod, String paymentAddress, String shipping, String paymentDate, String paymentStatus) {
        this.paymentTotal = paymentTotal;
        this.paymentMethod = paymentMethod;
        this.paymentAddress = paymentAddress;
        this.shipping = shipping;
        this.paymentDate = paymentDate;
        this.paymentStatus = paymentStatus;
    }

    public Integer getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(Integer paymentId) {
        this.paymentId = paymentId;
    }

    public double getPaymentTotal() {
        return paymentTotal;
    }

    public void setPaymentTotal(double paymentTotal) {
        this.paymentTotal = paymentTotal;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getPaymentAddress() {
        return paymentAddress;
    }

    public void setPaymentAddress(String paymentAddress) {
        this.paymentAddress = paymentAddress;
    }

    public String getShipping() {
        return shipping;
    }

    public void setShipping(String shipping) {
        this.shipping = shipping;
    }

    public String getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    @XmlTransient
    public List<Cart> getCartList() {
        return cartList;
    }

    public void setCartList(List<Cart> cartList) {
        this.cartList = cartList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (paymentId != null ? paymentId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Payment)) {
            return false;
        }
        Payment other = (Payment) object;
        if ((this.paymentId == null && other.paymentId != null) || (this.paymentId != null && !this.paymentId.equals(other.paymentId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Payment[ paymentId=" + paymentId + " ]";
    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author User
 */
@Entity
@Table(name = "CART")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cart.findAll", query = "SELECT c FROM Cart c"),
    @NamedQuery(name = "Cart.findByCartId", query = "SELECT c FROM Cart c WHERE c.cartPK.cartId = :cartId"),
    @NamedQuery(name = "Cart.findByProductId", query = "SELECT c FROM Cart c WHERE c.cartPK.productId = :productId"),
    @NamedQuery(name = "Cart.findByPaymentId", query = "SELECT c FROM Cart c WHERE c.cartPK.paymentId = :paymentId"),
    @NamedQuery(name = "Cart.findByUserId", query = "SELECT c FROM Cart c WHERE c.cartPK.userId = :userId"),
    @NamedQuery(name = "Cart.findByQuantity", query = "SELECT c FROM Cart c WHERE c.quantity = :quantity"),
    @NamedQuery(name = "Cart.findByPrice", query = "SELECT c FROM Cart c WHERE c.price = :price"),
    @NamedQuery(name = "Cart.findByOrdersize", query = "SELECT c FROM Cart c WHERE c.ordersize = :ordersize"),
    @NamedQuery(name = "Cart.findByStatus", query = "SELECT c FROM Cart c WHERE c.status = :status"),

    //    display cart
    @NamedQuery(name = "Cart.cusfindByUserId", query = "SELECT new model.CartInfo(c, o, p) FROM Cart c join c.products o, c.payment p WHERE c.cartPK.userId = :userId "
            + "AND c.cartPK.productId = o.productId AND c.cartPK.paymentId = p.paymentId  AND c.status = \"ordering\""),

    //Sales report
    @NamedQuery(name = "Cart.findSales", query = "select DISTINCT new model.Sales(u.name, "
            + "p.paymentMethod, p.paymentTotal, p.paymentDate) from Cart c  join c.payment p, c.users u WHERE c.status = \"ordered\" AND"
            + " p.paymentStatus <> \"pending\" AND p.paymentStatus <> \"cancelled\"")
})
public class Cart implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected CartPK cartPK;
    @Column(name = "QUANTITY")
    private Integer quantity;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "PRICE")
    private double price;
    @Size(max = 10)
    @Column(name = "ORDERSIZE")
    private String ordersize;
    @Size(max = 50)
    @Column(name = "STATUS")
    private String status;
    @JoinColumn(name = "PAYMENT_ID", referencedColumnName = "PAYMENT_ID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Payment payment;
    @JoinColumn(name = "PRODUCT_ID", referencedColumnName = "PRODUCT_ID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Products products;
    @JoinColumn(name = "USER_ID", referencedColumnName = "USER_ID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Users users;

    public Cart() {
    }

    public Cart(CartPK cartPK) {
        this.cartPK = cartPK;
    }

    public Cart(int cartId, int productId, int paymentId, int userId) {
        this.cartPK = new CartPK(cartId, productId, paymentId, userId);
    }

    public Cart(int cartId, int productId, int paymentId, int userId, String ordersize, String status, int qty, double linePrice) {
        this.cartPK = new CartPK(cartId, productId, paymentId, userId);
        this.ordersize = ordersize;
        this.status = status;
        this.quantity = qty;
        this.price = linePrice;
    }

    public Cart(int quantity, double price, String ordersize, String status, int cartId, int paymentId, int productId, int userId) {
        this.quantity = quantity;
        this.price = price;
        this.ordersize = ordersize;
        this.status = status;
        this.cartPK = new CartPK(cartId, productId, paymentId, userId);

    }

    public Cart(CartPK cartPK, String status) {
        this.cartPK = cartPK;
        this.status = status;
    }

    public CartPK getCartPK() {
        return cartPK;
    }

    public void setCartPK(CartPK cartPK) {
        this.cartPK = cartPK;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getOrdersize() {
        return ordersize;
    }

    public void setOrdersize(String ordersize) {
        this.ordersize = ordersize;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }

    public Products getProducts() {
        return products;
    }

    public void setProducts(Products products) {
        this.products = products;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cartPK != null ? cartPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cart)) {
            return false;
        }
        Cart other = (Cart) object;
        if ((this.cartPK == null && other.cartPK != null) || (this.cartPK != null && !this.cartPK.equals(other.cartPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Cart[ cartPK=" + cartPK + " ]";
    }

}

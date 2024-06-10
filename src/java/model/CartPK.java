/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author User
 */
@Embeddable
public class CartPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "CART_ID")
    private int cartId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "PRODUCT_ID")
    private int productId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "PAYMENT_ID")
    private int paymentId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "USER_ID")
    private int userId;

    public CartPK() {
    }

    public CartPK(int cartId, int productId, int paymentId, int userId) {
        this.cartId = cartId;
        this.productId = productId;
        this.paymentId = paymentId;
        this.userId = userId;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) cartId;
        hash += (int) productId;
        hash += (int) paymentId;
        hash += (int) userId;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CartPK)) {
            return false;
        }
        CartPK other = (CartPK) object;
        if (this.cartId != other.cartId) {
            return false;
        }
        if (this.productId != other.productId) {
            return false;
        }
        if (this.paymentId != other.paymentId) {
            return false;
        }
        if (this.userId != other.userId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.CartPK[ cartId=" + cartId + ", productId=" + productId + ", paymentId=" + paymentId + ", userId=" + userId + " ]";
    }
    
}

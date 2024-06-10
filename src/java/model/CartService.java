/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.*;

public class CartService {

    @PersistenceContext(unitName = "PeaceAssPU")
    EntityManager mgr;
    @Resource
    Query query;

    public CartService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addItem(Cart cart) {
        mgr.persist(cart);
        return true;
    }

    public boolean updateCartStatus(Cart cart) {
        Cart tempItem = findItemByCode(cart.getCartPK());
        if (tempItem != null) {
            tempItem.setStatus(("ordered"));
            return true;
        }
        return false;
    }

    public boolean updateSameProductDetail(Cart cart, double product_price) {
        Cart tempItem = findItemByCode(cart.getCartPK());
        if (tempItem != null) {
            tempItem.setQuantity((cart.getQuantity() + 1));
            tempItem.setPrice((product_price*(cart.getQuantity()+1)));
            return true;
        }
        return false;
    }
    
        public boolean updateSameProductSize(Cart cart, int previousQty, double product_price) {
        Cart tempItem = findItemByCode(cart.getCartPK());
        if (tempItem != null) {
            tempItem.setQuantity((cart.getQuantity() + previousQty));
            tempItem.setPrice((product_price*(cart.getQuantity()+previousQty)));
            return true;
        }
        return false;
    }

    public boolean updateIQtyItem(Cart cart) {
        Cart tempItem = findItemByCode(cart.getCartPK());
        if (tempItem != null) {
            tempItem.setQuantity((cart.getQuantity()));
            tempItem.setPrice(cart.getPrice());
            return true;
        }
        return false;
    }

    public boolean updateSizeItem(Cart cart) {
        Cart tempItem = findItemByCode(cart.getCartPK());
        if (tempItem != null) {
            tempItem.setOrdersize(cart.getOrdersize());
            return true;
        }
        return false;
    }

    public boolean deleteItem(Cart cart) {
        Cart tempItem = findItemByCode(cart.getCartPK());
        if (tempItem != null) {
            tempItem.setStatus("cancelled");
            return true;
        }
        return false;
    }

    public Cart findItemByCode(CartPK code) {
        Cart cart = mgr.find(Cart.class, code);
        return cart;
    }

    public List<Cart> findAll() {
        List cart = mgr.createNamedQuery("Cart.findAll").getResultList();
        return cart;
    }

    public List<Cart> findByUserId(int userId) {
        List cart = mgr.createNamedQuery("Cart.findByUserId").setParameter("userId", userId).getResultList();
        return cart;
    }

    public List<CartInfo> cusfindByUserId(int userId) {
        List cart = mgr.createNamedQuery("Cart.cusfindByUserId").setParameter("userId", userId).getResultList();
        return cart;
    }

    public List<Sales> findSales() {
        List SalesList = mgr.createNamedQuery("Cart.findSales").getResultList();
        return SalesList;
    }

}

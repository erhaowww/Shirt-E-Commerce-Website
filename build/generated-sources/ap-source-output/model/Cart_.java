package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.CartPK;
import model.Payment;
import model.Products;
import model.Users;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2022-04-16T21:23:53")
@StaticMetamodel(Cart.class)
public class Cart_ { 

    public static volatile SingularAttribute<Cart, Integer> quantity;
    public static volatile SingularAttribute<Cart, Double> price;
    public static volatile SingularAttribute<Cart, CartPK> cartPK;
    public static volatile SingularAttribute<Cart, String> ordersize;
    public static volatile SingularAttribute<Cart, Payment> payment;
    public static volatile SingularAttribute<Cart, Users> users;
    public static volatile SingularAttribute<Cart, String> status;
    public static volatile SingularAttribute<Cart, Products> products;

}
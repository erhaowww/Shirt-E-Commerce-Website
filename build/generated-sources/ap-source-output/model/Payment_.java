package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Cart;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2022-04-16T21:23:53")
@StaticMetamodel(Payment.class)
public class Payment_ { 

    public static volatile SingularAttribute<Payment, String> paymentAddress;
    public static volatile SingularAttribute<Payment, String> shipping;
    public static volatile SingularAttribute<Payment, Integer> paymentId;
    public static volatile SingularAttribute<Payment, String> paymentMethod;
    public static volatile SingularAttribute<Payment, Double> paymentTotal;
    public static volatile SingularAttribute<Payment, String> paymentDate;
    public static volatile SingularAttribute<Payment, String> paymentStatus;
    public static volatile ListAttribute<Payment, Cart> cartList;

}
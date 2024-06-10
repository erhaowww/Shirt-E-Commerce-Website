package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Notification;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2022-04-16T21:23:53")
@StaticMetamodel(Staff.class)
public class Staff_ { 

    public static volatile SingularAttribute<Staff, String> image;
    public static volatile SingularAttribute<Staff, String> password;
    public static volatile ListAttribute<Staff, Notification> notificationList;
    public static volatile SingularAttribute<Staff, String> name;
    public static volatile SingularAttribute<Staff, String> phoneNum;
    public static volatile SingularAttribute<Staff, Integer> staffId;
    public static volatile SingularAttribute<Staff, String> email;

}
package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.NotificationDetail;
import model.Staff;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2022-04-16T21:23:53")
@StaticMetamodel(Notification.class)
public class Notification_ { 

    public static volatile ListAttribute<Notification, NotificationDetail> notificationDetailList;
    public static volatile SingularAttribute<Notification, String> sender;
    public static volatile SingularAttribute<Notification, Integer> notificationId;
    public static volatile SingularAttribute<Notification, String> message;
    public static volatile SingularAttribute<Notification, Staff> staffId;
    public static volatile SingularAttribute<Notification, String> status;

}
package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Notification;
import model.NotificationDetailPK;
import model.Users;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2022-04-16T21:23:53")
@StaticMetamodel(NotificationDetail.class)
public class NotificationDetail_ { 

    public static volatile SingularAttribute<NotificationDetail, Notification> notification;
    public static volatile SingularAttribute<NotificationDetail, NotificationDetailPK> notificationDetailPK;
    public static volatile SingularAttribute<NotificationDetail, String> notificationTime;
    public static volatile SingularAttribute<NotificationDetail, Users> users;
    public static volatile SingularAttribute<NotificationDetail, String> notificationDate;

}
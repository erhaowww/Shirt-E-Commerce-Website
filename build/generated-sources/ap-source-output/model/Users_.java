package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.NotificationDetail;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2022-04-16T21:23:53")
@StaticMetamodel(Users.class)
public class Users_ { 

    public static volatile ListAttribute<Users, NotificationDetail> notificationDetailList;
    public static volatile SingularAttribute<Users, String> image;
    public static volatile SingularAttribute<Users, String> password;
    public static volatile SingularAttribute<Users, String> name;
    public static volatile SingularAttribute<Users, String> phoneNum;
    public static volatile SingularAttribute<Users, Integer> userId;
    public static volatile SingularAttribute<Users, String> email;

}
package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Users;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2022-04-16T21:23:53")
@StaticMetamodel(Comment.class)
public class Comment_ { 

    public static volatile SingularAttribute<Comment, String> commentAbout;
    public static volatile SingularAttribute<Comment, String> reviews;
    public static volatile SingularAttribute<Comment, Integer> ratings;
    public static volatile SingularAttribute<Comment, Integer> commentId;
    public static volatile SingularAttribute<Comment, Users> userId;

}
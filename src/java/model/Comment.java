/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
@Table(name = "COMMENT")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Comment.findAll", query = "SELECT c FROM Comment c"),
    @NamedQuery(name = "Comment.findByCommentId", query = "SELECT c FROM Comment c WHERE c.commentId = :commentId"),
    @NamedQuery(name = "Comment.findByRatings", query = "SELECT c FROM Comment c WHERE c.ratings = :ratings"),
    @NamedQuery(name = "Comment.findByCommentAbout", query = "SELECT c FROM Comment c WHERE c.commentAbout = :commentAbout"),
    @NamedQuery(name = "Comment.findByReviews", query = "SELECT c FROM Comment c WHERE c.reviews = :reviews"),
    @NamedQuery(name = "Comment.findByUserId", query = "select new model.CommentDisplay(c.commentId, u.userId ,u.name, u.image "
            + ", c.ratings, c.commentAbout , c.reviews) from Comment c join c.userId u"),
    //Rating and review report
    @NamedQuery(name = "Comment.findTotalRating", query = "select new model.RatingReviewChart(SUM(c.ratings), c.commentAbout) from Comment c  "
            + "GROUP BY c.commentAbout"),
    
    @NamedQuery(name = "Comment.findAllAndUsername", query = "SELECT new model.RatingReviewTable(c, u.name) FROM Comment c join c.userId u")
})

//    @NamedQuery(name = "Payment.findByCustomer", query = "select new model.PaymentTest(p.paymentId, c.quantity, o.productTitle, u.name "
//            + " ) from Payment p join p.cartList c, c.products o, c.users u WHERE p.paymentStatus = \"paid\" ")})

// public CommentDisplay(int commentId,int userId,String name,String image,int ratings,String about,String reviews){
//@NamedQuery(name = "Comment.findByUserId", query = "select new model.CommentDisplay(c.commentId, u.userId, p.productId  ,u.name, u.image "
//            + ", c.ratings, c.commentAbout , c.reviews) from Comment c join c.userId u, c.productId p")})

public class Comment implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "COMMENT_ID")
    private Integer commentId;
    @Column(name = "RATINGS")
    private Integer ratings;
    @Size(max = 100)
    @Column(name = "COMMENT_ABOUT")
    private String commentAbout;
    @Size(max = 100)
    @Column(name = "REVIEWS")
    private String reviews;
    @JoinColumn(name = "USER_ID", referencedColumnName = "USER_ID")
    @ManyToOne
    private Users userId;

    public Comment() {
    }

    public Comment(Integer ratings, String commentAbout, String reviews, Users userId) {
        this.ratings = ratings;
        this.commentAbout = commentAbout;
        this.reviews = reviews;
        this.userId = userId;
    }
    
    

    public Comment(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getRatings() {
        return ratings;
    }

    public void setRatings(Integer ratings) {
        this.ratings = ratings;
    }

    public String getCommentAbout() {
        return commentAbout;
    }

    public void setCommentAbout(String commentAbout) {
        this.commentAbout = commentAbout;
    }

    public String getReviews() {
        return reviews;
    }

    public void setReviews(String reviews) {
        this.reviews = reviews;
    }

    public Users getUserId() {
        return userId;
    }

    public void setUserId(Users userId) {
        this.userId = userId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (commentId != null ? commentId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Comment)) {
            return false;
        }
        Comment other = (Comment) object;
        if ((this.commentId == null && other.commentId != null) || (this.commentId != null && !this.commentId.equals(other.commentId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Comment[ commentId=" + commentId + " ]";
    }
    
}

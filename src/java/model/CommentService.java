/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.*;

public class CommentService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public CommentService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addItem(Comment comment) {
        mgr.persist(comment);
        return true;
    }

    public Comment findItemByCode(String code) {
        Comment comment = mgr.find(Comment.class, code);
        return comment;
    }

    public List<RatingReviewChart> findTotalRating() {
        List RatingReviewChartList = mgr.createNamedQuery("Comment.findTotalRating").getResultList();
        return RatingReviewChartList;
    }

    public List<RatingReviewTable> findAllAndUsername() {
        List commentList = mgr.createNamedQuery("Comment.findAllAndUsername").getResultList();
        return commentList;
    }

    public Comment findByCommentId(int id) {
        Comment comment = mgr.find(Comment.class, id);
        return comment;
    }

    public List<Comment> findAll() {
        List commentList = mgr.createNamedQuery("Comment.findAll").getResultList();
        return commentList;
    }

    public List<CommentDisplay> findByUsersId() {
        List commentList = mgr.createNamedQuery("Comment.findByUserId").getResultList();
        return commentList;
    }

//           public List<Comment> findByUserId() {
//        List commentList = mgr.createNamedQuery("Comment.findByUserId").getResultList();
//        return commentList;
//    }
    public Comment Search(int id) {
        Comment comment = mgr.find(Comment.class, id);
        return comment;
    }

    public boolean deleteComment(int code) {
        Comment comment = findByCommentId(code);
        if (comment != null) {
            mgr.remove(comment);
            return true;
        }
        return false;
    }

}

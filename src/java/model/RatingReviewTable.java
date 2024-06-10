/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author user
 */
public class RatingReviewTable {
    private Comment comment;
    private String username;

    public RatingReviewTable(Comment comment, String username) {
        this.comment = comment;
        this.username = username;
    }

    public Comment getComment() {
        return comment;
    }

    public String getUsername() {
        return username;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    
    
}

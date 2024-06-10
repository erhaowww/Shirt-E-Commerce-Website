/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author User
 */
public class CommentDisplay {
    
        int commentId;
        int userId;
        String name;
        String image;
        int ratings;
               String about;
        String reviews;
 
        
        
        public CommentDisplay(int commentId,int userId,String name,String image,int ratings,String about,String reviews){
            this.commentId = commentId;
            this.userId = userId;
               this.name = name;
            this.image = image;
               this.ratings = ratings;
            this.about = about;
            this.reviews=reviews;
        }

    public int getCommentId() {
        return commentId;
    }

    
    
    
    public int getUserId() {
        return userId;
    }

    public String getName() {
        return name;
    }

    public String getImage() {
        return image;
    }

    public int getRatings() {
        return ratings;
    }

    public String getReviews() {
        return reviews;
    }

    public String getAbout() {
        return about;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setRatings(int ratings) {
        this.ratings = ratings;
    }

    public void setReviews(String reviews) {
        this.reviews = reviews;
    }

    public void setAbout(String about) {
        this.about = about;
    }
    
    
    
}

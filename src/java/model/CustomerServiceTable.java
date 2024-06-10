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
public class CustomerServiceTable {
    private String staffName;
    private String replyMessage;
    private String notification_date;
    private String notification_time;
    private String username;
    private String commentAbout;
    private String reviews;

    public CustomerServiceTable(String username, String replyMessage, String staffName, String notification_date,String notification_time) {
        this.username = username;
        this.replyMessage = replyMessage;
        this.staffName = staffName;
        this.notification_date = notification_date;
        this.notification_time = notification_time;
    }

    public CustomerServiceTable(String commentAbout, String reviews) {
        this.commentAbout = commentAbout;
        this.reviews = reviews;
    }

    public String getCommentAbout() {
        return commentAbout;
    }

    public String getReviews() {
        return reviews;
    }

    public void setCommentAbout(String commentAbout) {
        this.commentAbout = commentAbout;
    }

    public void setReviews(String reviews) {
        this.reviews = reviews;
    }
    

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public void setReplyMessage(String replyMessage) {
        this.replyMessage = replyMessage;
    }

    public void setNotification_date(String notification_date) {
        this.notification_date = notification_date;
    }

    public void setNotification_time(String notification_time) {
        this.notification_time = notification_time;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    

    public String getStaffName() {
        return staffName;
    }

    public String getReplyMessage() {
        return replyMessage;
    }

    public String getNotification_date() {
        return notification_date;
    }

    public String getNotification_time() {
        return notification_time;
    }

    public String getUsername() {
        return username;
    }


    
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;
import java.time.LocalDate;

/**
 *
 * @author duong
 */
public class BlogComment {
    private String commentID;
    private String description;
    private Date createdDate;
    public User user;
    public Blog blog;

    public BlogComment() {
    }
    

    public BlogComment(String commentID, String description) {
        this.commentID = commentID;
        this.description = description;
        this.createdDate = dateNow();
    }

    public BlogComment(String commentID, String description, Date createdDate, User user ) {
        this.commentID = commentID;
        this.description = description;
        this.createdDate = createdDate;
        this.user = user;

    }

    public String getCommentID() {
        return commentID;
    }

    public void setCommentID(String commentID) {
        this.commentID = commentID;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }
    
    public Date dateNow() {
        LocalDate currentDate = LocalDate.now();
        return Date.valueOf(currentDate);
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }
    
    

    @Override
    public String toString() {
        return "BlogComment{" + "commentID=" + commentID + ", description=" + description + ", createdDate=" + createdDate + ", user=" + user + '}';
    }

    
}

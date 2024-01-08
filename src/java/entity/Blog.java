/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;
import java.time.LocalDate;
import java.util.Random;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author duong
 */
public class Blog {

    private String blogID;
    private String title;
    private String content;
    private Date createdDate, updateAt;
    private int totalView = 0;
    private String urlImg;

    private List listComment = new ArrayList<>();
    
    public Blog() {
    }

    public Blog(String blogID, String title, String content) {
        this.blogID = blogID;
        this.title = title;
        this.content = content;
        this.createdDate = dateNow();
        this.updateAt = this.createdDate;
    }
    
    public Blog(String blogID, String title){
        this.blogID = blogID;
        this.title = title;
    }

    public Blog(String blogID, String title, String content, Date createdDate, int totalView) {
        this.blogID = blogID;
        this.title = title;
        this.content = content;
        this.createdDate = createdDate;
        this.totalView = totalView;
        this.updateAt = dateNow();
    }

    public Blog(String blogID, String title, String content, Date createdDate, Date updateAt, int totalView) {
        this.blogID = blogID;
        this.title = title;
        this.content = content;
        this.createdDate = createdDate;
        this.updateAt = updateAt;
        this.totalView = totalView;
        this.urlImg = randomUrlImage();
    }

    public String getBlogID() {
        return blogID;
    }

    public void setBlogID(String blogID) {
        this.blogID = blogID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(Date updateAt) {
        this.updateAt = updateAt;
    }

    public int getTotalView() {
        return totalView;
    }

    public void setTotalView(int totalView) {
        this.totalView = totalView;
    }

    public void increaseTotalView() {
        this.totalView++;
    }

    public Date dateNow() {
        LocalDate currentDate = LocalDate.now();
        return Date.valueOf(currentDate);
    }

    public String getUrlImg() {
        return urlImg;
    }

    public String randomUrlImage() {
        Random random = new Random();
        int iRamdom = random.nextInt(9) + 1;
        String url = String.format("./assets/blog/image/blog-%02d.jpg", iRamdom);
        return url;
    }
    public List getListComment() {
        return listComment;
    }

    public void setListComment(List listComment) {
        this.listComment = listComment;
    }
    
    

    @Override
    public String toString() {
        return "Blog{" + "blogID=" + blogID + ", title=" + title + ", content=" + content + ", createdDate=" + createdDate + ", updateAt=" + updateAt + ", totalView=" + totalView + '}';
    }
}

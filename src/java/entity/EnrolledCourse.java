/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class EnrolledCourse {

    private String id;
    private User user;
    private Course course;
    private Date subDate;

    public EnrolledCourse() {
    }

    public EnrolledCourse(String id, User user, Course course, Date subDate) {
        this.id = id;
        this.user = user;
        this.course = course;
        this.subDate = subDate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Date getSubDate() {
        return subDate;
    }

    public void setSubDate(Date subDate) {
        this.subDate = subDate;
    }

    @Override
    public String toString() {
        return "EnrolledCourse{" + "id=" + id + ", user=" + user + ", course=" + course + ", subDate=" + subDate + '}';
    }

   

}

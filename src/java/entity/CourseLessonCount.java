/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class CourseLessonCount {
     private String courseID,teacherName;
    private int price;
    private String duration,descriptionCourse,languageCourse,levelCourse,imageUrl,title;
    private int totalView,lessonCount;

    public CourseLessonCount() {
    }

    public CourseLessonCount(String courseID, String teacherName, int price, String duration, String descriptionCourse, String languageCourse, String levelCourse, String imageUrl, String title, int totalView, int lessonCount) {
        this.courseID = courseID;
        this.teacherName = teacherName;
        this.price = price;
        this.duration = duration;
        this.descriptionCourse = descriptionCourse;
        this.languageCourse = languageCourse;
        this.levelCourse = levelCourse;
        this.imageUrl = imageUrl;
        this.title = title;
        this.totalView = totalView;
        this.lessonCount = lessonCount;
    }

    public String getCourseID() {
        return courseID;
    }

    public void setCourseID(String courseID) {
        this.courseID = courseID;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getDescriptionCourse() {
        return descriptionCourse;
    }

    public void setDescriptionCourse(String descriptionCourse) {
        this.descriptionCourse = descriptionCourse;
    }

    public String getLanguageCourse() {
        return languageCourse;
    }

    public void setLanguageCourse(String languageCourse) {
        this.languageCourse = languageCourse;
    }

    public String getLevelCourse() {
        return levelCourse;
    }

    public void setLevelCourse(String levelCourse) {
        this.levelCourse = levelCourse;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getTotalView() {
        return totalView;
    }

    public void setTotalView(int totalView) {
        this.totalView = totalView;
    }

    public int getLessonCount() {
        return lessonCount;
    }

    public void setLessonCount(int lessonCount) {
        this.lessonCount = lessonCount;
    }

    @Override
    public String toString() {
        return "CourseLessonCount{" + "courseID=" + courseID + ", teacherName=" + teacherName + ", price=" + price + ", duration=" + duration + ", descriptionCourse=" + descriptionCourse + ", languageCourse=" + languageCourse + ", levelCourse=" + levelCourse + ", imageUrl=" + imageUrl + ", title=" + title + ", totalView=" + totalView + ", lessonCount=" + lessonCount + '}';
    }
    
    
}

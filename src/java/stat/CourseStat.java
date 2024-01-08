/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package stat;

import entity.Course;
/**
 *
 * @author duong
 */
public class CourseStat extends Course {
    private int totalView;
    private int totalEnrollment;
    private int totalRevenue;

    
    
    public CourseStat() {
    }
    
    

    public int getTotalView() {
        return totalView;
    }

    public void setTotalView(int totalView) {
        this.totalView = totalView;
    }

    public int getTotalEnrollment() {
        return totalEnrollment;
    }

    public void setTotalEnrollment(int totalEnrollment) {
        this.totalEnrollment = totalEnrollment;
    }

    public int getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(int totalRevenue) {
        this.totalRevenue = totalRevenue;
    }

    @Override
    public String toString() {
        return "CourseStat{" + "totalView=" + totalView + ", totalEnrollment=" + totalEnrollment + ", totalRevenue=" + totalRevenue + '}';
    }
    
    
    
    
}

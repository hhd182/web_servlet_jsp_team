
import dao.CourseDAO;
import entity.Lesson;
import java.util.ArrayList;
import java.util.List;
import stat.CourseStat;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Admin
 */
public class Test {
    public static void main(String[] args) {
        CourseDAO c = new CourseDAO();
        Lesson l = c.getLessonByCourse("185f84ed-4563-51a0-cac7-6c0aeb6ec302");
        System.out.println(l);
    }
}

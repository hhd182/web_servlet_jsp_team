/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Blog;
import entity.Course;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author TGDD
 */
public class SearchDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Course> searchCourse(String query) {
        System.out.println("0");
        List<Course> courseList = new ArrayList<>();
        String sqlQuery = "SELECT course.id,course.title,course.image_url,course.price from course WHERE course.title LIKE ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlQuery);
            ps.setString(1, "%" + query + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                System.out.println("1");
                Course c = new Course(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                courseList.add(c);
            }
            return courseList;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return null;
    }

    public List<Blog> searchBlog(String query) {
        List<Blog> blogList = new ArrayList<>();
        String sqlQuery = "SELECT blog.id,blog.title FROM blog WHERE blog.title LIKE ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlQuery);
            ps.setString(1, "%" + query + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                System.out.println("2");
                Blog b = new Blog(rs.getString(1), rs.getString(2));
                blogList.add(b);
            }
            return blogList;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return null;
    }

    private void closeResources() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

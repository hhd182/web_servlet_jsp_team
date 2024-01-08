/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Blog;
import entity.BlogComment;
import entity.CourseComment;
import entity.Course;
import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CourseCommentDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<CourseComment> getAllCmtById(String id) {
        try {
            String query = "SELECT * FROM web.coursecomment\n"
                    + "where id_course = ?";
            conn = new DBContext().getConnection();

            UserDAO udao = new UserDAO();
            CourseDAO cdao = new CourseDAO();

            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();

            List<CourseComment> list = new ArrayList<>();

            while (rs.next()) {
                CourseComment c = new CourseComment();
                c.setId(rs.getString("id"));
                c.setDescription(rs.getString("description"));
                c.setCreated_date(rs.getDate("created_date"));
                User u = udao.getUserById(rs.getString("id_user"));
                c.setUser(u);
                Course course = cdao.getCourseByID(rs.getString("id_course"));
                c.setCourse(course);
                list.add(c);
            }

            if (list.isEmpty()) {
                System.out.println("khong the ket noi duoc");
            }

            return list;

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            closeResources();
        }
        return null;
    }

    public void addNewComment(CourseComment s) {
        try {

            System.out.println(s.toString());
            System.out.println(s);
            String sqlString = "INSERT INTO web.coursecomment (id, description, created_date, id_user, id_course) VALUES (?,?,?,?,?)";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setString(1, s.getId());
            ps.setString(2, s.getDescription());
            ps.setDate(3, s.getCreated_date());
            ps.setString(4, s.getUser().getUserID());
            ps.setString(5, s.getCourse().getCourseID());

            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);

        } finally {
            closeResources();
        }
    }

    public void deleteCommentByCourse(String courseID) {
        System.out.println(courseID);
        String sqlString = "Delete from coursecomment where (id_course = ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setString(1, courseID);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);

        } finally {
            closeResources();
        }
    }

    public List<CourseComment> getAllCommentByUserID(String id) {
        List<CourseComment> listComment = new ArrayList<>();
        try {
            String query = "SELECT course.id, course.title, course.teacher_name, coursecomment.description, coursecomment.created_date\n"
                    + "FROM course\n"
                    + "JOIN coursecomment ON course.id = coursecomment.id_course\n"
                    + "JOIN user ON user.id = coursecomment.id_user\n"
                    + "WHERE user.id = ?;";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                CourseComment courseComment = new CourseComment();
                Course course = new Course();

                course.setCourseID(rs.getString("id"));
                course.setTitle(rs.getString("title"));
                course.setTeacherName(rs.getString("teacher_name"));

                courseComment.setCourse(course);
                courseComment.setDescription(rs.getString("description"));
                courseComment.setCreated_date(rs.getDate("created_date"));

                listComment.add(courseComment);
            }

            System.out.println("Do dai danh sach cac comment cua user trong cac khoa hoc la: " + listComment.size());
        } catch (Exception e) {
        } finally {
            closeResources();
        }
        return listComment;
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

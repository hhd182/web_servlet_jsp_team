/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Course;
import entity.CourseLessonCount;
import entity.Lesson;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import stat.CourseStat;

/**
 *
 * @author Admin
 */
public class CourseDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public int getLessonCountForCourse(String courseId) {
        int lessonCount = 0;

        try {
            String query = "SELECT COUNT(l.lesson_id) AS lesson_count "
                    + "FROM lessonpart lp "
                    + "JOIN lesson l ON lp.lesson_part_id = l.lesson_part_id "
                    + "WHERE lp.course_id = ?";

            conn = new DBContext().getConnection();

            ps = conn.prepareStatement(query);
            ps.setString(1, courseId);

            rs = ps.executeQuery();

            if (rs.next()) {
                lessonCount = rs.getInt("lesson_count");
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
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
            } catch (SQLException ex) {
                System.out.println(ex);
            }
        }

        return lessonCount;
    }

    public List<Lesson> getLessonByCourseId(String id) {
        List<Lesson> lessons = new ArrayList<>();
        try {
            String query = "SELECT * \n"
                    + "FROM lesson\n"
                    + "WHERE lesson_part_id = (\n"
                    + "SELECT lesson_part_id \n"
                    + "    FROM lessonpart\n"
                    + "    WHERE course_id = ?\n"
                    + " \n"
                    + "    LIMIT 1\n"
                    + ")";
            conn = new DBContext().getConnection();

            ps = conn.prepareStatement(query);
            ps.setString(1, id);

            rs = ps.executeQuery();

            while (rs.next()) {
                UUID lessonID = UUID.fromString(rs.getString("lesson_id"));
                String name = rs.getString("name");
                String videoURL = rs.getString("video_url");
                String description = rs.getString("description");
                UUID lessonPartID = UUID.fromString(rs.getString("lesson_part_id"));

                Lesson a = new Lesson(lessonID, name, videoURL, description, lessonPartID);
                lessons.add(a);
            }
            conn.close();
            return lessons;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Lesson getLessonByCourse(String id) {
        try {
            String query = "SELECT * \n"
                    + "FROM lesson\n"
                    + "WHERE lesson_part_id = (\n"
                    + "    SELECT lesson_part_id \n"
                    + "    FROM lessonpart\n"
                    + "    WHERE course_id = ?\n"
                    + "    ORDER BY created_time ASC\n"
                    + "    LIMIT 1\n"
                    + ")\n"
                    + "ORDER BY lesson_id ASC\n"
                    + "LIMIT 1";
            conn = new DBContext().getConnection();

            ps = conn.prepareStatement(query);
            ps.setString(1, id);

            rs = ps.executeQuery();

            if (rs.next()) {
                UUID lessonID = UUID.fromString(rs.getString("lesson_id"));
                String name = rs.getString("name");
                String videoURL = rs.getString("video_url");
                String description = rs.getString("description");
                UUID lessonPartID = UUID.fromString(rs.getString("lesson_part_id"));

                Lesson a = new Lesson(lessonID, name, videoURL, description, lessonPartID);

                return a;
            }
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<CourseLessonCount> getAllCourse() {
        try {
            String query = "SELECT *, COUNT(l.lesson_id) AS lesson_count \n"
                    + "FROM course \n"
                    + "LEFT JOIN lessonpart lp ON course.id = lp.course_id \n"
                    + "LEFT JOIN lesson l ON lp.lesson_part_id = l.lesson_part_id \n"
                    + "GROUP BY course.id";
            conn = new DBContext().getConnection();

            ps = conn.prepareStatement(query);

            rs = ps.executeQuery();

            List<CourseLessonCount> list = new ArrayList<>();

            while (rs.next()) {
                CourseLessonCount a;
                a = new CourseLessonCount(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getInt("lesson_count"));
                list.add(a);
            }

            if (list.isEmpty()) {
                System.out.println("khong the ket noi duoc");
            }
           closeResources();
            return list;
        } catch (Exception e) {
            System.out.println(e);

        }
        return null;
    }

    public void addNewCourse(Course s) {
        try {
            String sqlString = "INSERT INTO course (id, teacher_name, price, duration, course_description,course_language, course_level, image_url,title) VALUES (?,?, ?,?,?,?,?,?,?)";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setString(1, s.getCourseID());
            ps.setString(2, s.getTeacherName());
            ps.setInt(3, s.getPrice());
            ps.setString(4, s.getDuration());
            ps.setString(5, s.getDescriptionCourse());
            ps.setString(6, s.getLanguageCourse());
            ps.setString(7, s.getLevelCourse());
            ps.setString(8, s.getImageUrl());
            ps.setString(9, s.getTitle());
            ps.executeUpdate();
          
        } catch (Exception e) {
            System.out.println(e);

        }finally{
             closeResources();
        }
    }

    public Course getCourseByID(String id) {
        try {
            String query = "select * from web.course where id=?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                Course a;
                a = new Course(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10));

                return a;
            }
           
        } catch (Exception e) {
            System.out.println(e);

        }finally{
             closeResources();
        }
        return null;
    }

    public void updateCourse(Course s) {
        String sqlString = "UPDATE web.course SET teacher_name = ?, price = ?, duration = ?, course_description = ?, course_language = ?, course_level = ?, image_url = ?, title=? WHERE (id = ?)";
        try {

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setString(1, s.getTeacherName());
            ps.setInt(2, s.getPrice());
            ps.setString(3, s.getDuration());
            ps.setString(4, s.getDescriptionCourse());
            ps.setString(5, s.getLanguageCourse());
            ps.setString(6, s.getLevelCourse());
            ps.setString(7, s.getImageUrl());
            ps.setString(8, s.getTitle());
            ps.setString(9, s.getCourseID());
            ps.executeUpdate();
           
        } catch (Exception e) {
            System.out.println(e);

        }finally{
             closeResources();
        }
    }

    public void updateTotalViewCourse(Course s) {
        String sqlString = "UPDATE web.course SET totalView = ? WHERE (id = ?)";
        try {

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setInt(1, s.getTotalView() + 1);
            ps.setString(2, s.getCourseID());
            ps.executeUpdate();
          
        } catch (Exception e) {
            System.out.println(e);

        }finally{
             closeResources();
        }
    }

    public void deleteCourse(String courseID) {
        System.out.println(courseID);
        String sqlString = "Delete from course where (id = ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setString(1, courseID);
            ps.executeUpdate();
           
        } catch (Exception e) {
            System.out.println(e);

        }finally{
             closeResources();
        }
    }

    public List<CourseStat> getStatOfCourse() {
        List<CourseStat> listCourseStat = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String query = "SELECT\n"
                    + "    c.id AS course_id,\n"
                    + "    c.price AS course_price,\n"
                    + "    c.title,\n"
                    + "    c.teacher_name,\n"
                    + "    c.totalView,\n"
                    + "    COUNT(DISTINCT ec.id_user) AS total_enrollments,\n"
                    + "    IFNULL(SUM(CASE WHEN ec.id_user IS NOT NULL THEN c.price ELSE 0 END), 0) AS total_revenue\n"
                    + "FROM\n"
                    + "    course c\n"
                    + "LEFT JOIN enrolled_course ec ON c.id = ec.id_course\n"
                    + "GROUP BY\n"
                    + "    c.id, c.price, c.title, c.teacher_name, c.totalView;";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            listCourseStat = new ArrayList<>();

            while (rs.next()) {
                CourseStat courseStat = new CourseStat();
                courseStat.setCourseID(rs.getString("course_id"));
                courseStat.setPrice(rs.getInt("course_price"));
                courseStat.setTotalView(rs.getInt("totalView"));
                courseStat.setTotalEnrollment(rs.getInt("total_enrollments"));
                courseStat.setTotalRevenue(rs.getInt("total_revenue"));
                courseStat.setTeacherName(rs.getString("teacher_name"));
                courseStat.setTitle(rs.getString("title"));

                listCourseStat.add(courseStat);
            }
        } catch (Exception e) {
            System.out.println(e);

        } finally {
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
            } catch (SQLException ex) {
                System.out.println(ex);
            }

        }

        System.out.println("Do dai danh sach cac khoa hoc la: " + listCourseStat.size());
        return listCourseStat;
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

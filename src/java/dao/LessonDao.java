/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Lesson;
import entity.LessonPart;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 *
 * @author My Asus
 */
public class LessonDao extends Dao<Lesson> {

    public LessonDao() {
    }

    @Override
    public List<Lesson> getListObject() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public List<Lesson> getListObject(UUID id) {
        List<Lesson> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM lesson WHERE lesson_part_id = ? ORDER BY created_time";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id.toString());
            rs = ps.executeQuery();
            while (rs.next()) {
                UUID lessonID = UUID.fromString(rs.getString("lesson_id"));
                list.add(new Lesson(lessonID, rs.getString("name"), rs.getString("video_url")));
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            System.out.println(e);
        }finally{
             closeResources();
        }
        return list;
    }

    @Override
    public Lesson getObject(UUID id) {
        Lesson lesson = new Lesson();
        try {
            String query = "SELECT * FROM lesson WHERE lesson_id = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id.toString());
            rs = ps.executeQuery();
            while (rs.next()) {
                lesson.setLessonID(UUID.fromString(rs.getString("lesson_id")));
                lesson.setName(rs.getString("name"));
                lesson.setVideoURL(rs.getString("video_url"));
                lesson.setDesctiption(rs.getString("description"));
                lesson.setLessonPartID(UUID.fromString(rs.getString("lesson_part_id")));
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            System.out.println(e);
        }finally{
             closeResources();
        }
        return lesson;
    }

    @Override
    public int createObject(Lesson object) {
        try {
            String query = "INSERT INTO lesson (lesson_id, name, video_url, description, lesson_part_id) VALUES (?, ?, ?, ?, ?)";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            UUID id = UUID.randomUUID();
            ps.setString(1, id.toString());
            ps.setString(2, object.getName());
            ps.setString(3, object.getVideoURL());
            ps.setString(4, object.getDesctiption());
            ps.setString(5, object.getLessonPartID().toString());
            System.out.println(object);
            int rowsInserted = ps.executeUpdate();
            if (conn != null) {
                conn.close();
            }
            return rowsInserted;
        } catch (Exception e) {
            System.out.println(e);
        }finally{
             closeResources();
        }
        return 0;
    }

    @Override
    public int updateObject(Lesson object) {
        try {
            String query = "UPDATE lesson SET name = ?, video_url = ?, description = ? WHERE lesson_id = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, object.getName());
            ps.setString(2, object.getVideoURL());
            ps.setString(3, object.getDesctiption());
            ps.setString(4, object.getLessonID().toString());
            int rowUpdate = ps.executeUpdate();
            if (conn != null) {
                conn.close();
            }
            return rowUpdate;
        } catch (Exception e) {
            System.out.println(e);
        }finally{
             closeResources();
        }
        return 0;
    }

    @Override
    public int deleteObject(UUID id) {
        try {
            String query = "DELETE FROM lesson WHERE lesson_id = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id.toString());
            int rowsDelete = ps.executeUpdate();
            if (conn != null) {
                conn.close();
            }
            return rowsDelete;
        } catch (Exception e) {
            System.out.println(e);
        }finally{
             closeResources();
        }
        return 0;
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

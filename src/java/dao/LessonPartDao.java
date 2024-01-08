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
public class LessonPartDao extends Dao<LessonPart>{

    @Override
    public List<LessonPart> getListObject() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public List<LessonPart> getListObject(UUID id) {
        List<LessonPart> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM lessonpart WHERE course_id = ? ORDER BY created_time";
            conn = new DBContext().getConnection();
            ps=conn.prepareStatement(query);
            ps.setString(1, id.toString());
            rs=ps.executeQuery(); 
            LessonDao lessonDao = new LessonDao();
            while(rs.next()){
              UUID LessonPartID = UUID.fromString(rs.getString("lesson_part_id"));
              String title = rs.getString("title");
              List<Lesson> listLesson = lessonDao.getListObject(LessonPartID);
              list.add(new LessonPart(LessonPartID, title, listLesson));
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
    public LessonPart getObject(UUID id) {
        LessonPart lessonPart = new LessonPart();
        try {
            String query = "SELECT * FROM lessonpart WHERE lesson_part_id = ?";
            conn = new DBContext().getConnection();
            ps=conn.prepareStatement(query);
            ps.setString(1, id.toString());
            rs=ps.executeQuery(); 
            LessonDao lessonDao = new LessonDao();
            while(rs.next()){
              lessonPart.setLessonPartID(id);
              lessonPart.setTitle(rs.getString("title"));
              lessonPart.setListLesson(lessonDao.getListObject(id));
            }      
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            System.out.println(e);
        }finally{
             closeResources();
        }
        return lessonPart;
    }

    @Override
    public int createObject(LessonPart object) {
        try {
            String query = "INSERT INTO lessonpart (lesson_part_id, title, course_id) VALUES (?, ?, ?)";
            conn = new DBContext().getConnection();
            ps=conn.prepareStatement(query);
            UUID id = UUID.randomUUID();
            ps.setString(1, id.toString());
            ps.setString(2, object.getTitle());
            ps.setString(3, object.getCourseID().toString());
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
    public int updateObject(LessonPart object) {
        try {
            String query = "UPDATE lessonpart SET Title = ? WHERE lesson_part_id = ?";
            conn = new DBContext().getConnection();
            ps=conn.prepareStatement(query);
            ps.setString(1, object.getTitle());
            ps.setString(2, object.getLessonPartID().toString());
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
            String query = "DELETE FROM lessonpart WHERE lesson_part_id = ?";
            conn = new DBContext().getConnection();
            ps=conn.prepareStatement(query);
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

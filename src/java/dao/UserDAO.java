/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import security.Encryptor;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import entity.User;
import entity.Course;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

public class UserDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    HashMap<String, String> loginInfo = new HashMap<>();
    Encryptor encryptor = new Encryptor();

    byte[] encryptionKey = {65, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12};

    public User checkUser(User user) {
        User u = new User();
        try {

            String encryptedPassword = encryptor.encrypt(user.getPassword(), encryptionKey);
            String query = "select * from user where username=? and password = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user.getUsername());
            ps.setString(2, encryptedPassword);
            rs = ps.executeQuery();
            if (rs.next()) {
                u.setUserID(rs.getString("id"));
                u.setRole(rs.getString("role"));
            }
            conn.close();
        } catch (Exception e) {
        }finally{
            closeResources();
        }
        return u;
    }

    public void updateUser(User user) {
        String sqlString = "UPDATE user SET name=?,date_of_birth=?,email=?, phone_number=? WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setString(1, user.getName());
            ps.setDate(2, user.getDateOfBirth());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhoneNumber());
            ps.setString(5, user.getUserID());
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
        }finally{
            closeResources();
        }
    }

    public boolean changePassword(User user, String oldPassword, String newPassword) {
        String sqlString = "UPDATE user SET password=? WHERE id = ?";
        try {
            String password = encryptor.decrypt(user.getPassword(), encryptionKey);
            System.out.println("old pass: " + oldPassword);
            System.out.println("pass: " + password);
            System.out.println(password.equals(oldPassword));
            if (password.equals(oldPassword)) {

                String encryptedPassword = encryptor.encrypt(newPassword, encryptionKey);
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(sqlString);
                ps.setString(1, encryptedPassword);
                ps.setString(2, user.getUserID());
                ps.executeUpdate();

                return true;
            }
            conn.close();
        } catch (Exception e) {
        }finally{
            closeResources();
        }
        return false;
    }

    public void updateBalance(User user, Long newBalance) {
        String sqlString = "UPDATE user SET money=? WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setLong(1, newBalance);
            ps.setString(2, user.getUserID());
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
        }finally{
            closeResources();
        }
    }

    public User getUserById(String id) {
        User user = new User();
        try {
            System.out.println(id);
            String query = "select * from user where id= ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                user = new User(id, rs.getString("username"), rs.getString("password"), rs.getDate("date_of_birth"), rs.getString("email"), rs.getString("name"), rs.getLong("money"), rs.getString("phone_number"), rs.getDate("created_date"));
                System.out.println(user.getName());
            }
            conn.close();
        } catch (Exception e) {
        }finally{
            closeResources();
        }
        return user;
    }

    public int addUser(User user) {
        String sqlString = "INSERT INTO `user` (`id`, `username`, `password`, `role`, `email`, `name`, `money`, `phone_number`, `created_date`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
        int numRowChange = 0;
        System.out.println(user.getName());
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            String encryptedPassword = encryptor.encrypt(user.getPassword(), encryptionKey);
            ps.setString(1, user.getUserID().toString());
            ps.setString(2, user.getUsername());
            ps.setString(3, encryptedPassword);
            ps.setString(4, user.getRole());
            ps.setString(5, user.getEmail());

            ps.setString(6, user.getName());
            ps.setLong(7, user.getMoney());
            ps.setString(8, user.getPhoneNumber());
            ps.setDate(9, user.getCreatedDate());
            System.out.println(user.getCreatedDate());
            numRowChange = ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
        }finally{
            closeResources();
        }
        return numRowChange;
    }

    public List<Course> getEnrolledCourses(String id) {
        List<Course> ecList = new ArrayList<>();
        String sqlString = "Select course.id,course.title,course.image_url,course.price from enrolled_course join course on enrolled_course.id_course = course.id where enrolled_course.id_user = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Course c = new Course(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                System.out.println("cname:" + c.getTitle());
                ecList.add(c);
            }
            for (Course c : ecList) {
                System.out.println("name2: " + c.getTitle());
            }
            conn.close();
            return ecList;
        } catch (Exception e) {
        }finally{
            closeResources();
        }
        return null;
    }

    public List<User> findUserByPhone(String phoneNumber) {
        List<User> listUser = new ArrayList<>();
        try {
            System.out.println("Phone number is: " + phoneNumber);
            String query = "select username, created_date  from user where phone_number= ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, phoneNumber);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setCreatedDate(rs.getDate("created_date"));
                System.out.println(rs.getDate("created_date"));
                user.setUsername(rs.getString("username"));
                listUser.add(user);
                System.out.println(user.getUserID() + " " + user.getUsername());
            }
            conn.close();
        } catch (Exception e) {
        }finally{
            closeResources();
        }
        System.out.println("Do dai danh sach la: " + listUser.size());
        return listUser;
    }

    public String findPassword(String id) {
        String password = "";
        String encryptedPassword = "";
        try {
            String query = "select password from user where id= ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                encryptedPassword = rs.getString("password");
            }
            password = encryptor.decrypt(encryptedPassword, encryptionKey);
            System.out.println("pass " + password);
            conn.close();
        } catch (Exception e) {
        }finally{
            closeResources();
        }
        return password;
    }

    public int resetPassword(String username, String newPass) {
        int kq = 0;
        try {
            System.out.println(username);
            String encryptedPass = encryptor.encrypt(newPass, encryptionKey);
            String query = "UPDATE `user` SET `password` = ? WHERE (`username` = ?);";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, encryptedPass);
            ps.setString(2, username);
            kq = ps.executeUpdate();
            System.out.println(kq);
            conn.close();
        } catch (Exception e) {
        }finally{
            closeResources();
        }
        return kq;
    }

    public List<User> getAllUser() {
        List<User> listUser = new ArrayList<>();
        try {
            String query = "SELECT * FROM web.user where role != 'ADMIN';";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getString("id"), rs.getString("username"), rs.getString("password"), rs.getDate("date_of_birth"), rs.getString("email"), rs.getString("name"), rs.getLong("money"), rs.getString("phone_number"), rs.getDate("created_date"));
                listUser.add(user);
            }
            System.out.println("list size: " + listUser.size());
            conn.close();
        } catch (Exception e) {
        }finally{
            closeResources();
        }

        return listUser;
    }

    public void changeMoney(User u, Course s) {
        String sqlString = "UPDATE user SET money=? WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setLong(1, u.getMoney() - s.getPrice());
            ps.setString(2, u.getUserID());
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
        }finally{
            closeResources();
        }
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

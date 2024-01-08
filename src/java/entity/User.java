/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;
import java.time.LocalDate;

/**
 *
 * @author TGDD
 */
public class User {

    private String userID;
    private String username;
    private String password;
    private Date dateOfBirth;
    private String email;
    private String role = "GUEST";
    private String name;
    private long money =0;
    private String phoneNumber;
    private Date createdDate;

    public User() {
    }

    public User(String userID, String username, String password, Date dateOfBirth, String email, String name, long money, String phoneNumber, Date createdDate) {
        this.userID = userID;
        this.username = username;
        this.password = password;
        this.dateOfBirth = dateOfBirth;
        this.email = email;
        this.name = name;
        this.money = money;
        this.phoneNumber = phoneNumber;
        this.createdDate = createdDate;
    }

    public User(String userID, String name, Date dateOfBirth, String email, String phoneNumber, long money) {
        this.userID = userID;
        this.dateOfBirth = dateOfBirth;
        this.email = email;
        this.name = name;
        this.money = money = 0;
        this.phoneNumber = phoneNumber;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getMoney() {
        return money;
    }

    public void setMoney(long money) {
        this.money = money;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }
    
    

    @Override
    public String toString() {
        return "User{" + "userID=" + userID + ", username=" + username + ", password=" + password + ", dateOfBirth=" + dateOfBirth + ", email=" + email + ", role=" + role + ", name=" + name + ", money=" + money + ", phoneNumber=" + phoneNumber + '}';
    }
    
    

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.UUID;

/**
 *
 * @author My Asus
 * @param <T>
 */
public abstract class Dao<T> {
    protected Connection conn = null;
    protected PreparedStatement ps = null;
    protected ResultSet rs = null; 
    
    public abstract List<T> getListObject();
    public abstract T getObject(UUID id);
    public abstract int createObject(T object);
    public abstract int updateObject(T object);
    public abstract int deleteObject(UUID id);
}

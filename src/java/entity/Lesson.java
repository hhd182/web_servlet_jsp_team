/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.UUID;

/**
 *
 * @author My Asus
 */
public class Lesson {

    private UUID LessonID;
    private String Name, VideoURL;
    private String Desctiption;
    private UUID LessonPartID;

    public Lesson() {
    }
    
    public Lesson(UUID LessonID, String Name) {
        this.LessonID = LessonID;
        this.Name = Name;
    }

    public Lesson(UUID LessonID, String Name, String VideoURL, String Desctiption, UUID LessonPartID) {
        this.LessonID = LessonID;
        this.Name = Name;
        this.VideoURL = VideoURL;
        this.Desctiption = Desctiption;
        this.LessonPartID = LessonPartID;
    }
    
    
    
    public Lesson(String Name, String VideoURL, String Desctiption, UUID LessonPartID) {
        this.Name = Name;
        this.VideoURL = VideoURL;
        this.Desctiption = Desctiption;
        this.LessonPartID = LessonPartID;
    }
    
    public Lesson(UUID LessonID, String Name, String VideoURL) {
        this.LessonID = LessonID;
        this.Name = Name;
        this.VideoURL = VideoURL;
    }
    
    public Lesson(UUID LessonID, String Name, String VideoURL, String Desctiption) {
        this.LessonID = LessonID;
        this.Name = Name;
        this.VideoURL = VideoURL;
        this.Desctiption = Desctiption;
    }

    public UUID getLessonID() {
        return LessonID;
    }

    public void setLessonID(UUID LessonID) {
        this.LessonID = LessonID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getVideoURL() {
        return VideoURL;
    }

    public void setVideoURL(String VideoURL) {
        this.VideoURL = VideoURL;
    }

    public String getDesctiption() {
        return Desctiption;
    }

    public void setDesctiption(String Desctiption) {
        this.Desctiption = Desctiption;
    }

    public UUID getLessonPartID() {
        return LessonPartID;
    }

    public void setLessonPartID(UUID LessonPartID) {
        this.LessonPartID = LessonPartID;
    }

    @Override
    public String toString() {
        return "Lesson{" + "LessonID=" + LessonID + ", Name=" + Name + ", VideoURL=" + VideoURL + ", Desctiption=" + Desctiption + ", LessonPartID=" + LessonPartID + '}';
    }

}

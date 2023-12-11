package com.rio.student_database.entity;

import org.json.JSONObject;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Marksheet {
    @Id
    private String enroll;

    @Column(columnDefinition = "JSON") 
    private String grades;
    @Column private String totalGrade;
    @Column private boolean isPass;

    public Marksheet(){}
    public Marksheet(String enroll){
        this.enroll = enroll;
        generateGrades();
    }

    private void generateGrades(){
        JSONObject grades = new JSONObject();
        int total = 0, mark;
        for(int i=0;i<5;++i){
            mark = (int) (Math.random()*100);
            total += mark;
            grades.put("subject " + (i+1), getGrade(mark));
        }
        if(grades.toMap().containsValue("FF"))
            setPass(false);
        else
            setPass(true);
        setGrades(grades.toString());
        setTotalGrade(getGrade(total/5));
    }

    private String getGrade(int mark){
        if(mark >= 85)
            return "AA";
        else if(mark >= 75)
            return "AB";
        else if(mark >= 65)
            return "BB";
        else if(mark >= 55)
            return "BC";
        else if(mark >= 45)
            return "CC";
        else if(mark >= 40)
            return "CD";
        else if(mark >= 35)
            return "DD";
        else
            return "FF";

    }
    
    public String getEnroll() {
        return enroll;
    }
    public void setEnroll(String enroll) {
        this.enroll = enroll;
    }
    public String getGrades() {
        return grades;
    }
    public void setGrades(String grades) {
        this.grades = grades;
    }
    public String getTotalGrade() {
        return totalGrade;
    }
    public void setTotalGrade(String totalGrade) {
        this.totalGrade = totalGrade;
    }
    public boolean getPass() {
        return isPass;
    }
    public void setPass(boolean isPass) {
        this.isPass = isPass;
    }

}

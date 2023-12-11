package com.rio.student_database.entity;


import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class StudentDetails {
    
    @Id
    private String enroll;

    private String name;
    public String department;
    private String email;
    public String getEnroll() {
        return enroll;
    }
    public void setEnroll(String enroll) {
        this.enroll = enroll;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getDepartment() {
        return department;
    }
    public void setDepartment(String department) {
        this.department = department;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    
    @Override
    public String toString() {
        return "StudentDetails [enroll=" + enroll + ", name=" + name + ", department=" + department + ", email=" + email
                + "]";
    }
    
}

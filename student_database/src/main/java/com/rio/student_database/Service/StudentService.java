package com.rio.student_database.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rio.student_database.entity.Marksheet;
import com.rio.student_database.entity.StudentDetails;
import com.rio.student_database.repository.MarksheetRepository;
import com.rio.student_database.repository.StudentRepository;

@Service
public class StudentService {

    @Autowired
    private StudentRepository studentRepo;

    @Autowired
    private MarksheetRepository marksheetRepo;

    Marksheet marksheet;

    public void refresh(){
        studentRepo.flush();
    }

    public void saveOrAddStudent(StudentDetails student){
        if(!doesExist(student.getEnroll())){
            studentRepo.save(student);
            marksheet = new Marksheet(student.getEnroll());
            marksheetRepo.save(marksheet);
        }
    }

    public boolean doesExist(String enroll){
        return studentRepo.existsById(enroll);
    }

    public void updateStudent(StudentDetails student){
        studentRepo.save(student);
    }

    public String getName(String enroll){
        return studentRepo.getStudentName(enroll);
    }

    public List<StudentDetails> getStudentDetails(){
        return studentRepo.findAll();
    }

    public StudentDetails getById(String enroll){
        return studentRepo.getReferenceById(enroll);
    }

    public void deleteById(String enroll){
        studentRepo.deleteById(enroll);
        marksheetRepo.deleteById(enroll);
    }

    public Marksheet getStudentMarksheet(String enroll){
        return marksheetRepo.getReferenceById(enroll);
    }
}

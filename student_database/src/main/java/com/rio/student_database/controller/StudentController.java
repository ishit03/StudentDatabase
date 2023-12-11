package com.rio.student_database.controller;


import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rio.student_database.Service.StudentService;
import com.rio.student_database.entity.Marksheet;
import com.rio.student_database.entity.StudentDetails;

@Controller
public class StudentController {
    
    @Autowired
    StudentService studentService;

    @RequestMapping("/home")
    public String Home(Model model){
        studentService.refresh();
        model.addAttribute("students", studentService.getStudentDetails());
        return "home";
    }

    @PostMapping("/addStudent")
    public String insertData(StudentDetails student, @RequestParam(value = "isCancel", required = false) boolean isCancel){
        if(student.getEnroll() != null && !isCancel)
        {
            if(!studentService.doesExist(student.getEnroll()))
                studentService.saveOrAddStudent(student);
            else
                studentService.updateStudent(student);
        }
        return "redirect:/home";
    }
    @GetMapping("/addStudent")
    public String addStudent(){
        return "addStudent";
    }

    @GetMapping("/editStudent/{enroll}")
    public String editStudent(@PathVariable String enroll, Model model){
        model.addAttribute("details", studentService.getById(enroll));
        return "addStudent";
    }

    @GetMapping("/deleteStudent/{enroll}")
    public String deleteStudent(@PathVariable String enroll){
        studentService.deleteById(enroll);
        return "redirect:/home";
    }

    @GetMapping("/marksheet/{enroll}")
    public String getMarksheet(@PathVariable String enroll, Model model) {

        Marksheet marksheet = studentService.getStudentMarksheet(enroll);
        JSONObject marks = new JSONObject(marksheet.getGrades());
        String name = studentService.getName(enroll);
        model.addAttribute("name", name);
        model.addAttribute("marksheet", marksheet);
        model.addAttribute("grades", marks);
        return "marksheet";
    }
    
}

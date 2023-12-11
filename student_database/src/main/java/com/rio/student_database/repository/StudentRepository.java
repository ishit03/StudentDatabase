package com.rio.student_database.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.rio.student_database.entity.StudentDetails;

@Repository
public interface StudentRepository extends JpaRepository<StudentDetails, String>{

    @Query(value = "Select name from student_details where enroll = (:enroll)", nativeQuery = true)
    String getStudentName(@Param("enroll") String enroll);
}

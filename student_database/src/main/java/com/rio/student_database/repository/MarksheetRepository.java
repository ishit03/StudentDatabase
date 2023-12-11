package com.rio.student_database.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.rio.student_database.entity.Marksheet;

@Repository
public interface MarksheetRepository extends JpaRepository<Marksheet,String>{

    
}

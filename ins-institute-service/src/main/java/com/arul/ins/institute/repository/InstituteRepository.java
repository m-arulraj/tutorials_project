package com.arul.ins.institute.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.arul.ins.institute.domain.Institute;

@Repository
public interface InstituteRepository extends JpaRepository<Institute, Long> {

}

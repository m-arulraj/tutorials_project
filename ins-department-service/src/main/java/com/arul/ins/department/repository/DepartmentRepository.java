package com.arul.ins.department.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.arul.ins.department.domain.Department;

@Repository
public interface DepartmentRepository extends JpaRepository<Department, Long> {

	@Query("SELECT dept FROM Department dept WHERE dept.instituteId = ?1")
	List<Department> findAllDepartmentByInstituteId(Integer id);

}

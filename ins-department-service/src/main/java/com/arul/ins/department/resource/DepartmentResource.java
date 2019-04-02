package com.arul.ins.department.resource;

import java.rmi.ServerException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.arul.ins.department.domain.Department;
import com.arul.ins.department.repository.DepartmentRepository;

@RestController
public class DepartmentResource {
	private static final Logger log = LoggerFactory.getLogger(DepartmentResource.class);

	@Autowired
	DepartmentRepository deptRepo;

	@RequestMapping(value = "/departments", method = RequestMethod.GET)
	public List<Department> list(@RequestParam(name="instituteId") int instituteId) throws ServerException {
		log.debug("list");
		return deptRepo.findAllDepartmentByInstituteId(instituteId);
	}

}

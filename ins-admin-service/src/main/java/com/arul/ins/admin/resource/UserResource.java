package com.arul.ins.admin.resource;

import java.rmi.ServerException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.arul.ins.admin.domain.Role;
import com.arul.ins.admin.domain.User;
import com.arul.ins.admin.repository.UserRepository;

@RestController
public class UserResource {
	private static final Logger log = LoggerFactory.getLogger(UserResource.class);

	@Autowired
	UserRepository userRepo;

	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public List<User> list(@RequestParam(name = "instituteId") int instituteId) throws ServerException {
		log.debug("list");
		return userRepo.findAll();
	}

	@RequestMapping(value = "/users/{userName}", method = RequestMethod.GET)
	public User list(@PathVariable String userName) throws ServerException {
		log.debug("list");
		return userRepo.findByUserName(userName);
	}

	@RequestMapping(value = "/users/{userName}/roles", method = RequestMethod.GET)
	public List<Role> listRoles(@PathVariable String userName) throws ServerException {
		log.debug("list");
		return userRepo.findRolesByUser(userName);
	}

}

package com.arul.ins.admin.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.arul.ins.admin.domain.Role;
import com.arul.ins.admin.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

	@Query("SELECT role FROM Role role WHERE role.userName = ?1")
	List<Role> findRolesByUser(String userName);

	@Query("SELECT user FROM User user WHERE user.userName = ?1")
	User findByUserName(String userName);

}

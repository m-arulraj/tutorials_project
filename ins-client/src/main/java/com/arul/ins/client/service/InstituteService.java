package com.arul.ins.client.service;

import java.util.List;

import com.arul.ins.client.domain.Institute;

public interface InstituteService {

	public List<Institute> getAllInstitute();

	public Institute getInstituteById(int id);

	public Institute getInstituteByUserName(String userName);
}

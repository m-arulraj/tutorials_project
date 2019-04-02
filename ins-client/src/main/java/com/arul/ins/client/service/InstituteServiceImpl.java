package com.arul.ins.client.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;
import org.springframework.web.client.RestTemplate;

import com.arul.ins.client.domain.Institute;
import com.arul.ins.client.util.EndpointConstant;

@Repository
public class InstituteServiceImpl implements InstituteService {

	@Autowired
	RestTemplate template;

	@Override
	public List<Institute> getAllInstitute() {
		ResponseEntity<List<Institute>> response = template.exchange(EndpointConstant.INSTITUTE_SERVICE_URI,
				HttpMethod.GET, null, new ParameterizedTypeReference<List<Institute>>() {
				});
		return response.getBody();
	}

	@Override
	public Institute getInstituteById(int id) {
		return null;
	}

	private List<Institute> getDefaultInstiuteList() {

		return null;

	}

	private Institute getDefaultInstiute() {
		return null;
	}

	@Override
	public Institute getInstituteByUserName(String userName) {
		return null;
	}

}

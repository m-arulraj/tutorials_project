package com.arul.ins.client.controller;

import java.rmi.ServerException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.arul.ins.client.domain.Institute;
import com.arul.ins.client.service.InstituteService;

@Controller
public class InstituteController {

	private final Logger log = LoggerFactory.getLogger(InstituteController.class);

	@Autowired
	InstituteService insService;

	@Autowired
	HttpSession session;

	@RequestMapping(value = "/institutes", method = RequestMethod.GET)
	public ModelAndView list() throws ServerException {
		ModelAndView model = new ModelAndView("institute");
		log.debug("list");
		List<Institute> ins = insService.getAllInstitute();
		model.addObject("instLst", ins);

		model.addObject("institueForm", new Institute());
		return model;
	}

	/*
	 * @RequestMapping(value = "/institutes", params = "departmentList", method =
	 * RequestMethod.POST) public String getDpartmentList(@RequestParam String
	 * id,HttpRequest req) throws ServerException {
	 * session.setAttribute("instituteId",id);
	 * 
	 * return "redirect:/departments"; }
	 */
}

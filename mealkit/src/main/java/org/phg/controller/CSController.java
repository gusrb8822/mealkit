package org.phg.controller;

import org.phg.model.PageDTO;
import org.phg.service.CSService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CSController {
	@Autowired
	CSService cservice;
	
	@RequestMapping(value = "/cs", method = RequestMethod.GET)
	public String csMain(PageDTO pdto, Model model) {
		cservice.getQnA(pdto, model);
		return "/customerService/csMain";
	}
}

package org.phg.controller;

import org.phg.service.DiscountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	@Autowired
	DiscountService dservice;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		dservice.getDiscount(model);
		return "index";
	}
}

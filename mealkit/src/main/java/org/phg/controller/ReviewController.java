package org.phg.controller;

import javax.servlet.http.HttpSession;
import org.phg.model.ReviewDTO;
import org.phg.model.PageDTO;
import org.phg.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReviewController {
	@Autowired
	ReviewService rservice;
	
	// review 목록 페이지 띄우기(화면)
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String reviewPage(PageDTO rpdto, Model model) {
		// amount와 pageNum를 입력받아 review 페이지를 띄움
		rservice.getReview(rpdto, model);
		return "review/review";
	}
	
	// review 작성 페이지 띄우기(화면)
	@RequestMapping(value = "/review/write", method = RequestMethod.GET)
	public String reviewWritePage(HttpSession session, Model model) {
		// 세션에 있는 id값에 맞는 주문목록을 가져옴
		rservice.getOrderData(session, model);
		return "review/reviewWrite";
	}
	
	// review 작성 insert과정 끝나고 목록페이지로 리다이렉트
	@RequestMapping(value = "/review/write", method = RequestMethod.POST)
	public String reviewWriteAction(ReviewDTO rdto) {
		rservice.writeReview(rdto);
		return "redirect:/review";
	}
		
	
}

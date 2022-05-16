package org.phg.controller;

import org.phg.model.PageDTO;
import org.phg.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EventController {
	@Autowired
	EventService eservice;
	
	// 이벤트 목록 페이지
	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public String eventList(PageDTO pdto, Model model) {
		eservice.getList(pdto, model);
		return "/event/eventList";
	}
	
	// 이벤트 상세 페이지
	@RequestMapping(value = "/event/detail", method = RequestMethod.GET)
	public String eventDetail(int event_no, Model model) {
		eservice.getDetail(event_no, model);
		return "/event/eventDetail";
	}
}

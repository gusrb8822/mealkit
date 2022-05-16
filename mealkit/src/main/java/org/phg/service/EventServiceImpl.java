package org.phg.service;

import java.util.ArrayList;
import org.phg.dao.EventDAO;
import org.phg.model.EventDTO;
import org.phg.model.PageDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class EventServiceImpl implements EventService{
	@Autowired
	EventDAO edao;
	// eventList 화면 띄우기
	public void getList(PageDTO pdto, Model model) {
		// amount와 pageNum를 이용해서 이벤트 리스트를 가져옴
		ArrayList<EventDTO> eventList = edao.getEvent(pdto);
		// pageDTO에 이벤트 리스트를 세팅
		pdto.setEvents(eventList);
		// 이벤트 리스트 항목의 전체 게시글 수를 가져옴
		int total = edao.getCount();
		// 전체 페이지 수 세팅
		pdto.settotalCount(total);
		// 나머지 항목 세팅
		pdto.setPageMaker();
		
		// model에 eventPage라는 이름으로 pageDTO를 담음
		model.addAttribute("eventPage", pdto);
	}
		
	// eventDetail 화면 띄우기
	public void getDetail(int event_no, Model model) {
		model.addAttribute("eventDetail", edao.getEventDetail(event_no));
	}
}

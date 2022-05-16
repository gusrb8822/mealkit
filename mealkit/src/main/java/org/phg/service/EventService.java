package org.phg.service;

import org.phg.model.PageDTO;
import org.springframework.ui.Model;

public interface EventService {
	// eventList 화면 띄우기
	public void getList(PageDTO pdto, Model model);
	
	// eventDetail 화면 띄우기
	public void getDetail(int event_no, Model model);
}

package org.phg.dao;

import java.util.ArrayList;

import org.phg.model.EventDTO;
import org.phg.model.PageDTO;

public interface EventDAO {
	// pageNum랑 amout 가지고 이벤트 목록 검색
	public ArrayList<EventDTO> getEvent(PageDTO pdto);
	
	// 이벤트 테이블의 전체 게시글 수를 가져옴
	public int getCount();
	
	// event_no로 이벤트 1개를 가져옴
	public EventDTO getEventDetail(int event_no);
}

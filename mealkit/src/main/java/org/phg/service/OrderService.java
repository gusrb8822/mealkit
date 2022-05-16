package org.phg.service;

import java.util.ArrayList;
import org.phg.model.BaseMenuDTO;
import org.phg.model.CartMainDTO;
import org.springframework.ui.Model;

public interface OrderService {
	// 밀키트 만들기(주문 페이지) 열 때 추가재료 파트 목록 불러오기
	public void orderGet(Model model);
	
	// ajax를 이용해 베이스메뉴 항목 갱신
	public ArrayList<BaseMenuDTO> GetBaseMenu(String base_group);
	
	// 주문한 내용을 장바구니 DB에 각각 집어넣기
	public void SaveOrder(CartMainDTO cmdto);
}

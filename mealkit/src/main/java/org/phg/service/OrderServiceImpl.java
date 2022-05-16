package org.phg.service;

import java.util.ArrayList;

import org.phg.dao.OrderDAO;
import org.phg.model.BaseMenuDTO;
import org.phg.model.CartMainDTO;
import org.phg.model.CartSubDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	OrderDAO odao;
	
	// 밀키트 만들기(주문 페이지) 열 때 추가재료 파트 목록 불러오기
	public void orderGet(Model model) {
		//추가재료 고기/해산물 불러오기
		 model.addAttribute("element1", odao.getAddElement1());
		//추가재료 채소 불러오기
		 model.addAttribute("element2", odao.getAddElement2());
		//추가재료 면/빵 불러오기
		 model.addAttribute("element3", odao.getAddElement3());
		//추가재료 소스/향신료 불러오기
		 model.addAttribute("element4", odao.getAddElement4());
	}
	
	// ajax를 이용해 베이스메뉴 항목 갱신
	public ArrayList<BaseMenuDTO> GetBaseMenu(String base_group){
		return odao.GetBaseMenu(base_group);
	}
	
	// 주문한 내용을 장바구니 DB에 각각 집어넣기
	public void SaveOrder(CartMainDTO cmdto) {
		if(cmdto.getCsdto() != null) {
			// CartMainDB에 데이터 집어넣기
			odao.SaveCartMain(cmdto);
			// CartMainDB에 안에 있는 ArrayList<CartSubDTO>
			ArrayList<CartSubDTO> acsdto = cmdto.getCsdto();
			
			// CartSubDB에 데이터 집어넣기
			for(int i = 0; i < acsdto.size(); i++) {
				CartSubDTO csdto = acsdto.get(i);
				csdto.setCart_no(cmdto.getCart_no());
				odao.SaveCartSub(csdto);
			}
		}else {
			// CartMainDB에 데이터 집어넣기
			odao.SaveCartMain(cmdto);
		}

	}
	
}

package org.phg.service;

import javax.servlet.http.HttpSession;

import org.phg.model.CartMainDTO;
import org.phg.model.PageDTO;
import org.springframework.ui.Model;

public interface DiscountService {

	// 할인 항목 불러와서 model에 넣기
	public void getDiscount(PageDTO pdto, Model model);
	
	// 메인페이지에 넣을 할인 항목 불러와서 model에 넣기
	public void getDiscount(Model model);
	
	// 오늘의 특가에서 상품 구매하기 또는 장바구니담기 버튼을 클릭했을때 그 상품을 주문
	public void buyDiscount(CartMainDTO cmdto, HttpSession session);
}

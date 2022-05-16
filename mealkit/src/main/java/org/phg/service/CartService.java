package org.phg.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.phg.model.OrderProductDTO;
import org.springframework.ui.Model;

public interface CartService {
	// 페이지 열기 전 세션아이디에 맞는 장바구니 정보 가져오기
	public void getOrder(Model model, HttpSession session);
	
	// 장바구니 삭제
	public void deleteCart(int cart_no);
	
	// 주문하기 항목 누르면 그 장바구니 주문
	public void orderProduct(OrderProductDTO odto, HttpSession session, int cart_no);
	
	
	// 총 n건 주문하기 버튼 누르면 전체 장바구니 주문
	public void totalOrder(ArrayList<OrderProductDTO> aodto, HttpSession session);
}

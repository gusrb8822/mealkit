package org.phg.dao;

import java.util.ArrayList;
import org.phg.model.CartMainDTO;
import org.phg.model.CartSubDTO;
import org.phg.model.OrderProductDTO;

public interface CartDAO {
	// CartMain db에서 아이디 값에 맞는 데이터 가져오기
	public ArrayList<CartMainDTO> getOrderMain(String member_id);
	
	// CartSub db에서 cart_no에 맞는 데이터 가져오기
	public ArrayList<CartSubDTO> getOrderSub(int cart_no);
	
	// 주문하기 항목 누르면 그 장바구니 주문(selectKey로 order_no는 가져오기)
	public void orderProduct(OrderProductDTO odto);
	// 장바구니 주문(order_no는 DTO에서 받아서 사용)
	public void orderProduct2(OrderProductDTO odto);
	
	// 장바구니 메인테이블 데이터 삭제
	public void deleteCartMain(int cart_no);
	// 장바구니 서브테이블 데이터 삭제
	public void deleteCartSub(int cart_no);
	
	// member_id값에 맞는 cart_no를 장바구니 테이블에서 찾아서 배열의 형태로 리턴
	public ArrayList<Integer> getCartNo(String member_id);
}

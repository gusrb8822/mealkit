package org.phg.dao;

import java.util.ArrayList;
import org.phg.model.CartMainDTO;
import org.phg.model.CartSubDTO;
import org.phg.model.PageDTO;

public interface DiscountDAO {
	// 할인항목메인 테이블에서 전체 항목 가져오기 
	public ArrayList<CartMainDTO> getTotalMain(PageDTO pdto);
	
	// 할인항목서브 테이블에서 cart_no에 맞는 항목 가져오기
	public ArrayList<CartSubDTO> getSub(int cart_no);
	
	// 할인항목 메인 테이블의 전체 항목 갯수 구하기
	public int getMainCount();
	
	
	// cart_main_table에서 추가할 cart_no 찾아오기
	public int getCartNo();
	
	// cart_main_table에 주문한 할인 목록 집어넣기
	public void buyDiscountMain(CartMainDTO cmdto);
	
	// cart_sub_table에 주문한 할인 목록 집어넣기
	public void buyDiscountSub(CartSubDTO cdto);
}

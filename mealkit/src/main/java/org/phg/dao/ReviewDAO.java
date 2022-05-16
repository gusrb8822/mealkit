package org.phg.dao;

import java.util.ArrayList;

import org.phg.model.OrderProductDTO;
import org.phg.model.ReviewDTO;
import org.phg.model.PageDTO;

public interface ReviewDAO {
	// 리뷰게시판 게시글 정보 가져오기
	public ArrayList<ReviewDTO> getReview(PageDTO rpdto);
	
	// 주문상품 정보 상품 번호로 가져오기
	public ArrayList<OrderProductDTO> getOrder(int order_no); 
	
	// 전체 리뷰의 개수를 가져옴
	public int getCount();
	
	// id값과 일치하는 주문정보를 가져옴
	public ArrayList<OrderProductDTO> getOrderData(String member_id);
	
	// form의 정보를 받아 리뷰 작성
	public void writeReview(ReviewDTO rdto);
}

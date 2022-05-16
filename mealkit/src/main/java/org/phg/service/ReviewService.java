package org.phg.service;

import javax.servlet.http.HttpSession;

import org.phg.model.ReviewDTO;
import org.phg.model.PageDTO;
import org.springframework.ui.Model;

public interface ReviewService {
	// 리뷰게시판 게시글 정보 가져오기
	public void getReview(PageDTO rpdto, Model model);
	
	// 세션의 id값과 일치하는 id의 주문정보를 가져오기
	public void getOrderData(HttpSession session, Model model);
	
	// form의 정보를 받아 리뷰 작성
	public void writeReview(ReviewDTO rdto);
}

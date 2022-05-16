package org.phg.service;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;

import org.phg.dao.AttachDAO;
import org.phg.dao.ReviewDAO;
import org.phg.model.AttachFileDTO;
import org.phg.model.MemberDTO;
import org.phg.model.OrderProductDTO;
import org.phg.model.ReviewDTO;
import org.phg.model.PageDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	ReviewDAO rdao;
	@Autowired
	AttachDAO adao;
	// 리뷰게시판 게시글 정보 가져오기
	public void getReview(PageDTO rpdto, Model model) {
		// review_table에서 리뷰게시물 정보 가져오기
		ArrayList<ReviewDTO> reviewList = rdao.getReview(rpdto);
		
		// review_table에서 가져온 정보 중 order_no를 이용해 주문한 상품정보 가져오기
		for(int i = 0; i < reviewList.size(); i++) {
			ArrayList<OrderProductDTO> opdto = rdao.getOrder(reviewList.get(i).getOrder_no());
			ArrayList<AttachFileDTO> afdto = adao.getAttach(reviewList.get(i).getReview_no());
			// 가져온 주문상품정보를 집어넣기
			reviewList.get(i).setOpdto(opdto);
			// 가져온 첨부파일 정보를 집어넣기
			reviewList.get(i).setAttach(afdto);
		}
		// totalCount를 가져옴
		rpdto.settotalCount(rdao.getCount());
		// 나머지 변수를 계산
		rpdto.setPageMaker();
		// 가져온 리뷰 정보를 담음
		rpdto.setReviews(reviewList);
		// model을 통해 보냄
		model.addAttribute("reviewPage", rpdto);
	}
	
	// 세션의 id값과 일치하는 id의 주문정보를 가져오기
	public void getOrderData(HttpSession session, Model model) {
		if(session.getAttribute("Member")!=null) { // session에 저장된 로그인 정보가 있으면 검색 없으면 기능없음
			MemberDTO mdto = (MemberDTO)session.getAttribute("Member");
			model.addAttribute("OrderData", rdao.getOrderData(mdto.getId()));
		}
	}
	
	// form의 정보를 받아 리뷰 작성
	public void writeReview(ReviewDTO rdto) {
		rdao.writeReview(rdto);
		// 첨부파일이 존재하면
		if(rdto.getAttach() != null) {
			rdto.getAttach().forEach(attach->{
				// selectkey로 받아온 review_no를 설정해줌
				attach.setReview_no(rdto.getReview_no());
				adao.AttachWrite(attach);
			});
		}
	}
	
}

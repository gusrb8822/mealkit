package org.phg.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.phg.dao.DiscountDAO;
import org.phg.model.CartMainDTO;
import org.phg.model.CartSubDTO;
import org.phg.model.MemberDTO;
import org.phg.model.PageDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class DiscountServiceImpl implements DiscountService{
	@Autowired
	DiscountDAO ddao;
	
	// 할인 항목 불러와서 model에 넣기
	public void getDiscount(PageDTO pdto, Model model) {
		// 할인항목 메인 테이블 전체 항목 가져오기
		ArrayList<CartMainDTO> main = ddao.getTotalMain(pdto);
		
		// 각 항목의 메인항목에 서브배열을 집어넣음
		for(int i = 0; i < main.size(); i++) {
			int no = main.get(i).getCart_no();
			ArrayList<CartSubDTO> sub = ddao.getSub(no);
			main.get(i).setCsdto(sub);
		}
		// pageDTO에 할인 항목을 집어넣음
		pdto.setDiscounts(main);
		// 전체 갯수를 집어넣음
		pdto.settotalCount(ddao.getMainCount());
		pdto.setPageMaker();
		
		// model에 pageDTO를 집어넣음
		model.addAttribute("discountPage", pdto);
	}
	
	// 메인페이지에 넣을 할인 항목 불러와서 model에 넣기(오버로딩)
	public void getDiscount(Model model) {
		PageDTO pdto = new PageDTO(1, 4);
		// 할인항목 메인 테이블 전체 항목 가져오기
		ArrayList<CartMainDTO> main = ddao.getTotalMain(pdto);
		
		// 각 항목의 메인항목에 서브배열을 집어넣음
		for(int i = 0; i < main.size(); i++) {
			int no = main.get(i).getCart_no();
			ArrayList<CartSubDTO> sub = ddao.getSub(no);
			main.get(i).setCsdto(sub);
		}

		// model에 main을 집어넣음
		model.addAttribute("discountList", main);
	}
	
	
	
	
	// 오늘의 특가에서 상품 구매하기 또는 장바구니담기 버튼을 클릭했을때 그 상품을 주문
	public void buyDiscount(CartMainDTO cmdto, HttpSession session) {
		// 장바구니에 추가할 cart_no 찾아오기
		int cno = ddao.getCartNo();
		cmdto.setCno(cno);
		// 세션에서 id값 가져오기
		MemberDTO mdto = (MemberDTO)session.getAttribute("Member");
		String member_id = mdto.getId();
		// 매개변수 CartMainDTO에 id값 집어넣기
		cmdto.setMember_id(member_id);
		
		// cart_main_table에 주문한 항목 추가
		ddao.buyDiscountMain(cmdto);
		
		// cart_sub_table에 집어넣을 주문한 항목 찾아오기
		ArrayList<CartSubDTO> csdto = ddao.getSub(cmdto.getCart_no());
		
		// cart_sub_table에 주문한 항목 집어넣기
		for(int i = 0; i<csdto.size(); i++) {
			CartSubDTO cdto = csdto.get(i);
			cdto.setCart_no(cno);
			ddao.buyDiscountSub(cdto);
		}
		
	}
	
	

}

package org.phg.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.phg.dao.CartDAO;
import org.phg.model.CartMainDTO;
import org.phg.model.CartSubDTO;
import org.phg.model.MemberDTO;
import org.phg.model.OrderProductDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class CartServiceImpl implements CartService{
	@Autowired
	CartDAO cdao;
	
	// 페이지 열기 전 세션아이디에 맞는 장바구니 정보 가져오기
	public void getOrder(Model model, HttpSession session) {
		if(session.getAttribute("Member") != null) {
			// 세션에 저장된 member값
			MemberDTO mdto = (MemberDTO)session.getAttribute("Member");
			
			// select로 불러온 CartMain DB의 데이터
			ArrayList<CartMainDTO> acdto = cdao.getOrderMain(mdto.getId());
			
			if(acdto.size() != 0) { // 세션 id값에 맞는 장바구니 데이터가 존재할 경우				
				// 최종적으로 model에 집어넣을 ArrayList
				ArrayList<CartMainDTO> orderData = new ArrayList<CartMainDTO>();
				for(int i = 0; i<acdto.size(); i++) {
					CartMainDTO cmdto = acdto.get(i);
	
					if(cdao.getOrderSub(cmdto.getCart_no())!=null) {
						// CartSub DB에서 데이터 가져오기
						ArrayList<CartSubDTO> csdto = cdao.getOrderSub(cmdto.getCart_no());
						// 각 cart_no에 맞는 CartMainDTO에 ArrayList<CartSubDTO>집어넣기
						cmdto.setCsdto(csdto);
					}
					// 데이터를 집어넣은 CartMainDTO를 ArrayList에 집어넣기
					orderData.add(cmdto);
				}
				
				// 장바구니 데이터를 가지고있는 ArrayList를 model에 집어넣기
				model.addAttribute("order", orderData);
			}else {
				model.addAttribute("order", null);
			}
		}
	}
	
	// 주문하기 항목 누르면 그 장바구니 주문
	public void orderProduct(OrderProductDTO odto, HttpSession session, int cart_no) {
		//장바구니 항목 주문내역 테이블로 데이터 추가과정
		//세션에서 id값 가져오기
		MemberDTO mdto = (MemberDTO)session.getAttribute("Member");
		// odto에 id값 설정
		odto.setMember_id(mdto.getId());
		cdao.orderProduct(odto);
		
		//장바구니 테이블에서 주문한 항목 삭제
		cdao.deleteCartMain(cart_no);
		cdao.deleteCartSub(cart_no);
	}
	
	// 총 n건 주문하기 버튼 누르면 전체 장바구니 주문
	public void totalOrder(ArrayList<OrderProductDTO> aodto, HttpSession session) {
		MemberDTO mdto = (MemberDTO)session.getAttribute("Member");
		String member_id = mdto.getId();
		
		OrderProductDTO firstProduct = aodto.get(0);
		firstProduct.setMember_id(member_id);
		// 첫번째 항목 insert하면서 selectkey로 order_no 받아오기
		cdao.orderProduct(firstProduct);
		// 두번째 항목부터 selectkey로 가져온 order_no이용해서 insert
		for(int i = 1; i < aodto.size(); i++) {
			OrderProductDTO odto = aodto.get(i);
			odto.setMember_id(member_id);
			odto.setOrder_no(firstProduct.getOrder_no());
			cdao.orderProduct2(odto);
		}
		// 주문한 사람의 장바구니의 전체 항목을 삭제하기 위해서 id값에 맞는 cart_no를 찾기
		ArrayList<Integer> cart_id = cdao.getCartNo(member_id);
		// 찾은 cart_no와 일치하는 장바구니 데이터 삭제
		for(int i = 0; i < cart_id.size(); i++) {
			cdao.deleteCartMain(cart_id.get(i));
			cdao.deleteCartSub(cart_id.get(i));
		}
		
	}
	
	// 장바구니 삭제
	public void deleteCart(int cart_no) {
		cdao.deleteCartMain(cart_no);
		cdao.deleteCartSub(cart_no);
	}
	
	
	
	
	
	
	
}

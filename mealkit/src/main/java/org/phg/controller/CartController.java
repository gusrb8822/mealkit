package org.phg.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.phg.model.OrderProductDTO;
import org.phg.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Controller
public class CartController {
	@Autowired
	CartService cservice;
	
	// cart페이지 열 때 세션의 id값으로 장바구니 데이터 불러오기
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cartPage(Model model, HttpSession session) {
		cservice.getOrder(model, session);		
		return "order/cart";
	}
	
	// 각각의 장바구니에 있는 상품 주문버튼을 누르면 order_product_table에 주문내용 저장
	@RequestMapping(value = "/cart/order", method = RequestMethod.POST)
	public String orderProduct(OrderProductDTO odto, HttpSession session, int cart_no, Model model) {
		cservice.orderProduct(odto, session, cart_no);
		return "redirect:/cart";
	}
	
	
	// cart페이지에서 장바구니 삭제 버튼을 누르면 cart_no인 cno를 받아서 db에서 삭제 
	@RequestMapping(value = "/cart/delete", method = RequestMethod.GET)
	public String deleteCart(int cno) {
		cservice.deleteCart(cno);
		return "redirect:/cart";
	}
	
	// 전체 주문버튼을 누르면 각 데이터를 배열로 받아서 주문내역 테이블로 보냄
	@RequestMapping(value = "/cart/ajax", produces=MediaType.TEXT_PLAIN_VALUE, method = RequestMethod.POST)
	public ResponseEntity<String> cartAjax(MultipartHttpServletRequest request, HttpSession session) {
		String[] base_name = request.getParameterValues("base_name");
		String[] add_element = request.getParameterValues("add_element");
		String[] total_price = request.getParameterValues("total_price");
		
		// 확인용 구문
//		for(int i = 0; i < base_name.length; i++) {
//			System.out.println(base_name[i]);
//			System.out.println(add_element[i]);
//			System.out.println(total_price[i]);
//		}
		
		// 매개변수로 서비스에 보낼 ArrayList
		ArrayList<OrderProductDTO> orderData = new ArrayList<OrderProductDTO>();
		for(int i = 0; i < base_name.length; i++) {
			OrderProductDTO odto = new OrderProductDTO();
			odto.setBase_name(base_name[i]);
			odto.setAdd_element(add_element[i]);
			odto.setTotal_price(Integer.parseInt(total_price[i]));
			orderData.add(odto);
		}
		// 전체 주문 데이터 입력
		cservice.totalOrder(orderData, session);
		
		return new ResponseEntity<String>("ok", HttpStatus.OK);
	}
}

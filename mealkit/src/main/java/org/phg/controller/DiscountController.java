package org.phg.controller;

import javax.servlet.http.HttpSession;

import org.phg.model.CartMainDTO;
import org.phg.model.PageDTO;
import org.phg.service.DiscountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DiscountController {
	@Autowired
	DiscountService dservice;
	
	//오늘의 특가 화면 출력
	@RequestMapping(value = "/discount", method = RequestMethod.GET)
	public String getDiscount(PageDTO pdto, Model model) {
		dservice.getDiscount(pdto, model);
		return "/discount/discount";
	}
	
	// 오늘의 특가에서 상품 구매하기 또는 장바구니담기 버튼을 클릭했을때 그 상품을 주문
	@RequestMapping(value = "/discount", method = RequestMethod.POST)
	public String buyDiscount(CartMainDTO cmdto, String buy_type, HttpSession session) {
		dservice.buyDiscount(cmdto, session);
		if(buy_type.equals("buy")) {
			return "redirect:/cart";
		}else if(buy_type.equals("cart")) {
			return "redirect:/discount";
		}else {
			return null;
		}
	}

}

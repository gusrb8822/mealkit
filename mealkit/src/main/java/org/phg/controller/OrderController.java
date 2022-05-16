package org.phg.controller;

import java.util.ArrayList;

import org.phg.model.CartMainDTO;
import org.phg.model.CartSubDTO;
import org.phg.service.OrderService;
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
public class OrderController {
	@Autowired
	OrderService oservice;
	
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String order(Model model) {
		// 화면 띄울때 추가재료 항목에 들어갈 항목들을 select해와야 함
		oservice.orderGet(model);
		return "order/order";
	}
	
	
	@RequestMapping(value = "/order/ajax", produces=MediaType.TEXT_PLAIN_VALUE, method = RequestMethod.POST)
	public ResponseEntity<String> orderAjax(MultipartHttpServletRequest request) {
		if(request.getParameterValues("element_no")!=null) {
			String[] member_id = request.getParameterValues("member_id");
			String[] base_no = request.getParameterValues("base_no");
			String[] base_name = request.getParameterValues("base_name");
			String[] base_price = request.getParameterValues("base_price");
			String[] element_no = request.getParameterValues("element_no");
			String[] element_name = request.getParameterValues("element_name");
			String[] element_price = request.getParameterValues("element_price");
			String[] element_quantity = request.getParameterValues("element_quantity");
			
			// 확인용 구문
//			System.out.println(member_id[0]);
//			System.out.println(base_no[0]);
//			System.out.println(base_name[0]);
//			System.out.println(base_price[0]);
//			for(int i = 0; i < element_no.length; i++) {
//				System.out.println(element_no[i]);
//				System.out.println(element_name[i]);
//				System.out.println(element_price[i]);
//				System.out.println(element_quantity[i]);
//			}
			
			// service에 매개변수로 넘길 CartMainDTO
			CartMainDTO cmdto = new CartMainDTO();
			// cmdto의 값이 될 ArrayList
			ArrayList<CartSubDTO> csdto = new ArrayList<CartSubDTO>();
			
			// member_id랑 base_no, base_name, base_price 넣기
			cmdto.setMember_id(member_id[0]);
			cmdto.setBase_no(Integer.parseInt(base_no[0]));
			cmdto.setBase_name(base_name[0]);
			cmdto.setBase_price(Integer.parseInt(base_price[0]));
			
			if(request.getParameterValues("element_no")!=null) {
				//ArrayList에 CartSubDTO 배열 넣기
				for(int i = 0; i<element_no.length; i++) {
					csdto.add(new CartSubDTO(Integer.parseInt(element_no[i]), element_name[i], Integer.parseInt(element_price[i]),Integer.parseInt(element_quantity[i])));
				}
				// CartMainDTO의 cmdto의 csdto항목에 넣기 
				cmdto.setCsdto(csdto);
			}
			
			oservice.SaveOrder(cmdto);
			
		}else {
			String[] member_id = request.getParameterValues("member_id");
			String[] base_no = request.getParameterValues("base_no");
			String[] base_name = request.getParameterValues("base_name");
			String[] base_price = request.getParameterValues("base_price");
			
			// 확인용 구문
//			System.out.println(member_id[0]);
//			System.out.println(base_no[0]);
//			System.out.println(base_name[0]);
//			System.out.println(base_price[0]);
			
			// service에 매개변수로 넘길 CartMainDTO
			CartMainDTO cmdto = new CartMainDTO();
			
			// member_id랑 base_no, base_name, base_price 넣기
			cmdto.setMember_id(member_id[0]);
			cmdto.setBase_no(Integer.parseInt(base_no[0]));
			cmdto.setBase_name(base_name[0]);
			cmdto.setBase_price(Integer.parseInt(base_price[0]));
			
			oservice.SaveOrder(cmdto);
		}
		
		return new ResponseEntity<String>("ok", HttpStatus.OK); // redirect 장바구니 주소로 바꿔야 함
	}
	
}

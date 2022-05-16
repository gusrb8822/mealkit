package org.phg.controller;

import java.util.ArrayList;

import org.phg.model.BaseMenuDTO;
import org.phg.service.MemberService;
import org.phg.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AjaxController {
	@Autowired
	MemberService mservice;
	@Autowired
	OrderService oservice;
	// 아이디 중복검사
	@RequestMapping(value="/member{id}", method=RequestMethod.GET, produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> CheckId(@PathVariable("id")String id) {
		int result = mservice.CheckId(id);
		if(result == 1) {
			return new ResponseEntity<>("overlap", HttpStatus.OK);
		}else {
			return new ResponseEntity<>("notOverlap", HttpStatus.OK);
		}
	}
	
	// order페이지 베이스메뉴 선택시 데이터 불러오기
	@RequestMapping(value="/order/group{base_group}", consumes="application/json", method=RequestMethod.GET, produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ArrayList<BaseMenuDTO>> GetBaseMenu(@PathVariable("base_group")String base_group){
		//System.out.println(base_group);
		
		return new ResponseEntity<ArrayList<BaseMenuDTO>>(oservice.GetBaseMenu(base_group), HttpStatus.OK);
		
	}
}

package org.phg.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import org.phg.dao.CartDAO;
import org.phg.dao.MemberDAO;
import org.phg.model.MemberDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberDAO mdao;
	@Autowired
	CartDAO cdao;
	
	// 회원가입
	public void Join(MemberDTO mdto) {
		mdao.Join(mdto);
	}
	
	// 회원가입 페이지 아이디 중복검사
	public int CheckId(String id) {
		if(mdao.CheckId(id) != null) {
			// 이미 가입된 id값이 있으면(중복이면)
			return 1;
		}else {
			// 이미 가입된 id값이 없으면(중복이아니면)
			return 0;
		}
		 
	}	
	
	// 로그인
	public MemberDTO Login(MemberDTO mdto) {
		return mdao.Login(mdto);
	}
	
	// 회원정보 변경
	public void ChangeMember(MemberDTO mdto, HttpSession session) {
		MemberDTO member = (MemberDTO)session.getAttribute("Member");
		mdto.setId(member.getId());
		// 회원정보 update하는 dao실행
		mdao.MemberChange(mdto);
		// 세션에 저장된 회원정보 삭제
		session.invalidate();
	}
	
	// 회원정보 삭제(그 id값에 맞는 장바구니도 다 삭제해야 함)
	public void DeleteMember(HttpSession session) {
		// session 정보를 가져옴
		MemberDTO member = (MemberDTO)session.getAttribute("Member");
		// id값에 맞는 회원 정보를 삭제함
		mdao.MemberDelete(member.getId());
		//id값에 맞는 cart_no를 찾기
		ArrayList<Integer> cart_id = cdao.getCartNo(member.getId());
		// 찾은 cart_no와 일치하는 장바구니 데이터 삭제
		for(int i = 0; i < cart_id.size(); i++) {
			cdao.deleteCartMain(cart_id.get(i));
			cdao.deleteCartSub(cart_id.get(i));
		}
		// 세션에서 회원정보 삭제
		session.invalidate();
	}
	
}

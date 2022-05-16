package org.phg.service;

import javax.servlet.http.HttpSession;

import org.phg.model.MemberDTO;



public interface MemberService {
	// 회원가입
	public void Join(MemberDTO mdto);
	
	// 회원가입 페이지 아이디 중복검사
	public int CheckId(String id);
	
	// 로그인
	public MemberDTO Login(MemberDTO mdto);
	
	// 회원정보 변경
	public void ChangeMember(MemberDTO mdto, HttpSession session);
	
	// 회원정보 삭제
	public void DeleteMember(HttpSession session);
}

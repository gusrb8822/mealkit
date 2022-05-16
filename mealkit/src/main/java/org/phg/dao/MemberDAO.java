package org.phg.dao;

import org.phg.model.MemberDTO;

public interface MemberDAO {
	
	// 회원가입
	public void Join(MemberDTO mdto);
	
	// 회원가입 페이지 아이디 중복검사
	public MemberDTO CheckId(String id);
	
	// 로그인
	public MemberDTO Login(MemberDTO mdto);
	
	// 회원정보변경(비밀번호, 이메일, 광고수신여부)
	public void MemberChange(MemberDTO mdto);
	
	// 회원탈퇴
	public void MemberDelete(String id);
}

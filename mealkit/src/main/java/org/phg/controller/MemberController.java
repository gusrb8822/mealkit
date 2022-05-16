package org.phg.controller;


import javax.servlet.http.HttpSession;
import org.phg.model.MemberDTO;
import org.phg.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	@Autowired
	MemberService mservice;
	
	// 회원가입 페이지
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "member/join";
	}
	
	// 회원가입 과정
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPost(MemberDTO mdto) {
		mservice.Join(mdto);
		return "redirect:/";
	}
	
	// 로그인 페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "member/login";
	}
	
	// 로그인 과정
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPost(MemberDTO mdto, HttpSession session) {
		if(mservice.Login(mdto) != null) {
			session.setAttribute("Member", mservice.Login(mdto));
			return "redirect:/";
		}else {
			return "redirect:/login";
		}
		
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	// 마이페이지 첫 화면
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPage() {
		return "/member/myPage"; 
	}
	
	
	// 비밀번호 체크 화면(회원정보 변경)
	@RequestMapping(value = "/myPage/change", method = RequestMethod.GET)
	public String CheckChangeMember() {  
		return "/member/checkPwChange";
	}
	// 비밀번호 체크 과정(회원정보 변경)
	@RequestMapping(value = "/myPage/change", method = RequestMethod.POST)
	public String CheckChangeMember(HttpSession session, String pw) {
		// session의 pw값이랑 입력받은 pw값이랑 같으면 회원정보 변경 화면 띄우고 아니면 마이페이지로 이동
		MemberDTO member = (MemberDTO)session.getAttribute("Member");
		if(member.getPw().equals(pw)){
			return "/member/changeMember";
		}else {
			return "redirect:/myPage";
		}
	}
	// 회원정보 변경 과정
	@RequestMapping(value = "/myPage/changeMember", method = RequestMethod.POST)
	public String ChangeMember(MemberDTO mdto, HttpSession session) {
		// mdto값 가지고 update하고, session값 초기화 하는 service 넣기
		mservice.ChangeMember(mdto, session);
		return "redirect:/";
	}
	
	
	// 비밀번호 체크 화면(회원탈퇴)
	@RequestMapping(value = "/myPage/delete", method = RequestMethod.GET)
	public String CheckdeleteMember() {  
		return "/member/checkPwDelete";
	}
	// 비밀번호 체크 과정(회원탈퇴)
	@RequestMapping(value = "/myPage/delete", method = RequestMethod.POST)
	public String CheckDeleteMember(HttpSession session, String pw) {
		// session의 pw값이랑 입력받은 pw값이랑 같으면 회원탈퇴하기
		MemberDTO member = (MemberDTO)session.getAttribute("Member");
		if(member.getPw().equals(pw)){
			mservice.DeleteMember(session);
			return "redirect:/";
		}else {
			return "redirect:/myPage";
		}
	}
	
	
}

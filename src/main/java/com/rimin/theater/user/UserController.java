package com.rimin.theater.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	// user 회원가입 페이지
	@GetMapping("/user/join")
	public String join() {
		return "user/userJoin";
	}
	
	
	// user 로그인 페이지
	@GetMapping("/user/login")
	public String login() {
		return "user/userLogin";
	}
	
	// 로그아웃 
	@GetMapping("/user/logout")
	public String logout(HttpServletRequest request) {
		// 로그인 할 때 저장된 사용자 정보 제거
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		
		return "redirect:/main/home";
	}
	
}

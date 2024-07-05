package com.rimin.theater.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

	// user 회원가입 페이지
	@GetMapping("/user/join")
	public String join() {
		return "user/join";
	}
	
	
	// user 로그인 페이지
	@GetMapping("/user/login")
	public String login() {
		return "user/login";
	}
	
}

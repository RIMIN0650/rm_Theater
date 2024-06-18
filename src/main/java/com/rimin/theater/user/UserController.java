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
	
	
}

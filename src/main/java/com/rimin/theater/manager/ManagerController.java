package com.rimin.theater.manager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ManagerController {
	
	@GetMapping("/admin/join")
	public String managerJoin() {
		return "manager/managerJoin";
	}
	
	@GetMapping("/admin/login")
	public String managerLogin() {
		return "manager/managerLogin";
	}
	
	@GetMapping("/admin/logout")
	public String logout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("managerId");
		session.removeAttribute("managerName");
		
		return "redirect:/main/home";
	}
	
	@GetMapping("/admin/findAccount")
	public String findAccount() {
		return "manager/findAccount";
	}
	
	@GetMapping("/admin/resetPassword")
	public String resetPassword() {
		return "manager/resetPassword";
	}
	
}

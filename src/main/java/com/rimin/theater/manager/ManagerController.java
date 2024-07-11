package com.rimin.theater.manager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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
	
	
}

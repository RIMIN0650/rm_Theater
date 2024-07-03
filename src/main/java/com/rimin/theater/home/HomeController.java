package com.rimin.theater.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping("/main/home")
	public String homepage() {
		return "main/mainPage";
	}
	
}

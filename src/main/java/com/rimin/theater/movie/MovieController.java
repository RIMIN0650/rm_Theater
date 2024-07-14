package com.rimin.theater.movie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MovieController {
	
	@GetMapping("/movie/addMovie")
	public String addMovie() {
		return "main/addMovie";
	}
}

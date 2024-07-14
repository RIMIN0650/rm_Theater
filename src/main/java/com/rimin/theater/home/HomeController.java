package com.rimin.theater.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.rimin.theater.movie.dto.MovieDetail;
import com.rimin.theater.movie.service.MovieService;

@Controller
public class HomeController {
	
	@Autowired
	private MovieService movieService;
	
	@GetMapping("/main/home")
	public String homepage(Model model) {
		
		List<MovieDetail> movieList = movieService.getMovieDetail();
		
		model.addAttribute("movieList", movieList);
		
		return "main/mainPage";
	}
	
}

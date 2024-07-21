package com.rimin.theater.movie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rimin.theater.movie.domain.Movie;
import com.rimin.theater.movie.dto.MovieDetail;
import com.rimin.theater.movie.service.MovieService;

@Controller
public class MovieController {
	
	@Autowired
	private MovieService movieService;
	
	@GetMapping("/movie/addMovie")
	public String addMovie() {
		return "main/addMovie";
	}
	
	// 영화 리스트 보여주기
	@GetMapping("/movie/list")
	public String movieList(Model model) {
		
		List<MovieDetail> movieList = movieService.getMovieList();
		
		model.addAttribute("movieList", movieList);
		
		return "main/movieList";
	}
	
	// 영화 상세정보 페이지
	@GetMapping("/movie/detail")
	public String movieDetail(@RequestParam("id") int id
								, Model model) {
		
		Movie movie = movieService.getMovieInfo(id);
		
		model.addAttribute("movieInfo",movie);
		
		return "movie/movieDetail";
	}
	
	// 영화 수정을 위한 상세정보 페이지
	@GetMapping("/movie/update-view")
	public String updateMovieInfo(@RequestParam("id") int id
								, Model model) {
		Movie movie = movieService.getMovieInfo(id);
		
		model.addAttribute("movieInfo",movie);
		
		return "movie/updateInfo";
	}
	
	// 관 별 영화 등록 페이지
	@GetMapping("/movie/assignRoom")
	public String assignMovieRoom(Model model) {
		
		// 모든 영화 조회하기
		List<MovieDetail> movieList = movieService.getMovieList();
		
		model.addAttribute("movieList", movieList);
		
		return "movie/assignMovieRoom";
	}
	
	// 영화 예매 페이지
	@GetMapping("/movie/reservation")
	public String movieReservation() {
		return "movie/movieReservation";
	}
	
}

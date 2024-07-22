package com.rimin.theater.cinelink;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.rimin.theater.movie.dto.MovieDetail;
import com.rimin.theater.movie.service.MovieService;
import com.rimin.theater.room.domain.Room;
import com.rimin.theater.room.service.RoomService;

@Controller
public class CineLinkController {
	@Autowired
	private MovieService movieService;
	
	@Autowired 
	private RoomService roomService;
	
	// 관 별 영화 등록 페이지
	@GetMapping("/movie/linkRoom")
	public String linkMovieRoom(Model model) {
		
		// 모든 영화 조회하기
		List<MovieDetail> movieList = movieService.getMovieList();
		
		// 모든 관 조회하기
		List<Room> roomList = roomService.getMovieList();
		
		model.addAttribute("movieList", movieList);
		
		model.addAttribute("roomList", roomList);
		
		return "movie/linkMovieRoom";
	}
	
	
	
	
}

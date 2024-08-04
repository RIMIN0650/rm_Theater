package com.rimin.theater.runTime;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rimin.theater.cinelink.domain.CineLink;
import com.rimin.theater.cinelink.service.CineLinkService;
import com.rimin.theater.movie.domain.Movie;
import com.rimin.theater.movie.service.MovieService;
import com.rimin.theater.room.domain.Room;
import com.rimin.theater.room.service.RoomService;
import com.rimin.theater.runTime.domain.RunTime;
import com.rimin.theater.runTime.dto.RunTimeDetail;
import com.rimin.theater.runTime.service.RunTimeService;

@Controller
public class RunTimeController {
	
	@Autowired
	private RunTimeService runTimeService;
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private CineLinkService cineLinkService;
	
	@Autowired
	private RoomService roomService;
	
	// 모든 상영시간 보여주기
	@GetMapping("/runTime/showList")
	public String showRunTimeList(Model model) {
		
		List<RunTimeDetail> runTimeDetailList = runTimeService.findEveryRunTime();
		
		List<CineLink> cineLinkList = cineLinkService.findEveryCineLink();
		
		model.addAttribute("cineLinkList", cineLinkList);
		model.addAttribute("runTimeDetailList", runTimeDetailList);
		
		return "manager/everyRunTimeList";
	}
	
	
	// 관 별 상영시간 등록
	@GetMapping("/runTime/assign")
	public String assignMovieShowTime(@RequestParam("roomName") String roomName
										, @RequestParam("movieName") String movieName
										, Model model) {
		
		model.addAttribute("roomName", roomName);
		model.addAttribute("movieName", movieName);
		
		return "manager/assignShowTime";
	}
	
	
	// 관 별 상영시간 보여주기
	@GetMapping("/runTime/perRoom")
	public String runTimeperRoom(@RequestParam("roomName") String roomName
								, Model model) {
		
		// 리스트에 모든 상영 시간 추가
		List<RunTime> runTimeList = runTimeService.findShowTimeList(roomName);
		
		String movieName = cineLinkService.findLinkedMovie(roomName);
		
		// 모델에 영화 관련 상세정보도 넣어줘야함
		Movie movie = movieService.findMovie(movieName);
		
		model.addAttribute("runTimeList", runTimeList);
		
		model.addAttribute("roomName", roomName);
		
		model.addAttribute("movie", movie);
		
		return "manager/runTimeList";
	}
	
	
}

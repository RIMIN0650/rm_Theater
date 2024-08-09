package com.rimin.theater.movie;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rimin.theater.cinelink.domain.CineLink;
import com.rimin.theater.cinelink.service.CineLinkService;
import com.rimin.theater.movie.domain.Movie;
import com.rimin.theater.movie.dto.MovieDetail;
import com.rimin.theater.movie.service.MovieService;
import com.rimin.theater.runTime.domain.RunTime;
import com.rimin.theater.runTime.service.RunTimeService;

@Controller
public class MovieController {
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private CineLinkService cineLinkService;
	
	@Autowired
	private RunTimeService runTimeService;
	
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
		
		// 성별은 어떻게 처리해야할지 고민중
		
		// 연령대 분포 계산
		int countAdult = 0, countJunior = 0, countSenior = 0, countDisabled = 0;
		
		// 영화제목 받아서
		String movieTitle = movie.getTitle();
		
		// 영화와 연결된 관 리스트 받아오기
		List<CineLink> RoomList = cineLinkService.findConnectedRoom(movieTitle);
		
		List<Integer> RunTimeIdList = new ArrayList<>();
		
		// 관 리스트 돌면서
		for(CineLink cineLink : RoomList) {
			// 관 이름 저장
			String roomName = cineLink.getRoomName();
			
			// 관에 있는 상영 시간 리스트 불러오기
			List<RunTime> runTimeList = runTimeService.findAllByRoomName(roomName);
			
			// 해당 영화 상영 시간 ID 리스트에 넣기
			for(RunTime runTime : runTimeList) {
				RunTimeIdList.add(runTime.getId());
			}
			
			
			
		}
		
		
		
		// runTime id 중 movie.title == runtimeId > roomName > movieName 일치하는 것 조회
		// 전부 더해서 countAdult, countJunior, countSenior, countDisabled 더한 것 분모
		// 분자로는 특정
		
		
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
	
	
	// 영화 예매 페이지
	@GetMapping("/movie/reservation")
	public String movieReservation() {
		return "movie/movieReservation";
	}
	
}

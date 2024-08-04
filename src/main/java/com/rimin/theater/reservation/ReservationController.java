package com.rimin.theater.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rimin.theater.cinelink.service.CineLinkService;
import com.rimin.theater.room.domain.Room;
import com.rimin.theater.room.service.RoomService;
import com.rimin.theater.runTime.domain.RunTime;
import com.rimin.theater.runTime.service.RunTimeService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ReservationController {
	
	@Autowired
	private RunTimeService runTimeService;
	
	@Autowired
	private CineLinkService cineLinkService;
	
	@Autowired
	private RoomService roomService;
	
	// 예약 상세정보 창 보여주기
		// 영화, 시간 확인용
		@GetMapping("/reservation/detail")
		private String runTimeDetail(@RequestParam("runTimeId") int runTimeId
									, HttpSession session
									, Model model) {
			
			int userId = (Integer)session.getAttribute("userId");
			
			RunTime runTime = runTimeService.findRunTimeById(runTimeId);
			
			String roomName = runTime.getRoomName();
			
			String movieName = cineLinkService.findLinkedMovie(roomName);
			
			Room room = roomService.findRoomByRoomName(roomName);
			
			model.addAttribute("runTimeId", runTimeId);
			model.addAttribute("userId", userId);
			model.addAttribute("room", room);
			model.addAttribute("roomName", roomName);
			model.addAttribute("movieName", movieName);
			model.addAttribute("runTimeDetail", runTime);
			
			return "movie/runTimeDetail";
		}
	
}

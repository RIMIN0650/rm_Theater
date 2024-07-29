package com.rimin.theater.room;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rimin.theater.cinelink.domain.CineLink;
import com.rimin.theater.room.domain.Room;
import com.rimin.theater.room.service.RoomService;

@Controller
public class RoomController {
	
	@Autowired
	private RoomService roomService;
	
	
	@GetMapping("/admin/addRoom")
	public String addRoom() {
		return "manager/addRoom";
	}
	
	
	// 현재 등록된 관 보여주기
	@GetMapping("/room/roomList")
	public String roomList(Model model) {
			
		List<Room> roomList = roomService.getMovieList();
		
		model.addAttribute("roomList", roomList);
		
		return "main/roomList";
	}
	
	// 연결된 관-영화 보여주기
	@GetMapping("/room/linkMovie")
	public String linkCineList(Model model) {
		
		List<CineLink> cineLinkList = roomService.getcineLinkList();
		
		model.addAttribute("cineLinkList", cineLinkList);
	
		return "movie/linkCineList";
	}
	
	// 관 정보 수정하기
	@GetMapping("/room/updateInfo")
	public String updateRoomInfo(@RequestParam("id") int id
								, Model model) {
		
		Room room = roomService.findRoom(id);
		
		model.addAttribute("room", room);
		
		return "manager/updateRoom";
	}
	

}

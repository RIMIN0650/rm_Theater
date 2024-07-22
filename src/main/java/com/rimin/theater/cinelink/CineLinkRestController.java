package com.rimin.theater.cinelink;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.rimin.theater.cinelink.domain.CineLink;
import com.rimin.theater.cinelink.service.CineLinkService;

@RestController
public class CineLinkRestController {
	
	@Autowired
	private CineLinkService cineLinkService;
	
	
	@PostMapping("/movie/linkRoom")
	public Map<String, String> linkRoom(@RequestParam("roomName") String roomName
											, @RequestParam("movieName") String MovieName){
		
		CineLink cineLink = cineLinkService.linkRoomwithMovie(roomName, MovieName);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(cineLink != null) {
			resultMap.put("result",  "success");
		} else {
			resultMap.put("result",  "fail");
		}
		
		return resultMap;
		
	}
	
	// 이미 등록된 관인지 확인
	@GetMapping("/link/duplicateRoom")
	public Map<String, Boolean> isDuplicateRoom(@RequestParam("roomName") String roomName){
		
		boolean isDuplicateRoom = cineLinkService.isDuplicateRoom(roomName);
		
		Map<String, Boolean> resultMap = new HashMap<>();
		
		resultMap.put("isDuplicateRoom",  isDuplicateRoom);
		
		return resultMap;
		
	}
	
	// 이미 등록된 영화인지 확인
	@GetMapping("/link/duplicateMovie")
	public Map<String, Boolean> isDuplicateMovie(@RequestParam("movieName") String movieName){
		boolean isDuplicateMovie = cineLinkService.isDuplicateRoom(movieName);
		
		Map<String, Boolean> resultMap = new HashMap<>();
		
		resultMap.put("isDuplciateMovie", isDuplicateMovie);
		
		return resultMap;
	}
	
	
	
}

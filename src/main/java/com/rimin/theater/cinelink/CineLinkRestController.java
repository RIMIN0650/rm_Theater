package com.rimin.theater.cinelink;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
}

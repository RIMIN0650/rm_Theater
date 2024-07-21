package com.rimin.theater.room;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.rimin.theater.room.domain.Room;
import com.rimin.theater.room.service.RoomService;

@RestController
public class RoomRestController {
	
	@Autowired
	private RoomService roomService;
	
	// 새로운 관 등록
	@PostMapping("/admin/addRoom")
	public Map<String, String> addRoom(@RequestParam("roomName") String roomName){
		
		Room room = roomService.addRoom(roomName);
		
		Map <String, String> resultMap = new HashMap<>();
		
		if(room != null) {
			resultMap.put("result",  "success");
		} else {
			resultMap.put("result",  "fail");
		}
		
		return resultMap;
	}
}

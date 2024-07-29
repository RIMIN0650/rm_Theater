package com.rimin.theater.room;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
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
	public Map<String, String> addRoom(@RequestParam("roomName") String roomName
										, @RequestParam("totalSeat") int totalSeat
										, @RequestParam("seatPrice") int seatPrice){
		
		Room room = roomService.addRoom(roomName, totalSeat, seatPrice);
		
		Map <String, String> resultMap = new HashMap<>();
		
		if(room != null) {
			resultMap.put("result",  "success");
		} else {
			resultMap.put("result",  "fail");
		}
		
		return resultMap;
	}
	
	// 관 정보 수정
	@PostMapping("/room/update")
	public Map<String, String> updateRoomInfo(@RequestParam("id") int id
												, @RequestParam("roomName") String roomName
												, @RequestParam("totalSeat") int totalSeat
												, @RequestParam("seatPrice") int seatPrice){
		
		Room room = roomService.updateRoom(id, roomName, totalSeat, seatPrice);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(room != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
	
	
	// 관 정보 삭제
	@DeleteMapping("/room/delete")
	public Map<String, String> deleteRoom(@RequestParam("id") int id){
		
		Room room = roomService.deleteRoom(id);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(room != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}

	
}

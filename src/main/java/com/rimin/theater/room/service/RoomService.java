package com.rimin.theater.room.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rimin.theater.room.domain.Room;
import com.rimin.theater.room.repository.RoomRepository;

@Service
public class RoomService {
	
	@Autowired
	private RoomRepository roomRepository;
	                                 
	// 새로운 관 등록
		public Room addRoom(String roomName) {
			
			Room room = Room.builder()
							.roomName(roomName)
							.build();
			
			room = roomRepository.save(room);
			
			return room;
		}
		
		
}

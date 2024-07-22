package com.rimin.theater.room.service;

import java.util.ArrayList;
import java.util.List;

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
		
	// 관 리스트 보여주기
	public List<Room> getMovieList(){
		
		List<Room> roomList = roomRepository.findAll();
		
		List<Room> newRoomList = new ArrayList<>();
		
		for(Room room : roomList) {
			
			Room rooms = Room.builder()
							.id(room.getId())
							.roomName(room.getRoomName())
							.build();
			
			newRoomList.add(rooms);
		}
		return newRoomList;
	}
		
}

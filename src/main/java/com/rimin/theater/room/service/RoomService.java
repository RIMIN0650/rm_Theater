package com.rimin.theater.room.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rimin.theater.cinelink.domain.CineLink;
import com.rimin.theater.cinelink.repository.CineLinkRepository;
import com.rimin.theater.room.domain.Room;
import com.rimin.theater.room.repository.RoomRepository;

@Service
public class RoomService {
	
	@Autowired
	private RoomRepository roomRepository;
	
	@Autowired
	private CineLinkRepository cineLinkRepository;
	                                 
	// 새로운 관 등록
	public Room addRoom(String roomName) {
		
		Room room = Room.builder()
						.roomName(roomName)
						.linkCheck("Unlinked")
						.build();
		
		room = roomRepository.save(room);
		
		return room;
	}
		
	// 등록되어 있는 관 리스트 보여주기
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
	
	// 연결되어있는 관-영화 보여주기
	public List<CineLink> getcineLinkList(){
		
		List<CineLink> cineLinkList = cineLinkRepository.findAll();
		
		List<CineLink> newCineLinkList = new ArrayList<>();
		
		
		
		for(CineLink cineLink : cineLinkList) {
		
			CineLink cineLinks = CineLink.builder()
											.movieName(cineLink.getMovieName())
											.roomName(cineLink.getRoomName())
											.build();
			newCineLinkList.add(cineLinks);
			
		}
		return newCineLinkList;
	}
		
}

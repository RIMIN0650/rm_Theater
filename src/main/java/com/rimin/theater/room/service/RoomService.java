package com.rimin.theater.room.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rimin.theater.cinelink.domain.CineLink;
import com.rimin.theater.cinelink.repository.CineLinkRepository;
import com.rimin.theater.room.domain.Room;
import com.rimin.theater.room.repository.RoomRepository;
import com.rimin.theater.runTime.domain.RunTime;
import com.rimin.theater.runTime.repository.RunTimeRepository;

@Service
public class RoomService {
	
	@Autowired
	private RoomRepository roomRepository;
	
	@Autowired
	private CineLinkRepository cineLinkRepository;
	
	@Autowired
	private RunTimeRepository runTimeRepository;
	                                 
	// 새로운 관 등록
	public Room addRoom(String roomName, int totalSeat, int seatPrice) {
		
		Room room = Room.builder()
						.roomName(roomName)
						.totalSeat(totalSeat)
						.seatPrice(seatPrice)						
						.linkCheck("Unlinked")
						.build();
		
		room = roomRepository.save(room);
		
		return room;
	}
	
	// 중복된 관 이름인지 확인
	public boolean isDupRoom(String roomName) {
		
		int count = roomRepository.countByRoomName(roomName);
		
		if(count != 0) {
			return true;
		} else {
			return false;
		}
		
	}
	
		
	// 등록되어 있는 관 리스트 보여주기
	public List<Room> getMovieList(){
		
		List<Room> roomList = roomRepository.findAll();
		
		List<Room> newRoomList = new ArrayList<>();
		
		for(Room room : roomList) {
			
			Room rooms = Room.builder()
							.id(room.getId())
							.totalSeat(room.getTotalSeat())
							.seatPrice(room.getSeatPrice())
							.linkCheck(room.getLinkCheck())
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
	
	
	// 연결 해제되면 다시 Unlinked 로 바꿔주기
	public Room alterLinkCheck(String roomName) {
		
		Room room = roomRepository.findByRoomName(roomName);
		
		if(room != null) {
			room = room.toBuilder()
						.linkCheck("Unlinked")
						.build();
			room = roomRepository.save(room);
		}
		
		return room;
	}
	
	
	// 관 상세정보 돌려주기
	public Room findRoom(int id) {
		
		Optional<Room> optionalRoom = roomRepository.findById(id);
		Room room = optionalRoom.orElse(null);
		
		if(room != null) {
			return room;
		} else {
			return null;
		}
	}
	
	// 관 이름으로 관 찾기
	public Room findRoomByRoomName(String roomName) {
		Room room = roomRepository.findByRoomName(roomName);
		return room;
	}
	
	// 관 정보 수정
	public Room updateRoom(int id, String roomName, int totalSeat, int seatPrice) {
		
		Optional<Room> optionalRoom = roomRepository.findById(id);
		Room room = optionalRoom.orElse(null);
		
		
		
		
		List<RunTime> runTimeList = runTimeRepository.findAllByRoomName(room.getRoomName());
		
		for(RunTime runTime : runTimeList) {
			runTime = runTime.toBuilder()
								.roomName(roomName)
								.build();
			runTime = runTimeRepository.save(runTime);
								
		}
		
		CineLink cineLink = cineLinkRepository.findByRoomName(room.getRoomName());
		
		if(cineLink != null) {
			cineLink = cineLink.toBuilder()
								.roomName(roomName)
								.build();
			cineLinkRepository.save(cineLink);
		}
		
		if(room != null) {
			room = room.toBuilder()
						.roomName(roomName)
						.totalSeat(totalSeat)
						.seatPrice(seatPrice)
						.build();
			roomRepository.save(room);
		}
		
		return room;
	}
	
	// 관 삭제
	public Room deleteRoom(int id) {
		Optional<Room> optionalRoom = roomRepository.findById(id);
		Room room = optionalRoom.orElse(null);
		
		String roomName = room.getRoomName();
		
		CineLink cineLink = cineLinkRepository.findByRoomName(roomName);
		
		List<RunTime> runTimeList = runTimeRepository.findAllByRoomName(roomName);
		
		for(RunTime runTime : runTimeList) {
				runTimeRepository.delete(runTime);
		}
		
		if(room != null) {
			roomRepository.delete(room);
		}
		
		if(cineLink != null) {
			cineLinkRepository.delete(cineLink);
		}
		
		return room;
	}
	
	
}

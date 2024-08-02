package com.rimin.theater.cinelink.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rimin.theater.cinelink.domain.CineLink;
import com.rimin.theater.cinelink.repository.CineLinkRepository;
import com.rimin.theater.room.domain.Room;
import com.rimin.theater.room.repository.RoomRepository;

@Service
public class CineLinkService {
	
	@Autowired
	private CineLinkRepository cineLinkRepository;
	
	@Autowired
	private RoomRepository roomRepository;
	
	
	public CineLink linkRoomwithMovie(String roomName, String movieName) {
		
		Room room = roomRepository.findByRoomName(roomName);
		
		if(room != null) {
			room = room.toBuilder()
						.linkCheck("Linked")
						.build();
			room = roomRepository.save(room);
		}
		
		CineLink cineLink = CineLink.builder()
								.roomName(roomName)
								.movieName(movieName)
								.build();
		
		return cineLinkRepository.save(cineLink);
	}
	
	
	/*
	// 이미 등록되어 있는 관인지 확인
	public boolean isDuplicateRoom(String roomName) {
		
		int count = cineLinkRepository.countByRoomName(roomName);
		
		if(count != 0) {
			return true; // 중복
		} else {
			return false;
		}
		
		
	}	 
	*/
	
	/*
	// 이미 등록되어 있는 영화인지 확인
	public boolean isDuplicateMovie(String movieName) {
		int count = cineLinkRepository.countByMovieName(movieName);
		
		if(count != 0) {
			return true; // 중복
		} else {
			return false;
		}
		
	}
	
	*/
	
	
	// 관에 할당된 영화 지우기
	public CineLink deleteLink(String roomName) {
		
		CineLink cineLink = cineLinkRepository.findByRoomName(roomName);
		
		if(cineLink != null) {
			cineLinkRepository.delete(cineLink);
		}
		
		return cineLink;
		
	}
	
	
	// 관 이름으로 연결된 영화 찾기
	public String findLinkedMovie(String roomName) {
		
		CineLink cineLink = cineLinkRepository.findByRoomName(roomName);
		
		if(cineLink != null) {
			return cineLink.getMovieName();
		} else {
			return null;
		}
	}
	
	// 연결된 모든 관 - 영화 리스트 불러오기
	public List<CineLink> findEveryCineLink(){
		List<CineLink> cineLinkList = cineLinkRepository.findAll();
		
		return cineLinkList;
	}
	
}
